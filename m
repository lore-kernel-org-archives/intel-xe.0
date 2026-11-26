Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F56606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=baBT5Wp8;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XXgQjRvH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AC8112285;
	Thu, 26 Nov 2026 10:08:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146E2112293;
 Thu, 26 Nov 2026 10:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687714; x=1827223714;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=DCUrJPYM0HX51ohF5qLx0FVQRN0AJhJG1lKD2JlXtN0=;
 b=baBT5Wp8upxv5WkohUNFgVRsTakdYQW66SaG0+xm1ywbXl/fiZ5Nknn8
 xpWIUbkqxEpSTdCr9GjT84xPbUu/W2fDI1KWlNn9+MlnzH0Sg4td4+OSO
 oGfpKjgi4DjqpFYMEY4/2zsGVLiKDwHPSh7Xc93dPAFwT22MLwlz9qHuP
 +R0MnaPc/8lCSBrk0kMzlrhP2Z5gi/D8DqQapUIo2lGH6obDFw4m5U0I9
 RfSn9UJQujugSaJTyAVeXdGtbh2yqwAIucd+GqI62ZDjfV4DVcheMoBsY
 EfXBFY4HT/vUKVdozSbFmxkl28vborpLILkzqpZX6WcK8ILZ5s6fNaXqR Q==;
X-CSE-ConnectionGUID: 03wlOvOtT3+2kVIN8LKJvg==
X-CSE-MsgGUID: Sm06SLr6RLGaQKQqEw2H6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4434843"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4434843"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:29 -0800
X-CSE-ConnectionGUID: jtD2WfsRQPOyvXWPA/CMrw==
X-CSE-MsgGUID: O8dRkE8UTxanCZCkNbC1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12432785"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:28 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTokY5WyWBqNIdgr/1O5bTiPYsNtClsdcIM/bjt+M4XVB86mO66XIQHgBIZ8JZIw37uZ/WFBW+1YvXv8e+GTdOCpzuVzyP9qJUbPltpKwxgY/g4X/Yp5GiogzMrVsMhRprksDe2C1tRvY309N9otJErCn2ln87mxeLOK2aqfDrBe/1+PivNlZsUvv9S9kTs+3UrZw03yBegBu/NJJAnKhta4RxNLlON82qA7kF2DO39bDMAGGG4Bv0Cow9vkLLzbdUvAe3tcTG5f97RFYD9qzL4ceNFS+ssBWkEuhOAfXwMyqKgNSlK0nSsywYMfbwCS4nDyYUG3zXXGAWxCgnrB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpAWntkD3z9BjaP2dTjJwAPjKu45U1QHEzUvECpcipo=;
 b=wr1nCAz03NiA7toacE0U9VSXRxHbBprzjPpmzTrPREAS05hZ/jH4VcFYHB2xbr7A3cpmbHLU8eouzzobVl/6tyBTH0Y8Fh5AhMl/c7kIG+9mQpmIQG2ejqsCsCQcnxHS4E7OTIPcU475LzGoBovF6OAtQ9t88fHEG9icd+qcNIadawDRTmE6ObTdlUh29lXmq52bVnDA5Q/DovgMe/fqcyPKLQDzVW300nQYEolOshzGlIVrQZV9V/MzxESPHqs6zBtM5RqqRe8pdKpTuZFCjeTfK64k+dPTUMal+2RHilm6Qkqidqms+HE2FrZb3bfVMOeQk95NdA7Es4KiVARWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpAWntkD3z9BjaP2dTjJwAPjKu45U1QHEzUvECpcipo=;
 b=XXgQjRvHTHZowUifucrOZudp2xEJkgsXVi8zYhycyradXTiyu/6Ysv2jV/ly74xG8iCx/vFPnDAvE++9j2Ot5AeWluNzMd40yNk3VuTJOGbRy/AxxwS5tnZTbLebrtAp7mzvi99o2FgvsVfJeL8fh0QLBXjJTrtGSLaKECxBN44=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:02 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:02 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 01/13] drm/i915/dp: Allow rebuilding the source rate list
