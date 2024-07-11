Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ED3C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 16:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A166310EAED;
	Thu, 11 Jul 2024 16:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UI0dGZKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B46E10EAE9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720715079; x=1752251079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9HI8GHwxtIjvlkmwkGQPrYKpc4rjZdDuazl0WOnFAz4=;
 b=UI0dGZKDLr7NL1JGzpEW5Wae8E961pgIRdv7Vm/3aNFANDi6bPxZGk9c
 I3NV7LiEVKzoLoG/FO98bHTozPBpE8sWaqcTU0Ghxagminc/DVALJiilh
 a32xsUFws2Q+zpb4iWvZNWcXRuJ/pHnkaZy7QNaa5iLtmA2DaK7tarezX
 uRd8kDmxkCULsurDhQh0bBT61OKbYuZt6pji9omgVVKsENDh3h5Z2wv0v
 lje1VItUQvKw294FPlE4Vnzvxt9tCWl+idZDwLUfNrpg7nJ57PHd1DBaC
 181/wb4YZFTtROHOBGZKEQFKap40JYU8PWPbCnblkm/en9jL8MFmwZnjg w==;
X-CSE-ConnectionGUID: Yd7WSFJZRhe5BgFhkiDF7Q==
X-CSE-MsgGUID: baqj9mfIQauHfbKASRazUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18317201"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18317201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 09:24:39 -0700
X-CSE-ConnectionGUID: t9fkesPSStaYsDtpHXl6Ew==
X-CSE-MsgGUID: kXNk9ecETX+p8dhN5Gj1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53209086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 09:24:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 09:24:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 09:24:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 09:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIl1F3+lJUz4/P7tArCJMjH2L7i4AHMkm1YD9R3qKZcOQM4ox9AK1BRFTIXmlkUgpxn07luP2uoUIKh4yBoodLoSmr8xdNQqw6Jsz0NJyPcqMgjoozd3AyHx86bGZuMvlPaGc19OfhBXEyxmnqTRZPR/oifNsdKLZ0Gip766yDbEKWmZT1FetE/DC5o1aI4qRLpI8atT/jUkhH8r9feTfXBCJvkkZZgE4vz3gqLcsl4QgI+VkvZ0LtoMWExztzGoGKuOq1JJs/Vp0Rxm1js8sAOkL8QbRXvm/yqVm7m7LVsPsp7AB+1cJwAD8Aky9XpzqmGnnUtMT3p6jdklULop8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HI8GHwxtIjvlkmwkGQPrYKpc4rjZdDuazl0WOnFAz4=;
 b=lbzETuKeszO87uXKOaAnXJdNh8dnOMdw1h8lUWGfO1lpYTRw4k54pWXcVyP0mCGjgkadrRqQGUxmtEtTO2MQsiUjom1lZNCZoGdR6VVhdKG+4uTk/VTItYlGWKZ2ocMU2HfmyC9q225FKjwMjPhlJKG2qgfefTTfIyTeSlK28Ewu5QqZr/IXx1WvWRPC+0Qt2uYqx25ekWeJlTce5cD7uydiuBkx/f5zG+CZ1TAPAAlKFDVvKUhuj4SkYTLgIZ2LcPittSc3INh+nXmJQK58BVdP+NLlqveSpdmjHD8uxAl6Y7VIuqfqMmEwz44mGce7lomtaO3DRhBmy+SLAK+vPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Thu, 11 Jul
 2024 16:24:35 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 16:24:35 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Thread-Topic: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Thread-Index: AQHa0xU88S41YaOgL0W9i1Ee+SQfErHxt3QA
