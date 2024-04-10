Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D211DCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78273113097;
	Wed, 10 Apr 2024 01:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSo93kD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388DE113099
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714332; x=1744250332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zLgOXb2U5TmgOXzowzmyq76dxee6XvcCo+3L/pNjRnE=;
 b=TSo93kD01QVunCPi6TnwpOzQ/phbEaJqLl75AHROTomixEmVApPQVFDT
 rTmkfzEXKTI/sR5UpUdw/ShewscUHCkAuB+27Nwaoq6kY763yMyE55YMB
 RUGZ6M4dQ6M8I2IMTmOesNx/FbfS2yLyZ19uBo4CwCXLSk9epmJD8dlzD
 HnTsIOVXjj9qGbCWJ2qn+UX+BH2NywviRe5ceWk1+NYmSraSmcsB+AVZX
 JiYp46QM0/wg1BHlGc2udprK4eeK+fwLUN4uVuINHK2PxGHridp+8w1Ql
 W8H8iPFwpBu3975Dw98eQJU8DdVkJLBaxK27Ypi9V1eKYtlvMKwY6r2Kq w==;
X-CSE-ConnectionGUID: /krA+irWTSW5VDS7Y6nvlA==
X-CSE-MsgGUID: tqIVHpwOQrCnByVl/uTJ6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19485129"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19485129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:58:52 -0700
X-CSE-ConnectionGUID: mU+fKKTATsefFJmEb4sysA==
X-CSE-MsgGUID: gFISwTFiTCuuKD0ufjqr6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25163703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:58:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:58:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVuNE7P1duUYfmohZGkQYny0Hpyq8ey9QSsU/BMw/w1pW+w++RyCcTubOVeGA4ucDCJR/PRbCXhrReZHW9PGf9/rO4KJW1rnUlYmzEl5cw3ynww5Ge5D0Vd41x88pWmvRfzhW66l8JqBXSbZgKxUyGmpWNnKJEe7kbJlA4pNzIhw4PRAq6XlNY1YkBEqcN95zW+BuHkgBP50qFW4kpgnEvIPXTTNurVzsSYXorxuKUpKLqLYHmszHqBOdz2SbshTv6edBCTU1d/FcyWZ2RpwabcgV5Tafea5okMGpRqZyahaotkffxP4Pc8OPK9WcKT0LehdxvzdviGu0FkYzw8e5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RSIb441xmYls0Qhha/zjRHsHozlnt+m9N37hAWXnII=;
 b=YslEPXJKjA9wSTMyJw2Ckt5EmJFGjyAugYf1KTyEUUjdufUFFQlx33hlLkgg33ni4p53Z+t4WabcJkQBtapnHSHVdoIWAvPkHIGV3ln+jfreRdWqN5tubrgG+x7x1va+jGpTInC6rkwAlQQTH1meJNk5weMheUbKa5tCpUIFhB8Z9s6OPLaERuQuDlrUy4t5r69QGQ6sZmt7A0l6os5lVDue5NAQ1iweL9IvksXhH5sTNmpADREuLEq4yX008Q2TdDJccA6+2NzJxT3CzpqDkaGsN+kavjHDuIrBqlCGDwgOEWwbDwYUvpOc4CybdGa3eX1qxhgkCxCEZPBZ7hK3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 01:58:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:58:43 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, "Imre
 Deak" <imre.deak@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: [PATCH 3/9] drm/i915/display: convert inner wakeref get towards
 get_if_in_use
