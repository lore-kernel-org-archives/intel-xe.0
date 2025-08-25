Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F3ACA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6656910E529;
	Mon, 25 Aug 2025 18:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eac/V+bZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F1810E525
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756145214; x=1787681214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wjK2vD585jQVqcQSgTl9H1fkTMObOKYcWUIO6HDxSvY=;
 b=eac/V+bZh19mwTUA0//8C0HNlTqQbZn8WUJQRi3XqxdodkSmmBXlNh/p
 r2Xn5zuffDbU46b/1uvS8dPozA7ZKM1RPCTxrw1PC0ZT7ouHhgpZmrlAq
 NJI3qYdc1h749uy18Ek0ruKpgPgKu0rERrP2LtpO1NAzlEKe2kfjxZuSf
 fwLYYWTUWMzijNF9nCO6zBcyW/vW4m3qk60jXUSj3Vr1jdaXrS1NA/KOr
 kbQ396sVpt7pfYVWUfZ1b88ptGt5JQ3CaYeJm3XASRay0W90xwPfPV/32
 SvyTnNT1pGWY+NFaZnmqsXh0IhJCwSxJlbLPGBw0xKLgIEUBt2lYxwXHN w==;
X-CSE-ConnectionGUID: +EbkwjVwSU2a/IZxCDPpMA==
X-CSE-MsgGUID: o0keTu7OTte+8+tq2tSn6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69082687"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="69082687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:06:54 -0700
X-CSE-ConnectionGUID: i5lB4w1sRJSpLbfofB6Sgw==
X-CSE-MsgGUID: GoDfcW65SpKRXRlalhX0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="174680378"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:06:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:06:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:06:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR9YkjWSpi3PSJO7nyNJfTqnh3zLIykX3xoMy/vvMEIpV1YUOM7af7iA0aIbQ7pMv6IiFG30cyOwAurNE2yquXse6Hojg0WJzUM27zpZOgaFw5JeD999j6T2/y7tEHDSIOS2GGoXHDOze/zJdyqOKYkY1rxw8DIX66iAp/tM6e+7RSbD9KwRG9bvsmUCX1BhYhABfMnpB7zLVoWXM66Yax6kCACATyLdTne3uRHooMSkvdg+jwpEnsGmGnEGPG4A3OvM1CT21UB091sFcQYdesw2OW2Lbb32avXWHPILm03514gAyYhSNJxVtbIRNmTvFFMK8QWPa40W4lrJclwvLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjK2vD585jQVqcQSgTl9H1fkTMObOKYcWUIO6HDxSvY=;
 b=q4MtH57jklXJUiOR2taLy2wsngKoQ8Z8Xbx1BfrAXHsO6hD9a4ivM6jQxUF0TMAclEiinPAarWW7OyoK8rs69kdhiAiq9Zz96hAAxh0yBsaVPns4/jlVnHT38z6XfyqRngQA00jm2Oum6Yy03s7ITPpJFY6aDpANdo243dK9ILlinDXkYBpf7+5/m4AANk+LnmWm3ZOM0bRFLUnYcbnHi1US/S6yl/KPw9cPhTaSrQ5E7q8Xjq3whIpTa+2chsRX2GD3X4YvlCnFJb6c1NC2KrASpXZCJj0t/oAFtsOvvcEdRa+6+5kYnlsMvYiaYldlZR/kpaiCp5+/n3Lwdipegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA3PR11MB9254.namprd11.prod.outlook.com (2603:10b6:208:573::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 18:06:44 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Mon, 25 Aug 2025
 18:06:44 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Kassabri, Farah"
 <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Topic: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Index: AQHcFem/ACFsQ5t8tkCx+eaQ1GSwB7RzqjKA
Date: Mon, 25 Aug 2025 18:06:44 +0000
Message-ID: <049695bfb6f8496cafef33310f574b0a52737761.camel@intel.com>
References: <20250825175721.89129-1-stuart.summers@intel.com>
 <20250825175721.89129-3-stuart.summers@intel.com>
In-Reply-To: <20250825175721.89129-3-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA3PR11MB9254:EE_
x-ms-office365-filtering-correlation-id: 0e78cbeb-24fd-4bdb-a6d2-08dde4022693
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RVdVYVRsUkZrdGRFMXR1OWJEYlVzTTl5MU9xUFc3dFlOK1AzMWxHOVVvVUxn?=
 =?utf-8?B?NkZrSnA4aXdxMjR2VjNGbTBQOTFPcGNYOWJCM0szVkdLcithTG1HdGZZOUhT?=
 =?utf-8?B?eEFPTmZELzhjZzF1YUFFNGFNY2Q5QnNuZ2NCcGR5dTFqcWd0QXRYRzNuVVdP?=
 =?utf-8?B?UmVSMHc2dDVybml1a043Z2JGSkliN1h6VGt0N3ZScmJ2OXlrZlZTNDJiMUty?=
 =?utf-8?B?MWpWWHVQMnZrcDZrSHZLMWM0ZFFSM1RRc05UUmlXRHlweitjMXRZU2pwd0FU?=
 =?utf-8?B?YTNZdWF6d3BIZ3oxYm5HNUVkZ0lEK2lrbmU5ZGNZbnZzQlZ4WHVXN3RkbkpN?=
 =?utf-8?B?c0thaGNzWUZkNUZOcG9YNGliWHRmcXZUU3BBR05WSGZrNmJadHExdk1VRVFs?=
 =?utf-8?B?YWhKUG04bktOamRlV1VCY0VBUERUM3p6cnRZVXNYTmJFMTZjSDFpUWhZTHFU?=
 =?utf-8?B?emY3a2VLTGh3YktRQTduZVgwNnY1RnRXdjZ3VGswRGFLRHVkeVpUcGk0Y3do?=
 =?utf-8?B?b01RajkzYmZYNDdmb1huM2Z0blJRYXFWV1NiZ3kzYUdMbkRlYzh4NnNZUkha?=
 =?utf-8?B?dDVXRWpTamVFUFdQeU9HWTdDVU9WcXVod1RUOW5ycVB1MTdoVXZXc0IraVgy?=
 =?utf-8?B?MVpwTXRUQitHYm9PQnU2ZXBtUCtkVFoxQk9CWUtZK1J5WWhFUkRrREpmdldj?=
 =?utf-8?B?RUVGVmNwWDlLRE9tNXNMbDJJNVBydkk4RS9aa2IxTWpwLzZUNGttWmpvU3FF?=
 =?utf-8?B?TmphdFZKYjcyam5MZ2NidHltTVNTaENVRUR2MjFEcGE4NVdWZ29RSVlhMFpK?=
 =?utf-8?B?ZENVakdmSHl2NTBQbDBLZXJTa09OZTNOQ2pwd0JWcGVBVW8yekpUTnlSQVA3?=
 =?utf-8?B?ZEtoSTY5VUREK2tQb0xENVN2aTlIK1RlRjBLcHJnL3RLQkliRlIvYWJSMzNH?=
 =?utf-8?B?VUd5Slowd0VXck14U2ZSdGtHK2J3MWlQbldFTGdSR0NwYnJQN2d6YWZnaEE1?=
 =?utf-8?B?S0tObzN2VG50MzRxWkVKK3MvNjMvRU02ei9QSlRxZVVIZ1lzSTI0dUJYd2hF?=
 =?utf-8?B?bVZnSXNPV201ZU5CUmpmU2ZoVWY3bmxaUk52U0xRMEtPU1lHaW95K1o5S0Nt?=
 =?utf-8?B?c1JlWTkrbFhvdHd4TlZ2NVpndGt3ZmljZFA2NkhHeGpXM1ozbmlyMkVyazZC?=
 =?utf-8?B?emIzN3RUc3lJdDZLcjlZVlVBdVp2WmYvOEtTbEtTblJuS25nRFlscCtJZkVP?=
 =?utf-8?B?UEJ1cDdDUWpTRm1PMVl1TExkTmFVelIyUFFUSjdwSlpvYkJNMnFHM1htbEJJ?=
 =?utf-8?B?QkViNjV3bWZ2NS9KOHo0ZlRON2hRSkRaNnpuZkdyZ3pXSG5wWHFCQVZOQVo3?=
 =?utf-8?B?aTA5YlBlTml1YVlocktCVi9qK0xFTlh3WGNpRExCUHZpM1RXWVYydmYwc1Ny?=
 =?utf-8?B?V2pYbklEdmQwb1ZvQTZaWEFUSHRUaXFZZWxSbGdXV21VbndtS2lGZGVpYWNy?=
 =?utf-8?B?a1JHaTNmRU8yZE8zTCtxTEZwWDBobFUrK3ZTTFhTanpSaXlxbUNtK0E3TnpP?=
 =?utf-8?B?b2lEOWtNc1VuSUxYRUgxYlA2c20rOW13ekNnb2FXVTBSREZkc2lYT3JkMXFK?=
 =?utf-8?B?ZU1pN0J5bXB1RmhKc2ZxaUhoRTRjZU5ZS09jenJ3Vm1uTU9ubTJlOWg5QWlF?=
 =?utf-8?B?dWpYWEs2aFBlN3R4cGdHMFFKNTBjK29sVjF3L1F4eDMvcUgrMVdJYU1SRFVW?=
 =?utf-8?B?ZXJVelJhZVFOV2d6QWdlRm1jaEY1UU5sbWxweTB3enZhMXQ1TjRYK0NZbEEy?=
 =?utf-8?B?a3VET2RnMlBnbWVVQ0pLSjd5Uk10ZjZPTEE3RWtEeHFrbFVMVzVic2I2Zzhx?=
 =?utf-8?B?c0FoNy9SZ3c0YVBzVUYzd1dkaENmSFl2M3FoYS9qKzZwOGNhaE9PQU5ocHFt?=
 =?utf-8?B?cTBBcy9kVTc1YWhFZUw4R3lYaFA0aFFoOFJ6Q2EzZVlUUUovMjdsV2NpUTNo?=
 =?utf-8?Q?kYMOUrmCPrNstYRX2StrKm+VDTyd/s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkkvRWNmeVJ1SWZQdzdLYVBkVGtTdHBnazFYQkJEbXRHWVUrSXoxMEJuaUJJ?=
 =?utf-8?B?d2xjRjVxbWhzSG1nOFBrWTZBcjNmeGR4NDJTQ3R1cWpIV25CdVlmVm1vVWd1?=
 =?utf-8?B?cXYwYy9CQ2RZNlpIdW9LRGYwd1BFYStsRmRXMEEvU25QM21zQzFUTitjbEtn?=
 =?utf-8?B?dVpOQkFzaFAvZjI2L0ZDUkFxTlBlZWJ5V001dG5MTlhVNVRPRG1mNWVGUHFl?=
 =?utf-8?B?V293Q0FGVklrTVVNWEVmK2hXNHJUMzNxejc3QmVlaS9Zb3V0TVp0Ui9taTlj?=
 =?utf-8?B?VDFyZ3BJY1hqVEFscGVIVDNvajhELzNFNXcrdGZybktvZm5BRGRLbzhjamdH?=
 =?utf-8?B?alVvOTNOZSt6clFteHp0U3lVdkpwamxHRFRwa2tjTnFPVkNheGh4ZThvelZi?=
 =?utf-8?B?Umw0eUtMV3prcVQ0ZDAxR0krWU54OVhGZmMzNDNWWDZ1Zk13ajE4d2lQVmtk?=
 =?utf-8?B?ZDNjNzhiT0M1K2I1aUFZcWJZUGNSZCttRk5ZSWY0blRoVlVQTTJ6YllyTmFq?=
 =?utf-8?B?UnArRWxkaVJZTVA3TVpNNGNJUDZiUHU4enNOSTdtZWNwTUNncnAyUVpKTE1u?=
 =?utf-8?B?Mks4SnIzRTZoZ0VUNDg1cTVCVm9aNVVjNnJDWHB4L0FFcERCUGFnQWpsaFBh?=
 =?utf-8?B?UEZnU0pFakZZa1hBYmdrU3ViUHpZUTIrVVoxNmVacStSM2lxNzE5NGVrcXYv?=
 =?utf-8?B?Y0pnaFZjL1ZaSjFqYU9wVFkvdWkzWDNtbnQrUXBDT01zU0txVUpMN0JiZVRP?=
 =?utf-8?B?WWZTN3BDdGk2V2Y4OWJrZEl0NHdJZzAyNTMrbmhjNlpkVnMyYnZIbjBWZmRF?=
 =?utf-8?B?cHVnRWdnM3VNOGxrUUZGK1lXMHltRGVIUjFHMHl2bXlJTzB4MXVHK0xtTTZ6?=
 =?utf-8?B?ckx5ai95c0NJanl3UnVHdG9mRVh4My9WTFFzbW5tNWd6UjlUWFo5ZTRRQktk?=
 =?utf-8?B?T1ZXMVplTCtrQ3VJd29KTndMejVDcnNzMTljbkhzZzRBUU03ZFZsTURESjR4?=
 =?utf-8?B?TUZBZGZVdGVCenpLWnZQTm1DYUVCamdoNXd5cEFIOTI5UUU5QnltY3BqelVh?=
 =?utf-8?B?dzhaU0hqSE04UTR4dkxHM2FDK0lyeENRMnMvOWZBZ1RCT2tvTUNmRkxuWlZq?=
 =?utf-8?B?b3hiMU5tcWJ2SG1pOTJpVTFsdFJGd1ZnYndPMXlBMER3ZCt5Wi9xRDJHRUxk?=
 =?utf-8?B?b2x2eklHdE1SdHZBa2NkeE1MVWhValN3WUw0eDNXOFhETUNqWGpNZVBROVE1?=
 =?utf-8?B?YmRVQlJ3V01MaXhTeHN5VDRhZ0luTjUxRlBNRjBSL3V6bFhGRXd2dGFKU2ZD?=
 =?utf-8?B?cWZhbWF1Z2xSVisrNWl0Vy90OG1hRS8rK3kzajFDRnZ1VVk2UnM2WkN2aUNm?=
 =?utf-8?B?U1hkeWkzNm9TRER0YUZ3TVovTjVVZitVZ25XTjBTdWJ5Ylp1eUVUUHNkQUcv?=
 =?utf-8?B?ZnlwRG9UcCs0czFNM1Z2VHJXRzlCNytqVzVuZlpsU0NNZHU2eW84eGYvUnlr?=
 =?utf-8?B?ZFBOUTE4OHpNd3hwTnlQSUZiMU9sUzFYTmJRdGFaLzJXQ2MvbWRlOEJnSVk3?=
 =?utf-8?B?VXJGRTd3aE5FaDI0b29Eemp4VlZrRFIzcUU3cFAvdlNqZnVvN1hZc0hqWmxx?=
 =?utf-8?B?Q2FYbXl0UDZFTUEzSldMb21yemp1QzNmK2xyRnd1RmJtVUpKU3FocVRnWUVT?=
 =?utf-8?B?VXZDdXdvNWw2Q0lZd3VwVW12bGQ0d1ZMdnhPR0xmQlR6OFVCYXVNNVdyRWxZ?=
 =?utf-8?B?MGdRU0V6N1ZSa2Q3cjA5K2FOVjVKeWw0VHd4Ni9sN2FTWWxKbmRrYXBhbUFu?=
 =?utf-8?B?OEtVbGlpM2hjZWNZM1lYMzBWRi96NGN3cTBGZmpuQW9SMVArWWIrT0ZSVWZW?=
 =?utf-8?B?SFk3SnF3UkMrU2RmRzNLb05WMWQwTEt0QnVFZmVsY1lhWHlPMnl0Q08wZDhU?=
 =?utf-8?B?NXZxR3dtN3dUMU0rd0djeTZlY1lkSkNlYktZcGVqd2NvRU5KNGFWRk03V0hk?=
 =?utf-8?B?Mkpidnl6UWg5Yk5JQ0tSTDJsWHIva2R5SWY1cEpWaFlUOFd2bFg0SEpJWUo5?=
 =?utf-8?B?elNYRFJ0NkF4bG9TaWFuS09MMTRjUjZuVEN2b2MzblBTdGVERmExTjhLRXNz?=
 =?utf-8?B?SURFanBPeE14OGwzUk5kY2V1elVhdEhKY2pKbjFMS2YwWGZFR0ZnSFRyZWc0?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92F7927D2297D479BB093190BAE9341@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e78cbeb-24fd-4bdb-a6d2-08dde4022693
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 18:06:44.4461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qExzYv1J1+1sDDn6z1tOWWmSDViI/hdDA2SElWNuj2a81ivDn/eIFlEkjXziV9R/iJf60Bjjzdw1JYYFpM4o5WiRbB0SomuR/yMFjUB///A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9254
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

T24gTW9uLCAyMDI1LTA4LTI1IGF0IDE3OjU3ICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToN
Cj4gQWRkIGEgbmV3IF9maW5pKCkgcm91dGluZSBvbiB0aGUgR1QgVExCIGludmFsaWRhdGlvbg0K
PiBzaWRlIHRvIGhhbmRsZSB0aGlzIHdvcmtlciBjbGVhbnVwIG9uIGRyaXZlciB0ZWFyZG93bi4N
Cj4gDQo+IHYyOiBNb3ZlIHRoZSBUTEIgdGVhcmRvd24gdG8gdGhlIGd0IGZpbmkoKSByb3V0aW5l
IGNhbGxlZCBkdXJpbmcNCj4gwqDCoMKgIGd0X2luaXQgcmF0aGVyIHRoYW4gaW4gZ3RfYWxsb2Mu
IFRoaXMgd2F5IHRoZSBHVCBzdHJ1Y3R1cmUgc3RheXMNCj4gwqDCoMKgIGFsaXZlIGZvciB3aGls
ZSB3ZSByZXNldCB0aGUgVExCIHN0YXRlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1
bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsr
DQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYyB8IDEyICsr
KysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9u
LmggfMKgIDEgKw0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0LmMNCj4gaW5kZXggYTMzOTdmMDRhYmNjLi4xNzhjNDc4M2JiZGEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndC5jDQo+IEBAIC02MDMsNiArNjAzLDggQEAgc3RhdGljIHZvaWQgeGVfZ3RfZmlu
aSh2b2lkICphcmcpDQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gYXJnOw0K
PiDCoMKgwqDCoMKgwqDCoMKgaW50IGk7DQo+IMKgDQo+ICvCoMKgwqDCoMKgwqDCoHhlX2d0X3Rs
Yl9pbnZhbGlkYXRpb25fZmluaShndCk7DQo+ICsNCj4gwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9
IDA7IGkgPCBYRV9FTkdJTkVfQ0xBU1NfTUFYOyArK2kpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgeGVfaHdfZmVuY2VfaXJxX2ZpbmlzaCgmZ3QtPmZlbmNlX2lycVtpXSk7DQo+
IMKgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRh
dGlvbi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYw0K
PiBpbmRleCA3NTg1NGI5NjNkNjYuLmRiMDBjNWFkZWFkOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+IEBAIC0xODgsNiArMTg4LDE4IEBA
IHZvaWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9yZXNldChzdHJ1Y3QgeGVfZ3QNCj4gKmd0KQ0K
PiDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZndC0+dGxiX2ludmFsaWRhdGlvbi5zZXFu
b19sb2NrKTsNCj4gwqB9DQo+IMKgDQo+ICsvKioNCj4gKyAqDQo+ICsgKiB4ZV9ndF90bGJfaW52
YWxpZGF0aW9uX2ZpbmkgLSBDbGVhbiB1cCBHVCBUTEIgaW52YWxpZGF0aW9uIHN0YXRlDQo+ICsg
Kg0KPiArICogQ2FuY2VsIHBlbmRpbmcgZmVuY2Ugd29ya2VycyBhbmQgY2xlYW4gdXAgYW55IGFk
ZGl0aW9uYWwNCj4gKyAqIEdUIFRMQiBpbnZhbGlkYXRpb24gc3RhdGUuDQo+ICsgKi8NCj4gK3Zv
aWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9maW5pKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ICt7DQo+
ICvCoMKgwqDCoMKgwqDCoHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fcmVzZXQoZ3QpOw0KDQpJJ3Zl
IGJlZW4gc2VlaW5nIGFuIGlzc3VlIG9uIGZhdWx0IGluamVjdGlvbiwgcnVubmluZyBpbiBhIHRp
Z2h0IHdoaWxlDQpsb29wLCB3aGVyZSBvY2Nhc2lvbmFsbHkgd2Ugc2VlIHRoYXQgYSBjb3VwbGUg
b2Ygc3lzZnMgZmlsZXMgd2VyZW4ndA0KcHJvcGVybHkgdG9ybiBkb3duIG9uIGEgcHJpb3IgZHJp
dmVyIGluc3RhbmNlLCBmb2xsb3dlZCBieSBUTEINCmludmFsaWRhdGlvbiB0aW1lb3V0cy4gVXAg
dW50aWwgdG9kYXkgSSB3YXMgb25seSBhYmxlIHRvIHJlcHJvZHVjZSB0aGF0DQp3aXRoIHRoaXMg
c2VyaWVzLCBzbyBJIHdhbnRlZCB0byBiZSBzdXJlIHdlIHdlcmVuJ3QgY2F1c2luZyBzb21ldGhp
bmcNCmhlcmUsIHBhcnRpY3VsYXJseSB3aXRoIHRoaXMgX3Jlc2V0KCkgY2FsbCAob25lIG9mIHRo
ZSByZWFzb25zIEkgaGFkDQpkZWNsaW5lZCB0byBpbmNsdWRlIHRoaXMgaW4gdGhlIG9yaWdpbmFs
IHNlcmllcykuIFRvZGF5IHRob3VnaCwgZXZlbg0Kd2l0aG91dCB0aGUgc2VyaWVzLCBJIHdhcyBh
YmxlIHRvIHJlcHJvZHVjZSB0aGF0IGJlaGF2aW9yICgtRUVYSVNUIG9uDQpzeXNmcyBjcmVhdGUs
IGZvbGxvd2VkIGJ5IFRMQiBpbnZhbCB0aW1lb3V0KS4gU28gSSBkb24ndCB0aGluayB3ZQ0Kc2hv
dWxkIGJsb2NrIHRoaXMgc2VyaWVzIG9uIHRoYXQgZGVidWcuDQoNCkkgc2VlIGEgZmV3IHRoaW5n
cyBpbiBjaS1idWdsb2cgdGhhdCBjb3VsZCBiZSByZWxhdGVkLCBhbHRob3VnaCBJIGRvbid0DQpz
ZWUgYW55IHJlc3VsdHMgaW4gdGhvc2UgdG8gY29uZmlybToNCmh0dHBzOi8vZ2Z4LWNpLmlnay5p
bnRlbC5jb20vY2lidWdsb2ctbmcvaXNzdWUvNzE3NT9xdWVyeV9rZXk9YTU3MDdhNGQzYWUyZWJi
OGMwNGVmNmNlYTBlZjc0NzMyMmRmNGVlMQ0KaHR0cHM6Ly9nZngtY2kuaWdrLmludGVsLmNvbS9j
aWJ1Z2xvZy1uZy9pc3N1ZS8xMDQxMj9xdWVyeV9rZXk9NDAyZjI2MTU0MDZjNGFmYTQ4MTRhMjk4
NDliMzEyYTBjN2I2NmU5Yw0KaHR0cHM6Ly9nZngtY2kuaWdrLmludGVsLmNvbS9jaWJ1Z2xvZy1u
Zy9pc3N1ZS8xNTAwND9xdWVyeV9rZXk9ZTBjZTYwMWFlNjllYzc2YmJkZjI3MjkzZGMyOTE5YmEw
NzM1N2RlMw0KDQpBbnl3YXksIGF0IGxlYXN0IGZvciB0aGlzIHNlcmllcywgSSB0aGluayB3ZSBj
YW4gaWdub3JlIHRoYXQgaXNzdWUuDQoNClRoYW5rcywNClN0dWFydA0KDQo+ICt9DQo+ICsNCj4g
wqBzdGF0aWMgYm9vbCB0bGJfaW52YWxpZGF0aW9uX3NlcW5vX3Bhc3Qoc3RydWN0IHhlX2d0ICpn
dCwgaW50IHNlcW5vKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoGludCBzZXFub19yZWN2ID0g
UkVBRF9PTkNFKGd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5vX3JlY3YpOw0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uaA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmgNCj4gaW5kZXggZjdmMGYyZWFm
NGI1Li4zZTRjZmYzOTIyZDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF90bGJfaW52YWxpZGF0aW9uLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3Rs
Yl9pbnZhbGlkYXRpb24uaA0KPiBAQCAtMTYsNiArMTYsNyBAQCBzdHJ1Y3QgeGVfdm07DQo+IMKg
c3RydWN0IHhlX3ZtYTsNCj4gwqANCj4gwqBpbnQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9pbml0
X2Vhcmx5KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiArdm9pZCB4ZV9ndF90bGJfaW52YWxpZGF0aW9u
X2Zpbmkoc3RydWN0IHhlX2d0ICpndCk7DQo+IMKgDQo+IMKgdm9pZCB4ZV9ndF90bGJfaW52YWxp
ZGF0aW9uX3Jlc2V0KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiDCoGludCB4ZV9ndF90bGJfaW52YWxp
ZGF0aW9uX2dndHQoc3RydWN0IHhlX2d0ICpndCk7DQoNCg==
