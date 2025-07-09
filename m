Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DD2C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 18:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53B810E10F;
	Wed,  9 Jul 2025 18:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSiwvgrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79DA10E092
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 18:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752084283; x=1783620283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sn+u+PzIejpl1NPUuilng4kPluiheF9wz/yXEt5f5nI=;
 b=SSiwvgrNvOTBYSODHy33r4BB1qu2qHtWr5RDT6mLSnVIPVg3BDZUhCy0
 cjiLt45n9+Zzhwh3pqXioGTAeevlUOMWh92RktER114bQS5J9cslsSgNJ
 y7ZgcDIhjXFafaVIV8MdjvCsC9oCPJZi34SMkYSDlcL+JeWr+MCke+M1F
 D/Qt1GwYAIHTXmWX2h6EqFksYskuPQyI79+u9Iioz0RtOZcFRdjg99h4i
 Q4wNuCu3j6kT8YrOJWGsJX71ZxE+Kxov2ZIO6ieXcpZn1wesh8SUjnjd1
 WHC6O+kHIAhf39F8DEZa2zF6ZV4O5XRlLXSvtNyOVE1nwU5DnSl4ApouD Q==;
X-CSE-ConnectionGUID: BXalMOTsRtSJIwMEADeUOA==
X-CSE-MsgGUID: v9oU7XWBRci8Ky4jQi+Eyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54074510"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54074510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:04:42 -0700
X-CSE-ConnectionGUID: dSR6JSu5Q42rrpDwdHcKsA==
X-CSE-MsgGUID: STLJKMHkTLWYbljvvfztfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="161397068"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:04:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 11:04:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 11:04:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.76)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 11:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8/rAoNrXQBVscUCoZ67ZefN4qi/63Ut0cys6xDITWYvGDcKLBPEliqxdh3fxjkXR9SfASimGJ63DvurYmoNkk9B5Lwn7O264n82Ccql6t93T1S9RncXYy0izJs4xq5fVRcRIf+4Jo9K2B1S9esT76H+YggeZTlWrvcJohTXjJw8sZQmcESfxGkdUx9Muvxi6nXKgHXhZaPr0j0CFrKZze9w9spNr+VRlT6Y5angqPdT7lppp9a/069ziH3fLH7tsTZO3c0a8NEZ+dOvzXh6W32zgvtjMMIWrKQr6Twg5LJlh6Y3XSMv/wgYwkSibOdQi+ZhA9S2+t/cwcMNkasihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn+u+PzIejpl1NPUuilng4kPluiheF9wz/yXEt5f5nI=;
 b=F9CXA1egPXRo44T3bRjXyqqKHGdwzw9JORRrQKuAUdwGOqYNaN/410pOWuViKCr3qP+5i+BjxxLJCOFjmA0ygS0GDkDzsA/iTwiCT+L5oKz92StBbLVCIYPAzIwtu1apU9sWS+BNLKc1yhF2oQR/q45fZnMoq/MBsp00gi7DGpTlOMSNqfo8Tg21+JNopjFfuyOaibGp7puVSYy2pr3aKv/D7muIxgCoFbI+NPQVyczqXSAOWZJ8qz8enNrsWUIN+e1qzvnBHQOm9m+3tHkbL64HJ8MMTpegWhoEZ3ig81vjQ6nWlraGEBhtKDdJfFEQyCNdX5g+avvxclior1bKHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 18:04:38 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 18:04:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Thread-Topic: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Thread-Index: AQHb61fUF45e+ZRXTEiys71mYLUxv7QqISoA
