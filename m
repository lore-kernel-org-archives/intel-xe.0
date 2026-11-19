Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F447606A326
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GnpM31nQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ClFF1Rcf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28FD1122F2;
	Thu, 19 Nov 2026 11:44:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A991122F2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795088640; x=1826624640;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=42riRZfn8Ccolq1acgyVurXJM4QGA3YWBTMCzVWaHlg=;
 b=GnpM31nQMCDZyXEN7SrCdUxITDyOGVQa+h228uG6D+GGxa9xfDNELYbh
 WD761UDcNKLHhyOVUG9O/vgCvyPS9/s3yqtmtDWGgMVEr4Ov/U7AZ4gbl
 Jo795Re7zDQylTL+ffjx6HDk2hBOK9h9dOpJjdhzFEeu111JzJs5oXfYX
 mL/4leKJ8bm7xemv3ZgXl1tTHUPtkJN24DzvmJDstbZ+b0rglfo5yhn4W
 hHsHyZIOSmuS/e03V3xoJTUFtqZJ8nLaV4wAZ5KQ0Y1MGA97VRs3FKeHB
 GLc8DDyienPf3jj+8EDMdyIzuw6sHbHa5spv/m5ANYaWBrjjQD2uRzIKg g==;
X-CSE-ConnectionGUID: /LXvDe03QKqLEl2ur+js8w==
X-CSE-MsgGUID: sWo8nHRGR9avDIjLMWjCkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3924134"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3924134"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:43:59 -0800
X-CSE-ConnectionGUID: wFDNm21mQSqV3l/Ke4IRkw==
X-CSE-MsgGUID: VJ+yqOQoQVGqlGEIzG22WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10643735"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:43:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 03:43:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 03:43:59 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 03:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNYhe0FKsTQqvOtmlXJlyaCHKZdoLIKF5SfDEzxiHs8rIfFByGqdDGvOqWbeC9owiAeb+beAsy/5szITh0P+D7BZBio9nYZtSoJV5X4ikuYyco9qQOFjto+ZZoWHfcvL+2yAjWXa4L7VDD7PjMWb3JGQJBip0ZuBhG26QIUyGlN5YjHH4fIDfRDbqU+5vDT9lATNw3ykANECAM5WUff5mDyTCIBRVGcl14wvhCyZcdPkX2XD9zgyNunZDQtUq53GifBk8kZhMgAH3xMTsX+JbgpwF5cNinScRwqiJsg4U34ifN7LTtURwVUcBlmLNuOzlnEkyCVB53s41hguYnUq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWhBxlqFttT3Seq+DgzS2l8/frxe1rakCwTH+4tFu68=;
 b=WGNbx56ptq9hBW5WmE8uP2uS64pebSKAhJIy2HKKgAaxMMT0idaCS67sZETIAEXtSk2lxI48zMReU1BhTkklIoDr7VOvVfVxHah054/S4Ut9y/6UUrUsfqvke7LbaDxcqJYSC0/5JKrFphhJPHOfMQiwMk1HtTs/464lk5gtVPr3WsMfPyHbn9h5YhTLBl9F/u3MbE+znEdJKVFWx7XUOtAy7Jqna+m/mCNhxXv6X9a9Q3tEDqPAne/OqQIIPk3ygwbjeHuDZhSB3z619mUWI0qwgVbPNX+Jwuf8gDGMlsv1ubcompGeoaD99W8ZLFXGXPv+4pVGKtPjJ4G0yVP0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWhBxlqFttT3Seq+DgzS2l8/frxe1rakCwTH+4tFu68=;
 b=ClFF1RcfwqygjB6x0+SvTJoGgYrpAtUKgHhRvpp2bDyqq0M9xWCmuITyEq0xYUS5ilVIE10CKwDoTvrfOsyrn9R+nk4R+dBLAs3CVzioACwUC49aA0M+U+mWuOyQO8xFInyS13hEvkL91dO/QmMtjGpFgxH/8AuDldGTlMuzA0U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ5PPF2FCF00E1F.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 11:42:20 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 11:42:20 +0000
