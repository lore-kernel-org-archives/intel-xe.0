Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F48C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D8B10EB48;
	Wed, 17 Apr 2024 20:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP5rva6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EFD10EB48
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386410; x=1744922410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zLgOXb2U5TmgOXzowzmyq76dxee6XvcCo+3L/pNjRnE=;
 b=PP5rva6eBBpA4X37X70PwbLzKy6kzuxXi51EUEGJ3wPl7zhH3b/Y8Zwm
 YKKEF7au6l6IRLgSoJyKfR70eCRFDKIy3KkSYdoV1T5mYg5VefeunQpS9
 PSNQQt3ax+qmgAwL5zovaFbJdHpopYwWW/D56hmUHFJF5CP90Vex/hyn8
 SUC/F+KHa73oesfedXFFZFzNxovOD3USK7B8UICiYwp0da4S+nQCg9iYa
 i6W134lp8hgjDLQ7sVXng62iI8moHWlczyntoJO1m/dGKNayN83Fq4sqh
 FawK153fi7EER7uAwpU82I68C28lETw9/tC1G+xrTtGH1MgjG8EBLjdKr g==;
X-CSE-ConnectionGUID: XjN/clRcSxOFJRpPEmG/Xg==
X-CSE-MsgGUID: zsIfcgprRVW7ohDJsQN6cA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12684262"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="12684262"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:10 -0700
X-CSE-ConnectionGUID: r5F7n+c5RGSD9jSCkkQYSw==
X-CSE-MsgGUID: cBD5WcZ5S/2EHC73iKbl6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27546132"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqVQJIXbG8ucA4UkCpSfM7aNHmfJB2KjCT06cgHVmBQrBSNcWYTp1gvjdGRrVK7nNdXLQS4eXyTew8ZJfkr3fjpGL8y80lbtDix8k/RAgh8YvTwmZKI5+e0yxa06+HJP60xX66nVeb+I3+EDeH5VdP8f5+3hyBvAFgFboa/fvs4y0KopowGviNs9yVsU09BMf4zyaRp/fotYqkduCnKQ7dHIlvZNUqB0iQ19mmO0iijgeiRcwta7bAevclJkO1zxx6+ipAVexHP2zsxoGHiFNJu3m/zA/8YcjBQ6Zk4rywnrzEjKSx53qMkLuKU2O1B/om9Lj2t3v9lDlqTknM84Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RSIb441xmYls0Qhha/zjRHsHozlnt+m9N37hAWXnII=;
 b=in8Xlq3LQUb1wA91Fvh8mSS2+aNbCNV7CGo2YlIZZwjTXK5LMiWDKPFvf4+wmxS4cLAVKrYmTdtHiC9CfZZ+TMICiJkYd7TrYjYiYJnE/LNYZQ+XSmfbxfwnmzfMZtv9N/Tbb6bxGYPZg8bLEYlni9+cd7WjC3StfmRMDwO/o46zeaTiVwYorfU/IrJm8rCNPYUEQ1OO59YJRhVOMlm+1mtdghlhnYO447Fra9OOiAMLOXHHHdies5o+4SBsXpoypX174ALkJKz/+a08KKJaT4i3hKzy8CaJ9Vl4c8CuWFon2Im9mUCwHcJe4uraWKLMoQoYWzw+5c0rxx+mktm/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Wed, 17 Apr
 2024 20:40:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, "Imre
 Deak" <imre.deak@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: [CI 03/10] drm/i915/display: convert inner wakeref get towards
 get_if_in_use
