Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7C3C5475B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 16:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBC410E4F6;
	Tue, 20 Feb 2024 16:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNgcJY5J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC6D10E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708447587; x=1739983587;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=i79Zs8UYaTMDnjThny1JBvGzAOkhLPJimSqwGFQ5+bo=;
 b=NNgcJY5JT42jXWTwgFeDlJDJr3YIpQWfy7PZK5oSNZhQcqPiXKnOwEXM
 cjY1GJrzs/TxsFeCLYdi4jHj91c3pVRhMMsXCjaa46G5Bv82Y2VO/hGHt
 r7JvQzP1TDWbS5h1f9N5PHPpqwi4yB6YvDPbZ9W5p9bYTSTlS6RYpHVaK
 40XQaJ0/MSA7+7VViWZiujc6RwLgJ97ceU2fHhh1jLRS0T12LZYXk0352
 G/jlJsAtPVAd2LoTU2nyS1njUfND4+LyZEZqobtzTaP+2/xq9JnI7lXvT
 VafluyNH4ng6Mo/SAW+ANv4wD9pZAoku23Et2ilxVURp+Ox6BN+JY4ANb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13117622"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13117622"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4800899"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 08:46:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:46:26 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 08:46:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 08:46:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 08:46:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqQ5DX7U9MjYsyUQ9pJnar7BabXg8Qjgj/ZRUtxdqt0XTMs/fbfiSjaIeCIwWDKU0ALHk6mpv+PJJwHTGZc5mCnHJq8drssAXtwO5N37dzVaYvw37o9vJUNeMqzXWwlIoClgPjGT+kYNtl2l2jzRMOJZ3ooXyha11nSEJUbeftt1SQ6naLv+k2+gqTayPuRQAZksHYy0J1+GCqsnuznHbOMzyDXLE9c4jMg/yLycQHq63N0qF4qbyaoch7uMcUwMokc5pUjFw0ZuD9CS63KGYZi7dOSgcCW81FLV9PdFkKNhYoqq4KKS+RCWDwP2fp0gWBJzK8iuq9czKKO12WsycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldhe6mXyt4Yy+wmLdH06cpP9vu3CdnnWoXmBLtl3o8E=;
 b=lCYHx1ndk4k5gpDIKnJKdBU2KeXcl5Akg1HCkFmiAZSbx9wEjko3zAxtz889JrGAI2Dl9XZUFVWzhL6klxgEdAN9OuOoJHv3Xa5gYg116Cw30Tq/dfJln1gcL69KMu7Yplpu/V3gmtl/cneP/MlfRzoqQVBKJ/AJJG27rrPhSul4PAWzTmFrxsoFlT5hu5WVkDmZBzaQtiiBOCjV0zP5F/252Itag7Q5rFvr+Tu44igyrE8u0y/jFUUM9qqGAHmBsVbV5e4E5ZF0K9z862o36fPiKAiaqu1MINcsn4AsvB/pi2nUOmBwYL6pcNflO1Qk7dPd/tOn+h/NdqWK/ivncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 16:46:23 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 16:46:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240207103007.665367-4-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-4-luciano.coelho@intel.com>
