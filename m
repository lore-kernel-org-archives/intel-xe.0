Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EC3ECD985
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 16:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F49D10E224;
	Thu,  5 Feb 2026 16:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUiUyu+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054A010E211;
 Thu,  5 Feb 2026 16:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770309093; x=1801845093;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ajAhSpqix7leUzCQE8LhgvF4MTlfreHsq4LTM65lgdY=;
 b=mUiUyu+Zzt6gTBHBUsF3LMHXR37J1lQXdzmkK8IhoJ/3CgqJ+gq95Y/O
 L06Qqd/WYeooW+ydeve1cm8NvrXvw8bEFz/05iZSe5OScwGUMvmmOgBbN
 ARHSvLasEuDKPDH3oCfRANmHyQdRaH/cWpRuZA77ju2iRx3rQuXNXhFzr
 d8aQbgjP+DliqQ+Lmv5a59GGiLWALPUObWdXJm81/h30g92C/BcRE3V46
 mXAtklXjd3NpAfDeGlETyk+NSzIDkiMyFqIXd1AA/hi57Pfxk3l2wAOuC
 Z/+ct8q1LhNg6VLGLx33w4vDKqeSI/7D9hzjr1kJymVSWiltsQvfOZ8cl Q==;
X-CSE-ConnectionGUID: kJpe41p/SU2FXDC+hy5SiQ==
X-CSE-MsgGUID: HZtRs+7nQEua1OukrJQ8CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71610034"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71610034"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:31:30 -0800
X-CSE-ConnectionGUID: AnRczyVtRr+2kgY3PjIaFA==
X-CSE-MsgGUID: USfEeFwBTTeFZGbofAZcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="241256460"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:31:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:31:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 08:31:28 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 08:31:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSARs44uz4InOmrTNPF4iiJa8vSRkdTvD/0g/m+CSJlIHwqwVqLJ8MvG9bKGK2i2Qm0dlW8hCYqQ6E71mgTWFu21zVC3xb3y/EG03U3P5M5BiBvFs4GYjso+Sy8bKth+bFN4gJB/KtXEoK2/rRnMYPTIwpjC1Y+R7fSkS+7puH+qPcAOcGBk0PS5N3JEt8gzrgUwR1INDOzha1NnRlvj8J9I4ygHa2lmXzxfIdq8ccUGbZK5qxuTl9nJOk8hwDpgOD/AjHy33obIb60dZ590R/jmkErvISZOlMrJp+OUmULOEmBLSFRzSXEj6AEO5oLFgGtiAq37QVyyP11R+PaYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajAhSpqix7leUzCQE8LhgvF4MTlfreHsq4LTM65lgdY=;
 b=fbZn0ZWwEKryk4WolQm15eYm6L0QZwaB3X/FMgFU+OP2u5OlGH0L07HLwTbscOsANTVRiPze9BOKaUMHrZ3Jg1iBzhL+TmPmoPba4ddsjTPV5KRwstU+tMAHoZjrsTMXnzU+O7YeHNA4tkstKw/sqD3GvaWZApPvQNTUfeixGzrSpmIi+/rjF8cFdWKhCCHhEI0AReic31xm5AiPnSFd7HUAyc7PG9MLMXfyDKpVn8GaGA1wO6S6xg+pN8GsLQFqZf8B/QvYlgMuuTGw/ewPILLxBaWCxK/f71OABxJDORz5Ho6u0AUa9pkkINEIGnMTto3tJnMpO1J+Cy4U6xArgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 16:31:23 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 16:31:22 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvbW1pbzog?=
 =?utf-8?Q?Avoid_double-adjust_in_64-bit_reads_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIGRybS94ZS9tbWlvOiBBdm9p?=
 =?utf-8?Q?d_double-adjust_in_64-bit_reads_(rev3)?=
