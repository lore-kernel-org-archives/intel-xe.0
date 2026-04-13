Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C2AF34C58
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 14:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216C810E4A1;
	Mon, 13 Apr 2026 14:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgywP9t+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE55710E4A1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776089860; x=1807625860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=etyINvmHZSfItbqCQwLKkHf7/gkfb1tvrWF9UmOJofg=;
 b=QgywP9t+puFbwPzsqSK2IJEGjDXBs7M+1L8s35oShY6Dn8PalLUcyJLD
 D1WSa4hheBbiGRCvLZQZUpXZjqqKp3elOx7kGfd5fYY/iUMm1xcEi8gGD
 cVDBKl3g+Yk9Xy7qtnk91LWXjsPblfvBA1pmcUVe0L+QS0Uxc0y3hjTJP
 olrCRs4qk5vRFMuOwuypk3lASg6Q1CKpdWj9HMn3rlUA4mX8EUrJACEhH
 Oa+PZgNruo35kVJUEdQ1lYIX+GLFIpxNMJE/6Jw43opmSBwuuNXZnnj5B
 Ap4zWjKnlp8pYbLEzMPECOjCGqv8/9w0vybmmlL2BCnFXK0qs4KpXYmjn Q==;
X-CSE-ConnectionGUID: YSqaSTrsSLCUzh/K7+/jjg==
X-CSE-MsgGUID: 3z01x1irRGKL4xzsdQlQIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87322962"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87322962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 07:17:39 -0700
X-CSE-ConnectionGUID: 3mL3etDNQ72+wQKlCqhlTw==
X-CSE-MsgGUID: PHfsjFdPRjWqVX3Oxx5ggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="267789470"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 07:17:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 07:17:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 07:17:35 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 07:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHy9cniayUSRtq/WYY8e8rVdycvMXxnfGPC3hukufOtE/bMEDeFn4UHmoEC+s1SWyEGbUQVtu3s+tZxTBvxsbHCgwkq26Kp88p/pggA5rqhn27ZRAR4CSdFpL7x1w4IN6b9bY1qIw5mItJurpi8HEBwLfB19ZFXh3Z4ABAkleGOVz+1/wzza+M7eO/y4Cj1nLW6+O3mgLEfAItKRrI//LbhXzIwQ1QYnSEUvgsdvRWWG2S8EYn2TTw0c6njPqgz1leEABGd4tebPOkb41wR3VBNcapjtLwuNE/5c1UPfngp8tOzxpk204PdcAQN+luQAmCBUws1ONiAEyCIL3XM8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etyINvmHZSfItbqCQwLKkHf7/gkfb1tvrWF9UmOJofg=;
 b=E5QZJUI3GRbYUp97vBrDWEEdvgUIyxF7LdetLpUs/Bxrpt1p5p2JCuToPO7Xtxk2yg63fijOCf9yAliipROmmAQhxUjrVCKmeIVuye4Wde9uHXVL3TL8W6JGjgRnVXywYsaOtQHuAelh0mQpNBoo/hG5vX6/djh9L0sKfYeNHIit9HIRyFfqsNfZTX5TSPiRUd8GKiXKzJDM8UueJC48pNhGr/64aOnq7n3HdTxiAsUts+XWxfB9+umK9qiayyQXE4I/qd/U3yCEuY7LjiYC8wHBHzvxUg7kCQ+dGjUoJaWwRMzUw5TQymS9m/5sNBLtJ6Y1X6YvdimwctAnEm1tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 14:17:33 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 14:17:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V6 2/7] drm/gpu: Add gpu_buddy_addr_to_block helper
Thread-Topic: [RFC PATCH V6 2/7] drm/gpu: Add gpu_buddy_addr_to_block helper
Thread-Index: AQHcvd/CEYQrJDR9/kOeC41aP51gA7XLhfgAgBGdkfA=
Date: Mon, 13 Apr 2026 14:17:33 +0000
Message-ID: <SJ1PR11MB620416FE8FCCB5E3BF3515B781242@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
 <20260327114829.2678240-11-tejas.upadhyay@intel.com>
 <a432e0ba-0c14-4d04-9398-dd98a3aedd17@intel.com>
