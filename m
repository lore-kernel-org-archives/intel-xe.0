Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6F8FF886D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 12:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3350010EB98;
	Tue, 28 Apr 2026 12:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgT5D+K5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82FA10EB9E;
 Tue, 28 Apr 2026 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777380793; x=1808916793;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=h+kUl16fODekq/sUcvnSEJgv5gjgHP0Om5lfyzbl79c=;
 b=LgT5D+K5hH/i/7n8TQ3uBFQ8zjk9SfgMz/tlKJU7uLGZlc9kVxzzOut4
 aQAtzMT5KTi3bp7Sb/KGvafPTL9Z7GB+G/cP1zIqc1ihSVxEkr3vX6a0u
 5gYIjk1nuGcAeh3qsTwsS3PLURPMM6Z5qVhtIJMjbUi8OF1pmZBXiTh/P
 0TGD2hGRjFE7TP209G7ar7RwnStFcefuP9/vK8Yi1D4tqrZELp9UIRS5y
 TdJjd/Nx0r+ZDGP9mh68OqHknZWrWbylPxc924l9oOri4oYIq9lKP8+E7
 R2eaUAdxA5cdJuFTM6qdu3G05nY6IWH34PDLbILVsUhaqJYvnG8dRC720 A==;
X-CSE-ConnectionGUID: aY41MEasSA+WxAJOnw1Y9g==
X-CSE-MsgGUID: xbbWrh6KQLutMYOnlTiHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78398586"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78398586"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:53:12 -0700
X-CSE-ConnectionGUID: yLTDaLZNTBupEGsgkyUENA==
X-CSE-MsgGUID: cdIWZsL5T1Ko7OgF449VXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="237911308"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:53:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 05:53:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 05:53:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 05:53:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFFGlEnlYlPWg6syXp4fuUd/QI6YMw/XKxfEJnsFwUrTzVqMqT9bWAOCtskKBdo67MebFFAvBjPX5FeeoTCoPVKXWDOH6/CUfbGIBVJFowOFCBDJDVkk5qF4QmTuXz1kCoajvYeBd4IMP4jRxdqkNOss+8FG5/A9yH+Ae70VeRdSAM2wX7Tw6qw48M2tf7frgsdZme1g6ALaZ50n8gqw5mFRXYSy5xo9dkePcMykLH3X+YFX0M5KVplL3+f4e0C6xuABDCBqDMQcWlYtX2uSQc7aBh/Pc9KZPKwVgA0DWpCFVPJp0XOZ8KFMYgx1mnpMfnrS0oPHqLLURBhfDHqLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yq0LFAiE09PyFaedxhYKYjpTQeU6Mh9jI6Z6ZPJO0EE=;
 b=ed0QlmsARBqxIBNRa8i0BuCJwBjt0RgCRbdYj6tsOJgN4u6gFtySHpKRj3szkOKBzzANJywDC48K8rnnGrtGc/yRbrgMop8+lVg25BndL8umDGLMYQwiCh91yCcn018e42AI3cc5j9XX0R9c4kQeMPx7ZPic0G4rJ2V7Mv1eqRvqXz1dWqvzy1RJepe79x5sYn63MoGwJhMuPjmX2HSXHI1KhFFT6oG1t0e9QzWNpzhNUspaTBN7Y/Rbmuhu2D+nt34y9t3oASKxT+LH/9pyM3c8iGCmaJMibnaCKmwG8YQVN4e0lXd4LrTkNHpZvJ/0JkPNsiWLBZoQOsZNEDpY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 12:53:07 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523%5]) with mapi id 15.20.9846.021; Tue, 28 Apr 2026
 12:53:07 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 016/108] drm/i915/dp_link_training: Add helper to query
 allowed autoretrain
