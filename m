Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E1C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 07:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D38910E762;
	Thu, 24 Apr 2025 07:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSEr2kYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ED010E762
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 07:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745481082; x=1777017082;
 h=resent-to:resent-from:resent-date:resent-message-id:from:
 to:cc:subject:date:message-id:content-transfer-encoding:
 mime-version; bh=T1XAPNhY1PwvdxFM+LpkDczhf6jN+hmp1Y1mGEzVQn4=;
 b=MSEr2kYOFEWK3S2qxkIbA8qWafzTsxX0RPSFm1PFaOQ56geT32YlRwyv
 c78ovcGaSJ0cuLhqHtFB4Oy9LTpX+vRr2qsaxIPFywDXYCa4tJ11v02cY
 Rx4ZTHhBPdNBIsZq5YNUTB6C2Rm4v2FBv4N1Ww9rZGmdCPM00qHPOThiM
 hmTD1FbB5DLswsFpsaUrTJor40l8GG2ypFXL8wch7/uRRfoVp6gS4dTpD
 Fv6i7/xLP5WqWLrYzXHZl47iqJ1gdYwaMXsCSSRghLBypOfsZc3Mfa10o
 ukXiTr9jo3QAe/h6wibCK6wWf6fv9WhsUz7U8BPbcYXGo//8kwZX13X0A g==;
X-CSE-ConnectionGUID: G84F3hI0SsyX/pSNcQvGug==
X-CSE-MsgGUID: +/PSsTPRSTmnj/xDwTo2rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47233657"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="47233657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:51:22 -0700
X-CSE-ConnectionGUID: mVvgWDKKTOmfkPVEqP3MOw==
X-CSE-MsgGUID: Uyi/9CjXSsaRruElNQYeiA==
X-ExtLoopCount2: 2 from 10.245.246.243
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137336953"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:51:21 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Thu, 24 Apr 2025 10:51:18 +0300
Resent-Message-ID: <87frhyyp3d.fsf@intel.com>
Received: from SA1PR11MB8576.namprd11.prod.outlook.com (2603:10b6:806:3b5::9)
 by PH7PR11MB6428.namprd11.prod.outlook.com with HTTPS;
 Wed, 23 Apr 2025 09:10:05 +0000
