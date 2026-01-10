Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0BBD277CA
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 00:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE45610E07F;
	Sat, 10 Jan 2026 00:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPY4iN1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA76210E07F
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768003792; x=1799539792;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ciWwgwDQSRymVMeLEfvijWrFVrhOLcbwyjCr/ujkH4g=;
 b=OPY4iN1hhmJSx3ec3FZ/X8SyiCjh+hoFGUY8cA+VFppcfrq4PL4C9jSA
 6qxGEzaHmmUqX8tEwfNhmx4SgkhLIhDBedvFprzCjgMtoGm3zfO3Y0Hzy
 ix9v818scSfVtUzvsUvF2fgLfyAO9jKDDJxn2vXxpzNWpBSZ+lCn/R/zz
 20lXJzH9FkNwepdbro0fvG3gpZwhU9pyCO+33HjhwCC3RfytjCZwsN4HT
 2Fqz3ceg9fYFaq8BNEMRmQJQLVv7vL63NBcUh5D3ogHzj+YRblySw/Eol
 St0Hq+awQh0E+8C6WT2EaQ2XqBwBVv/a/pzk6IS/iD91UAo9NAPC63rY3 w==;
X-CSE-ConnectionGUID: LD+loSVMRIKaNAYFoGdXTw==
X-CSE-MsgGUID: YsyxlHNXRBanBccFXL82bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69315662"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69315662"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:09:52 -0800
X-CSE-ConnectionGUID: mJRW5mPaQ2uATQtxQ1kxqQ==
X-CSE-MsgGUID: tvSsIDjVSgiVaIx6EZTijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="226942211"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:09:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:09:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 16:09:50 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:09:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsUSQFzJCxNtmrKlZFKjviR+I6mndau57fSDT4o+yuSQFTXVIbVOlSPqoQOFOZmiHl4HUnPI7tQIXiRWOTnzUpDCJeR2GCWmRS4iHDAoW8BNliQ/L9iHbaeCYlHihYABOqv3LZx+tuUlZSxs+ZjA07zTiTPKDbcjC3YEJOD2h5SoAE5jkSEuLH85LO+kEirb6BtGC3evMQtzYOAxD23PMO+kSxR/x1AJZKz3YTz/xP1VExT1lJ6iQhp/cEG5rqw/T92WW7CXGQ74ulBjjaUgWgjomMNj+7KO9mBIrttTFPS7KnH70mSMhJRJ4c+tNo4DItHkILeUVvQS6L5qf5Se6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlp+AHDNa+15XgPzjFKvzgZU+nXblBBPFuBRy7R6QVE=;
 b=f8PLVoi6V3x3EpvEjLRthDC5eMULUPBw5segwyq2sYiIWpFl3DjsxWmZZDaKB995SM5wJMwxXHYnfvrV2tKs9QNB0TS83Dpg4JparK42XjiXEvvDHchNy540JHqnWKjpZlueNGjpm1EOZ+1V9/36DBqQtCdwtjGcvAwlwdfr6dlchEbNiKMKMM/8t9jDkMCKFneo/jfuKG5mpu1ob1X2erSXg8IjU090CUjiMcBMjenHULTX1eWRAm1vwGaKo3GLok7Qlbf/kh9D3iyZ8oaBj1IDmLu3vS4dymMfpjnUY1bIg+bk/Y/o4XtxatK41zoxamsy0EmwW7wMvyyB8TJA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 00:09:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9499.003; Sat, 10 Jan 2026
 00:09:48 +0000
Date: Fri, 9 Jan 2026 16:09:45 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 2/6] drm/xe/sysctrl: Add System Controller types and
 structures
