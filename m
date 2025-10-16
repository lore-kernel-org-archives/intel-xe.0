Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A1CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 16:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE4E10E9EB;
	Thu, 16 Oct 2025 16:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8E1XwrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03E10E9EB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760631171; x=1792167171;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=VlL7DpDmPw9112pcSRfIuRjjjiyiAmncgnNrotK6s0Y=;
 b=J8E1XwrTxJH4TETPUkTacLruVWdDXsPZkQLufOwPI82jTbgun8SzRC6C
 MyC4gAZTYAVqo3vFcfhoPJNoiRnQh3S/bNPbvxMMQhgvCRqTDRf9jRtSc
 AjGgkdcAbZM6CSoFZIq0UV1eeGcZV+UDK4Q3N6DIU0x/Lcha4GFb2ZXoz
 yQkFqiilYf4GoKwdQFLckG20LLx6DQ22INAjpM6MczxIinLpKD0pZ1Ss6
 OW/4xOZg2QAyIFILwOzbDiEJ7/WEuZwbsHOnUfiHXlhE6ChxRu1Zijl5A
 75Mh2a/44tZenCZJWLfkTroJtnhNAw4jyIYxl1Ur8Ke222wo4qTFgLG8R g==;
X-CSE-ConnectionGUID: 4nMVkUeFRi233SrVvcdt0w==
X-CSE-MsgGUID: Va/Vlu+RToCPOq/2TRKSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62978513"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62978513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:12:51 -0700
X-CSE-ConnectionGUID: rdTvCrZnTq6NWdtOxZ94Dw==
X-CSE-MsgGUID: vmyL4pG4TfqrJvCxW48UuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187773921"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:12:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:12:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 09:12:50 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxQYzXOFlDuv8wi3MDNI0uwZssItudz6STZk+xTLoTxAPxbylOAdxQpCbGqZzqkVPoRViKq322eTnuMhtDCOlQZuCbgwhFVhu/X9l3fl8KEC5HxTxNJhVc3NQrLNyxfQUPzCm+E22PmZwz2qZH8xXFfm7+QO/VujdhS4vpVr2WvGG/NapU2OCWJ2xRckprJ2CEdmW6PeGHNmSRadpwW12NAnAD+NJPB3HMyqwLGkLkp3392NwtmpOl6H0zU+XPNx9wVJfS86dZuO/vIoM5VsiQ2vQtx8mGE16k5dPPgnYjQ9MMonaKkzPnpEIpUdOPPCh7H5Ain8iavlYqg5EEnQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMXNEXnNYJjUcJdsswTMx+g3IceOaxzr99nGGXGv6ME=;
 b=xkuUXI/6GLDrZ54A3ol/aMoaAA36mw//LeIt/kuZZCXRp2oZahJtrrZ014QPkjHLjaaJKYXxHVvXAEDVIvl9WYJx99EuZnSBUfBDp3CWFx5k57ZEnNDS7is+xHifgnMhTXtotajQKEzoA1CYYZK2WVwJAzyPBgjH9WEtqGmwqdgwZkTWM8YA8lHoaTLNH4MlJ0uQ5v1qF8AViAr2Pv81xeOy5g1LRj4zJgmXgMvpvWG3xFBrj+0Q/R52cH9C2TMitgpl0SdiHANBramYpyNiNrptsijjii5S6QUrT7wyyOY+dWQCe5Z5AGYLzeJYwZ423W5KgzRuz4oxetD3PpiD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 16:12:43 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 16:12:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251015-xe3p-v2-2-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-2-b9189b3056a2@intel.com>
