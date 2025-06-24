Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE95C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 22:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662FF10E62F;
	Tue, 24 Jun 2025 22:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcqLUGgN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622C410E62E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 22:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750803490; x=1782339490;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JCuj8YGpYoX8kIalDRC3tMks76Cv6aHTglPjCquCZPU=;
 b=WcqLUGgNjQBdjmVYMxuMEFVZ75nSIrYDGnWO8cJbZhJXBzQPCFEME3gc
 NjhQAK6Y45WqEIKXlHTrZ8Sl9xissngVnqlRbuXIUAP6crV2qnYtd4PPQ
 T8gfWBaK9O/xvZdnviaTU4af4U7qyz0uXR6SZtQpvqreC+m3GzUt7vlcy
 gwpt3TUBGmxLIQGJhOhoXpyqnnguU9qJ+Yj9Doa0S6Qsj+QtEMaUBGNGd
 jgq0N0lCLhUtP8PsrNoKPV+cnFgYWOiPf9Sg4YC89DIVBdEaydTtIJ7rK
 jDAlAuG8yy63kXgpkDGu3A5UNdgpceiYRXanm0BD1r9K02swSeB+4NZI/ w==;
X-CSE-ConnectionGUID: iwEmhejVSeqVlnN5l8Wpsw==
X-CSE-MsgGUID: Zcq2WDfXTe2zdZYX4xeDgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52292470"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="52292470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 15:18:10 -0700
X-CSE-ConnectionGUID: t2hM+rvwSnSczrmwqyjfKQ==
X-CSE-MsgGUID: v0t6V/q3RRuD0KJpCZ2/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="152207473"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 15:18:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 15:18:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 15:18:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 15:18:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuFWb3KysVAb8NPFJH9yp/stt3FXJSRgyy8Ba7mMz5y0bWPJ/tbOe+O1I4uUHe9ExwtbPt0B9bjOMeVywhe2enCc8U0uaZkYChnLtvR+OfkVo/qEsPVC/0Q+EgIXyqlC1J4N1ILlXnpf49x9sJB9QjcNqMNasPSiBEe2L1eBqR8Ot3psVFxAebpW0zYcyGGWgx+V/7kJ9eGYaqxEhSAwnRvydiQmOn+N/17BFxwmtLPZD9MchVlwWZ9O0PG5KckAcvzFHCY+d6d1hb251HH7KA1YYbPlgsB/h/et9hj87OgVS3LY+pY2oxpTbfZ8f9ylnUN1n0FQPE3zsyRV2oN8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCuj8YGpYoX8kIalDRC3tMks76Cv6aHTglPjCquCZPU=;
 b=hdjrWgCtVexvvAvFaW1O01bk77Cfsmom7UgFTliY26nG41pyImQ6aQ32JR4T+9FdxwuQtGZoCA8eHUKWwgTj4i62W4OUoIKO41jN9d+pbSgLPgNrcUNCyfGWQ+zcbS87EmEYyjVjgYaIiiToBiCB8utd237CS6kzQ59fWC0ISVEWycfkMVfm1VWUdBcgLs/A8RsOIZ92sjWK6asDTvOLqhA7ZBarOyakXQIV4AqJuc6r/8MuFGdDLf1VIjLhNwEP015EbX4XUI55gryu7fqLWwdum6tku1n5E7tD2HJij1FaS4l2LPdhLDY9wsCxYV4ejm0rSscKyyQkMLIyRL3O0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Tue, 24 Jun
 2025 22:17:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 22:17:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Summers, Stuart" <stuart.summers@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v6] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Topic: [PATCH v6] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Thread-Index: AQHb5KXK98cu26FvyEGmOx+tptJoOLQSwBcAgAAgayA=
Date: Tue, 24 Jun 2025 22:17:48 +0000
Message-ID: <CH0PR11MB54444E1912ABECAA4426CD92E578A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250624011735.3976-1-zhanjun.dong@intel.com>
 <4715fb2c-8176-4ace-a56c-e6dfc2da08c6@intel.com>