Date: Tue, 9 Apr 2024 21:58:19 -0400
Message-ID: <20240410015826.1093368-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6891:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llMyLSkk016iUQIbkhtevSC5JObyqtvhvAgy4jCYGw/q9veLpQLYt15IqJTPOprE4pOSDryHE/oMZkmz84HAXKStIPaXjTQH3kIbUFM6BuVBmuLAJcqgMcltwHYzQhBeKjiMN0Q3gsNBb0+mmM2LbUKgBc2WMgnkI6qkE1e04lcEfEygkfMlxq149RjA1DQQaxVSTwfrKCDkDzmX5Uek0ixJWYJZVHRL+UugH2WbkAk1ZuvNn0kAZKIgQTld24VvJWX/1Sun8JQ94GXhfG8ssVOyJxCMxp3U2T+ep2GDyoI39b2x/jCpPZfOFTdq/T2VFRy0VPFgLIBdW/GDuCJXp/sCLPAhVFbejN5WDplcJTuKpqW+N8kwHY4c5BRUXhfLfdEGEWiiupCGSm9tos07uw0hZpNNUwEM3UrLhqSZR4yq6Ft83bYOzO9JQ6C9Sizg1pDw4QmI/+XaJiqf+0szcUiy5sBcoXDC+RiH0uQRmGEkysOgXBn1oTTOzBwxHhZ4XNvKnQk7S3kAs6WAQ4wCkDRlQHPA1Ux2IlgN7/wyYgvOLHqcfLD5t5P3XGOWKNJc898F2Z6ZUphz2P83lIHjovLX+I/CXjngw38uDJ9e7rJZcfI2scac+G8lYSsgoA0Tac4cJ9wlE8KRa6W5aBkWT6cN+AP204/taLqauEC/HfQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXo5SG5BejdTaWhKd2VSaGl2bW0zVG9UU0NJRXNhU2FjWGxSWHFGM2FNSThV?=
 =?utf-8?B?UWZZb2V1Qmw0TlVIblJCQnlZNDNKbnljNHJXd25QTExzUGRiemtLbEloaGR5?=
 =?utf-8?B?eTZUcUFWK0lWL0JpNHlLa0hyb0lLUDBleE9vK2hjNEk3VVNHeXlpVk1WVEhX?=
 =?utf-8?B?dkxjWlFzV0tjcEF3QVoxLzJOVXdsTjFvcWlweUJXa2NXOGdLWS9lS0tTMjhI?=
 =?utf-8?B?dGYvSHlWamhaU0tESG1yM0R1aGFvSktvVnpnRWVkWVJCNjFNdlQxc1NlZmRN?=
 =?utf-8?B?N0FiTUl5YTdOM1lsbzVrOTJuOXdRWjh6NzZZeEY2NlRGT2o0dk03RzY5RDJx?=
 =?utf-8?B?UnRSS2dtUFJaaG92amkvNm41ZXpabWV6M3RUcjVUTkd3V2Urd3FXMzIzbCtJ?=
 =?utf-8?B?VTJnN1RZY2lsandFOFRwVE5UUCtXazNjejNCdFdhaVR5aC9MTXlrTSsrdFho?=
 =?utf-8?B?YmR6V1d3UUViT2FrMk8xRGpVL0lGdzRldmxxY1BrM00wK3VDcnZTenJidXQ4?=
 =?utf-8?B?TVZRRmZjUjVYYUcycjRwTnpsNEZtRkpHZnZzRW1PaHF5eFVPT0M0MWsrUlhx?=
 =?utf-8?B?VG5OOEkwaUg1dUdrVnB5ZEd3a211M0c5eXF3azNETzlCVGdXS04yenpnZFhj?=
 =?utf-8?B?Z0dwaGppN1E4SENvaHEzWG5yV0tWYmlFT0hTUGxaNkl2R25IYVFFNXFKV3hj?=
 =?utf-8?B?bERaQUpmSG9PazhJVVpFVEd6dCtQMkk1NjlZS01zRzE5RG5pL0M2SGNzMDZ5?=
 =?utf-8?B?WGpGc00zUVlCRXcwSDFaUC9QRHpVS2FFRENlekQyR2QvVUZEd3Nmb3o2VHR4?=
 =?utf-8?B?V3NsVUoxZEdRaXRoQm5pRjNhVHRsbXNOL2lldVU4RnhRRlZ4VnhJQ2tlUWs1?=
 =?utf-8?B?TWN3SkxNYUhldFlZNkZ3UHJtS2h3TklneUtTbzNWS2YvL0pub09EcXRQNEdt?=
 =?utf-8?B?a3N5ckZlNlAzYnhqQjhnaFZ0UlRhSys0S1VRbmpzQkZxeDkxZkxVbkVldity?=
 =?utf-8?B?TEo0dWJac0pFVWs2N0lPMnB2b0xWZlNQVHg1Z3IwSGpBZ3J4WGI1VnhxVFRs?=
 =?utf-8?B?cTVITXoyUFlzaysycVlNdFVuR2R2U0VLT1BkSi9uM1c1djJkQjBTWTQyNGVC?=
 =?utf-8?B?QjgrQk5kTWw1MTRpOW9JL3hRTFJoR0hWWUszMzNBcFFncVp5WnpEeHFscTJK?=
 =?utf-8?B?dTQ2M2JtTkt0UzY1YndScEZZMWh4WVpsTmt0WnJEaXVra3JZaG1YYVJsSjNY?=
 =?utf-8?B?SWZ6WmdPZHFTT2lkTDg3SThYc2lKdUhiKzBINnFqSk1lL3k2enZSdnBDeTRa?=
 =?utf-8?B?dnBiSzJDeXVqWk1VQytjcU1JQVNFZk11WlFTWEZ0L1E4Z1QwYmJpNlYwTHVi?=
 =?utf-8?B?eEswYWsxcnhJMmNFaUZhcGZoNTRyaUpxSVFVWlVEdlBFU3Q3K2puZTJabzlP?=
 =?utf-8?B?TXROT3BTSTJickpGalU2bC9PU0tES3Z2Y1pvRGh3RGY3cVlYQ2FiTTVzbmFj?=
 =?utf-8?B?YUZXZXRCTDRHTGVCRmRUaVJ0UlpvNHFocXE5K3krQmxOUEhSaDQ2UEM4emM4?=
 =?utf-8?B?TCtaQmxQVjdUUDNxSUVYYnVpM2FQZ25uYmphYjNPN2pyaCt3WDdEUllQa1dM?=
 =?utf-8?B?NnptYWFCbWlQQldQV0ViMHEzbkdQOFpTclJOUlM3RHJBKzA3V0VUT291MmNu?=
 =?utf-8?B?UXFRYUdHK1hKRjFWZlRqYm03Q29jcHBDUWFncjcxZk1xUkt1ZDlvVU9ReUhY?=
 =?utf-8?B?aVRhWWJpVU05c0VUUCtSaTJ3MEE5ZUxMN0xERytia0d6Z3hodTNPTWN5emJC?=
 =?utf-8?B?MkNrbU40bDhCbEVQVFl6T0EwQnVuSGdQQkFJRXZWYkJTbkFrc0xLNG16Umwr?=
 =?utf-8?B?Z25zNVVSTmZ4aEdIOWlCU2NSc2dqZldDMXROaVUyb0Q5bzg3QXNrMjRJYVJR?=
 =?utf-8?B?MzdNblc1TVp4VE0rTlluRUpEYXVwRVlBNFFTeHc1TVFvZFhyY3E1UVhBOG0y?=
 =?utf-8?B?a1hhcEZGbTBYVW1qdldmOEo1aFVIUTdOZVJRN29XUEdzNHZkZjN3MDVRaUNH?=
 =?utf-8?B?Ym9ZTVU0WWdCUEYxYVZqTDVtU2ZsWFU5V2ZIL2NpYStzMkloNStQQ1YwRTBE?=
 =?utf-8?B?YkUyVWdhNjBrcUxHc2dQUmJNTWlvMjlIK1M4SmxoU1paM1VqSVlHbmtpR3dF?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bb039b-6dc6-4d53-4ea8-08dc5901bfe5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:58:43.0930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFMSCJHbkZgCEvsOJj8vRoa+dvbqjLxtDOynZNY0uFrk9573YBt+BJHJNcbCz+hrkEx/WQZsRe832L5xw0UxUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

This patch brings no functional change. Since at this point of
the code we are already asserting a wakeref was held, it means
that we are with runtime_pm 'in_use' and in practical terms we
are only bumping the pm_runtime usage counter and moving on.

However, xe driver has a lockdep annotation that warned us that
if a sync resume was actually called at this point, we could have
a deadlock because we are inside the power_domains->lock locked
area and the resume would call the irq_reset, which would also
try to get the power_domains->lock.

For this reason, let's convert this call to a safer option and
calm lockdep on.

v2: use _noresume variant instead of get_in_use (Ville, Imre)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Imre Deak <imre.deak@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 6fd4fa52253a..048943d0a881 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -646,7 +646,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
 	 * power well disabling.
 	 */
 	assert_rpm_raw_wakeref_held(rpm);
-	wakeref = intel_runtime_pm_get(rpm);
+	wakeref = intel_runtime_pm_get_noresume(rpm);
 
 	for_each_power_domain(domain, mask) {
 		/* Clear before put, so put's sanity check is happy. */
-- 
2.44.0

