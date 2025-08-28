Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F12C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 18:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D881710E07F;
	Thu, 28 Aug 2025 18:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg8mgSQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EE110E07F
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756405175; x=1787941175;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=4hLq/xDlyUWy9XAED7lBRCRq+SJ7bp1tolFLfI1EqlE=;
 b=jg8mgSQ87NVfZzWaC0ovHrWHgJFJZk5WcJ3yN6g0cNh36eEsgDY8y4Hg
 X+ESjskVPP+SKEIKRnZpYspZWdAMl2osCDYszJAzxZcWNhlrYa+fsOEvO
 eI3OLlnBIguqWGRtL3gLxHnKwXGRp/cfuv2rqJ5zLc2PEcyj8hK+MUgao
 0A9Du4ZDRyv3dJc4/oT9BD0Z0DxZzjkEnvrqrvyxUoshMinfh/55wXsv0
 mNtmHz+eKuAhDF8NaIgMvYnCBnEMS84Ibft5tllF6/z48iOzvO4rcjwxn
 /HKKNwvoU/9hyfBmzXqmmYpwBEZNFhIKvfGFIU3xKZP+SpEt+S3qrdDMK A==;
X-CSE-ConnectionGUID: TQgWIm7OQw+zTn8hy8eCsw==
X-CSE-MsgGUID: 3hnW9sc9QsmFMTVS98xgnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62519222"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62519222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:19:35 -0700
X-CSE-ConnectionGUID: SIGUTm5QTECGfbqkDt2x6A==
X-CSE-MsgGUID: G2+Y1ElbSUitwaFciQiN1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="175459741"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:19:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:19:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 11:19:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:19:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWUXN92gjgROsRGvLpVVEwOPcvn6kX/hr9wHSADCleQMvp7XxByyNHxoTyv2hGURbPck467pq7jivH/pmp7sIZMVZ7F0rehNiYPLj+AHN7TeHpTa0IaatcqJfz7nufDdgLGNleRRC09KyDWZNyMMuvolorrPcjQ2ZLhgXqMOhg6Y7liMa3RFbCloYMgjgpwyaFJZ/+CSbK71tOwuBsLdfQjJNZveDAAuftQKJJOr7plRhdlzavFxxamsqZ0/BTyeHfsCSq/pw1e5gUBSSXyg19kNr238/UO5nDxu98dcEFJo2Rihripr+rTfA/NOlDX7MyxLTvkz5+6CegJJKpFEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hLq/xDlyUWy9XAED7lBRCRq+SJ7bp1tolFLfI1EqlE=;
 b=xzqTicLBtzNhb3PZrVciGyhGq+Luc3DkcoOx/mGULUBKbnHOJqK0WIuL8kRbDoc2igaVpzRatkhl59/uKrR0lgKNqilb0q9X1BzHr3nCFHQ3gjSqfDf3+FgSlTCdwdjoeNOT9+4AaxVWRJVZwFVjUlGK0D2b59tqg8nZISPrYvS8CS1Wojz71CcFWPAcOgsBdtTRrkIgRjXwmK93J5eFX4gN25OeZjP6KZA71/NLJaHjWHLZ4YlP7hHV4dYuUDQ17LkEZiaHvnzbq1J87vV9Dp4PHJP71CqCQU9YesTMujsdbuDzM/AS5MGYJfEiFgWb+UXMA9LapUIPqqC7OzrIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.16; Thu, 28 Aug 2025 18:19:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Thu, 28 Aug 2025
 18:19:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Increase GuC crash dump buffer size