Subject: Re: [PATCH v2 02/22] drm/xe/xe3p_lpm: Add support for media IP
 versions 35.00 & 35.03
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Oct 2025 13:12:39 -0300
Message-ID: <176063115926.2362.9050946848447442178@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b45971-3488-4bee-8742-08de0cced664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THpvNDBWZzZlbEQxVWxvSHJBSHkwOWE0cUpsRDZGcE12L3F3ZTZSaGp5dVZr?=
 =?utf-8?B?RmJ2cXF1T0RsV0t2aURLeE9HVUlscmlPVUREUGltdGsrVnpHNGdaNmV6M2ZY?=
 =?utf-8?B?enp0L2x6VTNFSDV6MUZ1OCtUQ2VRMUZyMzVPUjJBclArVVFHVE4wRlQ5VUZx?=
 =?utf-8?B?Rm5qRllua080WFk3aGFPSXRmb3o0TkJGK3J0REZlREQxbnE5MXh5bUt3RnRC?=
 =?utf-8?B?YTJrZ0Fna0xFMjNKUk5xU0EvUHBIRkNpV3BPNnp3Slh3aWhUSHgzbi8va2Nq?=
 =?utf-8?B?WXZsbk4wV0JSSVVZUG9LRUdtQW14dkxiSkV2cisxTmRkN0l3dlFsbjJtaGxr?=
 =?utf-8?B?cGpWZ1F2N2xzNm40bDZOSFRLYjBaM25WRFpqTEpkTUVlL29kaHNIUUJqWFpy?=
 =?utf-8?B?eDZrMHJxK2VhQ1FhOVZFY1gwb0hhRk9uWTlaRURwTGRuY2VlRDRsN1A5UkFx?=
 =?utf-8?B?V2JWeHhKdTFXNDdJVWF0Tk5kVWlJaVR6SEN2bTBtb2pIUkdUVWQrblRmWGJz?=
 =?utf-8?B?UTV6LzdkaC9vYVdEVFRjcDNuY2lRN3hIN3R4VnI2c0t6WjQxRE96UFh6dWww?=
 =?utf-8?B?ZEp2cnJkNGpXRnR4cndwSHhZa0ZpSDhCY3ZiSVA5UCtPRXh5SFdtWC9SUEsr?=
 =?utf-8?B?b2R5UHZITzc5alJtYmdBZU1nZjFZbldlZkpwSUhMeWpOOEZnSkF0cW9USGlv?=
 =?utf-8?B?VkFUWXNxcTFGNmVYNWoxWVF5RWJXYTllVzJ6RkNOVDNGaHdmRDVlWlphNkgy?=
 =?utf-8?B?UXBxY212bVBtTk9TQXFoSm5Nbjk0cFpvSnVrSE9WVmpFa0EvYTJSbFp0VHg0?=
 =?utf-8?B?UVFBdmNHVlQxeDQ1U0txVkduVENzby9lenB4anJEQjFmT04zVTVvSGovVWpo?=
 =?utf-8?B?NWhyMVhQVlFFUnVoUDVSMkVwYXI4UTBaZld3VVRaVGNhM1Nmck1tZCtjSjAv?=
 =?utf-8?B?amc4cVZRaGdZV3dXclpCaDE5bmpXSkFWK2MxK0lURnBUUHhsZERJQlp2N2lJ?=
 =?utf-8?B?LzRaN08xOS92eUJibndpRUNiMXNlbjcyV1BLY1hYZzYyaDFrTmFXOFVGMEdY?=
 =?utf-8?B?OGkyZTZQSkY4c3llaHlOY0NVVzQzMDY2WVcvdlNYZXNpci9BL09ma3BZWkY2?=
 =?utf-8?B?Z0NSNlJGT1lxWS90ZmttRjJVL2FDR282VXd0d2pQT0krSmlMWnRIdFpabGt1?=
 =?utf-8?B?eHoyNkRBNGltM21Jb2cyS201VC9oWTdaa1BkMVNaeUNnSTBpbWl5dVpNNmVT?=
 =?utf-8?B?YXlxYnVCRjNORnR2N3crb3pjMW1iOThHdExXY3RKR0I1RmdEdzcrSFFCdXRr?=
 =?utf-8?B?TEtFSTJFK2JxZXFiN1N2OVloWFZOWVA4eVJURW1HL2lBWWhFTVBFdW5JdmRY?=
 =?utf-8?B?LzUrNEhIQnRISjVqVzYrdzgraVdoQkFnZkROdUlZcjNJVTBKOHpIRWlPdGdp?=
 =?utf-8?B?WnFzMnRpS0dlVjVGQmk4aENkNTdGL3ExTjVqb1lsMWp4QTdnaTZuaHVsalUv?=
 =?utf-8?B?RUxHbXp5b3FwV3dDemdqbStzeXJhVUZ3ZlBQSCtGT242VGNOaTQvRk5RTmtE?=
 =?utf-8?B?ZllEbXdWVGVzemxhRGZsUUtIZXpFYkFEQm1IaHVxa1NzUDhVaVhoQjVGdXRU?=
 =?utf-8?B?WFlhVXFpQzlJQ1ZrSGZPT1ZtYUx1cnVkeFhpN1o2STVrSnkwbnlnMExiRFVL?=
 =?utf-8?B?eWZVQzMrN05XLzJYYkFGSlNrb0pHMGJJa2JjdDlxNnBsS0ViR1U0Z0tDd25C?=
 =?utf-8?B?Znk1NXBBUkhzNFdoVWlvTGI1QjJLS3NHckMrUWFGVkpkTkF2MS81cEg4R0Ev?=
 =?utf-8?B?K09KMTlCRmI1WXZIY1d5a0xuZ0t6WVNaR2Z3Vml0S2ptaXgycXZjTnlnMXFX?=
 =?utf-8?B?NjdWdTlOdlR1Z3FueGRNUVZSUUlCY1ZFODhoUnVXUFRMQTloWkI4Q01zQXdU?=
 =?utf-8?Q?KuhHWcnD7MvN7/75vNRLoDPccEtT9XXE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXY0VTEzVDZRRkltbmFPWldHYzkxOXZKeEd2WVF5Z3c1TVk1eFB3QTRSOXdL?=
 =?utf-8?B?YlVZNGZvZCs3eXAyODVoOFFUZTlhenBxTlc5dmt5bFlKSlFReC9EUC9nV0Ro?=
 =?utf-8?B?TXFHbUZ5M2xXWmd6UWVOOW5NTmNtNnAxSW1Na3lqcjc1MUtqU1Mxc3lOU2NQ?=
 =?utf-8?B?NnkvcUcrY0lhTFAxOUtUanNrMEdTMUlINGNiNkNYOEkrejJKS0NjSG9wZ21k?=
 =?utf-8?B?QmZWWjBtMzVkZzl0cU1TdTRBS2RycHNWWk5CWEw2cVlrby9pRHdOR0tEL2ho?=
 =?utf-8?B?eG53d052bXorVzBOaml4SktFYmE1SitsWnJZd00wc05ZRHFnMHNPL09TNzhI?=
 =?utf-8?B?VTJYWXhmNlM4a1hBRjRlOHJQOE9xZWNlb1FPaTM5Tit4Z3plWjdoR0pKTUNY?=
 =?utf-8?B?NjRBNFh1U1ZmNUZqdGFndnU4QllDQkk5ZTlRTWVVRkNzU3FpcUNuam5oZk9F?=
 =?utf-8?B?dFdPcFAzUUxRWXltVWxEK2RsZHc1ZXRHU0d1OGhCbDJ1S1hrMDZ5dVFLb0hQ?=
 =?utf-8?B?QklpenJQRnFwc1NiTXZib3o0dnBDOWJJTXFtWTVxU2k5UE9xdFdIa3VGZmZk?=
 =?utf-8?B?OGpvODFsWGJ2TDQ1djArRzdQQXFYWEJOc2haK1JqNE1qYVpjUklwaHFMd1Bj?=
 =?utf-8?B?c2NHd2o3dFpmZ2V2aHErZzNCSzFZTVRlZ3FOS284N05IR3BBY0dpZUdmbTRJ?=
 =?utf-8?B?ZzJWQndKNXM2cHM5NDdmaGxBVitNQmFmL3hiVUpoaFpxOExZckVhcEFWOVFm?=
 =?utf-8?B?YUhGc01JZk1ZdGNWaDlmZDNkWTVrV2ZySWdHNEUvWElvMlFBQUpCT0R6K3Zw?=
 =?utf-8?B?TDZHbmpqSTlaUU1sT3VTR2pxelY1QytFMDN1Mnd1NGFOTUlBcG03YkJkbFIz?=
 =?utf-8?B?ZXJPVDBxZkkxMzVxUDBydm1ZSVpWN3prcGFLT0NjTUpnNVRvZVBUTVczZzRX?=
 =?utf-8?B?Rk9OaFA3a0NrVzkzQkdLN3V1NDlFaDltOFBNQ2xlRUtCY0llOXZ2endSWkdy?=
 =?utf-8?B?MW5yeE5vOWx3TGFuWEI3MXlFYUZPd0xLN0RxRDhHazBJZjJLK1kzeDZ6aHh5?=
 =?utf-8?B?aFlpSm9IRG9PcnFCb3BuRXhkam5ORzNRZEdBV3RxOW5SV0R1aThma3RtV2p3?=
 =?utf-8?B?ODhjQXRwMFQxSEk0VkVBL0FJTHhQZ3hyQVN4TGdsTnkwcmVZQ05ZNjlHOFBD?=
 =?utf-8?B?T3c2S1NQeExqc3JOZHl5LytTZk1jT3doRGo3QmlSUCt0YzMrT1ZBOXphZlFT?=
 =?utf-8?B?d2ExM0k0VlQ5SGpZMERDWHB3dHZSVUwzZTZoQXIwOUwzakFOSXh6M3JTeHAx?=
 =?utf-8?B?N2o4S1RkbExkUzRwSVY5QWlrYjl6eG9FMFpEZjNTb1QyNm1HMFh4SzZMa2hY?=
 =?utf-8?B?RjFQNXJKY1QwMEgxb2hrVzd3MGkwZVZvY0dvTFVOTzg1QmNJR0hqN0tLY1JU?=
 =?utf-8?B?dkhkaDlRb0ROMXRNY2VyUmVzZlpCSU93VDhmSzZXb0djSWsyZnd4dzBqcGd2?=
 =?utf-8?B?a0lKeU9BejFGL3pEd1pzOXNxNHBZd0M3UFB3bWR6VW8zdUxFa2N2TTA5akVs?=
 =?utf-8?B?SEhzYkNKWjNmSjBOQzlyZ2JSdjBhSldSSWRtQVlMVWNYU0J1MGlXQ0V1NHFs?=
 =?utf-8?B?RjltV2ZNeUViRkovcXgxTnkvUVBxN1FTQTZiSHhIdDl5b1l1MVFLOE5Uc1p1?=
 =?utf-8?B?andZb2oyTlI3ajdnNmtKL2szc1VDWkVOb3VDT3JORFpaM2o0QnhMZTZBSHZl?=
 =?utf-8?B?NGJrSWtiU2NCV0ZUbHlhVTNNR25Lc0UwakRhTHV1MERyZXB6VkhxazlPamMr?=
 =?utf-8?B?SDRYQStaTlNYT2t5bG8xb0VvQ1loLzdUSGRxNlUxYjlUTzVVYWlmUERZbmtq?=
 =?utf-8?B?Q081djdkRGZDUVBjWGpsM25kOTNmcm4wZ2dKanJTTXJ1eDBGOGRCMmtaOGp4?=
 =?utf-8?B?N3RvT3JVTnAxRXpJRFRWbS9zWkdvT3VSYWZoNnpkcktlTzFQVStoN2xkZWhh?=
 =?utf-8?B?eVQzNVFQd1B2VElTL3BsZGpDMHlldHJ0bjI2a0xJVjhzd1huRTZTbXBtWVA2?=
 =?utf-8?B?QkxxS3BjdFdwSjc1eDNxSXdtMDhJSW5ZYnNkRmtKcWh1UEIyV2s0MkpFVzhJ?=
 =?utf-8?B?QlNLK1RlYTdOTlljUDJjb2J3RWJpWVQ0ekxZUHZVaVR5RzVYdUJmR2l2OGVQ?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b45971-3488-4bee-8742-08de0cced664
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:12:43.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4k0r+owOzJJ/DDOY5Te3CqcXb+jA1nOxtP/e/2r7eu27Yw72JXInqUKYrrIPifteQlE3+xDTLDJa+O1wF3Zqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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

Quoting Lucas De Marchi (2025-10-15 19:06:17-03:00)
>From: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
>Xe3p_LPM is very similar to Xe3_LPM on the kmd interface, so it can use
>the same descriptor structure. Add both 35.00 and 35.03 IP versions.
>
>BSpec: 74201, 74202, 77977, 77979
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3ea8ccfcbca55..b72f71b0f52c9 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -151,6 +151,8 @@ static const struct xe_ip media_ips[] =3D {
>         { 2000, "Xe2_LPM", &media_xelpmp },
>         { 3000, "Xe3_LPM", &media_xelpmp },
>         { 3002, "Xe3_LPM", &media_xelpmp },
>+        { 3500, "Xe3p_LPM", &media_xelpmp },
>+        { 3503, "Xe3p_LPM", &media_xelpmp },

I believe it should be "Xe3p_HPM" for 3503, no?

--
Gustavo Sousa

> };
>=20
> static const struct xe_device_desc tgl_desc =3D {
>
>--=20
>2.51.0
>