Date: Thu, 11 Jul 2024 16:24:35 +0000
Message-ID: <6230bfbed4f289cb328f3b1ad605915bd89e0c7b.camel@intel.com>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
In-Reply-To: <20240710220446.2169797-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6365:EE_
x-ms-office365-filtering-correlation-id: dc5685e6-42a5-4919-ba88-08dca1c5f3fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZjhMTWkzTnp6bm1UZGYrb253YUZ5UEpGdWxTYkE2dnBId3JGbitpQnVKWlY1?=
 =?utf-8?B?RytXakttcE56QXpPTndzSlVjRm0za3Y3aXVjckxvZE90V25IaVg4M3g1UDNq?=
 =?utf-8?B?OEF2cDFwNjdvYytUVUlMRStWK3ZKUUhnQ1pMUUFTZkVUOWJ3U1hBb1pWSTVa?=
 =?utf-8?B?SHRnTW0yR1Z5c3ZyelVGdXE0U0JZNCt0TTBxeTZuWm5QVFV0b0U1OWdXK2R0?=
 =?utf-8?B?TlRiODNFVUkzOE9jZitwc1QwemxhMUhQc1NqNTUwTHJLblAwOUdIWVYxL3FV?=
 =?utf-8?B?TS9LV0t1TmdrV3pIMFRtc2ZUNkY3WnVkNUFxWndTVzFVdEY4UHFiS08vYXlx?=
 =?utf-8?B?cFZnbDZMSDZwOGpKc1IyQ2huMndTRThIR2lxcStibVI4d21JVlF5bGc1bXhq?=
 =?utf-8?B?TFpOWWVTZytyYTVDc0Y4OW9MMVMrbFRrd01VNTNxUWgxZHdhQUJjemY3TUJz?=
 =?utf-8?B?bW9CdnVYSml6YWROSW9jZnJLMHdRQUtHZ0cxSGZJajE1ZGdMT0taL1hQclhW?=
 =?utf-8?B?Q3BXUkxyQ250TGtiRVBhNWNZbXR6cFMxUGVCa2krbnN0NjJSZjFXL1g5Q3FS?=
 =?utf-8?B?UjNnUjR2NlRXbWFtdmRsVjFkWXM5cHNzVUNMaGMvbkJzM0I3SWZqcDhZNHIz?=
 =?utf-8?B?dlM3amtVa290UEpWajRFVVlKMjAvSFhhTE9oOXhUeTJIQVZDSTU4REhSQ2ZR?=
 =?utf-8?B?MHA4aFlsVzA4aE9zNS9WSWJHb0N5Vi92T0NUa05MWGVhaUxNUWMweGU5SGFX?=
 =?utf-8?B?UkJ1LzRaUkN0V0E2c1FqRVR4Z0c1UlFnWW10KytxUDhNUGdvL2grQU5wSzNO?=
 =?utf-8?B?OFJkdzY5Vmp4Ykh3ZzJTa0poenJhRkQ5OHVRQzVQNnVtS2w0Vzg0aEF4OXBT?=
 =?utf-8?B?ZzhQRmlidWgxTHBOT0lEVC9CeHhaQzJBdEROT1phSHhacDRsZXQ0QzJid3FV?=
 =?utf-8?B?amp2SmEyNlBQUENLa0dKajJTbE5WTC8waTltSkhJOWtYWGN5Yms2YXppQWdW?=
 =?utf-8?B?bzhobWJ0STNydXRTUkNJbW9id0lDSUlkeURwY1hmR0M0c21xSmRpSk4zZEpU?=
 =?utf-8?B?djdYSXB3dzJRRS9adXI2QnovRkFYMG8wOHR6dTJGZGZuK043SWhveTNaME9y?=
 =?utf-8?B?VndiR1J2WVJhNXEzbXBUWW01RndLa2MremFLR2t3Ri9EajgvS3Q1aWEwaU9x?=
 =?utf-8?B?Z2g2bXQ4QkNVaFpuUlFieTVKRjY2b3ZIN2c1WG9EK3RYNkxET0dIcEFQQy9L?=
 =?utf-8?B?dkpwNjdLNStYKytsTmtoK2Z3U3F5RTNMaElpS1dpeG1Td0pPR3NiMGZGSGl1?=
 =?utf-8?B?Vm5Ob3BkMDVOUER4N0UyT0ZOTUJUcjdJU1VmS0s5Z1duakVSOGtmbDZYekVr?=
 =?utf-8?B?WDZ3MXRsTVBqamJhNmdyUjZ1cGM1eUZNOUZYWCttWVFobGQrejFqWVNIMytk?=
 =?utf-8?B?bU1TQzVTQ1BaNFhvZ2I4OFlpa1ZaSURwb3oxdy8yZlE0MHJlNlJVMXNHdzY1?=
 =?utf-8?B?dGF0T3VOME82YytIR2EwaEc0NTU3MjE5ckJMa0l1ckNyRzBWK0FtUk9wWUYz?=
 =?utf-8?B?VGpZdGluZjZFeml6Z3cxbGpPNmtnOWl2dWZ0alNwY1ZNSnJzMURVZEMwNUI4?=
 =?utf-8?B?R1h5SWszdWhNNytVZ3BicUZoSHJVUndDK1V4VEtRVDFuc1BNRkE4QTU4MzI5?=
 =?utf-8?B?Q25uUnVkMGFCRFZIaWZYM3k0Q3NDRVl0T080Z1NleDdRanRzZHo2WWNNVmYv?=
 =?utf-8?B?ZHlIclBuV1V0RnVuVkUzc1ljZSs0MjI3R2ZJbitVdkJIaDMxdWdtSUxRNkU4?=
 =?utf-8?Q?HFP2Sob+XzFjL8TzeuOCft6lyysFWXEtXUWb8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGJYOThmd3g3NjN4WSs4WjgzaC9Db3pZYWg4ZHNXWDRrL1Z5OGtCL3B3YWhO?=
 =?utf-8?B?Wk01bTduY2VGUFYzaDVKYjVUVlBqWmMzdExZZ1NYNm8vRzNsNERjc2dwTlZV?=
 =?utf-8?B?Z2U1YThzK25yV01qSTMzL2V2Sm1TRzZCcWcxQjZTaVk4SGlkejVXaGozZ3M2?=
 =?utf-8?B?a3h0Ujgya2hkUjB6T2xicFlZa0hidytHd2VPSEl1dG9FRTNaYjBnaDJsRklh?=
 =?utf-8?B?eWZQcVEvMm9mSjJJa2FXVHo4R2daOUVnaThrWXpkRXVIaG92eHhYenJZeU00?=
 =?utf-8?B?bXV2K0pVNlhvM21PWVd4T203Lzd4V3VUR04wS1ozWEM1NFVsRXkzamg2MGNX?=
 =?utf-8?B?U3JCUVB5TkpmRmNLRHVyNjdSR0xHRDgvRk85Q283VDlmZkRTaG1vVUZIN1hl?=
 =?utf-8?B?ODByRnp4YjNyUFF3RUZmUlF6OEtDK2Z3SVpYZUJ0QVJzc1hXQXFSS1hGdDlr?=
 =?utf-8?B?MEJqT0JkRmVDcTB1Uk00cnk0cWNvWVhCa29RL0lYdXFlRDQ1cFExbDZxTlJM?=
 =?utf-8?B?aTNQUE1ONldxWnhnbEFoQmkyUkQwRCt4ek92QVE1VTlBR2JqTjQzV1JmZWdl?=
 =?utf-8?B?S0tUSHBqL3NkVEpwZFZFNDg3QmhYZ21qQm5seENsZVBuKzkxUk9zU2p4bVYy?=
 =?utf-8?B?M01GUnNNajNKditIbVFKT2hMNGtEa3p6b3BiREdzOUVxN3FTeFBMdmpTeVl0?=
 =?utf-8?B?SkNHcm1RZHhVd2prYkhPeGJsRDVIN01kbFpDRXlZQW1iQU1UK28zOVVJV0pY?=
 =?utf-8?B?SUtvd1VKZjliVVVkV2I4QnFYWjlYMnpFT2ZQQjd6K3FVNTI4Q0g4UGp5bnc2?=
 =?utf-8?B?aWNDa3JRSGF2em5Ba3UrR1o3WE5HZnQ5MDB3Sm13Yk9pbVAxZWI4bHF1VTJH?=
 =?utf-8?B?emZDZGJFV3M3QlVRSk5paGF4cWJ1MHg5UGkrb1V2YVVCUzdyRzBiY1Z2aW5h?=
 =?utf-8?B?K3FuYjJ1bDkwdCtKWlo5OE1KZFJ3ZkVXZEwzZWhjbmZ4MHc2aE16dzVjcU9k?=
 =?utf-8?B?dVNXOVNjaXRjc2JCYzdMUytPanpIL0o4QlNjdUczUkFlanZFbXM5a1lZK3Fk?=
 =?utf-8?B?Wnp2dHJuZStXRVZSdVZQOEkzRzh0ZjBOWlZRb1Y2Q1J6NWpNWFJSN09GZ1FH?=
 =?utf-8?B?SmlkaStWTy9VTmZQZFh1MUlteVVIYXJjajVHemwrWnBKbG1YdEcrekliY0wz?=
 =?utf-8?B?M1FIL2ptTU5TYnVXRHJ0Yk1JaHIrckR4N3VlYnZCU0RJQlJqVnBVeVRSYi9h?=
 =?utf-8?B?Qms5L0U3Zk5tdGhHS1lTbkxOV0hob1N2b1UwTlBUQ1BmSFNWNCsvQXFDdktr?=
 =?utf-8?B?KzVVaEdPQk9HUFpTNmF2K2RyOEpBSlZhelpEcTlNZlhZaXMwRlVQYyttcHk1?=
 =?utf-8?B?eWM5NmFwZ2NYQjFJVllBRlNidkJZY2ZHL1c0Z29VQk43K3pZYTk5VE85cGZp?=
 =?utf-8?B?eXIwODJ5bnhteUFZWmcyMHdRbytiay9Cc3Z5SEo0cE8wMkY4YlJFU0w3d0FC?=
 =?utf-8?B?UE5Wc3kyaTJEUCtkR0xYRkJzWHhJc3B4a1Y4QkNhOXc2Tjc3R1NQVGY5dDZJ?=
 =?utf-8?B?NmRjRjdabERZVEsrZEYzcHhJUnhlaHB3aXdxTURIbTRZREJzQnZ4OGJzLzNo?=
 =?utf-8?B?WVM3clNUUmNkMDhaRXpMSGdpUDZnR3Nhak5UaFRURTM0bHh2NHpWVGhZaWRz?=
 =?utf-8?B?RFViQ0ZkR2drSWI1OEZMeXNBK3o5U2tZS1dlT0hxR1c4eDVLaENTcFBJV2RN?=
 =?utf-8?B?bXhNNWVmSXlJN2tsM25YSWVxeUNGaHFrUXRuWit6T1JvWUFNRjV2ajFlMjc3?=
 =?utf-8?B?YzBWVUUwbGlla3NEUUV3QnZCNkZ3dGF0WXBVMTFOSG9tbkpSb3BlTXpzOVpi?=
 =?utf-8?B?bWV0blZRV29SOGpOa0NSV1FiNVU4YkNmUjdJNEkvZm9yZVM1KzlHTklUYlBi?=
 =?utf-8?B?U1g2dEFaQWVUL3JPQ1Nkc1ZIS01HTkU3OXQ0eTlIdENOU3ZwVXp3VnpGdXR1?=
 =?utf-8?B?OVRUMERjZ3pxRjFFRlBIZ1VOVFBmRjJCbVcyeXgzUER0czE0eFRKUFo1d204?=
 =?utf-8?B?bC9LYndqc1g2QVlVaFZWdFBpL09xWk8xbnhpWDlSZGh0ZWZNdkwrckhUWndK?=
 =?utf-8?B?Tk8zdHhhQ3F0V1dIR3FpQmVJKzJ4NElJOUt5NmZRWXFNSjhrbGp0VWhjV0h3?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3158D487396124996936E5BB69246CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5685e6-42a5-4919-ba88-08dca1c5f3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 16:24:35.3107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UbMPFfwZGIDQoi8AQ2k+8WfmdLHI266hYxCEQjH40NpMsmvTr1qMOC+jL3Ney0Qmuz6B7qEw1AfABA2VGRlhyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

