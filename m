Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E15BC4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 04:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F962112070;
	Mon,  6 May 2024 04:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvqQIVh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D44112070
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 04:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714969814; x=1746505814;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l62pBF7D19Pu+pzQqi24lKV6bLu92EZUnT7LWFNfUWg=;
 b=HvqQIVh9dkiY648bGUkE0J+Y6FOsMDwv9pr51Ku3mV8wNch+7mhPoNr4
 SNtFotjjxucpwlrtQBgmJsc4M83AV5x1rp68wwYf9pF9ozQGVqnbDDK79
 i+Ck+k8LCIJVrV1sOYccKTI2T+GfLC+RcQIS/d4b3b1ucs7w0rSmK3vaT
 QIVQ0FgUcSRA8xumJ7Vq/4/8ZYNrwpdAPd02obd11jwaDq2tOLIvEYQyu
 WAxQ8I37y/WbHLe/MtxzbxTDFbeRN+U9RjKn3qGzJhvPi7A+KGeLx0eGH
 tV3E/XVC5Lh9chl47yy7jMTkMmMWPkGXRN7JdHVSeFxn8hAXJIU+V+Y3F w==;
X-CSE-ConnectionGUID: 8Qi3lamlRWy0aEXryFRCog==
X-CSE-MsgGUID: Z8wkJhmzTL+aBrshtUnBuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="33208725"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="33208725"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2024 21:30:14 -0700
X-CSE-ConnectionGUID: 4N47YVIaSLSOWq00HDzBBA==
X-CSE-MsgGUID: GKw3RQe4SQOnS8fv7vFvmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28044334"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 May 2024 21:30:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 5 May 2024 21:30:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 5 May 2024 21:30:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 5 May 2024 21:30:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 5 May 2024 21:30:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV81Rc+WyQ0ycHIFG4x1VM3rjasjoJVGa4XzSYdkXOvbNmSkwT08++gQhmL6fMIAy7s43DPTWBu58w2ZBEJ4o0NiBcrvhzRG8syrxeXx9p1h+edKHUz3QKq2xIooAJ+taO70vLGBpNaRbkNls8BH1Cgnk/biDVooUtHhyER52Gt+W3QrHiMw2C4xsCoK2DSX06JoxiKZsi4X0bFGDIpY9e4ftCtfyF30g6gJPBLBbiFiB5AZA6bhL15TuYwUHF6+x7AJnPsvWantpbabC/MUxsEyfFtjUKGvmUanxpoaLt6h2dyRVGIEFoM8ykHRe+/9XoXTGLfKA5upPe/AnKQUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u8l9P+hpP/3acjbHsZTxKLRM6jxxnckSe8l4mZZA1k=;
 b=g1h9aTy+ZdeOr31LbEh3vJEux8YicGKOOVI09lxrcQDP7oHYx+qYVJZK3l4AqtiRQA2hr04jtHGoH2SHboFxWL5NIfllaCM+MdITtObQhJnqUfumg6x9AHoYRYNggoe0FQrufLSv0abMshSP7gMvAh4MKba4FR522kCgRzjW3KKoa8nyS/gCb2h2pQ3uZ+CG/ZG8QtSB+Bc7kQCpfdzeoKihPA6B0GITL00DspJWsC41WixFn9D4Njp3NgpZPWq86h7UFUtmz2xB4UoUWlccUPlDUblvNNblflfUaQCf13frxpxoWC8yPmHHx3fcv3X/UtoU0VJ85uR6h/QqZ0opQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 04:30:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 04:30:09 +0000
