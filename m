Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB732CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 17:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BF910E837;
	Thu,  2 Oct 2025 17:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miXYaV/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EED610E83C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 17:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759427350; x=1790963350;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=SX1sok0p1oTP4j4Fbp1XGgJshXch4cJMtcUWM1/mXmY=;
 b=miXYaV/9VCndszMy1CCCCEsZTQ7iiDhcFVzvY/60w6zfjZ0iUjbZa2Je
 Me00/dMVd1fuKQHtT3Sw90R8+lPF8d6h92qyQs39loSLDbbnq9wLHrP91
 ClDMcsDIePOw9b2/mlK7kkphrFsJSRxBMCQKwNMoBBpmfakVZXfVo1okE
 EZ+TmrHtz2CbUiD+5Ac8oG/OqzcnRLnBKAbled2NcIgOgI+4Z+uA9lO5S
 DjaoQXPzzi2Giihb3xFd5+kHeghnLtS1y6mSBy4cJ0xx4WDuugw3XSede
 S75QLwCFjuO2RFhf2OPGZusTpb6Ess4tORecuEM8oopePrcr0WgU8JQrh g==;
X-CSE-ConnectionGUID: 75XcgcXwRHe9SD1VCGiO2Q==
X-CSE-MsgGUID: zT5bzRO+QzqY89h+WRf21w==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60927590"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="60927590"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:49:10 -0700
X-CSE-ConnectionGUID: sS21jMi9TkGJCzmOT3iwWQ==
X-CSE-MsgGUID: kg94aSQ9RDGG6CbRp3kjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179510990"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:49:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 10:49:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 10:49:09 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 10:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8QZM1cKBT3ORfJeDhxUBEU++gH11UHsFz7xLVY0ofArYXuTOfblb3UyNvbHsLBoRlQ6Zj/86ykNLKNzCAJBU72FMP76t9j/Os2PIjVHWF4kmZdT5utDjxjKBRk+gaHO6lt2GjoZe5ZBuf7Dk+OO4950fPkju1+G4YnsyQBmK7la7SiHym9xnp1TEnL+B5jQiOkeuqgZ5UvVyA+S+8z4vLbNDdUlqsoi++Yt6IyYOPcJE/qgKm44YVDg4hXn1YVD6IavijAHKxI3csL3qbtAvssKr+yTYutoT/qOV8VsKucuYIOYuqquGbcQ234Gq1x1lY8ekbDX0ePs8Dsl7rZbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edW960rdk4GARm4eShvEFaE/ROHnCRyZOEjNAI1hrmY=;
 b=r1M8l/BgZS48ndtbC8kTFLoJp/QHl/kkKGDkti9IJcdwH4NIvxyxI20hhlChRglLqUyO3Jlf4QVIBTdbE9/oPUKLCZXdzccDChaKTx8vOkTsIAg2NBY4ies0bL3JCOLma0P3WYkvyN30QNf77AHwmZSiNhZCZVsK3f5rINBf8zTuawp5oCTLAEvC1WPmwHHVelpsz56pQMjth3Zz+IeqWn23m1SdCRIDcqgCu8QWIRxLqCS2MVQ2IUSObQnOM73mCBGWvVr81VF29BEMKaDXA3D3UzjVopESd6+DKtVCShs+7Z1bdLuGCUOg5oxdJKYDRG1uoHgJ/HNGHc2s0KYUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 17:49:06 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 17:49:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-40-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-40-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 15/23] drm/xe: Handle Wa_22010954014 and Wa_14022085890
 as device workarounds
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 2 Oct 2025 14:49:01 -0300
Message-ID: <175942734100.1952.1895856154466024278@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 4566a115-f32a-4b28-381e-08de01dbfb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGlaMnVMQWN1Y1Vxd3p6MnRUUU8rbldtL1RYdnhDSmNqbkhPWk5IdDcyYzd1?=
 =?utf-8?B?SVQxQUMzTERucGh0WkVVMHhhbE53UTlXbFZTYXJIWStoUDhVNVBaaXlzS0Jn?=
 =?utf-8?B?T05lK0UyWEJsa0REMTBDQVY1OTdmeUZkNnlWWURxdVZEclVXcUl1TlBONmti?=
 =?utf-8?B?L0xwN1VhZFRTMGo5WWs1RXJ4WG44OFBySTdqbGx1Y2t4L3hMOUM4QUJKa0hO?=
 =?utf-8?B?QjBnQ1hWdEpVbGlUdWJwVFpjOHkxL0pTUFdSTzh2NW1Ha0JQcGRicEJpTi9S?=
 =?utf-8?B?R241MDk2bVAvbEtPaWEyM0VhNVkyTUx0V1pWdU9oaEVTMEhmZUdRU2hDR0Nx?=
 =?utf-8?B?SE1UbVdNNnk4dllZaWN5Q1BiQzM1K3BiN09mRFdrbjY0UXVPdXNydHRSUDBz?=
 =?utf-8?B?ckxiRTlzV1VFSkljNktaODRrazNYdjVLSVBDT3pMSWVlWUU3S2lQYkFCc2p5?=
 =?utf-8?B?R2pYSjg3YVgxdHYxckdVeXM3TlFzUWFtVDZ6eXBFT2xHVFJWU0tBWVdDRlhu?=
 =?utf-8?B?Ky81WVJjUC82R0Q3VFI2T2dPY2xZcjMyT0QzZm14WFRGRWxkNkMySEZveWND?=
 =?utf-8?B?bHYzcWFaN2tIb2dxS2RFRXJ2bXdSMlc1dE5iZ1AyN2ZmNDFDYnNxanMzZjQ4?=
 =?utf-8?B?RnhVdHV1VUlUN2RMWUxqVlJNVkpNbGtkNXpaNHlzL2NYSjhhVmNSWEo3Y3Nn?=
 =?utf-8?B?azVmREU0WVg1YmkrSGhzYXJ1MWs4WEhnU0dTMm52RUNBOU1oR0NWejQwbjY2?=
 =?utf-8?B?SUJqeGtwbDhWZW5zbTdxNTRUTnVMN0pZSDVrSEdCeVpsOG5CZDh2b1NXOW1G?=
 =?utf-8?B?OUhobldWQVVBOVNsQXB0NysrZFVZbkduVzFwYWJ2RU95SjJzMHRrdk5UaVpa?=
 =?utf-8?B?d0x5SFB3Y0ZVSlVKZGlZMGZtMElSK0VyUUl6UnFJNEtudjkrZFh4Qk9hQjZF?=
 =?utf-8?B?Q1U4emcrN2E0cWRjR1h4NTdQTXdNcU9WVnhNZEdvRU1oWE9UVklHY0I5OWVq?=
 =?utf-8?B?bXl5bnhnT1Faby9FS0FTcWtuSklSNnFMT3FYWU1jcEhrcVRvek9yZnB3eWZr?=
 =?utf-8?B?ZWQ5UGtBdStLSmt5MVdwWkxkUmdmWlB5eHhSVFhyZVFybVlmcEhPYXB3RWhJ?=
 =?utf-8?B?OE5VemduTUhFUFNBZ2sxV0hBT2dnYlpadnNuRU9kcm1jZ2VvUSswRmVsWDN6?=
 =?utf-8?B?RlY0dUEwM3lsWElnZTJyY3ZXN1hhRDVRMGlsMVRoZUtqNCtVOUN0ZG5JcWtk?=
 =?utf-8?B?VU5vTkt2aHR2Y2g2TU8xSTE5clN5WjNuc2Zpc1RLWHdERnlBZ2lDQjVZanEx?=
 =?utf-8?B?YWsvbDQvbUJLS1BwUlh1YlVUaEMvd09MSStnTU1mVTdRblQzMnQxZE9aZnBE?=
 =?utf-8?B?eGkzblpSQlJlWGhHM2hQeHZwRCswUWpYQzRlN3hjdURTZklmbEY0dEZUTHJO?=
 =?utf-8?B?d2czbmUya2lLUWRNdXVSNkIrWGppNXd4MFk4Um5nY0ZNZVJFRUswakVwa012?=
 =?utf-8?B?TTB2UzB2QjZuVUE3UDJ1YllSOUUwdklDcHk0bndDVVIwYXRCcE5sNExjQnVr?=
 =?utf-8?B?cHJYYmJvaE1MMXo5dEg5ZUo0cVRYTDNrYzNzb1NpOU1zMnBzWno2cmw5RC93?=
 =?utf-8?B?WEZKZG5ZUzV1dTl1U3NCODlPUnM5TE5VV1o2cVVFdzdhSTBablNkdHRkL3Aw?=
 =?utf-8?B?akZTQStjek9HTXhXTDIzd2R2U3RNZGhnOG9TRkdLdCtqUlkxWFpIelJSWjRt?=
 =?utf-8?B?MVhBS0IzWUU0M3lsQnpFNGUxc3lERGdzOHVvcnFJOGRIdmdOV0xSOFNSV3Nv?=
 =?utf-8?B?d3NjUDUxblpUMk94ZDhYVm55TWs1U1lpNHI5cFVkaVE1ME1ISnhSM2t1ZDZa?=
 =?utf-8?B?MkZMUTBoSmk0YTdmNGZ6TzNsdkFUQVVqTGQ0Y1ExblRKMGhLSjJLYlNKUytu?=
 =?utf-8?Q?iU+o0+AD/KXDc4xLY1PJ7dvrzinvL9oH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJDLzMzT2FBYXI1RE5oL3QvMnNHNWVJZEEyZlBQWjZXUTI3MlEydzh5MmtP?=
 =?utf-8?B?YnpxN0RsUGx4Z09jQTZUUVpkWndlM3JqK1JFTmdlMkVFNFdWcEJVVHZCNjlW?=
 =?utf-8?B?bEU3YUlSK3pueDcwV2U5dGp4YXpwcFBjUzVtaDRGWnFDMENmRHlyaWhIVHVu?=
 =?utf-8?B?MlpMTG1KQVJKTmJaVy9OVzR1SjRja250OXJLdVQ2eFRINmpuZjVoMEQ1RWRz?=
 =?utf-8?B?Q2l1OHkrdjFEM3lrLzkzNHc1MlM2S2Rmd2NBR2VCdGhYblU5bmdGY0JvMVJB?=
 =?utf-8?B?ZmRzbGIyc0dZT1pkYlRKNmpRbkZYdlFIWnI1TDlDZ0s5WUtCV1JKTDNObWsy?=
 =?utf-8?B?M0svVFYvNW53ZTYrQ2k2UmFZSGNsakVJZzQrdjNFa0VNdGMyZ3ZZODROQ3dw?=
 =?utf-8?B?RVkxQVBEMzJEUHUwTUU4eDdjajFBQzEvV2VmNGUreUFTZDJ0SDczMXV2SUMz?=
 =?utf-8?B?NlU4dTBrNmVnWlFod2R4U0NwQVdHMW5BZzRLNkNPNncyQjdCM0Y1VjUyeFFR?=
 =?utf-8?B?U2Z2QkVIeHhlbVBCdm5Eei8raElsd25TeWZ6cThxWkF3RG95YW1rRGllZFVT?=
 =?utf-8?B?a05tM2tjV0pkUmJvcXlnV2llcWFCcnBVZTVYU2dPbmRYb1ZucFp0RERhbEdI?=
 =?utf-8?B?YXl0Z2VrYzFWeU0yRm51NWQrS1cxWGoxcW5ZajlRdm5CWnViV3JwRFE4ZllC?=
 =?utf-8?B?Zk84VXR3NGpJOHQ4M0RTY1N0Nm1BOEk4NUUxanNEdnpCRmNjeUVURGpwa1NT?=
 =?utf-8?B?L09WVkMrTTZLZWlzSlZkV2RRejkyK2l4RzQwU1lMVk12dy9vbXk0ZHAwaW4w?=
 =?utf-8?B?SVo4SU9GWFZtQkdzWUxwTjhqeFArYnQ5QmwzdDNBTHlXWitlS3hBUm5RUmtm?=
 =?utf-8?B?d3dEcHJaN2ZQUjJmOWFnNVl3SGx6K3pscE5BajQ0QlZOckZjMVpzck12U0lX?=
 =?utf-8?B?M2IzSzdNNkJ0TktRNTQwVmFlMUhYV1FGbDNJbUY0QThlaE90djJ2eDJ5TUZZ?=
 =?utf-8?B?QTM2ZFpIOGVDZjdiSTd3cFloUXdSR0FvajdmdFFadDBLSEhYVE1nYXZiUEpK?=
 =?utf-8?B?YWVrNGUrd2o2VjZqenB0SWcrcmlrRGZsUTVHUWFkZ1JjQmMvOUg4bFR5MWNV?=
 =?utf-8?B?YXpEWmx0ZGpLUmh3UWdrazFFQk5DQjJXZERhRUoyM2t0VWRQdlJJcmtCaU5Q?=
 =?utf-8?B?VnlGZ0tPTXZoK1F4Yno4OGFQU21xQUl5SDVja1hiL05ZYTdEN3FBR2NTMHM4?=
 =?utf-8?B?c1ZTVmlkaUVkRXYxSzNaQzIwaDlHbDhQOFc0OWdKbjhQd2EybVhGZVJjYkFr?=
 =?utf-8?B?d096bGpoRHc3UmFZTDA1U1dYRE9aVTM5NGxoQkplVk9DcGJGRXd2YUJ2dHlB?=
 =?utf-8?B?blR5dGpYRmpiMTBSS0g0bEFzNWNNQmFoSmtzL09hR1hHYjVSZUwyNHprLzhz?=
 =?utf-8?B?c1JvYXNSSk82OGtaQkhiU2FPSTQ3dGpsdmx4MTFyZ3dHQ2luWFY1SGMzQXlK?=
 =?utf-8?B?YUpKWmJFMitmUHhDS0RrQWJHdFozZEw5NTFKbEJ3dFFBOThvMXBwc3pEdHFQ?=
 =?utf-8?B?RlRZVy85UUtvZks2MEdhUHJLRldBOHlaYmVSM2U4cTI5ZzJ0RnFvTitBOXNE?=
 =?utf-8?B?M09XYkoyRzRxdXlza2FzZys2UGk5OU9keHZ0bkhnU29zNjJXN0hwZ0lRWHhT?=
 =?utf-8?B?UVZMMk90MnlFRE81VDNQNjdSdHpWQzhKaWpWd0tXMnF5UUVRWnllWHQ3NDJS?=
 =?utf-8?B?MW93OFYxbXJNcEl4eHpqZ1F4RXZCbFFNMCtyQlNkL1RMNDI5RmpFK0J5NkJC?=
 =?utf-8?B?MmJIcHJkdEJ0MlYrWGFPNmJrTklnMi9VbWwvM3YzbUNPMkFuYUhYcXpTSW9s?=
 =?utf-8?B?eFNmOXZONlFXQkc3N0NLVTdYcUhmMTViaVhLbXU0aGhHQ2lZbE1FRHdLcE5m?=
 =?utf-8?B?UWpJbHBmS3h6NGJiWG9GOEVWcGM4RFVGQVgrUTFkaStJMUpYelZqMUZJbEkv?=
 =?utf-8?B?dVlkSFg4RFAwbHl1bjdMRTA0QmtJSGorN29JZFF4enhtcWRmTXJ1TU1zVERi?=
 =?utf-8?B?MXF4dnlQZ1RPM0tPMEhDUmgrMlhhOVFLQUFNM0w4YkJQODJxVE9yNlhBOFFQ?=
 =?utf-8?B?QjQzTmVKVXQ5T3JyMVkzOUN0OGJZREd4OWlPc0ZpWUJxeDNlZjZmVmp4bllm?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4566a115-f32a-4b28-381e-08de01dbfb1a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 17:49:05.7519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjT/jqnZXVWjtOPkHag6S3aZB2I8WjHPRrowRvDhP9DwBWwrt6aXhdeSwqfiDBY+NXlf3gpzbTLeBY7K/4J4nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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