Message-ID: <f9e68483-67ad-4b95-9e6d-665ff0cdcaaa@intel.com>
Date: Thu, 19 Nov 2026 17:12:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe: Expose CRI maximum memory frequency and
 bandwidth in sysfs
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <sk.anirban@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20261118172458.316603-1-naresh.kumar.g@intel.com>
 <20261118172458.316603-4-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261118172458.316603-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ5PPF2FCF00E1F:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc01dea-ece0-479e-6663-08df46322b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261022113327099003|261022075727099003|261021123027099003|10067099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: PjdfqDb3t4Og1ErwbjBStHk5kI7UbpbH9Vqw1J1w2tQ70ktL7fBUBQkVKON9vcxMWi83NBuS7p5CFzrxDS4uED4zfjI5gLcpFZeFtvkhYUf+ZqUw55URNTKK9O/AK/yK55vwby+C/g2jAfW4qLo+VkwsRVIyFmiHN9SiQcnUk35YhrX9gCQ7JHW5slLnbD14g1/qLeofp9Mb7i9OkADxOr/Ccq+Zl9OEwSDPyOAVpO0nP8VJV+sGd3Zbv9BbeTL+Sb4rBhP3v9sy+vO/nmddc4TZjRrlthtFdFcEJsL7M72jiZfrJhURWAdA6OOTiUJ4zAPPagfuaGvxqqQdpDQkLgYkTWFeRYvrK7B+qwTqy/qPtsVu0o6n3KCZ8fVN6Oun7JFBXuNwiuJLL9I2gSc1jeHsNngUpX/0IOsMCBdQ7fUSjyWgXXr2nuzSpicE4uxCQ7LDSqd1/9x+cpuxvAtNPzwZR3BcyZDwqyU2ap3KNZYExzSLNLvImkZU5vWoT87VKykUuq/El/vfOfd13or2nAxwz21/pLRHxSvOqIr1snDk+5o13b+ZnxxR63K1Noj6HvKTocKCibl/pINT0J88eETLk1Z8KQzP1SJ3JdMd7Fh5CwPDtZnY/Kzdz54B83jLgG7p0AeZ/Es3eZHd7kw566qhERW6o2wEhCWKqiqN/A8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022113327099003)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm5zdHZsZG9SZldYQ2FodzROSzl3OFlsdlZJdWZ1ZFBKK29kZTBpajMwcnRW?=
 =?utf-8?B?U3NXZkJFN2V1cEI5UGVibmxDOFI0SzJBTlEvWXdNUjMxSjBCSDVrR0p2SXVU?=
 =?utf-8?B?dTY1Um9pdkhGVVAzbVZ5SGROS01weDVkWXpVZXhHTGg2QzVjVEFweERrTUNr?=
 =?utf-8?B?dUJtOGhlWFhlY2txNDFFcXhOQjNhYUdDU3VFZnZOQ0hlMFFRUU9mbTRjZnhh?=
 =?utf-8?B?TTdQeXlPd2hnLzJ4bjhpQ002Y3Z1QXU0Tjk2NHZ0Z0xxQ2svMnZ6R3I1alRn?=
 =?utf-8?B?b2RkK2t6elRadE9PK0VuaDY1eFhsczhVVWp5TUNrVm1MTWV6YWdxcGdQa1Fx?=
 =?utf-8?B?U0JPNXRxVUhYWk0yTkJwd29NNkJQaFo2WDJCY0lZK1ZGQmdJckRONkZDdlM0?=
 =?utf-8?B?OXB1OVI2aXpwelc2eWs0K1pWZ2lMTVBLOWk1ODlGU25rL0pqZmhOSXk1QlZ1?=
 =?utf-8?B?d3FhUkIybVJRZHJpdVg3dDdKU1ZES2NHczB0ZTJaSjgzTXBHMmttcHl6dThR?=
 =?utf-8?B?N0V3Q1pJNkxZckRKMkZvZFNVdEIvVU9tMGN5azd1dmROQWdxOHlIZGJoTW1Z?=
 =?utf-8?B?bC9MLzZxdnluRHJ3NHhoRG1PWFdxTnlZTFh4SHlkdGU1cVhlZkpuS2N5LzJM?=
 =?utf-8?B?Rk5tNzZ3OFVlQXdvU3NFc3FxNkZvekpENzVGaFFXZDVlZXlRcmlSQWVCeXI4?=
 =?utf-8?B?b0Fzd0h6UTdrR2tuc3kwWG4xa3ZRYVE1RCt2d0R5WXRZTVZaUkFoUVh5d2kr?=
 =?utf-8?B?R2FVSzZ4SlJvdGtCNllQaFhPRWRKU2J2MHplM01SVTV2MXZLbzlUTHU2QlU1?=
 =?utf-8?B?cHo3MDJLNjV2RkZwZFllWHlPMisvMDFiZHZ4OG5SKzl3MHpTUVdrRGp4Zy9m?=
 =?utf-8?B?K1NFaTg2MGs4VE9hQVZFMTEvNmNBV2YxMmdTTDFibndGYTJia3BRTmZ3TE5w?=
 =?utf-8?B?WlZ3dE85bExXdzVFVzZYRE95cFJLaEJWdUFIaVAwMm8rY21NRVN5MzUwK0lS?=
 =?utf-8?B?d2RiR0lIUFFIUDJoazF5dkM5Mk1wTWFkS1V2cHVlTUtZbUVQWjYyd3NZanpm?=
 =?utf-8?B?VDZjTFVmRG8wamMycndQWWtIbEQrS1R5RjdJRXRSL3dMMWdlVkkxTnNaNmhS?=
 =?utf-8?B?cEZ3b2FUU2RqOTAwY010bDFjYzlTTGljVTZiZUYrT1ZCSGZIK3M4TmUxZWsx?=
 =?utf-8?B?VDc2ZTdyT1JEMjRxeXJqZlQ4Tm83L3lqTkVRRDZkNnVYTVkweGZuM0ZJQlBV?=
 =?utf-8?B?NE1ndzc5OXh5SGtmdmJ0M2JUaDhUR25QSUdOcVJaWmRWU2pXeUdyMHNZem1Q?=
 =?utf-8?B?aHpGUGJSWVNoQkRNeTJFNDdGeWtjVXMzVG8xUTV1NTc3OEt3cnhnZnVLNUY4?=
 =?utf-8?B?MW1PeTlTMEcydlJRR0VyUk5oeHlUaCtoUDhnM1JrTUNFYWQ4M2J5OEpZMkV4?=
 =?utf-8?B?UmpRc0NSRzQ1ZGJ3T0N6SjBVaUV5bW5hSkRaTjZVZDZRNGRpSU8yTlJhSUN3?=
 =?utf-8?B?ZC9HQlZRNnY0RXNSamF0cVo0WS80cXFOQ0svdjFDYjZYZ3F3Y0RFUmdjYU9q?=
 =?utf-8?B?YkMySlZQQmdsM3gyeW4zUlc4c2s2Q1VPaHh4dkxoaVlSSjdCcFNBR0crUW5X?=
 =?utf-8?B?WjRjNnNsN2lWbVcrTVRaZ1pLSHdhOTE0M3J1ZWpjNEliNGlaOUw3cWNLVWNl?=
 =?utf-8?B?K3l3TXZkbUlXS29DZEdVeUZkeHZITEQxcnZ4Tk5icW5OampsMGlHRU9qZUQ0?=
 =?utf-8?B?dmJhV3VNa1FVcFVnSUtZOFFFcmFHOEp3U2NkTTN5c0hsak5IK2s0d2FlcHhX?=
 =?utf-8?B?akowbDArKy9iOXBJMEpZc01aOWZoalR1eVY1SFpSK3VUMHJBTHNndXQ0RlFM?=
 =?utf-8?B?c3Rhelc1bFIvTWpsU29VQ09iQTZWRzJ6VmgrdXd3WVQrVzJHRnhyNnlKVEZD?=
 =?utf-8?B?OVZDTkc2a210T2tvOEJ0SFBxOVNPQVVNREw0dExPMXVRN0F2am9FTytDNzVt?=
 =?utf-8?B?SC96UUQ2UEpXMGNXWGJWMGNTV1AxRU9uVC9lZkRMVW1ZblFraHVvcG56RnFx?=
 =?utf-8?B?WXZpbXArZVN1RVVOQkdZWGZzbzVJUUZqZytyN01wSG5RdjFoUjhDT3Fzb1hH?=
 =?utf-8?B?alJRZzJSN0pCMDRoWTB0dUhqMGZHbmtpQmt0MHlzN0tDL3ExS2xDZU8xTWNV?=
 =?utf-8?B?cGxmRXIvZUZKMnN5b1JzMkNldThVU2dVVHdGL0JvMDJmczR1VGVXWHdCSmFs?=
 =?utf-8?B?MG1zYXJIcHBrRHBMUXkxWElERElLV1gyVjBtM0dMbTNNeHZoUnZpUnFvdEJk?=
 =?utf-8?B?S2lEcGZjUWdVSUVIcDRORkkwWm5CaTNjMkFHWWpzVkxBdkRxUXRtUT09?=