Message-ID: <efa75e59-536a-4609-85a8-1ae1925db0c5@intel.com>
Date: Mon, 6 May 2024 10:00:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe: Minor cleanup in LRC handling
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
 <20240504233503.16095-2-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240504233503.16095-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::23) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM6PR11MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa13330-8356-445c-aa0c-08dc6d8536a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU90NUpERUc2V1E0cHFTeFBiMHlWTTQ4bjB6YmRuYllvN0dlSWwwTVcrQkc4?=
 =?utf-8?B?bnZnckFtcGxUajB3Y05lYkhPOEZjV09WRGdtT20vN2NLRDB1NGNIZy9CZDRq?=
 =?utf-8?B?dEVsMEh6dlo2VnpwdGFNK0UzV3lmWm90SGJPNm9WTUZWdmJZcVFFRndrN2Q2?=
 =?utf-8?B?Z2EvSTk4dHhRRVFEcFdHUTVoMFMxTFV0VEM1azJFaktiVnZrT09CbHRHUXMv?=
 =?utf-8?B?b25YdnR4K1hBYncyUjc5ZEpoOGUvcm4rU3BFWW9pWHdpUjNRT04yb0tjUXl6?=
 =?utf-8?B?OXhUMitTdmMyWlJCcHQ1Rm9tTWoxeUwyTDlTOW1Dcy9ZWVVLMXRubGlmbjhS?=
 =?utf-8?B?K01pSWFuYXFjRHNGNG9ZbVRtMkVDTHh0R2dDaU9TS0J4dGszYlRMaDRBSFhr?=
 =?utf-8?B?L054VkNIUnhwSmJlKzNtYWRwcUxNbFpjWDBoK0ZybUNCTUZPRmtsaVFmQXpI?=
 =?utf-8?B?TVdpM3pwYnhKU1BQNWFJbHpabklnOWpoN0orVWJTaVNLVXZjdVNubmJLdVQy?=
 =?utf-8?B?SEtOOXMyVy83Y2dheEFNaS8waUJ1UWcxVllWOUM1U2h4YVRTZnlTVWs4eWl4?=
 =?utf-8?B?S1UvbnJid2N3ZS9qZUFjaks1MnY1QVU4Y2hHTTlyMWlWMmtwdFJLaUYwNy9j?=
 =?utf-8?B?Z2tNS2RQcVV5ZC94WW9EQk03OHl0VERJQjJ6VkZ4b2FYb1UyNll4dlV0NXMx?=
 =?utf-8?B?aVpSdkpaL1lta0o0UEhtZSt4anVPVkl3eUVpT09SZGw5U08wcHZuUUxHVi9l?=
 =?utf-8?B?UC92UFZMdnNtalFDQjc0ZGpWeWxzaFRrS3YvYzNRdjZpTDY5bnlVZitxQXdD?=
 =?utf-8?B?MjhaekRoQTNxMThCczI1OTlXU1g4QVltd2U3d3JHcUd5bU8ySHRBUDNoN2VO?=
 =?utf-8?B?OUhpbEtsOGFnM3pKSDVYZ1N6QUtQZkhvY1IrNlhqWjFtYzZqcTVmQUpvTmh2?=
 =?utf-8?B?bmdKakNrR2crNlpwVVkvNEMxU3BhbUY3bkFzVEhsdVg1cDFRbU1wK20zcjRi?=
 =?utf-8?B?OERNeWZsM0hiendMTGNabVVtUVBVWVJienMzY3NpdUZ4dGlCWjhEek9zbHFr?=
 =?utf-8?B?Q29reUF3SmdCK0I5bElCWmVjZVRZK3RjNTZtR01VL0pYYTVwR0VPU3d5dGZq?=
 =?utf-8?B?M1VvYW9ERnBFZkxFWG04QThvZW10VmtNL1RpdXhDblhBUGx4eUxWUDdjY0FP?=
 =?utf-8?B?Z3l3aGtNSnIyWCt2R2dPU2FMTlgzaHpLNHpxRk1zb044RUlGU0s4SFdqQ3ds?=
 =?utf-8?B?M1M2TFIwNkpoTFRQN0FMcU8xcEgzbFZiVGNIVnpOWWorNHRvZ3Z6WDVRNEMw?=
 =?utf-8?B?NVNCN2lPd0hWTlE1Nml2cmRBbnZhWlp2VGVia3FXMytHVTRhSTN3S01XckN3?=
 =?utf-8?B?NjU5eWp5Q0ttYkhqWjd0MDBpdmlxcndjTmk1RGpGQVg0aVRnTHVMbmdEWERX?=
 =?utf-8?B?YWZnaW1aYWp6bGl4TzlWY0ZBNnBRY3Y4QWlYSjJEQ2c1VjdabkdNNVM4Q1RG?=
 =?utf-8?B?WnNXSnpYUi9KWTFWaC9USnd1ZGdYeVAvWjZnSGJUWWpYSEMrWUdUQitLSU1B?=
 =?utf-8?B?aWxCeHFsOTdnaVlsU29pK1c0T0FzVm41MHdBVG9scEdETDl3S1JUdXErN29E?=
 =?utf-8?B?UXNQalliNDdoQjh4VjJIb2MxY0NpR0ltNXV0bFhCTEhVczJKNVh0WTBRUFls?=
 =?utf-8?B?Z28zZ2VBZUNlOGE4eDEvdms3ejU4OU0wMlpMc1pHUkpFSzYzS1VPb0JRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHJhRUdxcXFmY1EvRjlNcy9RSkg2RGN2U3p2L0htY0pPRnJMMUVmZVE5TjZa?=
 =?utf-8?B?dW9iSWxoNmlUamI0YWZJaU5iY0loSlpjcG9JMkxBczlvV0hFNzZOSW50U3Yw?=
 =?utf-8?B?YkZQZkpzb2VleDRtODNWRzUrTUt1K2dUMGIrTG1WV1A2a280bk9PUEZOZjha?=
 =?utf-8?B?TzFidW5vZFBtUXk0ME1Kb3RZbG80eXRYdUN3OE1ZcnI4YThsckdVRWRkc2JS?=
 =?utf-8?B?TldweFhjYVZCekZJZW1NODFhcTZBbVJ5MTRxbjJBSW5zWXBibkNGY2RkaGww?=
 =?utf-8?B?WHhKeFZNaytVaW9QQ2lFSXk2cEE5eGFDazhCci9FRGxWbFB1b0diL2NSUkVR?=
 =?utf-8?B?Rko3bVRnNGtIU0l0M2FXK2oybFI5UnhJSzlMYUJLaTJUZDFtNnZZUHBESHYz?=
 =?utf-8?B?eWhmSHVNeTIwSDljam0vcGxGUjhITnVYVnprczNobXo0RlIxOGVkUDNnOG50?=
 =?utf-8?B?Ui9zRHg2akJJZlMwZ09LdkswSjVTVWtSS0ZlZXZOZWQ5bFFxZjVSaVhCa0Vv?=
 =?utf-8?B?dDRFRk1GWHRSRkZpSDZqMmc1KzRGRWVLc3VYbGhTcHkvMFBPaGVKU3dFSDZP?=
 =?utf-8?B?MWFqNW1KSXRFYTdOT0xSQW84UjB3cldMWmY1WXhsYXVqMGNiVEpZVTdUN2E4?=
 =?utf-8?B?eWtYVE4xQ1RnMnRoQUd2K0tXVURWbjRIL2svemVTaWNPRjhkR0hwZitmcCt6?=
 =?utf-8?B?SHpSM3RaYXk0MWw0RVd5SkJOM3dvRzEyT0xiT3dVckhtSWtwNkNtMEJNd1Ja?=
 =?utf-8?B?dTRiMXA5SmY3cVdrQjRkWnRpeHlZajNnU1NTQnNXK256NmdGTUhmbXlJS0wv?=
 =?utf-8?B?UkFmVC9IcmlLa3g1eEhmbTZHbXZaNFUzYmppQ3lkMVR1Sk0ycVB0UzF5Z1pT?=
 =?utf-8?B?QTlpTG9KaUd1VTFtbXZMdVJKTlNpSHBkRDd6dktRZVBNRHBYazJyN3h3aXlo?=
 =?utf-8?B?V3dFaFF0OWV1eDcxZ0pwS0dVVTRXeFdGZzgzeHlwdGxrdU85bGhkVVZkcnRG?=
 =?utf-8?B?N2VVWU9vWCsxUUhUbHlwUW12eEYrdzg0bkdlaDFRcmt1dzBsalBrTUZpV0RV?=
 =?utf-8?B?d2xUR2Y4VnZ5ZHZwdDRHdE1zNWU5TTR1dzVDTFlUZ0YzRm5mZGUrOXFsQXNQ?=
 =?utf-8?B?T3JzR0NlSVNtZit2MlJXWTdyWDBpR0RRODNEMnIvREV4RThmMkp2NEJ2VnVP?=
 =?utf-8?B?UEM1azRWajBQUlpzY2pZZnVXRnpvb1d0TnlRNGlqRlhmdDNXVFZLTkZtUUNv?=
 =?utf-8?B?UTNEUFdIalJNMWJQbUZqa1lWRUhJNFB0UGtvNVdiamVGbWxqYXFBSkVqdkZp?=
 =?utf-8?B?UXVXdHFHVlpxSG51Nk9GaWJ2YzJJcitCbkVWb1dNZzFScWg3NktQT3BtbHBo?=
 =?utf-8?B?NU5JdDFIa3VSSkZSODdJSzEvd1E2M0haVmRsVjVkZnJUUDlRY1BHMWpIMHhv?=
 =?utf-8?B?Tk5tcFptaEpxSnlYNHZZMGFzaXk4WmZrQVFESDRlcTZGa1Y2WDBGanNwTVN3?=
 =?utf-8?B?ZzFiQU5mN2sxOWd2cE5EakFMNHJOa01iblNGLzc2clVLL0RJNU1TTlBBRTBF?=
 =?utf-8?B?bm5VaTI1OVBydTlrZ1B5b0djRy9HYVB6Uk9jN25JbVJMV2lvanV4SXFoT3Vu?=
 =?utf-8?B?cUpNN3E1V3lkemUzeHJab3l6NjMrNThrN0piR01ZL0k2bWN1ZTN0Q2htMktG?=
 =?utf-8?B?aDJPUjZDT29GTHBMUHlXcHZydE9yRE9SOXNnRisvbGVoeUxHTS9wekhLN3Nn?=
 =?utf-8?B?aWs5UDVodzZCZjBCVlpaN0NTOEFpWDU2RFNtbWdEbjh3SE9oR0NhUUZUU2ZV?=
 =?utf-8?B?WTg2OWpCdWg2YWk3eWdSTXVRVFlxeVZLakFLUEs1NFhiVG9lM3ZyYmFNUzUv?=
 =?utf-8?B?cEJ4Si9iaCtOM0l1WG0xd25rRDIwU3VOMm9Teno5MWxMMGwva0RIYlRQVFpC?=
 =?utf-8?B?UDEweThxcnZhb0NCWGx1QjlnSEdhUVF5Um5jak54eldZVjZ3WWRoR0NuSHdY?=
 =?utf-8?B?SkRnMWsvc1dhMjBXWXlydmFNV3ZkeENhRm9zOGV0K3EzNTJlNDJBMWxBZUhx?=
 =?utf-8?B?aFgwV2lMQzFWTlFDNDc4aEptdVkxMnJIWVlpQU15WlIzNGhxYmhvYitHS0Nk?=
 =?utf-8?B?R2RGK3lGM2lTNmpOSXYvUEtKZXVQY3ZZbG5YdlMxSkM3WG81dHpmb21uR0FE?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa13330-8356-445c-aa0c-08dc6d8536a0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 04:30:09.7577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lZlKS4MPIzmUxVD/whZYYc918OB3pvPOnlBcr8fXzmb8jRWp3HUi+T8d3SbjeVU6DFp8HBt7/I2dbd/7Q6X4ettv1SLQWCBfcyeZT6Sjpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
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


