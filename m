Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F34EC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 10:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036310E688;
	Thu,  9 Jul 2026 10:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n91+w9q7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A494210E68B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783592081; x=1815128081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yG1RvDCAtvmGE4wsYhp+oVDKO3PwgIg1t9MFtjcVNRw=;
 b=n91+w9q7NM4e4l7SkqtaU3UWhK5nsoWMEjG0FwVc4dP6ibcGdAvRH8Pu
 OmJvgAu/tBmbmp9l53Il1yEmojPMiDYZt2ghKKVc1NyM7O4VAaeeCMcKH
 STKGAbfkgCvdc40gfduRB2t6KIXRNMj1voI1xUIm9pDZCHyxR6kNsdbuo
 1AodHbWrl4fuT0Hs/DT5+/FUob/mcD5V7D2LmSCFNq07GPJJV/Tnt/q3T
 LJJiUsMMrqI178mhff9DsnCwSKPt9i+m901rBZdOOXuvSyHT3zPOqKKzQ
 zQYryZiu96HQOAnL2tuGvwT9C8i+zkss5tg/ali1fQr7ox7u+CUot4ZJU Q==;
X-CSE-ConnectionGUID: RXAaO9HGSwWDWUvce9cVfg==
X-CSE-MsgGUID: 7NkLrRZsSHeglZPgpNndVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71788904"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71788904"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 03:14:41 -0700
X-CSE-ConnectionGUID: LyE32EAjS+WzvMpuEZjFrQ==
X-CSE-MsgGUID: SW9tdTIwRZiEjhTZ7/Viig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258850218"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 03:14:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 03:14:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 03:14:40 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 03:14:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxMDThsHbLX7kZcyoVmOXGXgSR0a8/jEN3tZ6kk+aKAAF9DS39WlDVAIi7JLY0wYLTqcFbvLZDi/pXS0PiPhZvCQcTFuIEEc/bH6vNe3VMHxz8ZbayhxuogygKlakC7Uhhvf6Y6BSVGxB0XqH2ae3yDwQ78bHWHyZmTqav4rs6mV1Wga39uQpV224ytjfi9QK108FF8YHUrBlm2bJWbhkcX2A5TAvj1MBIiIp3GhMOX/sx5n8vEHM+HqLbcQbIJFT+X5XR07Vf6RvuyF8bjhqzQR68VnNcYq2LH/2Tqud6x4P1qr2z7pX1aCCU1L6MJZH8DXnr4oNRTBJhPNFUTaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yG1RvDCAtvmGE4wsYhp+oVDKO3PwgIg1t9MFtjcVNRw=;
 b=Q9KB6FetkilGzv76XMncjCPw5kPvVqPKcsAWnJJIP9Ym4JDDJpeeZUEWWcDmH4aF1X/1NyHdSP7jBRfSfodKx0wNin1auwUP4v9Y6QMy139RE+e8q4YSuHIMT3EVAK+lmFl3mlPkTSKSWuVq/LRaeoktoyLX7atkiiqy2Ong0IW/0iRx37xkbfe8EET6r2OU+Q8LYdRBJ6cFLqtWlhQRdbKddhvraW39JiPq8gyPzJgjmEO+A7l2TDnIA1mBnanr0QDsTmi/VTfmLQEpLv7bvsX3zTSGsWIKog5X735F5cGSRUXZI+WGHswNo7RJrRpiEe5+8RgcYFYGa9/OROWAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by DM3PPFE94346F35.namprd11.prod.outlook.com (2603:10b6:f:fc00::f59)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 10:14:38 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%5]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 10:14:38 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Christian Koenig <christian.koenig@amd.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: RE: [PATCH v5 2/2] drm/xe: Keep imported sg BOs off LRU until dma-buf
 attach succeeds
Thread-Topic: [PATCH v5 2/2] drm/xe: Keep imported sg BOs off LRU until
 dma-buf attach succeeds
Thread-Index: AQHdDrU0FNS2KkHwCEKuYytWW/5QC7Zjk8mAgAFUpHA=
Date: Thu, 9 Jul 2026 10:14:37 +0000
Message-ID: <SA3PR11MB811879BBA64764005903C42BD0FE2@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260708091512.205482-4-nitin.r.gote@intel.com>
 <20260708091512.205482-6-nitin.r.gote@intel.com>
 <a7d6a1b1c6c3253703a511ef4a8e54c66b66e009.camel@linux.intel.com>