Date: Wed, 9 Jul 2025 18:04:36 +0000
Message-ID: <0d56280d48bc707917bd1e11e3d93683a9de98f1.camel@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-4-riana.tauro@intel.com>
In-Reply-To: <20250702141118.3564242-4-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN2PR11MB4613:EE_
x-ms-office365-filtering-correlation-id: 4dcd1907-f87d-4eff-7f01-08ddbf1310aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c0hnREZvYW85VjRBUXYzbmRBamNjUnU1SFhWUVpGU2p1VzJlWkNCTTY3SUpC?=
 =?utf-8?B?cmNOSm9BZS9LQU0wSmdPUE15c3pPcytjQ3BSeERuYmVEWjYrZExPMlN3NUNk?=
 =?utf-8?B?VFc2M05ZSVZpWXdqWm4yQmdGOStJZVpHaVBJck1rWEl2UEhlTkFObG5ZSVg0?=
 =?utf-8?B?N1lDdGg4YVF5NXpFV0NNNk51MjRxcXF1dnBqZGdzVGhWWVY4blQrMDdXUm9S?=
 =?utf-8?B?bTIwR0tCckRtWkhybStJVzV6aGNKRWRZNVZLV3k4UXJFZjdSa2pwN1BNL3M3?=
 =?utf-8?B?L0pHRWxrMVpYeW1FcExoQSs1Z25UdFhURlhKYmROY2t3K1ZnMElaUC9QN3ZZ?=
 =?utf-8?B?QzRhOXE2T0phTHh2QzljRms3TjRLNjJmdGphQVVSL2NOMDZ6VTkwa0xwTDRX?=
 =?utf-8?B?cE45MDkyb2tacThNY3RaZUtWZ21nQzMrWU9GZVJXcmppcDhOTHRVOE12Y2pJ?=
 =?utf-8?B?S0RMOUFaenhUblZPelNYU0ZUeGZuRHEwTlR1U3RPWDNzVVBVYm5qZXdJNDVw?=
 =?utf-8?B?ZUZuVExBQlcxZ0ZmWUJVT1dWcUhVQnhxSGpVQ1ZCNjlDMzMyRWxBdFczRU5W?=
 =?utf-8?B?WHFpVlpRaVlaMXFWWkdEZ3FFbnNXTGk1aE52cThqNkxPYUNEclJxajl6ZDlt?=
 =?utf-8?B?dXFSOGY4ekV5dDFOMUx4Q2p3U0tyRGVSTTlEQjN2NnRnZk93eDdDRWxXbm5U?=
 =?utf-8?B?MTc3enlWUFN0aUlERjlxdEk4cnBQL09lbUo1cVFvNlVCb295aXFTRGpkWEJF?=
 =?utf-8?B?S2t5azNyRzhSa0QzV1Z3OGsrREhXY2VTckY5ODZwNDJQWE9Kd2JzUkVxUnN3?=
 =?utf-8?B?ZkkzRGRmOUwxU1hCYm1PMGtKYklsaDZxSnNHNW1vR1lkZzE0bnJoV2gxOXhD?=
 =?utf-8?B?RzRxMnZCY3FXY29telJXNnhCRENIRFdpeGZxcE01bmhtYmNOQjdxYUkxY0s2?=
 =?utf-8?B?ckRuT05UbkNteGUwWmhYQlFqSEJwazNzeTlyL2ZQT1p3OURWeFo5Z3FzdkEx?=
 =?utf-8?B?WEUyaWM5NEJWRFdTMHhGNGtCdG1pSmRtd2tiOUp6RFpOZzljNFVYejRick9x?=
 =?utf-8?B?NlZLZDNxRGRWblBVeG9BYlF3QlZCQVpCVWtyNDJJYjNsN1hnZmh2NEJNRDMr?=
 =?utf-8?B?dGRmV1MzeUtpUUxZNUZKTVdGb2J5MmFzQUMvc1h5bmhpcjIwcE85bjZHNE9S?=
 =?utf-8?B?NFN6aDhBaUVlL1lqMll6NTRDVlNEREdGM045aWpoYU9BNmVRdWJUUVNxYWdC?=
 =?utf-8?B?RGd4RURFbUlicjRwdVZTWFlJMytFUzhkWXk3QWY0amVNdGQydG90NzR2Z0pn?=
 =?utf-8?B?SGdOaC83SUZVdk1XZnFoVmFqeHlpNUFBVWllTjRVUXQ2RkY3VXhENzdOZG0w?=
 =?utf-8?B?THpuU1ZVRm5xczZiZmNQcHpNcHMvV0JESU9PaUdYeUQ1djJnVUxocHlnMGgy?=
 =?utf-8?B?STFGN0t3ak1kZC9xM05OaURXQkFraFlkKzFHSlpJRFZmOFU4c3N6VXNMWmdn?=
 =?utf-8?B?Si9YV3NNZGVhaDc0ZUt4b3hUWWJUZGd5N2RLdExxbU0xY2JER2ZDWjFsYm1I?=
 =?utf-8?B?TVVBSjZpUFg2OVFNd2s3MXRZSWZxajV6eGp1djkyZ1daR3dYSFpxam5Yaitt?=
 =?utf-8?B?cUt0dlZQMndmSXZSM0NCZWZudU5JekFCanljVUw1MDhwM05YWGR2dUdId2tV?=
 =?utf-8?B?TjM5M3cwQzYyT3ZQa0FBTExlLzNPMW01Wkt2VnJMOFdtYzFDTm55VExyOTVY?=
 =?utf-8?B?ZVBkSmJkSCtweGwyWG9oRGV1bFRNOCtYc0lkdjhXeFVzSDRabndVakJpQ1hG?=
 =?utf-8?B?Wmt5WGtoRE1rZ1JITnhqUm8xdmFoVW11dkF6TW52T2xnaW9pT3NJUVN4Q1Qy?=
 =?utf-8?B?NFM2aHJKQjIweFFGTmROQk9QTUxGOUdpdm5nTm42dzFlQ2lYbVV2MkV1NWFz?=
 =?utf-8?B?QnZWbDZsUmNhVWFiSlZkVWlZVXoxaE05K2pTSVVyckRsUE1VdGk3NW1ZYjVp?=
 =?utf-8?B?bCt1bzRhcGF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wjl0a1cyU09hSDdGRVV4QUNYOHprRkNQT3kxazVONTBIbFl6bHptUnBEbkZn?=
 =?utf-8?B?UE1DcWJNL3VzQ3ZmejFGTjRwdmdzMGFZMFNDZnF4UnZhYU9KUlpMNjhkVmlh?=
 =?utf-8?B?Z1VBT0RIeFFnZWJGcXhraHp5b3YvSHczK1R4c2pQd0swb0tOMjBucEhrMXRN?=
 =?utf-8?B?S3RmWGNiaFhJc083djR5enkvaXFhbm1VVWlOOTQ4czlicE4rSTJTdDdyREo0?=
 =?utf-8?B?bjMzNCsvQ0dPOVl0MEtOV0hTYlZZdjk2WFR2dXlZWWtPNWFRN3dTeHpmWDBz?=
 =?utf-8?B?UTBWMGFOQ0ovcjJMSTIwZ24yeGs0bTQ0alJBby9vRGI1eG1hM09UQTlFUC9o?=
 =?utf-8?B?Z05RM3FLaDBPNG9uQ20zWVFWQ3g1L0laQVpxbUdwODQvazA2UWgvakdkakcv?=
 =?utf-8?B?c1g2NzRzRnhoeXY4M2dQV2JVZjM3NDVJZTVFQkpJUXhMZnVXbk5FUUdQdkJq?=
 =?utf-8?B?bVZNL0Eya2UrV3hwTHN4ZUc0NFJDbWlqMjlYV1UveVF6bkEvYy9jZVhBRmlX?=
 =?utf-8?B?MVVvTGQrSmlueVBNTDFldnVSVE51NDU5L0RmblBLcHlMTEt2Y0dmcDh3TVMr?=
 =?utf-8?B?TWY0dTgxcWJHMEFlaTRIVFlnUnBNTStKQ3dHQjIyekRDeGRYdGpwcGNIeHN3?=
 =?utf-8?B?dW52emFHWWNja1M4WG5JRmRNRlZjRTVvd2hTbFZwa3YwTUd0NlJzTTZRc1pp?=
 =?utf-8?B?MmQ0REVMNmNrcGJScnFYRFBvZVZScVJyQmd6NzhvanF6OFZ5dXRxMUlSczFI?=
 =?utf-8?B?dmE0cDBsNG1UY3VQM0h0WXp2WmNDMjE0bDRsN1hBemJxQ1AyLzBtSnByTXNk?=
 =?utf-8?B?a0xURVI0bXpsVGE0QWlZdnEvbk1CYWRrUEUxWU8zUlVPb3E1dG0zSVpuMzR3?=
 =?utf-8?B?b1Q0SlZMYWllRmVLQS95RlgyZHJUSk5mM0tzYWFlV1lwYmFnUVBVa0dxOEVz?=
 =?utf-8?B?UjlxbHQ1K3FNRGljMjlCcUZwbU1CUmJLUVc0WTNhQ0ZvT282eVF0RGMwRzFL?=
 =?utf-8?B?RU5CaGwxcjFQU0N3bVNQbWpuQ0d0QUVhTHdXRFVTTVpNekJtTWlUTWZYM3ha?=
 =?utf-8?B?YWlhdnJtUUY2RFhBbVNxZGx4SDF5ZEpRZHFwS2E0UktFaUtDbCsrSWs2TENs?=
 =?utf-8?B?Mld1dWtHV0JXc1VNbjBSOWNpK0tOUFhqZ29ZbW1ERjZPYk8yR3JVS3ZuVVZs?=
 =?utf-8?B?VTlUL2J3R1lpYTFjWjBvMytSR1JNR2NFUnlHYkJiS3Z5N1hZNy9SZmU2YzVP?=
 =?utf-8?B?SUM0bVc2azhVYko2dG83MXJoNlh4OWc5SnN3c3ZwNkxnbkRQamRTTThreGps?=
 =?utf-8?B?YWlUZjRQQnoyWWRsV1BuSFVPMURoaTk0WlBJeGZqVG5lT2VYUVVyTnFNQk9q?=
 =?utf-8?B?RnFWRERoQmNxc3kzTHBaUTdOdHNwelVtbUVlVmw5aUtXKzl4VytVT2FFdUll?=
 =?utf-8?B?QndtS3NwanBqeTRiT0hzR0l3RHFUeHRneHZWZ2J0ODFBNEhkYko1WEZxOVRt?=
 =?utf-8?B?UWs5ZHd5WU9aZWVKbVNpVmRkU2ZNcElOK2hoZ1YvL3RHTUJidGNzNFhiSmNF?=
 =?utf-8?B?NEdtKy8yVlhDb2RkR3h2VlV3R1VScGdNUENTeVNVYk1nU0pYb2FQYXJmL1pn?=
 =?utf-8?B?L2tEczhoYTJTZ25Dd3VTUzYyV3cwUm5mNWc3VGJ1cGoxVk5XK0dTTXZ6emZp?=
 =?utf-8?B?OW1HNGFNdFMzbFZjNG56WFEybDloWEl2R21SRGhvWTN2NHZDT2dEWlVFdUc5?=
 =?utf-8?B?dXd2RnJucjE1YktqbU15OWpYS2J5YWFUb2pwa0gwWWM4emsvZFVsK0lpK0tC?=
 =?utf-8?B?K0sxYmlNcEVOUXo4ZkVBK0dBK1VnWXEwckIvS3ljR2FKcTV4MTJ3OEREa3BW?=
 =?utf-8?B?SkcwbkN4R0w3TEZ5TW5YUUF5UGtSS0ZKc24wcEFpcm9XN0lrM0ErVUNCcDJz?=
 =?utf-8?B?YmR0ekFBUUhVS09PT3BCU01NdkVnVGRQaCtvTVpGMGNpaXY0aC9BVnVJSEhm?=
 =?utf-8?B?NnJWanVZZ0FjMjhjSEpqT1V2RVlXZENFNUExdWIydHhBOW5zeUM5MVk0eDgx?=
 =?utf-8?B?SEhRMGx4NVI0N3drVnMzdzhrRFI1R0RwQnZxZGw0dXFRRFhTOFdpOEZUTnJB?=
 =?utf-8?B?RFdVRTc1SGJhUWZlRUNoblBxek9USGEzWnd1c1ZtdWp1U1lHUklFeDd5NUFY?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16872D621CE7344BB36CDEAA2BF22A88@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcd1907-f87d-4eff-7f01-08ddbf1310aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 18:04:36.1133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JfIzDnw5xY5f4z+qAHAb1C28vbi4uOmMEwqljuJ7u1pV4W5+xrjwIKyIRb/Nrx9jo83crwVG+Tpt5fgU81qoHjPkWVtU0+3L03sMHBLYDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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