Date: Tue, 28 Apr 2026 15:50:57 +0300
Message-ID: <20260428125233.1664668-17-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260428125233.1664668-1-imre.deak@intel.com>
References: <20260428125233.1664668-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0005F6E8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::1ee) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4b0880-241f-4fa7-5db6-08dea5251810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: GCzjxTdOtjMt3kpx1xhwx95HLuavgcFXW9lUgia30C9VV3x2vIV4Q42kv7LSE0fRASc/3ixdYeNrcOL/MttDMxNox8PVYMt065B+SuwJq3Zsp09YELoDjBRqTwpWI0jHw5dC9gCDjCCO+WYRsvI3uaFmPD9eimlVuTMbB0t9xxHrGoWKqckp1pSLwhpPVpR8IVTbPxelR2S/4gGT34rv0VhAhEZbWZdRwpWSXa8JhxAzoTbN7zWIm3T/RXzqK/YneJDgNDdVpPc1ocqaEQoAAMaYurfnHTnNzlrNMe8J+GyVk91t6VAaXIxavCCtjFtJJVrgQTgDvnOGusG6mbe6NGVgMpMRPPS+Qq0Mzhe++If4VkyPql9hH6WCynpCXnMmz252kHzDy0/NGFxoSVkFDSPI4mtAV2/nSWYBlKLnojaC+fINmGD+UWLIhxooEIUD8uf/CUx5RO6wakxLG1k/sImg3wxz1kzVK5BPKy2y0nai2oNaHSMCo0f9K3KG4TiUcihcnIOQlVQQhAMgNTrgDSL22w6cFZSMLLSSxTOWBVyoKvMC6YkMxOAPdPwB70hx78XPFyUufVXKmKzZ2KAk1e59dQwSJVtoRgAgfKfF6y0FzkSFGFv/fhWm4y7AI6AxFkd5c1L7dlIn0rXL6sdqE3V14kOYCX9qswM8yCJiOPe/cjtqkdyk1FX2iZ03dmGBMbshKb8rwyUUy6ja+SIs5D0s+8Syivl7JtZPMKJ3sEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?79slm7z2DjwwabXwrctHpmZNI7zspdpENq+hnr+0hPoX/Dbq/M6uy5G3R3NZ?=
 =?us-ascii?Q?qoMi60aVZN14lBFbcl2GvcC/Z1JQROYgB5buf11DaAY5UdT+9c73gFcDdZ30?=
 =?us-ascii?Q?uV534KQlxy1tVq1n3mPRE0RQusNryHlsz3huCTWqbH5V7D4tKge16TEunUUJ?=
 =?us-ascii?Q?pCdWdR488nzfGHQJg06JMivNlWvN6K3ziZjtr8XA0pOi34tCmxzFH+jQq8cu?=
 =?us-ascii?Q?cCdc7suCI9dturKlMOBk70hxYp2ftmjESRqT7CobnYo4BfyPkQS+vZnSS75S?=
 =?us-ascii?Q?AOYVEqF8xzKKitxF74eEqSBjqLuKK65qpaTOVtyhwUCJUpnsZ+HHtpZuhmT1?=
 =?us-ascii?Q?Dk0ICr1mhOdoVrx5xAOKpOuV+j9icLPhOTSKBKDkzUgv+aaY/vJQfklClxOd?=
 =?us-ascii?Q?sohmKA5kVIHwOrmLd4ZvR9ZcTeuTarVGE67WI2Y2kPXRErqQlOLaeDLyMnmH?=
 =?us-ascii?Q?1/7UpQX9Zxu4kfnt3p+HRyI8SbSOoSZ92qEFqC0yZ5s9NT/qPqOnwTVEE4g2?=
 =?us-ascii?Q?yanzNdXg8mWiJ2DwMdx6bPjBU3uto6KLHzga6Sj98jz+DdGW0NmIeGRDonz9?=
 =?us-ascii?Q?tXgqzlsyNKSzEFess3h/raAuGqhvlv046lHZ0zO2ezF5e5I9p8vObMNdJWx1?=
 =?us-ascii?Q?uQH0+9eL87+2u7/9W2LYWL/dYp9G3zBnDsnz/73+yJ/+v+QsIAN5CiZHujoK?=
 =?us-ascii?Q?5UUkcr1nOuZrgh146KzBWiKmO1Hk/hexBw57oeHbJnoT3wxfyyJt+AT74e8g?=
 =?us-ascii?Q?jszNdDM8yZj/xH8k5QmlNbTnIkVUh1smxN1YeM4lDrFJVE8mD4RrnyaG6rCJ?=
 =?us-ascii?Q?8xlr0wcQt6ua3IZuW2XYLq4eagJDcrVoWv5RWcZJsFMQL/wsDJbktJmVtjSf?=
 =?us-ascii?Q?N3558REd5xglCuAZxUd1oHNnWWNMog7ZJN75uye18PMouqWS0lKe9JqYzkDL?=
 =?us-ascii?Q?MfiowRLX3LfN8DxrspjMa7Q51vsf7yXbMP3dgu8RI5iYp4g96C0B4aRkOhDM?=
 =?us-ascii?Q?vC8P3P59uRS3wWgA1VuZQSFfu/+iXrsWxKzahbFldoP3tmqHJGf4ZbUmVuoM?=
 =?us-ascii?Q?mYI3EqZQDWGYnTAj05aY0ErRK6JVIMh/XnEdwnq24cZCS14q5vY2uoiqxGtL?=
 =?us-ascii?Q?hO2BV005eusmVxyYE5+Ju8IM3gIAyV24R8gQowcjqZGLHLa4C5JvUzzcioEy?=
 =?us-ascii?Q?4Gxlj2YAmG+lwgI5s/p0gaY+vOEZSTeNexW+0eMtWpcFbxPVrZ4Lpx6sWOMh?=
 =?us-ascii?Q?gD6a/bBRZn6U+G73tOm8F0xbZzjFDX/lrjIxvkinbk+abT7O2BWuG48kPCxh?=
 =?us-ascii?Q?ClJASkqzctyTeQqFK4abgTq9YNzHo/6F/pnjaXqJgGvu+iqQ9WCkOpYgnbzr?=
 =?us-ascii?Q?VLY8H2trpbvOHRQMZyPtHX1ebaGCZ0GL0NvQqopf1vfV1al0mBKa3VoyyvlQ?=
 =?us-ascii?Q?qMWOPTDY8+6eEEgo60xcyEOA3+dL47yAgzcnr0mTII2w7roebR7LlunmhYKM?=
 =?us-ascii?Q?V1Xjj2eU/SFHdHRqmJNlpPbQ2PDHh+jFCGN1YuvJShvxBKQBfy5A6v9isGTx?=
 =?us-ascii?Q?ckL1vdIzQ3b1cqXwIpVtYjZmAWmpSCQou/UjVHjWyWaZsqpnJRN50J9G47Rj?=
 =?us-ascii?Q?+Y+WUdTSgVHBkqeyVyN5HVo9ceLsW5TqYvM2Ml1MxAA5V1KVTqzewzgPjvVL?=
 =?us-ascii?Q?nBD3rmvz9S//7Cf6Olx7MfF3xloOwVXeGDRhA8+j6wvFQMvo210xhC1Umgd3?=
 =?us-ascii?Q?Nb34saMkYA=3D=3D?=
