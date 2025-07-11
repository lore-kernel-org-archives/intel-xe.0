Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AFCC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5816710E3B0;
	Fri, 11 Jul 2025 16:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6BCkDxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B9C10E3B0
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752252650; x=1783788650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1hQGsL6/FmCD/UyBRLqqLFhYt26wzF/GXMHEtZsyNOQ=;
 b=B6BCkDxqZw1mAhdcUGnW6U02IQZ9Zs6G0YjeraUqKxFXUSJST9Xw8JRL
 TdQtTFBtqJmBvz6hKeS4P6FsvY4fTkzrBx59uketyxaPcKkzZpICDvTl+
 kqjXOfsYdLUYZFgZwvHprVHvDGIeag3ymv2ds7obbue3q0nzChe6xJOpb
 rPPiu9V0rGLLWq3unycVsPtAPuLtuLVcx51bAAPlwaeE8Me2gkQqRKJMW
 PYW8SORFy5seFMnwzDzkCMQNln7ppDHJWAzmgJxRvf0b/7vaaYylaD9kE
 5BRi19i/io1JjXDvwLpZ0yv4ZNGeDDNvNYAEy3HwQu4fVZI8V9qqrDokJ g==;
X-CSE-ConnectionGUID: gRK6mR7WTXqCDGR3Wev7rQ==
X-CSE-MsgGUID: jDCykY1IQnyPns2gaNY5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53665168"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="53665168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:50:50 -0700
X-CSE-ConnectionGUID: xGFpPWdRQwa44RMtduCJfg==
X-CSE-MsgGUID: 8ezLmi5BTwS2OqYB+Uqefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="187387350"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:50:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:50:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 09:50:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:50:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+7LYC+9yPrYLQgZSjTh0lj9BCZC4ERRDY0XJgfcYoNZZnOW0TIy/RUHkC/P/qynOiI9nflpzsmGV7IOexXOw8bJnOZo62eiVNzTe6s+NcU3xaa8r7+r0zPCu1D1CqKLp9jk81bo0bu9/PZewx+GKQ+d4nrfpGurKypeHXvazY1dguRlcvKV2z6E94Iy3WYxz+/rTkdAN5HiWETWfFDCTXR76g2f3cJznjfaIcvpXcYDJdmm8lhkIXIxLTiRbUW6LZVyqD/AddD2eeDd9fCUkZPa7NzMbJy31L43y9KL5pmd0GYcfZvBzzwWq+GcsoXeuYPLDw8QQHuMjSt9dURQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hQGsL6/FmCD/UyBRLqqLFhYt26wzF/GXMHEtZsyNOQ=;
 b=u+A0yQkPe1NZYs9G3SHNau+Xa9VehPjcdCX5LrPEzE2jEkOK2K2d5YlSDQnafSPvC36tJQL15Hfq2HQXln0Z2BPYA6dZ2I5qY+U05KnHWLB+PbpwSAB4r8UcvOqUR48ftGfTPCaOSnB+I2fIqDaZjiQRRSLS4vO4k+thgtxmwI4grDGhtu7kIPuN/bmPeRSoM8V24RCTCOmm7tTbKMmJjmF1JjOfC+eVdvWUl98sNRn4x0qeDOgoLRgSlwl7EThig1BU1FH1KlyCpnINHzruH7KiJnUdTQCKH07kYWuJWoSo5sCvs3BGMZLOO3gjgvfUIwq1WQ8ygKefcZIAvQ043g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 16:50:45 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 16:50:44 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move page fault init after topology init
Thread-Topic: [PATCH] drm/xe: Move page fault init after topology init
Thread-Index: AQHb8c5fpuImmq5hQ02lKybd9fjshbQtB9IAgAAVcgCAAAEWgIAABeqA
Date: Fri, 11 Jul 2025 16:50:44 +0000
Message-ID: <0197b86d80323ffdf6501ffc1329d2736b7bfbd7.camel@intel.com>
References: <20250710191208.1040215-1-matthew.brost@intel.com>
 <25add0bffd0a1a561aef4e32074c93b73ef6fd01.camel@intel.com>
 <aHE7BHmgZSRpcxr+@lstrano-desk.jf.intel.com>
 <ae1477a49443fc4c5c9c80e8935d259d7be8141d.camel@intel.com>