Date: Wed, 17 Apr 2024 16:39:45 -0400
Message-ID: <20240417203952.25503-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c502a80-9bed-497f-b820-08dc5f1e90bc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: onRSfE/WFZjP10GPWvyny+O73G2pBpElqlm76Y83tobJcGVj+7koz5UrWmHN4LM3xWff9ncYCGmIdbSMxDS3/AwCv/WLks2byoFdVjgvcqKLORIxreksfLeOY4jcJLiPTSmYH0+qwVZjLICKPK6WCR0KoozBqS726ZmcepR9kO4yOpjqk8pTcGAVNcUWpwaNLLgtQULOnQueQ4QmBE7S8MdC0M1s0gndRsn8/1k3kGXDc+RvkhJj9hEA9h3JYZXy8mKTozSxJyhSmXumL6uy2KL4MCY0k0KAZw3moZu0E1u+k9MDNF7XaPJ9G2JvCb9jCGh9vDxONoTLmIv5wBmDJk/4OOa6dTQYmrd5Mb6LonxKnzLtIuAtkLZ9TWpFoi+smWdpd/iXAfOuOIMlSuPbl0DY89+kMFmmx9Gs+LBa+PhVrguvQI3dQsSmV25d0vLg4olZNxj4j+W65H2BIuYGND4lWPCjalQ08CSaAdeTyDZH7/deIPXcWP8Mx+G5gkF4o26YXh7+hczh0Mjp3eacqqS8doMkyOBqMbv1NYw8yR8Q1bsv1A1b+nlcn+GsXkY9w2pcEuDAzUuIBtBNFc9PJhJkEpugCKZ0TjKqdQ+FU0e/7V+amfeAoDSfpJj3oBkkLWhIygVP/uSiRp9jTMeGfSrsZpxV4BJxdxaflthrmQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWI1K1QrNGh6T1BDUTRlKytVR1NUTVp6QzBVbUJpbThUUnFjMEtncVpKUXI2?=
 =?utf-8?B?S2E3ODJ5ZG52Umc1N2pSR2xLdWdBQzM1R2xicW5EUUpRVXk1Yjh2ZGgyV3J2?=
 =?utf-8?B?RisvRXFrQmY3V0lSV09vL3hqSzQ1ei9LN0kzZnEyTkRoWjhEeVFyZ05ZekMz?=
 =?utf-8?B?eFpWYTlVT2VERmhlT2lsUjhOa0wwODNuVlZSR3dvWUNZcXJaUnVqekdJaWo2?=
 =?utf-8?B?SDQveTNMOE9sNzhONDE3TjgxSGQ4OWJQZDdBT28vR3I0ZzhNcHltZlpKdVJ1?=
 =?utf-8?B?Q2ROckRGaGE1UCtMbUZ6WnRYTjlHNFV1SUg0ZW1MYkhCN2hzcDNnK1lvblB1?=
 =?utf-8?B?ZUZlZWI3elZzRk5iM3UxUGxJWXV6MlhXNXZsOHA2Nkl2QS96ZjdLb1dlRGpI?=
 =?utf-8?B?R3NCRFdFYzRnMjFzU1k1a1hYOVlCN3NIcE9hRGw5YlA5eTNQMjgzeWRCMG1V?=
 =?utf-8?B?QW9KQnJJaHVPZlUzQnFJYUNiVWZQMUJnckNrdkttZDBQYWxIL2NnU2N2cm5D?=
 =?utf-8?B?dGtQTkNWb3VlR3lOaHVhcXhkeTl2cXNvU3c4QVNjLzVnMUhzWUVCdDRVQ1JQ?=
 =?utf-8?B?RE9zU3p0WUsyeDFUV1RaNUxOeUVBZ3EveDRkTUM3d3ZjVkIwVFpVWTdxcWhk?=
 =?utf-8?B?RStuRUh1VCt1QTM2MFgvWlkyblhkM2RRb2dld2VOUWZIOTdVb2JmL1UwZmtG?=
 =?utf-8?B?UXNJNis3cnMvYTE3cUpkTGNNZkpHVC81bXlzaDJMdVdFVVVBdEFQRUl5ZGxK?=
 =?utf-8?B?eGNENjBlTEdNR0JRWUlVck9rVytYT3FhNVJOemhXK3Fhdkd5TEN4TlRwbmlv?=
 =?utf-8?B?UDdpQTY1cEF2a1k5UmJBbVBTeUxlc2c1RkZXWFkwVUlvQWRRSGJCeklNdXR4?=
 =?utf-8?B?d0xmci8xV1pWdFdJTVUxWmFab1VpSm1RWDFyd2wrZ2NtcHdKMDVjRXJ5RWhr?=
 =?utf-8?B?VnFibElKcE54UGlSV1drSUo2NTNYY0VLVFliTUJZMzd6T1B3QWx4VkRNV1k2?=
 =?utf-8?B?T1VaOUNpZnMzTzZ3VlVIR1E0SEplVkNlaFlzMGJVdENEakx3L1hFYXEwblgz?=
 =?utf-8?B?OFBMYmZPR0lyQ0o2Z1IrY1JtOHZ2NUUvbldDOHhCQm0zamFNVHVIVTh4YlBi?=
 =?utf-8?B?MjhDdEhUQXdGWW1IUHVCOGlHaEVnVVYxTmwzb2Z1QXZzV3VXaWlaWFlYT2N1?=
 =?utf-8?B?VzJzV2xIVFFmVzRXcGM4N0JpRnN4L1VybFlPQWFxYTJBaXRjTmFicHd0clk4?=
 =?utf-8?B?OE93ZmhmcFNlUHNSVjg0WGladTNuMmFLRlE2N1FHT3g5ZU84QmRQUFUzVzY2?=
 =?utf-8?B?Rk9ZdEVQZ2txZkl3RVkydC80SmUvd1ZHano4eWtnck5mVnExa3NXbnc4M3Yx?=
 =?utf-8?B?R0NWVEQydERDcUxjSnFzdlgvNlJHUW4raUhacDJCYWhEaWwwMUVvNHRrQWpU?=
 =?utf-8?B?NzdOeVBvZlpTWWx6UXl6OHlNUkhneW5aK055TW5CR2daYzZTL0MwcDg1Wlpi?=
 =?utf-8?B?MEhXYy9tb2l3UmFENVltOEtzSm1YUkdPVXgxRDZZK01pOERkVEVMWE41NFdS?=
 =?utf-8?B?WWloQmZDdUdNTFZpcm1sbnlhTWRTNlV1cFdOSnFuUy9DWWFUTUFVMFZaaTR4?=
 =?utf-8?B?TUVGenRuN09jYTgvNnhmTldkT1FTMy9uaTlXeURsU1R3UU0vc0dKcmZPS2lx?=
 =?utf-8?B?TkplemtuNGxIa1RqajRkRmZxRzA2dC9KNTNLWGk1WDNpSi9Wd0ZiV3dKQTVE?=
 =?utf-8?B?SlF6Zzk5RzNlcWtHVjgzeGo1YXdqMXJ3ck04cW5jcEFoZ0RvOFFNNHBXeVlP?=
 =?utf-8?B?TytpeXpvRzFmb3lYdHRSaVgxQnZaRjd2UGh3RGlsNEtCMWIvM0Y3cTNORGpZ?=
 =?utf-8?B?U2oyVVRKU0pMYzZBYUdFaEVSS2NWelFiNDRrTnRTM084b09ZcVdpRVkxRHZm?=
 =?utf-8?B?cmFWYUtBL2tuQWJhVzhFNC9lcUsrT3EwbGRoa1FUaE1oeE1Mai9DRzFqWXJr?=
 =?utf-8?B?RDhFRGNmMlIxSDVGOHd0M0cyOU8ra1RjWDVNR01MY1hlZHNSZFJsVmtScENa?=
 =?utf-8?B?Nk92c3g3S3NlZktwUTVNWCtuL2t1dm9DcS9SOE1wK3NIOTVCMjZYRU02M0pZ?=
 =?utf-8?B?NENudmRKMG9oZ0Z6T3psN2xYaHh5M0UvQVQwLzRhWWlPeGpJY2RBa1B3L1o0?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c502a80-9bed-497f-b820-08dc5f1e90bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:06.3271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sBpneNpIvQ4s/RVGrKQUUlCmoOu9d++CeVKezk2m7HAdfTH86hFDS4BUFVPhAv2aOIxMkjZ3yCB1rsWlOyFVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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

