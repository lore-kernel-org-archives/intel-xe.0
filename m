Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16543D17122
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 18:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C711B10E033;
	Mon, 21 Oct 2024 18:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frmPluEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E0B10E033
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729535232; x=1761071232;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=csRdLo8No8W8PyJXJCHiDf5gWMvmoqfnMXpTkZAghOc=;
 b=frmPluEncY6nofnX/CxXb97DEgUZmU6HlBFELCa/5Qmtl2rUB34B0AYA
 i5sESeA0M+3piR488+nDSZW7WPlDur6TCvmnaaqBpjkOJIAG33y+R3XEp
 9zJAXqHzwVUb1xQr655HWRDS9Ib05DMygHEu/Fpy/fjpvs5I1CHdi7EDl
 v3ihTeUY6Cynp4iREG5gtswyvGmgDfz5uzTWqSt5JeikF5CObHD7rK7zo
 kXXR8qPIqjlKLQwhrlp9HoiH0pNPdorFpjUr3UZ69bnVT6Kq89n3EDAKK
 cdx5+klvKEVSKxZBOpBRNWgJK7Dl9EiA4VuZZ4mMIW00PUuNSQunZnBqF g==;
X-CSE-ConnectionGUID: 4OQw0dgLQmGPpQFLsFBm6g==
X-CSE-MsgGUID: H60x/5DgQs+gEZY6nMZ1Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39653526"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="39653526"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 11:27:11 -0700
X-CSE-ConnectionGUID: T5edQfcHTleUTyoBJcZqCw==
X-CSE-MsgGUID: F66JnVcdRaSU++FKlM445g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="102916591"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 11:27:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 11:27:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 11:27:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 11:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LytWv2K+cu94LQaeMYoAlHMp71QjXHoLSZFwyIZkaOZ+fSl45dpZb+XjEgcdeYla/DJpHGSxLKB/hbHlt4arPa8WXIxBIBoNJRxP3P+sGG5zDQ1hrQ6haVQGn2UR3vvtXdAxSxf9BcJLgo2uwi09Wy3Cx1sbckYKmni/tWoTB0XXJlkslegi34SdJLeqsYa/Tkiw4ATFpLgMwXn0hUrn7D2IPxbcaTnxMmzLzZjKAFyPNDidizjAGgprVn2sFQFFMRQehrsjI/p8uKV00AwXlrVHHN2AJ0P6vpXw/6YMWGbMaelRlV1tvdzLa4UbYSBi39N7XW7xFNQj5x5r206vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csRdLo8No8W8PyJXJCHiDf5gWMvmoqfnMXpTkZAghOc=;
 b=AHtID9rHLESt3rn5W7KQ5lp53lFXRf+U6T8oNYQWMnTdZGHsxew/jY/ZYM2yzFWZtMSbo2TnrCZzrl/fDmJokwsQyrsCWZzT2f8UwCLczWIrW/sRaXlDr3brcUDpQ06nHZH7hMLimyXb5v7XTyzm50+8WEJ8mqb2fPG/8xRiq9SgK49406473PxBC1Dmf2Ej4lTFxzIylGS0LAIhNn9gt4bOX1wFhAqY6hO28CaiIueDoA8zPuS5BnXl848SpvLusOST+8GqedNu6s1P0Mf+2tjY7yZnjqEJMjHgG0pIE5xu7h+nOgvNbaBR5d67cfpST1z0gAictOJX5X6MxJH5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by IA1PR11MB7728.namprd11.prod.outlook.com (2603:10b6:208:3f0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 18:27:08 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%4]) with mapi id 15.20.8069.020; Mon, 21 Oct 2024
 18:27:07 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Prevent GuC register capture running
 on VF
Thread-Topic: [PATCH v1 1/1] drm/xe/guc: Prevent GuC register capture running
 on VF
Thread-Index: AQHbIa8ziEL0QxvQuUGxFIMhYap0CLKRidsA
Date: Mon, 21 Oct 2024 18:27:07 +0000
Message-ID: <92a1772edbc8c772d45b8821b8a9df15ac6bc3e4.camel@intel.com>
References: <20241018224325.130754-1-zhanjun.dong@intel.com>
 <20241018224325.130754-2-zhanjun.dong@intel.com>