Thread-Topic: [PATCH] drm/xe/guc: Increase GuC crash dump buffer size
Thread-Index: AQHcF5iPEMdgzmQfPkaXyGhbqHvueLR4YWCA
Date: Thu, 28 Aug 2025 18:19:26 +0000
Message-ID: <39b6759c8ada538ba44e375c7cb4e38ef824fa79.camel@intel.com>
References: <20250827212110.1024961-1-zhanjun.dong@intel.com>
In-Reply-To: <20250827212110.1024961-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA0PR11MB4637:EE_
x-ms-office365-filtering-correlation-id: 7d77ffb8-4d41-4d68-f9e0-08dde65f6c06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Yk9ETGRtWi9zRnZDbTUvTUtrek5oN2hKVlkxMnRKaStIcmQwMWYreTY3dVhq?=
 =?utf-8?B?ZnNUNzEvWFNKb1FtUGdVQnlXZ051dHA0QzBiVWJJMFBoNm9JNS9OUnlrMGtB?=
 =?utf-8?B?V2h2blRNcE9SSi8zcnBobUd4TGs2eXJTZUhoVndoNHdDdkUzNEw2SG5BSG9O?=
 =?utf-8?B?czVoaHJLb0N1Q3kyK3VNdmdncWRldllpME8wcko2WVFEeHoweG9nbysvbmVl?=
 =?utf-8?B?eTB4SHpoVmhhbHNxeGF2QkpDOHlJSndmNlhPaUkxVnZMdmdzVkNWTjBiT3N4?=
 =?utf-8?B?UjBJWmZkMTZpTWNiRHlDa1RrN044THp6OW00M0hwQ1k2WjFnUTduZHc5TGRs?=
 =?utf-8?B?djA0Um9OdGVXUFg2YkNPNDMxS1p1ZWtQMzdJNHBJeG9wbEJDMmQxOVVHRHFs?=
 =?utf-8?B?RzVMc21jY1E4ZzNtMXdIamdmMXM1TU8ydWdsWEJwSXloOE0zK2o4NTBxL1l4?=
 =?utf-8?B?R2h6UmRiNEdsbElPcGZMTmNIWUlkZjV6VVJxMkVpMjJxZzk3bnRCc0xvUFBq?=
 =?utf-8?B?QURybjE0SXlaajJoelNSd3g0bHdaQ0ZaNU9Uc3VFcERnZEVGQmVNblhzQmNq?=
 =?utf-8?B?Z1dtTDRidnEyNnA5NCs1NC95RmpxaFZqc1EwSEY1SWd1LzlSQ1NkVG9LMjNF?=
 =?utf-8?B?dFFTVm9LNE4rWCtVU09xNFFRUFpGNkgvTVZIN0tSaW50bDdTYzQxSitwY3FX?=
 =?utf-8?B?S1E3YjV0ZHNHQlV6blFhVEY5OTFwbmxaenNORUQzcXRhYzBUOGJaNVV6NFJQ?=
 =?utf-8?B?blV6WTUxNWNxZEh2Z1kzZlBNdXRnKzBDMDE4Q0drVW1kbXphSmpDcTlKN1pX?=
 =?utf-8?B?cGJIRmJiVndEdEd3Z25tMkNMVm5ycmhacEd5TUE3dmg0bXF5RUl1SmFVN0dz?=
 =?utf-8?B?ckFocW04aTkvcnMwSHM1K2xmT2l6QW5tSU5YdGxvcDJiRm50UzdRZ2tYQlV1?=
 =?utf-8?B?UXE4bGNiWUN4ZUROUDFJMTZpNGlQeU1SYitIM1BNU2dJSTJ1WjNiUEMyNnlM?=
 =?utf-8?B?U29LSmRaSk1rVXd2RWZUZ3c3RE5oUGJ4Zy9nbEdxNWJuLzdlZ2I4R3o3clhy?=
 =?utf-8?B?QXdBVWtMZ3NkNEoxYVFNZEFJSnZha1QwRFR4ZFh5UTBkSU9lRGQ1TXJoSDl3?=
 =?utf-8?B?dnlFcmJDdnl4S1Ztem0zL3BjalpOSU9hM3BpUjhHdHcrUjF2SXJtOUVURXlu?=
 =?utf-8?B?RGV4ZjhodjFkd1Z3OU1WaERhTTFISTNDd1FidHdkVGJxSkc2T0RPVllET3dr?=
 =?utf-8?B?U0ZTMnBRekgrRTQrR3RqNElQT0s0YzFMZ1A5ZUw2a3hmOGZpempEOEVhdWpG?=
 =?utf-8?B?dmdvZGtKMUtGQ1BTbG5HT21McjNEdkpKelV3Z2E4U3FWeWF3Tlp5NGFmanhW?=
 =?utf-8?B?K0xLdG1Kb1VLVTBVNUgzMFdTR0VSWTh3dU9aaWpoNHJtMWYwdmJOMTFRU0lq?=
 =?utf-8?B?eXBuVzRjN0VoZVBQemJkcE9VUWJkTVdoMklJVFN5T1NLSzJzY3N3SFhIelkv?=
 =?utf-8?B?WlZyb1JLdEMvUlFoNDZONjNsckF5MXFZY2Q5NFRkNlNqaHlyVlJSR3ZXZ3Q3?=
 =?utf-8?B?V2g1WVhWS0ZRM0RQSlRjbXR0R29JSUhsOGdjYmlIMEI3aThnWmNzWHp2bEJZ?=
 =?utf-8?B?b0FJYzFBVlRTdVA2ODlwWk9GOFdnSTJmd2dHbjFTTU5tdFYxWmN6K2Y4R1VM?=
 =?utf-8?B?cDFjeVpZeGVTVGxDWEZnbE5pT2sxSU8rRC9MZDhweWhWR05ncFdURDNZeVMv?=
 =?utf-8?B?UFNoemhVRVVUYktFc2VVVlU0cm1xSDdFVHpRNldnSWMxbnpFU3ZuTG9ENzZm?=
 =?utf-8?B?VnIrNDBUaktSL3FhdnZjVmdGZW1lWDFlL1NaZzM4NHQwanI5N1NsblJBMzBF?=
 =?utf-8?B?ZUF4YUR0bHo2eVZFOEZnbmYvbVk2dnhFeXFkZndUVERsbFZkb0cxZmJQMmU5?=
 =?utf-8?B?aXpJSDNHeUZnRm9mQWNTV25OdERUcW1WVzhpZ2pyR1dlMlJ4MkVQMHIxWXBR?=
 =?utf-8?Q?YVZljj/9Qat6nWd2g+cF2SYO0iBC4s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0RtbFFGTlpSZVArdVFSMzF2R1I3cllCd1VuV2YyL1RhVU41Rjlsa2JnY080?=
 =?utf-8?B?ZjlvK0Q3amRwY3dWMzFxcHo2QmxGU2h6dEprZDFMRnM1bi8zTDVQODRqR3g5?=
 =?utf-8?B?bVl6a0ZpMVlHTFRoZmdoZlZlY09HdUtYbmZjRkFnbUJ5STk4R3FwSlBnY3BF?=
 =?utf-8?B?MVRJTTBkKzh2dmduUnRENjNQbUJUZ2taQmJ3Ylk2M1A5bXdkcGpYSmxEUHpD?=
 =?utf-8?B?enBSOTkvWW9kd1JpMnZ2N3VBK0JpS1ZPQ3BCR01QWWtaRks4SExrN0xVSUl1?=
 =?utf-8?B?UldGeGFZaytwcDh3QjlBYVY4WUFNODFSK21lTXJIMmNFZ0QxSXBmTHFVayty?=
 =?utf-8?B?Qk1SMlROajZtaGRNWE1CMUlxVWc1THo1cGh5UTAwRmlZMDdOWGZDMjJnVFdM?=
 =?utf-8?B?bURpQUVPL1BCRWtxNDVsODBJQ0xjVFBxUzZpTG1NS3IzYkhMblVkNlZPUWZY?=
 =?utf-8?B?b1B1bHpTTW85RUhKa0IzbVlUd044VDUrTU1ST1JrRnV4MThidTdTRVhHanR4?=
 =?utf-8?B?U1MvMnJCS0h3ZVdzU1lXenAyejlRK0V1UVBLelBRa0FjOUZYNzZKTEcxdHo0?=
 =?utf-8?B?TGQ2OXdMOXRLQ29jWjRsQVgzOUZiNitxdzl5cE9kUkZTY3hWZmdIUGFzbmp4?=
 =?utf-8?B?TytPZjF5NlVOazZZbmFkOXpBMGlMR0pGZjhzcHFpaUdpdVNrMzhSRVgrSGcv?=
 =?utf-8?B?Q0dORkZ1U2xxcDBWRVV1UEp1UmxtQTRtVkNnT01pQ29iSytyVVc2ak5nWmVQ?=
 =?utf-8?B?MVZIUmxUY2t2dUY5Z2doOEsrWXI2ejhEck42UzVxRFlhYVQ4czVnZUt0UGRn?=
 =?utf-8?B?aEljbjFUcW1XZy9VeUlETzdzMS9keGNKUmFtbHNUdVBDT1RpUFFPQjhzTmlO?=
 =?utf-8?B?eUtJNG1neHJCNTBva2ZqMWZzbUNhSm1ycHF3V0JyalgyTHU0Q0xhaUo0ZkNv?=
 =?utf-8?B?SkhmRWYxK1ZXNTdpbDRjcGd3VFRYcmdaL3A2TDFKOXVmZTcyZUlOa1dENFlO?=
 =?utf-8?B?OW9PUjVtVUJkbFhNV3ZCVDNVWjlRTXczS0VOL3dONTNkMHBxWkxJUXJvaCtO?=
 =?utf-8?B?UktMeFF4UlpHUm9OK2JyVitTVDhuNDBDMllIK1hlWEozSy94SnFJdllRQno0?=
 =?utf-8?B?aCtRUmE1cUV4dTZZQ3ZCeE9QLzhWNFFJTmZsaDlhRnVjUWZ1RkliSzM4VEM4?=
 =?utf-8?B?VGU0WWMzekduVk5HQ1pvaFRSY3YyUmZOeUczaHJ5VEJxbWlhYkRLVWNTZ2dT?=
 =?utf-8?B?TjJ3SFJkZ0RiUmh3Q2dNbVMzMzhOMFFMWk1VVkpzUThwZlpKdG5DN01TUmlh?=
 =?utf-8?B?U1ZZUmZKMzlQWFNxcGo3eTF0UVpzNVorNDdCOFY2Y2NsbnFMb2p4NkphemRR?=
 =?utf-8?B?VWpBaEYvTUluRXZwWVJWQ1R6R1NXMjdOeWo2UmZpZDFLdEdkeFBJNzdWWldG?=
 =?utf-8?B?TXNJMmNNWGx4U1dkU1ZaOVFUOHBkSE9ERm5HdXVmUWY5bFhYUTQvbUZVQmdR?=
 =?utf-8?B?dzhNTUI1eWN3OHFoVzFmeno4SktHYU9PVFBvd1hSZ0hnVXBVSm1vcDYwb3o3?=
 =?utf-8?B?YmZzcDNXZ2FkU1FSSGt3WlJqajFNZlhQc1E2Sm8xMm4veGZMVlJBUUpGNDlV?=
 =?utf-8?B?Y3Z1Mm9QaFNNeXZ5TmVOY054elU2dmF0bTZtTU10RkNLTWZnbU5BRmVvYW9O?=
 =?utf-8?B?SnpzTGZiTWZHWmdaRzN0R3RWLzJqampBa1Y1MjZ4Vk5jZk1BWHROL1E3Zk5q?=
 =?utf-8?B?MHVZNmIzRm8wZTg3T3owa1VoUjhkWWVMMVlpSm1SZnRRRkowMFJvRlJFRnFX?=
 =?utf-8?B?dmVuUWc1cDNIb0M2cDhQdEhqaXhueHJPVXZ0c3M4azUvL051K1RYa3M0UEkz?=
 =?utf-8?B?cnRCTlY3aUp2UUNPczVjU0hCWjAraVB5czR0N3lXR2YvTUJoUGZEcm03V3ZW?=
 =?utf-8?B?WFMrYjRHeEF5TFJVdWJ1bzV4ZFZnTUt4L29rckdoL1l1TSt6ODR0U1FsYjda?=
 =?utf-8?B?TDFaT0c5cDQzaFM4VWN6SXFLZ3EzU2RXK1lzYk85Yk5rWFJLay9VbFdrcUhJ?=
 =?utf-8?B?L1QycmNGaUcrcWMyUGloMDFZMFpGMjRYb0l4UGlrbC9xcWhOZTA1REhjaEQ4?=
 =?utf-8?B?MzBrRytEK1RPV05aVXp2Q0pielJPWWN0WllidmxSVDFvbHlkeGh0aGRRbkY0?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB16F0D0D02C7347B5417947B5BD497D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d77ffb8-4d41-4d68-f9e0-08dde65f6c06
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 18:19:26.4851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+HTvsi/z43KG9lltunoadirk47TQlfZynspiU+3GIpd6cy7veNj6Wr1ZE/+fKnBA2eSySp9QoyBh6GSIFnkk6uSh2L9sX4JUCAptXEsSdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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