In-Reply-To: <ae1477a49443fc4c5c9c80e8935d259d7be8141d.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB8033:EE_
x-ms-office365-filtering-correlation-id: 8cfe8c94-137e-45a4-ba5f-08ddc09b143f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U1NaWlpqSlU0eGtTY21CbFF5Mlo0c3dFRFNXZ2tqNFZLOTd5YkdaNXYzM2xz?=
 =?utf-8?B?RVpDS0Rvb2wvUjRCVkMvQjczKzUxa2pPL1A1ZStvbmRudThDcm1GNnZMR1RF?=
 =?utf-8?B?SDNIRitRZ0NCRDNFaUY1bkx6dlR3aXVmQ2J1Ky9FUUd1Q1BWRDBXMjV0UXlF?=
 =?utf-8?B?MWRFa3daajB6M3Jqb0dNcmpzU1U2UDFVL21uUEx6VENQZzBvQ1FIOHlNcHQy?=
 =?utf-8?B?OWJwQlBJT0JLcnd0emJXT3FGSVNiZVMwVlVqQUFodkwrUmNMMFRIbGZFRGlW?=
 =?utf-8?B?ZXBpVWJCS2pBUExRdWNKUkZkQ3NYclNrTkx5VW84MHprL2E0dC9ERGNIL3dR?=
 =?utf-8?B?Y09DamVjNmlxNm1pUVZkMnJ2ZmdhaFZCMUQ1WmMvTFJRNWZwOVNXdmRZN241?=
 =?utf-8?B?UHhTd25sT20xK0MzdGlicXkxUmpYdzBYNDFQa1hWK2JRQlZhVmpVTnZsNWlI?=
 =?utf-8?B?Q05BTkJ2OU8vY2p1K3JDcGY5eXA5Ni9ROThrY1JjWVliYU9NTUhVU0FhNVha?=
 =?utf-8?B?UStWOEt2V1dvZmQ5bjAranFkNjdXS0J0MXgzVnJlM2UzVmtpM0FOVVRiOU1t?=
 =?utf-8?B?WERQb1ZpRm01SHpXQ1hUWlVBdmR5NE5Kckg4bTlwYXlNa3hSNllSUnMwSlhI?=
 =?utf-8?B?V2ltWVhwUjJFU0dNb2ZNTU02U2VwNTUvMzhGUDBaeTMvcm5UVHZSMXFLUTNn?=
 =?utf-8?B?R2h6VFY1VDBxZmtlbnZCWmVqVHRTMFZ2Tk1pZFFyOWJGL3ZVWXZEYmt6TEt1?=
 =?utf-8?B?RFpONmdLYm9mVXdQSFY3ckdPU0hqdFpGSFZGTjJRdmNMSWNpYUhBY0dQc1Ju?=
 =?utf-8?B?dStCVGpIUElkRG9ZMCtSdWw0ZWhOa1h2V0w4bUJXM2FyaE5UWjNlczhuLzk4?=
 =?utf-8?B?V3pJdWQ5akRqWkJ2eW44RnJKMWlSZitDY2pEQ1BNNyt3VnlvREFtcGtUVmJQ?=
 =?utf-8?B?alM0Y1kvcjN4MnV5R1pyZXo0a3BERGdyN0o1eDdjNWZzSlMzalZ0U2JIWTBX?=
 =?utf-8?B?REN1M1djM3VUdzVlaWM4cTdzckhnZkN2S2dHd29zNzFkU0FEM05VS3FUUFdD?=
 =?utf-8?B?M3VJZ1pmandGTWswR2lqdHZaeGVhVFJoQkphcXBycHN4RFlmQVhhL2Q4bzRq?=
 =?utf-8?B?c1BwTCtxWUk1Tkl4dEtZeXZBNFhaYm1tRk9GZytWTHNlOGl5bFZEWjNLOE54?=
 =?utf-8?B?bS9BNDJqNGpFR0pETU5QbHFQb0F0V2MvZ1cwWmtUbkkvWkZYNEN4c2VUdWxM?=
 =?utf-8?B?U2UwbXBuem00V1c5WTRGSjJiQU8zK3NrcURVSWlYbXBya09aeDQ1UDRoQ0Zq?=
 =?utf-8?B?cDVzbnY3enJEczYvcnhjYnVrdDZTRmVNc2x1Q2x5TURBMFc4UTM0cTBicTgr?=
 =?utf-8?B?TXFvQXl6dFhmSm1uRzNwcWVGRndML3h4VVBaOTFaYlF1bFVqWDk5VGpPakFa?=
 =?utf-8?B?RTg3dVRiejlGVWRCZnZ2b0pmQXVUT3lVbm4vbWQ3Yk9UM3BCaWZ6OHBCbmtF?=
 =?utf-8?B?M0hoS0p1WFFJNVdwQnBUYTBhNCtrdEtELy9ieHRxdVJ1Zm4zblZ4Z1lTWkNH?=
 =?utf-8?B?blord1lRM1JmS0xuUHlQWHNCbktnNk1jdzRmZ01MUU8vbjJhUTV3aWJnUnZM?=
 =?utf-8?B?cWdnbCtGZmRvMUNGaDIwSmhJUDdjbzBrdGxQU3g4bFFFMGlYcHpGZU82bUxU?=
 =?utf-8?B?bXFUaHZmVEtQLzlHYkVJb3NoT2lRNGIyMXhHQTR5b2ZVOWxyelhSenJlTm1R?=
 =?utf-8?B?eEZUVDNtTldQZk50TTRtb1N1d2xGZzNuMWtZUGtnZVVMcEdrWnIzUXd1NXRM?=
 =?utf-8?B?cXc1ZmZFSVVKQnFRVnpPNUZQYUNWT3JsZjA1RmlycW1mcGt5RjlJSEsyQjhq?=
 =?utf-8?B?U1ZvUUVIeS9kQk1DTVU1b3lPQk1Eb09MQU02cTBNekE2dzRvZENJdUUvakxC?=
 =?utf-8?B?TXNLUXdaeFpJVFR0OWkwUGx3b0ZJZFU2cWhTUFl2aFF1SUs0N2FHS29xTG1S?=
 =?utf-8?Q?ewW21MmsjmzJCZ0oQLGiwvNLXnXtXk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEFDTjgwUTJrQ2ljY2FheUU3UVhnQU81NnNBditQRUVjcGR3SFNVTEoxOEhi?=
 =?utf-8?B?VmI1Z2p1cFVNY05laHBoaWdyWHc0bW55NEsySFdkQjhIeTZ0Y0hVT0wyajNw?=
 =?utf-8?B?MURmTzExNUczTEpZQSs0MEJ0QzNIN2tubGMxVFdBVWxjclZsVGJQOEZWSnZB?=
 =?utf-8?B?aU8rc1laVTJlTmNZeGJ1dmhETkZEUGVNT0VOSkxrcUtkNC9maHBJVWNIL2ZE?=
 =?utf-8?B?MlFSZEFPUURHZ0JDVk80NUs1RWFySklNbG9JT05hd0d3Qm9iRW9lVXUzdmg3?=
 =?utf-8?B?amFrQXRITCtJNkJOV3ppOWJsVVZCZ2c1NTNRTElVRmdidHpqT0Yvb3Bpd3Zp?=
 =?utf-8?B?S1oxdVAza3RZSiszZkJvVWVMSDZOT1pxWjNLSWs4UXdZWUduYjFCT0pNdG1U?=
 =?utf-8?B?Ui96eW1oZXVFRW8wVFJyaWZ1Nm9DSWtDN2RlZC9OZmJrV1B3QmVRcnBXenkv?=
 =?utf-8?B?YUhYUkwyZ1B6VU4vMlV5cGc3UzBHdkdadE5idmZhbzNQOFI5L25oaTQ0Y2Jr?=
 =?utf-8?B?dk5CVUtmbVM4eUQ5QUZ1S1UrYm45UXlxajNldFRxT2VhOUtOZVkyaDhyOFFq?=
 =?utf-8?B?Q1pPM2VxN3BjUzhTOUJaMVQ4Qy9LTy9KQWRpYStiYlVVYTk3Y1VNTndDWEdU?=
 =?utf-8?B?dTNYQ0N0VnplRjVib1RPQVo1czNoVjhtcjhodG9JUi84RGpDUmh0M3BHeHZ1?=
 =?utf-8?B?TStTRDV4SjJuN2gvNVpJTFJBRHB1bHRqRkhUOHhWZkdmWkM0S0NZQmUxdFJI?=
 =?utf-8?B?K0NoMGd6MHRyREJMVVA4RWtGUWJkSEZuaStpSWo1L3QyQ1FDOHF0Z080YVhM?=
 =?utf-8?B?bXBRRW93OXBaeVE4VzQyQXNrZ1hDZWZ5NldoditOZmh0MTFxaThSMEord0Rk?=
 =?utf-8?B?L2JmOE9jLzNSM2drWTRiMUZ6blNzMFE2T0lacmkwazVJZms1Z1k0eWJpTVk4?=
 =?utf-8?B?bVp1empmU2hKK0xPRmZiTHY4UEdFNzlFNVhSckpZZkxyYW5GR3l0dUIxZmdQ?=
 =?utf-8?B?OGFXN2h0YUltUmFHbkxEUFpVbTlBMzBpcXUwcmVqWWx4YTNBQ1p3YWZlYXd1?=
 =?utf-8?B?emN1T0UrSzl6L2lYZFdqVjVjZE5XT0hRTWJEVzhwdmRiUlEyS21OK1B6cnJ3?=
 =?utf-8?B?ZXBEaE8xWnpXUUlDQU9sQjgyNTVLOFY4RzBFL0trMGdWM1NmbzMwNTRFUTdX?=
 =?utf-8?B?Sy8xZkdMTUROdnRDRkkxWkxuMWJPY1FBVFBsQmJ3dm1lL2gwUWJMUDgxL2dI?=
 =?utf-8?B?ZlRINUgrc3FoM1N0TjIrS1BzZVFPT1FTdEtucmt5ODVMSEVSWHVWd05OdTQ1?=
 =?utf-8?B?cmVuSlFCeGdQd1RUZ0ZvdVlQMERQajZHU0Uxd2pxejYzR0M0ZEh6bzVLaW5F?=
 =?utf-8?B?S3dOazc2Q2RoQjNoN2syVTh1SzhZYjk4YTVYRTlzMVZWajd0OU0xOTV3aEVZ?=
 =?utf-8?B?VXYrSnk3WHNZZmZvb3I0cUZNeXBwbGNvVTBqbjF2cTdzWi91MXdSdVpJSXJB?=
 =?utf-8?B?L2ZBMEV2dzNLZURrTWl6dEJHVWwrUEwxQVVXcGJWcVg4UW14T2Z5NElIbFgr?=
 =?utf-8?B?amtVcjYyeUYrV1VZVjY5R0wyYUJ0b09QaTJqNkdoKzFaamxPeWx5OUduWXZ3?=
 =?utf-8?B?aGVibXZoSXplN2J3YkhCYkF1NW5wTHJrODU3MGVjazhlcTBhRFI5aG4xNWR3?=
 =?utf-8?B?cFRjSDBCVHNoaXptSW9nMzF1MTUrcjM1Wk1TUlFobjUxMzRGRFVkTkhHNi9S?=
 =?utf-8?B?MjJ2dHdIdnVmUXJrcXVFdGV2RWJDeUx5ZW1RbVNSR3o1d09vLzVFM3JnTU5Q?=
 =?utf-8?B?ZSt3MFNOU01HRVBrcXhXdlpIRVpjYzVKSTZNZVFNUlpUL0pvWFRpWndkbmNq?=
 =?utf-8?B?cE90UktHbVgwdkJhN3BZclRMVkozRFBxWEFmNHZJMkduZ1dBS2NlcnRqSjJ6?=
 =?utf-8?B?aE10UEpiaTJMWTFmNGxDYVYvRzd3NlhaajlIMXNwdXJrR2tTbWxXZFVadTV0?=
 =?utf-8?B?c2JrZnp1d3pDdFB0ZlRpMXNzOS8xZ1N3b2hlbUk2RHZ1WUZPTnEyWjI1enJu?=
 =?utf-8?B?N1FUTXQzbnNEVC84MGRXWG0ydTM0Q3pXWFlyV1hTRUhGY1l2Q2ltSkZEaTVm?=
 =?utf-8?B?YktGK21aNTBqeU10Z1ZOQlc5QlJUOHNzclJ1bGMxQ2ZZREtSTHZ0TXJFdWIw?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E33490AC22CB1B4FBF18B8CC5117A1A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfe8c94-137e-45a4-ba5f-08ddc09b143f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 16:50:44.8423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4MHTeOcaSK8Gb8c34ziQLBOfCQAS3T9OxDfcgpaDgQntwAYfbGoVSDW83I9J3PzL6E1obTPzTzsCiJMaBDzviG6FE2vUiVe3oT/lEHBzYT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
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