Thread-Index: AQHclrzdeN3SUJjqKUqoY7EdMKVDoA==
Date: Thu, 5 Feb 2026 16:31:22 +0000
Message-ID: <DM4PR11MB54567201F6778E27B128B018EA99A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260130165621.471408-2-shuicheng.lin@intel.com>
In-Reply-To: <20260130165621.471408-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB7121:EE_
x-ms-office365-filtering-correlation-id: b88e51ae-7360-4289-2b3c-08de64d3ffab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MkN0cFNvVTNqdkc0eDR3UlgwWkYxbElXUkEyekhrcGZIV0dDMTAwbllLTlpv?=
 =?utf-8?B?QWcwckZ5ZEV2K2MvYzRyWmlrS256ZTZCeFkwR2s5UzV0MFhIRnpRd2JwQWVP?=
 =?utf-8?B?a21QRzQ1czJYS041R0xjTEVVbHFkTHNMWkVaZmx5RFNjKy9hWG5hRzcya29Y?=
 =?utf-8?B?NkxUSTdHajlzaXVhREFreXVmT25tOGpQZ3hTbnBqOHJLSFZCeTRPNHh4Qk45?=
 =?utf-8?B?SFcvSzNlSWM3TDVISjg5Wm5nb0tuKzBtVmV0bEhwb25pYzFHTTkrSHc0ejBn?=
 =?utf-8?B?ajF0elFtb1cwczhJL1NsS2xaMm1TNitYSG0rWVhLaTFib3RYMWhOUDZBZld1?=
 =?utf-8?B?R0FmSGRHZDg0UUpIRnJlUUkwVElhMUVQeThRbUVSbkRsTG4wbHVyL3ZQNDFC?=
 =?utf-8?B?bU9hdkc3d3prNU1KSmhKRVZRR2JvS2pINHZGREUrNWZmMWFNSHRkWm5ZMHlC?=
 =?utf-8?B?SHRtSnpHNEpaZVVURmFMNGQxaWVibUVyb2FWcXA4NGhObjQ3cnd0WHRmUnJE?=
 =?utf-8?B?V0NqblRRRytxYU1ldVJIK0dJb2RzSWdtOFNDdUh4Ym50SGNmanhRYW50Tkcz?=
 =?utf-8?B?VlZ6TXc4YkRaNFl1dFNNWlcvWndTLzVQaSt4endjc25YMmFnZnFVWE9rZmVR?=
 =?utf-8?B?V05ZS0pXdGJmSC9QSjRMQjJJWHlPRzZPYkdZa082UTZ2RXprb1J0Q0xjYjdh?=
 =?utf-8?B?UldiQTFjaGUzUnJMQ3ladE1QL3grNlVJa3dmZ2RJa0tPQ2NEQ3RjY0wyaHlj?=
 =?utf-8?B?ZUxudXJyV3U3K2ROWWdCSDVRR3U0QzJmMDROWlFBek1QRnBMVG1VQitKaW9l?=
 =?utf-8?B?N1pESThkbi9CbFBwYVRJNGhZaTJaYzJ3bHF1M2FYOVBCK09LRVFxT2xFQWZI?=
 =?utf-8?B?RTFPWEhXRW1Cc1B1UTV4L3ZKakdMMnBjV1FaNHRhaFV2bnVBT20rT3JGTkNj?=
 =?utf-8?B?d0w0TDNPVm02TWl4TVViMUY2UWFzdFFZM0Q2L1ZWV3lLRzc1NWsrNmtITnAz?=
 =?utf-8?B?aXVtZWx6cEFkMTlURDR4WTJucisvd2VSblpwVDB4U0ZhM1pKOGJQTmJTT0pE?=
 =?utf-8?B?Z2FpQlhRMnc2QXR5MUJZUG1MUEVjcmVVbFBzekU4ajA2c3cxbFdteGc3eVVX?=
 =?utf-8?B?OW4wY3UxZ2g2Y2FGWG8vaU1pZk81SFFZY0hTcFNIUWJMSUI0alppRkdpTjBj?=
 =?utf-8?B?ajh0aXNFM1c3bENIRnRzL1RmUGhUY2JBaDQxdGNpMmRiaWwyQVp1bHlYcERu?=
 =?utf-8?B?K3Y5SDBKYjgvZXJEOGZ2N3pPME5jcExPc01TcTh3WFlmRVRldm1qMHIzaFdi?=
 =?utf-8?B?VHhXZDhwK1dVaVMwazNuM0pmY0p6SU9UcU5rMTZVOG5NS21nK0Jmbll4Rmlr?=
 =?utf-8?B?MmswT3hFTGloNjBLYTZaU056Zlp1UU5HNDcrVWRVUGQzaWJKbFNVa0hMVWVy?=
 =?utf-8?B?V1Ixc3g2L1hTSkxwVkZnN2pqTUhCMFRjU01OcllNT21RODF6dUdvRWVaSi94?=
 =?utf-8?B?a3U1NHlSN0NTQnY5bnVkZE5KUlFDKzRDUjRST3loRlNhcVdUWHBJN3Z5SzI4?=
 =?utf-8?B?ZUFXMWdVeGw4RGZlSEp2Q2ZKMHJ1TFYwWngydXYvaFA5clB6UmYyWmNDaWt2?=
 =?utf-8?B?U0FJcDNQckVqYVVRWXJwMlNxaDhHK08zZldjcG1YWkp3RHYzb2hxaFhISlFC?=
 =?utf-8?B?bkJiTTNWWFdoWFc4ZzQzREFOQzF2aVdNM0grbVRxZVFRMERnWEF4ZjdkUUlu?=
 =?utf-8?B?L2Z0U1JZc2NFRXM4MDRMeXVDekp6aWczVGJaVWdFQnN4SFN1ZXhEZW5sOW5F?=
 =?utf-8?B?aUdiODE3TWhyUEFUeFFXaklWU01aZWI1d2huK0xudHVndmZNL2VaOUw1MThJ?=
 =?utf-8?B?OVdTS1krZHJqSXprb0RscUtkSm94VXBPeC9IQjNHS25WM0JwWXJvTDBSTFgv?=
 =?utf-8?B?R1UveVk4Y1hhTjBYQ3UzQ1RZS3hrLzdSQWhpVEUxbWdLd1pWM3JkZHNyc2pJ?=
 =?utf-8?B?QmIzN2JvazBEUHdJWm1YbU5sMU04ZFBzaGtEZ1B6RTBpdlJyd1V1TzlYc2FJ?=
 =?utf-8?B?Qld6SW1GNHJCRXhWUWpnMDRHQmFDR0QycTV6OEdwUllzVkhVRGJ3eTl0SEhR?=
 =?utf-8?B?QktyejZOR1UwaS9KZ2V0K3g0Nk1nb1MzMUVxV2gwS0NxOEtyU0xEUmNBNS82?=
 =?utf-8?Q?iUHywV2tW1Qi9XAAzJUiWr0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEJUbG44UUcvczVyMzdoaE43azhTNDA3SkRpaWFFaUl0ZFhSbm56anI5NVFX?=
 =?utf-8?B?Y2RjRFFTVEo2dmRwYVJMZ2JiZm50Ynp0c1paTWdsL3V2d0grbSt1R1JNVVFL?=
 =?utf-8?B?ZUxkMUNubXdRQ2g0K0YydE5HOXBWek1aa1g2VEl1a1A5VnpTT04rZzdNTHdU?=
 =?utf-8?B?VVNldFRoZm5JNm9tQWxqRHoxSVcvQjZRdzhLbnJ1U3laS1V1YXdtSXo3V1hX?=
 =?utf-8?B?NFZ2N2ZiVXdNZ0tTSjMxbFpSOFdvRUlvTnhzSjVwTUZvb1dKNHhiNCt5eDAv?=
 =?utf-8?B?Zkpzc0d6UGJuVysySXl6QWdZNnpJQ3FBSWx3VW1RZ3NTeTg3djlmV1Z2NUlV?=
 =?utf-8?B?U3k5ZnNyR1NscWF2aDZZb0ZHRUF2WDFiODRyZ2l0OFBuMjJuWXlpcFRTN1VV?=
 =?utf-8?B?dk5KMDdzUU9uUVlVZUhhaFRFUzM0aEh2WGxyb1VkKzh5V0x3dXh6MWMvWUdQ?=
 =?utf-8?B?dUpoaXVnNGUyRFJxTE1jeEpoN2VZeis1a09yeWs1WitrV3hkNlAwUWdJTlpB?=
 =?utf-8?B?TjNEMmhZLzQyT3NRVmhQU3BpdDhubS9zZzhMa0E1Zkk1clJWR3pIOUNTVHdz?=
 =?utf-8?B?R0pGQjdvdGJoV0krMW8rMHVFcEZDSlVBU25SREtTZHd3NndaL1VOamFad3Na?=
 =?utf-8?B?azdPTktxZnNsUHpMenVzMitEcjF3L2VlZTc4cFpjK0VKTHI3ZFJ2M0dUVGNO?=
 =?utf-8?B?RFIrY2NCYkxjRjE1VFdTK09nK0xDSTB5WlJoYzNjRjJ4azNLaXZoVkEyZDJG?=
 =?utf-8?B?M3VLd3RJREFhV3JycW5WNzJXNTZ4enJBVStwTVdLckFhVGZ2Rm50dXhmSENm?=
 =?utf-8?B?UWh2b0NjTS8yaVJDVzFqb0JMRXREeC8rT25OS2ZaaStQVFlVZndJdWtqay9J?=
 =?utf-8?B?ODQ2MHdNdGJDZnpQM2RhUzBNdVBESTN0VTFFc3ljQXd3UGZVYU0ycGg3bTVw?=
 =?utf-8?B?ZzBJSmswVEttNm5zdk8wWHM1QXJxUzBYc2lMTEVrK0lET2E2YnpNZEVNeG1M?=
 =?utf-8?B?WS9mV3h6OXZ3aHE4MUpuc0dwSEpJdFpOUjlPWHpoV2NjRzk1SlJJOUxYZ3VO?=
 =?utf-8?B?YlJnOTl2aVBvY05IYVJzSnR5ZFZDTlRvUHlnL2h0UXMzbUhsVTBDTnM2Y2Fs?=
 =?utf-8?B?YVh3QkRjeTYxMVoyVThLSkpMcGJ1Ly9jNmJBRFlSU1JOcEgzRUJFZ3pJTFNO?=
 =?utf-8?B?eFViM29ESDdFMSs4UDNaakFKL0c0UnFCSXoyUEh6V2ZoZEt2UDJhbU5EM25p?=
 =?utf-8?B?dHRvclR0dUljdml5ODNUcy9IZ2RsYW9FYmdYSEQ1Uk5JZXhiZjUrN3ZSUGM3?=
 =?utf-8?B?UlJ0U2dWNndNZWRrcWZBKzF5cTBhUFZvZ054MTh0U3plVWFEU29zaEVQdFpt?=
 =?utf-8?B?TUwzUXAwTFp5NXY5MVNGeG1Mbktlc05IVTlDdStSWUloSFEvaHhTUWRzNW5Y?=
 =?utf-8?B?N0FDNXFtMjFaMWd6NTI3QStPTk4xb3VDbVRZZUxJSnh1WXlzc090SWVweG1q?=
 =?utf-8?B?TFJQbi9QYmFhSmlYMHhYRmtPcS9Hak1mUDhyQXloOUxHMGd1VDJNeDk3a1NY?=
 =?utf-8?B?WTRmVGVQeDArYVVSOTNjNXJOLzFEWElrY2dDd01tbUpjbVZaMDBYSGpyZGhW?=
 =?utf-8?B?YXBTdzAwOUpkMmM1MUZGR0pYUzlnb2hZLysxTXY2cTBBWWtVdWJsL1RuWkpj?=
 =?utf-8?B?MVA1UTFJaVhWc0hXQkpPY3pxeUJKK1gzYXk2OGR4czNvTGxSR1c5TmNTVk9U?=
 =?utf-8?B?bVZyOURCeGx0cDVnWTYvd0tOSXFTU0grY3d0Vk5XQlNoOU1HWUtkdmNrai92?=
 =?utf-8?B?dTIybXNpMVBtaXZCdDBLNVgrdUkyV3VvcGlEYlh6VE94VHFYSXQ5cXRNOWpC?=
 =?utf-8?B?U0c3cmRJQjJoWkRJVXpMMktnOHozNHZSc1hBYlZMU1dGcEhlSXh4Q3pLY2dL?=
 =?utf-8?B?ZDJMdkVBTTVDcXprVWN2bGx1Ky9oT1RpYWZwZ0FBTFo4RFNKK29UdHIzbWxz?=
 =?utf-8?B?ZGg1MUpkR2EveUFVMkdJbjR0K1FJNkRGTU9NYkY2SVdzcWt3OGp2NjBWZzZr?=
 =?utf-8?B?WWRMTWhjeC9ELzVDdW1UVEpYbWVZYXpJUVlPZUI1TWRuM3pkK3MyK3Bia0o3?=
 =?utf-8?B?K0F3enBzUXVOYUp0ZWlteGtHdmMwM2dKcnNsQWorVkVpODlvbXZQUDJRUE5C?=
 =?utf-8?B?VEovN0dhcXFwbUlBSnRQRnp4ektwU0dtWXhWNmV5dGk5bHMxdndvQ0tobEVi?=
 =?utf-8?B?Y0N0cWpteGkxNXlaVlhLb292cjFwMVNBNmtnM0ZyQXVlR1hCVWFQZlFWUmNz?=
 =?utf-8?B?NUhBamszNDU1S3VMZzNSRVVxOHRZdUlqb2htUjVRRXhJd3pGQVJSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88e51ae-7360-4289-2b3c-08de64d3ffab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 16:31:22.3139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYWrRiypelPFOg5hwGIw5D7x7z/MrD4tCXOF0w3t+W7mn5upgNzbWqvkGQA3S1Yh5wadL1iN5xUO6rVBp7SbsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

