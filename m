Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F99D711C8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 23:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E3210EC09;
	Thu, 18 Dec 2025 23:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaOUfUlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2E910EC09
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 23:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766101020; x=1797637020;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=E3HZcAjGxHAH5O93FvwWFjk5a2T86aSBPyWxibNNo2w=;
 b=CaOUfUlqnq8AWq9hR+Y7iIfdyeuqWnWUznyHL9j8aFQheYFSenOX3goF
 JSZTRVkYKSBUwQTtl9Au4rQ0BQ4903oGc3yzGwYbvUK02yDNbsEQtHRSP
 tn6o9TivL1zOc1RRyEkBmDmTN/hfmQbMTs+z+dt2Bv/BL4U1oIFQdGw8h
 73o6ElPnVNrVvQpakXtaMdrpEdXWZlHeT7Wh3ZOiLKgQvJK46eTLhOjej
 d3nk501HU1HDki9KGHNdEw3jTioaRwAtW8NZ5PDya0gOGuXZRISYf48Gr
 sLUGnNBswatQC6gmp/ZHA+ORVL9olBVtusvPfLm9tN0Ftd4LgPdpu33he Q==;
X-CSE-ConnectionGUID: r/eOO351TkiprD64Gu5xDw==
X-CSE-MsgGUID: yyLyFw1TTl67afH5al+MkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67062773"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67062773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:36:59 -0800
X-CSE-ConnectionGUID: jA6t+hqYTYGy03uisLAvdA==
X-CSE-MsgGUID: i2mxezu/RXC9f/ww2sQVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="236129403"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:36:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:36:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 15:36:58 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:36:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdOiU8dIqV2H7mGZz4QwBImZ3huS5voiKfp+jszPjQuSkO104n8MjWv4HbVMCt1k4Q7wy5Yf2NE0XBc/KRRcetJ52pVEDk2kCDPivvc+jIr95zh3jRyzpvq/FmRauuWMJs1HNYIxbXkc4BpDLLdvEwy0iZ4USDcvXLoH/2Ly7h1VHWErOJz9WTOxYWrHDYStc4Z1h8cw2qcqXZiZzxy13aXZF1SMO49PhMPAaY7zyWA3XOViEHQ0NlvAE3UcRW+hi+NhMtF+xaSpPDy31cWNusDSImlb+CYP8YfJUAYA60oiVPUFrH7yDfXIwP51vWLDR+AwF9sEULrnFSN5y2xjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3HZcAjGxHAH5O93FvwWFjk5a2T86aSBPyWxibNNo2w=;
 b=nqUwsAOQ3OOqYlqF/AcISX7Rs+jSD2pi2iCN91GEIrCAoF2blkI9jlm0zFP4kCRhag3cilUaBo6SQu2WnJk2OdvHg1AJmcTOZ1xIYDGHAl0x18Fv6/6Qzc9at6lmz8BT0rV3FNFXWhvXGMj2XURHPfe5sYUfhtMM6vE0reNjUP0H0quHrWNq2fXmTmtmpJQQY7H29jt1/f9DhSPc2GHfjEzGBeKUqgeC40T4LdjdFHJtX+oxsyjWHHKZTwY3kagJLRmnSB5zPRHwdCh3pFt4D+I2DG1Xiny6vFanVMe6HIV7h8GyZ56SIxZuggqAB018OAxrHaMAtK+eEozZZTejIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH3PPF5AF05F6D9.namprd11.prod.outlook.com (2603:10b6:518:1::d24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 23:36:45 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 23:36:45 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Thread-Topic: [PATCH v2 1/3] drm/xe: Always kill exec queues in
 xe_guc_submit_pause_abort
Thread-Index: AQHccGeGbPvc38wGq06LP2efGXCrhbUoDYQA
Date: Thu, 18 Dec 2025 23:36:45 +0000
Message-ID: <be719a0fe2cd6649c02f2dfb61cf6f7276222381.camel@intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-2-matthew.brost@intel.com>
In-Reply-To: <20251218214418.4037401-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH3PPF5AF05F6D9:EE_
x-ms-office365-filtering-correlation-id: 12709f80-d99b-4594-94ab-08de3e8e4e42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?emp4SkhPZ05PS2dGcTdmekwvcURUbGJFeWoxNjIyYmV6U3Q2YkJPWlNnZTBs?=
 =?utf-8?B?SlAxMFk5dXJ5cEpZYXExenBXOE8zZyt6WEhmY1E3SVNqY01IenF2YTR6NE5W?=
 =?utf-8?B?TEMvUm4zZ1B1NEdHeUhtenlNbUc1dnlWOXhNVCtwbGdndmFXWlduVXllOXBP?=
 =?utf-8?B?eGZyVVpIQWdweTNTbmZHSElmNFRBQzdqamRRM3doUDF0ZFkwblRrNHNhSjY0?=
 =?utf-8?B?a2c3eVVQNisyMzdKOGpFSlZoNy95QnU1NSt1TUdqaFZoYktYN1g5MFk1Rmds?=
 =?utf-8?B?eGN2MW9pNFd2eHZNUU5XU25IS1hzSlhBQjg4TUtGNU5QOWoxUVRGc25EY3dF?=
 =?utf-8?B?WFI4QU5DR2JMYnhsYzdRdlZLNFJzN3Q1WG1MNVlGL3BYV0xLZmQyL1VLcUJp?=
 =?utf-8?B?MTZ1WkRuQVR2NlkxZzdTNkk1YlVOZU1zaG1wUXVKYnZWcm81RFZyMG05YXBR?=
 =?utf-8?B?MjM5MXRETzlPL0ZlaEhVSnlaNnZEcTJvZ2JmMHNRTDRYamRSTjh1a3Z6Ny8z?=
 =?utf-8?B?V01INUwwR0kzcnpIU3pNUGtYb0JiNG51M04zNTJ5MVBwajhjL0g3REVoSThQ?=
 =?utf-8?B?dmhsVi8veUhmS3FnY0l4SFlTUXNaQVQyMURpeEJLcFREaEdQemVvcmYvbXI1?=
 =?utf-8?B?TjhZWDZVNTFIOFNFSlBPeWVLVVZEbDdGYndRWnBuRkNIWHh1anB0ekN3ZjJv?=
 =?utf-8?B?clowdTBzMUh5S0UxcmNkWXFvY2RjaGdOY0tGMkRVd0hTVEVXYnVYOFR4bFpU?=
 =?utf-8?B?TWdHblVob0tVdmdUMTNYa1JEOWZhTEFVVGcrQzhTNUdxVHVPcHJBak1JVXZr?=
 =?utf-8?B?OHhIcXpwMm8vZitORHExUzBuNnVIalJzMStETTAzVFcxcE93cUhXMGlwc3Yr?=
 =?utf-8?B?NVAveWVKVksyMGJwUTNwODV2cHZPaHI1UVRVTmx3R2cybmVuR3FZQnBkeDhn?=
 =?utf-8?B?VnVBTnh2RXZHMlhYdGZGSzVQbk4zbnNTOFMvY0YzMjlqWTZhWkZpdVJHQUpE?=
 =?utf-8?B?dkZ1bmdYZlFtSVpKbm9ZSEd0TkNnc1YrSTBSRm1XWVR0bWp5M01TR1JaWk01?=
 =?utf-8?B?L0dlYTdpQk12WWhNMkM2U3VpbHBkc0d0ekdaT2VpK0twcG5WcFFYcVB6YTlQ?=
 =?utf-8?B?aEcwR3dTYlI3Q28wZ0pjdWh2SkF4TWJVcnBaTENmejUva0tLTTVGdU9iR3Nv?=
 =?utf-8?B?allYZ0x3ZDVlckJ1R1h3azdFMUZ2dDF3dXByekJSRzVXUjJqZjR1TFQ1RkE2?=
 =?utf-8?B?RGpkSFhRMWVJempTV09TTGNjNTIwSmNsK3VSTFNURWVzU0F2V0Z0b1Z0dWFo?=
 =?utf-8?B?MEQ3aC9BdHNRbXVEVUVVdTZsS0NPc0V0QWdUQURUZVNSb1NaeTRDclJ3a0U4?=
 =?utf-8?B?MW4rOFBRM21hMUVJRERHRDVBS0FLdnV2KzU1UjE2VXEzM1lSQWZQUjlrOUdm?=
 =?utf-8?B?S2RBdTd5UGdscm1WM1A5U0hlMmVZRFJ0cXRRMHEra3ZrOS9ZcTlmc09OOWpB?=
 =?utf-8?B?ZGt1ZHlkblhqQUpoeGRKV3U1NmJrNDFibzRleWhKVy9WTDhoSldGZ3NGRkV0?=
 =?utf-8?B?NFA5ZkdZdWJ1ZHJBWENxQldmcmRJTXl1ZERqZTJ2bE9TVjRBSGFEdkxEVmgw?=
 =?utf-8?B?Y3I0ZERjVWMwV01YNEF6UDNYNy9WVks4cVBoM2d3R3hoQk1EeE9hL1lDQTRi?=
 =?utf-8?B?bkpxSU8wNnhSNVdONjJ0ZENWRU53Tk9ZdTYxbFdQR2pUZy94SUFRTTFCMjZV?=
 =?utf-8?B?L2lueUMvY3JSa3dVWFYva1p0aDZPY05adUVHUTBvRWVBUjNtWUpDTUVtbk5l?=
 =?utf-8?B?Y1RsNTJDRDFYWnNHSytuazR4V1pYcnBtQ1NCbUdnSVI3cXpSaUJOYnkxRnJ4?=
 =?utf-8?B?NTExRjZQNGtQQmM1MVRzcnhCWVdUajRkTFBSbm1wYkhQaCt1bWp3enRiNUFp?=
 =?utf-8?B?K2N5eUloY0QwUi9ZWGcreEtEWE5RamtYeXBiZ0hMZEJHV0F2Wnp1alp5MGpt?=
 =?utf-8?B?bVdhRDhJazYxMzlaSWtaeEFkaGpncjY1MlVCeDBuNUpRT2FXN2JWOU5sNWph?=
 =?utf-8?Q?+WV/Qw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUhhNEV4Y0FtcFZjemsyeFFUTHJWYTY0RnRMSlJVSlRuOW5zbEFlelZ1aTBm?=
 =?utf-8?B?L3hCdEFFT1Qvd05yeTFaYk5IZHVaY29tRDl6SFZObzdIZWpYSTE4bUpEK0Vw?=
 =?utf-8?B?aE1oUmlBRWZiNTczc2FxcEdlK3Z3YURKZVRSeDlQL01jTjIvSXZTNkhxRzZq?=
 =?utf-8?B?U3FRUTNBLzkzVU9uRVFJV281UThjWG93TDZBK0JzY0NWa3pJN1hMTDBKNyta?=
 =?utf-8?B?azl3Z3ByYmRjTkhzQWNydXVabWxBOE9LV2cxQ2dnSHBCTHlCcVhqdEpFNkNP?=
 =?utf-8?B?M2xTQ2JsWGRuSFQ5b0hDQmhvMTZJcVJmRS96aWwzTTd2UTRpRkhUV2syMmJX?=
 =?utf-8?B?UU1lZ1ROUlRVT3VzL2dENys4VFQxTG9IY0dUVzFvd0huRW5mUnBQOEtETU9y?=
 =?utf-8?B?SlgvRUhuaVBsWTdVVXdxY2JkMDBCQ1ZLdGVjaEptTzBldlJNdWhqblFXYWt3?=
 =?utf-8?B?VzFlbC9kVE1VcC9sQWJWb2ZzWUNTMXV1bjJIRUpWNU4weGw0MUhDRnZ6aGZL?=
 =?utf-8?B?Y05vTzFNMXN4bDJWb2IyYUVxSlprM2hEYmF0Q1VqRVdtelhyOFZFdlc3M3lz?=
 =?utf-8?B?cUhNNzJqNmREeG9HL1U1VEVxQ3dUWlplMFJ4em5oRDdQTzJEZlZScVFVOXh4?=
 =?utf-8?B?Qlo4d3NtRktKVUhleE1CQjdPSk5VYmZjL0VNS1Bab2xQS090VlRCUzNqQkZz?=
 =?utf-8?B?RCtTZFFNVU1SZ2tQM3B6MTZjSnNmNHI4TjljV29McUNoSVIwWGNNaWFjS0dY?=
 =?utf-8?B?WUsvdHlSWXYySk9Kb2pPb1dqdTA5OUlzU25uWGFPMk1xK0Q1eGxJTWYvN2FR?=
 =?utf-8?B?dHRZWDRTcnFJei9XMjhRMEIxWFNrTG1qaUpuamFRVEgvVzB3NGFncTVYSkdt?=
 =?utf-8?B?RlE0YTVObUcwZHQ0SXlKQkJqNVV4SjIzamtMeWxDbWZRRVVjZWpiKzUrUkpW?=
 =?utf-8?B?aEY1d2lQL3JqcXdmQXI0cTNobzNsUFlLemViQWRDOFlkZ3Z2czdSZHBEc0ts?=
 =?utf-8?B?TEp2YzJTY1g3K0FMQzJsMERXdmFQUkxKcjdnMkV1c09zRU5OSjBGdzRvUERF?=
 =?utf-8?B?bmlmdG1zMkhRQnFSMUtVS2dyUFE2MkpGcHU3eklNM0x2VzRnN1FndDZlWnZz?=
 =?utf-8?B?VVh3ZWFWeUY5VWZDNjhBQ2M2V09WUmJpYVBMKytaSlN1Q2U1N1ZmU1lwNEtk?=
 =?utf-8?B?MWNhczBYbDhGQ3dzeEFhSlNKUkp5bkE1R3oxZERpSDRjU2hwTFNBRTJWSU51?=
 =?utf-8?B?RG1GMUVCYkoyKzd6N1E0NCtvVjhCenAyMkRGSjBva1hvRkZXbXFaT1V2dWI5?=
 =?utf-8?B?N2NCTTdKWHRoQmdZQ1RmaVdKSDg3WjBOYUMvd0NqdXRXcENOeUhGS3RSdnVJ?=
 =?utf-8?B?cnpRZExPOHIzM255YkdzeGMwWndGWmhrVFR5eU9ydVp1TytyV0tOT0xiMHYr?=
 =?utf-8?B?YitOeTRISms1N204TWsvYi9vMWJ3Y2pLclJyL2FUTitoZnp6Y1IybmphWlJo?=
 =?utf-8?B?UEQ5TTdZRXRuaGpSYUUxcVRicTNxMVo4UWxONGhVRzJmbjZoQllsbTdqbUNM?=
 =?utf-8?B?MmgyQ0ZWWkkrVDEySGRKekg3andHTkVVemUxMkpPaDVic3ljUUJOTlVWcXRz?=
 =?utf-8?B?UDlXc1JvYVY1eHdpQTBrUGY1UHBLQjFKNHhqK3FJalVGUzM3dktKU1RxSlBj?=
 =?utf-8?B?dmMvdHVpYVdFL1U2am1XQnJqa3RHMzBuNTRseEh5NVVLQlJhYldWR0JVb2Zz?=
 =?utf-8?B?bUxZTEpwRlVZVjJXUVFIalIzdlBhU0dwUDJ6djR6alM4eHJ4VmhHOUJtKzZD?=
 =?utf-8?B?S2p4VzdqRkRjYk83K2tjb3ZDTzBlL1ZCOHJlck90U0NNclF6WG8wL01UWFdP?=
 =?utf-8?B?N3h6dVRxM3VQSUkveDJjVTdTdTdYMG5HOVBKbVVLTDBhZXJuamRFdUo0Z1Fn?=
 =?utf-8?B?dWhxRXhKM3JCVGpjdVc0TysrT0E5c0xDMVpmclBZcjJFc29ucVFtRnpCUWxF?=
 =?utf-8?B?OWV5amxvZDgvczhpQUJkRFpEcHJtbWFpVk4rL0R3M00rV2FTOHVtOUpWcm1H?=
 =?utf-8?B?aFBvWVZLOGRQUGcwRVQyRXl6dlViT0VtYWU1Zlh2cjdWb0dBLzhLUnNsZXFV?=
 =?utf-8?B?VWhCVnJWNWlRd3ZFK003Q2wyTWYvcUhndGkwWEswRnNLUXRqUGZ6UUVBc04x?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4686757A82A3C04F89C554E10896F4A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12709f80-d99b-4594-94ab-08de3e8e4e42
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 23:36:45.1558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34J8KRxRxrjcoTlDOooQDh0+y8fiZFCXRubYXY49l3gqdsL/uVQCGHDbHj2PG+f5huHsKbcczOsciD0AY8GP1n1e7nngEy27CFYCYesKj5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5AF05F6D9
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDEzOjQ0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiB4ZV9ndWNfc3VibWl0X3BhdXNlX2Fib3J0IGlzIGludGVuZGVkIHRvIGJlIGNhbGxlZCBhZnRl
ciBzb21ldGhpbmcNCj4gZGlzYXN0cm91cyBvY2N1cnMgKGUuZy4sIFZGIG1pZ3JhdGlvbiBmYWls
cywgZGV2aWNlIHdlZGdpbmcsIG9yDQoNCkkgZG9uJ3Qga25vdyBpZiBJJ2QgcXVhbGlmeSBkcml2
ZXIgdW5sb2FkIGFzIGRpc2FzdHJvdXMsIGJ1dCBvdGhlcndpc2UNCmFncmVlIDopDQoNClJldmll
d2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+IGRy
aXZlcg0KPiB1bmxvYWQpIGFuZCBzaG91bGQgaW1tZWRpYXRlbHkgdHJpZ2dlciB0aGUgdGVhcmRv
d24gb2YgcmVtYWluaW5nDQo+IHN1Ym1pc3Npb24gc3RhdGUuIFdpdGggdGhhdCwga2lsbCBhbnkg
cmVtYWluaW5nIHF1ZXVlcyBpbiB0aGlzDQo+IGZ1bmN0aW9uLg0KPiANCj4gRml4ZXM6IDdjNGI3
ZTM0YzgzYiAoImRybS94ZS92ZjogQWJvcnQgVkYgcG9zdCBtaWdyYXRpb24gcmVjb3Zlcnkgb24N
Cj4gZmFpbHVyZSIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYt
Ynk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAzICstLQ0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19zdWJtaXQuYw0KPiBpbmRleCA0M2ZkMjA2OWY5YjIuLjA3MWNiZmVjMjQwMSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IEBAIC0yODkwLDggKzI4OTAsNyBA
QCB2b2lkIHhlX2d1Y19zdWJtaXRfcGF1c2VfYWJvcnQoc3RydWN0IHhlX2d1Yw0KPiAqZ3VjKQ0K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb250aW51
ZTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zY2hlZF9zdWJt
aXNzaW9uX3N0YXJ0KHNjaGVkKTsNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
IChleGVjX3F1ZXVlX2tpbGxlZF9vcl9iYW5uZWRfb3Jfd2VkZ2VkKHEpKQ0KPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d1Y19leGVjX3F1ZXVlX3Ry
aWdnZXJfY2xlYW51cChxKTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd1Y19l
eGVjX3F1ZXVlX2tpbGwocSk7DQo+IMKgwqDCoMKgwqDCoMKgwqB9DQo+IMKgwqDCoMKgwqDCoMKg
wqBtdXRleF91bmxvY2soJmd1Yy0+c3VibWlzc2lvbl9zdGF0ZS5sb2NrKTsNCj4gwqB9DQoNCg==
