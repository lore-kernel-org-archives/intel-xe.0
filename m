Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB93CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 12:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9CE10F1C1;
	Thu, 14 May 2026 12:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViI9aRI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9635410F1C1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778762626; x=1810298626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IPsD/6Jmu4AXWUaOxRFigsKqIH/tugSxvkbdhmyaSBs=;
 b=ViI9aRI8xUjuryjifthtiMa9YMPuo4dCU4eXnAQcFFybKQA5grM33yoH
 bfqygusBIA7nCRJvaRtWFuljizuksOsXMCFdkIZO6yliGQ0Xq03uTxVR2
 mUWQjnWqTvJN/9yb26GZacTpsvbN+zP4BxArZfzldG06WJCAoN/jeW0tz
 JSyHqTZFNQDGx1j6AMIoaP1NG7zyej6VCclwRnIpYSzLVjfP8bY3/wb2T
 aAlNnnf+1K5gGiQnmygLnwEugI8O7ALrG8lKk41S7n6/RWVvn5ADrSWPW
 a3EZ3DDQyiOcFYK03qdSPxoSUrTW/S+mFMdq16wpPmKjf2MVRMxYwZJgC g==;
X-CSE-ConnectionGUID: LPfdzq5gQlmBbHQzT5HDKQ==
X-CSE-MsgGUID: 6SLNnJPETXarO+75EhzYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="97129133"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="97129133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 05:43:46 -0700
X-CSE-ConnectionGUID: CHc1buj0QbmHl82ntREhZA==
X-CSE-MsgGUID: Npcw4eSDS4WCzCGnwLCNKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="243357839"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 05:43:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 05:43:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 05:43:44 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 05:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAejXYTD2VdL8Enl2ldjPv+QzHq07ZBJ25rH/DMDSFO2kuBqo8b10Y4O9sUllGoTifD9foEzR73N/YQ2NpbbAnRvjFOxt8zCIxuUzRTYo6yakrl3acfaTpf2Gdgle4RehZrJ3J+Ikae75J6BoUC44eOJ2YcdSnMuRocHa4hyaUUgHkiTKi6eQnKAUIEcqeQCmbxh3H0uheLfeumPAJ/v5dmeMxVv80E19qEm0kFBNORZpjJtvbdapQW4xu4PNZAQ580At6EjXXx+qbH6Zj8QohbJwEbRDPIhuR99hCUlYO0MnbtKCCVJ/8ZUjPjatild64QwJqaL3puUp4KH8fHOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPsD/6Jmu4AXWUaOxRFigsKqIH/tugSxvkbdhmyaSBs=;
 b=FIRMYDqPQz8I6qeBWSWKCn1KlzfHUThXO9iGbYpU4KfG6A4wHsiZWoqJU1/tJNLFgVTxxqluR+UCh4DicFVODGTzmpZU7h1kILKaj/68ftvx5ojGv9dB7ewhmUi7tRpgFc5yGYjmqjg6WibG7SJtQVvTjAfzK8Nqt9UIFkpUSwR5xJJoRkKahqET+esqxRO5ARR/S9P3mH+AicpRLV1HGTJxXXTHmbAAGvrTgoXS2PI8NZNwG1kJrw7tjRcblq7zhVx0TSPbxoztP+mMfgpIKVgg37Ok5Re3qFezWcuCD7vPOW2G4tD+w6R1FMwH4zL4JCOlv7PhTybQgfF43YU+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 12:43:36 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 12:43:35 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe/gt_idle: Use NSEC_PER_MSEC instead of float literal
Thread-Topic: [PATCH] drm/xe/gt_idle: Use NSEC_PER_MSEC instead of float
 literal
