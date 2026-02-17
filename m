Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FD6E9A03B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 23:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB90E10E2AF;
	Tue, 17 Feb 2026 23:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dqfp+4s4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980CD10E2AF
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771369997; x=1802905997;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cD1yKDV7Qphn0Vb0Nnptb8w4HbVhgQzWO8AiSzhL4ro=;
 b=Dqfp+4s4egqZD89Cicd4GllbjSYA5UuRukugvHF+zY+kIqHt3Prd/92N
 b7+By4zcQcY0Vr5u2VdIqrtT2TVg3KgRhXS71S0b/kj8Iu2YKIBytp1Qy
 gQKZWT/8IIZwJ+3g0+m7+dQTFaWYjz3lW6U/Sp1GIzjRe7FXLZyQOs7z0
 i2s65hbRoiSBQcAJlnJaNplzBIpDn69uslFpMAqMzaiY9/l6wbfkAw+/8
 lZUXVkgj0P6v12EVshzZBP3TyFXbHgFtva1rGvO7asujqGLxW85wgSqyh
 hWgqRmWDaUEkjAuI/PG5wS9sLBaKHqYzpoNetO8P5aS8wO9nxvU31bXSo Q==;
X-CSE-ConnectionGUID: Nsb7Q9ZxSgS5Filq3OJzeA==
X-CSE-MsgGUID: yPEC/OWLS1+cH33/BmsRAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76310663"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="76310663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 15:13:17 -0800
X-CSE-ConnectionGUID: Vpa9iPA6Qkm0jCI+8Ux+SQ==
X-CSE-MsgGUID: +IClb4jQTie/q09rXmBiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="218564400"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 15:13:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 15:13:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 15:13:16 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 15:13:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUYBSyXzng6/OvGixGKAd0pAwMCMATP/vN3noTTfZj8NM8bDTBqCPJ3NKZFZlcTZ7iKSxiYJ9rbAj6EHu/MiG2j99tkWNbXE7oh7YV6NZ042gZhlos+U5DySPH8qA6GO30jHRKK9PL4R6kV4VCfHSvWW27Zx9ai9anhGdKpNq3gre+kMadMzN/IsPMcKUGFtJNu6Mt3surdNHrEBviR+Y1Cmr6x+U1Xhty2hj3tNl7J4xsK5a/N3sZLoZRSczny+qg5wcXICp+mR6OHi1w9zTCgkV4eKX8VUJaxY39OU2wffCPH7ShGPWwPkIYW/KP59mewKvSPwTvEQFWHh+k/ksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cD1yKDV7Qphn0Vb0Nnptb8w4HbVhgQzWO8AiSzhL4ro=;
 b=sIgZI9YNKm9Lu8MWSf97phX8+uXE5enEnwu6GBFdP28nEI/YWqpcw8uUyfngswp1w+taX7gzOsz4cEDHicfpGTiRP6ti8/NAVSQF/i6elY9ly1oIb8vgv/kuirNd2bOnT0oKLpUnA8Yt1xTCEO9sr8WZ8tIRWUb6F3JjLRkIYnUuFQ2RJKsQkSEOt5wb7NUimmndMfvtX+tIlq0LqQeyJEezF7H/EaxIF92pnke3wLpUbfDnAqcbwYI6PiV2hhegBFkzvOKYnP0+Qmr97eUCFsbPuT93wR9Fsy/5XVFy0mOa1ShIqmCT62MGj48Y5oWBtG13iTSjLiloXlZCq0HmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.13; Tue, 17 Feb 2026 23:13:14 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 23:13:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Convert GT stats to per-cpu counters