Subject: Re: [PATCH 3/6] drm/i915/display: use wakelock in register waiting
 functions
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@intel.com>
Date: Tue, 20 Feb 2024 13:46:17 -0300
Message-ID: <170844757726.44184.11571357997726792092@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1d4cc2-1919-4b59-1360-08dc323377cb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yktmgzobRRNOf+qlV+A1aSy7hLv+Wjn8A11cdV6n0Q0eY409qq3xLoaCfrqIX8qCVd6434EwuRxkOKPckxiMDp7hVlvaKLzYfJq3ffiUI0i2akcXYk/phtJnkphZ4O9EATpw9RJ4urohPoEXx45JaEO+Z1GN41sxL1SECWnYN2ihc0NoG61xoj9yE1CbKwVrgCQXziSYm3dMUc3+LvUDW90a7xKoToT/LOxXjy9TiSDLeV/5eyS1H8XcoNux05M3tfd65R2RmtWQHu+WaDNyjCIL6To18KH6AdNOHWdjk7wnG5IPbnLXaL0LEbmKDAyjTrlh7YtDzLoubxM4PPbbdhsgKrQqdOMaNMJ2QapjophetDOfc8ywKRSctrcstW1PRI9WKGAXJdTHz+zDtbAStOLM2OuGf9NRRlRpEEi+bIrWbjcYaQ3eMQ4qFQQ6CRrZjVXbrHyRbzzG+LcDNiUe04bxZ6F/EhI4kuPF91l/Py/fu1qrXdByUTey9bL053ahzHHPBVutJSDm2UImRYgXjytxSyLKpE++1GZqF4OjJx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW5Ocm9ocTJQOEJldmcxMXpITEN6WDg3RElGbjhETUVwaXdyY2lzMERoYnNC?=
 =?utf-8?B?MkVmUlZlYTBIZnorV1FxYWRBK2xkS1lTcEV0cURGVnZGYUFRNExBQ05PMjdo?=
 =?utf-8?B?WmU5TmZHRGh4MXN2R3BHNHhZOTFlbjZ2OWdLNEtuS3F5OWd2dUNRcVV5NE9G?=
 =?utf-8?B?SWZQekE4WDZvTVMrckhjNE5ZbTZvRFo2ak9EKzFjUjh5c3JuTmhqcXRJYVo4?=
 =?utf-8?B?Zm9DTWRORSszM2pOTFRtUnEzL1N3dHR3amdEVC9vVEY4N2xhTWI5ME5YSVFC?=
 =?utf-8?B?Q0piTlZDUGFWUDVjeW5Mb3pvWndBSWFVVG43VVdTOWVMb051YlNDOUp4TTlm?=
 =?utf-8?B?U2pweW5DaVQ5d3hoR1UyUU50MmxZdmYvWWY4TlphTUprQnE1anRXcGUyRTdC?=
 =?utf-8?B?VUlVeTlCb1VKa3VHQk14dHBmSEJiMlRIUTd6cktCMkRMTmYrbG5YWFFmaUph?=
 =?utf-8?B?ZG1NZW01dkx3ZUZZTDl6WXg5MDRQcXlkUkRnWkVRVUYzcHB4cnBtRmNsd21T?=
 =?utf-8?B?NTV3UlQwUjYrRjYwbitPc3hzb0ZWZVZWY1lwNmQyY1YxUStXUzl3dFRTamgz?=
 =?utf-8?B?aTZlVWFUNzQrN0srWTlPKzVkZWRFUzd0VytBc2VjdmVqSEw1dEtIWGYwemQ1?=
 =?utf-8?B?Q0lENmhUejYwMXM5S21kTW01bExNbUN2NW1DOWgyWmpZMnJ0ZWFkWVM5KzV1?=
 =?utf-8?B?NTRkcUJ3YkRhZDdhYUZHTnJRSUZraEZTQmZsNmpPcWg5RmxYZVo0a1ZENFVj?=
 =?utf-8?B?RmRPK1U0eE8rbTRyMWhZR1N1S2VvUGtqYVp2b25CSi9mbDVQZituVUdkMVU0?=
 =?utf-8?B?L3VWVDNYMCtNTTNhMmU1bVpENWxJQUhISUdDd0orNjJoZVhyMmNtWTl3aGJl?=
 =?utf-8?B?c3RkQXhUZWZJTWZ4a2ZDQ2RmQmp5VWdvV09VTUhSVjBSM0lBVm52bU56OTE4?=
 =?utf-8?B?dnZuVUI5YzU3ZmNnUTJha2VxTmw0UlViUkR0Wk8yR05LVTdqamZld0JGK1Zq?=
 =?utf-8?B?bzRuTW5CMTB1NDJUT0hpa3F3QzNVL3RBc3RGQ254SW5La1YzY1BUTVNFZTVR?=
 =?utf-8?B?NlBRdVFnbWpNcEpiTnk3RElmN0ZzQ2x0V0ovSitKc1hpSUFUYkgvWEp2Q09J?=
 =?utf-8?B?WGpPS0lZWGpSOVFoZmY3bmF3UlJHMklQNUxjdUlsU1g0MGRoa1BYaGR3NzlD?=
 =?utf-8?B?dEV4TVMzK0N1T3hlVHdqOGFJQ056ZEptWDA1WnZDNjFvcUxjbVM4dW4xSjht?=
 =?utf-8?B?RDN3bnc3MWFBUWU1bzZuZ0FnemJMMzNqVVQxRGxpUFRNaG5QREZKMGdReldW?=
 =?utf-8?B?U0crTm9oTGQ0QlV5UnpHTE5hcW8zVmJFcWkxaTJFYlVUVkVsTW9NWnM2Smhi?=
 =?utf-8?B?TU1SbjBVSzBsU0gvZEMrMGpQRTZNSHduOSttenZ5czhzVGd3c3ZqQ2RkbTV5?=
 =?utf-8?B?UkNOdWJRTllPRzBEdlFaN3FxQnNoL0dDU29YODg4Q1k3bC9RNFUxT0E1NzUw?=
 =?utf-8?B?RW9McU85NFl3bTRuYUc3WXhNMGd4bWc1L0Z0eVdwRFI0dkZ0NUlvSUtOdVF0?=
 =?utf-8?B?YXB3T1dwMmNVc0NsenBPRm4za3NDUWcvRnNua3RXYTVmREprZ2VVVnRKcENw?=
 =?utf-8?B?TmRWNDhTRytOYStDaDVJYUUvZklJNXRwdUpVdWliRTFLZzloMzdSemg0UThC?=
 =?utf-8?B?Z2E1TWhhRlFNajBjZ0RrYTFDclRvWUc0RXhDek9idCtLWEg5em84NWpQcVhk?=
 =?utf-8?B?WXJmTjJXRUpSSGRlSmk5eFVoUXgyQjJFTzdrU2YrbC9FNFZTNENrN1h1dUlT?=
 =?utf-8?B?L29mTnlFdDFhWkU3TCtIQXJxWlhURkd6dWM0WkQxVWxKa29LbFdCQlR5aGt2?=
 =?utf-8?B?ZVBxbkpHUEwyR2hGODFnTlRHSnl4WStjNEIybVR5NGxLaGtLdGRRZnFqRllJ?=
 =?utf-8?B?MHRrMVRhdEVLekZ0aTBEYTJvTXZWZEFGN0NsbCtnZUtoUlRyMXM0MGpKNklo?=
 =?utf-8?B?NmlDcEpKdHF1RjJlSHFuUFZ6eGNJT3RTNWtFR0pld1NRT0JiY0hnVFNuRzJw?=
 =?utf-8?B?UXQrUmJWdzcyeEowdUJIWjRiSkVSRzZZUUt0Qzc5eC9zdTNCRGdXMTEvYXBp?=
 =?utf-8?B?ekU4QmJTRDE3SVZvN0hTOEExeTFCNlVDeGliYWhYKzVHajJQMEFZeEhnaUVS?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1d4cc2-1919-4b59-1360-08dc323377cb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 16:46:21.6583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDkc4FHCF7S2ghSkXwByCm9VK3OWovBscufYAW8piLVfC1u2gzN4dLxS2GB25Eg8lvJcIgThDtm+DJ6wCdl94Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
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