Received: from BY3PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:39b::27)
 by SA1PR11MB8576.namprd11.prod.outlook.com (2603:10b6:806:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 09:10:03 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::f5) by BY3PR05CA0052.outlook.office365.com
 (2603:10b6:a03:39b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 23 Apr 2025 09:10:03 +0000
Authentication-Results: spf=fail (sender IP is 192.55.55.68)
 smtp.mailfrom=intel.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=intel.com;
Received: from edgegateway.intel.com (192.55.55.68) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 09:10:03 +0000
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 edgegateway.intel.com (10.1.192.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 02:09:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 02:09:56 -0700
Received: from fmviesa001.fm.intel.com (10.60.135.141) by
 FMSMSX902.amr.corp.intel.com (10.18.84.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 02:09:56 -0700
X-CSE-ConnectionGUID: Z5Uyr5K6RsKwDpVfnc5gDw==
X-CSE-MsgGUID: oehgn6ggS7mYfTGofZDErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163317695"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr
 2025 02:09:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
Subject: [PATCH 0/3] drm/i915/display: remove intel_de_*() compat wrappers
Date: Wed, 23 Apr 2025 12:09:45 +0300
Message-ID: <cover.1745399318.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-OrganizationHeadersPreserved: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-Organization-ExpirationStartTime: 23 Apr 2025 09:10:03.4124 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 0dcc0e73-cc86-42f7-5777-08dd8246a206
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Exchange-Organization-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-SCL: 1
X-CrossPremisesHeadersPromoted: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-CrossPremisesHeadersFiltered: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SA1PR11MB8576:EE_|PH7PR11MB6428:EE_
X-OriginatorOrg: intel.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 0dcc0e73-cc86-42f7-5777-08dd8246a206
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|82310400026|41050700001;
X-Forefront-Antispam-Report: CIP:192.55.55.68; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edgegateway.intel.com; PTR:edgegateway.intel.com;
 CAT:NONE; SFS:(13230040)(366016)(82310400026)(41050700001); DIR:INT; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:10:03.3030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcc0e73-cc86-42f7-5777-08dd8246a206
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=46c98d88-e344-4ed4-8496-4ed7712e255d; Ip=[192.55.55.68];
 Helo=[edgegateway.intel.com]
X-MS-Exchange-CrossTenant-AuthSource: fmsmsx902.amr.corp.intel.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8576
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.9400278
X-MS-Exchange-Processed-By-BccFoldering: 15.20.8655.031
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910005)(944506478)(944626604)(920097)(425001)(930097)(140003); 
X-Microsoft-Antispam-Message-Info: 8jbCuljh8IZdexC5zte1Eb+sHkradXTYYxEN4Ma90xeysB+XS/wciZRPxzC8TXyLjhYSeISYnknWSNC295m2QeTLQfIL6H7ihygstH21/xmfe4Tw6fvpWI3tnxHe53S1A4fGX+wYpsywNb5ZtU6ccubA/Y1DWD/whmZlJDC9+VC4nIke1xKDPl93Ss286pL8fvh1HFSLNq3QGvg2H6JJNT77XW1rvK688t1bMj+jomJK1YVWMMHmU32qwYYk5xYeUGs1sap5wvfI2mKYNY/FJ7v7Yzv200xiYnvXwTu5uJ9DuZkc0Qp40VJ/iaIdzN7kqyJTuE6fp69FBmdzG5RC50EQixTmKcGzdbjTRciQGlIfBHzxK0kHxSjNXz1laHAkSnfi39zPg/+i2P76c0l4He9BIkCd79Wn2XcZxlk6l2CSL35YO0FfNo6ojPYofk3iV7EA7FT9V5hDs8T8fkfzclP+kWt4pjWszBlnfvavbDBF1Da84P7XmPqZdK7b94wsAm5cHTSwH6MbUiL9xr5Vnwf0PQvDjItGOVS8NMw04o48/cq1WXjPzPOcVDhoufIaMahwaLTbCAzKRdsMYaT9Ap4g99ZwUU7+kGLq+jn/9Wb5V80kzO4UyGDDa7FCsQFGduTAYjZW/3TOJreI9O6TvadE6SCwKY5QFVqXQ/3+lMmMaaoYWPX3E8nFEhB32i1mdkFsAHPnYry/mFIydThwcenNxz8hvcfC7UZi11JMz9txsUnmns3Fcct6Vs3uUuuxlgVMUswIxKvAtxBJDod9V3pEmDILqZUcE/W3E2g/hbOzuIuanYKiQXA7Ikxt9U1zLWpWAXh6a20Px61v3NWlUg==
MIME-Version: 1.0
X-TUID: R9QJWyYVssoF
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
Message-ID: <20250423090945.pvtWwyU_zggYLI42kyf1iWIuIYWc9TTSd-Xbd7TLwHU@z>

A milestone, with this all the intel_de_*() users pass in struct
intel_display, and we can remove the compat wrappers. \o/

Jani Nikula (3):
  drm/i915/dpt: convert intel_dpt_common.c to struct intel_display
  drm/i915/hdmi: convert rest of intel_hdmi.c to struct intel_display
  drm/i915/de: drop drm_i915_private compat wrappers from intel_de_*()

 drivers/gpu/drm/i915/display/intel_de.h         | 14 ++++----------
 drivers/gpu/drm/i915/display/intel_dpt_common.c | 15 +++++++--------
 drivers/gpu/drm/i915/display/intel_hdmi.c       | 14 +++++++-------
 3 files changed, 18 insertions(+), 25 deletions(-)

-- 
2.39.5