Thread-Topic: [PATCH] drm/xe: Convert GT stats to per-cpu counters
Thread-Index: AQHcoEjkClAqXYaqwk29MsEliVqIX7WHhWaA
Date: Tue, 17 Feb 2026 23:13:14 +0000
Message-ID: <874e96d6cad9793ae5f8d7cd8657cd1bb923a92c.camel@intel.com>
References: <20260217200552.596718-1-matthew.brost@intel.com>
In-Reply-To: <20260217200552.596718-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW3PR11MB4620:EE_
x-ms-office365-filtering-correlation-id: 01616890-70b2-446d-3336-08de6e7a2098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MGNqREVuaFBKV1dnTXpQb0NkaEoxZU8zT0dTOGlmcm1iaDlvZW1TaFRCczNi?=
 =?utf-8?B?NUlYMXUrMUtoSFRxUEthVmtCME5CdnJIZlFYejBxcjlhRmNhWVFacld5cE9Y?=
 =?utf-8?B?UWFUMStYdE1sOWRQVzMybndtTDhBSUw0Y2VFVGZwSXh0MTh3NU1PN2lFU01E?=
 =?utf-8?B?dEVReVRZT3lHUkVrM3BISy9VdzFtb2lNeCtkQ1ZXeW5pM1NQeE5SNlRUZnJT?=
 =?utf-8?B?bnIzcHJNMmZnSmJZUEpwL0svNmZyejRTSzd4Yk80UTJiUVJVQkg0eGdoZUxI?=
 =?utf-8?B?Y1FGN01qdDhUN2xJV1IrcEYyVEpzVFlSVW5UVlFzaHI4V2hQbElSRW41WUcy?=
 =?utf-8?B?dmtjVVZITG0yQzM1cy9XZVF6M3RGTmtVc2pMQTRTL0pzaFhRRXkyQ2lEbUU3?=
 =?utf-8?B?V1VrMmU4SU8wRjZ3Umw2dWMzQ0dHb3ZvTGg4VDE3d0ZyRVNTQXVjSXRIMjhs?=
 =?utf-8?B?Y0lwb2x0OG5vNmdoVmxaalB5YmJJMWVJR0ZEQnVabk13Z0ptU3pheE9wbXhB?=
 =?utf-8?B?L0kxOGlxNXBITkpUYzlIbGppMjllL2JERUVhTnM0aVNHRXQrK1Qwa2NZYkk4?=
 =?utf-8?B?b0FVV3IrYWowdHBwS3RSNnVrY3RyTXAwMjUvZlM1WFQ0bW9pVDIwS2FHcC9W?=
 =?utf-8?B?ckFOMnkzdDVQTUs4SzdlVS9iM0hwRjdaWkEyQ1A5SVBWOFVJQlBTWTNKUCtJ?=
 =?utf-8?B?aXRPZjZxbmhnL3MxRnI0LzFwK2gzWVRneEZTQmhRbEJkLzRBSndWTC9YR25F?=
 =?utf-8?B?TUU0RFcxZ3NVNW84WC80alJQWXJYSVFtaW5FOWJCelJ6ZGVZZWxidzhwZHM5?=
 =?utf-8?B?WkJDTUs5MFpQOTdmMmlxbkJKU3p3L20xSjlraXdIR0d4dG1iVGVMTngzWnJD?=
 =?utf-8?B?QXN2c3M4cWhRN0VjaENFZ1BIUURlRFZJcEhRT055Wkw5VkRIVWE5VUpDbWNz?=
 =?utf-8?B?UDR6Uk5JUjJSVE0zSzFvT2R3NzRqYXlrQmpMSENSVnkxZ2ZhMWJpMVZnYzBQ?=
 =?utf-8?B?WERlTW51b1hLRENsTXBkKzBrVGIwcEJMcDRTMlNCb1UvRXlSeXpLRXNTRld2?=
 =?utf-8?B?LzNzTkVhTlZGMzNaL0JTLytDT01NVzMxWUJxUUYzbnlhaW13ckJ2aEdkZnBT?=
 =?utf-8?B?ZjB6UzJ3bCs3RU9SUTVyQkt1Q0xOT2ZRWFdrVVJFYzNNYS9NU0doeHdGZDd5?=
 =?utf-8?B?S25CUlVhY0tJQ0NlKzhKdCt2ZnBKSk13MVlQdE1SbXJycUkzZDFyQk5YU0I0?=
 =?utf-8?B?VnlCbmR3d2lEVkFISEZEVFVsUGtVZGdka1d5VnR2MTRpTkVUWVhXS1ZhNXph?=
 =?utf-8?B?VnZVZGhqZSt6RUJPWDlWRUZZSHQrc0lYcWRZSm9kNlVLa2QrYm5pam5ya3pN?=
 =?utf-8?B?d2VNcDdLRHNycDFQV25DT3RQc3Nha1kxSjVoMXJmS0FQS2tVWmpkNSt6T1Bp?=
 =?utf-8?B?Y01xVngwZUU1WS9IQ0NpSnlocCsrUXFrUU5SNmVTYXRGaVY3bldqQW1peFNt?=
 =?utf-8?B?M0IzQlFDREdaZkhtYTg3K2EwWmpZSGFHRXQzTDFsSDREQnVHZTNzY2pOSjN6?=
 =?utf-8?B?YzB5c2luRjF0clc2WHZtcU9XNFB2Q0k0NVY0RmhibzUxMnM1RWs0bnZkMXp5?=
 =?utf-8?B?bzNycTc4eHVJTU16bzFGYmNtTGZKK3FMVWxLYXplamhaUThRazQ0cGZUUmVj?=
 =?utf-8?B?TmpaR0VMczFnNTE1UFpsNzZuaW12K0hUaTVIeGliZWtQdzlZSzZnR1I2MUtC?=
 =?utf-8?B?dnRoclBtQW9kUC9ubSsvbFl0MytUeHVTMGx0UmozK1pXRE5wQVlJOGxFVStY?=
 =?utf-8?B?VDdpNU96ZUNBS29sSFFXampPemVtSDd5citWTXlzVndySlRpL0hXUWJyTmlB?=
 =?utf-8?B?MG5IS3NMd2RHcGlKYnc2VkFISWdKNkZYRTZiMXB4ZnlZRXNXRzVmYzJPTXZ0?=
 =?utf-8?B?Q0E3dFVoMWNpV2VEK0lSL0Nxdy9YRngvSVB1RkNRdlNmeUtxSVpSbWx5M2dU?=
 =?utf-8?B?NGZQYTc2SS9HcG5JdEZkVU83YU03NVUxS1lyWmh1OTQxTzFQM2l4S2RmdGg4?=
 =?utf-8?B?akVNcnJHb2ZxTS9zNUsxUTF4SWIvMXhqS3QyTU5IYkpTZlVVTVV1YUxkVlNC?=
 =?utf-8?B?WUtvMGNsWk9USFZpZnlhVGNsZUNxc0xHbXk5SVpzUlp5TjIwV2FnVFNXQjlY?=
 =?utf-8?Q?yse0wPFQz9YQAbO5Z6rD5aU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bys1aDg2dXo0d3BnYVhwMzl1R0dhWHltblMxcDM5bFZtdjJWZkdPQ2hUbmk3?=
 =?utf-8?B?NHZLc091cWcwWE9LQklhN1pwM2ZqMk15bjA3Y0FQZjVWNHUrdjJ0OWwzaG9P?=
 =?utf-8?B?WE90TENqRTM0NEJ6MVJwcU5LM0c3bFBLeFRjTjNsZXJZUXpWdFF0NTFTd2hX?=
 =?utf-8?B?cTB6aWtzaGlVK0QvMlZTbnEvQ3MyeXFxUGpwc1NkZC95c2dubXkzbEdCVEo1?=
 =?utf-8?B?ZUlzWFlqQUdPelR1NUNXUlRrWUxvWGVnWnZwYmJoNTZ0bWc3V3RuWWhkWWw2?=
 =?utf-8?B?NTkwZVFSY2tzQ2dQMUVXdGNMd2tuQTl6dmZQdGdEdHlEam92VXVsZVNGeU1W?=
 =?utf-8?B?cytCWXBSUnQ1ZE5YQy9SUkJ3aXU4QThuZzZnMU5lVE1TcWNOck1leDRLdTBm?=
 =?utf-8?B?Y1FIMWgvNW44cVJ3aTcxUzdXOG0xdEs5MTd5Mm5JU2NFTlR1VUtoeklpeDFR?=
 =?utf-8?B?N0tnb2tEQkVKaUZLVFdONkw1NmtUYm9xcHdqOVFmNHZXaWFNTGNYUFJuQXQ0?=
 =?utf-8?B?V21KbTd6R1hUWjlkMjViazFER2lqd2ZnWjJvdGFjb2JwaURwenRBK1g4NEUz?=
 =?utf-8?B?UTU5b3YxTlBDNXNha093bmgvYWhXRzJoa2Ira2ZnQm40SVVkVE9lZ2g3dE1u?=
 =?utf-8?B?NDJhNjNpOHE0TE9QN1hwQksxQjBuOC8wa1hJN1NlUy96Vjh1VHNsZExrbU5n?=
 =?utf-8?B?Y0JlTVhucWNSa1J2Y2g0STA0ZFlFb2FteHJSckUva0pDUUlON0taaEVFWUJX?=
 =?utf-8?B?bTNOdkxxc1RtUXhUVDdmVk15SEtacmxidmtzVWFGYy9mS0hDVUFGNTkrclBV?=
 =?utf-8?B?dmhZR2VXSDE5dmpaTWQyRVJrbDlyaWRYZlJMODg4OU5LN0djdEFCSElTdTZH?=
 =?utf-8?B?dG85bldKVTNCL1ZOcEpuU0x4VGdoNVBTdGVCUmVsaFp2clI2R0lEcnJTVXcr?=
 =?utf-8?B?aXdiZVYvYVBRM0tkZ0VxQWFpZWl1MVRzTUZGenFBd1ExYUwrSEs2cXB3MVp6?=
 =?utf-8?B?Nmhhd2FlZ0dlTnV6SDViWlhRMEdxVWR5ZFhJc2t0cVEvVlR5WDZuNTR6Si9P?=
 =?utf-8?B?SXRvcERNUDNjS3ZlMEhZM0IzNUNxUjJHSWhMNlU1a2diQVRJQUd3ay9uSUdu?=
 =?utf-8?B?OFU5L1dIUCtQc0lDcDdKYjBPU1llL0xTeG9YWEdNRWMvM3YvMm9KYUFBUFdv?=
 =?utf-8?B?OTNya3ZlZmI2RW1KSG95TCtPTTk2ckcrVm1tYXIvdTJncnFCRFRNSWFadGdj?=
 =?utf-8?B?SkhFY0ozNHJuTURNQ0RDRnhhVVhQZWNPRHFVVlFlcTFNWTFzY1Nmd0Z6VC91?=
 =?utf-8?B?d2tIYWtOb1BibFEzZmpWMTk0NU9hQW9jWUw2ZXJZeU1WTVVzb2cxaUxGenpD?=
 =?utf-8?B?Wjc1OWdIZ255S2czQTlSNXpVMVoraXFsWnhZdUJmbUpaME13WS9odkt3dXcx?=
 =?utf-8?B?cExTMTg0ZDV2dVdIYXZqZXpESFRiQ1ZEdlJseUtKSEhHZmx2aXVXaHJYMlNp?=
 =?utf-8?B?Z2J6VW1jdTNSZEE5UHpnNmxlR2R1TzVUUzNSSUJtYmJzUGd3bXJFU1NjZUpm?=
 =?utf-8?B?TG4vdElEMFQ4Zk1xR1B1OXNUUlQyWWtKT08rcEN1b1pPc3VyOHdGWENnelNS?=
 =?utf-8?B?ZFVQVkRIV1cxVlJmNXRnR1hLU0trTVZGaXdvTVJMcGZRTUwzZk1teVBDVlJp?=
 =?utf-8?B?UGN6cjN2Vk1qTzYzaEpxaG5uejhDMXNJNlNBZW1IeDNURGh2VUlQL1k1ZlNM?=
 =?utf-8?B?VmVCNUY1MFc0RGw4SG5GTUJlZzViRU84Y2VmRlY4UnNSY2VJVFZPc0J1c3VQ?=
 =?utf-8?B?NE9pV2t0ZnZESEpSb3BqQmthTyt4VzhsNS80T3BHYWZ1ODd4MGM1TUVCWUVs?=
 =?utf-8?B?enluZ0ZRVHhuUkdIbTY2NWVjYzZVVXVDUENPR0dvQ1hyV1Evd3c2djNrSGpj?=
 =?utf-8?B?TFZkdm1URjN6U3RNbGJIdTNGQU1UVG1YdkovUDR0bkY1YXEwdnRxbXpIMXdZ?=
 =?utf-8?B?UGl3dEd4bk5pclJoY0dCU3BEdEQ1NVZKZHJFYWZaMG9uRnJXTXZ4a0FVNzlC?=
 =?utf-8?B?ZUY5R0w0VnpOdE85QlBjRmZiejhzN2I4RGFsTFhnNUZFUWZOQm42REZCbkVY?=
 =?utf-8?B?cmJpZExpbUZZMFhIMnJ5eGRQcmxEaDlLTGxRSWNHejdCVi9PUk5OdzNuekg3?=
 =?utf-8?B?WUIvS3lQZk5Qck9DN1IyYmxLWWZudGhyc1dLeU9SdUNIc1V1U3BvdDBubWhz?=
 =?utf-8?B?MFlpQ0hUTHVqa1pOdHA5dzBpTEJiMEhqNitqQ3NvVytEY3QvQkFKam50TURq?=
 =?utf-8?B?TUF2eWg0a2RNM01JK0lvdjhRSUE5K0l1TjVpdTM5d1A5VS9MUUxEZTRkbEx5?=
 =?utf-8?Q?FPH+lTCDY+nwMyJ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C33D2B4CE3F6043931F3F8578F1D1D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01616890-70b2-446d-3336-08de6e7a2098
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 23:13:14.4462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6lxMHYQL12O1PvW+GMmkBbfq1P+kU6i4YGOVBx+GKnXw8gRfClcefjZ/kciGsdogUSnYfNNZZQjlWHifjjKHpDGkurUudaBHpE1n6qsHIKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
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