In-Reply-To: <4715fb2c-8176-4ace-a56c-e6dfc2da08c6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4772:EE_
x-ms-office365-filtering-correlation-id: 480d3c38-7d19-4760-f444-08ddb36cf3a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Uk9FVTFDTms3RStDcDdsdUNNWi83dmJlZjN2MFk5a0J4bTJBdDRNMDdhemZF?=
 =?utf-8?B?V3FvczBEQTB0cmZkb01Ud0ZtN2loR2lpd21UOWNGamFmdW43MWZCZjNDajMv?=
 =?utf-8?B?eG9ocmFZazNncGE5SFpUekJuVHNveTFFOHdOaFBxMzJERVRnZHlrL1NuM3ZD?=
 =?utf-8?B?YXhTL2drWEJvY2dYdmJYNVJUeVhCclFRWEtpK2NuU3R5UDA1MHh0Z3FGS0cx?=
 =?utf-8?B?dFRCUlFINytuQzRpYk9rZG5PUnV0a0Q2RlRRZlJpWmpCR0lPaWt0SlhFRVlh?=
 =?utf-8?B?UzlRNEw0QS9tczZFRzBrUGY4djhLckJ6S3dXcUpYT29oYWZsSlVsRXdqNHZX?=
 =?utf-8?B?MWVWVlJ6KzlrcG1DMDI3Sm1sQndLelJjQm5GdWRzTmw3ZHhDNURIdnd6TVBZ?=
 =?utf-8?B?NzVhbWtqU1FGNnpJNEh3R1hucWpFR2dnS3JLa2svOEp1YnFHZ1BEUkQzZHk1?=
 =?utf-8?B?Z1Zwb2FnZ05Wa1FVMVI5b0U0ZWlCRFB3VkZWS3h4L2RLd2tzc3grSFBETUli?=
 =?utf-8?B?ODFTWmxqY2d5K1R2SGdxRWQ4SW5VSjBXeXJ1SStKMVVQcDNPbk05Y241YkZT?=
 =?utf-8?B?Z2VzQmRSWURFZ3JXUFcwazl5ZFNxYWI3dGw5MXhHQTdLdWRwMHpVeEN0NHJH?=
 =?utf-8?B?ZDZMVzhoM3h1L0cxRzBra21sNCtmdDIxUHNuQ1ArZE1yNkdWTHc3R1Bqb1gz?=
 =?utf-8?B?VHJiTWJmdzZzb0psZ3A1cnVSOEMzVGMzb3YyZW5TMUZVY05jTGpTVnBHZGZx?=
 =?utf-8?B?dUdDQ2ErUTVPK0hpQmk2d0lMTHliQkFaL2U3UC9QWFZrOVBFYVgxOWp0YXo2?=
 =?utf-8?B?azBSbTluN3g0dkhlakJIUk5FbDRzV1lFanVJdysvMW5NdmczK201dDNlVFY0?=
 =?utf-8?B?MWN2eURGS09QYTE1VDhjbmFDejhyQ1U4K3ZQMElxeXF0ZjRhMzM3QkhyWEpt?=
 =?utf-8?B?amM2WnoyVk9IVkExa2VRbnpXYmpUTlE4dnFTUU9YMDk2WTVoa0tObVQ1bHky?=
 =?utf-8?B?OUVaMjF3aDRyczNLS3ZkOUU1QkV1amcycTBYOXJjbktlakdDT0F2Si9aUkRV?=
 =?utf-8?B?d0h5b0VQYjE4Vkh3YlZFaU1RdWhETlRGSmNScVRHMExYTldWd011VzF4RUZQ?=
 =?utf-8?B?SWpuMGdNTHA0V3RmY0lRNEdhbjRFOUNRL3BtMjk4ZXFzU2lXbjl6dmFuYzl3?=
 =?utf-8?B?MTVmYllZV1lQeDBPNEhoQTdYL1hHK1p2c05HVFhOL2JXb3JWRlBmTjBBSld6?=
 =?utf-8?B?bjN5Y2pIYkFISm9xVU1la1NYUXk1eU1QR0d2czRsUjZCOFZ2SlFTckZsaXgy?=
 =?utf-8?B?aS9NemZEZHNFblk0TDhuNVUwa1VxYXFqUGxSc0VUM0pqWUhEQU5CSFQrVis3?=
 =?utf-8?B?Q2M4VE0wZnI5ZUt1bTcvWnI5QUR6blhLWVZ2U1BwM3VETkx0aDlRdlJaV2ZZ?=
 =?utf-8?B?UU5LTmlqYmgzeUJjRElMeVg1a2NuM0pNcmJpcGhMejJrTmY3eWNqNlg2S1FL?=
 =?utf-8?B?SWp0ZUNKSVpmSU5LVFJyVzlRN0lRVU8yclZxc3d4VGxrYUxzRkV2N0tZeExJ?=
 =?utf-8?B?RGo5NkhoaWRLT3JwRlNSc2F2cEpPcDZaKzJRRHlpQmxlNktHMUJiN2lwZVF5?=
 =?utf-8?B?dDhDd0hmU3lMRHNlSnZFbzZGeE42RGtGWmR1c3pMS2VUaHpTanZZcjZxM0c3?=
 =?utf-8?B?NzBHcEJBbkhxQll5OFgzaWRwUFJQd0xTYzU1QXBtcEtyeWkvK2FzZCtobW52?=
 =?utf-8?B?dGNISjFNNHVnWTB0TlU1bk10elViRHpiditlVTVFRDR1cG1ETU1KMEtaMll4?=
 =?utf-8?B?RnYrSU5RMHZBWTloSXdXelpxbW5uTWRnd1pwd3RXbm9VT0E5T0F2WE9uZ2x3?=
 =?utf-8?B?STJhVnV5M1ljaXpSbjk0REcwaDY1UmVQY0hBZEdSL1FyZTFmWlFyQ05WM0dO?=
 =?utf-8?Q?kFZXMkEBDe0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGdWREFadmFxUWJYbGpTREVGeVY2VHh3b1FqQ0VDUjBkTjNSMWg4MjlwVzRS?=
 =?utf-8?B?bXNPQXY4UlJrcmlJZG10WHFqOFRhRHdJVVhpbDJKdkxkcW1mc21mQkJpZENm?=
 =?utf-8?B?QjMvVnJ1QmI5aVNCYkcxQlFraERJanlGcnpIOVpZRHFqdkxXbUpBbFdUV0dq?=
 =?utf-8?B?S1VKcm9wazB2VDlka1dZTGFPU0lmRXNNNllaUDJETEVaUE1nOERkUmZmSnBm?=
 =?utf-8?B?WEZYRGlNVERIWk1vZWV4dHlWUStMUEFKSm9DckpGeUFYczJETTc2OHZPQStp?=
 =?utf-8?B?OW5mamRMcFgxT2RGSklIT2dTaUZCdE4wZmpOQUhUWDRxSGJCRFZKSlAzdU4y?=
 =?utf-8?B?Tm1zcDBvWEswVW9wTU5ncmgyQ3l5RDMxalNxalQvWG9nU3d6V240TUV2NlZX?=
 =?utf-8?B?cDkwNmlBN05XdjhqcDBEcERKZVRvUUhuYU1GWUIwK0h0bGlkcUgrWXpIUGkz?=
 =?utf-8?B?emFDUkhJREkrTWpkcS9YaE9hNEJ2ZjBUMlNzWEtiRUN0MTMwbkluKzJUcnpJ?=
 =?utf-8?B?ell6eEIra2hiSzBNVlVFK0liTkZYQUVQOWJYOWU3amVISkNxV3A5WGE3cGNL?=
 =?utf-8?B?QVlnQmNPclArT3BlQXhORU1zdUdqZnBzQ0h3ajFZejBnTGVKOStybkRiWDVk?=
 =?utf-8?B?U0NqbjdWQVhIck5tTHRoSWZrb2ZnMWp1TExiZFdHRnY5RGp0L0xrQ1F0dmhQ?=
 =?utf-8?B?STdJb2toWFJwM1BTQ1VCbGt6YVh4WDAvRkpudW4wbDYyd1dkeVh4OE10cUFR?=
 =?utf-8?B?VXB5M2p5MFBPNEwrV0tUQ1dRaXZnL0lldnNIbWREZ0lkZUNudWpWdVZKQ0cr?=
 =?utf-8?B?VG8xOTVBRUU0WDdlMmhZLzFCSlNXRUlFRUhlbEpPZnNsaDl2NXowTDhYaDVh?=
 =?utf-8?B?L1JWL1ZqSzc1M3c2MGtmYkRxZU5PVUpnQXJrMkRsV0lYNG1yWWZFRFFDYWxJ?=
 =?utf-8?B?MDFZYWlUMDJOeCt0TTdzNzhtTFl6OFVDTjdEUUlnaFYyOGROS05YVW1FcHFO?=
 =?utf-8?B?ZTJDL0RZeER1d0MwY25MamlsQmd5MjBGMGxacy9KQWlHbjZWbURmTi9hMlAr?=
 =?utf-8?B?SHBZQnJETk5BMHVFQmVEcVJJcHgwRWhOVkk5K0pwM2VUWjY2YSsvY0FsV1Jk?=
 =?utf-8?B?czNMT3FBSjFqRHBWYkFMTDdBRFNuSklOQUMyNWFGL2Nwd3dSb1NqSFpkcUV0?=
 =?utf-8?B?azhJenJJdkxUUzN1ZWs5b3d4YkdlS3MyZEYrSExxanpYdkE4cnpiVEJPU1lX?=
 =?utf-8?B?dVl5bTBianZ1Mmk1MjNSakg1aXE4SzV5M2lQQmpvZ25zRFh4WHRNL1VkcEVk?=
 =?utf-8?B?OEozdmZOb0hQS2x1NkxQWnNLZEl3b2dPM01aYzl5bVBHMXBBRVBFQzBIZG1R?=
 =?utf-8?B?TnQyUVcwMERUVmlYR0JZOFNMTXRzOGUwcFU4MzNXNjA3UU5KTmpGbk9ZTGha?=
 =?utf-8?B?QkJFcytkVTZ2RVJYckNmaXc1N1pZdlhGUU9sUmxvQ0xMdjE0UTNURXdXWUNi?=
 =?utf-8?B?cGhYeWRHNCtBemZlYVVVa1pQclFJVXh4WllvRWY0WW1vN0NKWWNlN09lTkJP?=
 =?utf-8?B?ZlVJMnR2MHpuQXJjOGtRNm1DdVJjSTFUYVVER3BNbHI4TlFYdlQ0Rll2V0I3?=
 =?utf-8?B?Umlzd2FWeUR3VVdSSHV4VkwzS1dwRk5TQ2lZSnd2NGlCSHR3aGdSc2dveHhM?=
 =?utf-8?B?SjRWVDhZdGY5eVZ0OEYyUTBOdUhETG9hbSs3UWVtSFZ6dWFUL2ZSSkRMaHBn?=
 =?utf-8?B?eVhRN2RGVFMyVEtLdXJXMWFDaXRpdWNCcFByQ0xQQUlOWjJHQ1ZiL1I2WHlX?=
 =?utf-8?B?cWFIbTcvdDNxZTdiVGpmeGRTWnNJZ0Z4Wk5PeVBTY1Z1b0dFVHdqMm1SZWFj?=
 =?utf-8?B?VWQ2Z25oUTJZK2tIT3BFT3h0SEhNMVBRY3hDeGc3SEd1dFU3bFdZYmhDVTR0?=
 =?utf-8?B?SjZWaC93QVY5Y1pXT3k4K04yZkp3R083U3Fhbkg3SDlHeWNaYXJmV25yM2pG?=
 =?utf-8?B?elNSaGpLVWowQU5wTy93eEkybVk0cDd0dzZOUUc4UTBUOG5PREs1SnZBTWll?=
 =?utf-8?B?MHU4ZUY4T2JSaUtJRlM5R1NMWmNEOUhDcXZXc3FxNzI3eWRldURya1RORjQz?=
 =?utf-8?Q?yNPR4psus7wZIKyxstoyjb4fM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480d3c38-7d19-4760-f444-08ddb36cf3a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 22:17:48.1207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysdGfKa3NVKPWfrlLu8uyRSHcCq+AcX+xW8pR7CSmcpJoxzZwK5wzGWtLKQYhJDiqG/AoQNhiEfD4Rp5L3req8IWZWCAMOD6qdvZBAoe6D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKdW5lIDI0LCAyMDI1IDE6
