Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C87CA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 17:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AF510E805;
	Tue,  2 Sep 2025 17:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJFyOLnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5EE10E805
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756834939; x=1788370939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+wc051bcxrsT7J+GWSrxmJSY8FX6CESgruQtAbpnMUY=;
 b=XJFyOLnXGpUQqY/c2sJB3EpqBJggDcOAmE3/bsW/mkFoFC+VYwCDZrZJ
 wDKrdIHAmUjWJ9hVaJyvZF4FlrQ2UovnyTGE0yb5nK/q2YJbiSikXe8C8
 FjE0NzsWGSp/V+NaO3aOuh3PLLpTfPfI2AnU59gRjdK+WhJW5C534Z1P2
 1SiIEzgCpVw+Gl2qGX9K50OnbLVnK6x6kxAX8aDeooGs+Z4BwY+GroZBF
 iEiO9eXa8fH2GrwOyjhtQNFf/IPCWJp2g+FZBeJIy8TMQGUMPV+Eu8t6M
 utc/rQYROGh1eBOaIIHzoQIpJ3UTdrYaGShINroERTfqKJKQT+LWrAwXy Q==;
X-CSE-ConnectionGUID: +bC1asZiSAuJtKq4ORUb3w==
X-CSE-MsgGUID: yZn3PY87RXGJXRhOJyDUpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59234925"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59234925"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:42:19 -0700
X-CSE-ConnectionGUID: MdhY0bfPSv+I6Kw0sklEow==
X-CSE-MsgGUID: hSoYY0uKQqGRIuTxZ1N5eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171799218"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:42:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:42:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 10:42:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:42:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=resruMNP2p7FGPlvlMbFeW95iNtpQXtQlg7JtM58Q9JDgwkSjyjLFmNj7jcgO58k8182UQcLkLlSCBpYsx0ofRWIVdZNzEMaiSuKnHguJK7G/BX1lh4MX3Azg6J5J6P69Xh1aJ1cGDBTTOTZt09CDhw+BpjUjBFogbmS7JVaXJDwm6HdCY08fBDYNbEdTm+o7x0/FpEiJkZaARt35CnOjyzOZAQgzpDYJaH7o1li2MO74g/vCBrFWOiGerNZV5UwTE8NK+KWBNoGhkxOCYJ2ShG35PwdrzYQuY3zrvlTPmhSR16WQeE63DoJJ6N2Op5W6ttKjNjzrET/Mv0O8nHp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wc051bcxrsT7J+GWSrxmJSY8FX6CESgruQtAbpnMUY=;
 b=lipznofMMPE65MzwXFfiiHrIwQnkmq+S3VnMLMdFqvKAglAL4H7Ov9TSUc8sD6gXNxWXpLRCkwXL2VH27Np8cWxOwakgBaH+d2LkpXI5yeWFcMsmrU+1E1o6FJ8y4QUwqhkdkv8k6dnHqSigyfektLXz4r8CPiP0e/ulOnXlLogjeEaET7VHM3FzqcFNwMn/R+sDK6hLXXO0pEyncLao+GunFdhZbhG4emcFxB+5I5IFbLrVpJndaTb0T0ZkT9m4UEKb0bOonqsiFOa2KLzaSccchbws7WnJCT3uS61lneG+vl87Fwsrg1qCaJ1ntcbrSvtcLnmbxWunRnpjZYU6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB4981.namprd11.prod.outlook.com (2603:10b6:510:39::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Tue, 2 Sep 2025 17:42:11 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 17:42:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Set upper limit of H2G retries over CTB
Thread-Topic: [PATCH] drm/xe/guc: Set upper limit of H2G retries over CTB
Thread-Index: AQHcHAgAPh46KvcENkONfvTO2QR857SAKb+A
Date: Tue, 2 Sep 2025 17:42:11 +0000
Message-ID: <2c2e092ecaf950b534ce3a412ef7c32c9f036d4b.camel@intel.com>
References: <20250902124850.5040-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250902124850.5040-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB4981:EE_
x-ms-office365-filtering-correlation-id: d3cb401c-5481-475a-d663-08ddea480bc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zkl2SmVFTUJjYXloaGlYUEFid2pVazJXY2JIUjA5aWZ2a1o4czRXUXdqWE1U?=
 =?utf-8?B?RDV6bGE4TVlPTkhSRjJWZXcrRlFma2prMHo3d0RFTU1tMWkwZDQ3dTRuL0tX?=
 =?utf-8?B?RGJaVDNjSE42WmhhTlhlWnFlYWNCdlVkb0pJdzMvaWUzajh0N1ZQKzRodUp3?=
 =?utf-8?B?WXowYkQ1Y1pTWU56S0QzRmMvOXZMM1lrYnA5ay9kbVM4QytpNkNJdlRTVTNz?=
 =?utf-8?B?a0tMV0NEUmpwTGpVNTR4eWkvbnltUi95ZWZBRnF6aS9nYS9Hem9jYWo4SHdS?=
 =?utf-8?B?THBLdGlZWDZTZDdGVmZpWm1LMEluL0RnRWhUemw2M2xwU1UrS0lDK0RzWGRT?=
 =?utf-8?B?cVJwaVFyeU9icTJFaFQxQWVNK1NxN1hlbDk2and1M1k5NWwvSUM3emxId2Y5?=
 =?utf-8?B?dXRLd1RFMWxzSEdyV2hMSGdtMmJXZ1ZSaWRjSkE4blRuL01hMWoxUG9Pa0R6?=
 =?utf-8?B?VjhwQ3lSZ2d0eXpqSHdVTjJuUjdzdFFJbUhYMXhIb3M5TFdlbGUwakU1dDB2?=
 =?utf-8?B?OFNEUEVReDR5SXVyNkVuaFJCZnNGYk5JRTE3cHNJdTRRTDZiMDNRN3R5MWV4?=
 =?utf-8?B?MGRBRXQwbGQ4bytjQjBwNW1TQ25DcnRUSGQySHZoRlVEbzB2Q0JYZ3VsNGl6?=
 =?utf-8?B?K2ZSb056U3ZUYWV1K0pkTkFDVXFEN1JMWjFLNGc5ekQ4VmZkREFEajFXMkpU?=
 =?utf-8?B?dUpzQlgwYy9pcXJCbThxa2NuOXNyeHQ2UitqQXYwMS9TMmJnWmZiMElPMnlU?=
 =?utf-8?B?bGZYQ3Qwam9ENHZDV2dFS1pZWFptRUpTQjNoVzhvcTF1aytLQ3NaWklrK29Y?=
 =?utf-8?B?VmJKUUhaMHVJc0VwbG1qYTE0bTBQT2xOVXBUY1FjL0hKSUNyY2k0aXhLZ1pu?=
 =?utf-8?B?YWgxdUNJNUsrNzRrWXBLYk4ybU1LaW8xRVc2U0RjQzhRSlAveWsyb0Y2aUsv?=
 =?utf-8?B?Z3pUVWFtRGtVVm1ITldHVjJKWGhQeS9DUVZ3Vzh3WHVkMFp3b00yeklOS0hv?=
 =?utf-8?B?UVdlZHNZOGpucWlLSlByZjdkemJTRCtoZGFLN3YrbmtQcTN0cXBjZ2RwcXRt?=
 =?utf-8?B?TUZPbm5PUG1VNnYvY3k5b1pwWTZKYXlISEx1RjREeUNTM0JlVE84c3lkMlBU?=
 =?utf-8?B?Z1NYQ1AxMlh4NVdXMEltbjFRWVJ6cjBsYXl6NnpjL3JFMzdiQmVsYkE5ZzNN?=
 =?utf-8?B?OGJwaGpjNFRPeUR4dTlGQmxEZjN1ZXJuOVJvR082ZEJoMFlXYUcwdzhBVVZ0?=
 =?utf-8?B?eXFESmFBTVpha254YWIrU042UGYzMDh0VWtTOThiSHpsTkh6MHR2QmQzQ0Rw?=
 =?utf-8?B?VDZTQTczSkJLMWdFNEdmL0lxVW5hRkxqeHJRN2gyek1zK1JHSTlRcndReWcv?=
 =?utf-8?B?TG9aU05hdXQ0N2E0T09EaW1nN3lwRWV5TlNJYWhMTzcyY0dUSzJiOFBtUEhu?=
 =?utf-8?B?M3dSblQ2TWpoQXlEd3l3SytaZW04cEZDY2R3dlZXREV2NWsyTUYvcXoyaXlo?=
 =?utf-8?B?U0lhS3dtWTc2M1pKcUNscHlqQzJtc0M4cy83d1dwZjBlZW8xbUpUUXdUbjYw?=
 =?utf-8?B?eWJVa09yOTZld2JVT1pGcFJBdmNDemRYTUw2eVIwdFNqeCtGcTVFMW9oV0p3?=
 =?utf-8?B?Vlp3Q1EvelhlZTcyaFJoOWtPb21kK2NmcmFFNUVOemd1U3hRUE45NWQvRnpZ?=
 =?utf-8?B?T0V2Tit3bllGSnhQNkVCOFAvU3RsZW5rbG1NVmhmeEk5UU8xYkVMVFZVVXZH?=
 =?utf-8?B?VXhwQ0R3RkNRbUFDU1hONldscmF4bzllaDVCWXdEcmZDM1pKbFZsc0tqRWpj?=
 =?utf-8?B?Z2VsYUxJN1dyVG9vTjdYSWFPcVAvZ1FuVnN0SmkxYWdidDJwaVpVdzlIWlNu?=
 =?utf-8?B?c3ZrL3Z0UzBxVlp2R0xrbXRWQ3R6MGc4Zk4waWZkc0VuUHZmOUU4d0gxK2xa?=
 =?utf-8?B?QUVQaUk4RXJQeitMSndOTFd2RVA4a2JlWU1CZjdjTU00QVNyendHaE1ZZ1pN?=
 =?utf-8?Q?Pfo4cXavy8PT15a+KL1D7K/qHxLpw8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFB3QWJ0UmV6cXFZQmRhSmRIRE9jZmI3b3lHYmpPZFU2TTgySzhIL1lXWnBw?=
 =?utf-8?B?dDZrR1RzZFF4MWE1T3RpOEcvTUlqNmVCdUNkZzJtQjFZcEZTL0MyWHZDUVZy?=
 =?utf-8?B?c1RhdVZBbmRzbXM4UU1lSU5YcUU0SGdDMHBJU010dUNFSjF0aVBORFQvREM1?=
 =?utf-8?B?cmR3Mjh0K1VMQ1ZsSFF0V0w2TWJlbzBzOTJLbGVaTHl1clU2S01CS0R0aUg2?=
 =?utf-8?B?aTE3MW5jV2xyTWx0YzIwWHNDeVRLRW1GdkFVUWhQaXlFanlTVlRrUEtrUW9y?=
 =?utf-8?B?a0hkenBLVkN5UGZnY2xPYXpRQ3lJYWtxSEUrZ2JSMEZtRWFIK1FQYmxFemV2?=
 =?utf-8?B?UFBteW9LbS8xdnY0aWhhK2lUS0p6ZW5xbElhZ2lkajM2c1Uva0VWRFBVQ0Vp?=
 =?utf-8?B?T3hhSFFUTUFWUUpKTHdTREd6VU5WdFhGRlFCMGRMNEpadE1za2ZBamg2SEtG?=
 =?utf-8?B?RjFYa0tQWk5weG4rS3FtK2FPcmZ4SjFWMHYxWEtmcXVtaTZGUCtZUlpQK1F1?=
 =?utf-8?B?enBwRDJjRFhEZG1vVkN3QWFHNTh0VVU1UUxWS0llSHpYNGtOSndsWWxwc2dW?=
 =?utf-8?B?Qk5JQ0lIV3R6ZlhncjlRc2ZNWjBueElOWDRRalMrN0JqQkkvNFFwbisxeEZM?=
 =?utf-8?B?MnhYajZpaVpTbE9xZjNHK2JJM1Byb2pMNXhXMUVMYmZTWDNNalpkR3FvU056?=
 =?utf-8?B?V25kQWZvenE1Z2ZaVjZiNy9RT1ppK1VFbUlmOFlDaUNVVTRXRVJ2UGJNSWZY?=
 =?utf-8?B?MWpEaktySytpaC9zc1RhMUJFcnRocjViYkp2c3N5Zzl6aFp4cUs3ejlFTTdy?=
 =?utf-8?B?eURycU1xSSs5U1F4Ym44OGZ6bHNSMks5cG9WeVVNUndqWVAyZ2syRkNVM2NM?=
 =?utf-8?B?S1I2SnRwSmliOVR2bzkzZWIvZThmT3h0VFBCMmJreFF0Q0RPL0NrMlJ2Nk5X?=
 =?utf-8?B?TFhsNTdiYmlybkN4V1BFbkh3TVAxdjloSlpSZHRtMHlaMU1oSUZ3eThmdUQx?=
 =?utf-8?B?V1k1aDQxZzIzU0dBWXdlNTJLdUhtTkgzMVhNOTdoSXprWXpQYjJ5Rld1YnRp?=
 =?utf-8?B?MHZqL0RScmg1QUdrV0N6V245bGdnM01OS3krTCtPTnI0ZlZkazAwV254a3NZ?=
 =?utf-8?B?c09GZCsxRW8yaEQzOVVkSVlLajlQVlBpU0tIRGt0bTBISUEzaFQ3QnpiaGcz?=
 =?utf-8?B?UUtwWFN1eExwSEVPWWJydmpOSlZuaTNqY2VjOVcyZW43UHlhNmlMTXlwbE1v?=
 =?utf-8?B?RGk0RDJhTEhtMjhidzZCVjNqRDI1L1VOUi83U0JvbFg2TFlUNktMZnFFM2R5?=
 =?utf-8?B?NTZZaExXdFp1eWd1UE15TFdOdk1CaVlqak13SXRIRGM0NGUrT1NOVHZncWtJ?=
 =?utf-8?B?WFp2S0lXQjJXYkdiOW9mYlJOZjBZekkxZmx0Sk9pTnIxSmhFZ3Jxc2crV2lG?=
 =?utf-8?B?YzY4QmR6UWxzbjFIRGpIYWlQblEvYll6UDU0T0VzQVZlNExYTjRPSE44MEdB?=
 =?utf-8?B?TFFET2kwSDFuQWhPYWsvS09XcEVTK2wwdm9GUjJpVkZUZTczS0hFeSttZmpK?=
 =?utf-8?B?VHlrUlZuVG1MV2dPSnM0UXQyMlNlQnJ5S3NkdFV4bGlPL1ZFWFRmK2ZPbWVh?=
 =?utf-8?B?aFMxTlFkV3E0bDIwcDBtR0lYM3hSbUtDUWIvQkRBUHlrSTNBNDVaY1FPUWty?=
 =?utf-8?B?L0t6NkZDTkxETWNIVlpSOWNnYitHaUtKTDNRNHdwSTdvR2JQQXY0MzZFbTVj?=
 =?utf-8?B?NVZoNGxjTW9yYUYvd0MwV1IvMVA2YnVyT1VFMDdYZ3A1UmFZeEY2NUxZQUhn?=
 =?utf-8?B?a1d4NnVoSEtWMkdVd1JoaStmWXZBOTZ0ZElNeWg2WDJxTzB6T0thQmIyVEM2?=
 =?utf-8?B?a25JbitLS2tkOEd6RmJteVdCQ0Q1VU4ySllBRCtCN2N2N24vY1JoalNIS2tq?=
 =?utf-8?B?UVBJWFc1aE9KOW1vNEdycG5GbkZpbXlkSzVOdHpJZWU3eGlRNU1HcUduTEZr?=
 =?utf-8?B?RE45N3lyS1M5M1h4TzhvMGZVNXAzcEYxb25CalpENU5VckkvNHFBMWFxZ0M1?=
 =?utf-8?B?NVZDcFlqVjRWaXVQdHF3RzlYZ1FNMjZtNkJ3SWZ3ZURoWHZnc2JpUVc5R3Iy?=
 =?utf-8?B?RHlLQUxyNGhxRVd4dVk0WUJXQkxWYSttY2FXWlUxR0xpdEVsTlFETDEybTNo?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E79197F186257B458ECD8FCA15C32750@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cb401c-5481-475a-d663-08ddea480bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 17:42:11.1884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7Ouw6gB8IR0u5bMPKR9XK5P8iaCycB0FgUYiP3u6hzaqxQEqFXuYz1mxBJ7Ge4UyrLY9DI8thEfwx+cOMk4BC+YtWcGEtlrR185vlyBHi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
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

T24gVHVlLCAyMDI1LTA5LTAyIGF0IDE0OjQ4ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Ogo+IFRoZSBHdUMgY29tbXVuaWNhdGlvbiBwcm90b2NvbCBhbGxvd3MgR3VDIHRvIHNlbmQgTk9f
UkVTUE9OU0VfUkVUUlkKPiByZXBseSBtZXNzYWdlIHRvIGluZGljYXRlIHRoYXQgZHVlIHRvIHNv
bWUgaW50ZXJpbSBjb25kaXRpb24gaXQgY2FuCj4gbm90IGhhbmRsZSBpbmNvbWluZyBIMkcgcmVx
dWVzdCBhbmQgdGhlIGhvc3Qgc2hhbGwgcmVzZW5kIGl0Lgo+IAo+IEJ1dCBpbiBzb21lIGNhc2Vz
LCBkdWUgdG8gZXJyb3JzLCB0aGlzIHVuc2F0aXNmaWVkIGNvbmRpdGlvbiBtaWdodAo+IGJlIGZp
bmFsIGFuZCB0aGlzIGNvdWxkIGxlYWQgdG8gZW5kbGVzcyByZXRyaWVzIGFzIGl0IHdhcyByZWNl
bnRseQo+IHNlZW4gb24gdGhlIENJOgo+IAo+IMKgW2RybV0gR1QwOiBQRjogVkYxIEZMUiBkaWRu
J3QgZmluaXNoIGluIDUwMDAgbXMgKC1FVElNRURPVVQpCj4gwqBbZHJtXSBHVDA6IFBGOiBWRjEg
cmVzb3VyY2Ugc2FuaXRpemluZyBmYWlsZWQgKC1FVElNRURPVVQpCj4gwqBbZHJtXSBHVDA6IFBG
OiBWRjEgRkxSIGZhaWxlZCEKPiDCoFtkcm06Z3VjX2N0X3NlbmRfcmVjdiBbeGVdXSBHVDA6IEgy
RyBhY3Rpb24gMHg1NTAzIHJldHJ5aW5nOiByZWFzb24KPiAweDAKPiDCoFtkcm06Z3VjX2N0X3Nl
bmRfcmVjdiBbeGVdXSBHVDA6IEgyRyBhY3Rpb24gMHg1NTAzIHJldHJ5aW5nOiByZWFzb24KPiAw
eDAKPiDCoFtkcm06Z3VjX2N0X3NlbmRfcmVjdiBbeGVdXSBHVDA6IEgyRyBhY3Rpb24gMHg1NTAz
IHJldHJ5aW5nOiByZWFzb24KPiAweDAKPiDCoFtkcm06Z3VjX2N0X3NlbmRfcmVjdiBbeGVdXSBH
VDA6IEgyRyBhY3Rpb24gMHg1NTAzIHJldHJ5aW5nOiByZWFzb24KPiAweDAKPiAKPiBUbyBhdm9p
ZCBzdWNoIGRhbmdlcm91cyBsb29wcyBhbGxvdyBvbmx5IGxpbWl0ZWQgbnVtYmVyIG9mIHJldHJp
ZXMKPiAoZm9yIG5vdyAxMDApIGFuZCBhZGQgc29tZSBkZWxheXMgdG8gc2xvdyBkb3duIHRoZSBy
YXRlIG9mIHJlc2VuZGluZwo+IHRoaXMgcmVwZWF0ZWQgcmVxdWVzdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4KPiBDYzog
Sm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4KPiBDYzogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+CgpZZWFoIG1ha2VzIHNlbnNlIHRvIG1lLiBJ
IGRvbid0IHNlZSB0aGF0IEd1QyBoYXMgYW55IGtpbmQgb2Ygb2J2aW91cwpsaW1pdCBoZXJlIGFu
ZCAxMDAgbG9vcHMgd2l0aCBpbmNyZW1lbnRpbmcgdGltZSBkZWxheSBzZWVtcyByZWFzb25hYmxl
LgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+
Cgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jIHwgMTAgKysrKysrKysr
Kwo+IMKgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2N0LmMKPiBpbmRleCBlNDMxZmY3MzIyN2MuLjk3Mzg4ODg1MzFlOCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX2N0LmMKPiBAQCAtMTA3OSwxMSArMTA3OSwxNSBAQCBzdGF0aWMgYm9vbCByZXRy
eV9mYWlsdXJlKHN0cnVjdCB4ZV9ndWNfY3QKPiAqY3QsIGludCByZXQpCj4gwqDCoMKgwqDCoMKg
wqDCoHJldHVybiB0cnVlOwo+IMKgfQo+IMKgCj4gKyNkZWZpbmUgR1VDX1NFTkRfUkVUUllfTElN
SVTCoMKgwqAxMDAKPiArI2RlZmluZSBHVUNfU0VORF9SRVRSWV9NU0xFRVDCoMKgNQo+ICsKPiDC
oHN0YXRpYyBpbnQgZ3VjX2N0X3NlbmRfcmVjdihzdHJ1Y3QgeGVfZ3VjX2N0ICpjdCwgY29uc3Qg
dTMyICphY3Rpb24sCj4gdTMyIGxlbiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyICpyZXNwb25zZV9idWZmZXIsIGJvb2wgbm9fZmFp
bCkKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGN0X3RvX2d0KGN0
KTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGcyaF9mZW5jZSBnMmhfZmVuY2U7Cj4gK8KgwqDC
oMKgwqDCoMKgdW5zaWduZWQgaW50IHJldHJpZXMgPSAwOwo+IMKgwqDCoMKgwqDCoMKgwqBpbnQg
cmV0ID0gMDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKgo+IEBAIC0xMTQ4LDYgKzExNTIsMTIg
QEAgc3RhdGljIGludCBndWNfY3Rfc2VuZF9yZWN2KHN0cnVjdCB4ZV9ndWNfY3QKPiAqY3QsIGNv
bnN0IHUzMiAqYWN0aW9uLCB1MzIgbGVuLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgeGVfZ3RfZGJnKGd0LCAiSDJHIGFjdGlvbiAlI3ggcmV0cnlpbmc6IHJlYXNvbgo+ICUjeFxu
IiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
Y3Rpb25bMF0sIGcyaF9mZW5jZS5yZWFzb24pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgbXV0ZXhfdW5sb2NrKCZjdC0+bG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmICgrK3JldHJpZXMgPiBHVUNfU0VORF9SRVRSWV9MSU1JVCkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAiSDJH
IGFjdGlvbiAlI3ggcmVhY2hlZCByZXRyeQo+IGxpbWl0PSV1LCBhYm9ydGluZ1xuIiwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhY3Rpb25bMF0sIEdVQ19TRU5EX1JFVFJZX0xJTUlUKTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUxPT1A7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bXNsZWVwKEdVQ19TRU5EX1JFVFJZX01TTEVFUCAqIHJldHJpZXMpOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZ290byByZXRyeTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoZzJoX2ZlbmNlLmZhaWwpIHsKCg==
