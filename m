Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B7C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 08:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0538110E43A;
	Fri, 23 Aug 2024 08:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NH7DJM2p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F9210E43A
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724402632; x=1755938632;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MGT5tLzdSxbkNAvGkTeb03f6C4paDYbz4Amq9JbUvto=;
 b=NH7DJM2pB+JBju0pNSPL2l2gUvMqcF7MtqYSsyjVKF0fteY7YH+fMu9Z
 YzBRn6AlCmEsV4W0RWtq1cKl8PwdbOy5r114AdeAmGJcUsdclyLKYwWt6
 b+htwzog0qyChZCeWvYZ20H7jJydbYv6GB2V92H9O6mgpP0wpL75HDwFM
 7MYQ7urYQWAowtGil/XFslY8SnyxrAXGYA7tVEMUMhV+vr4krrpf/X4oE
 Ca8HmrAhzR1vSs8YJ5VGU+iD6y2jRA/NlLP4vVfr5mEFq6woadKeKZq7m
 utTNE8XXKtilr4vGYho/w/OluVk8uFhhzxvJjuXgUgVn3U2qQHXvK3/fD w==;
X-CSE-ConnectionGUID: nSloT4xqRR62yNlwu7m7bg==
X-CSE-MsgGUID: DlCb2pcVRA2UFyjHT4BCDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26615903"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="26615903"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 01:43:51 -0700
X-CSE-ConnectionGUID: cbMDcszBS/GqQ16P4Nzgdg==
X-CSE-MsgGUID: PscywFOvSUWzULX1WXFrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61743106"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 01:43:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 01:43:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 01:43:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 01:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tef/N2dAtDuoNw1prCsSpFG5JCd/3tmla8MMzonCLlj7xtIx8vaI7pk98Y9Oa3/+H9uKe/9ck5ucq6V5Ubgh0V4YM/I5Z85R0ucKbdOmxp5uzAHyN7GDNxq0qAZsY4QVzpL0NR7Bh2XOAazzTkZXXIa3VDFOooHfilu8W+Sgj4i/6XH25285nWBe1zjFM1IXgy3I2wBB/fkQ40Msr90ZMT3ZCCpJ/dwJMpk9PosaJZEF1N8ZBiEfv0JqKKFkjk20WpCoG9eg8zwTSwKg50oYivzxUcGPfFJ7yGtpGqMzBB4VhTUSgpUhAyVIvSymaOAJwRAc4oAigMi9ZWwuYX4Q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGT5tLzdSxbkNAvGkTeb03f6C4paDYbz4Amq9JbUvto=;
 b=VZt4mpzH8xFax/gYrTgj+/fMVEb1CL07jbufWbtDqxBnSFYQdx8wWmVmcurFJvvSQ50QcLCYxB7Kg2AlxaejRUZjH4wAykKQERXkgf7j6U1pdyzfSU1ZlgTBmlThKb0thWOeDMfyPsWyybCUxZYkUK9RwHH+CdPiC/CWLKIK+xpNb/w6dnjhqJOeP7l6pTryPPdbyLRhZpuyipnLc1IgEV3ZUC8Rq6aj32iafLOmzjnGrT+9svjaCdaFeGPSmSktiPeNfHToOj11ZJfoJjTZtC3XWL96ehll+DSLPVAcFepa2Lb9OeDpdXCpndDiy15Cpd3+M8e534peTzco0/zjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Fri, 23 Aug
 2024 08:43:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:43:47 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: RE: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Topic: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Index: AQHa8yRxSHbN2EGPg0GDkKIKvSAJeLI0MqbAgAA9ZwCAABW+MA==
Date: Fri, 23 Aug 2024 08:43:47 +0000
Message-ID: <IA0PR11MB73074BBC068B36B8DD98EC24BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-3-vinod.govindapillai@intel.com>
 <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
 <160aa8f8d1bc55fd12f6332a27aa325da3a0e944.camel@intel.com>