MTUgUE0NClRvOiBEb25nLCBaaGFuanVuIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPjsgaW50ZWwt
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4u
Y2F2aXR0QGludGVsLmNvbT47IFN1bW1lcnMsIFN0dWFydCA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwu
Y29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2Nl0gZHJtL3hlL3VjOiBEaXNhYmxlIEd1QyBjb21t
dW5pY2F0aW9uIG9uIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uIGVycm9yLg0KPiANCj4gT24gMjQu
MDYuMjAyNSAwMzoxNywgWmhhbmp1biBEb25nIHdyb3RlOg0KPiA+IERpc2FibGUgR3VDIGNvbW11
bmljYXRpb24gb24gWGUgbWljcm8gY29udHJvbGxlciBoYXJkd2FyZSBpbml0aWFsaXphdGlvbg0K
PiA+IGVycm9yLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1
bi5kb25nQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25h
dGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNDkxNw0KPiA+IA0KPiA+IC0tLQ0KPiA+
IENjOiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gPiBD
YzogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiBDYzogSm9u
YXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IA0KPiA+IENoYW5n
ZSBsaXN0Og0KPiA+IHY2OiBTa2lwIGRpc2FibGUgY3Qgb24geGVfZ3VjX2VuYWJsZV9jb21tdW5p
Y2F0aW9uIGVycm9yDQo+ID4gdjU6IFNldCB3ZWRnZSBpcyBleGNlc3NpdmUgYWN0aW9uLCByZXZl
cnQgYmFjayB0byBkaXNhYmxlIGN0DQo+ID4gdjQ6IEZpeCB0eXBvIGFuZCBhZGQgbmV3IGxpbmUN
Cj4gPiB2MzogdjIgQ0kgcmUtcnVuDQo+ID4gdjI6IFJlbW92ZSB1bm5lY2Vzc2FyeSBqdW1wIHRv
IGVyci1vdXQNCj4gPiAgICAgRHJvcCBkaXNhYmxlIGN0LCBzd2l0Y2ggdG8gc2V0IHdlZGdlDQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyB8ICA1ICsrKysrDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuaCB8ICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3VjLmMgIHwgMTkgKysrKysrKysrKysrKystLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWMuYw0KPiA+IGluZGV4IDIwOWU1ZDUzYzI5MC4uOWQ3MTc1YjE2Y2M3IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYw0KPiA+IEBAIC0xMjMwLDYgKzEyMzAsMTEgQEAgaW50IHhlX2d1Y19lbmFi
bGVfY29tbXVuaWNhdGlvbihzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ID4gIAlyZXR1cm4gMDsNCj4g
PiAgfQ0KPiA+ICANCj4gDQo+IGVhY2ggbmV3IHB1YmxpYyBmdW5jdGlvbiBuZWVkcyB0byBoYXZl
IGEgcHJvcGVyIGtlcm5lbC1kb2MNCj4gDQo+ID4gK3ZvaWQgeGVfZ3VjX2Rpc2FibGVfY29tbXVu
aWNhdGlvbihzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ID4gK3sNCj4gPiArCXhlX2d1Y19jdF9kaXNh
YmxlKCZndWMtPmN0KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgaW50IHhlX2d1Y19zdXNwZW5kKHN0
cnVjdCB4ZV9ndWMgKmd1YykNCj4gPiAgew0KPiA+ICAJc3RydWN0IHhlX2d0ICpndCA9IGd1Y190
b19ndChndWMpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmgg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmgNCj4gPiBpbmRleCA1ODMzOGJlNDQ1NTguLjI4
NWMxOTkyOWY4YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmgN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmgNCj4gPiBAQCAtMzMsNiArMzMs
NyBAQCBpbnQgeGVfZ3VjX3Jlc2V0KHN0cnVjdCB4ZV9ndWMgKmd1Yyk7DQo+ID4gIGludCB4ZV9n
dWNfdXBsb2FkKHN0cnVjdCB4ZV9ndWMgKmd1Yyk7DQo+ID4gIGludCB4ZV9ndWNfbWluX2xvYWRf
Zm9yX2h3Y29uZmlnKHN0cnVjdCB4ZV9ndWMgKmd1Yyk7DQo+ID4gIGludCB4ZV9ndWNfZW5hYmxl
X2NvbW11bmljYXRpb24oc3RydWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiArdm9pZCB4ZV9ndWNfZGlz
YWJsZV9jb21tdW5pY2F0aW9uKHN0cnVjdCB4ZV9ndWMgKmd1Yyk7DQo+ID4gIGludCB4ZV9ndWNf
c3VzcGVuZChzdHJ1Y3QgeGVfZ3VjICpndWMpOw0KPiA+ICB2b2lkIHhlX2d1Y19ub3RpZnkoc3Ry
dWN0IHhlX2d1YyAqZ3VjKTsNCj4gPiAgaW50IHhlX2d1Y19hdXRoX2h1YyhzdHJ1Y3QgeGVfZ3Vj
ICpndWMsIHUzMiByc2FfYWRkcik7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV91Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjLmMNCj4gPiBpbmRleCAzYTg3NTFh
OGI5MmQuLmQ3NGJmYzdhODVkMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5jDQo+ID4gQEAgLTEz
LDYgKzEzLDcgQEANCj4gPiAgI2luY2x1ZGUgInhlX2d0X3ByaW50ay5oIg0KPiA+ICAjaW5jbHVk
ZSAieGVfZ3Rfc3Jpb3ZfdmYuaCINCj4gPiAgI2luY2x1ZGUgInhlX2d1Yy5oIg0KPiA+ICsjaW5j
bHVkZSAieGVfZ3VjX2N0LmgiDQo+ID4gICNpbmNsdWRlICJ4ZV9ndWNfcGMuaCINCj4gPiAgI2lu
Y2x1ZGUgInhlX2d1Y19lbmdpbmVfYWN0aXZpdHkuaCINCj4gPiAgI2luY2x1ZGUgInhlX2h1Yy5o
Ig0KPiA+IEBAIC0xNjEsMTUgKzE2MiwxOSBAQCBzdGF0aWMgaW50IHZmX3VjX2luaXRfaHcoc3Ry
dWN0IHhlX3VjICp1YykNCj4gPiAgDQo+ID4gIAllcnIgPSB4ZV9ndF9zcmlvdl92Zl9jb25uZWN0
KHVjX3RvX2d0KHVjKSk7DQo+ID4gIAlpZiAoZXJyKQ0KPiA+IC0JCXJldHVybiBlcnI7DQo+ID4g
KwkJZ290byBlcnJfb3V0Ow0KPiA+ICANCj4gPiAgCXVjLT5ndWMuc3VibWlzc2lvbl9zdGF0ZS5l
bmFibGVkID0gdHJ1ZTsNCj4gPiAgDQo+ID4gIAllcnIgPSB4ZV9ndF9yZWNvcmRfZGVmYXVsdF9s
cmNzKHVjX3RvX2d0KHVjKSk7DQo+ID4gIAlpZiAoZXJyKQ0KPiA+IC0JCXJldHVybiBlcnI7DQo+
ID4gKwkJZ290byBlcnJfb3V0Ow0KPiA+ICANCj4gPiAgCXJldHVybiAwOw0KPiA+ICsNCj4gPiAr
ZXJyX291dDoNCj4gPiArCXhlX2d1Y19kaXNhYmxlX2NvbW11bmljYXRpb24oJnVjLT5ndWMpOw0K
PiA+ICsJcmV0dXJuIGVycjsNCj4gPiAgfQ0KPiA+ICANCj4gPiAgLyoNCj4gPiBAQCAtMjAxLDE1
ICsyMDYsMTUgQEAgaW50IHhlX3VjX2luaXRfaHcoc3RydWN0IHhlX3VjICp1YykNCj4gPiAgDQo+
ID4gIAlyZXQgPSB4ZV9ndF9yZWNvcmRfZGVmYXVsdF9scmNzKHVjX3RvX2d0KHVjKSk7DQo+ID4g
IAlpZiAocmV0KQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwkJZ290byBlcnJfb3V0Ow0KPiA+
ICANCj4gPiAgCXJldCA9IHhlX2d1Y19wb3N0X2xvYWRfaW5pdCgmdWMtPmd1Yyk7DQo+ID4gIAlp
ZiAocmV0KQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwkJZ290byBlcnJfb3V0Ow0KPiA+ICAN
Cj4gPiAgCXJldCA9IHhlX2d1Y19wY19zdGFydCgmdWMtPmd1Yy5wYyk7DQo+ID4gIAlpZiAocmV0
KQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwkJZ290byBlcnJfb3V0Ow0KPiA+ICANCj4gPiAg
CXhlX2d1Y19lbmdpbmVfYWN0aXZpdHlfZW5hYmxlX3N0YXRzKCZ1Yy0+Z3VjKTsNCj4gPiAgDQo+
ID4gQEAgLTIyMSw2ICsyMjYsMTAgQEAgaW50IHhlX3VjX2luaXRfaHcoc3RydWN0IHhlX3VjICp1
YykNCj4gPiAgCXhlX2dzY19sb2FkX3N0YXJ0KCZ1Yy0+Z3NjKTsNCj4gPiAgDQo+ID4gIAlyZXR1
cm4gMDsNCj4gPiArDQo+ID4gK2Vycl9vdXQ6DQo+ID4gKwl4ZV9ndWNfZGlzYWJsZV9jb21tdW5p
Y2F0aW9uKCZ1Yy0+Z3VjKTsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPiAgDQo+ID4g
IGludCB4ZV91Y19maW5pX2h3KHN0cnVjdCB4ZV91YyAqdWMpDQo+IA0KPiB3aGF0IGFib3V0IGRv
aW5nIHNpbWlsYXIgY2xlYW51cCBpbiB4ZV9ndWNfbWluX2xvYWRfZm9yX2h3Y29uZmlnKCkgd2hl
cmUNCj4gd2UgYWxzbyBoYXZlIHVuYmFsYW5jZWQgeGVfZ3VjX2VuYWJsZV9jb21tdW5pY2F0aW9u
KCkgPw0KPiANCg0KSSBkb24ndCB0aGluayBpdCdzIG5lY2Vzc2FyeSB0aGVyZSwgYXMgeGVfZ3Vj
X2VuYWJsZV9jb21tdW5pY2F0aW9uIGlzIHRoZSBsYXN0IGZ1bmN0aW9uIHJ1biBpbg0KeGVfZ3Vj
X21pbl9sb2FkX2Zvcl9od2NvbmZpZy4NCklmIGl0IGZhaWxzLCB0aGVuIHRoZSBHdUMgQ1Qgd2Fz
IG5ldmVyIGVuYWJsZWQsIHNvIGl0IGRvZXNuJ3QgbmVlZCB0byBiZSBkaXNhYmxlZC4gIEFuZCBp
ZiBpdCBzdWNjZWVkcywNCnRoZW4gSSB0aGluayB0aGUgcmVzdCBvZiB0aGUgWGUgbWljcm8gY29u
dHJvbGxlciBoYXJkd2FyZSBpbml0aWFsaXphdGlvbiB3aWxsIGhhdmUgc3VjY2VlZGVkIGFzIHdl
bGwsDQptYWtpbmcgaXQgdW5uZWNlc3NhcnkgdG8gZGlzYWJsZSB0aGUgR3VDIENUIGFmdGVyd2Fy
ZHMgYXMgdGhhdCBjb21wb25lbnQgYXQgbGVhc3Qgc2hvdWxkIGJlDQpmdW5jdGlvbmluZyBwcm9w
ZXJseS4NClRob3VnaCwgbWF5YmUgd2UgbmVlZCBpdCBhZGRlZCB0byB2Zl9ndWNfbWluX2xvYWRf
Zm9yX2h3Y29uZmlnPw0KLUpvbmF0aGFuIENhdml0dA0K
