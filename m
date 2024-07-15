Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89D8C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 14:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768C310E3C9;
	Mon, 15 Jul 2024 14:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNvGYHji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7226610E3C9
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721052353; x=1752588353;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=R39UJ4O0st6FIrnhVyu+VwaVQkQrbs7+gMiEy5uQR8U=;
 b=PNvGYHjiWHDp6nvvzeEx9lzs+8zE/pwkDSb3B++L5ASTF/k0hM95T5p+
 yq55+UECYpATmX9hngq4YgNV88btwcurAWiEJ0QDxSNwhbRfVfDovXH0j
 +6DlPgKrML9HiPP2XJ+m0MOsSV1+TnbqyXFQPWoXh9hdGID+YhwIQlExk
 Fz76e9A8Z0ZGxtAoHglqFOJ82HjPBzgDgb7tQjO/bEdacsDI5nmWMwicH
 MHcJ+urEcoxlp2F7FHwpArKhXuRCa+zMcKHXfeOIpwrK5E1dLrSsMmUuC
 IXfPSaLagkD7sTHcH+XureIFKTz+1hUbhfzp2OiUKAZrNMl0wqBAkSF4X Q==;
X-CSE-ConnectionGUID: INfpPGGoTLyLKtsANwz/hw==
X-CSE-MsgGUID: E4yZ+uXJR6iI2+Bb/hHq5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29844040"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="29844040"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 07:05:34 -0700
X-CSE-ConnectionGUID: kzNx8vLlRc6WacXEczJ6CQ==
X-CSE-MsgGUID: nztPYQ6/RY6laynHOeA7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="54002579"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 07:05:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 07:05:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 07:05:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 07:05:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMfGYRr2W4CpIbvmPZ/S9wVFS2YNIdEHEOF5bu/5QdufxTTNYosDNJ6e3VtdAryu3/t/pNTC4a24STcQYNY3PoqAmJAry+7P0xnIfq6RDgBYjZRC3Gb+y/c90VYwiagrC7Hotwa/2vecuuRLckzidGk7O6lhZGj5IVnZ1oOh3uBJc+DHygJK/tbwqvfcdclTGhg06GW3WvwBoM78gApcSEEP5PxwLnlc1MBOOQrA7f9vhEQ3Vfw+XFSD3moaqR1Rr/mcswREtt/ZLqfWNE5X2EmIWZHCDfqc5xq2PjgNchpmngh00jI+vC9994AN3hhLtR8FrWTzpprlQC1Ib75alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R39UJ4O0st6FIrnhVyu+VwaVQkQrbs7+gMiEy5uQR8U=;
 b=DkMAmGobwMeTBCrjIAljWs8NqOFyA+8QPqsOSyE+TKSqugj4c53Q9OcrHUGG4wLm9bjpSPjZEASvg+5eAsuKfTVH13BKTayiW/aulC4rdCIxWC8ajCpwSeHbIJeLJUYmpxq9UaOLGz8pTpo+3/ogHEDKhKU9pu4RCg6B29DDYAH6RKIUpfU01MeSiYVEul5jBEmcPy4Rtx/nN01rbt7rI4DvcCj/jtwkS0x6u5NS60SoV9LpkDsjvbKGXlh9GQwZu12ieI5f7lX8Fz4dHpGY/bPch8hiwKxc5J5iw6mdllObd6AQJ/SplZRzGhBrVKVpZlxKmUI7D51nAvsW7Y6D1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW4PR11MB6787.namprd11.prod.outlook.com (2603:10b6:303:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 14:05:25 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 14:05:24 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
Thread-Topic: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
Thread-Index: AQHa1qNI4saoC/2LtU+ueAU55GCxvLH30siA
Date: Mon, 15 Jul 2024 14:05:24 +0000
Message-ID: <dc1ba1cb5ec819259dda071b400323926f2e360a.camel@intel.com>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240715105555.2220444-3-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW4PR11MB6787:EE_
x-ms-office365-filtering-correlation-id: 5a815647-f956-4417-1184-08dca4d72c56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZTc0aGxOSVBndkUvblBGWEwyU0ZsWUtIRGx1NmZCSm1ZdlI2Z21RdXg1ZEFx?=
 =?utf-8?B?SUF2V095bXdiTUJDT2o5ZWt0YUM2UHc5ckRwTzQ4OTBQMkdVWFdzUG5pejZS?=
 =?utf-8?B?VC9mN2cra013WTJxdk9HeWJWZzZoQXRhV1RJcm9kcmdrNlhtYTlITkp4TDRU?=
 =?utf-8?B?MlFtMk9RNm5qczh0aWtvZjBRcGVObWU2b055NURFSFI4b1NIZmZCWTFadVBa?=
 =?utf-8?B?ZU9oK3hSY3RTZ0RsaFhLVmlaU25kRjF6bjFJSXA5SUhlMi9BNkYwa0tUVmdN?=
 =?utf-8?B?Ym9PWHVnZENLTXZoTXJoM05pYUNOdStQazh3Nm80TmRmeW11NWhPVDlzRHAy?=
 =?utf-8?B?TGxLaDJTdHlSVmp4aWMxc0dqeFZvejVhZGMwUTV4elR2SkIzWUVUdUpFRzhm?=
 =?utf-8?B?ZmpQemFqR3VmSkcxS29YMEcxZkVXRGR3ZUplTlhrbW1DcE0yRXFLRStWTnRt?=
 =?utf-8?B?QzRHcFZOYldnbmFhcm5zVXVMcjNNMmh0c01lNmJlZnVJUXF5KzhSMjhyTmU2?=
 =?utf-8?B?Qkp6ZDF4UDRMKyt5a2g5TTB2WGJna1dseVpVbXZjYy9DdjcyQXpyN1h3Vit2?=
 =?utf-8?B?aldDdVpqcXlFeCt5RnNXaktsNXRlRlAwekpWNHMzMmJEYmZoSHlUTTQzNndp?=
 =?utf-8?B?eTFJV1FwLzl3K1dRMmNpQVFIdFpEOWpycE41QllESmRPWGxtazBJdVdUK2Nq?=
 =?utf-8?B?QzgrM09DQ0VkQ2JtbExUQUE4bUZTV3BiV1R0djA0aGZoTDFKSU5GeGc5MzYv?=
 =?utf-8?B?aEloZEk1UkxSVzhhaE9PSlh3T0dEOFFCbzk5clRnaTFJcDlIcDArUHY5SU9E?=
 =?utf-8?B?Q3pBRXZSZVJBUXV2b0svUE15Nkw1Q3FqWXRPV1VmOVNFUEtEb29aVkk0NzBI?=
 =?utf-8?B?bDgyQS9jc0lZTFNzMUZKTUU3SmtTaTNjVG1WanpUeTkyTUl4MEpHbUVMVSsv?=
 =?utf-8?B?UUpwR1VScllmM3NrU3hXWmNYQUZpNzNTakNKcE5sY21hVVVGMEFWbDdNT1BU?=
 =?utf-8?B?U1V1bFNTNktPcnFONFl6bWhibkMrRmdqUDhKcjA4bVZWaTRWRzZ4aHBvWXVY?=
 =?utf-8?B?cmtRdGQrNXNib0EwZlJKR3pqSkF2YnpGUnlsTmdNdlFRcWgwUjFaK0M3THFn?=
 =?utf-8?B?eWtVVTdKS1ZTcmNzeGVFenJJSG1PVGg4d3hzRHc3YTdqN0piQXFUTFU3ODVQ?=
 =?utf-8?B?eFBCdUhpN2hSR2J1cDZDWEJMTGhLeHlEL1g2TCtHalJ4T3V4ZW1PVjVkZUpl?=
 =?utf-8?B?RjdSTlhmU0x2T01FeTV1SnZoT1pCckdCSXVpSWtpNGtaY1RaZmdsRVVWUEFL?=
 =?utf-8?B?RG0vNWw4Y3kvMllLY09pMWtsTWlHZG9ZNXBOZGJzQ0RNanpkTWNGSE0vOXE0?=
 =?utf-8?B?b1Y0anY3cTRNc0lDeG9MQnMvTDVwVDdZQUxxazFnbnE2RTNuY2padFJhaXpT?=
 =?utf-8?B?SUIvVTE3SEFFUmhEZFdpRDZqY1ZxOUFSUkUvaWp6MHVPeFlEbFlPZkZFTU56?=
 =?utf-8?B?ZEFvdHFOVnRtZlJDSHREY0VnWkxpa2c0ZXAvb2FodnBTNm5aOEdObEdqVElj?=
 =?utf-8?B?cEExekU2TTd5aDNBZk02SnVsSkRrQ1oyU0VwQ04vN0lHbTM3eTRVU0Jia3lF?=
 =?utf-8?B?RHFBcDc3S0I2N2tjQ1NqYWdRaDdnWldyZ3RPQWMyZVVHRFY2ZXhEUUJXTGVG?=
 =?utf-8?B?K1A5OW1NU01BaUlwWTZ5bjFMV1FiNkdKaG9sZ0ZtL2w3d0pYZCtKdmJ6UUNX?=
 =?utf-8?B?OFQvcFlLeHZva3VFckNscmo3MTkxUzRvZmVPTHh1Q0hkcUFyZlZZeUZaRnhu?=
 =?utf-8?B?MW1FTy9ya3gwSTd2ZzNEdDlyME1lTXNZcGRkRVhKT3JvYTZYWUlocFJwbzBH?=
 =?utf-8?B?TnlSK1hoYS9wQ1BNWEI5cG1XUUpRZUJJazhCZ28vcjNHK3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3EvakkrSVpQS0hvT0V6MGVPUVQxYVRla1dxOWpJSGRNL3BVdFdaaXZiUEF6?=
 =?utf-8?B?MjhmVHNQdWlQRHpqU0VWRHoyWDNmTnJIRVBWTWZIR296bmppZnJwcTNwZHNJ?=
 =?utf-8?B?eWF4aGtURE1qM25pajQwYTg0MUo1ZEFtK29TUUpJWGR6Y0gybERNL0dYT254?=
 =?utf-8?B?akhIbGN3VlVpWFpQRWllL0c2cHUzaE4yNlR4aGdiekx0MDEzd20wbUNIQXg4?=
 =?utf-8?B?ekJJRGpWOEk3QmNqMVBmazl1M2pkVlZMWk1EalZaTFYwWmo4eGZ0dlVHSHYv?=
 =?utf-8?B?WnlFM3VJV3Uzc1Z3dWRvcHhURFRsZTlGaTMxczU0SXhOMldOcWVYc3ArcmFY?=
 =?utf-8?B?MVZYT095YjBFU29STEVCUWJOV0J0QmRzU2YvTk9WV1FUWW1CZGpDb0owOUox?=
 =?utf-8?B?eEkvQTNnbHZKemF3VDdKeEtUZWc2ZCsya3FyQjNWRk1FRFg2Q3RvOUlUaUNl?=
 =?utf-8?B?YzlqY2d4cnN4bFFyZ0gvcmxWMllTWW0vYjNSM1VDRWVQSlRBcmU5cHBQU0hU?=
 =?utf-8?B?L0VlOGhvY2I1cTNuRUpIWGFKemZrS3VabExOSVE5T3I5dDdUTFlCRkxGS3BW?=
 =?utf-8?B?Tzh3Y2ZrUXZkY20vZGY1QWViaUZmVHp2bEh6amhJaHQvWVRNWDNNeW5ubFp4?=
 =?utf-8?B?VWZpK0czaXdsdnljSFhOZTNnbW1NdXF5NFJLckQ5Y1craGZ1TXJnY1ZEbERK?=
 =?utf-8?B?b0ZQdklNTFBCYXhnaXhxS1FmUnFQWlZ5VGFvMUZSZ1pCVnVPeTJZZHpTNzZR?=
 =?utf-8?B?R0VaMjNlc3VSU3dXUjVhaVpNbjU0Z3c2WjdzWGJaVTY0OTd2Yks5dXkrRUJn?=
 =?utf-8?B?ZzFsWkZ0cCtTbWx6MTIwWDE4N3BLZE1vdmIzSWZsMUN2Q08vajFJSnJHbElG?=
 =?utf-8?B?SWQ4UGVzU1NqQ2xnR2crTHFUVXpYV2NUWmlOT09OdEtRUzhaUU16WHQ1RFl4?=
 =?utf-8?B?U2ZkY3Q2ZFMzMDRDWXlwRjZXQUI3MTlmaXdKYXMvRkNQck5uMUFQRlV5SEFL?=
 =?utf-8?B?aFYzMzB3Ym5PN2tINzFEZ3pmQ0FOcGdoaGtnUUY1a1NpUmxYQUNSbVN6WEdz?=
 =?utf-8?B?VWlTWE1CYVdvcHNZMW0yMmZwSjlBem5Rb2NmK29FdHJKQVNzQXJOait6cXM3?=
 =?utf-8?B?KzJUSXFKZWlPVHpyNkNNMzg5SGlHazhNdFl6ejFlVWdPVU1ZaS9jREtxZzZD?=
 =?utf-8?B?YWl4OWVzZnZoUzhBSGRJUjg4clZTbUR2eG1WZ0JybkxLaUxBdExvWG4xMVQ2?=
 =?utf-8?B?RFhuRUhZcUhISWdiRGhrNk02YWpTdTVlTzQxdThTK3UyNFp5YmZXamJYOEU5?=
 =?utf-8?B?Z3ljdkVCNE56ODZWSG5pM3BZbjRTajloRkJLVWVmenllYjJ5ZlFCQ24wUWpT?=
 =?utf-8?B?ZldLaUJpRU1lZ3hzdGJRRGZaajNXemIvMlM3U3V0MWN0YzQ3K0hzbnNHSGQw?=
 =?utf-8?B?WHF3L1E1Q2NHL2lNeGVtRTdwUUNKQ0R5M0RGOStZMWZ3RTJBVmp2VTY4UjNZ?=
 =?utf-8?B?WE9DbUpPNTBpODNnTGxWSGpLMk5ZWjlsZ25IN0ZxMGYzMzFhVGZSUmhyUVlB?=
 =?utf-8?B?WGJHSm5uUHBKR1VDMVFXYVp5amxZWmVpL3hySVhoaitHQ3JxRzk1STU5TEl3?=
 =?utf-8?B?anBhNzY4Mk1zRWNNWGVYNmtWYVpxUGQ1M285UGpxc0pkdWFVVFJZY3lreVVr?=
 =?utf-8?B?ZWdLbVFVZnU4ZTRIKzRkanRQS3NEejQzSFpRbWN5MDBLWkpGd04rWTNlSE4w?=
 =?utf-8?B?UHorZHdicmZqNWppSGMxeXd2U2RGOFFDTEdWcnV6SlFpZGVlTlVTa0dwZGpB?=
 =?utf-8?B?VklmakJWbURiTEc2SlBhVkRlbEY1OHZDNGtPMHRtWERRM1BnT2pER2J3T3FK?=
 =?utf-8?B?a1JzNTJDWmRxZm5RNUxSM2M1ZXo1RjZSYjBzQWNqK25Gck4rejdja0VjV2o2?=
 =?utf-8?B?d2tMdXFiclN5U1d2YTl3SzF3bVJaeWxMZ3oreWhudTlFZjlqVXpJMkt1RkRD?=
 =?utf-8?B?U1RLeUsvNnFiWi9CWFhiWTc1WEFWd3pXWldtZjhPdEN0QnFlODI2OVFnc2I0?=
 =?utf-8?B?SGw3Y2Y2VTlKT2VXSFRGU2xsVC80S0tvVVlFdWliVHMwMlc4bTlIaGNoTDRJ?=
 =?utf-8?B?N0FyZStBeUt4cGlOR0xHWTNjUDZweHlvV3QvcEpwbFpGb3ZlL1ZHL3BhL3lL?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <311DBB7CDF5AC34FB32D923F3E3E6558@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a815647-f956-4417-1184-08dca4d72c56
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 14:05:24.8087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hw5+xpKFpBk8uVVEKCnD7LVmme1ZLFkNsZ698vxFxXaDOMenFXINvX2iAm6PIB1hWZsYNgUdYDOZG0txQ6XSzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
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

T24gTW9uLCAyMDI0LTA3LTE1IGF0IDE2OjI1ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIGNvbnZlcnRpbmcgcmVndWxhciBhZGRyZXNz
IHRvIGNhbm9uaWNhbCBhZGRyZXNzIGluDQo+IGRyaXZlciwgdGhlcmVmb3JlIHJlbW92ZSB1bnVz
ZWQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6ZV9hZGRyLg0KDQpJIGNhbiBzZWUgc2V2ZXJhbCBwbGFj
ZXMgdGhhdCBzaG91bGQgdXNlIGl0IGJ1dCBhcmUgbm90Lg0KTGlrZSBldmVyeSBwbGFjZSB0aGF0
IGRvZXMgeGVfZXhlYywgdGhlIGFkZHJlc3MgbmVlZHMgdG8gY2Fub25pY2FsIGluIFhlMisgcGxh
dGZvcm1zLg0KV2UgYXJlIHByb2JhYmx5IG5vdCBnZXR0aW5nIGFueSBpc3N1ZXMgc28gZmFyIGJ5
IGx1Y2ssIHNvIEkgd291bGQgbm90IHJlbW92ZSBpdCB0byBhZGQgaXQgbGF0ZXIuIA0KDQo+IA0K
PiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgfCA1
IC0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmggfCAxIC0NCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4g
aW5kZXggMDZjZWJhZmZiNDUxLi5lYjNiYjQzNGIxODAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlLmMNCj4gQEAgLTg4NSwxMSArODg1LDYgQEAgdm9pZCB4ZV9kZXZpY2Vfc25hcHNob3RfcHJp
bnQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCkNCj4gIAl9DQo+
ICB9DQo+ICANCj4gLXU2NCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2Rl
dmljZSAqeGUsIHU2NCBhZGRyZXNzKQ0KPiAtew0KPiAtCXJldHVybiBzaWduX2V4dGVuZDY0KGFk
ZHJlc3MsIHhlLT5pbmZvLnZhX2JpdHMgLSAxKTsNCj4gLX0NCj4gLQ0KPiAgdTY0IHhlX2Rldmlj
ZV91bmNhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcykN
Cj4gIHsNCj4gIAlyZXR1cm4gYWRkcmVzcyAmIEdFTk1BU0tfVUxMKHhlLT5pbmZvLnZhX2JpdHMg
LSAxLCAwKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiBpbmRleCAwYTJhM2U3ZmQ0MDIuLjE0
ZDQxNzFjNDY3ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiBAQCAtMTU4LDcgKzE1
OCw2IEBAIHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQg
c2l6ZSk7DQo+ICANCj4gIHZvaWQgeGVfZGV2aWNlX3NuYXBzaG90X3ByaW50KHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOw0KPiAgDQo+IC11NjQgeGVfZGV2aWNl
X2Nhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcyk7DQo+
ICB1NjQgeGVfZGV2aWNlX3VuY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUs
IHU2NCBhZGRyZXNzKTsNCj4gIA0KPiAgdm9pZCB4ZV9kZXZpY2VfdGRfZmx1c2goc3RydWN0IHhl
X2RldmljZSAqeGUpOw0KDQo=