Date: Thu, 26 Nov 2026 12:07:41 +0200
Message-ID: <20261126100755.1252635-2-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 83c36d3c-fd72-4b12-68ba-08df4ba527ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026121527099003|261022115727099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DMgFSOgkidaiNsQQqRkVMazenKNwJSIoK+oSbC/orOTrbio55tliOkVCpBXFezKbuViq9wzImpYAoVVxD2exOKOkJ84nrEVZFM/QUENxZEH0VlncNLP7Be7CCyBPqzx7/BxRuGnNZksl9lNXSD8CUUyLdaF1XWcMO6DLTk8vswzG4+2dC0iJ2BxuBdFdIOwSJmpRCqTswgqOcOz5EYUE2QjndovjHoka+79QneCjt0QqX3k1qBg7EePi+H2YtPZtupx/cnwLKU5OGQfvYhJxNk5NTLV+fJiukduCY5BWdxm9UCOeDOL4F+ypOk/xbfod/eMGcscBwcxoHwMkrqxSUALaQiUpzAi3G5R00/HQcU64BCesk4whhXWLy4PlGcGd82bT+6gUnGhl6xcbEHjVrZssc2kQQ16spqX2JtgHZfBUb6o2L3aMLGzGkPPZlZEkaHcMDRVk0GPuQNQfkufVf6PHqpZidpHWKltPnjYWM7rrSaTXG9KYb1SRyzlCY8BHdeX/rBIKsfIWf2HfklXAPttpNnFhCr4oDpSpfwI5oScNnSurV5GMCwOzowxFk6hbpPKQLpTGaKLrA709MGO51YtwfKdFWkBCv8TIkhEmGmU7T6yrsNom5cbbmhxH1Idv/KGhMaPCbvkTJQZQMl8UoUWNLhNHWoarjRsT5/44dN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261022115727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RQkAR/0cVeQt3WVYe3gC9cS1TJuOPa7GKvwL3Rvxa+WCGIHcpApiyytqZ4WY?=
 =?us-ascii?Q?A2FgDeoHis9OCjoVbhpldMFV9fWi+RTRw/R/yLUySdgsQ1+xGrkKfAAbSMEa?=
 =?us-ascii?Q?sVC5yWremZ2sWfclWLzmYrGx+A3A8tppnc3WbhS/uREDES3eR4JLj8CLdMf/?=
 =?us-ascii?Q?TwOyDaoxhyfIy4GZM7m3dAbPM7hE4F2YoxZkrMnMbG1rRrwgLeX/JX5IqvdM?=
 =?us-ascii?Q?8NRjeoUrJs1HClWGgNIgI9ym9KpZtG7PFMSgJr0r/2txqPCCg0CIBfhrGS9I?=
 =?us-ascii?Q?8FtQt0xuj5KbQKceOqKnouRPbO4RazrkH5KAWInpUbghqaqGHLTwVG528eaW?=
 =?us-ascii?Q?I4V/aeblGqwqcs9FyOjvNB9DVlM1mT31XfNebXw7PzXdyKQTt8/0R0BswjUV?=
 =?us-ascii?Q?2lFvY6qhhF0THjgKYS/A3ASgwzihG5xB9sG1WtAXZvzeQPHrUVziSbRb8KN/?=
 =?us-ascii?Q?700T96yH02Y/E/QqraRZmWRIIT6fdGgvsC46pKZX4V2SuWbZMCce1faH4oy5?=
 =?us-ascii?Q?S25OvwgPzSWOvvWOvCzxYHi94l0eDiniAgh7ZPiS/F7StFr/P0VQZ6N4hXMJ?=
 =?us-ascii?Q?7iIwpjHnr1A8+UMj/LzymTt2GxTeIk/nI5qNyGZkrK9LQpKt0B/kX4WKNKyW?=
 =?us-ascii?Q?WzWWWtrr+jtvbXcSnMG2+HcMO95xjzjRhl3Yu1DFzumWNGLhCeXn8rg5Akkj?=
 =?us-ascii?Q?M+FuSkEzcvyfcNT4HqcBD/9kUwzRMU7s2fsiYEizgkA7J/40p5wH1OT38fA0?=
 =?us-ascii?Q?+VqRPlv85Xno+FlClcoEK9tZoS+XdNQHJzyrOJ2iH6jjknbiifLDb2rSj2gw?=
 =?us-ascii?Q?sVlzz1lf6uQqrdPZbHpfYR9/q9z2+aWdtyubl7Su2ojulmHrICsKMtap6phV?=
 =?us-ascii?Q?eilrD3fDCZ8ShnP4V3p8P69+ne7hmV1YTGS/dX2GEEKurZfawYOwAPj4r7iF?=
 =?us-ascii?Q?NoxmrGyohFxsY+Iwe2zrKCDwdcXEfv2Kl4YFA8i5h/hHmvGs5f6/7blgq64s?=
 =?us-ascii?Q?bCV8/oxnNyTeTDZ2CbXZQqTwjUBtXLJzzsgUHg0j/AEGR9odnAhZVugYJQU5?=
 =?us-ascii?Q?deTwfx/hhlg6c8lGDfTYd9mShtaKHljS++Q/zlwGdpwnMRSLTUqHFLFdxcrI?=
 =?us-ascii?Q?Myezhk38jkFRLTXY4rigCKQG3Mhbgr+XgWDEZiH67CxG5r1EpgC7Sfy6iwFT?=
 =?us-ascii?Q?lVI1pAWq2wusrelyRS9DgXLnYPJGDS57dmLTQhvvyIy3SpufNSHDPaH4V0zF?=
 =?us-ascii?Q?v7GXdP/NCXM0Hx0HPe35/GKHUhw/T9G240/xRhZN9yCaKd23y9iVqNgoIzmH?=
 =?us-ascii?Q?QtiGaVG2WGNEzS5ERSq6RNj11J0QPrP9BaBORid5Rrye9pY97iqCNTVJuGdn?=
 =?us-ascii?Q?XNn6W5f8OVHC7WhvY8hpMP3W+ywSTMaHZLYGHgcVhJEFUTLweqmush4Ep9Pk?=
 =?us-ascii?Q?5NGkDBCdhy4OzmS/jm+VtxVQvJmNLO8OhfkWAq1we7e8yImWCtC7ez8t9OEJ?=
 =?us-ascii?Q?jylOQ7f65t8khUsX0WgLzxTGcx104IMHR0KBi9IVWyDLua4+C2x49GK6yTAl?=
 =?us-ascii?Q?Yskyk7qaz3q/T31syLTApOnL+26PaZPiIKTkft0O8aqr8THi9TCyqZkASFqU?=
 =?us-ascii?Q?5WOhpXFWKFO0wWMMYMgtXHdwb5uih/LZyPQLC5cHN8LbgcXz/1JbhoZTofzm?=
 =?us-ascii?Q?BBWcIAwA+C6Lpx4J4H+FUhb65AuTXXcvHuUtg0CxsaYWqshHf1SUku7mBA3+?=
 =?us-ascii?Q?HFLAsMXH6Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: FX8L9sgv98l40TRlNis/uCxP+iZmr7r8yLH68ElnpArRvZC9ApEVjt2fGoRjamsPoek38rj18bv4dUAmfAx/2Lvs6XS68LO+YwniLxG45qfk2x6Xu0vi+YP65vtJvCqo4CHZ8f1xs+6QIGmzj6HPn02r3J/Mc0Kythu40B3fAfHmECfmoyBKRAyc3FS/gJomwzP3Sh759NB62rdUz3o6IGm6KzZEdBL4Z8Am5kZNdXYxKYQyrox4oxkxCYT5x8jgy9LAABm8nH43+Sa+IP+xOtJ9G+UP2uYp0v9CvVUXAcTRAWs7JK2gTT2/nLdug6woPhzmQ6mJ4Mz5W2XaZ5eqew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c36d3c-fd72-4b12-68ba-08df4ba527ad
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:01.9442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYglFrMIHnABXXqcMsty2isbX/iN26BnA2VlbHNTCmFnpf1FQx4xjaG7tgUfuPF9VNkRTQgrxSZyszbij8B9Zw==
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