Quoting Matt Roper (2025-09-30 19:56:32-03:00)
>When Wa_22010954014 and Wa_14022085890 were first implemented, we didn't
>have a device workaround infrastructure so we hacked them into the GT
>workaround list.  Now that we have proper device workaround support,
>move them to the proper place.  Note that Wa_14022085890 specifically
>applies to BMG-G21 platforms, so this requires defining a BMG
>subplatform to capture the correct subset of device IDs.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_device_wa_oob.rules | 2 ++
> drivers/gpu/drm/xe/xe_guc_pc.c            | 3 ++-
> drivers/gpu/drm/xe/xe_pci.c               | 6 ++++++
> drivers/gpu/drm/xe/xe_platform_types.h    | 1 +
> drivers/gpu/drm/xe/xe_wa.c                | 2 +-
> drivers/gpu/drm/xe/xe_wa_oob.rules        | 5 -----
> include/drm/intel/pciids.h                | 7 +++++--
> 7 files changed, 17 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/x=
e/xe_device_wa_oob.rules
>index 3cc93f0e77f8..55ba01bc8f38 100644
>--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>@@ -1,3 +1,5 @@
>+22010954014        PLATFORM(DG2)
> 15015404425     PLATFORM(LUNARLAKE)
>                 PLATFORM(PANTHERLAKE)
> 22019338487_display        PLATFORM(LUNARLAKE)
>+14022085890        SUBPLATFORM(BATTLEMAGE, G21)
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc=
.c
>index 3c0feb50a1e2..ff22235857f8 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -14,6 +14,7 @@
>=20
> #include <drm/drm_managed.h>
> #include <drm/drm_print.h>
>+#include <generated/xe_device_wa_oob.h>
> #include <generated/xe_wa_oob.h>
>=20
> #include "abi/guc_actions_slpc_abi.h"
>@@ -886,7 +887,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>         if (pc_get_min_freq(pc) > pc->rp0_freq)
>                 ret =3D pc_set_min_freq(pc, pc->rp0_freq);
>=20
>-        if (XE_GT_WA(tile->primary_gt, 14022085890))
>+        if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
>                 ret =3D pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_=
freq(pc)));
>=20
> out:
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 13e8d379a1cd..86e6dd751b1c 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -334,6 +334,8 @@ static const struct xe_device_desc lnl_desc =3D {
>         .vm_max_level =3D 4,
> };
>=20
>+static const u16 bmg_g21_ids[] =3D { INTEL_BMG_G21_IDS(NOP), 0 };
>+
> static const struct xe_device_desc bmg_desc =3D {
>         DGFX_FEATURES,
>         PLATFORM(BATTLEMAGE),
>@@ -348,6 +350,10 @@ static const struct xe_device_desc bmg_desc =3D {
>         .has_sriov =3D true,
>         .max_gt_per_tile =3D 2,
>         .needs_scratch =3D true,
>+        .subplatforms =3D (const struct xe_subplatform_desc[]) {
>+                { XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
>+                { }
>+        },
>         .va_bits =3D 48,
>         .vm_max_level =3D 4,
> };
>diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/x=
e_platform_types.h
>index d08574c4cdb8..3e332214c7bb 100644
>--- a/drivers/gpu/drm/xe/xe_platform_types.h
>+++ b/drivers/gpu/drm/xe/xe_platform_types.h
>@@ -34,6 +34,7 @@ enum xe_subplatform {
>         XE_SUBPLATFORM_DG2_G10,
>         XE_SUBPLATFORM_DG2_G11,
>         XE_SUBPLATFORM_DG2_G12,
>+        XE_SUBPLATFORM_BATTLEMAGE_G21,
> };
>=20
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index c60159a13001..aa1b69f48f6f 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -1138,6 +1138,6 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *ti=
le)
>         if (IS_SRIOV_VF(tile->xe))
>                 return;
>=20
>-        if (XE_GT_WA(tile->primary_gt, 22010954014))
>+        if (XE_DEVICE_WA(tile->xe, 22010954014))
>                 xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_=
DIS);
> }
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index eb761d30e066..113a62f1b541 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -14,7 +14,6 @@
> 14016763929        SUBPLATFORM(DG2, G10)
>                 SUBPLATFORM(DG2, G12)
> 16017236439        PLATFORM(PVC)
>-22010954014        PLATFORM(DG2)
> 14019821291        MEDIA_VERSION_RANGE(1300, 2000)
> 14015076503        MEDIA_VERSION(1300)
> 16020292621        GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>@@ -74,9 +73,5 @@
> 16023683509        MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>                 MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_matc=
h_psmi_enabled)
>=20
>-# SoC workaround - currently applies to all platforms with the following
>-# primary GT GMDID
>-14022085890        GRAPHICS_VERSION(2001)
>-
> 15015404425_disable        PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> 16026007364    MEDIA_VERSION(3000)
>diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>index 69d4ae92d822..452c1de606ff 100644
>--- a/include/drm/intel/pciids.h
>+++ b/include/drm/intel/pciids.h
>@@ -849,7 +849,7 @@
>         MACRO__(0x64B0, ## __VA_ARGS__)
>=20
> /* BMG */
>-#define INTEL_BMG_IDS(MACRO__, ...) \
>+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
>         MACRO__(0xE202, ## __VA_ARGS__), \
>         MACRO__(0xE209, ## __VA_ARGS__), \
>         MACRO__(0xE20B, ## __VA_ARGS__), \
>@@ -858,7 +858,10 @@
>         MACRO__(0xE210, ## __VA_ARGS__), \
>         MACRO__(0xE211, ## __VA_ARGS__), \
>         MACRO__(0xE212, ## __VA_ARGS__), \
>-        MACRO__(0xE216, ## __VA_ARGS__), \
>+        MACRO__(0xE216, ## __VA_ARGS__)
>+
>+#define INTEL_BMG_IDS(MACRO__, ...) \
>+        INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
>         MACRO__(0xE220, ## __VA_ARGS__), \
>         MACRO__(0xE221, ## __VA_ARGS__), \
>         MACRO__(0xE222, ## __VA_ARGS__), \
>--=20
>2.51.0
>
