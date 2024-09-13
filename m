Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A863FA3723
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 07:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE2010EAE1;
	Fri, 13 Sep 2024 07:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDg1G8XT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1710EAE1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 07:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726212942; x=1757748942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ttE3PmNqZekr/q/i7tQ8/oLQjeV8yuKQpLdGpsxIV8k=;
 b=MDg1G8XT8o2f8vHpt7JERdmW6ulHKwbvAKFA4AK+s2EYSbdjgX4kJcnv
 winG/D6HPzDk1RHZqcrSurNz640krddnBIbJXuf8ynPBFc/NhSuMjk/Ye
 9zLb+q28Xp/Rv9vCVq9ImF85R0ibGs5Q3SoCUpl6fzHk0fGaR/7oKv7Tf
 zyMgcRLxW9Sh89r83n8QnizFxe3fmFeVnF9S6r8xtjEwOd7fto3ekwGgP
 iJbSo4ai84tE2dkvHDxVeGYcPvrb/iJpOflNEhCr2TKfITTldQOOQ+jRA
 L5wzqzXPnSteq9tUW7qHrwrO4vkVG03p9szvlQ1fr/lId4EMrmcEhVaYe g==;
X-CSE-ConnectionGUID: bO7medKdSRqAOzBurwmZXA==
X-CSE-MsgGUID: 5sqN9cxJRV6J0ff0UCfWHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28845701"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="28845701"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 00:35:38 -0700
X-CSE-ConnectionGUID: v+man1vSSuezSvvWYL/BSA==
X-CSE-MsgGUID: Q1301sJXTMKObTlExtSkTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="67937430"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 00:35:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 00:35:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 00:35:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 00:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daJLTGS+g1jrv4OQ8qDGketaD6h1nUqhWIe4f23XDkRnduVZjOkYO7ADQW8iWZMDvJDWrzHJ5+rxJLzfT+J9hVfe6Vbp9q/huM1dOPYOwBbCSoAimSNHwXU3/YvtrM6NsHYLi5m9Rv29Inc/lOZgxizjZxpkBt5bLgyE77fQxfyYm0VMgepGIQM05gFpsZ7YTLK/CgxYivmoZyzcOmSM3DXKU5Uz+GL0eH/3pDaWWZdbfCtfFTm0XDmh5SAXIJFOgS4rO2h4LPdjvqJ9DmOlWOFXBS/UvrMIjcosChXD+13CyUqCONecI/7eSNLbuCriTK6x/tfet7Gl/YoGw1aCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttE3PmNqZekr/q/i7tQ8/oLQjeV8yuKQpLdGpsxIV8k=;
 b=HfLAaJsg0B8Mfyh8Eiv/UNEWebblJ4i4y8OHeN1D1TIVTwpooguDOwX79GpyHuWp1lVlv+thAkoc/Pq2iG5Ta9jJPfnJxe6cEOfZ75xjel6IQ6ZApOJS70wjO5SZsz8OsDAE/dcRTW0N6MUpEW2pcXHBbcPCLhfS3WLoSWQjSIY/F/nttNS58vYScgBMHUlF0gc1WgxxokRqXoxgkAl8qVw5W5OcRibGWbRDLpKIR3zQjGc4m6J+6kMVaiKLDsEJ3W0iWDOalR9ynir0xjc9mTG+fjHAhsSPV4ZB/8FCl+kiVS5HfkfKwaavREFMCct5SHg+KzIiTzmAl5n4xlECrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 by PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Fri, 13 Sep
 2024 07:35:28 +0000