Quoting Luca Coelho (2024-02-07 07:30:04-03:00)
>Add the wakelock functonality to the functions that help wait for
>register bits to be set.

Same comment goes here and for the next patch regarding the splitting of
the patches.

>
>Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_de.h | 42 ++++++++++++++++++++++---
> 1 file changed, 37 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i91=
5/display/intel_de.h
>index 0bf73b1e1cfe..d8941995808c 100644
>--- a/drivers/gpu/drm/i915/display/intel_de.h
>+++ b/drivers/gpu/drm/i915/display/intel_de.h
>@@ -121,7 +121,15 @@ static inline int
> intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t r=
eg,
>                               u32 mask, u32 value, unsigned int timeout)
> {
>-        return intel_wait_for_register_fw(&i915->uncore, reg, mask, value=
, timeout);
>+        int ret;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        ret =3D intel_wait_for_register_fw(&i915->uncore, reg, mask, valu=
e, timeout);
>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return ret;
> }
>=20
> static inline int
>@@ -130,22 +138,46 @@ __intel_de_wait_for_register(struct drm_i915_private=
 *i915, i915_reg_t reg,
>                              unsigned int fast_timeout_us,
>                              unsigned int slow_timeout_ms, u32 *out_value=
)
> {
>-        return __intel_wait_for_register(&i915->uncore, reg, mask, value,
>-                                         fast_timeout_us, slow_timeout_ms=
, out_value);
>+        int ret;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        ret =3D __intel_wait_for_register(&i915->uncore, reg, mask, value=
,
>+                                        fast_timeout_us, slow_timeout_ms,=
 out_value);
>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return ret;
> }
>=20
> static inline int
> intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t reg,
>                       u32 mask, unsigned int timeout)
> {
>-        return intel_de_wait_for_register(i915, reg, mask, mask, timeout)=
;
>+        int ret;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        ret =3D intel_de_wait_for_register(i915, reg, mask, mask, timeout=
);

The wakelock is already grabbed by intel_de_wait_for_register(), we
could skip it here.

>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return ret;
> }
>=20
> static inline int
> intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
>                         u32 mask, unsigned int timeout)
> {
>-        return intel_de_wait_for_register(i915, reg, mask, 0, timeout);
>+        int ret;
>+
>+        intel_dmc_wl_get(i915, reg);
>+
>+        ret =3D intel_de_wait_for_register(i915, reg, mask, 0, timeout);

The wakelock is already grabbed by intel_de_wait_for_register(), we
could skip it here.

--
Gustavo Sousa

>+
>+        intel_dmc_wl_put(i915, reg);
>+
>+        return ret;
> }
>=20
> /*
>--=20
>2.39.2
>