In-Reply-To: <a432e0ba-0c14-4d04-9398-dd98a3aedd17@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6796:EE_
x-ms-office365-filtering-correlation-id: 32bf057e-4ebf-438d-b36c-08de996767a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: yZktLqUSvC6UsEIjYe8EBakweZRjO/+f7onUA/kfA7spAd8wptSlCnLo/fHyetm+G0u876OasHv45uAgF3RQkZdhXMr8DPxm9nKibv7p8jyU+OytGAYFU8ve8q1ISfKdSxjCxrD25xiqY/rUiamb1b69lMaD3Ndr7jG1X+Z8U9iqQFaWmnabr/4LtPi1orsweMMkvTiXh+m0jJeAm6K1vFjBPaJ9Ozt4fughE7Z31qBQTOXHJ05D3xVpr174uRAaoadvoM6IUwH3j1tUYycrrR66JHwVpWRkOrFjTFa/6cP3U6yzoXw4Hzne72dAPey1HFl28GSBCa0RzBNL2k/d3hM7lZV1YAARJJSNHrNHr7uScAb9Vl1Ozc7MiNrBkm1/sXTpTGHWBhcXWZRZ7W46+Fu9jNckA4LCEgAP6VtO4MtBJqs6Vze9JJzuHsNsSK3NNOsT97/0Md71IYchaIJ+ORa7zQNEIRsyqhFjJyCfOenoD5/9+9bK25cPpz+o8gzSA2Hbz+x26p/6C78HRngTJL7rKVSTpt+QYCqRyw6SERKxU8dUyI1UL3vfaZ1SyL2xIrzpWiGoadvNeRnFCzAGQcsAlflsSzPvLuL7GLV7noN9kFOH/2kj4Eco2DJpmtKWWRU3YAMttBx5DwFn9aThUh6SbQX0dHRhvfgatBKBxadIU2U3dcgKcMyawpvrlMVXv8Iz/SgP3ui1tHI+6GSZTMOXsNy/iFoBYO172DWaekxvY+2ef/mG9+R4+jtXSrkEAXrUuYRU2wTZ9NizN7FFPburbEjqd5YXUCvcz2ZqFuo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zjl0R3RmM2JXUU9aY29hRzJLa240cWVSQ0V2cE5wMkpJVUpjd3E1WTVTVGNn?=
 =?utf-8?B?ZXJ6cEV0b3I0dXRVVDRhSnZzOGU3REd2TmoveGxHZGV1c1pkNmZHeVd5bStv?=
 =?utf-8?B?d0hoMEU3Sm5CRlhrMGFqTmIzMmFMMVdVK1kxTG5kaTNOYzY5a2g3cXkwQUxM?=
 =?utf-8?B?Q0sxKzFIeElSRU5FSlpaTzVPNHVyRWJxek1jOVFJelhzdE5GZkpva0ZTVDRw?=
 =?utf-8?B?dWp6UXR5dDM2Z2lxN293a3RlRGVhOUxoNVdFUTgwaVMyU1U3dGFiaGpjQnJL?=
 =?utf-8?B?ZStFanh4Q2N0aURPRHVudWV1ZVkwUU9SS3FpMGRtaGo5NURWYjFGMmt5eDdG?=
 =?utf-8?B?cEdHZE9vb3dGUzJqc25hZFlKd282MmlhQjJlQjh2K2tjajRSbWVUOXhaejhQ?=
 =?utf-8?B?SDE5ZXlpSVdNelBjd3R5WnIzVlJBZDdJU0U4WWUvRHNFQlBSenBoS0RaUi9E?=
 =?utf-8?B?aHdIRnB4ODhqTHI2Q1BrOEwwODR3WGx0STd0ODQ4SUlRWVdpZkxoR2RienRt?=
 =?utf-8?B?bENvQ0oxM0hIOXozUWVuWllxWmZvTlI3UXYrcnZhWGNzSGFyZ0dub1lGbHpu?=
 =?utf-8?B?QzJkelpUYmdPdDdhM3J4QUpEUDVNWEozMjBwbFFlUFdJakk2eHlQbkNtUEtw?=
 =?utf-8?B?OCtHZmlacGM1NHNtdUYwV2cyT3ByUzRFTGwwVUdJSTZoZElHaVdUQkcvcXRp?=
 =?utf-8?B?M0h1SWpPbGYxNlljaW5xQzVoZVJPOE5SMXRvNFVvTGJyNzlER252RHBjRzlI?=
 =?utf-8?B?WmMyR04wM2ZWS2xWdG1qeVJtREtFU2FycUNBaVFzQ3AvTEZaNnBtL1N3cWFw?=
 =?utf-8?B?VmRCeUtoamFySi9wd2l5Tk9YckRFQnZIQmN4YTV5VFZTY2s3ZDYzaTl6Yk1m?=
 =?utf-8?B?aVFZYldSaEVKS1hNczVpdzBFZE9DbGpBQW95MndUTE5Oa0NubG5zdmpEdFAr?=
 =?utf-8?B?dUpyemt3NHlFOU5CbmpTTDBzNGozdlBxZHVaU2M1SlM3VmpUKzdPTzliNFFm?=
 =?utf-8?B?V1VkWUxoRDhUdnZDOTMyemVQT3YxcUpoKzRhOEhCcEJtQmZ1Q2NTMUc3eHZ0?=
 =?utf-8?B?c2tuZFZiS0NZUDRkWkw1Zmc1TnRicDhSZHJtNWVCZXd1V0drcmtBdFZzdDNG?=
 =?utf-8?B?N0NoVGVsTjFFMTduVExqQmxWbUZ3VG5FSDVNR2pJYk1MYWdvNE54eS9hd1BO?=
 =?utf-8?B?SXZoMmJFYlB2YzR5SVhUTDZaem1ndFh0eWVzSmVLbVpTYkFoQ3l5bkM0Mzd4?=
 =?utf-8?B?SUVpL0lDazljd01mMldvYXViTTIzb0NITkZCL0w3U1RWcTlWemhJZWltK09O?=
 =?utf-8?B?dERLV3NEdEJkcmcvR1dBWnhtR1hibWQyMDBzQlBFMnNuZ21sTzd6UVNQYU81?=
 =?utf-8?B?YURGUWhBWHgwRTZlY0xmaGhBa0ZDeHlTSVppY2JteXpFVEhwbERBSk42cXJv?=
 =?utf-8?B?c0pHQUFuTy9EYUJHb1R1VGVvNUNGTDg2NDkrbkRDVitvSzBhOVByZk5LSUpi?=
 =?utf-8?B?NDlqZ2FIYytIV2pZcndyMytpL0xlWWRSajJEN2dlYTNLdDdacVA5cHpEUll4?=
 =?utf-8?B?QlFmUm8zSHBnOTEvZ0pQTHpJUkNRRjdmYmNxL2txU0dCNTN3WllnUDN3elgx?=
 =?utf-8?B?ZDVCR3UvUUtvK1BVbmxsYUIrOTAwWVo0Q0ZOcnQzSmpBdTBRRkJMSnBIdmpR?=
 =?utf-8?B?Njk5T3ZvajNMZDQ3Z1FKMy9PelhuWTRVa2tRaFBhZWhBY1hrU0FlSzN0VjhX?=
 =?utf-8?B?dFh5WHVEK3c2ME9MdkFUbGZmODlZZWxvR1EzMGtpMHY2cFpTYlB3amlIN1cz?=
 =?utf-8?B?UDhjMkViUkcyRkZEV0g4MWdaUVZ2T1luanEyM3VCai9rZWdJREtQNCtodGdU?=
 =?utf-8?B?ckZQRmV3Y3BvVWJHaWVZb04reTMvR3hYaUlha2FhUmZ3aThoV2cyV1dFMDNv?=
 =?utf-8?B?WUpYREFEVEN1TWVCcnQ5OUJZeFdwcjdLYVF0TGJlbi96TStqUTg5UHdNRURy?=
 =?utf-8?B?bVpZVG8rT1pDT01IVTVKcTRubUtVT2p0TTlkY3RnSFNGeFp5eVdQNXdXWkFI?=
 =?utf-8?B?QmptcmhNd3pyQnd3Uk1ZcHMyOU4wV0RnUGg3ZU5lcGp1aG1INHMwM2xsSXla?=
 =?utf-8?B?M29RNTBaRHVXTVQrUnE0cFNqa2pvaDZ0UkcvZUZhV0N6TkRvdkxNQklUSXFW?=
 =?utf-8?B?OG1RSGlsb3RJaFNtTDdGNUFMVmI0MHhwRCsxK0o0Y0NaU0tVenQ0NW9ERTIw?=
 =?utf-8?B?NkJjemw2aGJVQ3dQTkt2RGVZUTRNUGtKNmw5U09obzFSS1NFa2MwNnI5emU1?=
 =?utf-8?B?Z25IR0JMTnNEeG1iOUoxaUVwTU9hcjhsQ2VIQjJPaFlkMjZHbmk4dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XsX8PRA9yXsGsoIV4BwJoRkvdHEYuGRWcylUb2QgZgbJ9IoN5WKxKN7ZeiOYG8OuB5Hu/DlUExAXM1eVpy08JO26fsIUSXYBPfyFAzQ44jgLQu7J9geaRNi5XyZiEnAgLCsxeeSCexNueaE5kQ3yKxDE+qnSUqVjtNj5woQatVwFiCWBSzx4OPBIarrv5vRRFsyONkGpM55uH8VfVGN7ezwfF/W7U1VtRpUZLkP7g2ZIlDCz72+bpVyRa0MgjUNIwfKDzW6QVbwjqIVJTMKW2hvJc8ZkwBRpiidmEtOTGQzJqa0J+twRHUVmTx5KsDK4QL8gJKp/C4/16fwpbqteaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bf057e-4ebf-438d-b36c-08de996767a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 14:17:33.2494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2VLhJSo4WuSKWurbesgr/qw6fWyoWkgwMxWzKSpTNsKTMNCXphuUhTzovVUj46QGSo+spmAKrMtHgRj3csHhXDWWN6it8dvWDgMUFpigfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6796
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMDIgQXByaWwgMjAyNiAxNDo0Mw0KPiBU
bzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4g
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+Ow0KPiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsgR2hp
bWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggVjYgMi83XSBkcm0vZ3B1OiBBZGQgZ3B1X2J1ZGR5
X2FkZHJfdG9fYmxvY2sNCj4gaGVscGVyDQo+IA0KPiBPbiAyNy8wMy8yMDI2IDExOjQ4LCBUZWph
cyBVcGFkaHlheSB3cm90ZToNCj4gPiBBZGQgaGVscGVyIHdpdGggcHJpbWFyeSBwdXJwb3NlIGlz
IHRvIGVmZmljaWVudGx5IHRyYWNlIGEgc3BlY2lmaWMNCj4gPiBwaHlzaWNhbCBtZW1vcnkgYWRk
cmVzcyBiYWNrIHRvIGl0cyBjb3JyZXNwb25kaW5nIFRUTSBidWZmZXIgb2JqZWN0Lg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2J1ZGR5LmMgICAgICAgfCA1Ng0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGluY2x1ZGUvbGludXgv
Z3B1X2J1ZGR5LmggfCAgMiArKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25z
KCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvYnVkZHkuYyBiL2RyaXZlcnMv
Z3B1L2J1ZGR5LmMgaW5kZXgNCj4gPiA1MjY4NjY3MmU5OWYuLjJkMjZjMmEwZjk3MSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9idWRkeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvYnVk
ZHkuYw0KPiA+IEBAIC01ODksNiArNTg5LDYyIEBAIHZvaWQgZ3B1X2J1ZGR5X2ZyZWVfYmxvY2so
c3RydWN0IGdwdV9idWRkeQ0KPiAqbW0sDQo+ID4gICB9DQo+ID4gICBFWFBPUlRfU1lNQk9MKGdw
dV9idWRkeV9mcmVlX2Jsb2NrKTsNCj4gPg0KPiA+ICsvKioNCj4gPiArICogZ3B1X2J1ZGR5X2Fk
ZHJfdG9fYmxvY2sgLSBnaXZlbiBwaHlzaWNhbCBhZGRyZXNzIGZpbmQgYSBibG9jaw0KPiA+ICsg
Kg0KPiA+ICsgKiBAbW06IEdQVSBidWRkeSBtYW5hZ2VyDQo+ID4gKyAqIEBhZGRyOiBQaHlzaWNh
bCBhZGRyZXNzDQo+IA0KPiBNYXliZSBtZW50aW9uIHRoYXQgdGhpcyBpcyByZWxhdGl2ZSBhZGRy
LCBhbmQgbm90IG5lY2Vzc2FyaWx5IHRoZSByZWFsIHBoeXNpY2FsDQo+IGFkZHJlc3M/DQoNClRo
aXMgd2lsbCBiZSBkcGEtPmJhc2UgKyBhZGRyLiBTbyB5ZXMgcmVsYXRpdmUgdGhhdCB3YXkuDQoN
Cj4gDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybnM6DQo+ID4gKyAqIGdwdV9idWRkeV9ibG9jayBv
biBzdWNjZXNzLCBOVUxMIG9yIGVycm9yIGNvZGUgb24gZmFpbHVyZSAgKi8NCj4gPiArc3RydWN0
IGdwdV9idWRkeV9ibG9jayAqZ3B1X2J1ZGR5X2FkZHJfdG9fYmxvY2soc3RydWN0IGdwdV9idWRk
eQ0KPiAqbW0sDQo+ID4gK3U2NCBhZGRyKSB7DQo+ID4gKwlzdHJ1Y3QgZ3B1X2J1ZGR5X2Jsb2Nr
ICpibG9jazsNCj4gPiArCUxJU1RfSEVBRChkZnMpOw0KPiA+ICsJdTY0IGVuZDsNCj4gPiArCWlu
dCBpOw0KPiA+ICsNCj4gPiArCWVuZCA9IGFkZHIgKyBTWl80SyAtIDE7DQo+ID4gKwlmb3IgKGkg
PSAwOyBpIDwgbW0tPm5fcm9vdHM7ICsraSkNCj4gPiArCQlsaXN0X2FkZF90YWlsKCZtbS0+cm9v
dHNbaV0tPnRtcF9saW5rLCAmZGZzKTsNCj4gPiArDQo+ID4gKwlkbyB7DQo+ID4gKwkJdTY0IGJs
b2NrX3N0YXJ0Ow0KPiA+ICsJCXU2NCBibG9ja19lbmQ7DQo+ID4gKw0KPiA+ICsJCWJsb2NrID0g
bGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZkZnMsDQo+ID4gKwkJCQkJCSBzdHJ1Y3QgZ3B1X2J1
ZGR5X2Jsb2NrLA0KPiA+ICsJCQkJCQkgdG1wX2xpbmspOw0KPiA+ICsJCWlmICghYmxvY2spDQo+
ID4gKwkJCWJyZWFrOw0KPiA+ICsNCj4gPiArCQlsaXN0X2RlbCgmYmxvY2stPnRtcF9saW5rKTsN
Cj4gPiArDQo+ID4gKwkJYmxvY2tfc3RhcnQgPSBncHVfYnVkZHlfYmxvY2tfb2Zmc2V0KGJsb2Nr
KTsNCj4gPiArCQlibG9ja19lbmQgPSBibG9ja19zdGFydCArIGdwdV9idWRkeV9ibG9ja19zaXpl
KG1tLCBibG9jaykgLQ0KPiAxOw0KPiA+ICsNCj4gPiArCQlpZiAoIW92ZXJsYXBzKGFkZHIsIGVu
ZCwgYmxvY2tfc3RhcnQsIGJsb2NrX2VuZCkpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsNCj4g
PiArCQlpZiAoY29udGFpbnMoYWRkciwgZW5kLCBibG9ja19zdGFydCwgYmxvY2tfZW5kKSAmJg0K
PiA+ICsJCSAgICAhZ3B1X2J1ZGR5X2Jsb2NrX2lzX3NwbGl0KGJsb2NrKSkgew0KPiA+ICsJCQlp
ZiAoZ3B1X2J1ZGR5X2Jsb2NrX2lzX2ZyZWUoYmxvY2spKQ0KPiA+ICsJCQkJcmV0dXJuIE5VTEw7
DQo+ID4gKwkJCWVsc2UgaWYgKGdwdV9idWRkeV9ibG9ja19pc19hbGxvY2F0ZWQoYmxvY2spICYm
DQo+ICFtbS0+Y2xlYXJfYXZhaWwpDQo+IA0KPiBJIHRoaW5rIHdlIG5lZWQgdG8gZHJvcCB0aGUg
Y2xlYXJfYXZhaWwgY2hlY2sgaGVyZSwgb3IgdGhpcyB3b24ndCB3b3JrIGNvcnJlY3RseQ0KPiB3
aXRoIGNsZWFyL2RpcnR5IHRyYWNraW5nIChjdXJyZW50bHkgeGUgZG9lc24ndCB1c2UgaXQpLg0K
DQpPaywgZ290IGl0IHdpbGwgcmVtb3ZlLg0KDQo+IA0KPiA+ICsJCQkJcmV0dXJuIGJsb2NrOw0K
PiANCj4gU2hvdWxkIHRoZSBmdW5jdGlvbiBkb2MgYmUgdXBkYXRlZD8gVGhpcyB3aWxsIG9ubHkg
ZmluZCBhbGxvY2F0ZWQgYmxvY2tzLCBidXQNCj4gdGhlIGRvYyBkb2Vzbid0IG1ha2UgdGhhdCBj
bGVhci4gTWF5YmUgYWxzbw0KPiBncHVfYnVkZHlfYWxsb2NhdGVkX2FkZHJfdG9fYmxvY2soKSB0
byBtYWtlIHRoaXMgZXZlbiBjbGVhcmVyID8gT3IgbWF5YmUNCj4gZ3B1X2J1ZGR5X2FsbG9jYXRl
ZF9hZGRyX3RvX3ByaXYoKSwgaWYgd2UgZG9uJ3QgYWN0dWFsbHkgY2FyZSBhYm91dCB0aGUgYmxv
Y2sNCj4gaXRzZWxmPw0KDQpSaWdodCBpdCBwcm92aWRlcyBibG9jayBvbmx5IGlmIGl0cyBhbGxv
Y2F0ZWQsIE5VTEwgb3RoZXJ3aXNlLCBzbyBncHVfYnVkZHlfYWxsb2NhdGVkX2FkZHJfdG9fYmxv
Y2soKSAgc2hvdWxkIGJlIGdvb2QuDQogDQo+IA0KPiBPdGhlciB0aGluZyB3ZSBuZWVkIGlzIGEg
c21hbGwgdGVzdGNhc2UgZm9yIHRoaXMgbmV3IGludGVyZmFjZSBpbiBncHVfYnVkZHkNCj4gc2Vs
ZnRlc3QsIGJ1dCBtYXliZSBpdCBtYWtlcyBzZW5zZSB0byBob2xkIG9mZiBvbiB0aGF0IHVudGls
IHdlIGdldCBpbnB1dCBmcm9tDQo+IEFydW4gZXRjLiBpbiBjYXNlIHRoZXkgaGF2ZSBmZWVkYmFj
ayBvbiB0aGUgaW50ZXJmYWNlIGl0c2VsZi4NCg0KU3VyZSwgYXMgc29vbiBhcyBSRkMgcmVtb3Zl
ZCBmcm9tIHNlcmllcyB3aWxsIENjIGhpbS4NCg0KVGVqYXMNCj4gDQo+ID4gKwkJfQ0KPiA+ICsN
Cj4gPiArCQlpZiAoZ3B1X2J1ZGR5X2Jsb2NrX2lzX3NwbGl0KGJsb2NrKSkgew0KPiA+ICsJCQls
aXN0X2FkZCgmYmxvY2stPnJpZ2h0LT50bXBfbGluaywgJmRmcyk7DQo+ID4gKwkJCWxpc3RfYWRk
KCZibG9jay0+bGVmdC0+dG1wX2xpbmssICZkZnMpOw0KPiA+ICsJCX0NCj4gPiArCX0gd2hpbGUg
KDEpOw0KPiA+ICsNCj4gPiArCXJldHVybiBFUlJfUFRSKC1FTlhJTyk7DQo+ID4gK30NCj4gPiAr
RVhQT1JUX1NZTUJPTChncHVfYnVkZHlfYWRkcl90b19ibG9jayk7DQo+ID4gKw0KPiA+ICAgc3Rh
dGljIHZvaWQgX19ncHVfYnVkZHlfZnJlZV9saXN0KHN0cnVjdCBncHVfYnVkZHkgKm1tLA0KPiA+
ICAgCQkJCSAgc3RydWN0IGxpc3RfaGVhZCAqb2JqZWN0cywNCj4gPiAgIAkJCQkgIGJvb2wgbWFy
a19jbGVhciwNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ncHVfYnVkZHkuaCBiL2lu
Y2x1ZGUvbGludXgvZ3B1X2J1ZGR5LmgNCj4gPiBpbmRleCA1ZmE5MTdiYTU0NTAuLjk1N2M2OWM1
NjBiYyAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2dwdV9idWRkeS5oDQo+ID4gKysr
IGIvaW5jbHVkZS9saW51eC9ncHVfYnVkZHkuaA0KPiA+IEBAIC0yMzEsNiArMjMxLDggQEAgdm9p
ZCBncHVfYnVkZHlfcmVzZXRfY2xlYXIoc3RydWN0IGdwdV9idWRkeQ0KPiAqbW0sDQo+ID4gYm9v
bCBpc19jbGVhcik7DQo+ID4NCj4gPiAgIHZvaWQgZ3B1X2J1ZGR5X2ZyZWVfYmxvY2soc3RydWN0
IGdwdV9idWRkeSAqbW0sIHN0cnVjdA0KPiA+IGdwdV9idWRkeV9ibG9jayAqYmxvY2spOw0KPiA+
DQo+ID4gK3N0cnVjdCBncHVfYnVkZHlfYmxvY2sgKmdwdV9idWRkeV9hZGRyX3RvX2Jsb2NrKHN0
cnVjdCBncHVfYnVkZHkNCj4gKm1tLA0KPiA+ICt1NjQgYWRkcik7DQo+ID4gKw0KPiA+ICAgdm9p
ZCBncHVfYnVkZHlfZnJlZV9saXN0KHN0cnVjdCBncHVfYnVkZHkgKm1tLA0KPiA+ICAgCQkJIHN0
cnVjdCBsaXN0X2hlYWQgKm9iamVjdHMsDQo+ID4gICAJCQkgdW5zaWduZWQgaW50IGZsYWdzKTsN
Cg0K