T24gV2VkLCAyMDI1LTA3LTAyIGF0IDE5OjQxICswNTMwLCBSaWFuYSBUYXVybyB3cm90ZToNCj4g
Q2VydGFpbiBydW50aW1lIGZpcm13YXJlIGVycm9ycyBjYW4gY2F1c2UgdGhlIGRldmljZSB0byBi
ZSB3ZWRnZWQNCj4gcmVxdWlyaW5nIGEgZmlybXdhcmUgZmxhc2ggdG8gcmVzdG9yZSBub3JtYWwg
b3BlcmF0aW9uLg0KPiBSdW50aW1lIFN1cnZpdmFiaWxpdHkgTW9kZSBpbmRpY2F0ZXMgdGhhdCBh
IGZpcm13YXJlIGZsYXNoIGlzDQo+IG5lY2Vzc2FyeSB0bw0KPiByZWNvdmVyIHRoZSBkZXZpY2Uu
DQoNCkknbSBub3QgdW5kZXJzdGFuZGluZyB3aHkgd2UgbmVlZCB0byBvdmVybG9hZCBzdXJ2aXZh
YmlsaXR5IG1vZGUgaGVyZQ0KaW4gdGhlIGNhc2Ugb2YgYSBDU0MgKG9yIG90aGVyIGhhcmR3YXJl
IGVycm9yKSBmYWlsdXJlLiBJIHNlZSB0aGVyZSBpcw0Kc29tZSB2ZXNjIGluaXRpYWxpemF0aW9u
IHRoYXQgaGFwcGVucyB0aGVyZSBhbmQgR1NDIGluaXRpYWxpemF0aW9uDQoobmVlZCB0byBsb29r
IGZ1cnRoZXIsIGJ1dCBwcmVzdW1hYmx5IHRoaXMgcHV0cyBHU0MgaW4gYSBzdXJ2aXZhYmlsaXR5
DQpzdGF0ZSBhbHNvPykuIEJ1dCB3ZSBhbHJlYWR5IGhhdmUgdGhlIHZlbmRvciBzcGVjaWZpYyB3
ZWRnZS4gRG8gd2UNCnJlYWxseSBuZWVkIHRoZSBleHRyYSBob29rIHRvIHN1cnZpdmFiaWxpdHkg
bW9kZSB3aGljaCB3YXMgcmVhbGx5IGJ1aWx0DQphcyBhIGJvb3QgdGltZSBjb25maWcuDQoNClRo
YW5rcywNClN0dWFydA0KDQo+IA0KPiBUaGUgYmVsb3cgc3lzZnMgaXMgYW4gaW5kaWNhdGlvbiB0
aGF0IGRldmljZSBpcyBpbiBzdXJ2aXZhYmlsaXR5IG1vZGUNCj4gDQo+IC9zeXMvYnVzL3BjaS9k
ZXZpY2VzLzxkZXZpY2U+L3N1cml2YWJpbGl0eV9tb2RlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBS
aWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
Ky0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmPCoMKgwqAg
fCAyNiArKysrKysrKysrKysrKysrLQ0KPiAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9z
dXJ2aXZhYmlsaXR5X21vZGUuaMKgwqDCoCB8wqAgNCArKy0NCj4gwqAuLi4vZ3B1L2RybS94ZS94
ZV9zdXJ2aXZhYmlsaXR5X21vZGVfdHlwZXMuaMKgIHzCoCA4ICsrKysrKw0KPiDCoDQgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmMNCj4gaW5kZXggNGEzODQ4NmRjY2M4Li41ZGVmYTU0Y2NkMjYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gQEAgLTcxNiw3ICs3MTYsNyBAQCBpbnQgeGVfZGV2
aWNlX3Byb2JlX2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIHBvc3NpYmxlLCBidXQgc3RpbGwgcmV0dXJuIHRoZSBwcmV2aW91
cyBlcnJvciBmb3INCj4gZXJyb3INCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBwcm9wYWdhdGlvbg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfc3Vydml2YWJpbGl0eV9tb2Rl
X2VuYWJsZSh4ZSk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9z
dXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlKHhlLA0KPiBYRV9TVVJWSVZBQklMSVRZX1RZUEVfQk9P
VCk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsNCj4g
wqANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21v
ZGUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYw0KPiBp
bmRleCAxZjcxMGIzZmM1OTkuLmUxYWRjYjMzYzliMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYw0KPiBAQCAtMTI5LDcgKzEyOSwxMCBAQCBzdGF0
aWMgc3NpemVfdCBzdXJ2aXZhYmlsaXR5X21vZGVfc2hvdyhzdHJ1Y3QNCj4gZGV2aWNlICpkZXYs
DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfc3Vydml2YWJpbGl0eV9pbmZvICppbmZvID0g
c3Vydml2YWJpbGl0eS0+aW5mbzsNCj4gwqDCoMKgwqDCoMKgwqDCoGludCBpbmRleCA9IDAsIGNv
dW50ID0gMDsNCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgZm9yIChpbmRleCA9IDA7IGluZGV4IDwg
TUFYX1NDUkFUQ0hfTU1JTzsgaW5kZXgrKykgew0KPiArwqDCoMKgwqDCoMKgwqBjb3VudCArPSBz
eXNmc19lbWl0X2F0KGJ1ZmYsIGNvdW50LCAiU3Vydml2YWJpbGl0eSBtb2RlOg0KPiAlc1xuIiwN
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Vydml2YWJpbGl0eS0+dHlwZSA/ICJSdW50aW1lIiA6DQo+ICJCb290Iik7DQo+ICsN
Cj4gK8KgwqDCoMKgwqDCoMKgZm9yIChpbmRleCA9IDA7IHN1cnZpdmFiaWxpdHktPmJvb3Rfc3Rh
dHVzICYmIGluZGV4IDwNCj4gTUFYX1NDUkFUQ0hfTU1JTzsgaW5kZXgrKykgew0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChpbmZvW2luZGV4XS5yZWcpDQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvdW50ICs9IHN5c2ZzX2Vt
aXRfYXQoYnVmZiwgY291bnQsICIlczogMHgleA0KPiAtIDB4JXhcbiIsIGluZm9baW5kZXhdLm5h
bWUsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluZm9baW5kZXhdLnJl
ZywNCj4gaW5mb1tpbmRleF0udmFsdWUpOw0KPiBAQCAtMTY5LDYgKzE3MiwxMCBAQCBzdGF0aWMg
aW50IGVuYWJsZV9zdXJ2aXZhYmlsaXR5X21vZGUoc3RydWN0DQo+IHBjaV9kZXYgKnBkZXYpDQo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldHVybiByZXQ7DQo+IMKgDQo+ICvCoMKgwqDCoMKgwqDCoC8qIE9ubHkgY3JlYXRlIHN5
c2ZzIGZvciBydW50aW1lIHN1cnZpdmFiaWxpdHkgbW9kZSAqLw0KPiArwqDCoMKgwqDCoMKgwqBp
ZiAoeGVfc3Vydml2YWJpbGl0eV9tb2RlX2lzX3J1bnRpbWUoeGUpKQ0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ICsNCj4gwqDCoMKgwqDCoMKgwqDCoC8qIE1h
a2Ugc3VyZSB4ZV9oZWNpX2dzY19pbml0KCkga25vd3MgYWJvdXQgc3Vydml2YWJpbGl0eQ0KPiBt
b2RlICovDQo+IMKgwqDCoMKgwqDCoMKgwqBzdXJ2aXZhYmlsaXR5LT5tb2RlID0gdHJ1ZTsNCj4g
wqANCj4gQEAgLTE4OSw2ICsxOTYsMTcgQEAgc3RhdGljIGludCBlbmFibGVfc3Vydml2YWJpbGl0
eV9tb2RlKHN0cnVjdA0KPiBwY2lfZGV2ICpwZGV2KQ0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7DQo+IMKgfQ0KPiDCoA0KPiArLyoqDQo+ICsgKiB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfaXNf
cnVudGltZSAtIGNoZWNrIGlmIHN1cnZpdmFiaWxpdHkgbW9kZSBpcw0KPiBydW50aW1lDQo+ICsg
KiBAeGU6IHhlIGRldmljZSBpbnN0YW5jZQ0KPiArICoNCj4gKyAqIFJldHVybnMgdHJ1ZSBpZiBp
biBydW50aW1lIHN1cnZpdmFiaWxpdHkgbW9kZSwgZmFsc2Ugb3RoZXJ3aXNlDQo+ICsgKi8NCj4g
K2Jvb2wgeGVfc3Vydml2YWJpbGl0eV9tb2RlX2lzX3J1bnRpbWUoc3RydWN0IHhlX2RldmljZSAq
eGUpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiB4ZS0+c3Vydml2YWJpbGl0eS50eXBl
ID09DQo+IFhFX1NVUlZJVkFCSUxJVFlfVFlQRV9SVU5USU1FOw0KPiArfQ0KPiArDQo+IMKgLyoq
DQo+IMKgICogeGVfc3Vydml2YWJpbGl0eV9tb2RlX2lzX2VuYWJsZWQgLSBjaGVjayBpZiBzdXJ2
aXZhYmlsaXR5IG1vZGUgaXMNCj4gZW5hYmxlZA0KPiDCoCAqIEB4ZTogeGUgZGV2aWNlIGluc3Rh
bmNlDQo+IEBAIC0yNTEsMTYgKzI2OSwxOCBAQCBib29sIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9p
c19yZXF1ZXN0ZWQoc3RydWN0DQo+IHhlX2RldmljZSAqeGUpDQo+IMKgICogUmV0dXJuOiAwIGlm
IHN1cnZpdmFiaWxpdHkgbW9kZSBpcyBlbmFibGVkIG9yIG5vdCByZXF1ZXN0ZWQ7DQo+IG5lZ2F0
aXZlIGVycm9yDQo+IMKgICogY29kZSBvdGhlcndpc2UuDQo+IMKgICovDQo+IC1pbnQgeGVfc3Vy
dml2YWJpbGl0eV9tb2RlX2VuYWJsZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gK2ludCB4ZV9z
dXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBjb25zdCBlbnVt
DQo+IHhlX3N1cnZpdmFiaWxpdHlfdHlwZSB0eXBlKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCB4ZV9zdXJ2aXZhYmlsaXR5ICpzdXJ2aXZhYmlsaXR5ID0gJnhlLT5zdXJ2aXZhYmls
aXR5Ow0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3N1cnZpdmFiaWxpdHlfaW5mbyAqaW5m
bzsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldih4
ZS0+ZHJtLmRldik7DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmICgheGVfc3Vydml2YWJpbGl0
eV9tb2RlX2lzX3JlcXVlc3RlZCh4ZSkpDQo+ICvCoMKgwqDCoMKgwqDCoGlmICgheGVfc3Vydml2
YWJpbGl0eV9tb2RlX2lzX3JlcXVlc3RlZCh4ZSkgJiYNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
IHR5cGUgIT0gWEVfU1VSVklWQUJJTElUWV9UWVBFX1JVTlRJTUUpDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBzdXJ2
aXZhYmlsaXR5LT5zaXplID0gTUFYX1NDUkFUQ0hfTU1JTzsNCj4gK8KgwqDCoMKgwqDCoMKgc3Vy
dml2YWJpbGl0eS0+dHlwZSA9IHR5cGU7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBpbmZvID0g
ZGV2bV9rY2FsbG9jKHhlLT5kcm0uZGV2LCBzdXJ2aXZhYmlsaXR5LT5zaXplLA0KPiBzaXplb2Yo
KmluZm8pLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgR0ZQX0tFUk5FTCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfc3Vydml2YWJpbGl0eV9tb2RlLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2
YWJpbGl0eV9tb2RlLmgNCj4gaW5kZXggMDIyMzFjMmJmMDA4Li41NTlkMWU5OWIwM2EgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmgNCj4gQEAgLTks
OSArOSwxMSBAQA0KPiDCoCNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiDCoA0KPiDCoHN0cnVj
dCB4ZV9kZXZpY2U7DQo+ICtlbnVtIHhlX3N1cnZpdmFiaWxpdHlfdHlwZTsNCj4gwqANCj4gLWlu
dCB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4g
K2ludCB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBj
b25zdCBlbnVtDQo+IHhlX3N1cnZpdmFiaWxpdHlfdHlwZSk7DQo+IMKgYm9vbCB4ZV9zdXJ2aXZh
YmlsaXR5X21vZGVfaXNfZW5hYmxlZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ICtib29sIHhl
X3N1cnZpdmFiaWxpdHlfbW9kZV9pc19ydW50aW1lKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4g
wqBib29sIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pc19yZXF1ZXN0ZWQoc3RydWN0IHhlX2Rldmlj
ZSAqeGUpOw0KPiDCoA0KPiDCoCNlbmRpZiAvKiBfWEVfU1VSVklWQUJJTElUWV9NT0RFX0hfICov
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2Rl
X3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlX3R5
cGVzLmgNCj4gaW5kZXggMTlkNDMzZTI1M2RmLi4wMWYwN2Q5YzQxMjQgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGVfdHlwZXMuaA0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlX3R5cGVzLmgNCj4gQEAg
LTksNiArOSwxMSBAQA0KPiDCoCNpbmNsdWRlIDxsaW51eC9saW1pdHMuaD4NCj4gwqAjaW5jbHVk
ZSA8bGludXgvdHlwZXMuaD4NCj4gwqANCj4gK2VudW0geGVfc3Vydml2YWJpbGl0eV90eXBlIHsN
Cj4gK8KgwqDCoMKgwqDCoMKgWEVfU1VSVklWQUJJTElUWV9UWVBFX0JPT1QsDQo+ICvCoMKgwqDC
oMKgwqDCoFhFX1NVUlZJVkFCSUxJVFlfVFlQRV9SVU5USU1FLA0KPiArfTsNCj4gKw0KPiDCoHN0
cnVjdCB4ZV9zdXJ2aXZhYmlsaXR5X2luZm8gew0KPiDCoMKgwqDCoMKgwqDCoMKgY2hhciBuYW1l
W05BTUVfTUFYXTsNCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiByZWc7DQo+IEBAIC0zMCw2ICszNSw5
IEBAIHN0cnVjdCB4ZV9zdXJ2aXZhYmlsaXR5IHsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoC8q
KiBAbW9kZTogYm9vbGVhbiB0byBpbmRpY2F0ZSBzdXJ2aXZhYmlsaXR5IG1vZGUgKi8NCj4gwqDC
oMKgwqDCoMKgwqDCoGJvb2wgbW9kZTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAvKiogQHR5cGU6
IHN1cnZpdmFiaWxpdHkgbW9kZSB0eXBlIChib290IG9yIHJ1bnRpbWUpICovDQo+ICvCoMKgwqDC
oMKgwqDCoGVudW0geGVfc3Vydml2YWJpbGl0eV90eXBlIHR5cGU7DQo+IMKgfTsNCj4gwqANCj4g
wqAjZW5kaWYgLyogX1hFX1NVUlZJVkFCSUxJVFlfTU9ERV9UWVBFU19IXyAqLw0KDQo=