Follow-up changes will move the handling of a legacy PHY to a different
encoder, requiring the source and common link rates to be rebuilt.
Allow rebuilding the source rate list to support this.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +------
 drivers/gpu/drm/i915/display/intel_dp.h | 1 +
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a7976187..6f03a169931eb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -548,8 +548,7 @@ static int vbt_max_link_rate(struct intel_dp *intel_dp)
 	return max_rate;
 }
 
-static void
-intel_dp_set_source_rates(struct intel_dp *intel_dp)
+void intel_dp_set_source_rates(struct intel_dp *intel_dp)
 {
 	/* The values must be in increasing order */
 	static const int bmg_rates[] = {
@@ -580,10 +579,6 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
 	const int *source_rates;
 	int size, max_rate = 0, vbt_max_rate;
 
-	/* This should only be done once */
-	drm_WARN_ON(display->drm,
-		    intel_dp->source_rates || intel_dp->num_source_rates);
-
 	if (DISPLAY_VER(display) >= 14) {
 		if (display->platform.battlemage) {
 			source_rates = bmg_rates;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1f4a3aff9abeb..36cd340d809f2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -58,6 +58,7 @@ void intel_dp_connector_sync_state(struct intel_connector *connector,
 				   const struct intel_crtc_state *crtc_state);
 void intel_dp_set_link_params(struct intel_dp *intel_dp,
 			      int link_rate, int lane_count);
+void intel_dp_set_source_rates(struct intel_dp *intel_dp);
 int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
 			      struct drm_modeset_acquire_ctx *ctx,
 			      u8 *pipe_mask);
-- 
2.49.1