X-Exchange-RoutingPolicyChecked: CwxD0L36aIdromFCwY1/fEfMGZ1l006UqJi3g+KV4RxXX1v/czJS6jVBiEN/5yy808nuwgBb+h275PpciGhZckPRC+827FaVm7D+RpuPwRhhD9uhHdyDVvMpXBvjfy/TGx62KnIcYnTRIpqCnHpmch1YEVnTqdXL9p6oI0V5OjEFfnUEaq0J0i7svz2RohfXxw5FIYpO3gtRWz0gNEKMq+PfkYXn3b+mk8SjszOWQgUotBpKMsDh8mx3y2demHy04jPonYYtW0p6889JN9JyiF8j48YOQ/9W96LiQhjIILq+wyXSHcquMncW2GzaEnE4HVyLXOGvIzAeN/7eG9IsqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc01dea-ece0-479e-6663-08df46322b81
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 11:42:20.2934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tw1vwRov2fPKSj2oMW68zXIjkuA2t15E0WDiipiKFBFzBw6DkKYft5ywYxI7FohmI0iRnHNKoJ6UEhrRLB7Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2FCF00E1F
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 18-11-2026 22:54, Nareshkumar Gollakoti wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> Expose the maximum achievable memory frequency and bandwidth reported
> by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
> tile#/memory/max_bw on Crescent Island.
>
> These are capability limits, not the current memory frequency or
> bandwidth usage. The existing PVC memory/freq0 entries are unchanged.
>
> Document both attributes in the Xe sysfs ABI.
>
> v2:(Sashiko)
> 1. Fixed CFI violation by updating attribute types and callback signatures
> 2. Added a check for xe->info.skip_pcode in memory_groups() to prevent
>     exposing these attributes on Virtual Functions,
>     where PCODE access is disabled.
> 3. Changed kernel version in documentation from 7.4 to 7.5(Badal)
>
> v3:
> 1. The device_uid version was reverted to the previous value