Message-ID: <aWGYyTsMy/44MOd0@soc-5CG1426VCC.clients.intel.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-10-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108120548.1015154-10-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:303:8d::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a85c644-f414-4c08-c125-08de4fdc9172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEkvRHdkemRSNGY1NW02bCs0eTM4eFU5Z1g3V0xhaXNGYmYvYTNFaDkvZjJG?=
 =?utf-8?B?K3lub0NHN25kUlFEbHBYbnIvaG5idUxISmhhdzdaRmlWd1IrQnJocU9aUm5r?=
 =?utf-8?B?c0UyRDBZQk5zUHNEVnJUNVJqUmtqYTVPNXpsa1RHakszUVliQ0c5RWlFTG4v?=
 =?utf-8?B?YTR3dTNwbllFR0gvd0lwYXhxL3QwcERuOXpmTVhXY0JnMTU1TVU0ZGp3MWdt?=
 =?utf-8?B?enZMWC96WUdneUxsejlRdXlSbjBWb2wwcklOK1M5WjNhdUtpTzdXRmV6M2Ro?=
 =?utf-8?B?eTJHcHJyZGlJZ0FBZFBybkNYUGtTenBHWUtaREowVk9jK29icExRT1Fvb2JG?=
 =?utf-8?B?aWR6eHhnWVN5bnc0TVk3dFYrNUVHU2JmZkZuMHI4L0VmOXZLSFhUZzNHU084?=
 =?utf-8?B?Ukd6dHZ5Z1AzY3NTSUlFZHdpMFFpK2xoaHNJZm1mekRzMnZYNmM5VnRiWlFr?=
 =?utf-8?B?VjU0MHJ2Q3JhbndDelp3enh4dUFrcXJwYjhXZmtlL2loVmNuVDVWaVluNUdw?=
 =?utf-8?B?OHRXaVhyN0xNRVFtQmhKMkoxMldDTTFEditwbk5mQitaNlpnSE9NSi9mMFRT?=
 =?utf-8?B?bnMrYldQNnVoTFhmQndDV0llVGhGY2tjTnVnOXM5NGZpcStQbnFRbUJScmdz?=
 =?utf-8?B?OVNYWTdDZzZJN1REVzgyR2tRTHBWbUZBbjNDaE0vQitIS2NtVEUrd2JBTi9M?=
 =?utf-8?B?T09EWjIwMUJuSUpzNTR5YTFuNGNwNEVCckJkbVM2YWtCcFZuaGdxeXp1WXlL?=
 =?utf-8?B?NmVRYjd5SCs1N1YvRi9VVDhNYTdMekdncXVpKzlPeklQMm5MUk44RDNmQW5M?=
 =?utf-8?B?ZU1SREJ0eUJ1b2VFa2JGd29vWnd3OEZWWG96SDNPRkd1bXF0Vmt2WW5MMysv?=
 =?utf-8?B?c3dwRndOSUpiY2p0ZlgrWFJmY0tUWHE4cHVCOStLL25lWW5ieEJzU21TVTEx?=
 =?utf-8?B?YW1QRCs2T2tmWHVCNFNqOTY4bS94VXNuQjNDWC9xWDkvRDMyS0Y1UllQQjRL?=
 =?utf-8?B?NDFSQk50bWx5ay9yMjIwWWNrYWxuZ1NPOFB2N0g2ZkxvaDJodXZFZTMyNUFG?=
 =?utf-8?B?andrc3dxQUt6KzNIWXJ2SEF3Q2l5REEvdkZyeGE5cVJTZ3huckplZTg4enlj?=
 =?utf-8?B?dkxFZThXaHVvUXJ2NzYxcXorc0JCK2ErQ2tnMXJyOTZpVTJEWUpLNnhqU2Ny?=
 =?utf-8?B?QnpXM3NseGRidjRueCttRDh2dHlFa1JnU0czZEI2MUIzeGZuOE9URUdiVGRy?=
 =?utf-8?B?Zzdic0VIYk44aFZHVnA4NjZ3YW5MQUYvcmVlL3dkcW5pYUZlazIvRUdBUURq?=
 =?utf-8?B?UGg2ak5od0ppR1VzVXdsZDE2WGkrUGZSUEFJcjh1UGZnVHNSR3RJaXFqUmVC?=
 =?utf-8?B?U0dpcndteHpFRkVqakU5Z291THpEYjZ1TWRwbXZVOUFybVYvMzZIQ3ZjcWtx?=
 =?utf-8?B?MkhNZVVvYWl2KzBibFFLekNmc2tINitLZ3UxOEdHMVRrdmVEbm5VRHZwT0FO?=
 =?utf-8?B?WERybWVQbFZxKzZtbmx1NnpLV25ST2tVWlcwNjNyNEFrUEJvS1c5clBLN2Js?=
 =?utf-8?B?c1NxYnZjcnRXMDBpMUVDOVp1aTMvSllVMUpCb2RyR21PUXZWR0dkZVBvYmVN?=
 =?utf-8?B?dW45UExLdk9yR2ZHbjJjV0k1ZG03NXRGZENqdG51S2RvWmN1N2FpRXJvQldq?=
 =?utf-8?B?VEhXdWVEUklxeXdCenhBUDd3dWZMd3FhaVRoeGpDbGJHZjMzckJDK0FBbWRO?=
 =?utf-8?B?R3V1QmFNMU1wTFdMalVPbDlLOXBtaEFFZ0hnM0lhWlNCSVUzNEo4cVFaZG50?=
 =?utf-8?B?VmRpV1hwU1E0cG0yc3RpR01pTkljcXJjSFRZZXJLdjJNV0xTZ21RY0VadWxW?=
 =?utf-8?B?YWljRERjOEIzZVV2dWFadzF2SlYxVnBwalNacmQrV05sblgxTUZRNktCUUtt?=
 =?utf-8?Q?ffe04Ljyz+oWztU+Bh5Mdl2+I1JLN6Oo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1lLcGpoTnAxdWNpbm8xSEhocnJSWUEvTDJmdzR1alBYdCtMOUFCQ2YrYS9N?=
 =?utf-8?B?K253dVNhTjhUKzZLTFB3Y2R4SEJqaXdkYVlBMjZJTXRYTmlldVNJLy9SZjRo?=
 =?utf-8?B?TmNVeFJ5dksyc0xtbkh2ZVdtRzYydWljcGFPU1ZLOWkzQkxhQ3pkMFlDR05K?=
 =?utf-8?B?bmxsUURJbnlmVmxnekdFSlBqTVcyK2o4YzI5encvalEwTG5RUkc0R25OUCtX?=
 =?utf-8?B?QkZwVFJaUkxXZFFnUHg2dkRHZXJNNUVtVmlPZlB3NjNGQ0dNTVJlRHVmcm1o?=
 =?utf-8?B?VlhKOEQrMkNTdmJLeHNIbG44Y1FLekdTWWtXWmRsRDNqT1RXdmoxNDkyUXBV?=
 =?utf-8?B?bGxjRGNkckFXNmJhaHpGVHU5UlViRGFROFIxYThyVVhDRDlkZXJsa01UTFFT?=
 =?utf-8?B?YnJ3WGpsVk1UTnhDcFBqVFQyYWxjcVRFRWJFdmJxZ3cxalYzS0xWOHFLV3hI?=
 =?utf-8?B?YlVDR3hUSUh3aFJTb0l0Qm1SWC9ZYmZRcWtxZngyOUVsajFoRW5UQkhpb2x6?=
 =?utf-8?B?Q29Td2ZTK0lpZWNRM0U0b3phdDlUWlNtd0o5Y3pTamNNQmxzaTJxR1RXZlVn?=
 =?utf-8?B?eERQS3FOZW5nNTlTVFRDR3RSa3pNOTF1S0t2M0xoR1l0Z3Q2bVVXWWF0Mklt?=
 =?utf-8?B?aFpJNmkyTTNFTW5lZlNSdXFoMUlkT1NXcWZISGpiRHJCVm9Yam12RkUvZ0th?=
 =?utf-8?B?cUJKRGNhMmZCeTZaZDhkd3NhbjBSODZ2NFE3Z050aTFIeVpsTnRzbllIVW10?=
 =?utf-8?B?VGgrdVNLdXpRYzIrSXZqdVdPZElDd29mN01lZEdmUjhQb1JqUzBUR2c1YTFG?=
 =?utf-8?B?dm9pcXA1eTJKOEFjbXF4a3ZTZ29WVkh0SmRkeFdXdEpqSFpXa3pmWDFyVm5l?=
 =?utf-8?B?NG5JS29ibUM4Q0lxYnFOUTNXbGhOT1pCbmJWY1l3WTArUGVQTE81SmNFNW5S?=
 =?utf-8?B?S2hSdE54Zjl3eThOanZ4WEREN0k3VC82T0xjRVI4TXNmNWVlTFo0WCsyV2FQ?=
 =?utf-8?B?T0V2akVORE5kaWxTWWQzWEl2SGxZcnFBZFFtYXI3ZFJ1RWhRNUZ5b0ViL0FT?=
 =?utf-8?B?dzJjQi9oVjV4blNhY2xReWxFYlJyVVhIWkFsd0xkSFNSREp6V2R0KzNiTDRG?=
 =?utf-8?B?aXZiRk9TanRCN0lNWjllTDllNzVsdElkalBsVFp5eUM3cWZGNnlBOVAzc2tO?=
 =?utf-8?B?MTJBS1Y3cE1abE1mNHJhWHF5bGtib05USk1jTFkrbndhT0pERFNDMWJFRERy?=
 =?utf-8?B?VFJRa1hMSmR1OG9aUWNBZWZPdlRhakVTOEtkN1M4R0FUOXM3NzFTclk1am9Z?=
 =?utf-8?B?amhXNlZnMGZBS0xwRDVrN1NRZnE0K0RXdFNiY0ViVjE1Nll6UlVtUkh2SXY4?=
 =?utf-8?B?empaUEZpRFh2N1R2RWZUck02QW5iWUl3ck5lS3BYZ1dCbXBwM2EvdDhYMXoz?=
 =?utf-8?B?WVNhblBPdktVTXE2eFE5STVlZGc1UEt2bG5aS2Z2RmNBNFZWMTFnZXNWRWRX?=
 =?utf-8?B?SDZUejZOTEhFS1NKUzVONkhqYXRnL0E4Z1RJcFltVFlSa1FocExCeFNObUcx?=
 =?utf-8?B?blcxTkZtekkvMWI0ZThZS1pSLzFNbVMrRm1pUHU2M3pzWVp4RU5GT0p4bHBv?=
 =?utf-8?B?cm42WFB6YjhWNlZSbUcwczNWcitPZmNRdjBzRmtxV2JuNklobUxNYXRwMDhk?=
 =?utf-8?B?T3NyV1F0RVV2NUZNWlZQaC9ONEh6bGF3NW56TEtBUWxHS240T1VaQ3RYOXhJ?=
 =?utf-8?B?K2tON21VTUNRM1RQRWUrdjlQTjl0VitEeFAySkFYM0p4VVQzRWNwRDJHdDhJ?=
 =?utf-8?B?cnNTdTdrcUllK2owckNycWd1TmRBMWpnejl6TVdaaWNjc3haWjVjR2NyazZ0?=
 =?utf-8?B?K0RpQUZ3ZmlteUpGMU4rWHJKanFycjQxMFlESHhxUFJRc21ON0wwMCtsbmRr?=
 =?utf-8?B?U2VqdVdMQkFHbEl0bVJFQmhWcVh1dXJhck5GaFJuT3VZa3NNRVJhc1k2aUFH?=
 =?utf-8?B?QVp5ZDJxVUhabVRCbVNpSG0vZTJCcFZ4ZmVIZkJwWHcxZTV2U2lRN3dZekFL?=
 =?utf-8?B?cFZRMUxyaDlBTlhNZk93YS9aNktPeFZWM2xkcUtva3hhdmpvck4rdUxpOTFV?=
 =?utf-8?B?Tm4yVVZaT2V1TEV4ajh2b0RpZ1RzZUNSdklYMVBmdTVmWDhuT2hYNzIvenFm?=
 =?utf-8?B?T0tnQVBmRGxVTGNwVXFTdHlpRjd5NlNDdFZ3MThYdmFWMjAzY3dMb1pFVGkr?=
 =?utf-8?B?Sm5waG1hWi9oY2V5SWxOQVNHVGp1QkNGM3BaM3dvWjN6RmdHUW9WbGJqTTJh?=
 =?utf-8?B?ekNhRHA0Rk1GaFhhM2dSQXhhS1BjRzVhNHhsU3BwOFpUSC9Ka3ExcXFGTG1R?=
 =?utf-8?Q?kOHUH8z01QeXGie89FMojMZfa38GNl1PZRdyx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a85c644-f414-4c08-c125-08de4fdc9172
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 00:09:48.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtPTm3iMsXUg9qHsYS8HaugZVxSIp2VS1ePI6ETQz0Om0/C5Omi6qBkOivXEiG4JjARunFF00t2J9RoR39Gc3ricv9IWbz6HQXfVb24YKgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Thu, Jan 08, 2026 at 04:05:50AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add type definitions and header declarations for System
>Controller mailbox communication protocol.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 35 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 36 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_types.h         | 23 ++++++++++++
> 3 files changed, 94 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>new file mode 100644
>index 000000000000..750b7528bab2
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>@@ -0,0 +1,35 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef __XE_SYSCTRL_MAILBOX_H__
>+#define __XE_SYSCTRL_MAILBOX_H__
>+
>+#include <linux/bitfield.h>
>+#include <linux/types.h>
>+
>+struct xe_sysctrl;
>+struct xe_device;
>+struct xe_sysctrl_mailbox_command;
>+
>+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
>+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>+
>+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>+	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>+	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>+
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>+int xe_sysctrl_send_command(struct xe_device *xe,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len);
>+
>+#endif /* __XE_SYSCTRL_MAILBOX_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>new file mode 100644
>index 000000000000..1f315ad1b996
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -0,0 +1,36 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef __XE_SYSCTRL_MAILBOX_TYPES_H__
>+#define __XE_SYSCTRL_MAILBOX_TYPES_H__
>+
>+#include <linux/types.h>
>+
>+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+struct xe_sysctrl_mailbox_app_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+struct xe_sysctrl_mailbox_command {
>+	/** @header: Application message header containing command information */
>+	struct xe_sysctrl_mailbox_app_msg_hdr header;
>+
>+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
>+	void *data_in;
>+
>+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
>+	size_t data_in_len;
>+
>+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
>+	void *data_out;
>+
>+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
>+	size_t data_out_len;
>+};
>+
>+#endif /* __XE_SYSCTRL_MAILBOX_TYPES_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>new file mode 100644
>index 000000000000..88a34967688b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>@@ -0,0 +1,23 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_TYPES_H_
>+#define _XE_SYSCTRL_TYPES_H_
>+
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+
>+/**
>+ * struct xe_sysctrl - System Controller driver context
>+ */
>+struct xe_sysctrl {
>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>+	struct mutex cmd_lock;
>+
>+	/** @phase_bit: MKHI message boundary phase toggle bit */
>+	u32 phase_bit;
>+};
>+
>+#endif /* _XE_SYSCTRL_TYPES_H_ */
>-- 
>2.43.0
>