In-Reply-To: <160aa8f8d1bc55fd12f6332a27aa325da3a0e944.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH0PR11MB4936:EE_
x-ms-office365-filtering-correlation-id: 7fb855b4-0df8-45f8-0b64-08dcc34fb47b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R0lobW9VRjJ4eTVZdHAxbU5Dd2t4R1F0TWY1NVI3Tnl3NmprRkZhR2JDU0ZV?=
 =?utf-8?B?THNlYVhEM2dvazdlSC9wZEZMTVFEaEcxTjhUQ1dka05aTnpZa0ozU1Z5c0Rh?=
 =?utf-8?B?VkRQaDZmbUpIM1NuclZBTTN6T294MXJwNlhxMzM0V1Q5WFZTdUphaFRmaUxV?=
 =?utf-8?B?YnlORFpjeU1RVWo3NFVhNXB6VlRPR2s2d2NNbkFtdGlRejA5ZUQwRUJJMEI2?=
 =?utf-8?B?N0l1WVd2ZDVuM29oZUxoZkc1NVJvZTBQeVB4b0NESkFSdklidXBZSGRVZGho?=
 =?utf-8?B?dFFKL2NJTWhJVm5SMzFDZk0wajdKcjRLclhQYWRnVTc5eGRxVm5oa1VYT0Q1?=
 =?utf-8?B?Qk5ycHovOUtHd2I0QzRZZ1VWM1dYKzhTYnhPaGovV0E2WldwZnpIaTVrbkg3?=
 =?utf-8?B?Q1U3TlZwTFRZUEkvQ3pZYmc1RHJRbStnYXlUb1R4eVFBdDFPQnBuSUZGTDMr?=
 =?utf-8?B?bnN0QjE4V1FFTHBraHk0bWJFWHNPQUpGQnYxcFBCWjM4R0JGaklOSG1QcGtv?=
 =?utf-8?B?elgrNjZwVG5VdW9PMk1TUysxdndDS0laWTRIS3A5dnpuOVZLeUFVSVh3T3dT?=
 =?utf-8?B?TFF3eGhIY2Vybzk5b0dyN2xHTjlub1loQ3F5Z3RLTFU0RG0wMHN1Zk1YWFZR?=
 =?utf-8?B?LzhhTUpjcllGcy9uN1F3TjJrUkpFN3FjRlI2Rm0xd1ZPTVJPc09QMXZEZ1Jl?=
 =?utf-8?B?bW5nNkxEenJIUTFOVlpYcHFkYWFXaEdYbXlLTGdiSVVLYWlJZXhpR1pMVXJH?=
 =?utf-8?B?L3FhKzNKc3hMT29vUkM4RlFVS2xLbmhhdGl1VGFUT0JSaGZXTkR5ZXJCVHl6?=
 =?utf-8?B?WnBkL214RFpXTXFWSHVnTjI4RTc3ZWdmU3VWSUh4WDBBTVYzU3BjeUNyNi9V?=
 =?utf-8?B?bExJaE4rc0FSUGFMMmVEUUFXM0djdllrWDNlYWlQTVB4Mk1SMWxVZzkwZE5B?=
 =?utf-8?B?eDBFK3FPb1h5MVVjdC8rdHdrT0VVL2QwREdQZGtoRHBCQ3g2VWw4UFVmNUNH?=
 =?utf-8?B?NHJUZGFnbkJpMDRIT2kzdXhHcWd2R3ZVb3RTOWFlRVBuNjNhdDN4ZFpNclRP?=
 =?utf-8?B?Q0RPN3lkemV4WGU0TENnNzVFZFd1T3FqMHJodm5JYWVHaWtNbjlrNHQxcDlW?=
 =?utf-8?B?VEQ4L2RFQkF6MWlrWkhmTXFFbE1adnhielpmRlp0SVc1SU5TMUQyS2MyMkJY?=
 =?utf-8?B?MXVOUEVjVU1VYlNNYkloUHJXblFld1ZvZjRqQ04rVUx3SUROMTBkSE1mL2VX?=
 =?utf-8?B?NVRMNXAvVmJIYW5MbG5iYW10dkhMQzRXblBHdnBiU0crMUNQclBuZVBGUkZZ?=
 =?utf-8?B?YUc3cXhLS3dxNjBEWE43bDF4RUNUaEQyVTE5bGJXUjZybWpBMmc4b1B0NldY?=
 =?utf-8?B?bklWWG4xa1JFbWtOM0pabDk2WWkwTXdPOExaSUhCZkhXR0M4WHMrZkhqS2JD?=
 =?utf-8?B?VlJ3RHdraXViZkNiTVB3THZSMzlDSEtONXFpeGE5R29EYTY2Y0hFYWl4NlBN?=
 =?utf-8?B?TlNYRWhva0dEUm1TQVVvYkpxa3B6YU5IeHJPTTQzVG1MMjh6K2hkV0I0b0JK?=
 =?utf-8?B?L0dUY2dNcE1rMnhNcm9HMi9ESUZQMm15YzhyWEhjMWpkK0puZ0xUa3FQMmNI?=
 =?utf-8?B?cmRFOE45RWRidm96UVZ0YXpkS2x5dEZwK3VCWmRVcDUySytqUEJHT21QLzJH?=
 =?utf-8?B?emFBbWx1YytsMnFyaDJsbFQ1VVl3ZUxkMGZIWTBUMGprR0ZIU1BBNTFxNFRN?=
 =?utf-8?B?c0VyL3VPeUtmRm4vVlZLalEweXpVMENiVm5tYzZtY1BzUlhmelhDaC9Kd2ZT?=
 =?utf-8?B?elVSa3NTa1A5cDJSWjNjWGV4Mml0azNyMGlZNGgxNzN3SEpUUVp5VVpqWTBq?=
 =?utf-8?B?Vmo4THNvb2pwTXVDSmdEdHduamhMTWExbVJWeEZXYzBiM0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHUwMkFCKzhiMlg4dU1BZ2VEazFFSEduT2R0eXFnaVRIM0F3cnViZWFlUXlP?=
 =?utf-8?B?dmpOMXY1bjdzYVJZWE1zK1dJTithMkxXS3ZENEpFcmJuSjB4eDlyQU1TaVc1?=
 =?utf-8?B?WVpHOXZTUUNoRjNpT2c3RHFlcjJ5ZHhmYURaYmcxc05aaVQzb0IzclNaVkZv?=
 =?utf-8?B?aUNQa0JrVk1aVkhXckR2NU9PaFJLV1BINDdFV0lwVWphdXZDTFZCWEV3d2gx?=
 =?utf-8?B?RTRRbjA0Q1ZUczJEWGhGemFqQUZIcjRvTElSSC9mdUtVSlJCY2lZWmJCYWNw?=
 =?utf-8?B?eHpEMzd3Wm1kNGcyRGcwcmRDVE51a1hFaW9aZkpndm1pKzFiVk5OU0tQeWV5?=
 =?utf-8?B?anlLTmVXb2U5TDdHK0p2YzBPZCtab0dVNlluYVRXT3YxakdWMEg0K0ZEU3Ju?=
 =?utf-8?B?MWZKQW43QVMvMU82MnE0blVVTlpaOGQxR3d0Njg3Ulc0YXdaKzRreXg0ODVC?=
 =?utf-8?B?dVZWMFJnWENmclcyZ2d2dkd4Q1p2UnJkNjhhaStlQXZReEJpT1dtbGcvM2s2?=
 =?utf-8?B?a3JqbjhJeUU2R2ptcnZWMjI3SVZVUVZjVzNzUjJuckE2Umk1TGh0aEF5RU1G?=
 =?utf-8?B?SUlibm4yTWM0NHlFVS9QRThsa0J6VUpQRFNzUmxjTGl5YXlIZm9Xa21BYnJ4?=
 =?utf-8?B?czRjc1dFRXlrUUdqUGlydllxb3MycmtCZ09rZzFBU3hQM0NxeVE0SFE3Q3JJ?=
 =?utf-8?B?R0hLdi9kbXlVMmFZUGorbU53VUFmYWVxUjQ2THFkNG9xZzJ0cUlVOStBQ0px?=
 =?utf-8?B?STA5OGVjenFHeldpa0phNERlR2E1RVpKSll3Qk1BbWdsdWpHWE1oZWd2cTJH?=
 =?utf-8?B?ejhiSXdaMWUwRXZxT3NJOFpnRnA2Ri9IYU45SjN2d01uZlcydFVCZjJ1Z2FR?=
 =?utf-8?B?WkFwelNvcEhTRmwraTNoczg5YkM2V3M1YkY0cXIzdE80bFluU29QTFdwaWpa?=
 =?utf-8?B?ejJWbmk0cEI4UTdBYlFvd2czV01FR1N0cDdsWUllWWw3ZklyZmRWQkoyZGdh?=
 =?utf-8?B?Y2tyclNXdTBLci8yVDMwKzhSZVp3NCtsRE4rTEVhK3hpK1VVSEtDcTdFRTFU?=
 =?utf-8?B?WllrWlpXYUsvVmw2VWtuNGN1RUt1cHFiZ2dETWNRd0Q5WUJoeEhCVnRTS3p4?=
 =?utf-8?B?TVVQY0dvNit6WERaUFFMSCsrbkt3TWxMQkwxbENtQ3NMc3htOU51UW1YSzVP?=
 =?utf-8?B?VTM3QkZjTDcrZld3SkZYbFo5cEtXZXZwdmVtVGNFWFpMeVNvNFlsK1FUMVlR?=
 =?utf-8?B?T1hoNUdiSXYyM0dnMXJWMkx3N1VjcFlocklaU0FiVjVaZ3ZFWmlZS2dVdTlC?=
 =?utf-8?B?WXcxN0FGbG9RNmh0ay9kK2hIVTVxbVFvQkVaVW5wcUREVGtKMitCY2lDWkd2?=
 =?utf-8?B?d29taFc3Q29sUmdYTnZzelZwSDVrak9qR2laUUpQOWJWWWxXaWJUbGViQXhi?=
 =?utf-8?B?S3VNenIvVkVPSTV4RGpIb29LeUR6YytPWklEcW1VWDIrdjZ4T2x0UVRKbjJs?=
 =?utf-8?B?d1MwNFV0R3dLMHZETXo0RDMzQVdOdStROG1BZ29YNVFrODEreWJKUEVHN2Fi?=
 =?utf-8?B?UkNxY0h4UklPTjhGbGt4dm5MMnI5TmhHbExzQ2JjUG1SVnZ5ZzB2YWlueFVu?=
 =?utf-8?B?YlBGR1VFY3FWRTBlVHpnVUUzbXV1NUt1bHBReDM1SUFIeTFGK3dvR1pQdGt2?=
 =?utf-8?B?M1FMQ0E5dnhhUVQ0VXYxL3N3UkVSbHpVQnRxRFBYUUJYbVhIOE9HUkxsU0xw?=
 =?utf-8?B?cVIvWFRDaVR0VnEwWFBvOTJwSkF3cWk3VHVoY3NvRXVrOENUUlVzb3NrY0Zl?=
 =?utf-8?B?UWIxSzZPcnR0d2gvcVZScG16VzYrUDdKa2Q0K1JlM2srR3RsYXUyNkptZ3B3?=
 =?utf-8?B?RGxZbllhKzdCSHBEWEhXOHpaODh0YWZwcUEzemlIWUUxNVY3VWZmQ2w0WDFS?=
 =?utf-8?B?M2NOc29CaTIzTlZqaTJIbnNoR1pjeVlFMHd2ei9YQW9wb1B0NzdUOFM2T2tk?=
 =?utf-8?B?WnhSQW1GZkgvb0pxWFh5UTZWUE5VbjAzbUthdUpYNy9YODhtUlRvK0lNRlhO?=
 =?utf-8?B?T244OVRZLzVocjl0ZFV0QTFJT0YrcHFSdUNxYmQvc28zR3FRb1dPNndDQjMx?=
 =?utf-8?Q?+t/GMZHNASzPpNg1E7e7XCIO9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb855b4-0df8-45f8-0b64-08dcc34fb47b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 08:43:47.6942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4v1gc8x7BBKUgD6M1wkPzhbbt/KlOYb93D992QJJr5k4EDVyxUrsXq5wTQCBt8YirNdkDeHv5G6uTCt2OQy3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
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

PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXku
Yw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiA+
IGluZGV4IGFkN2ZjNTEzN2I0Mi4uYjJhMGI0YjVjNDVjIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMNCj4gPiA+IEBAIC0zMjAsMTUgKzMyMCwx
MyBAQCB2b2lkIHhlX2Rpc3BsYXlfcG1fc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gPiAq
eGUsIGJvb2wgcnVudGltZSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBwcm9wZXJseS4NCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9wb3dl
cl9kb21haW5zX2Rpc2FibGUoeGUpOw0KPiA+ID4gKw0KPiA+IFVuLW5lY2Vzc2FyeSBjaGFuZ2Uu
DQo+ID4NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9mYmRldl9zZXRfc3VzcGVuZCgmeGUt
PmRybSwgRkJJTkZPX1NUQVRFX1NVU1BFTkRFRCwNCj4gPiA+IHRydWUpOw0KPiA+ID4gLcKgwqDC
oMKgwqDCoMKgaWYgKGhhc19kaXNwbGF5KHhlKSkgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYg
KCFydW50aW1lICYmIGhhc19kaXNwbGF5KHhlKSkgew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkcm1fa21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoJnhlLT5kcm0pOw0KPiA+
DQo+ID4gQ2FuIHdlIGdldCByaWQgb2YgdGhpcyBBUEkgYXMgd2UgZG9uJ3QgcmVwbHkgb24gZGV2
aWNlIHBvbGxpbmcgYW5kIHVzZSBpbnRlcnJ1cHQNCj4gYmFzZWQuDQo+IA0KPiBOb3Qgc3VyZSBp
ZiBJIHVuZGVyc3RhbmQgdGhlIHBvaW50ISBXb25kZXIgaWYgaXQgaXMgcmVsZXZhbnQgYXQgdGhp
cyBjb250ZXh0ISBCdXQNCj4gYXMgbWVudGlvbmVkIGluIHRoZSBzZXJpZXMgcGF0Y2ggZGVzY3Jp
cHRpb24sIHRoZXJlIGNvdWxkIGJlIGZldyBvdGhlciBzdGVwcw0KPiBtaXNzaW5nIGluIHRoZSB4
ZSBydW50aW1lX3N1c3BlbmQgaGFuZGxpbmcgYW5kIGEgYmV0dGVyIHJlZmFjdG9yaW5nL2NoYW5n
ZXMNCj4gYXJlIGJlaW5nIHBsYW5uZWQuIFNvIEkgZ3Vlc3MgeW91IGNvdWxkIHRha2UgdGhpcyB1
cCBhdCB0aGF0IHRpbWU/DQo+IA0KTm90aGluZyBtaXNzaW5nIGFzIHN1Y2gsIHJhdGhlciB0aGlz
IGZ1bmN0aW9uKGRybV9rbXNfaGVscGVyX3BvbGxfZW5hYmxlL2Rpc2FibGUpIGlzIG5vdCByZXF1
aXJlZC4NCkk5MTUgdXNlcyBpbnRlcnJ1cHQgYmFzZWQgZGV0ZWN0aW9uIGFuZCBub3QgcG9sbGlu
Zy4gRXZlbiBpZiBjYWxsZWQgd2hlbiBwb2xsaW5nIGlzIG5vdCBlbmFibGVkLCB3aWxsIGhhdmUg
bm8gaW1wYWN0IGFuZCBqdXN0IHJldHVybiB3aXRoIHdhcm5pbmcuDQpJZiB0byBiZSB0YWtlbiBs
YXRlciBjYW4gd2UgaGF2ZSBhIFRPRE8gb3IgUmUtdmlzaXQgc28gdGhhdCB3ZSBkb27igJl0IG1p
c3MuDQoNCj4gPg0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghcnVu
dGltZSkNCj4gPiA+IC0NCj4gPiA+IGludGVsX2Rpc3BsYXlfZHJpdmVyX2Rpc2FibGVfdXNlcl9h
Y2Nlc3MoeGUpOw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gLQ0KPiA+ID4gLcKgwqDC
oMKgwqDCoMKgaWYgKCFydW50aW1lKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludGVsX2Rpc3BsYXlfZHJpdmVyX2Rpc2FibGVfdXNlcl9hY2Nlc3MoeGUpOw0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5X2RyaXZlcl9zdXNw
ZW5kKHhlKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiA+DQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgeGVfZGlzcGxheV9mbHVzaF9jbGVhbnVwX3dvcmsoeGUpOw0KPiA+ID4NCj4gPiA+IEBA
IC0zODcsMTUgKzM4NSwxMiBAQCB2b2lkIHhlX2Rpc3BsYXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9k
ZXZpY2UNCj4gPiA+ICp4ZSwgYm9vbCBydW50aW1lKQ0KPiA+ID4NCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAvKiBNU1Qgc2lkZWJhbmQgcmVxdWlyZXMgSFBEIGludGVycnVwdHMgZW5hYmxlZCAqLw0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2RwX21zdF9yZXN1bWUoeGUpOw0KPiA+ID4gLcKg
wqDCoMKgwqDCoMKgaWYgKCFydW50aW1lKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFydW50
aW1lICYmIGhhc19kaXNwbGF5KHhlKSkgew0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpbnRlbF9kaXNwbGF5X2RyaXZlcl9yZXN1bWUoeGUpOw0KPiA+ID4gLQ0KPiA+ID4g
LcKgwqDCoMKgwqDCoMKgaWYgKGhhc19kaXNwbGF5KHhlKSkgew0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJsZSgmeGUtPmRybSk7
DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFydW50aW1lKQ0KPiA+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9k
aXNwbGF5X2RyaXZlcl9lbmFibGVfdXNlcl9hY2Nlc3MoeGUpOw0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2Rpc3BsYXlfZHJpdmVyX2VuYWJsZV91c2VyX2FjY2Vz
cyh4ZSk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfaHBkX3Bv
bGxfZGlzYWJsZSh4ZSk7DQo+ID4gRG8gd2UgbmVlZCB0aGlzIGRpc2FibGUgaGVyZSBhcyB3ZSBh
cmUgZW5hYmxpbmcgdGhpcyBvbmx5IGluDQo+ID4geGVfZGlzcGxheV9wbV9ydW50aW1lX3N1c3Bl
bmQoKSBhbmQgaGVuY2UgZGlzYWJsZSBvbmx5IGluDQo+ID4geGVfZGlzcGxheV9wbV9ydW50aW1l
X3Jlc3VtZSgpDQo+IA0KPiBUbyBxdW90ZSBJbXJlLA0KPiANCj4gImludGVsX2hwZF9wb2xsX2Rp
c2FibGUoKSBpcyBuZWVkZWQgZHVyaW5nIHN5c3RlbSByZXN1bWUgYXMgd2VsbCwgc2luY2UgaXQg
ZG9lcw0KPiBhbiBleHBsaWNpdCBjb25uZWN0b3IgcHJvYmluZy4gVGhpcyBwcm9iaW5nIGlzIG5l
ZWRlZCBhbHNvIHdoZW4geW91IHJlc3VtZQ0KPiBmcm9tIFMzIGV0YywgZm9yIG1vbml0b3JzIHRo
YXQgZ290IGNvbm5lY3RlZCBkdXJpbmcgdGhlIHN5c3RlbSB3YXMNCj4gc3VzcGVuZGVkLiINCj4g
DQpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpB
cnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tDQo=
