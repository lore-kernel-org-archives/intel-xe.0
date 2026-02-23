Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0CDEEC2A8
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3F710E45E;
	Mon, 23 Feb 2026 22:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCEugcEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BA610E45D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771886860; x=1803422860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NVegKFHrKoUVVJ6mUlveYXGhWLdepaqC9ATk71epZHE=;
 b=aCEugcEZPJihMIGMxdV3eaEmZFltakUIxXgGV0u2wk1+Eyu33myKJ0Po
 rgKR49otSusr5dY1bAzzuYvcAy3hzj0IZoTQKJBJuWn2KxAT0PqzlbaSy
 ABlXqGEDkmGAi9sxVb79+N9/cgvjGtr9FFivzXCsDBf/CkkxQlZl7qpNe
 hkMQKQC8qzpT8anlHFtEyHYDUkPta0ty+Cp26hH8QPXz0EFmqOhXxuszA
 r/nGQZh82p6am6cqfF9hh+roJb2GEVedINBOJqFg43Jc14LDB0gzKDwol
 KW3qlKOUizAIKPKcprvW7fVrdspL50Rdy2SSH5ph5wYK7bXoxzKYBhE0p g==;
X-CSE-ConnectionGUID: 7XxUUJOCSbKqPrHtwyMyIQ==
X-CSE-MsgGUID: lcFbAgYES0OUIKcbqqONww==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72598512"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72598512"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:47:30 -0800
X-CSE-ConnectionGUID: xHcGb1+dR0KpCI6jA39tyw==
X-CSE-MsgGUID: Tbtk2dRtQ5WXqn6NqapmWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="246294376"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:47:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:47:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:47:29 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:47:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyHGhG4V0IRrWwAOKiUC64gyoJlBEOWErcbKbGi4gceQfTdkx4oWQtsXaIUB6BYZL6ZdD126qKEWLoo84QVIIVPp1n/5xy2gi2LgmR04laCYGWaETbU9LGhKqsXSheFukGr4B3c52DYcxrdEsZISb0ahOBYhsFRpudD5fIgBJSMtpHfEoYu1V78skiZ+B7eLMk5DbMGiogfqZ0oEziTfYOCya2bLHu1R/SqCjm8j1YTNUqxyzKWnRn1GikPgYXvlRGpOfEqhGV7bRNWLg3fJeN66iY26/mSuF8I4EWlgYEyLB/Ingu2p/fxh78pay91RSb7SmRV66wklyeXxE81XCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVegKFHrKoUVVJ6mUlveYXGhWLdepaqC9ATk71epZHE=;
 b=TTVmOfoDy63PJPuZ0aZA/Nl6T2q3ulemYialF2JczbF/PiPek1c+fW4xS5gQjxeCg62FIBhbFe/S30PSMxV5UhsH+rOGRF8oRhWkmzTfKiuIxKeywWElJWHIdGi8Lk4WbC/qCjk5ZSZtvG3zrfFuG47rSbjSQ5kHvJIrmBxP/PBRkgqVGH8dJRJr5D44ZSXIAoIsZpaF86Vi2Hbg+VN8DxVYLZc6kO28rtLal25QPcifdufgnXK8MgEVal1uCLNlk+ynHrTiB/pRjp34EHBQA9ar+kfwtB4u7Ct42rkgb4HVjgIbmxojnl7SdFe4a0woMjNbmdILGhhSTiQkdDivgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:47:26 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:47:26 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 23/23] drm/xe: Consolidate workaround entries for
 Wa_14023061436
Thread-Topic: [PATCH v2 23/23] drm/xe: Consolidate workaround entries for
 Wa_14023061436