In-Reply-To: <a7d6a1b1c6c3253703a511ef4a8e54c66b66e009.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|DM3PPFE94346F35:EE_
x-ms-office365-filtering-correlation-id: aa63ad79-05f3-4429-a928-08dedda2e207
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: JlBsZ3iFBl9XM+93+ioSJRg7UYj7wb4OH7tvYsOs9CzCHeuDrIuSKM8lr0qn/EWe77T5Pc4dbYiqlO9V6+FcxjmBITo/O1wWGvxM5JvSQuF3AvKoa2tiAqIM6m0KH0pvk/g3b4uyfU7+cr7AvJjheVTtGxs47AkEq/8+SE8o7yDTgC0rhHusiieez05HvFvhcQk5y4yGRTmBsjhcR03viy3ZSIYryJJPqpn8BKBysExLxEGpkfxrHdhsv9/6ECJ6EVRdqUK6VRwZkdL9ck51jjvFDqiQQ+dXBK6QHUoqd/ra79/vIv9Vm2Zw6BtnAig4fWfUMuUi+j972Bgz9eSHnmbNOkzW/p/vaZTpK+q4NGfny7eignH5alxxntCEvWlAEB31xxd3WGvTY4Ms639jELUoENdVlzRbeNNx+V+jCBzxZxY4GvGW7Vs0XdSe6usS7WZGATDyzEBO7fyhoyDh4OcmMrX6xr7H5q6Uufd1z+K+JCQBFmVlONXN9rH9j06sVMLvlZkW4PtBSqVFc+Vi621UiM44z9ahBJEDSAbpYhj7YjpccK4QHYUZDh21+ELySoQeIHFg2XzeVgziE/A+/vmHhTsTaZFOxXUvqu/qJfKWf7wsS9Lew4GnjJx61Z9SJpheeZ2J3ePoCyEAVlPieQTC7CkCeN461oRoKSYgGfp8KWwInqEFksXOJ2D1/5nk+kLoJlppUCMWVYlDL7h6Il6Lfm4zSE+sMtP8jhW+WS8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1lJQ1VDcGpNME16TjRPOVkwYWRYT2xoTllkOHc0d2RLUXRaMzF3dU03ZUdl?=
 =?utf-8?B?QmZRYndXRVF5Vk1UbzdvbWkrbFhpYWhIUzRWcytGRXpKT3Z1emdzNWU5Zjdr?=
 =?utf-8?B?RVVVZEQwajZObnp0NW9DMjlZTTEwYldBSzQ4VEx2V3JvQjdvcVQzZkJmTmJh?=
 =?utf-8?B?MkFpSHFzY1MzUWZUYzlMR3FGT3JMWjVQTVZMcFNFcTVQZmliYWxtN1RBTS9F?=
 =?utf-8?B?NHFhZU9MODUxM1pEMjJvV3ZKOGlPN3RDZzZobTR2eTZYdlFZbGo5UUdwWTM3?=
 =?utf-8?B?b3Z2ZTJITWFIVFRkMDhOaCtjUGJ6ek9VU2dMSXdyQWJuUkRBVWlnRTFkb1cr?=
 =?utf-8?B?Q1dtejNFd1FmSHpyMHNHMlFMK3psa2xWNlcyVDVqMEJMU3ZER3ZQSVdRK0ph?=
 =?utf-8?B?K2dtcFlPSDZ2QWlKNjR2TE9DYXpZYVVIdVVEYWlLUHVjcXZlbWxpa2F6S3Jw?=
 =?utf-8?B?b0krdkNIQ0c2Y0pySmJocUVVSmxoZGgrY200d3BpckFELzNZdEM1Tk5zc2FU?=
 =?utf-8?B?a3YzZllrazhrMEdYMUM2eE00S2tjMng4UVVCZ2RpdDQzdGo5NkhGZnltZVlv?=
 =?utf-8?B?YTVlNnplOHRiRDl2MG1kZk5RMHliY3lueUY4ZGJQV0orcjdaVWQ2SmJ2SGYy?=
 =?utf-8?B?cHB0ZDNFSzNUamFWOGRrWWFEM1BBRDVNWTU2bE1HanZFSUh6eWZHcnlPM3lZ?=
 =?utf-8?B?aUZTd3Q5QXI0cUtHUGRFUTA3RHovZnFsYks2SGVpUGxlVEpGaXBtMkl6ajFa?=
 =?utf-8?B?bXlOQSt1K254OTVLVXlkRnlURWtrc3E3Y0t0SXRxUmdlWElRSVBscWsweEFD?=
 =?utf-8?B?V3ZIUEw2a1ByM1llOWN6eWxYbnJGUmd4Q3BuQlhjSGdiRVZ2dmI1dldMSzh6?=
 =?utf-8?B?QmMyMWF4cXF2ZnJxZFFLd0k3dncwZXQwTlEzSnRqZHB3aHQxQVNCSnFsRkNI?=
 =?utf-8?B?M1Z2L2RpeDZVTExzU1grcEhaYW5CWExwMHVvUmQ4T3FJUWQrVk05TlJsa09z?=
 =?utf-8?B?TXFDVm5WU2F3KzVBL2JjVGZrYWdoYitnajRpTnJ3dlNBbVN6eXk1bW1iOTln?=
 =?utf-8?B?ZUNIcU9jaVF0OWZ1K0tGeDFYMEJOWGFGSU1EOFBUMUhLYVhpN3kzYld5K21J?=
 =?utf-8?B?RzRmeHA2eW9ILzhxc0lCbmFaS3c2RDFDUmF5TEJTeEdZZWRicEkyWWxsSHdO?=
 =?utf-8?B?b3oyUll4VDg3VVNqUEpGd0I4ZEM1bGlDM21WM3g5Tk5nMDNDNUplaDdUdFVU?=
 =?utf-8?B?SWJYL25CcjMzU0JMUEVYbDVNcUFrTkQxQUdnWW9sa1Z5YlZOM0dhM1hlZWxY?=
 =?utf-8?B?Tk5DQVVhUUkzdGZzaS9tb0x5OS9XZENvQkYrSFk0MGgzSDA0VFlGVFh0ZWZC?=
 =?utf-8?B?UWttcFIzUis0bzQ4ZFNtWHMyRkhCOGNkV2hYNWFpZFNHSmVvZ1NPbFV1N2lO?=
 =?utf-8?B?MUErUjc5d3pNMngwaE9RUHg2YnVpTEJYNUVkQm1FcHpxblFlY0k4OTdjTGRk?=
 =?utf-8?B?RzRhbk8ySEh4RXQ4WWVIeFllMTI1emhVbjdLRjRRK05ZN1F0NUI3QlE1Y2ww?=
 =?utf-8?B?NDhNaTArbUllWkVNdlFIMGExMzczVmx0OVU5UWFvOTkvMWhtMGVCMUdaUnpC?=
 =?utf-8?B?elRmODM2dkYvSkhRMmZyU1k2T0MyeWhaMkJCbkFwYnNlamVITHlnbmpTb0VB?=
 =?utf-8?B?aG81K3FKZ1hqMkpac294bFpON3NISERKZFV1cDVBamdGQTV6QnRsNjlnODVz?=
 =?utf-8?B?SHEwUVptRElGdUhJRGUzK2R6R1YxMnBhY2VwNkxsUE9FRHBVM0Y2bkFBR2o1?=
 =?utf-8?B?R1BqY1RFdmNhZGNFUlE5dStrRmluQWozUU1sRHBTUGc3dXFUY3pDZ1RRbnFz?=
 =?utf-8?B?WndKNURxb1hjZ1dKRXJGTFpScTRiSG1HaHFHRE1yYzF0MzNjZkkzZFFIOHRI?=
 =?utf-8?B?NnBCV09pdzZDUklDY0FJeTlJcFp0L3ZkR0o3OTBVWUEzZThtVlVpdGhyc2Rt?=
 =?utf-8?B?T0hpWmNzN0YwSjJnZ3REek9reXJ6M2NSMHJaVHc2TjU5NVdSZVhXSjVmdWhS?=
 =?utf-8?B?ZXNWL3MwcGhJUFB2bUtaWHlPU3ZjS3N5dDV6R0dEc2Y4YXRadEQxRm0rb2VC?=
 =?utf-8?B?U0tmRk12ZlpobFZYb1FXdkdabFVBYlovakRtc0hEbnhXWmhEeTcwVzJ0Nnpa?=
 =?utf-8?B?WG9EdjFxSm5CSEpyYzcxUlNwOW85R0ZrbmgwV3Zjb0FMMG9HNGRWVmVlQUlj?=
 =?utf-8?B?bGZyYjVrUUZEYVF1NDk5Y2lWVGtYY2pSY24zZHI1WFdtMzh3cndrekZzd0dW?=
 =?utf-8?B?d0lPeE5OUUZqbUVaNjJpS0VwL1U4eHA1eW5UYkw0RE10VzNFc1lqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hgZX7L3eoi/3pquqpSS6F+SkOEvaoRkGpjsdlKda/15iJIZznEjnTK8angt2/6VGE1UKglTOTJq52RA1KLHUpie2nPHFz/FAa6f678d9Jk3ZoztkiugldxkbuDIFBHSycs05esCObzPlATuRkbw7YnEbXSLiIiHUzt2l/Ixu+z/VeAp5hootnPRRn+2T3kACP+bdrMEOfPkcnmKzaQ7usebFh0O/alR4lUWCPC4KDQa46RlhsHOeD9HfsqdQMjiwAyc23ziIvxQJyBEfc3OQmuKpQzKAsulRh36bD+i41srxVlfzLAf5//d189f7D9sTvmbTkMLTWtScNMGtjfaFDQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa63ad79-05f3-4429-a928-08dedda2e207
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 10:14:37.9644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GEmjlleSveiTPYkM/D25oHNDiBDMubaZlKgjSlZe5O3m1K9vEKkzkxX3+vfyVFM/QXVlFIgqJ9QoaSfTPiwlcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE94346F35
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRob21hcyBIZWxsc3Ryw7Zt
IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBK
dWx5IDgsIDIwMjYgNjoyMiBQTQ0KPiBUbzogR290ZSwgTml0aW4gUiA8bml0aW4uci5nb3RlQGlu
dGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQ2hyaXN0aWFu
IEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPjsgQXVsZCwgTWF0dGhldw0KPiA8bWF0
dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzJdIGRybS94
ZTogS2VlcCBpbXBvcnRlZCBzZyBCT3Mgb2ZmIExSVSB1bnRpbCBkbWEtYnVmDQo+IGF0dGFjaCBz
dWNjZWVkcw0KPiANCj4gT24gV2VkLCAyMDI2LTA3LTA4IGF0IDE0OjQ1ICswNTMwLCBOaXRpbiBH
b3RlIHdyb3RlOg0KPiA+IEltcG9ydGVkIGRtYS1idWYgQk9zIGFyZSBjcmVhdGVkIGFzIHR0bV9i
b190eXBlX3NnIHdpdGggYm8tPmJhc2UucmVzdg0KPiA+IHBvaW50aW5nIGF0IHRoZSBleHBvcnRl
cidzIHJlc3YuIFRoZXkgYXJlIGluaXRpYWxpemVkIHdpdGggc3lzdGVtDQo+ID4gcGxhY2VtZW50
LCB3aGljaCBhbGxvY2F0ZXMgYSB0dG1fcmVzb3VyY2UgYW5kIG1ha2VzIHRoZSBCTyB2aXNpYmxl
IHRvDQo+ID4gVFRNIExSVSB3YWxrZXJzIGJlZm9yZSBkbWFfYnVmX2R5bmFtaWNfYXR0YWNoKCkg
aGFzIHN1Y2NlZWRlZC4NCj4gPg0KPiA+IElmIGF0dGFjaCBmYWlscywgeGUgaG9sZHMgbm8gZG1h
LWJ1ZiByZWZlcmVuY2UsIGJ1dCBhbiBMUlUgd2Fsa2VyIG1heQ0KPiA+IGFscmVhZHkgaGF2ZSBy
ZWZlcmVuY2VkIHRoZSBCTyBhbmQgbG9ja2VkIGJvLT5iYXNlLnJlc3YgKHRoZSBleHBvcnRlcg0K
PiA+IHJlc3YpLiBJZiB0aGUgZXhwb3J0ZXIgaXMgdGhlbiBmcmVlZCwgdGhpcyBpcyBhIHVzZS1h
ZnRlci1mcmVlLg0KPiA+DQo+ID4gVXNlIGFuIGVtcHR5IGluaXRpYWwgcGxhY2VtZW50IGZvciBp
bXBvcnRlZCBzZyBCT3Mgc28gYm8tPnJlc291cmNlDQo+ID4gc3RheXMgTlVMTCBhbmQgdGhlIEJP
IGlzIG5ldmVyIGFkZGVkIHRvIGFuIExSVSBiZWZvcmUgYXR0YWNoIHN1Y2NlZWRzLg0KPiA+DQo+
ID4gQXMgYSByZXN1bHQgc2cgQk9zIG5vdyBzdGFydCB3aXRob3V0IGEgcmVzb3VyY2UsIHNvIHRo
ZWlyIGZpcnN0IG1vdmUNCj4gPiBoYXMgb2xkX21lbSA9PSBOVUxMLiBDaGVjayB0dG1fYm9fdHlw
ZV9zZyBiZWZvcmUgdGhlIGNyZWF0aW9uIHBhdGggaW4NCj4gPiB4ZV9ib19tb3ZlKCkgc28gaW1w
b3J0cyBhbHdheXMgdXNlIHRoZSBkbWEtYnVmIG1vdmUgcGF0aCwNCj4gDQo+IA0KPiA+IGFuZCBo
YW5kbGUNCj4gPiByZXNvdXJjZS1sZXNzIHNnIEJPcyBpbiB4ZV9ldmljdF9mbGFncygpIGJlZm9y
ZSBkZXJlZmVyZW5jaW5nDQo+ID4gdGJvLT5yZXNvdXJjZS4NCj4gDQo+IEJldHRlciBpZiBldmlj
dCBpcyBub3QgY2FsbGVkIG9uIHRoZW0gYXQgYWxsLiBDb3VsZCB3ZSBoYXZlIHRoZSBkbWEtYnVm
DQo+IG1vdmVfbm90aWZ5IGltbWVkaWF0ZWx5IHJldHVybiAwIGlmIHRoZSBibyBoYXMgbm8gcmVz
b3VyY2U/DQo+IA0KDQpBZ3JlZWQsIHdpbGwgYWRkIGFuIGVhcmx5IHJldHVybiBpbiB4ZV9kbWFf
YnVmX21vdmVfbm90aWZ5KCkgZm9yICFiby0+dHRtLnJlc291cmNlLg0KDQo+ID4NCj4gPiBDYzog
VGhvbWFzIEhlbGxzdHJvbSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+ID4g
Q2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gPiBDYzog
TWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+IEFzc2lzdGVkLWJ5OiBH
aXRIdWJfQ29waWxvdDpjbGF1ZGUtc29ubmV0LTQuNg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5pdGlu
IEdvdGUgPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYyB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LQ0KPiA+IC0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTQgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Jv
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IGluZGV4IDg1ZTZkOWEwZjU3NS4u
MDUwZGUwZjEzMjMyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gPiBAQCAtNjMsNiArNjMs
MTIgQEAgc3RhdGljIHN0cnVjdCB0dG1fcGxhY2VtZW50IHN5c19wbGFjZW1lbnQgPSB7DQo+ID4N
Cj4gPiDCoHN0YXRpYyBzdHJ1Y3QgdHRtX3BsYWNlbWVudCBwdXJnZV9wbGFjZW1lbnQ7DQo+ID4N
Cj4gPiArLyogSW5pdGlhbCBwbGFjZW1lbnQ6IGtlZXBzIGltcG9ydGVkIHNnIEJPcyByZXNvdXJj
ZS1sZXNzIChvZmYgdGhlDQo+ID4gTFJVKQ0KPiA+ICsgKiB1bnRpbCBkbWFfYnVmX2R5bmFtaWNf
YXR0YWNoKCkgc3VjY2VlZHMgc28gdGhleSBhcmUgbm90IHZpc2libGUNCj4gPiB0byBMUlUNCj4g
PiArICogd2Fsa2VycyB3aGlsZSBiby0+YmFzZS5yZXN2IHN0aWxsIHBvaW50cyBhdCB0aGUgZXhw
b3J0ZXIuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgc3RydWN0IHR0bV9wbGFjZW1lbnQgc2dfaW5p
dF9wbGFjZW1lbnQ7DQo+ID4gKw0KPiA+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2Ug
dHRfcGxhY2VtZW50X2ZsYWdzW10gPSB7DQo+ID4gwqAJew0KPiA+IMKgCQkuZnBmbiA9IDAsDQo+
ID4gQEAgLTM0Miw5ICszNDgsMTQgQEAgc3RhdGljIHZvaWQgeGVfZXZpY3RfZmxhZ3Moc3RydWN0
DQo+ID4gdHRtX2J1ZmZlcl9vYmplY3QgKnRibywNCj4gPiDCoAl9DQo+ID4NCj4gPiDCoAkvKg0K
PiA+IC0JICogRm9yIHhlLCBzZyBib3MgdGhhdCBhcmUgZXZpY3RlZCB0byBzeXN0ZW0ganVzdCB0
cmlnZ2VycyBhDQo+ID4gLQkgKiByZWJpbmQgb2YgdGhlIHNnIGxpc3QgdXBvbiBzdWJzZXF1ZW50
IHZhbGlkYXRpb24gdG8NCj4gPiBYRV9QTF9UVC4NCj4gPiArCSAqIHNnIEJPcyAoZG1hLWJ1ZiBp
bXBvcnRzKSBldmljdCB0byBzeXN0ZW0gYW5kIG1heSBoYXZlIG5vDQo+ID4gKwkgKiByZXNvdXJj
ZSB5ZXQsIHNvIGhhbmRsZSB0aGVtIGJlZm9yZSBkZXJlZmVyZW5jaW5nIHRiby0NCj4gPiA+cmVz
b3VyY2UuDQo+ID4gwqAJICovDQo+ID4gKwlpZiAodGJvLT50eXBlID09IHR0bV9ib190eXBlX3Nn
KSB7DQo+ID4gKwkJKnBsYWNlbWVudCA9IHN5c19wbGFjZW1lbnQ7DQo+ID4gKwkJcmV0dXJuOw0K
PiA+ICsJfQ0KPiA+ICsNCj4gDQo+IC4uIGFuZCB0aGVuIGlmIHBvc3NpYmxlIHNraXAgdGhlIGFi
b3ZlIGNoYW5nZXM/DQo+IA0KDQpZZXMsIHdpbGwgZHJvcCB0aGUgeGVfZXZpY3RfZmxhZ3MoKSBj
aGFuZ2UuDQoNCkhvd2V2ZXIsIENJIHNob3dlZCBhbm90aGVyIGlzc3VlIHdpdGggdGhlIGVtcHR5
LXBsYWNlbWVudCAobnVtX3BsYWNlbWVudD0wKSBhcHByb2FjaCwgDQp3aGljaCBzZWVuIG9ubHkg
b24gQk1HLVZNIGRldmljZXMgYW5kIG5vdCByZXByb2R1Y2VkIG9uIGJhcmUtbWV0YWwgQk1HLg0K
DQpudW1fcGxhY2VtZW50PTAga2VlcHMgdGhlIEJPIG9mZiB0aGUgTFJVLCBidXQgaXQgY2FuIG1h
a2UgdHRtX2JvX3ZhbGlkYXRlKCkgZ28gdGhyb3VnaCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZygp
IGFuZCBjcmVhdGUgYQ0KdHJhbnNmZXIvZ2hvc3QgQk8gd2hlbiB0aGUgZXhwb3J0ZXIgcmVzdiBo
YXMgdW5zaWduYWxlZCBmZW5jZXMuIFRoYXQgb2JqZWN0IGNhbiBvdXRsaXZlIHRoZSBleHBvcnRl
ciBhbmQgd2Ugc3RpbGwgaGl0IHRoZSBVQUYgaW4NCmRtYV9yZXN2X2NvcHlfZmVuY2VzKCkgZnJv
bSBkZWxheWVkX2RlbGV0ZS4NCg0KSSdtIGZ1cnRoZXIgY2hlY2tpbmcgb24gdGhpcyBhcHByb2Fj
aC4gDQoNCj4gVGhhbmtzLA0KPiBUaG9tYXMNCj4gDQo+IA0KPiANCj4gPiDCoAlzd2l0Y2ggKHRi
by0+cmVzb3VyY2UtPm1lbV90eXBlKSB7DQo+ID4gwqAJY2FzZSBYRV9QTF9WUkFNMDoNCj4gPiDC
oAljYXNlIFhFX1BMX1ZSQU0xOg0KPiA+IEBAIC05ODAsNiArOTkxLDIyIEBAIHN0YXRpYyBpbnQg
eGVfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QNCj4gPiAqdHRtX2JvLCBib29sIGV2
aWN0LA0KPiA+IMKgCQlyZXR1cm4gMDsNCj4gPiDCoAl9DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkg
KiBzZyBCT3MgKGRtYS1idWYgaW1wb3J0cykgbXVzdCBhbHdheXMgYmUgbW92ZWQgdmlhIHRoZQ0K
PiA+IGRtYWJ1ZiBwYXRoLA0KPiA+ICsJICogcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZXkgaGF2
ZSBhbiBleGlzdGluZyByZXNvdXJjZS4NCj4gPiBUaGlzIGNoZWNrIG11c3QNCj4gPiArCSAqIGNv
bWUgYmVmb3JlIHRoZSBjcmVhdGlvbi1wYXRoIGNoZWNrIGJlbG93OiBzZyBCT3Mgc3RhcnQNCj4g
PiB3aXRoIG5vDQo+ID4gKwkgKiByZXNvdXJjZSAoc2dfaW5pdF9wbGFjZW1lbnQpLCBzbyB0aGVp
ciBmaXJzdCBtb3ZlIHRvDQo+ID4gWEVfUExfVFQgaGFzDQo+ID4gKwkgKiBvbGRfbWVtID09IE5V
TEwsIHdoaWNoIHdvdWxkIG90aGVyd2lzZSBpbmNvcnJlY3RseQ0KPiA+IHRyaWdnZXIgdGhlDQo+
ID4gKwkgKiBjcmVhdGlvbiBwYXRoIGFuZCBjYWxsIHhlX3R0X21hcF9zZygpIGluc3RlYWQgb2YN
Cj4gPiB4ZV9ib19tb3ZlX2RtYWJ1ZigpLg0KPiA+ICsJICovDQo+ID4gKwlpZiAodHRtX2JvLT50
eXBlID09IHR0bV9ib190eXBlX3NnKSB7DQo+ID4gKwkJaWYgKG5ld19tZW0tPm1lbV90eXBlID09
IFhFX1BMX1NZU1RFTSkNCj4gPiArCQkJcmV0ID0geGVfYm9fbW92ZV9ub3RpZnkoYm8sIGN0eCk7
DQo+ID4gKwkJaWYgKCFyZXQpDQo+ID4gKwkJCXJldCA9IHhlX2JvX21vdmVfZG1hYnVmKHR0bV9i
bywgbmV3X21lbSk7DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gwqAJ
LyogQm8gY3JlYXRpb24gcGF0aCwgbW92aW5nIHRvIHN5c3RlbSBvciBUVC4gKi8NCj4gPiDCoAlp
ZiAoKCFvbGRfbWVtICYmIHR0bSkgJiYgIWhhbmRsZV9zeXN0ZW1fY2NzKSB7DQo+ID4gwqAJCWlm
IChuZXdfbWVtLT5tZW1fdHlwZSA9PSBYRV9QTF9UVCkNCj4gPiBAQCAtOTg5LDE0ICsxMDE2LDYg
QEAgc3RhdGljIGludCB4ZV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdA0KPiA+ICp0
dG1fYm8sIGJvb2wgZXZpY3QsDQo+ID4gwqAJCWdvdG8gb3V0Ow0KPiA+IMKgCX0NCj4gPg0KPiA+
IC0JaWYgKHR0bV9iby0+dHlwZSA9PSB0dG1fYm9fdHlwZV9zZykgew0KPiA+IC0JCWlmIChuZXdf
bWVtLT5tZW1fdHlwZSA9PSBYRV9QTF9TWVNURU0pDQo+ID4gLQkJCXJldCA9IHhlX2JvX21vdmVf
bm90aWZ5KGJvLCBjdHgpOw0KPiA+IC0JCWlmICghcmV0KQ0KPiA+IC0JCQlyZXQgPSB4ZV9ib19t
b3ZlX2RtYWJ1Zih0dG1fYm8sIG5ld19tZW0pOw0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gLQl9
DQo+ID4gLQ0KPiA+IMKgCXR0X2hhc19kYXRhID0gdHRtICYmICh0dG1fdHRfaXNfcG9wdWxhdGVk
KHR0bSkgfHwNCj4gPiB0dG1fdHRfaXNfc3dhcHBlZCh0dG0pKTsNCj4gPg0KPiA+IMKgCW1vdmVf
bGFja3Nfc291cmNlID0gIW9sZF9tZW0gfHwgKGhhbmRsZV9zeXN0ZW1fY2NzID8gKCFiby0NCj4g
PiA+Y2NzX2NsZWFyZWQpIDoNCj4gPiBAQCAtMjM3OSwxMCArMjM5OCwxNiBAQCBzdHJ1Y3QgeGVf
Ym8gKnhlX2JvX2luaXRfbG9ja2VkKHN0cnVjdA0KPiA+IHhlX2RldmljZSAqeGUsIHN0cnVjdCB4
ZV9ibyAqYm8sDQo+ID4gwqAJCX0NCj4gPiDCoAl9DQo+ID4NCj4gPiAtCS8qIERlZmVyIHBvcHVs
YXRpbmcgdHlwZV9zZyBib3MgKi8NCj4gPiAtCXBsYWNlbWVudCA9ICh0eXBlID09IHR0bV9ib190
eXBlX3NnIHx8DQo+ID4gLQkJwqDCoMKgwqAgYm8tPmZsYWdzICYgWEVfQk9fRkxBR19ERUZFUl9C
QUNLSU5HKSA/DQo+ID4gJnN5c19wbGFjZW1lbnQgOg0KPiA+IC0JCSZiby0+cGxhY2VtZW50Ow0K
PiA+ICsJLyoNCj4gPiArCSAqIEZvciBzZyBCT3MgKGRtYS1idWYgaW1wb3J0cykgdXNlIHNnX2lu
aXRfcGxhY2VtZW50DQo+ID4gKG51bV9wbGFjZW1lbnQ9MCkNCj4gPiArCSAqIHNvIHRoYXQgdHRt
X2JvX3ZhbGlkYXRlKCkgbGVhdmVzIGJvLT5yZXNvdXJjZSA9IE5VTEwuIFRoZQ0KPiA+IEJPIGlz
IHRoZW4NCj4gPiArCSAqIG5vdCBvbiBhbnkgTFJVIGxpc3QgYmVmb3JlIGRtYV9idWZfZHluYW1p
Y19hdHRhY2goKQ0KPiA+IHN1Y2NlZWRzLCB3aGljaA0KPiA+ICsJICogcHJldmVudHMgdGhlIExS
VS13YWxrZXIgVUFGIHdoZW4gYXR0YWNoIGZhaWxzLg0KPiA+ICsJICogRm9yIG90aGVyIEJPcyB0
aGF0IHJlcXVlc3QgZGVmZXJyZWQgYmFja2luZywgdXNlDQo+ID4gc3lzX3BsYWNlbWVudC4NCj4g
PiArCSAqLw0KPiA+ICsJcGxhY2VtZW50ID0gKHR5cGUgPT0gdHRtX2JvX3R5cGVfc2cpID8gJnNn
X2luaXRfcGxhY2VtZW50IDoNCj4gPiArCQnCoMKgwqAgKGJvLT5mbGFncyAmIFhFX0JPX0ZMQUdf
REVGRVJfQkFDS0lORykgPw0KPiA+ICZzeXNfcGxhY2VtZW50IDoNCj4gPiArCQnCoMKgwqAgJmJv
LT5wbGFjZW1lbnQ7DQo+ID4gwqAJZXJyID0gdHRtX2JvX2luaXRfcmVzZXJ2ZWQoJnhlLT50dG0s
ICZiby0+dHRtLCB0eXBlLA0KPiA+IMKgCQkJCcKgwqAgcGxhY2VtZW50LCBhbGlnbm1lbnQsDQo+
ID4gwqAJCQkJwqDCoCAmY3R4LCBOVUxMLCByZXN2LA0KPiA+IHhlX3R0bV9ib19kZXN0cm95KTsN
Cg==