PklHVCBjaGFuZ2VzDQo+UG9zc2libGUgcmVncmVzc2lvbnMNCj5pZ3RAa21zX2pvaW5lckBzd2l0
Y2gtbW9kZXNldC11bHRyYS1qb2luZXItYmlnLWpvaW5lcjoNCg0KPnNoYXJkLWxubDogTk9UUlVO
IC0+IFNLSVANCj5pZ3RAa21zX3ZibGFua0B3YWl0LWZvcmtlZC1oYW5nOg0KDQo+c2hhcmQtYm1n
OiBQQVNTIC0+IEZBSUwgKzEgb3RoZXIgdGVzdCBmYWlsDQo+V2FybmluZ3MNCj5pZ3RAa21zX3Jv
dGF0aW9uX2NyY0BzcHJpdGUtcm90YXRpb24tOTA6DQoNCj5zaGFyZC1ibWc6IFNLSVAgKEludGVs
IFhFIzM0MTQgLyBJbnRlbCBYRSMzOTA0KSAtPiBBQk9SVA0KPmlndEB4ZV9tb2R1bGVfbG9hZEBm
b3JjZS1sb2FkOg0KDQo+c2hhcmQtbG5sOiBETUVTRy1XQVJOIChJbnRlbCBYRSM3MTQ1KSAtPiBB
Qk9SVA0KDQpJIGNoZWNrZWQgdGhlIGZhaWx1cmUgbG9ncywgYW5kIEkgZG9uJ3QgdGhpbmsgaXQg
aXMgY2F1c2VkIGJ5IG15IHBhdGNoLg0KVGhhbmtzLg0KDQpTaHVpY2hlbmcNCg==