Thread-Index: AQHcoo5he7INYY/e1UCiB0kaJ3WzG7WQ5zXg
Date: Mon, 23 Feb 2026 22:47:26 +0000
Message-ID: <DM4PR11MB5456D2C6527EECDBD660F694EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-23-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-23-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY8PR11MB7170:EE_
x-ms-office365-filtering-correlation-id: df858a8b-53e5-405a-a9c9-08de732d8492
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YWkxZ29zZGlkOHlxcUdQbUNwSGZWZDc2eWN2MFpsWFdkbXg2SjJZYVpmODFt?=
 =?utf-8?B?TzF2K2VzRGY3N3pPbXFDSnpNYXVRc2YzTVdoQU5SUjhvSmdNNGEwMlE1dEh4?=
 =?utf-8?B?TXhWNXJTa2Vxbi9aK24vcThnUVBXTjhtMDcxZG81QUxKWmZOcVY3aUtLcmIv?=
 =?utf-8?B?eUFSM1hzNGJSQWN6SXRoajFoUm1xWEtsTVY4b1hxcEhCMU1Ya3lUckdzZ1BW?=
 =?utf-8?B?aG1JTGhpajB3eXlDSUhYWGQwUGxvWTgzYmFYNVZEL2puUzJpVTlNMTBPSWh0?=
 =?utf-8?B?c25JdFIzeVRKcHdTV2l5eXhqa2hHTjJUU3Y0cTZWTzBxRWhyQU5EMy9pVjNV?=
 =?utf-8?B?a2tDNURvL0dOYlN5UTg3OGRiVnk2Tmo4UTFPb01aOGgrU3kyUy9MTzhyQUZp?=
 =?utf-8?B?bVJrUlJjeEcrOC8zS0dPbWVEUk9aSXhaWTBHMmVZWHJ0QW1NamVjUkVXV0dr?=
 =?utf-8?B?TW5TUHI0ZFVsL1BDRFAyL1I2b283RldFSkp3MlZIMHlSeUZZbk5EUGtVTk9x?=
 =?utf-8?B?eUlIN2tKWk52SkdyUkdndlJzc2taajhvVWNHVGVST1V6ZmNFRzFDTEJiRk5z?=
 =?utf-8?B?UVdid0ZsWFJVOTVXK1pvZVJweGcvSVRuaXpTRE5PUmpmYXhocVBqWFlQcGhz?=
 =?utf-8?B?NzNYY0dyYWpTM2M1SitPT0hpVlhBSzhpaEMrS3F2anRUZnplWWJXYSt5K2pk?=
 =?utf-8?B?UkxWcWhwaitJRVR1WkJLWjRrcHhJek5KY2JOWUxrVFFLK0dHa3FFNkY2R2o4?=
 =?utf-8?B?ZTc2dEFyUHlQaGkycnNOL2lYcUlXbk1ZUlJhQTRDeWtZTExHYXY3NjNWbUVu?=
 =?utf-8?B?OERMdFNSNHRFd3Uycnpnb3pQbk5XMjZ4cEtneGMwL01rLzJua0xQUVZkc3ZT?=
 =?utf-8?B?bXJubE9YMVJSN1pBQVlsZlpkREh1bThnNzV6Nlc3dlNPei9YRjFjcHM1L1hr?=
 =?utf-8?B?ZHFqWEFEL3pCWTlwYmJZemlBQUFhd0s4c1VqaElaa0dJTlpzTUQrSUgxYXRG?=
 =?utf-8?B?dDZaQ3J2Q2FPOWxtWkoxTlgrc3c4bGVUWDJyTHp1cEhEbnRHaW5TcWhKSElE?=
 =?utf-8?B?ZEhTRXRFdThnY0ZLdEVqRU9xN3RnSm1tS2ZpOHkzUzVUZ25MaE5hUkFpYXFP?=
 =?utf-8?B?UitGVzdNL1JSVk54T2NtS002QUdDSm9paHhSUHV6WENBdXFxbVJnK3NycFBL?=
 =?utf-8?B?WWNPMEVVOTkwV2tGR0MySmIyZ1ZOQmt1dy91UjE3VFh1cGlJcmpodTdDd2Zy?=
 =?utf-8?B?aXFYOFhKVzdIRjlERmtZZDdSRk1oYURVVlRLZkxtazA2WUFYVmc1Y2xkY05h?=
 =?utf-8?B?cThDQjVsYVFVQWRBcHNNWDhLU2xLN1NiRzByWXhXRnRmY3J3RE96d0ZEZXZh?=
 =?utf-8?B?WlRDK3E3dzh5Zk56K2VZcFlOVjJDd21XMjVQdmNrRjZDUnQxczl4YzR4dHJ1?=
 =?utf-8?B?b1hkazRIMHpQZmVLZWJlUWFmM3RUT0FQY2w0VTBKOUhjb1hGYStZWGRCMHBk?=
 =?utf-8?B?K01ITnpYdklnVVFMclBGNFZYOE5tSUYraGUva3ZPcHY3RHV2Qit4V3JoblpZ?=
 =?utf-8?B?ZEs5d3NxWWJ1Ris0RitacW9sNDA0SFVyemlnbjRYbmwxR25WeUh5bE9DSUtr?=
 =?utf-8?B?cXRkWjJ5M1ZRS1dINHMxbUMyTExxWGpldlR6ZDNaWFl2SjNhZDNwS1NiK1JH?=
 =?utf-8?B?M1hRM21LS0daaU5VT0ZrMGY0Wmwwa0IvNUhWWGt0cHdHMVNJU29mRmNrQmM5?=
 =?utf-8?B?NHIyczhxWGQ2Mk9UVnFFVlpTV2ppUUhKSVNoM0djNWpZSmZFelBCcTBkV3FQ?=
 =?utf-8?B?N01RdjhQc3VvSWhHT2dKUERRTU5HQlEzQzBOdll1M1loL1JBVXM5bHQwRnNW?=
 =?utf-8?B?d2lGaC9KR1RNUk1wcnR2VU9QNUIvYlVOSUMrV1RjUitEMDNOTlpNR3kwWUNh?=
 =?utf-8?B?VDZnTDFpWHlMaVRHVUg2UWwyNUF5VjRuTHY0b25maEUzajJIeFdkbndURlRs?=
 =?utf-8?B?Q3Q4Q1NacG5ZSDZkNjIvN0dMSFJjemMvbXdEQjZSYVpsSEhZRFN5cC95N0th?=
 =?utf-8?B?NGZkUGZzNjlvNjBmY2tqL0xsKytabkpBVUh5UVdhelVrTGNMS0ZBTDNlL0RX?=
 =?utf-8?B?eUdITTRGSWZxY0RzejI2RjlnZ1lmUDZMTVo1cktKbXFjdW54TVR0WDJVYUN5?=
 =?utf-8?Q?wFT4kqIm98/Lo+sOiMo7yt4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0hsdmIyeGhoSkY2UTZuN2dWNEJvZldzd3NEdjc1R3hyM055SGQ5b3hLMjcr?=
 =?utf-8?B?ay9KWkxVZHl2U2l0QXlVVFNmQzd3Tk1zdXhJcHI0dFVjNGNtY3pkbGc2SVIz?=
 =?utf-8?B?VTBEM0gwYnFEcnRKcm44NHFQRGxqSVlXMWVEcjB1YmFKaVJOT0lPd0VXMjFq?=
 =?utf-8?B?YlUvRmVEdTdDVllIWnlPTWhQclMvRmo2VklydTFlNkFlbVBhM1VhZWhCb05s?=
 =?utf-8?B?RlNBRUFmamY0b09OTzduL1hoOGZlUTdSWDNhOXViMm5CVDhTa3JNOC9RaVJm?=
 =?utf-8?B?SnlNbjlzaklka01MNTBNRDJBdnJzZ2crcmFZUEpjZUxsSGdIWVdjd1JhM3Qx?=
 =?utf-8?B?eEpKK09qY08zWTRrRkNxNnA1TklQNkJYUHEvd3VsLy8wK3RDUXEwb3locFY0?=
 =?utf-8?B?VWh5RUNXa0JIeGkwSjFOZ25ZRzNhT0YrZjBzVGJDaVpodW51VXVwc2RtbExK?=
 =?utf-8?B?cVdER09rbEhTS2FqVFdtNHVMV3NCN1NjcDMvUWpmNWs0ditlaWwvaUp4bG5u?=
 =?utf-8?B?RWRCbldUcHlRemZPNmcxdTBFYVJqWWRtbmV3c0VXYmJzU25iNE9EZjdWV0RG?=
 =?utf-8?B?UGE3WXhhUFVEMWlSRmRwTFJSKzVYSEdEY0piMWJQYUNvR2J4TUlmaSszdWlQ?=
 =?utf-8?B?SW5LWGltWUpFbHowbmFFU2taYk1jVXpQbXc5SVk5cDRaV1AxUTNkc0NHS1Zi?=
 =?utf-8?B?MDZveXp5QVR4aFNxaG1yNUNVbTE4aWhCRjVlRE04TzE3QzJBQlFKRExTT2ZQ?=
 =?utf-8?B?L2pVdytpRXhQVHliNkl4bVZPeVN3bFUzbStGbFFYOXdQTTdPNU9Wamw5VXl3?=
 =?utf-8?B?RDZSdmhia1E0MDFIQ1VpcEdkbzhwcUtEdHZDRWJZWHU5aFNoRjY0OHI0MWQy?=
 =?utf-8?B?OEsxakxsUTk5N2pkUDFFdk1Pb1U1Ty9hWm9QRlNrdmZnQ2d6NVZwYjdqMm9W?=
 =?utf-8?B?T1VlbXBUQ3JFdE5DRncyanlock1GbFFvNDBBWXl1RDBhZjd5MHkrU0hDOEg5?=
 =?utf-8?B?Z1lSQnExbzlEdzl4YWZvcHZiUWEwK09lUkV3aXc1ZXZuZUtMalR1WHp0eCsy?=
 =?utf-8?B?ei9xejBtVVkwTERMS2FuS1lvU0F4QXFKRS91ZmgrLzhXM21FSWlmMDZxejFs?=
 =?utf-8?B?cXRtV1BIOE9BaEsrdE9JbVNzcks4WHNlclNGRG5CbmRGZ2VVKzhvNUJXdGlB?=
 =?utf-8?B?Q1ZnMlRuUVRWSEgyVjh4bUw5ekEwQXRtTmRGVEZzT0UxT2d2cWJhWGcvTWU0?=
 =?utf-8?B?OEtXbnVLeEpWd1A2RkFuOENQZUswVnUyaGZjQkFuK1djZlZRb2hiUktTWmFz?=
 =?utf-8?B?TDRNSmpBczh5aDVxNDVIbnZDRnhUQXpPNndjTmRFWC9xaHkzYnpyVXlyMEIw?=
 =?utf-8?B?VFpSYjYrUDd5eWFXRjBWR2NxakFqcmlsSkNuRUdFYm55TTJNTzJUd1JPY29t?=
 =?utf-8?B?MlFIeW1XdnpIaWZITVlKSWpsZFNHd3dkeHVuaGxLbjN6eDlWTmF1ZkJyTkMr?=
 =?utf-8?B?ZlJpKzZyTmYya0xpWURlajVRR2tMMFl5elVOYkNIYVQ1Vmx2VkQ3VGt2bm1k?=
 =?utf-8?B?MHpwbFY5emt2dmNsWGZ3MUlLdWpnNmZqYlRHdjc1MVZ3WW9HSDNacmpWRldD?=
 =?utf-8?B?YmZ5TXpSNkRjZDZJQkkvVnBKWkpYbUE4WmdpeDM4MFlXN1podURGd1ZidHhN?=
 =?utf-8?B?YnF4Vyt4Tkt1MC9SRDVtSjI4bXNQQ2RRNXFCclRQeTVORHZaS2ZwVFc3RlZG?=
 =?utf-8?B?QzNCanZiTkNHZGNQT1ZTVk1mbHhBTTI0ODJUblR3Y3NVTlk2OStBYVN4eHhs?=
 =?utf-8?B?c3VmaVFsZnZHMGJncDRyZEpzWUQ4QTZ6RnZ4Q0V3ei90OXRjLzJXRi9TK3Bi?=
 =?utf-8?B?Y3hSOENzdHIrMjdpeHdkV2JaOXRNMzVKSnRXK3BBY09KbnY3MVBjeFJYTGhh?=
 =?utf-8?B?YTBoR0JnUGppSEJVdlljZFpYeTdjNURlcTZOSXRLODBHbXhPc3ppQUs3S0hr?=
 =?utf-8?B?Z1V1eEpvU2NkQ08wUTBuRFh2ZyttdHBFV052RlIrZUl4MnIvaFQ5SytoVUZ2?=
 =?utf-8?B?dDYrWnVBcU03citPREN3cmhmdnVMRExCQnFhTFgwR3pHY2NvUkZkODc4UjBQ?=
 =?utf-8?B?SlFUa2Y3elI5NDZyNzVEY0laOTNPeW1DZVFRQXNPVGxhek1hb0ZDeGlldzI5?=
 =?utf-8?B?aityNEpMdzRyY29UU0pvc1o1ZTdGNE1IQXptYkp6Mm5KMXNscnBnWkp1V2E0?=
 =?utf-8?B?NGltZUQvVVd3VFlmZ0Q3S2FEeTg2YjY1YVQrMGlEdTM4VnB4ZzN2OCtFWjNT?=
 =?utf-8?B?U2JRL0lLMmF4MHBrQWU0M0o0RDZnMkl6VHJyQUhaTU1VMmx0R3NUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df858a8b-53e5-405a-a9c9-08de732d8492
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 22:47:26.7855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EblMle1N5mfBIRXIfdyblClMyrXhO1piIm7HQEg8srInLffmLCT/Bm13NJvSVDynLgnfuK0xaYihOPTQJBKyTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xNDAy
MzA2MTQzNiBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDMwLjAwIHRocm91
Z2ggMzAuMDUNCj4gKGluY2x1c2l2ZSkgc2luY2UgdGhlcmUgaXMgY3VycmVudGx5IG5vIElQIHRo
YXQgdXNlcyB2ZXJzaW9uIDMwLjAyLg0KPiBDb25zb2xpZGF0ZSB0aGUgUlRQIHJ1bGVzIGludG8g
YSBzaW5nbGUgcmFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3
LmQucm9wZXJAaW50ZWwuY29tPg0KDQpMR1RNLg0KUmV2aWV3ZWQtYnk6IFNodWljaGVuZyBMaW4g
PHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3dhLmMgfCA0ICstLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGluZGV4DQo+IDEwNWNjZDgxMTVmMDk5OTNi
N2VmODJlNzBjYjg3ZDc0MDA4ZjI2N2YuLjZiZWUyNDUyODZhYmI2NzRjYzMwOA0KPiA5MjU3Yzk3
OWUzN2VhNTE3NjBiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiBAQCAtNTcxLDkgKzU3MSw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2VudHJ5X3NyIGVuZ2luZV93YXNbXSA9IHsNCj4g
IAkJCQkgICBTTVBfRk9SQ0VfMTI4Ql9PVkVSRkVUQ0gpKQ0KPiAgCX0sDQo+ICAJeyBYRV9SVFBf
TkFNRSgiMTQwMjMwNjE0MzYiKSwNCj4gLQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9O
X1JBTkdFKDMwMDAsIDMwMDEpLA0KPiAtCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3Rf
cmVuZGVyX29yX2NvbXB1dGUpLCBPUiwNCj4gLQkJICAgICAgIEdSQVBISUNTX1ZFUlNJT05fUkFO
R0UoMzAwMywgMzAwNSksDQo+ICsJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5H
RSgzMDAwLCAzMDA1KSwNCj4gIAkJICAgICAgIEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRl
cl9vcl9jb21wdXRlKSksDQo+ICAJICBYRV9SVFBfQUNUSU9OUyhTRVQoVERMX0NISUNLRU4sDQo+
IFFJRF9XQUlUX0ZPUl9USFJFQURfTk9UX1JVTl9ESVNBQkxFKSkNCj4gIAl9LA0KPiANCj4gLS0N
Cj4gMi41My4wDQoNCg==