T24gV2VkLCAyMDI0LTA3LTEwIGF0IDE1OjAyIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IFBWQywgWGUyIGFuZCBsYXRlciBwbGF0Zm9ybXMgaGF2ZSAxNi13aWRlIEVVcy4gV2Ugd2Vy
ZSBpbXBsaWNpdGx5DQo+IHJlcG9ydGluZyBmb3IgUFZDIHRoZSBudW1iZXIgb2YgMTYtd2lkZSBF
VXMgd2l0aG91dCBnaXZpbmcgdXNlcnNwYWNlIGFueQ0KPiBoaW50IHRoYXQgdGhleSB3ZXJlIGRp
ZmZlcmVudCB0aGFuIGZvciBvdGhlciBwbGF0Zm9ybXMuIFhlMiBhbmQgbGF0ZXINCj4gYWxzbyBo
YXZlIDE2LXdpZGUsIGJ1dCBpbiB0aG9zZSBjYXNlcyB0aGUgcmVwb3J0ZWQgbnVtYmVyIHdvdWxk
DQo+IGNvcnJlc3BvbmQgdG8gdGhlIDgtd2lkZSBjb3VudC4NCj4gDQo+IFRvIGF2b2lkIGNvbmZ1
c2lvbiBhbmQgbWFrZSBzdXJlIHRoZSByaWdodCBudW1iZXIgaXMgdXNlZCBieSB1c2Vyc3BhY2UN
Cj4gZGVwZW5kaW5nIG9uIHRoZSBwbGF0Zm9ybSwgYWRkIGEgbmV3IGl0ZW0gdG8gdGhlIHRvcG9s
b2d5IHF1ZXJ5IGFuZCBkcm9wDQo+IHRoZSBvbmUgdGhhdCBpcyBub3QgYXZhaWxhYmxlLiBUaGUg
bmV3IG1hc2sgcmVwb3J0ZWQgZm9yIGJvdGggUFZDIGFuZA0KPiBYZTIgc2hvdWxkIG5vdyBtYXRj
aCB0aGUgbnVtYmVycyByZXBvcnRlZCB2aWEgaHdjb25maWcuDQo+IA0KPiB2MjogVXNlIGEgZGlm
ZmVyZW50IHRvcG8gaXRlbSB3aXRoIEVVIHR5cGUgaW4gaXRzIG5hbWUgdG8gcmVwb3J0IHRoZQ0K
PiAgICAgbmV3IG1hc2sgaW5zdGVhZCBvZiBhZGRpbmcgdGhlIHR5cGUgaXRzZWxmIGFzIHRoZSBp
dGVtIChNYXR0IFJvcGVyKQ0KDQpNZXNhIE1SOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvbWVzYS9tZXNhLy0vbWVyZ2VfcmVxdWVzdHMvMzAxMjcNCg0KQWNrZWQtYnk6IEpvc8OpIFJv
YmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+
IA0KPiBUZXN0ZWQgb24gTE5MIHRvIGNoZWNrIHRoZSBiZWhhdmlvciBpbiBkbWVzZywgZGVidWdm
cyBhbmQgaW9jdGwuDQo+IFRlc3Qtd2l0aDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaWd0LWRl
di8yMDI0MDcxMDIyMDA1MC4yMTY5NTk2LTEtbHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tLw0KPiAN
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90b3BvbG9neS5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCAgICB8
IDExICsrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyAgICAgICB8
ICA0ICsrKy0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAgICAgIHwgMTAgKysr
KysrKysrLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90b3BvbG9n
eS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gaW5kZXggMjVmZjAz
YWI4NDQ4Li41YTE1NTllZGYzZTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90b3BvbG9neS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90b3BvbG9n
eS5jDQo+IEBAIC02LDYgKzYsNyBAQA0KPiAgI2luY2x1ZGUgInhlX2d0X3RvcG9sb2d5LmgiDQo+
ICANCj4gICNpbmNsdWRlIDxsaW51eC9iaXRtYXAuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9jb21w
aWxlci5oPg0KPiAgDQo+ICAjaW5jbHVkZSAicmVncy94ZV9ndF9yZWdzLmgiDQo+ICAjaW5jbHVk
ZSAieGVfYXNzZXJ0LmgiDQo+IEBAIC0zMSw3ICszMiw3IEBAIGxvYWRfZHNzX21hc2soc3RydWN0
IHhlX2d0ICpndCwgeGVfZHNzX21hc2tfdCBtYXNrLCBpbnQgbnVtcmVncywgLi4uKQ0KPiAgfQ0K
PiAgDQo+ICBzdGF0aWMgdm9pZA0KPiAtbG9hZF9ldV9tYXNrKHN0cnVjdCB4ZV9ndCAqZ3QsIHhl
X2V1X21hc2tfdCBtYXNrKQ0KPiArbG9hZF9ldV9tYXNrKHN0cnVjdCB4ZV9ndCAqZ3QsIHhlX2V1
X21hc2tfdCBtYXNrLCBlbnVtIHhlX2d0X2V1X3R5cGUgKmV1X3R5cGUpDQo+ICB7DQo+ICAJc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7DQo+ICAJdTMyIHJlZ192YWwgPSB4ZV9t
bWlvX3JlYWQzMihndCwgWEVMUF9FVV9FTkFCTEUpOw0KPiBAQCAtNDcsMTEgKzQ4LDEzIEBAIGxv
YWRfZXVfbWFzayhzdHJ1Y3QgeGVfZ3QgKmd0LCB4ZV9ldV9tYXNrX3QgbWFzaykNCj4gIAlpZiAo
R1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPCAxMjUwKQ0KPiAgCQlyZWdfdmFsID0gfnJlZ192YWwgJiBY
RUxQX0VVX01BU0s7DQo+ICANCj4gLQkvKiBPbiBQVkMsIG9uZSBiaXQgPSBvbmUgRVUgKi8NCj4g
LQlpZiAoR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPT0gMTI2MCkgew0KPiArCWlmIChHUkFQSElDU19W
RVJ4MTAwKHhlKSA9PSAxMjYwIHx8IEdSQVBISUNTX1ZFUih4ZSkgPj0gMjApIHsNCj4gKwkJLyog
U0lNRDE2IEVVcywgb25lIGJpdCA9PSBvbmUgRVUgKi8NCj4gKwkJKmV1X3R5cGUgPSBYRV9HVF9F
VV9UWVBFX1NJTUQxNjsNCj4gIAkJdmFsID0gcmVnX3ZhbDsNCj4gIAl9IGVsc2Ugew0KPiAtCQkv
KiBBbGwgb3RoZXIgcGxhdGZvcm1zLCBvbmUgYml0ID0gMiBFVSAqLw0KPiArCQkvKiBTSU1EOCBF
VXMsIG9uZSBiaXQgPT0gMiBFVSAqLw0KPiArCQkqZXVfdHlwZSA9IFhFX0dUX0VVX1RZUEVfU0lN
RDg7DQo+ICAJCWZvciAoaSA9IDA7IGkgPCBmbHMocmVnX3ZhbCk7IGkrKykNCj4gIAkJCWlmIChy
ZWdfdmFsICYgQklUKGkpKQ0KPiAgCQkJCXZhbCB8PSAweDMgPDwgMiAqIGk7DQo+IEBAIC0yMTMs
NyArMjE2LDcgQEAgeGVfZ3RfdG9wb2xvZ3lfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiAgCQkg
ICAgICBYRUhQX0dUX0NPTVBVVEVfRFNTX0VOQUJMRSwNCj4gIAkJICAgICAgWEVIUENfR1RfQ09N
UFVURV9EU1NfRU5BQkxFX0VYVCwNCj4gIAkJICAgICAgWEUyX0dUX0NPTVBVVEVfRFNTXzIpOw0K
PiAtCWxvYWRfZXVfbWFzayhndCwgZ3QtPmZ1c2VfdG9wby5ldV9tYXNrX3Blcl9kc3MpOw0KPiAr
CWxvYWRfZXVfbWFzayhndCwgZ3QtPmZ1c2VfdG9wby5ldV9tYXNrX3Blcl9kc3MsICZndC0+ZnVz
ZV90b3BvLmV1X3R5cGUpOw0KPiAgCWxvYWRfbDNfYmFua19tYXNrKGd0LCBndC0+ZnVzZV90b3Bv
LmwzX2JhbmtfbWFzayk7DQo+ICANCj4gIAlwID0gZHJtX2RiZ19wcmludGVyKCZndF90b194ZShn
dCktPmRybSwgRFJNX1VUX0RSSVZFUiwgIkdUIHRvcG9sb2d5Iik7DQo+IEBAIC0yMjEsNiArMjI0
LDE4IEBAIHhlX2d0X3RvcG9sb2d5X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gIAl4ZV9ndF90
b3BvbG9neV9kdW1wKGd0LCAmcCk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBjb25zdCBjaGFyICpl
dV90eXBlX3RvX3N0cihlbnVtIHhlX2d0X2V1X3R5cGUgZXVfdHlwZSkNCj4gK3sNCj4gKwlzd2l0
Y2ggKGV1X3R5cGUpIHsNCj4gKwljYXNlIFhFX0dUX0VVX1RZUEVfU0lNRDE2Og0KPiArCQlyZXR1
cm4gInNpbWQxNiI7DQo+ICsJY2FzZSBYRV9HVF9FVV9UWVBFX1NJTUQ4Og0KPiArCQlyZXR1cm4g
InNpbWQ4IjsNCj4gKwl9DQo+ICsNCj4gKwl1bnJlYWNoYWJsZSgpOw0KPiArfQ0KPiArDQo+ICB2
b2lkDQo+ICB4ZV9ndF90b3BvbG9neV9kdW1wKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBkcm1f
cHJpbnRlciAqcCkNCj4gIHsNCj4gQEAgLTIzMSw2ICsyNDYsOCBAQCB4ZV9ndF90b3BvbG9neV9k
dW1wKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCkNCj4gIA0KPiAgCWRy
bV9wcmludGYocCwgIkVVIG1hc2sgcGVyIERTUzogICAgICUqcGJcbiIsIFhFX01BWF9FVV9GVVNF
X0JJVFMsDQo+ICAJCSAgIGd0LT5mdXNlX3RvcG8uZXVfbWFza19wZXJfZHNzKTsNCj4gKwlkcm1f
cHJpbnRmKHAsICJFVSB0eXBlOiAgICAgICAgICAgICAlc1xuIiwNCj4gKwkJICAgZXVfdHlwZV90
b19zdHIoZ3QtPmZ1c2VfdG9wby5ldV90eXBlKSk7DQo+ICANCj4gIAlkcm1fcHJpbnRmKHAsICJM
MyBiYW5rIG1hc2s6ICAgICAgICAlKnBiXG4iLCBYRV9NQVhfTDNfQkFOS19NQVNLX0JJVFMsDQo+
ICAJCSAgIGd0LT5mdXNlX3RvcG8ubDNfYmFua19tYXNrKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5
cGVzLmgNCj4gaW5kZXggNmI1ZTBiNDVlZmIwLi4wMWVhODdkODg4NmIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90eXBlcy5oDQo+IEBAIC0yNyw2ICsyNywxMSBAQCBlbnVtIHhlX2d0X3R5cGUg
ew0KPiAgCVhFX0dUX1RZUEVfTUVESUEsDQo+ICB9Ow0KPiAgDQo+ICtlbnVtIHhlX2d0X2V1X3R5
cGUgew0KPiArCVhFX0dUX0VVX1RZUEVfU0lNRDgsDQo+ICsJWEVfR1RfRVVfVFlQRV9TSU1EMTYs
DQo+ICt9Ow0KPiArDQo+ICAjZGVmaW5lIFhFX01BWF9EU1NfRlVTRV9SRUdTCQkzDQo+ICAjZGVm
aW5lIFhFX01BWF9EU1NfRlVTRV9CSVRTCQkoMzIgKiBYRV9NQVhfRFNTX0ZVU0VfUkVHUykNCj4g
ICNkZWZpbmUgWEVfTUFYX0VVX0ZVU0VfUkVHUwkJMQ0KPiBAQCAtMzQzLDYgKzM0OCwxMiBAQCBz
dHJ1Y3QgeGVfZ3Qgew0KPiAgDQo+ICAJCS8qKiBAZnVzZV90b3BvLmwzX2JhbmtfbWFzazogTDMg
YmFuayBtYXNrICovDQo+ICAJCXhlX2wzX2JhbmtfbWFza190IGwzX2JhbmtfbWFzazsNCj4gKw0K
PiArCQkvKioNCj4gKwkJICogQGZ1c2VfdGlwby5ldV90eXBlOiB0eXBlL3dpZHRoIG9mIEVVIHN0
b3JlZCBpbg0KPiArCQkgKiBmdXNlX3RvcG8uZXVfbWFza19wZXJfZHNzDQo+ICsJCSAqLw0KPiAr
CQllbnVtIHhlX2d0X2V1X3R5cGUgZXVfdHlwZTsNCj4gIAl9IGZ1c2VfdG9wbzsNCj4gIA0KPiAg
CS8qKiBAc3RlZXJpbmc6IHJlZ2lzdGVyIHN0ZWVyaW5nIGZvciBpbmRpdmlkdWFsIEhXIHVuaXRz
ICovDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDRlMDFkZjZiMWI3YS4uNzNlZjZlNGMy
ZGM5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtNTE4LDcgKzUxOCw5IEBAIHN0
YXRpYyBpbnQgcXVlcnlfZ3RfdG9wb2xvZ3koc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJCWlm
IChlcnIpDQo+ICAJCQlyZXR1cm4gZXJyOw0KPiAgDQo+IC0JCXRvcG8udHlwZSA9IERSTV9YRV9U
T1BPX0VVX1BFUl9EU1M7DQo+ICsJCXRvcG8udHlwZSA9IGd0LT5mdXNlX3RvcG8uZXVfdHlwZSA9
PSBYRV9HVF9FVV9UWVBFX1NJTUQxNiA/DQo+ICsJCQlEUk1fWEVfVE9QT19TSU1EMTZfRVVfUEVS
X0RTUyA6DQo+ICsJCQlEUk1fWEVfVE9QT19FVV9QRVJfRFNTOw0KPiAgCQllcnIgPSBjb3B5X21h
c2soJnF1ZXJ5X3B0ciwgJnRvcG8sDQo+ICAJCQkJZ3QtPmZ1c2VfdG9wby5ldV9tYXNrX3Blcl9k
c3MsDQo+ICAJCQkJc2l6ZW9mKGd0LT5mdXNlX3RvcG8uZXVfbWFza19wZXJfZHNzKSk7DQo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94
ZV9kcm0uaA0KPiBpbmRleCAxOTYxOWQ0OTUyYTguLjI5NDI1ZDdmZGM3NyAxMDA2NDQNCj4gLS0t
IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oDQo+IEBAIC01MTcsNyArNTE3LDE0IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZ3RfbGlz
dCB7DQo+ICAgKiAgICBhdmFpbGFibGUgcGVyIER1YWwgU3ViIFNsaWNlcyAoRFNTKS4gRm9yIGV4
YW1wbGUgYSBxdWVyeSByZXNwb25zZQ0KPiAgICogICAgY29udGFpbmluZyB0aGUgZm9sbG93aW5n
IGluIG1hc2s6DQo+ICAgKiAgICBgYEVVX1BFUl9EU1MgICAgZmYgZmYgMDAgMDAgMDAgMDAgMDAg
MDBgYA0KPiAtICogICAgbWVhbnMgZWFjaCBEU1MgaGFzIDE2IEVVLg0KPiArICogICAgbWVhbnMg
ZWFjaCBEU1MgaGFzIDE2IFNJTUQ4IEVVcy4gVGhpcyB0eXBlIG1heSBiZSBvbWl0dGVkIGlmIGRl
dmljZQ0KPiArICogICAgZG9lc24ndCBoYXZlIFNJTUQ4IEVVcy4NCj4gKyAqICAtICVEUk1fWEVf
VE9QT19TSU1EMTZfRVVfUEVSX0RTUyAtIFRvIHF1ZXJ5IHRoZSBtYXNrIG9mIFNJTUQxNiBFeGVj
dXRpb24NCj4gKyAqICAgIFVuaXRzIChFVSkgYXZhaWxhYmxlIHBlciBEdWFsIFN1YiBTbGljZXMg
KERTUykuIEZvciBleGFtcGxlIGEgcXVlcnkNCj4gKyAqICAgIHJlc3BvbnNlIGNvbnRhaW5pbmcg
dGhlIGZvbGxvd2luZyBpbiBtYXNrOg0KPiArICogICAgYGBTSU1EMTZfRVVfUEVSX0RTUyAgICBm
ZiBmZiAwMCAwMCAwMCAwMCAwMCAwMGBgDQo+ICsgKiAgICBtZWFucyBlYWNoIERTUyBoYXMgMTYg
U0lNRDE2IEVVcy4gVGhpcyB0eXBlIG1heSBiZSBvbWl0dGVkIGlmIGRldmljZQ0KPiArICogICAg
ZG9lc24ndCBoYXZlIFNJTUQxNiBFVXMuDQo+ICAgKi8NCj4gIHN0cnVjdCBkcm1feGVfcXVlcnlf
dG9wb2xvZ3lfbWFzayB7DQo+ICAJLyoqIEBndF9pZDogR1QgSUQgdGhlIG1hc2sgaXMgYXNzb2Np
YXRlZCB3aXRoICovDQo+IEBAIC01MjcsNiArNTM0LDcgQEAgc3RydWN0IGRybV94ZV9xdWVyeV90
b3BvbG9neV9tYXNrIHsNCj4gICNkZWZpbmUgRFJNX1hFX1RPUE9fRFNTX0NPTVBVVEUJCTINCj4g
ICNkZWZpbmUgRFJNX1hFX1RPUE9fTDNfQkFOSwkJMw0KPiAgI2RlZmluZSBEUk1fWEVfVE9QT19F
VV9QRVJfRFNTCQk0DQo+ICsjZGVmaW5lIERSTV9YRV9UT1BPX1NJTUQxNl9FVV9QRVJfRFNTCTUN
Cj4gIAkvKiogQHR5cGU6IHR5cGUgb2YgbWFzayAqLw0KPiAgCV9fdTE2IHR5cGU7DQo+ICANCg0K