In-Reply-To: <20241018224325.130754-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|IA1PR11MB7728:EE_
x-ms-office365-filtering-correlation-id: d4380b35-1d96-4c88-e792-08dcf1fdf891
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aTJiUzhlaTJraTY1WUkrQ3FQVEdORmcxdkJTc053d1AzaTlYamV4UTlSWUxt?=
 =?utf-8?B?VmpkbFE4UzMydmx0RVB2SlpSY1U1dkVxVTkrS1VoL2thRWlhQzIrSVU0Y1hY?=
 =?utf-8?B?V0RvRnVuR0wyK3VHYi9ac21Odjg3bFMxdm8vWlRScmFwRXlsa1dkVm4ySUJT?=
 =?utf-8?B?WVdPUzYxejM3MXFVeWUxTDV0ZW5uWVZWdHdNbHJteHZCMi95a2lXcFdkcGd6?=
 =?utf-8?B?MTVLWTIvOXg0dk14cFNQR0IwNGpHODRlY2h1MkZsZU9VZTVaSEZDOExvOFlS?=
 =?utf-8?B?VmtUc3FmanFDYnk2a0c4MlRId1hwWEd2M2llM0R4c2t0RVpQemhxZ29kNFF3?=
 =?utf-8?B?VmRiUkIvelFpSStsRXJjS3dYTUFadmFzekNzaDg5MFREMW9lVXQwR0dsdFVn?=
 =?utf-8?B?Tlo2WDRpSkNsNzZ2QWt4bmdWMFZtWFFNQzg5R0ZlZjlPbjJYYU1od0ZwR0Uv?=
 =?utf-8?B?UER0V0JmT0lnSHF6bURHTXcwbU1XbGh3NWFUZURGWEJ0dHN5VTFlS2pQaktv?=
 =?utf-8?B?dEVhWCtJVEZYUmxVYkJJMGJSNGRlelJMREtSSFd5b3dVclFLT3g2bTZNbWw3?=
 =?utf-8?B?NnFUK3djZU1uZzFlV3NnZm15dnA5WkVoRzBQRG03R0NIUTdnNHVobzF1Umo1?=
 =?utf-8?B?YjJCbERkQW1IWmpjNGFrNDZkRVpUZlZLRmZTT0xjcm9nNlBXaERWKzZhM2FV?=
 =?utf-8?B?SE1sak9ySGFpZllJSHVSQS82dklkWUJXaFlvbE9YWS9zZllmYmphNzZNb09r?=
 =?utf-8?B?Qy9jWlJlYzJ3MDlnUlFLdmhZWUxIN0huSGFQcng5dE1iejUyaUkrZXFuT1Nq?=
 =?utf-8?B?UjJ1eCs3V2p1ekRQcVB2a3lON2hJUUVUNlhlVkhqVTZBNllIcFpaVU9vOW1k?=
 =?utf-8?B?eTVUZmlyTjhwYzN1NVd4dnkrbHNXOUxCdTR1bWVueEFZeWhjci9kNWdpYXNj?=
 =?utf-8?B?QUtGOVNRanBhWDZ1MENVOVpCcE9mdXUxaW84WjFaUXhrVTJhemh2NmF6WkZW?=
 =?utf-8?B?SXRFeTlUZ1RKWXBVOXAwWUVkM3lERWxmalFzUU9nV2R4bEdLZUE0amVFSmdQ?=
 =?utf-8?B?cnNoU0lQT01udHRmN2dKcGttcTFjZVZBY0pRVlk0Y1FWSU9FTUo3OTFhOWNU?=
 =?utf-8?B?ekdWd3V6VGlmMWxnV0Vpb1RmRGxmYUlBU0dtZnByMWtTOXNvTlRsTkZpT2FO?=
 =?utf-8?B?QjdqZTdZb3hwVnVsWlNTRjRPcmIxQ3BQUDNOL1ZCVVMrdzhzRTcrR3NBckMx?=
 =?utf-8?B?WDM5MVRENllGY3VWY3RZSmttODRrN05oSGhrYXhtN2dqMVFNUkpuUGdHUFVI?=
 =?utf-8?B?cWFUU0k4TzNWdmF2eHlyV2l5VSs1SFlRWVc3SXhZRXI0TEtjY3hCKzhibHB2?=
 =?utf-8?B?REpiVFpoRXo1TGlOUzZId0dIZWw1UjhkN01SYkM2NE9Jd1Fqby8rWjNXelJV?=
 =?utf-8?B?UmRmU1NIOHNpdk9tZ0JTZkZlczVOVTBadzVzOHNoSXVtSHZuWnZ5eXR1ckVX?=
 =?utf-8?B?ZDhGdXUvcVpLY3dQRGhXc084bUNsTHBORW5CeWlvTS94Q05zTjVyVjUranN5?=
 =?utf-8?B?SWpSTEQva0hGS0VQZ2sxNUt2ZElIdHlUT3ZzaGxucFN0QTVJNXBjenlJVXV2?=
 =?utf-8?B?RlVSNEtrdE92eHVJVWJwZWkxd3dkdytCN3pjaElwN3VyZk5mK3hia0lLaFlq?=
 =?utf-8?B?bWtIU01DMjVPRkxGaXJsK2kxOW5QUkY1ckd5NGVKVUl3K0g3NC84UmZjL2tX?=
 =?utf-8?B?N1BIY0JnSTNWdCtCdDZYTFZlaGYzMW1peTZPMjhNeENMNXk5L3YrN2JONVJX?=
 =?utf-8?Q?Q5JM4Bumx87YX01YU64QUKf/2pPvl6Ex5ijv4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUVkNnR3cW4wR1RNT1Jsa0FvYWpqeG9rS1krZUREUDl6a3BTbWtHZ2ZQcmwz?=
 =?utf-8?B?QlZndVg3TjQ1bldNZlIvTlVYMkVaVFlVekZBMHJsdzhpb2l4eGI1bmtNSU1Q?=
 =?utf-8?B?N2ZjWGNrcXlXa3NERWdwejhhRGlsa2l6amJVTlV4NXFKM2Y1RU5nOWNFN0pX?=
 =?utf-8?B?U3RMYnlSU3ZJMzlRREUvRzNLKzU4SzlVMHpIQytUUG5DYVlId1hyNlN3Znhz?=
 =?utf-8?B?RlF0YTBNbGVwZHUwd3hWMjlwYWFTQzgxTUI2K2JOb0I2bFdPODV4R1JpZHZh?=
 =?utf-8?B?RmRMYi9XcXNQOFV0Wnh6RXFpcGxhQ28xVDlvWU0ycEQzL1hyT0t5ZjFET0JQ?=
 =?utf-8?B?TjJlNEQ4WEdZb041N09obUoyVkF4SGpPOForTTlldGY1QjljbzFRdTVmSmhP?=
 =?utf-8?B?bXhIKytBMnpTeGlWR0NkNG41aHdKOWp1YzZuL09HZUx2NWdwbzB4TGRLMTVS?=
 =?utf-8?B?aDR1UnpwMlpkTUxDOWF5YzlDa1U5MkF0Z2RnSzdKY0VJS21OeXc2MHlEUW5R?=
 =?utf-8?B?dW93emUzZVN6K0lGZk4yYzg4QWQ4NUFCSkNVN3dJT0lFa1l2YXQvTk41NUw3?=
 =?utf-8?B?SjJvNkNOK09NdWNGUVZid1ZUVXUxSTM4cmRFc0djRFFUUStiMlkySzBOVGYv?=
 =?utf-8?B?QzRwY1R3Nkx2dHF4a21RNTI2OE56dGFXTy85bEgySXhzUWdSOGdHSGZ6VEp2?=
 =?utf-8?B?K0dldkFuM1dnREFMaHY5YWg5M21JUWJCcjhYeStiY1RLY2VlQ0tMQ25QNzFw?=
 =?utf-8?B?SldJeTNzQ1cya2lqdE5maWVDQlhuZmM3dUNMclBZMWZuaWc5dE9VN01xY2Rw?=
 =?utf-8?B?Q055anNCUHE4T0VTU2gzSjJscXVtOEU4SzB1M3R3aWZnQm5IMDBuRnkrUW1P?=
 =?utf-8?B?OTZvUFg2NkRKNitXN0FEZkdMM1MxaThDSWNIcm90dDRzbEtabnlic1BQenVY?=
 =?utf-8?B?bVhrb1ZURzJ5VTNVUjZMdFpaaXZ5bVMwVTNzMGN3WUVra3Y4TzJnTmx5Mlhr?=
 =?utf-8?B?T3ZVY0RRTFlLenIyUmZXWmN3VHlwamt0bWI1MWlob1g4UG9VdnczaWpyNVgv?=
 =?utf-8?B?dWJtaVpYZVRLNnBWR3RSZGtWS1ZhZEM3Y1NZYmdFdjlWYUVWWFkwdjdiOC8r?=
 =?utf-8?B?U08zNUt4WEpscHpIWVJxRVFOV3drV1NZOWwxdFVwTkxlR3BRQmkzRTV5QklM?=
 =?utf-8?B?ZlhvVng0aHY1c0VMaHo3M3dnNFdmVC9vVC9Dc3BZL1IwRU1NOWZJK29Nd3My?=
 =?utf-8?B?Zk9TT0E1SHNlaEVZVGxpbmpjSlJMRHN1N2k3NTIrYXRKcVJDOUVPV3M0MXow?=
 =?utf-8?B?Q1k4YU05VTZINmh6bDAvNXJHYVNnT1RlZnVGb0tIMzJPN0R2T1Q1Q0F6NjRI?=
 =?utf-8?B?bnRJZndHR2szUlFmYmdYUGVnVVlpSHRnN3d3SzFUNDFzenRiZlN3eVd3czNY?=
 =?utf-8?B?NFdsaDN5VDBadU5xUStpNmZnT3lxdStLZld1RmtQT1k4cWQ3NHBaVUQyVXBW?=
 =?utf-8?B?ck92dzh0anphS0hLNzY0SVdYOUo4Nys1QUdKNlVRdjFhb0M2K3I0S2FLMW50?=
 =?utf-8?B?ellFTm5yTUFTWHJIc292bXpBYzVUSCtmNGgvZ214WEdJMWJGYyszbFVsN1RR?=
 =?utf-8?B?SDRHbUN5MkFrSE1HcVFld05oSEN1eHBuK09uejhMb1ZHLzdaSWI3dU9XQWc5?=
 =?utf-8?B?ZTA4USttTXpGeW5wWVQ2S3lxTS9iOHU4M3dxb0o5ZmRTUFpxWkxMZ3RDQzlT?=
 =?utf-8?B?VldSZDNYSnloc1ozaHJ3d2UwSmVXVTZRdkxCb2RPZGNsNUpqZEtIRFJsSXRO?=
 =?utf-8?B?dkNZL3RaNXZzTVNDN3hQNEQreHFqZTM2VzUxRmo4bys4ZXk2ZnR3ejRkSHpW?=
 =?utf-8?B?aWUzVWd5bnd4TnJGRHVUdGxCdjYraTlkWDJTTlZ2SVJtc004WEFndDdyc3pL?=
 =?utf-8?B?V25VWjJzR3NPclA3VUo2Q1hZM1RLdEt1WndlUGZJY0dBTHJGcHF5eUs2TWs5?=
 =?utf-8?B?Si8zZzRDQk1NbG96bEh3RWpXbVJOc2FaRE9aOENvRDZPb255ckpFVG12dnNV?=
 =?utf-8?B?cisyaklsN1FPdFlIL2ZhMU91VUxKNy9HNDFhTmx0MHBHN2JQQjVqSXduMFpL?=
 =?utf-8?B?WFowTXFSRmFWcThNT1ArbUFxcURwMHlKNmkzM2YvYVlTQmNKMGU1K1RHNUl0?=
 =?utf-8?Q?reFU1rb8pXfnrtKAUhHvRHM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C38B675408176E43AB4F789F14418C30@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4380b35-1d96-4c88-e792-08dcf1fdf891
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 18:27:07.8852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PB32VloN0fA8KBWcAk3fQISoypwUJm0LdLJCXn1p1vF3SlEFYBImS8auJrjoPl3t7r5UlZIUkpu+8VOD6WpeC5HNhesNl/hLWNefubDLI1i4CRwoDtu/pFrZCZmDRETF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7728
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

U3RyYWlnaHQgZm9yd2FyZCAtIExHVE06DQoNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxh
bi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KT24gRnJpLCAyMDI0LTEwLTE4IGF0
IDE1OjQzIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+IEd1QyBiYXNlZCByZWdpc3RlciBj
YXB0dXJlIGlzIG5vdCBzdXBwb3J0ZWQgYnkgVkYsIHRodXMgcHJldmVudCBpdA0KPiBydW5uaW5n
IG9uIFZGLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdA
aW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2NhcHR1cmUu
YyB8IDEzICsrKysrKysrKysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQoNCg==