On 05-05-2024 05:04, Niranjana Vishwanathapura wrote:
> Properly define register fields and remove redundant
> lower_32_bits().
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h | 4 ++--
>   drivers/gpu/drm/xe/xe_lrc.c              | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 97d2aed63e01..7e1b0fd68275 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -44,9 +44,10 @@
>   #define GSCCS_RING_BASE				0x11a000
>   
>   #define RING_TAIL(base)				XE_REG((base) + 0x30)
> +#define   TAIL_ADDR				REG_GENMASK(20, 3)
>   
>   #define RING_HEAD(base)				XE_REG((base) + 0x34)
> -#define   HEAD_ADDR				0x001FFFFC
> +#define   HEAD_ADDR				REG_GENMASK(20, 2)
>   
>   #define RING_START(base)			XE_REG((base) + 0x38)
>   
> @@ -136,7 +137,6 @@
>   #define   RING_VALID_MASK			0x00000001
>   #define   RING_VALID				0x00000001
>   #define   STOP_RING				REG_BIT(8)
> -#define   TAIL_ADDR				0x001FFFF8
>   
>   #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>   #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2066d34ddf0b..f759f4c10914 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1354,7 +1354,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>   	if (!snapshot)
>   		return NULL;
>   
> -	snapshot->context_desc = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);


Patch LGTM

  Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   	snapshot->head = xe_lrc_ring_head(lrc);
>   	snapshot->tail.internal = lrc->ring.tail;
>   	snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