T24gV2VkLCAyMDI1LTA4LTI3IGF0IDE3OjIxIC0wNDAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEluY3JlYXNlIEd1QyBjcmFzaCBkdW1wIGJ1ZmZlciBzaXplIHRvIHN1cHBvcnQgdXAgdG8gMTZL
IGR1bXAgc2l6ZS4NCg0KQnV0IHdoeSBkbyB3ZSBuZWVkIHRvIGRvIHRoaXM/DQoNCi1TdHVhcnQN
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5oIHwgMiArLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmgNCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2xvZy5oDQo+IGluZGV4IGYxZTJiMGJlOTBhOS4uOThhNDdhYzQy
YjA4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfbG9nLmgNCj4gQEAgLTE3LDcgKzE3LDcgQEAg
c3RydWN0IHhlX2RldmljZTsNCj4gwqAjZGVmaW5lIERFQlVHX0JVRkZFUl9TSVpFwqDCoMKgwqDC
oMKgIFNaXzhNDQo+IMKgI2RlZmluZSBDQVBUVVJFX0JVRkZFUl9TSVpFwqDCoMKgwqAgU1pfMk0N
Cj4gwqAjZWxzZQ0KPiAtI2RlZmluZSBDUkFTSF9CVUZGRVJfU0laRcKgwqDCoMKgwqDCoFNaXzhL
DQo+ICsjZGVmaW5lIENSQVNIX0JVRkZFUl9TSVpFwqDCoMKgwqDCoMKgU1pfMTZLDQo+IMKgI2Rl
ZmluZSBERUJVR19CVUZGRVJfU0laRcKgwqDCoMKgwqDCoFNaXzY0Sw0KPiDCoCNkZWZpbmUgQ0FQ
VFVSRV9CVUZGRVJfU0laRcKgwqDCoMKgU1pfMU0NCj4gwqAjZW5kaWYNCg0K