T24gRnJpLCAyMDI1LTA3LTExIGF0IDE2OjI5ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIEZyaSwgMjAyNS0wNy0xMSBhdCAwOToyNSAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBPbiBGcmksIEp1bCAxMSwgMjAyNSBhdCAwOTowODo1NUFNIC0wNjAwLCBTdW1tZXJz
LCBTdHVhcnQgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIDIwMjUtMDctMTAgYXQgMTI6MTIgLTA3MDAs
IE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiA+IFdlIG5lZWQgdGhlIHRvcG9sb2d5IHRvIGRl
dGVybWluZSBHVCBwYWdlIGZhdWx0IHF1ZXVlIHNpemUsDQo+ID4gPiA+IG1vdmUNCj4gPiA+ID4g
cGFnZQ0KPiA+ID4gPiBmYXVsdCBpbml0IGFmdGVyIHRvcG9sb2d5IGluaXQuDQo+ID4gPiA+IA0K
PiA+ID4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gPiBGaXhlczogMzMzOGU0
ZjkwYzE0ICgiZHJtL3hlOiBVc2UgdG9wb2xvZ3kgdG8gZGV0ZXJtaW5lIHBhZ2UNCj4gPiA+ID4g
ZmF1bHQNCj4gPiA+ID4gcXVldWUgc2l6ZSIpDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRo
ZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gDQo+ID4gPiBZZXAsIGdv
b2QgY2F0Y2ggYW5kIHRoYW5rcyENCj4gPiA+IA0KPiA+IA0KPiA+IFRoYW5rcywgSSBmZWVsIGxp
a2UgdGhpcyB3b3JrZWQgYXQgb25lIHBvaW50IGluIHRpbWUgdGhvdWdoLiBNYXliZQ0KPiA+IHNv
bWV0aGluZyBpbiB4ZV9ndF9pbml0IGdvdCByZS1vcmRlcmVkIHJlY2VudGx5LiBXaWxsIGNoZWNr
IG9uIHRoYXQNCj4gPiBhaGVhZCBvZiBtZXJnaW5nIHRvIG1ha2UgSSBoYXZlIHRoZSBmaXhlcyB0
YWcgY29ycmVjdC4NCj4gDQo+IFlvdSBrbm93IGl0IGNvdWxkIGhhdmUgYmVlbiBhIHByb2JsZW0g
YWxsIGFsb25nIHRvby4uLg0KPiANCj4gKG51bV9ldXMgKyBYRV9OVU1fSFdfRU5HSU5FUykgKiBQ
Rl9NU0dfTEVOX0RXICogUEZfTVVMVElQTElFUjsNCj4gDQo+IFdlIGRvIGhhdmUgYSBub24temVy
byBjYWxjdWxhdGlvbiBoZXJlIGV2ZW4gd2hlbiBudW1fZXVzIGlzIDAuIFRoYXQNCj4gbWlnaHQg
YWxzbyBleHBsYWluIHdoeSB3ZSBuZWVkZWQgdGhhdCBleHRyYSBtdWx0aXBsaWVyLCBldmVuIGlm
IHdlDQo+IGFyZW4ndCBjb3ZlcmluZyB0aGUgZnVsbCBwYXRob2xvZ2ljYWwgY2FzZSBoZXJlIC0g
SSBzdGlsbCBuZWVkIHRvIGdldA0KPiB0aG9zZSBwb3ctb2YtMiBmaXhlcyBpbiB0byB0aGF0IHBh
dGhvbG9naWNhbCBwYXRjaCBhbmQgZ2V0IHRoYXQNCj4gbWVyZ2VkDQo+IDooDQoNCllvdSBrbm93
IGl0IGFsc28gd291bGRuJ3QgaHVydCB0byBwcmludCB0aGlzIGNhbGN1bGF0ZWQgdmFsdWUgb3V0
DQpkdXJpbmcgZHJpdmVyIGxvYWQgb3Igc29tZXRoaW5nIHNvIHdlIGNhbiBtb3JlIGVhc2lseSBj
YXRjaA0KbWlzY2FsY3VsYXRpb25zIGxpa2UgdGhpcyBpbnN0ZWFkIG9mIGp1c3QgcmVseWluZyBv
biB0aGUgY29tcGxpYW5jZQ0KdGVzdCByZXN1bHRzLiBPZiBjb3Vyc2Ugbm90IG5lZWRlZCBoZXJl
IGluIHRoaXMgcGF0Y2guLi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IFRoYW5rcywNCj4g
U3R1YXJ0DQo+IA0KPiA+IA0KPiA+IE1hdHQNCj4gPiANCj4gPiA+IFJldmlld2VkLWJ5OiBTdHVh
cnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+ID4gDQo+ID4gPiA+IC0t
LQ0KPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIHwgNiArKystLS0NCj4gPiA+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+
ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+
ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gPiA+ID4gaW5kZXggZDM5N2Rm
MDU2ZTRjLi5hZjAzZTE5ZWY5YmUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+
ID4gPiA+IEBAIC02MjgsMTUgKzYyOCwxNSBAQCBpbnQgeGVfZ3RfaW5pdChzdHJ1Y3QgeGVfZ3Qg
Kmd0KQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOw0KPiA+ID4gPiDCoA0KPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndF9wYWdlZmF1bHRfaW5pdChndCk7DQo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoGVyciA9IHhlX2d0X3N5c2ZzX2luaXQoZ3QpOw0KPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgaWYgKGVycikNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gZXJyOw0KPiA+ID4gPiDCoA0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBlcnIgPSB4
ZV9ndF9zeXNmc19pbml0KGd0KTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZXJyID0gZ3RfaW5p
dF93aXRoX2d0X2ZvcmNld2FrZShndCk7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJy
KQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7DQo+
ID4gPiA+IMKgDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGVyciA9IGd0X2luaXRfd2l0aF9ndF9m
b3JjZXdha2UoZ3QpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9ndF9wYWdlZmF1
bHRfaW5pdChndCk7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQ0KPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7DQo+ID4gPiA+IMKgDQo+
ID4gPiANCj4gDQoNCg==