Thread-Index: AQHc4VuWsrvoN5GGLkeB4p3AnK+14rYNesWA
Date: Thu, 14 May 2026 12:43:35 +0000
Message-ID: <SA3PR11MB8118E571A75318B9A288736ED0072@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260511153307.223435-1-shuicheng.lin@intel.com>
In-Reply-To: <20260511153307.223435-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|DM6PR11MB4612:EE_
x-ms-office365-filtering-correlation-id: e05b33fe-72b6-426f-db19-08deb1b66a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|11063799003|56012099003;
x-microsoft-antispam-message-info: GGnGwxPnBUaug27aJAWEGXIkk7M1W9Oje47PI7HLc57qkyRizaIut76zNWewa9KKLFAlH43i+4PYN4AySmqOB7145ZJFHZzlSBaA6Q88lcIel5HZU14rek/HmsCwBrUzleYDfU8Ggwz3EIHYluQnwh//zdSqyFF4S5b+i94yESR/a7CdDh323hVW70viglzKPTkQLs5JHQxLv2fEeG5m3OyCxffB+1Nvie2/IQQeoOUQFnyg/00M54IZtOyc78M20qKdQoQ1hmjztKHU4r+72NkZ+SnMeB8T0d5HovS7otZMvUIKva7yw3Njo59OTT/o32BbBy5mb4MvQF8FNI8Vcgvfj2uClhxKTFelzkiDeUkqHqzYmYPIhSHZJApMSMJHFjnF12KTBeJeW3Kq3Oa9kHx6gccSnEYZdRPBGJQgfyyZX0ngNIlyi908LAx4sVEzj0t7KaD4sOXzAjMaHioL44kQokBex9260gWxRfCsM+PcvZsHa7iqaf/k9sW5ygyhInt35F84MX6L/O44UjccB6O6fAUZu2Gg9v1e1fFa+e7vYfBIeSp3Z0UcqngDyoofF44dIJqI7WutEJ5y1k/y9kPAVWhKptd3MAcWaB8o9aeboG+twETB/ewvqlJ8H7K8y9DIC6G/L7I9/22ucZQwzanfENKkVyxu2B4xHp97v6p7Y4f7h2xst8wCF5HVVXn2Tdfg576ZLQEplvSenzox35/Azza1ycnAfn/fIwpv7aMUlhlnk7fYAtQHl9sZuio/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm1UL1RHUCszdnViSVhoZXhaaUJqV2dXVDVaN0x2LzRIMkRkZ2JHWUdEa2kr?=
 =?utf-8?B?U2k4M0lvNzBETG52NjkvaFRYdGE2ZW04Z2VoMUtUanRTay9aQ0RudkMrL0pH?=
 =?utf-8?B?ZmY5Nyt4aG5MWHdwb0hGankyS1hjYUwzaHhZRzc5NU9yeUdxSnkvbkExN0JC?=
 =?utf-8?B?YURqakJMcVlFaWkrOWpOc1ErNDFJdHBaK1o1b09ST0ZIN0M4ZUZjMW93SWFS?=
 =?utf-8?B?Y1hXcGpaKy9vVGJkY2lzVitUUUtwUGtFRkVzVGNMeTJZQ25RMmxzWUljZmpE?=
 =?utf-8?B?c0RJY2JxMnZBOXB4RFRac3V2UEgzU1pMcEtWSmVXbVhEUWVJdEMwZCt6QUp6?=
 =?utf-8?B?Q3JrMXNPWitLYlBvWFMzSm5zTTgwK2t4MXpSVzV5bHoySzRVcFB1R0gzWkg5?=
 =?utf-8?B?RU9ZVE8xMldqa21tMWxhVzZRUk8wd1J1T2lLemJ6YTdrbjk3cnBmNys1RktW?=
 =?utf-8?B?ZjlEU1R3OEZFVFl5cTh4S1IyV2MzNVBCc0VPUDRWbzVuMTdhOEZMcFhBS0tL?=
 =?utf-8?B?WEhaOERNYks5U1pNMVNSaXlPSTRmRHYvaFcwZXZBQno1MHdtSVVqeFJidy9x?=
 =?utf-8?B?ZnF0M3dsTFJSd2ZZUW5zZlcrVGxDRHhsTnc5YVVtWDIrT2JWTUdadi9nWnlE?=
 =?utf-8?B?bnRUbHhsdFVCRnpDQWMwa0RpL1VvUlRmSXZyNWdWNTlDVTBlRDFoRm9QSlgw?=
 =?utf-8?B?UWxSdDZVL0xpdWNWTFhoTk40ZUtHMU16OTRzVFk1SW95THNKa0dXM2JSUUEz?=
 =?utf-8?B?K0NPUWRTWlVCb2U3OHVySXU5NlpmbFlYdWtEOWlLWmg3eE5Qd0FDbXkyK1pH?=
 =?utf-8?B?NTM3alZXc1pNYUxYM0lmYXlqL1lVYzFnZDRDWUVmVUVDa1loeWozTzltVjFv?=
 =?utf-8?B?R0xmbzJNNTJHWkZZUkh3N1VPNkpaNkxzTkh2Zjk3bnoySHkxVnQrTkxwTjBh?=
 =?utf-8?B?QUI1Zkxxa0VNQWlKUWYyeVN6TmozdWwvRHF0REVNYzdndE9TQzhvQktScGZE?=
 =?utf-8?B?NW5WYVBJa2VZcFFSRmRsVEJJZXA2ZUVVT0JYNFA3em9TczVJaHEvU2FodkZw?=
 =?utf-8?B?U1NtZEptTnRVNEtmamNqVzF4bHlXSzlsUk1GYUJac0lPSE1ETHVuS29GVElG?=
 =?utf-8?B?c0ZMeTkrRDNtTWRmQVJ2bnE4UVJTQkhsY3RwbS9lNWtEV3REZUxTTXNLNVla?=
 =?utf-8?B?QjZidVRIL2krMktHMklyaVVJMDI1SFRsNWwvMVZJalkvdWRQeGhxaDFJSVVH?=
 =?utf-8?B?VXZHZzRSTTQ2eTZoSUhnOG96amhXaEgwQjZGOGd4U2tBRFJmdnVvejU0MDdQ?=
 =?utf-8?B?WTdwb3h5L0xBTlZtaFRmU0JOWGI0dTBJeWtEc0c3VzJLL3JORkxWYW9rVkdz?=
 =?utf-8?B?WndhdUpncnNtN0UrSlE4K1JCcVZLU3BIaHJ5T0VrS2xjZWRwTy84TndTU1Qz?=
 =?utf-8?B?VjZqVXUxbUE5eXR4blo4bE41QU9EbGxUcHRpVmhlT3RNTTNRb1VyTCsyc3hw?=
 =?utf-8?B?dFh1R3JkQ1NwR212T3VEdmpvSHd4VFo1T1lHcWJIem9qZi8waC9iNEtQdXQx?=
 =?utf-8?B?SksxaGFVOXo0YnQ3QlR2cG8weHI2ZzBmNGpZR3piMU5EdFVXdjJkVHd1NEVa?=
 =?utf-8?B?bXlrZEtFV3podlFQcGxTRWt4TE5IeXFLZTlRRFhrSXdNUnNWRUxtSXkreUJG?=
 =?utf-8?B?ZVJmL2RmNndhc0VISTZ1ZVVmSU1ZallsNkkvSHhXK09zcitKd0RUTzM4VmhO?=
 =?utf-8?B?MWZPYmw5Yk1hS0N1eHI4SmlEcXZ2d0NqL2gvNEMxL0RoTG9iM0psS29xSzFE?=
 =?utf-8?B?Zll4VVZxTytwOUtsN09MOTQ5YXMrdGVWVkp3MG55VWZobFR2TjhIYkxVL2w3?=
 =?utf-8?B?Q3NLcnBYSXdKNGxkSEZabnBXYU8ybnArS3pjczJhTlVuSkFoelU5RFg2TExF?=
 =?utf-8?B?UjIzcjV1MXNkR2VHYzBubVBhZ01CL0tiTkQ5eGhiRWJyNmp0VHlTbjR3V25j?=
 =?utf-8?B?ditEWndFeE4vaUJkTWRVczdaVlVwVTRNRWhQQzNsZlFHL0N5RnhwbFFVNFR3?=
 =?utf-8?B?L01IczlvbGJzWi9vYlgyclJNSmRYaGFCb2VkTjVMYlB1NWpMODB1UCtUamM4?=
 =?utf-8?B?ZlhoaU5nSVUrQ2JKbm42ZERtTnRuNFBQQmRjdm51dWgrcUtUZGZwNDRpcEND?=
 =?utf-8?B?UkRpSlU1VE9SRnZFaGg3OUFKSnhsNzBKbzdRNW9Wa1JPQ2Z0YmMwRnNwNWVp?=
 =?utf-8?B?d1Bna2dDYlBpVmhpaTFSbC8rOE0xSXN4dTVWY3NjWlpBV2dydE1iQ0Npbnlu?=
 =?utf-8?B?MDhoeUpBTEowZ0ZBMkJwbTRnME15U2pldi9mOEFDWC9KVktRczdHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AVBjkJOrJj08vWYRnCEsz8Nt+mgwBnvJ1CtcbR26tmC9kNS9ijM6/P0dk+4zXV2Pfv1N5ZVWoc84skSAgSOBha+0o4vTn606NpQd7QfOMn+r6l/XBWhLLpkjI8jc6hVWnDTRn+zWDVVLFUr/6oxt+L+es9u+mYHq33QGoPiTibOXZ/jZs11sP37g9epNk27bNxQMWpFAfAxZa3hpH5fVwlodRMcvaooHwrvxF+AfzYvpKpNI8CwRgIdjwAvNwDUzJdbIpBQ1sMxHnpaV5KySgf5goWx5gJHdlEXZRQzvBbXmM66xb9EJ/jMF9amM/TH/S44MoNJBeP6ermyPbxfHYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05b33fe-72b6-426f-db19-08deb1b66a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 12:43:35.7155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1akcVENntxLXJWQqgCAKdQkC8nPcVtL6hZk0li5ooPBXyUwIhHrK2CUCeeEMcNicwcRGde1R2y8V7Y52k+aukg==
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGlu
dGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU2h1aWNo
ZW5nDQo+IExpbg0KPiBTZW50OiBNb25kYXksIE1heSAxMSwgMjAyNiA5OjAzIFBNDQo+IFRvOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IExpbiwgU2h1aWNoZW5nIDxzaHVp
Y2hlbmcubGluQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0veGUvZ3RfaWRsZTog
VXNlIE5TRUNfUEVSX01TRUMgaW5zdGVhZCBvZiBmbG9hdCBsaXRlcmFsDQo+IA0KPiBUaGUgcmVz
aWRlbmN5IG11bHRpcGxpZXIgY29udmVyc2lvbiBpbiBnZXRfcmVzaWRlbmN5X21zKCkgdXNlZCB0
aGUgZmxvYXRpbmctcG9pbnQNCj4gbGl0ZXJhbCAxZTYgYXMgdGhlIGRpdmlzb3Igb2YgbXVsX3U2
NF91MzJfZGl2KCkuIFdoaWxlIHRoZSBjb21waWxlciBjb25zdGFudC1mb2xkcw0KPiB0aGlzIHRv
IGFuIGludGVnZXIsIHVzaW5nIGZsb2F0IGxpdGVyYWxzIGluIGtlcm5lbCBjb2RlIGlzIGJhZCBw
cmFjdGljZSBzaW5jZSB0aGUga2VybmVsDQo+IGdlbmVyYWxseSBhdm9pZHMgZmxvYXRpbmctcG9p
bnQgb3BlcmF0aW9ucy4NCj4gDQo+IFJlcGxhY2UgMWU2IHdpdGggdGhlIHN0YW5kYXJkIE5TRUNf
UEVSX01TRUMgbWFjcm8gZnJvbSA8bGludXgvdGltZTY0Lmg+LA0KPiB3aGljaCBpcyBib3RoIHNl
bGYtZG9jdW1lbnRpbmcgKG5zIHRvIG1zIGNvbnZlcnNpb24pIGFuZCB1bmFtYmlndW91c2x5IGlu
dGVnZXIuDQo+IEFkZCB0aGUgY29ycmVzcG9uZGluZyBpbmNsdWRlIHJhdGhlciB0aGFuIHJlbHlp
bmcgb24gdHJhbnNpdGl2ZSBpbmNsdXNpb24uDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4N
Cj4gDQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC42DQo+IFNpZ25lZC1vZmYt
Ynk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9pZGxlLmMgfCA0ICsrKy0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfaWRsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2lk
bGUuYw0KPiBpbmRleCA0YTJkOWVkYjZhNGMuLjA0YjI0ZTFjOGI3OCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2lkbGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfaWRsZS5jDQo+IEBAIC0zLDYgKzMsOCBAQA0KPiAgICogQ29weXJpZ2h0IMKpIDIw
MjMgSW50ZWwgQ29ycG9yYXRpb24NCj4gICAqLw0KPiANCj4gKyNpbmNsdWRlIDxsaW51eC90aW1l
NjQuaD4NCj4gKw0KPiAgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KPiANCj4gICNpbmNs
dWRlIDxnZW5lcmF0ZWQveGVfd2Ffb29iLmg+DQo+IEBAIC05Myw3ICs5NSw3IEBAIHN0YXRpYyB1
NjQgZ2V0X3Jlc2lkZW5jeV9tcyhzdHJ1Y3QgeGVfZ3RfaWRsZSAqZ3RpZGxlLCB1NjQNCj4gY3Vy
X3Jlc2lkZW5jeSkNCj4gIAlndGlkbGUtPmN1cl9yZXNpZGVuY3kgPSBjdXJfcmVzaWRlbmN5Ow0K
PiANCj4gIAkvKiByZXNpZGVuY3kgbXVsdGlwbGllciBpbiBucywgY29udmVydCB0byBtcyAqLw0K
PiAtCWN1cl9yZXNpZGVuY3kgPSBtdWxfdTY0X3UzMl9kaXYoY3VyX3Jlc2lkZW5jeSwgZ3RpZGxl
LQ0KPiA+cmVzaWRlbmN5X211bHRpcGxpZXIsIDFlNik7DQo+ICsJY3VyX3Jlc2lkZW5jeSA9IG11
bF91NjRfdTMyX2RpdihjdXJfcmVzaWRlbmN5LA0KPiArZ3RpZGxlLT5yZXNpZGVuY3lfbXVsdGlw
bGllciwgTlNFQ19QRVJfTVNFQyk7DQoNCkxHVE0uIE5TRUNfUEVSX01TRUMgaXMgY2xlYXJlciB0
aGFuIHRoZSAxZTYgZmxvYXQgbGl0ZXJhbC4NCg0KUmV2aWV3ZWQtYnk6IE5pdGluIEdvdGUgPG5p
dGluLnIuZ290ZUBpbnRlbC5jb20+DQoNCj4gDQo+ICAJcmV0dXJuIGN1cl9yZXNpZGVuY3k7DQo+
ICB9DQo+IC0tDQo+IDIuNDMuMA0KDQo=