T24gVHVlLCAyMDI2LTAyLTE3IGF0IDEyOjA1IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEN1cnJlbnQgR1Qgc3RhdGlzdGljcyB1c2UgYXRvbWljNjRfdCBjb3VudGVycy4gQXRvbWljIG9w
ZXJhdGlvbnMKPiBpbmN1cgo+IGEgZ2xvYmFsIGNvaGVyZW5jeSBwZW5hbHR5Lgo+IAo+IFRyYW5z
aXRpb24gdG8gZHluYW1pYyBwZXItY3B1IGNvdW50ZXJzIHVzaW5nIGFsbG9jX3BlcmNwdSgpLiBU
aGlzCj4gYWxsb3dzCj4gc3RhdHMgdG8gYmUgaW5jcmVtZW50ZWQgdmlhIHRoaXNfY3B1X2FkZCgp
LCB3aGljaCBjb21waWxlcyB0byBhCj4gc2luZ2xlCj4gbm9uLWxvY2tpbmcgaW5zdHJ1Y3Rpb24u
IFRoaXMgYXBwcm9hY2gga2VlcHMgdGhlIGhvdC1wYXRoIHVwZGF0ZXMKPiBsb2NhbAo+IHRvIHRo
ZSBDUFUsIGF2b2lkaW5nIGV4cGVuc2l2ZSBjcm9zcy1jb3JlIGNhY2hlIGludmFsaWRhdGlvbiB0
cmFmZmljLgo+IAo+IFVzZSBmb3JfZWFjaF9wb3NzaWJsZV9jcHUoKSBkdXJpbmcgYWdncmVnYXRp
b24gYW5kIGNsZWFyIG9wZXJhdGlvbnMKPiB0bwo+IGVuc3VyZSBkYXRhIGNvbnNpc3RlbmN5IGFj
cm9zcyBDUFUgaG90cGx1ZyBldmVudHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9z
dCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSArKysKPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9zdGF0cy5jwqDCoMKgwqDCoMKgIHwgNTcgKysrKysrKysrKysrKysrKysr
KysrLS0tCj4gLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zdGF0cy5owqDCoMKgwqDC
oMKgIHzCoCA2ICsrKwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N0YXRzX3R5cGVzLmgg
fCAxOSArKysrKysrKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5owqDCoMKg
wqDCoMKgIHzCoCA1ICstLQo+IMKgNSBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspLCAx
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYwo+IGluZGV4IDY4YzQ3NzFkZTA0MC4uMTIw
M2QwODdiNjhmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMKPiBAQCAtMzMsNiArMzMsNyBAQAo+IMKgI2lu
Y2x1ZGUgInhlX2d0X3ByaW50ay5oIgo+IMKgI2luY2x1ZGUgInhlX2d0X3NyaW92X3BmLmgiCj4g
wqAjaW5jbHVkZSAieGVfZ3Rfc3Jpb3ZfdmYuaCIKPiArI2luY2x1ZGUgInhlX2d0X3N0YXRzLmgi
Cj4gwqAjaW5jbHVkZSAieGVfZ3Rfc3lzZnMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9ndF90b3BvbG9n
eS5oIgo+IMKgI2luY2x1ZGUgInhlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmgiCj4gQEAgLTQ1NSw2
ICs0NTYsMTAgQEAgaW50IHhlX2d0X2luaXRfZWFybHkoc3RydWN0IHhlX2d0ICpndCkKPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKGVycikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBlcnI7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndF9zdGF0c19pbml0KGd0
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gZXJyOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgQ0xBU1MoeGVfZm9yY2Vfd2Fr
ZSwgZndfcmVmKShndF90b19mdyhndCksIFhFX0ZXX0dUKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYg
KCFmd19yZWYuZG9tYWlucykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAtRVRJTUVET1VUOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Rh
dHMuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N0YXRzLmMKPiBpbmRleCAzNzUwNjQz
NGQ3YTMuLmY0YmIwYmYzMzk5NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3Rfc3RhdHMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zdGF0cy5jCj4gQEAg
LTMsMTIgKzMsMzcgQEAKPiDCoCAqIENvcHlyaWdodCDCqSAyMDI0IEludGVsIENvcnBvcmF0aW9u
Cj4gwqAgKi8KPiDCoAo+IC0jaW5jbHVkZSA8bGludXgvYXRvbWljLmg+Cj4gLQo+ICsjaW5jbHVk
ZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4gwqAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+IMKg
Cj4gKyNpbmNsdWRlICJ4ZV9kZXZpY2UuaCIKPiDCoCNpbmNsdWRlICJ4ZV9ndF9zdGF0cy5oIgo+
IC0jaW5jbHVkZSAieGVfZ3RfdHlwZXMuaCIKPiArCj4gK3N0YXRpYyB2b2lkIHhlX2d0X3N0YXRz
X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAqYXJnKQo+ICt7Cj4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGFyZzsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZnJlZV9w
ZXJjcHUoZ3QtPnN0YXRzKTsKPiArfQo+ICsKPiArLyoqCj4gKyAqIHhlX2d0X3N0YXRzX2luaXQo
KSAtIEluaXRpYWxpemUgR1Qgc3RhdGlzdGljcwo+ICsgKiBAZ3Q6IEdUIHN0cnVjdHVyZQo+ICsg
Kgo+ICsgKiBBbGxvY2F0ZSBwZXItQ1BVIEdUIHN0YXRpc3RpY3MuIFVzaW5nIHBlci1DUFUgc3Rh
dHMgYWxsb3dzCj4gaW5jcmVtZW50cwo+ICsgKiB0byBvY2N1ciB3aXRob3V0IGNyb3NzLUNQVSBh
dG9taWNzLgo+ICsgKgo+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgLUVOT01FTSBvbiBmYWls
dXJlLgo+ICsgKi8KPiAraW50IHhlX2d0X3N0YXRzX2luaXQoc3RydWN0IHhlX2d0ICpndCkKPiAr
ewo+ICvCoMKgwqDCoMKgwqDCoGd0LT5zdGF0cyA9IGFsbG9jX3BlcmNwdShzdHJ1Y3QgeGVfZ3Rf
c3RhdHMpOwo+ICvCoMKgwqDCoMKgwqDCoGlmICghZ3QtPnN0YXRzKQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgmZ3RfdG9feGUoZ3QpLT5kcm0sCj4geGVfZ3Rf
c3RhdHNfZmluaSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3QpOwo+ICt9Cj4gwqAKPiDCoC8q
Kgo+IMKgICogeGVfZ3Rfc3RhdHNfaW5jciAtIEluY3JlbWVudHMgdGhlIHNwZWNpZmllZCBzdGF0
cyBjb3VudGVyCj4gQEAgLTIzLDcgKzQ4LDcgQEAgdm9pZCB4ZV9ndF9zdGF0c19pbmNyKHN0cnVj
dCB4ZV9ndCAqZ3QsIGNvbnN0IGVudW0KPiB4ZV9ndF9zdGF0c19pZCBpZCwgaW50IGluY3IpCj4g
wqDCoMKgwqDCoMKgwqDCoGlmIChpZCA+PSBfX1hFX0dUX1NUQVRTX05VTV9JRFMpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBh
dG9taWM2NF9hZGQoaW5jciwgJmd0LT5zdGF0cy5jb3VudGVyc1tpZF0pOwo+ICvCoMKgwqDCoMKg
wqDCoHRoaXNfY3B1X2FkZChndC0+c3RhdHMtPmNvdW50ZXJzW2lkXSwgaW5jcik7Cj4gwqB9Cj4g
wqAKPiDCoCNkZWZpbmUgREVGX1NUQVRfU1RSKElELCBuYW1lKSBbWEVfR1RfU1RBVFNfSURfIyNJ
RF0gPSBuYW1lCj4gQEAgLTk0LDkgKzExOSwxOCBAQCBpbnQgeGVfZ3Rfc3RhdHNfcHJpbnRfaW5m
byhzdHJ1Y3QgeGVfZ3QgKmd0LAo+IHN0cnVjdCBkcm1fcHJpbnRlciAqcCkKPiDCoHsKPiDCoMKg
wqDCoMKgwqDCoMKgZW51bSB4ZV9ndF9zdGF0c19pZCBpZDsKPiDCoAo+IC3CoMKgwqDCoMKgwqDC
oGZvciAoaWQgPSAwOyBpZCA8IF9fWEVfR1RfU1RBVFNfTlVNX0lEUzsgKytpZCkKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZihwLCAiJXM6ICVsbGRcbiIsIHN0YXRf
ZGVzY3JpcHRpb25baWRdLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBhdG9taWM2NF9yZWFkKCZndC0+c3RhdHMuY291bnRlcnNbaWRdKSk7Cj4g
K8KgwqDCoMKgwqDCoMKgZm9yIChpZCA9IDA7IGlkIDwgX19YRV9HVF9TVEFUU19OVU1fSURTOyAr
K2lkKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU2NCB0b3RhbCA9IDA7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludCBjcHU7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KSB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3Rfc3Rh
dHMgKnMgPSBwZXJfY3B1X3B0cihndC0KPiA+c3RhdHMsIGNwdSk7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdG90YWwgKz0gcy0+Y291bnRlcnNb
aWRdOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKHAsICIlczogJWxsZFxuIiwgc3RhdF9kZXNj
cmlwdGlvbltpZF0sCj4gdG90YWwpOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsKPiDCoH0KPiBAQCAtMTA5LDggKzE0MywxMSBAQCBpbnQgeGVfZ3Rf
c3RhdHNfcHJpbnRfaW5mbyhzdHJ1Y3QgeGVfZ3QgKmd0LAo+IHN0cnVjdCBkcm1fcHJpbnRlciAq
cCkKPiDCoCAqLwo+IMKgdm9pZCB4ZV9ndF9zdGF0c19jbGVhcihzdHJ1Y3QgeGVfZ3QgKmd0KQo+
IMKgewo+IC3CoMKgwqDCoMKgwqDCoGludCBpZDsKPiArwqDCoMKgwqDCoMKgwqBpbnQgY3B1Owo+
ICsKPiArwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KSB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndF9zdGF0cyAqcyA9IHBlcl9jcHVf
cHRyKGd0LT5zdGF0cywgY3B1KTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGZvciAoaWQgPSAwOyBp
ZCA8IEFSUkFZX1NJWkUoZ3QtPnN0YXRzLmNvdW50ZXJzKTsgKytpZCkKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYXRvbWljNjRfc2V0KCZndC0+c3RhdHMuY291bnRlcnNbaWRdLCAw
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtc2V0KHMsIDAsIHNpemVvZigq
cykpOwoKRG8gd2UgbmVlZCBhIGxvY2sgYXJvdW5kIHRoaXMgYW5kIHRoZSB0b3RhbCBnZXQgYWJv
dmU/IEkgZ2V0IHRoYXQgdGhlCkNQVSBpbmNyZW1lbnRzIHNob3VsZCBiZSBvaywgYnV0IHdoZW4g
d2UgYWdncmVnYXRlLCBpc24ndCB0aGVyZSBhCmNoYW5jZSB3ZSdyZSBvdmVyd3JpdGluZyBzb21l
dGhpbmcgaGVyZT8KClRoYW5rcywKU3R1YXJ0Cgo+ICvCoMKgwqDCoMKgwqDCoH0KPiDCoH0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N0YXRzLmgKPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF9zdGF0cy5oCj4gaW5kZXggNTlhN2JmNjBlMjQyLi4zZDBkZWZhYjli
MzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3N0YXRzLmgKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3RhdHMuaAo+IEBAIC0xNCwxMCArMTQsMTYgQEAg
c3RydWN0IHhlX2d0Owo+IMKgc3RydWN0IGRybV9wcmludGVyOwo+IMKgCj4gwqAjaWZkZWYgQ09O
RklHX0RFQlVHX0ZTCj4gK2ludCB4ZV9ndF9zdGF0c19pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpOwo+
IMKgaW50IHhlX2d0X3N0YXRzX3ByaW50X2luZm8oc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IGRy
bV9wcmludGVyICpwKTsKPiDCoHZvaWQgeGVfZ3Rfc3RhdHNfY2xlYXIoc3RydWN0IHhlX2d0ICpn
dCk7Cj4gwqB2b2lkIHhlX2d0X3N0YXRzX2luY3Ioc3RydWN0IHhlX2d0ICpndCwgY29uc3QgZW51
bSB4ZV9ndF9zdGF0c19pZAo+IGlkLCBpbnQgaW5jcik7Cj4gwqAjZWxzZQo+ICtzdGF0aWMgaW5s
aW5lIGludCB4ZV9ndF9zdGF0c19pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpCj4gK3sKPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsKPiArfQo+ICsKPiDCoHN0YXRpYyBpbmxpbmUgdm9pZAo+IMKgeGVf
Z3Rfc3RhdHNfaW5jcihzdHJ1Y3QgeGVfZ3QgKmd0LCBjb25zdCBlbnVtIHhlX2d0X3N0YXRzX2lk
IGlkLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBpbmNyKQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3RhdHNfdHlwZXMuaAo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3N0YXRzX3R5cGVzLmgKPiBpbmRleCBiOGFjY2RiYzU0ZWIuLjc5
NTY4NTkxYmQ2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3RhdHNf
dHlwZXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zdGF0c190eXBlcy5oCj4g
QEAgLTYsNiArNiw4IEBACj4gwqAjaWZuZGVmIF9YRV9HVF9TVEFUU19UWVBFU19IXwo+IMKgI2Rl
ZmluZSBfWEVfR1RfU1RBVFNfVFlQRVNfSF8KPiDCoAo+ICsjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4KPiArCj4gwqBlbnVtIHhlX2d0X3N0YXRzX2lkIHsKPiDCoMKgwqDCoMKgwqDCoMKgWEVfR1Rf
U1RBVFNfSURfU1ZNX1BBR0VGQVVMVF9DT1VOVCwKPiDCoMKgwqDCoMKgwqDCoMKgWEVfR1RfU1RB
VFNfSURfVExCX0lOVkFMLAo+IEBAIC01OCw0ICs2MCwyMSBAQCBlbnVtIHhlX2d0X3N0YXRzX2lk
IHsKPiDCoMKgwqDCoMKgwqDCoMKgX19YRV9HVF9TVEFUU19OVU1fSURTLAo+IMKgfTsKPiDCoAo+
ICsvKioKPiArICogc3RydWN0IHhlX2d0X3N0YXRzIC0gUGVyLUNQVSBHVCBzdGF0aXN0aWNzIGNv
dW50ZXJzCj4gKyAqIEBjb3VudGVyczogQXJyYXkgb2YgNjQtYml0IGNvdW50ZXJzIGluZGV4ZWQg
YnkgJmVudW0KPiB4ZV9ndF9zdGF0c19pZAo+ICsgKgo+ICsgKiBUaGlzIHN0cnVjdHVyZSBpcyB1
c2VkIGZvciBoaWdoLWZyZXF1ZW5jeSwgcGVyLUNQVSBzdGF0aXN0aWNzCj4gY29sbGVjdGlvbgo+
ICsgKiBpbiB0aGUgWGUgZHJpdmVyLiBCeSB1c2luZyBhIHBlci1DUFUgYWxsb2NhdGlvbiBhbmQg
ZW5zdXJpbmcgdGhlCj4gc3RydWN0dXJlCj4gKyAqIGlzIGNhY2hlLWxpbmUgYWxpZ25lZCwgd2Ug
YXZvaWQgdGhlIHBlcmZvcm1hbmNlLWhlYXZ5IGF0b21pY3MgYW5kCj4gY2FjaGUKPiArICogY29o
ZXJlbmN5IHRyYWZmaWMuCj4gKyAqCj4gKyAqIFVwZGF0ZXMgdG8gdGhlc2UgY291bnRlcnMgc2hv
dWxkIGJlIHBlcmZvcm1lZCB1c2luZyB0aGUKPiB0aGlzX2NwdV9hZGQoKQo+ICsgKiBtYWNybyB0
byBlbnN1cmUgdGhleSBhcmUgYXRvbWljIHdpdGggcmVzcGVjdCB0byBsb2NhbCBpbnRlcnJ1cHRz
Cj4gYW5kCj4gKyAqIHByZWVtcHRpb24tc2FmZSB3aXRob3V0IHRoZSBvdmVyaGVhZCBvZiBleHBs
aWNpdCBsb2NraW5nLgo+ICsgKi8KPiArc3RydWN0IHhlX2d0X3N0YXRzIHsKPiArwqDCoMKgwqDC
oMKgwqB1NjQgY291bnRlcnNbX19YRV9HVF9TVEFUU19OVU1fSURTXTsKPiArfSBfX19fY2FjaGVs
aW5lX2FsaWduZWQ7Cj4gKwo+IMKgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+
IGluZGV4IGNhZjdlN2U3OGJlOS4uOGI1NWNmMjVhNzVmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3R5cGVzLmgKPiBAQCAtMTU4LDEwICsxNTgsNyBAQCBzdHJ1Y3QgeGVfZ3Qgewo+IMKgCj4gwqAj
aWYgSVNfRU5BQkxFRChDT05GSUdfREVCVUdfRlMpCj4gwqDCoMKgwqDCoMKgwqDCoC8qKiBAc3Rh
dHM6IEdUIHN0YXRzICovCj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IHsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBzdGF0cy5jb3VudGVyczogY291bnRlcnMgZm9yIHZhcmlv
dXMgR1Qgc3RhdHMgKi8KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXRvbWljNjRf
dCBjb3VudGVyc1tfX1hFX0dUX1NUQVRTX05VTV9JRFNdOwo+IC3CoMKgwqDCoMKgwqDCoH0gc3Rh
dHM7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0X3N0YXRzIF9fcGVyY3B1ICpzdGF0czsK
PiDCoCNlbmRpZgo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qKgoK