Received: from PH0PR11MB5609.namprd11.prod.outlook.com
 ([fe80::410e:7a23:21ce:673]) by PH0PR11MB5609.namprd11.prod.outlook.com
 ([fe80::410e:7a23:21ce:673%6]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 07:35:28 +0000
From: "Ranjan, Joshua Santhosh" <joshua.santosh.ranjan@intel.com>
To: "Chegondi, Harish" <harish.chegondi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ausmus,
 James" <james.ausmus@intel.com>, "Degrood, Felix J"
 <felix.j.degrood@intel.com>, "Souza, Jose" <jose.souza@intel.com>, "Cabral,
 Matias A" <matias.a.cabral@intel.com>, "Kumar, Shubham"
 <shubham.kumar@intel.com>
Subject: RE: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHbAosbt/j9+ZhBpUaBhTnWgzLDtbJQJkAAgAMXPgCAAbz2gIAAOp3w
Date: Fri, 13 Sep 2024 07:35:28 +0000
Message-ID: <PH0PR11MB56099277EA4382E08CF4A78EA1652@PH0PR11MB5609.namprd11.prod.outlook.com>
References: <cover.1725866097.git.harish.chegondi@intel.com>
 <5f7adcc0dffec68bf88b282a5d2f92a9f05834ca.1725866097.git.harish.chegondi@intel.com>
 <20240910000914.GD5774@mdroper-desk1.amr.corp.intel.com>
 <87ldzx3hg7.wl-ashutosh.dixit@intel.com> <ZuObKzhNGK3O5P1Q@intel.com>
In-Reply-To: <ZuObKzhNGK3O5P1Q@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5609:EE_|PH7PR11MB6673:EE_
x-ms-office365-filtering-correlation-id: 457463f5-410e-4005-151b-08dcd3c6a3d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NE8wYlE4SXZyWXVKRitQZ1dRUUQ5N25zVjZoUzFNWXoxN0hoVmVKNThlQWlR?=
 =?utf-8?B?Q2c4azRtR2o5eFJmby93RHBVWFI3UzFjR1hYTVhSR1NUREI2M28weUpIRThj?=
 =?utf-8?B?cHVpUFhyZ2dEd2h1ekR2YjFaRlBYV1AvQ2RYdmxSbEc1cWtJVnNRY3MxWmZs?=
 =?utf-8?B?cFJwMVU3b0M1QlMvamhIS2I0YVVsdWM3dVFNTktvWkhUeWNISW5pTFFRU2hV?=
 =?utf-8?B?YjFpME1pZHFoTjByMm5rVFdyRDJVeU03VWdjczY1K0FnMjA0bm82QjhKQlpr?=
 =?utf-8?B?WUpQM3RLWXFrUnZRdDB1WDZid1VJR05NcEMrN25Venk0K1p4NjFnL3pEVzZL?=
 =?utf-8?B?S1JDNGtTY3NOblBJa0o5VGkyTHR6YVM5Z25ka2JGVmQ3bFdkeU9FblRQVGlC?=
 =?utf-8?B?OGc2M0tUc05vZEhlQ0hMblg4cW1aOVFZRkhBNmd5TldxNEVMNFV2bTJNZFpP?=
 =?utf-8?B?ZE8xVGNialFFSUNuOWtTRjZ5N0dZVmtyeFZhb0hseVVHb1g0SjhoWUNLWnlm?=
 =?utf-8?B?aERHeGFxbkRtaWVCQ0pxSE1DdTZsTFM0Q0lXS0hoQk43WlFIVHE4QmxPWHp0?=
 =?utf-8?B?b2p6M1h4VEZHQ2pQUU9DOU0wRm9qaUhGUDYwMnhDUzc4Q1l5S015WlFIM0Qr?=
 =?utf-8?B?b2RaeXo4QWhuY2JWVWkrcU1IT2xlaEltY2kvUGg5MlU4YnZMZk5nOUU0cDRl?=
 =?utf-8?B?ZmhCQ1ZENk1DcFgrRTh4VGJiTWFZNHN4V0cyaGp2RlJmZ1Z0UFI1TGc1bENW?=
 =?utf-8?B?SVp2SktTem51eGlZQkVHNll2WHVWeXNTcksvSUFsN0x3R0grYlY4dS9hTWMz?=
 =?utf-8?B?SFFPUHdVWlZmQ3lEcFdkOG9Hd1FFVFAxSEdYQWFRNHltYnM3Vmh0ZnRpeGk1?=
 =?utf-8?B?TTcvbjlVbGlOcVBNbGtlTnZ4WGgrSi9YMHZycWNjQXArZS9UVWsrYXVSR2RM?=
 =?utf-8?B?a0RFVE1SN0ZvRWhQaU1rQkloNGVMRmhybmhyWXYvbXRTQ3k4aXNobW5tNmh5?=
 =?utf-8?B?V0JxcHBqUDdSUnB4Q0x6QVFwUXQ2NEUzdVN5aFByNmhrb29YNnFKN1J4M2VV?=
 =?utf-8?B?S09McEs1ZnVmU3I5bjBtSjd3N3U0MFBlc2NtWG14a0VPS1p0UTF2U2FnRVlH?=
 =?utf-8?B?MC9HTFVxK2QwY3hUbXJMaExUQTJFak9FejhPaFFEelcvM3g0dWhlTkR4Unlm?=
 =?utf-8?B?ZVlTYWNmbVloTXF5QmU2bmRwUHQvWmpMVW9nQ3ZIaHZnMWRBbmpzTjVYWjJQ?=
 =?utf-8?B?dnNoRlJWeWZNaDZUYUJ3QmNRd0ZsbFB6dVpPTHE1d1RwUldJOVNtU0dBVDdr?=
 =?utf-8?B?eFN1MkpPaFNBTmlHbkdpZkN3MjBFbDVhTk9HZFkyRU5GWWw4aXVsNEF5c2R2?=
 =?utf-8?B?MEtFaTV5aEhveS94aTc3RGg1cjV6aXhpUVdxZVVaQVNSQWE1Q2ZPdUhCWG5U?=
 =?utf-8?B?NEpLSEY1ZjFwSEdibjh4cjNPZ0Mrakx0ZS9WemNhUmtiQVJjQi9iSU1JZnM5?=
 =?utf-8?B?cmZ1dTQ3OUpwbEtneUtUbGx5THJuTHFob1VNM3lTTVNHdyt4QlUrQllocFBR?=
 =?utf-8?B?cDhGM2tMWnVBZ1BtV1B1aVdxUGZiRWZOTnRHSi9Mck5WK3VWLzBkYmZacklZ?=
 =?utf-8?B?dlJwSU01SHB3V3ZKS2pCckpjWjFwK0Y4R2Jid3ZOUWZGRG82Qm1EMDZXa09U?=
 =?utf-8?B?QUtlTnBzVVRRTi9QbytTRndsUzZGaFJNbURlc01SNGE4WTlHbGg1K0x3SEtv?=
 =?utf-8?B?a1cxeEtVdGtJY2NOM0Z0MEV6ZUVaYXdiRUliZ1AzZ1NnNnY4ekkycVJBVzZX?=
 =?utf-8?B?S1p0VlhMRmlMQUR3YVJRaFJONXp3L0M4WkNxOUQ0UlBsY3JsRDczSHBvMWVG?=
 =?utf-8?B?cURGVlJLMy9jMzhBMTZocVBCeXVUZlQ2UE5wSHRuSFBRWlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzZSNHBXcDhNV3poc2lscTZEYlBBeUhnQkhhYW0yYno2VVJSRnRDakRMUmhn?=
 =?utf-8?B?dXkzVFhrZy9jY0x3NFl3d1RDLzJUUTNnaGdSMGpZNmpHUUE1UU5zL0xibDhx?=
 =?utf-8?B?VjVqNTNINFJhdXhxbUNKQ2RJWXJZNHR1Z2E1a3NHTGkxSzNyandTTUE3U1pj?=
 =?utf-8?B?Q0VESnJSZmpGSUhjSjMwVTVTV3lGOHVtNWk4UVB6dHBDZmRYUktKZVJkYnIz?=
 =?utf-8?B?cjFVMG1OZitxM0syNjhiRFZCVkFLQ3R1Rm9iYmh0aDhubGIxUkpoS1daakRS?=
 =?utf-8?B?ZVUxU2dob0kwSkhUSlIxRE5NVC8rWkZUM3VIY3FnU0NqZGpDRG50SkRoRm5t?=
 =?utf-8?B?MHRzWVV0a0VRcjFiR3lxODEyRVNIOEVrdURoZ25aMlA2cVdXODVUNzlZVDgy?=
 =?utf-8?B?a1l2bnRXNEk4N1VSbkJkb2xMR3ZKeEtQOXZ0WTQvMTRMSkNoWVBpdFhEdG1j?=
 =?utf-8?B?VTZmR0xJMkNWQlNlNlZlSzJOZkpEMnR6TUljQWdib05QaXBTK1c0Wm9BVFFi?=
 =?utf-8?B?bU93QWlDRUYwYWQ5ZDBHSmxSK0R6WlBSeEo4VHpIMWVqQ0o5NDFOeVVrMmlo?=
 =?utf-8?B?MUVqTHVxOXNkVWdHTjVodWlpUzNKbDA5UHJSWnpEenR0SnVEeWtYcDN2NkRy?=
 =?utf-8?B?a3R6aG9FZG9OQUNvZkpxYzdYWXVtL0xxd2NZdkw1RkNCOHBBTnVJeTlraWJi?=
 =?utf-8?B?YWFZTmN0MTUrdW1tcVVvVVFKYTJldjYydjZndnNIZ1BjbWpLdGJOdlVnWjkw?=
 =?utf-8?B?aDdySGphWFhRYXRJN3QyM3RKRFlzdGd6V245U0tmSUc3L1MzejVpWFRwcGUx?=
 =?utf-8?B?bXlEb0lFMnp5ZUpQcnJJa3hKUkVWTU5KMGdoazBYdmNibi8rQjQxMHZVMWRn?=
 =?utf-8?B?UEtuVUhmZWsvTCs4SnJjWXRIN1NKekFmMDk4eXJoWXoxdmw1M0VBdyt5Mnox?=
 =?utf-8?B?cWdDWGVuN25mSFRxc2Q5QnZJQ3ZIOTJHQ0dUR0R1QmJwODkvL3JFZ2hzWVZ3?=
 =?utf-8?B?NDVPNUxVKzFyZEkvR0pncFdSRldQTjFFWXZRNHR3ejhVLzhwYmYvUXBPZGww?=
 =?utf-8?B?cWU5eTd3RU9McmdlTW9kZDFDOTRJTTR5bExNKzZVL2EwWGVmQzE4R0xuWkdm?=
 =?utf-8?B?aHVpMUN1S1c5b0pJY1lyNmRKUTIzQVFZbHpGK1FwdzFCd3BreXQ1WmxLTjlZ?=
 =?utf-8?B?Vmg3ODFNeW0ySStJNHR1bXM4ZEVLWjlKVVFoNm1LZVVrdGZNVEEwdm9oby9C?=
 =?utf-8?B?NUVXUlJ4TUNVQjZMV28yRXBSWjRUaEZoRGJVT21zNGJ5QjA4MnpVWUhlT3U5?=
 =?utf-8?B?VFFxV1M5VlE1c1c5RmFCMFhuQXFZL2RYODZ4UjBpRHg1SzRrOFFqWGpMd1Qw?=
 =?utf-8?B?ZHl4dFVYZGRjMGhIbkpwUnZvY1d2Y3BjSHBzTHRxbEkxY05SR2FNYUIwNENy?=
 =?utf-8?B?NjMvSTN6M2N0WGc1NjhJUCs5c3MwWmJxV0ZxNFlVN3ExOUJhUCtEZ1JEbTlY?=
 =?utf-8?B?QnlNMW9zaXkvWWlOeGpDbVVISFNZdFJDSnJ5RjFwZjVwakVPcFhtT0VlcWtP?=
 =?utf-8?B?MENRckZCbDNIU1NHbHVYUUlsSzUwYkRDUXRrTXpUb2FzVUxhL1dWbDhiN3gy?=
 =?utf-8?B?ZGdRU2hvVmlFN0dTSmM4SkJpTGRNcmFjNlFRUTJuUTd2SmNnK3VLVWcvaHBZ?=
 =?utf-8?B?cEhPYkVRbldieXJNMTN0anZXOXQvVkhIV0dwK21UQ3Ryb210OExxbXVnK0gw?=
 =?utf-8?B?cTU3cmdXU25pc3BkYVJ6K1JXdnZodmxsUlR0YitQeVY5eEM4WkFMdkovYVlU?=
 =?utf-8?B?OFpFWVF2dmJIR25mSzRvSnY3V2xOTVJTRVFBbFR1SjNROHBvcGNmRmcrbHJZ?=
 =?utf-8?B?QXQ3aWtvOFBuUktDaWx1U0VHQzB5bG40ZXFsVUpSaG9UNDgySTFEaDJlMldQ?=
 =?utf-8?B?Kytod1lXb0RkSjhBV3d0dWsyOUkwMlRxcCtlYS9IaURkR1JSTWxzSWZBOFhI?=
 =?utf-8?B?bURhcHF6WVRpU2dsR1JPOURmNGZySXVPcGdLeHczUmFXYlVTdFA2TnRNVzJ1?=
 =?utf-8?B?bm0zV3NsL1NFSUVhZTNRbmdRUVQzR1dUUzhkVHBUeVJMNUdJR25CNGg5Vjhp?=
 =?utf-8?B?Y200bG9QSnFrM2VYRllzSmJaNUxJYTYvcDZJQ3NSbVJhd0cxbXV0bXVKWUt5?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457463f5-410e-4005-151b-08dcd3c6a3d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 07:35:28.5206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CRz4W2aDCMeDXZw9kT9Ui3cWw34ygbM8UOmDx5yoRGInYzg0q1ixb8Acz6TZP1y8/FDX7KN3LO2NL7UzKsLayJZQboRbp9+DQejku78UDos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
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

SGkgDQoNClBsZWFzZSBmaW5kIHJlc3BvbnNlcyAoW1NhbnRob3NoXSkgaW5saW5lLg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hlZ29uZGksIEhhcmlzaCA8aGFyaXNoLmNo
ZWdvbmRpQGludGVsLmNvbT4gDQpTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxMywgMjAyNCA3OjI0
IEFNDQpUbzogRGl4aXQsIEFzaHV0b3NoIDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+DQpDYzog
Um9wZXIsIE1hdHRoZXcgRCA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgQXVzbXVzLCBKYW1lcyA8amFtZXMuYXVzbXVzQGludGVsLmNv
bT47IERlZ3Jvb2QsIEZlbGl4IEogPGZlbGl4LmouZGVncm9vZEBpbnRlbC5jb20+OyBTb3V6YSwg
Sm9zZSA8am9zZS5zb3V6YUBpbnRlbC5jb20+OyBDYWJyYWwsIE1hdGlhcyBBIDxtYXRpYXMuYS5j
YWJyYWxAaW50ZWwuY29tPjsgUmFuamFuLCBKb3NodWEgU2FudGhvc2ggPGpvc2h1YS5zYW50b3No
LnJhbmphbkBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvMV0gZHJtL3hlL2V1
c3RhbGw6IEFkZCBzdXBwb3J0IGZvciBFVSBzdGFsbCBzYW1wbGluZw0KDQpPbiBXZWQsIFNlcCAx
MSwgMjAyNCBhdCAwNDoyMToxMlBNIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6DQo+IE9u
IE1vbiwgMDkgU2VwIDIwMjQgMTc6MDk6MTQgLTA3MDAsIE1hdHQgUm9wZXIgd3JvdGU6DQo+ID4N
Cj4gDQo+IEhpIE1hdHQsDQo+IA0KPiBTb21lIGNvbW1lbnRzIGFib3V0IHRoZSB1YXBpIGJlbG93
Lg0KPiANCj4gPiA+IEBAIC0xNjk0LDYgKzE2OTYsMTM4IEBAIHN0cnVjdCBkcm1feGVfb2Ffc3Ry
ZWFtX2luZm8gew0KPiA+ID4JX191NjQgcmVzZXJ2ZWRbM107DQo+ID4gPiAgfTsNCj4gPiA+DQo+
ID4gPiArLyoqDQo+ID4gPiArICogZW51bSBkcm1feGVfZXVfc3RhbGxfcHJvcGVydHlfaWQgLSBF
VSBzdGFsbCBkYXRhIHN0cmVhbSBwcm9wZXJ0eSBpZHMuDQo+ID4gPiArICoNCj4gPiA+ICsgKiBU
aGVzZSBwcm9wZXJ0aWVzIGFyZSBwYXNzZWQgdG8gdGhlIGRyaXZlciBhcyBhIGNoYWluIG9mDQo+
ID4gPiArICogQGRybV94ZV9leHRfc2V0X3Byb3BlcnR5IHN0cnVjdHVyZXMgd2l0aCBAcHJvcGVy
dHkgc2V0IHRvIA0KPiA+ID4gK3RoZXNlDQo+ID4gPiArICogcHJvcGVydGllcycgZW51bXMgYW5k
IEB2YWx1ZSBzZXQgdG8gdGhlIGNvcnJlc3BvbmRpbmcgdmFsdWVzIA0KPiA+ID4gK29mIHRoZXNl
DQo+ID4gPiArICogcHJvcGVydGllcy4gQGRybV94ZV91c2VyX2V4dGVuc2lvbiBiYXNlLm5hbWUg
c2hvdWxkIGJlIHNldCB0bw0KPiA+ID4gKyAqIEBEUk1fWEVfRVVfU1RBTExfRVhURU5TSU9OX1NF
VF9QUk9QRVJUWS4NCj4gPiA+ICsgKi8NCj4gPiA+ICtlbnVtIGRybV94ZV9ldV9zdGFsbF9wcm9w
ZXJ0eV9pZCB7DQo+ID4gPiArI2RlZmluZSBEUk1fWEVfRVVfU1RBTExfRVhURU5TSU9OX1NFVF9Q
Uk9QRVJUWQkJMA0KPiA+ID4gKwkvKioNCj4gPiA+ICsJICogQERSTV9YRV9FVV9TVEFMTF9QUk9Q
X0JVRl9TWjogUGVyIERTUyBNZW1vcnkgQnVmZmVyIFNpemUuDQo+ID4gPiArCSAqIFZhbGlkIHZh
bHVlcyBhcmUgMTI4IEtCLCAyNTYgS0IsIGFuZCA1MTIgS0IuDQo+ID4gPiArCSAqLw0KPiA+ID4g
KwlEUk1fWEVfRVVfU1RBTExfUFJPUF9CVUZfU1ogPSAxLA0KPiA+DQo+ID4gRG9lcyB1c2Vyc3Bh
Y2UgcmVhbGx5IGNhcmUgYWJvdXQgdGhpcyBiZWluZyBjb25maWd1cmFibGU/ICBFdmVuIGlmIA0K
PiA+IHdlIGhhdmUgYSBwbGF0Zm9ybSB3aXRoIFhFX01BWF9EU1NfRlVTRV9CSVRTIHRvdGFsIFhl
Q29yZXMsIHRoZSANCj4gPiBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGxhcmdlc3QgYW5kIHNtYWxs
ZXN0IHNpemVzIGhlcmUgb25seSBzYXZlcyA0OE1CIG9mIG1lbW9yeS4NCj4gPiBUaGUgaGFyZHdh
cmUgbWFrZXMgdGhpcyBjb25maWd1cmFibGUsIGJ1dCBpcyB0aGVyZSBhY3R1YWxseSBhbiBhc2sg
DQo+ID4gdG8gZXhwb3NlIHRoaXMgdGhyb3VnaCB0aGUgdWFwaT8gIElmIG5vdCwgSSdkIHNheSB3
ZSBzaG91bGQganVzdCANCj4gPiBhbHdheXMgcGljayA1MTJLQiBpbnRlcm5hbGx5IGFuZCBrZWVw
IHRoaW5ncyBzaW1wbGUuDQo+IA0KPiBBZ3JlZWQuDQo+IA0KPiA+DQo+ID4gPiArDQo+ID4gPiAr
CS8qKg0KPiA+ID4gKwkgKiBARFJNX1hFX0VVX1NUQUxMX1BST1BfU0FNUExFX1JBVEU6IFNhbXBs
aW5nIHJhdGUNCj4gPiA+ICsJICogaW4gbXVsdGlwbGVzIG9mIDI1MSBjeWNsZXMuIFZhbGlkIHZh
bHVlcyBhcmUgMSB0byA3Lg0KPiA+ID4gKwkgKiBJZiB0aGUgdmFsdWUgaXMgMSwgc2FtcGxpbmcg
aW50ZXJ2YWwgaXMgMjUxIGN5Y2xlcy4NCj4gPiA+ICsJICogSWYgdGhlIHZhbHVlIGlzIDcsIHNh
bXBsaW5nIGludGVydmFsIGlzIDcgeCAyNTEgY3ljbGVzLg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJ
RFJNX1hFX0VVX1NUQUxMX1BST1BfU0FNUExFX1JBVEUsDQo+ID4gPiArDQo+ID4gPiArCS8qKg0K
PiA+ID4gKwkgKiBARFJNX1hFX0VVX1NUQUxMX1BST1BfUE9MTF9QRVJJT0Q6IEVVIHN0YWxsIGRh
dGENCj4gPiA+ICsJICogcG9sbCBwZXJpb2QgaW4gbmFub3NlY29uZHMuIHNob3VsZCBiZSBhdCBs
ZWFzdCAxMDAwMDAgbnMuDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlEUk1fWEVfRVVfU1RBTExfUFJP
UF9QT0xMX1BFUklPRCwNCj4gPiA+ICsNCj4gPiA+ICsJLyoqDQo+ID4gPiArCSAqIEBEUk1fWEVf
RVVfU1RBTExfUFJPUF9FVkVOVF9SRVBPUlRfQ09VTlQ6IE1pbmltdW0gbnVtYmVyIG9mDQo+ID4g
PiArCSAqIEVVIHN0YWxsIGRhdGEgcm93cyB0byBiZSBwcmVzZW50IGluIHRoZSBrZXJuZWwgYnVm
ZmVyIGZvcg0KPiA+ID4gKwkgKiBwb2xsKCkgdG8gc2V0IFBPTExJTiAoZGF0YSBwcmVzZW50KS4N
Cj4gPiA+ICsJICovDQo+ID4gPiArCURSTV9YRV9FVV9TVEFMTF9QUk9QX0VWRU5UX1JFUE9SVF9D
T1VOVCwNCj4gPiA+ICsNCj4gPiA+ICsJLyoqDQo+ID4gPiArCSAqIEBEUk1fWEVfRVVfU1RBTExf
UFJPUF9HVF9JRDogR1QgSUQgb2YgdGhlIEdUIG9uIHdoaWNoDQo+ID4gPiArCSAqIEVVIHN0YWxs
IGRhdGEgd2lsbCBiZSBjYXB0dXJlZC4NCj4gPiA+ICsJICovDQo+ID4gPiArCURSTV9YRV9FVV9T
VEFMTF9QUk9QX0dUX0lELA0KPiA+DQo+ID4gSSBtZW50aW9uZWQgYWJvdmUsIGJ1dCBpdCBmZWVs
cyBsaWtlIHRoaXMgc2hvdWxkIGJlIGFuIGludHJpbnNpYyANCj4gPiBwYXJ0IG9mIHRoZSBBUEks
IG5vdCBzb21ldGhpbmcgY29taW5nIGluIHRocm91Z2ggYW4gb3B0aW9uYWwgZXh0ZW5zaW9uLi4u
DQo+IA0KPiBOb3Qgc3VyZSB3aGF0ICJpbnRyaW5zaWMgcGFydCBvZiB0aGUgQVBJIiBzaG91bGQg
YmUuIEVVIFN0YWxsLCBPQSBldGMuIA0KPiBhcmUgbm93IHR5cGVzIG9mICJvYnNlcnZhdGlvbiBz
dHJlYW1zIiBhbmQgdGhlcmUgaXMgbm8gb3RoZXIgDQo+IG9wcG9ydHVuaXR5IGluIHRoZSBvYnNl
cnZhdGlvbiBzdHJlYW0gaW50ZXJmYWNlIGZvciB0aGlzIGtpbmQgb2YgDQo+IGluZm9ybWF0aW9u
LiBBbHNvLCBndF9pZCBpcyBFVSBzdGFsbCBzcGVjaWZpYyAoZS5nLiBPQSB1c2VzIG9hX3VuaXRf
aWQgDQo+IG5vdCBndF9pZCkgc28gaXQgc2hvdWxkIGNvbWUgaW4gYXMgYW4gRVUgU3RhbGwgcHJv
cGVydHkuDQo+IA0KPiBUaG91Z2ggcXVlc3Rpb24gZm9yIEhhcmlzaDogZG8gd2UgcmVhbGx5IG5l
ZWQgdGhpcz8gV2hhdCBpZiB3ZSByZXR1cm4gDQo+IGRhdGEgZnJvbSBhbGwgdGlsZXMvZ3QncyBp
biBhIHNpbmdsZSByZWFkKCkgY2FsbD8gU2luY2Ugd2UgaGF2ZSANCj4gYWxyZWFkeSBkZXRlcm1p
bmVkIHN1YnNsaWNlIG51bWJlciBpcyBub3QgaW50ZXJlc3RpbmcgdG8gVU1EJ3MgZm9yIEVVIA0K
PiBTdGFsbCBkYXRhLCBtYXliZSBndF9pZCBpcyBzaW1pbGFybHkgbm90IGludGVyZXN0aW5nPw0K
VXNlciBzcGFjZSBmb2xrcyBzYWlkIHRoYXQgdGhleSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUgRVUg
c3RhbGwgZGF0YSBhdCB0aGUgR1QgbGV2ZWwuIFNvIGlmIHdlIGRlY2lkZSB0byByZXR1cm4gc3Rh
bGwgZGF0YSBmcm9tIGFsbCB0aGUgR1RzLCB3ZSBtYXkgaGF2ZSB0byBhcHBlbmQgdGhlIEdUIElE
IHRvIHRoZSBkYXRhLiBJIHdpbGwgc2VlayBmZWVkYmFjayBmcm9tIHRoZSB1c2VyIHNwYWNlIGZv
bGtzIHJlZ2FyZGluZyB0aGlzLg0KDQpbU2FudGhvc2hdICBZZXMuIEwwIGFsbG93cyBNZXRyaWMg
Y29sbGVjdGlvbiBhdCBhIHRpbGUgbGV2ZWwgZ3JhbnVsYXJpdHkuIA0KDQpUaGFua3MNCkhhcmlz
aC4NCj4gDQo+ID4NCj4gPiA+ICsNCj4gPiA+ICsJLyoqDQo+ID4gPiArCSAqIEBEUk1fWEVfRVVf
U1RBTExfUFJPUF9PUEVOX0RJU0FCTEVEOiBBIHZhbHVlIG9mIDEgd2lsbCBvcGVuDQo+ID4gPiAr
CSAqIHRoZSBFVSBzdGFsbCBkYXRhIHN0cmVhbSB3aXRob3V0IGVuYWJsaW5nIEVVIHN0YWxsIHNh
bXBsaW5nLg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJRFJNX1hFX0VVX1NUQUxMX1BST1BfT1BFTl9E
SVNBQkxFRCwNCj4gPg0KPiA+IElzIHRoZXJlIGEgcmVhc29uIG5vdCB0byBtYWtlIHRoaXMgb25l
IHRoZSBkZWZhdWx0IGJlaGF2aW9yPyAgSXMgDQo+ID4gdGhlcmUgcmVhbGx5IGEgYmVuZWZpdCB0
byBhdXRvLWVuYWJsaW5nIG9uIG9wZW4gdGhhdCBtYWtlcyBpdCB3b3J0aCANCj4gPiB0aGUgZXh0
cmEgQVBJIGNvbXBsZXhpdHkgdG8gbWFrZSB0aGlzIGNvbmZpZ3VyYWJsZT8NCj4gDQo+IEkgYWdy
ZWUsIHRoaXMgd291bGQgYmUgYSBnb29kIGlkZWEuIEJ1dCB1bmZvcnR1bmF0ZWx5IHRoaXMgZ290
IGluIGZvciANCj4gT0EgKGlmIEkgd2VyZSBkb2luZyBPQSBub3cgSSB3b3VsZCBoYXZlIHRha2Vu
IE1hdHQncyBzdWdnZXN0aW9uKS4gU28gDQo+IHdlIGVpdGhlcg0KPiAoYSkga2VlcCBpdCB0aGUg
c2FtZSBhcyBPQSBmb3IgdW5pZm9ybWl0eSwgb3IgKGIpIGRvY3VtZW50IHRoYXQgRVUgDQo+IHN0
YWxsIHN0cmVhbXMgaGF2ZSB0byBiZSBleHBsaWNpdHkgZW5hYmxlZCBiZWZvcmUgcmVhZCgpJ2lu
ZyBkYXRhLg0KPiANCj4gPg0KPiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiArLyoqDQo+ID4gPiAr
ICogc3RydWN0IGRybV94ZV9ldV9zdGFsbF9zdHJlYW1faW5mbyAtIEVVIHN0YWxsIHN0cmVhbSBp
bmZvIA0KPiA+ID4gK3JldHVybmVkIGZyb20NCj4gPiA+ICsgKiBARFJNX1hFX09CU0VSVkFUSU9O
X0lPQ1RMX0lORk8gb2JzZXJ2YXRpb24gc3RyZWFtIGZkIGlvY3RsICAqLyANCj4gPiA+ICtzdHJ1
Y3QgZHJtX3hlX2V1X3N0YWxsX3N0cmVhbV9pbmZvIHsNCj4gPiA+ICsJLyoqIEBleHRlbnNpb25z
OiBQb2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNpb24gc3RydWN0LCBpZiBhbnkgKi8NCj4gPiA+
ICsJX191NjQgZXh0ZW5zaW9uczsNCj4gPiA+ICsNCj4gPiA+ICsJLyoqIEByZWNvcmRfc2l6ZTog
c2l6ZSBvZiBlYWNoIEVVIHN0YWxsIGRhdGEgcmVjb3JkICovDQo+ID4gPiArCV9fdTY0IHJlY29y
ZF9zaXplOw0KPiA+ID4gKw0KPiA+ID4gKwkvKiogQHJlc2VydmVkOiByZXNlcnZlZCBmb3IgZnV0
dXJlIHVzZSAqLw0KPiA+ID4gKwlfX3U2NCByZXNlcnZlZFszXTsNCj4gPiA+ICt9Ow0KPiA+ID4g
Kw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIHN0cnVjdCBkcm1feGVfZXVfc3RhbGxfZGF0YV9wdmMg
LSBFVSBzdGFsbCBkYXRhIGZvcm1hdCBmb3IgUFZDDQo+ID4NCj4gPiBJIHRob3VnaHQgdGhlcmUg
d2FzIGFuIGFzayBmcm9tIG9uZSBvZiB0aGUgdXNlcnNwYWNlIHRlYW1zIHRoYXQgd2UgDQo+ID4g
bWFrZSB0aGUgbGF5b3V0IGRpc2NvdmVyYWJsZT8gIEkuZS4sIGEgcnVudGltZS1xdWVyeWFibGUg
Zm9ybWF0IA0KPiA+IGRlc2NyaXB0aW9uIHRoYXQgbGlzdHMgdGhlIGNvdW50ZXIgdHlwZSwgc2l6
ZSwgYW5kIG9mZnNldCBpbiB0aGUgDQo+ID4gcmVjb3JkIG9mIGVhY2ggY291bnRlciB0aGF0IGhh
cyB1c2FibGUgZGF0YSBpbiB0aGUgcmVjb3Jkcz8gIERpZCB3ZSANCj4gPiBjaGFuZ2UgZGlyZWN0
aW9ucyBvbiB0aGF0Pw0KDQpbU2FudGhvc2hdIFllcy4gRnJvbSBMMCwgdGhlcmUgd2FzIGEgcmVx
dWVzdCBtYWRlIHRvIGhhdmUgYSBydW50aW1lLXF1ZXJ5YWJsZSBmb3JtYXQuDQoNCj4gDQo+IE15
IHN1Z2dlc3Rpb24gaXMgdG8gZWxpbWluYXRlIHRoZXNlIHN0cnVjdCdzIGZyb20gdGhlIEtNRCB1
YXBpIGhlYWRlci4gDQo+IFNlZSBteSBlYXJsaWVyIHJlc3BvbnNlIHRvIEhhcmlzaCdzIHBhdGNo
Lg0KPiANCj4gVGhhbmtzLg0KPiAtLQ0KPiBBc2h1dG9zaA0KPiANCj4gDQo+ID4NCj4gPiA+ICsg
Kg0KPiA+ID4gKyAqIEJpdHMJCUZpZWxkDQo+ID4gPiArICogMCAgdG8gMjgJSVAgKGFkZHIpDQo+
ID4gPiArICogMjkgdG8gMzYJYWN0aXZlIGNvdW50DQo+ID4gPiArICogMzcgdG8gNDQJb3RoZXIg
Y291bnQNCj4gPiA+ICsgKiA0NSB0byA1Mgljb250cm9sIGNvdW50DQo+ID4gPiArICogNTMgdG8g
NjAJcGlwZXN0YWxsIGNvdW50DQo+ID4gPiArICogNjEgdG8gNjgJc2VuZCBjb3VudA0KPiA+ID4g
KyAqIDY5IHRvIDc2CWRpc3RfYWNjIGNvdW50DQo+ID4gPiArICogNzcgdG8gODQJc2JpZCBjb3Vu
dA0KPiA+ID4gKyAqIDg1IHRvIDkyCXN5bmMgY291bnQNCj4gPiA+ICsgKiA5MyB0byAxMDAJaW5z
dF9mZXRjaCBjb3VudA0KPiA+ID4gKyAqLw0KPiA+ID4gK3N0cnVjdCBkcm1feGVfZXVfc3RhbGxf
ZGF0YV9wdmMgew0KPiA+ID4gKwlfX3U2NCBpcF9hZGRyOjI5Ow0KPiA+ID4gKwlfX3U2NCBhY3Rp
dmVfY291bnQ6ODsNCj4gPiA+ICsJX191NjQgb3RoZXJfY291bnQ6ODsNCj4gPiA+ICsJX191NjQg
Y29udHJvbF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBwaXBlc3RhbGxfY291bnQ6ODsNCj4gPiA+
ICsJX191NjQgc2VuZF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBkaXN0X2FjY19jb3VudDo4Ow0K
PiA+ID4gKwlfX3U2NCBzYmlkX2NvdW50Ojg7DQo+ID4gPiArCV9fdTY0IHN5bmNfY291bnQ6ODsN
Cj4gPiA+ICsJX191NjQgaW5zdF9mZXRjaF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCB1bnVzZWRf
Yml0czoyNzsNCj4gPiA+ICsJX191NjQgdW51c2VkWzZdOw0KPiA+ID4gK30gX19hdHRyaWJ1dGVf
XygocGFja2VkKSk7DQo+ID4gPiArDQo+ID4gPiArLyoqDQo+ID4gPiArICogc3RydWN0IGRybV94
ZV9ldV9zdGFsbF9kYXRhX3hlMiAtIEVVIHN0YWxsIGRhdGEgZm9ybWF0IGZvciANCj4gPiA+ICtM
TkwsIEJNRw0KPiA+ID4gKyAqDQo+ID4gPiArICogQml0cwkJRmllbGQNCj4gPiA+ICsgKiAwICB0
byAyOAlJUCAoYWRkcikNCj4gPiA+ICsgKiAyOSB0byAzNglUZHIgY291bnQNCj4gPiA+ICsgKiAz
NyB0byA0NAlvdGhlciBjb3VudA0KPiA+ID4gKyAqIDQ1IHRvIDUyCWNvbnRyb2wgY291bnQNCj4g
PiA+ICsgKiA1MyB0byA2MAlwaXBlc3RhbGwgY291bnQNCj4gPiA+ICsgKiA2MSB0byA2OAlzZW5k
IGNvdW50DQo+ID4gPiArICogNjkgdG8gNzYJZGlzdF9hY2MgY291bnQNCj4gPiA+ICsgKiA3NyB0
byA4NAlzYmlkIGNvdW50DQo+ID4gPiArICogODUgdG8gOTIJc3luYyBjb3VudA0KPiA+ID4gKyAq
IDkzIHRvIDEwMAlpbnN0X2ZldGNoIGNvdW50DQo+ID4gPiArICogMTAxIHRvIDEwOAlBY3RpdmUg
Y291bnQNCj4gPiA+ICsgKiAxMDkgdG8gMTExCUV4aWQNCj4gPiA+ICsgKiAxMTIJCUVuZEZsYWcg
KGlzIGFsd2F5cyAxKQ0KPiA+ID4gKyAqLw0KPiA+ID4gK3N0cnVjdCBkcm1feGVfZXVfc3RhbGxf
ZGF0YV94ZTIgew0KPiA+ID4gKwlfX3U2NCBpcF9hZGRyOjI5Ow0KPiA+ID4gKwlfX3U2NCB0ZHJf
Y291bnQ6ODsNCj4gPiA+ICsJX191NjQgb3RoZXJfY291bnQ6ODsNCj4gPiA+ICsJX191NjQgY29u
dHJvbF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBwaXBlc3RhbGxfY291bnQ6ODsNCj4gPiA+ICsJ
X191NjQgc2VuZF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBkaXN0X2FjY19jb3VudDo4Ow0KPiA+
ID4gKwlfX3U2NCBzYmlkX2NvdW50Ojg7DQo+ID4gPiArCV9fdTY0IHN5bmNfY291bnQ6ODsNCj4g
PiA+ICsJX191NjQgaW5zdF9mZXRjaF9jb3VudDo4Ow0KPiA+ID4gKwlfX3U2NCBhY3RpdmVfY291
bnQ6ODsNCj4gPiA+ICsJX191NjQgZXhfaWQ6MzsNCj4gPiA+ICsJX191NjQgZW5kX2ZsYWc6MTsN
Cj4gPiA+ICsJX191NjQgdW51c2VkX2JpdHM6MTU7DQo+ID4gPiArCV9fdTY0IHVudXNlZFs2XTsN
Cj4gPiA+ICt9IF9fYXR0cmlidXRlX18oKHBhY2tlZCkpOw0KPiA+ID4gKw0KPiA+ID4gICNpZiBk
ZWZpbmVkKF9fY3BsdXNwbHVzKQ0KPiA+ID4gIH0NCj4gPiA+ICAjZW5kaWYNCj4gPiA+IC0tDQo+
ID4gPiAyLjQ1LjENCj4gPiA+DQo+ID4NCj4gPiAtLQ0KPiA+IE1hdHQgUm9wZXINCj4gPiBHcmFw
aGljcyBTb2Z0d2FyZSBFbmdpbmVlcg0KPiA+IExpbnV4IEdQVSBQbGF0Zm9ybSBFbmFibGVtZW50
DQo+ID4gSW50ZWwgQ29ycG9yYXRpb24NCg==