X-Exchange-RoutingPolicyChecked: P/12bN6Bv9UCJUGyJFrOOv8h7pXerBi027f7nRMaAxwn0fa/FZq+KV5QGDKtQ6X8r6Pn/Phsp5hQMQkAoc/EoVrU7J/NDSBtsdxO00VIbgBPQAG2Rjh/Wj+1LZXOCyUyndC8nubyaqY0jBA+8F2YOHCjiYVwavOZnXhZQJC5SAT3RVdGuB2jSPI7ftK2ZRh+8uFKpiFAXd2drnNRnt2xHBv9IAkVkJxSi2+HJehu+rR8PZrItdY/1IJyTdBATy8LNmYBeG9Pc7Hmlybjg/U8H08PFaDWLjI2dk64e+qpQFmv6kuewsDoJyaM1ICjYYULnmj4DGDcSrSsvOprUdGVdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4b0880-241f-4fa7-5db6-08dea5251810
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 12:53:07.1482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJn7v3T6jIqhsJ9sx6BuhO/9nRpMbZXwujoffJffgpQ5BvvKivvCRia+2FW4VVhtaseF8PFxAMUrRIahXx5T9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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

Add link_recovery_autoretrain_allowed() to make it clearer what the
condition is about at its callers: queuing work for and starting an
autoretrain is allowed.

This also prepares for replacing the sequential link training failure
counter with an enum in a follow-up change.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 77697a7619812..1c2cef7d61f37 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1263,6 +1263,20 @@ link_recovery_autoretrain_pending(struct intel_dp_link_training *link_training)
 	return link_training->seq_train_failures == 1;
 }
 
+/**
+ * link_recovery_autoretrain_allowed - check for an allowed automatic retraining
+ * @link_training: link training state
+ *
+ * Return:
+ * - %true  if automatic retraining is allowed.
+ * - %false otherwise.
+ */
+static bool
+link_recovery_autoretrain_allowed(struct intel_dp_link_training *link_training)
+{
+	return link_training->seq_train_failures < MAX_SEQ_TRAIN_FAILURES;
+}
+
 /**
  * intel_dp_stop_link_train - stop link training
  * @intel_dp: DP struct
@@ -1303,7 +1317,7 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 	intel_hpd_unblock(encoder);
 
 	if (!display->hotplug.ignore_long_hpd &&
-	    link_training->seq_train_failures < MAX_SEQ_TRAIN_FAILURES) {
+	    link_recovery_autoretrain_allowed(link_training)) {
 		int delay_ms = link_recovery_autoretrain_pending(link_training) ? 0 : 2000;
 
 		intel_encoder_link_check_queue_work(encoder, delay_ms);
@@ -1830,7 +1844,7 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 		return;
 	}
 
-	if (link_training->seq_train_failures < MAX_SEQ_TRAIN_FAILURES)
+	if (link_recovery_autoretrain_allowed(link_training))
 		link_training->seq_train_failures++;
 
 	/*
@@ -1850,7 +1864,7 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 		return;
 	}
 
-	if (link_training->seq_train_failures < MAX_SEQ_TRAIN_FAILURES)
+	if (link_recovery_autoretrain_allowed(link_training))
 		return;
 
 	if (intel_dp_schedule_fallback_link_training(state, intel_dp, crtc_state))
@@ -2002,7 +2016,7 @@ intel_dp_needs_link_retrain(struct intel_dp *intel_dp)
 					intel_dp->lane_count))
 		return false;
 
-	if (link_training->seq_train_failures >= MAX_SEQ_TRAIN_FAILURES)
+	if (!link_recovery_autoretrain_allowed(link_training))
 		return false;
 
 	if (link_recovery_autoretrain_pending(link_training))
-- 
2.49.1