There is no effective change to device_uid, please drop this change log 
entry while merging.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-gpu     |  24 ++++
>   drivers/gpu/drm/xe/xe_vram_config.c           | 122 ++++++++++++++++--
>   2 files changed, 132 insertions(+), 14 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> index 4dc4afc3961d9..b563b7e8a9d9c 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -8,3 +8,27 @@ Description:
>   
>   		This sysfs file is present only on supported Intel Xe platforms.
>   		Accessible only to users with administrative privileges.
> +
> +What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_bw
> +Date:		October 2026
> +KernelVersion:	7.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Maximum achievable memory bandwidth reported by firmware, in
> +		megabits per second (Mbps), as a decimal integer.
> +		This is not a measurement of current memory bandwidth usage.
> +
> +		This sysfs file is present only on Crescent Island devices.
> +		It is readable by all users.
> +
> +What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_freq
> +Date:		October 2026
> +KernelVersion:	7.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Maximum achievable memory frequency reported by firmware,
> +		in MHz, as a decimal integer.
> +		This is not the current memory frequency.
> +
> +		This sysfs file is present only on Crescent Island devices.
> +		It is readable by all users.
> diff --git a/drivers/gpu/drm/xe/xe_vram_config.c b/drivers/gpu/drm/xe/xe_vram_config.c
> index 31a3405c39abd..130a8f76e6663 100644
> --- a/drivers/gpu/drm/xe/xe_vram_config.c
> +++ b/drivers/gpu/drm/xe/xe_vram_config.c
> @@ -8,13 +8,14 @@
>   #include "xe_device_types.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> +#include "xe_pm.h"
>   #include "xe_tile_sysfs.h"
>   #include "xe_vram_config.h"
>   
>   /**
>    * DOC: Xe VRAM config
>    *
> - * Provides sysfs entries for vram frequency in tile
> + * Provides sysfs entries for vram frequency and bandwidth in tile
>    *
>    * device/tile#/memory/freq0/max_freq - This is maximum frequency. This value is read-only as it
>    *					is the fixed fuse point P0. It is not the system
> @@ -22,17 +23,22 @@
>    * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
>    *					is the fixed fuse point PN. It is not the system
>    *					configuration.
> + *
> + * On Crescent Island, the following entries are provided instead:
> + *
> + * device/tile#/memory/max_freq - Maximum achievable memory frequency in MHz. Read-only.
> + * device/tile#/memory/max_bw - Maximum achievable memory bandwidth in Mbps. Read-only.
>    */
>   
> -static struct xe_tile *dev_to_tile(struct device *dev)
> +static struct xe_tile *kobj_to_tile_parent(struct kobject *kobj)
>   {
> -	return kobj_to_tile(dev->kobj.parent);
> +	return kobj_to_tile(kobj->parent);
>   }
>   
> -static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
> +static ssize_t max_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
>   			     char *buf)
>   {
> -	struct xe_tile *tile = dev_to_tile(dev);
> +	struct xe_tile *tile = kobj_to_tile_parent(kobj);
>   	u32 val = 0, mbox;
>   	int err;
>   
> @@ -49,12 +55,16 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
>   
>   	return sysfs_emit(buf, "%u\n", val);
>   }
> -static DEVICE_ATTR_RO(max_freq);
>   
> -static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
> +static struct kobj_attribute kobj_attr_max_freq = {
> +	.attr = { .name = "max_freq", .mode = 0444 },
> +	.show = max_freq_show,
> +};
> +
> +static ssize_t min_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
>   			     char *buf)
>   {
> -	struct xe_tile *tile = dev_to_tile(dev);
> +	struct xe_tile *tile = kobj_to_tile_parent(kobj);
>   	u32 val = 0, mbox;
>   	int err;
>   
> @@ -71,11 +81,15 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
>   
>   	return sysfs_emit(buf, "%u\n", val);
>   }
> -static DEVICE_ATTR_RO(min_freq);
> +
> +static struct kobj_attribute kobj_attr_min_freq = {
> +	.attr = { .name = "min_freq", .mode = 0444 },
> +	.show = min_freq_show,
> +};
>   
>   static struct attribute *freq_attrs[] = {
> -	&dev_attr_max_freq.attr,
> -	&dev_attr_min_freq.attr,
> +	&kobj_attr_max_freq.attr,
> +	&kobj_attr_min_freq.attr,
>   	NULL
>   };
>   
> @@ -84,11 +98,90 @@ static const struct attribute_group freq_group_attrs = {
>   	.attrs = freq_attrs,
>   };
>   
> +static const struct attribute_group *pvc_memory_groups[] = {
> +	&freq_group_attrs,
> +	NULL
> +};
> +
> +static int memory_config_read(struct kobject *kobj, u32 subcmd, u32 *val)
> +{
> +	struct xe_tile *tile = kobj_to_tile_parent(kobj);
> +
> +	guard(xe_pm_runtime)(tile_to_xe(tile));
> +
> +	return xe_pcode_read(tile, PCODE_MBOX(PCODE_MEMORY_CONFIG, subcmd, 0),
> +			     val, NULL);
> +}
> +
> +static ssize_t cri_max_freq_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				 char *buf)
> +{
> +	u32 val = 0;
> +	int err;
> +
> +	err = memory_config_read(kobj, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY, &val);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +
> +static struct kobj_attribute kobj_attr_cri_max_freq = {
> +	.attr = { .name = "max_freq", .mode = 0444 },
> +	.show = cri_max_freq_show,
> +};
> +
> +static ssize_t max_bw_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			   char *buf)
> +{
> +	u32 val = 0;
> +	int err;
> +
> +	err = memory_config_read(kobj, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDWIDTH, &val);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +
> +static struct kobj_attribute kobj_attr_max_bw = {
> +	.attr = { .name = "max_bw", .mode = 0444 },
> +	.show = max_bw_show,
> +};
> +
> +static struct attribute *cri_memory_attrs[] = {
> +	&kobj_attr_cri_max_freq.attr,
> +	&kobj_attr_max_bw.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group cri_memory_group_attrs = {
> +	.attrs = cri_memory_attrs,
> +};
> +
> +static const struct attribute_group *cri_memory_groups[] = {
> +	&cri_memory_group_attrs,
> +	NULL
> +};
> +
> +static const struct attribute_group **memory_groups(struct xe_device *xe)
> +{
> +	if (xe->info.skip_pcode)
> +		return NULL;
> +
> +	if (xe->info.platform == XE_PVC)
> +		return pvc_memory_groups;
> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		return cri_memory_groups;
> +	return NULL;
> +}
> +
>   static void vram_freq_sysfs_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>   
> -	sysfs_remove_group(kobj, &freq_group_attrs);
> +	sysfs_remove_groups(kobj, memory_groups(tile_to_xe(tile)));
>   	kobject_put(kobj);
>   }
>   
> @@ -103,17 +196,18 @@ static void vram_freq_sysfs_fini(void *arg)
>   int xe_vram_config_sysfs_init(struct xe_tile *tile)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
> +	const struct attribute_group **groups = memory_groups(xe);
>   	struct kobject *kobj;
>   	int err;
>   
> -	if (xe->info.platform != XE_PVC)
> +	if (!groups)
>   		return 0;
>   
>   	kobj = kobject_create_and_add("memory", tile->sysfs);
>   	if (!kobj)
>   		return -ENOMEM;
>   
> -	err = sysfs_create_group(kobj, &freq_group_attrs);
> +	err = sysfs_create_groups(kobj, groups);
>   	if (err) {
>   		kobject_put(kobj);
>   		return err;
