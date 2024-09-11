Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3184EE01F3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 05:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DD010E040;
	Wed, 11 Sep 2024 05:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCRWlMdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDFB10E040
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 05:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033246; x=1757569246;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=62Oksoa7tWUM6feWK9k+izga0jK7b4K9S36z3Bc5zEg=;
 b=LCRWlMdQpJb1TaD/hwO5js9LNGNU/VQzwvpS2IldYM9eLilDqrOf3qHx
 OYQqfhvDZReq3amjGzu0M0Zc4itCuh/wb9Gmx9O6nn1O4hnbu/ZSbUaCb
 TuDrwPUe/NiZ2GetesdIt3S6E/zMNo7s4fPoENcJA1laDR5irC371h95z
 LQnRrt1h/+FLSprw7tAf/RBxvjzUPcSD7Okcc4VDX1+FNifQs9svNbRGQ
 FzkCqOhK6ZyKaHTr5B2fntlI4ds7x/9Gaw6P+bD3f7EXjQBAI3LZwU3wY
 LollQBF3qMwkAawkj+ABvgFohtN4DGpp59K3Xj0uTJdLGW5VYCGWJOLGN g==;
X-CSE-ConnectionGUID: PZdQAKd8S+qKugwmfbsNbw==
X-CSE-MsgGUID: Z9VGvjXnQFypt16fm6L5Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42332831"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="42332831"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:40:43 -0700
X-CSE-ConnectionGUID: Ap6wyGD1TyG/ZMcmO/XR1A==
X-CSE-MsgGUID: gz6oUAIjSiS5/AHhuXcd3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67102341"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 22:40:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:40:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:40:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 22:40:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 22:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmVXH0IlILfoF9IWXIxpUWhQkwTkz1whX+ZYD9RruULMEIKina1DyxjezJcEwHGiuFPhT+lvFLMKYbZQvBX1AQz5hdbSGKn5P0NKBklSFgYJsBYgZIQOiLhC0gFqUpPDnXtk6bphge2iOHgN1gtEIv9EPpNTuyOehF/oTcRayeSxd7IgABF9t5w92//Oimdkx6POV8cYb4wUgX9X9M7U4Nj2IBzizEbGy29Dj99pxNSlxr5eMT+Z03ktE23dNYmm35kd895jW7Y+Piby0K+zouLAeVPcXEDCG/5EZBXb0Ylkzh9KrPTJsKJwWIrRRIGa7YThrNm5McY0lyWimbPueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62Oksoa7tWUM6feWK9k+izga0jK7b4K9S36z3Bc5zEg=;
 b=f+WnOB1ob63u3bQ/zhg5uDTTqx1lBRQGfs3Jh6lfux06mbRJKvhGNuPnkFEkTQqMUudZBBXjoTO60VDSBOBPhvKBcTaAB2qAueBR420Aou71bChMbtxXs8/UI3ZJRBRH5tRYjPCgZLXiuoHo3P6olzEggZUBliI1Xl0MyImeC+Xlxn2E1HrxIar8VMGeGhpJOa3IQQmomyrQSwDfXjiJzsKnixBkmrUjZ4hXnzwdjFUNuS9tk1aMTil41S3Fp2HL2uPBRM+wGBvIFj3g51jRkqlExHoNizVZpiaw3krDsY8R7VgNgRw2AxR/ZUHLrtZTUbMxS6C442cVHhwCfecQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 05:40:40 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 05:40:39 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Thread-Topic: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
Thread-Index: AQHbA4MWu5EJUwRB6U+K9p2GfOqp/LJSExiQ
Date: Wed, 11 Sep 2024 05:40:39 +0000
Message-ID: <SJ1PR11MB6204EEE5D341849C0D86A924819B2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-8-matthew.auld@intel.com>
In-Reply-To: <20240910131145.136984-8-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB6756:EE_
x-ms-office365-filtering-correlation-id: 1f0329d7-8923-407f-8308-08dcd2244502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TzBuVnhmcmREQ0tyVHI2MGVRaFJOdkJzeHg0SmNkMTRXQXNwdkRiL2VWdUFh?=
 =?utf-8?B?Vm9ISHRIcmZtcmo4c09RMFptRnU1Z2hJT284UDRKSmdQSXVMSGJSc1Z2cWhL?=
 =?utf-8?B?cWVCMGk4SGloM20xckhUZlJnaFZ5YlZqTmloTDZEc0hiaUp3RC9UZkd6YTVW?=
 =?utf-8?B?WU9IMExOaXFQQjU5cXRXZVliTUFCSGlrYndOSXBQQnNBMmh3Tlo1Rmp1RzZT?=
 =?utf-8?B?K1pLWjYwMEtncEtZTWRXNlo3VUFEZGFibHRhaTl5cSt5ak9JeFlqRi9yRzAz?=
 =?utf-8?B?aGJyOWROUXdZZTFXOUhkNDFSKzFhK04zdnlSaXQ0NWZMR1NUYUN4eUpPaEJq?=
 =?utf-8?B?RkFCc3l2WTd6TVl6Z2NWUUpqZmF3U1ZMOHZqQTZ5T1BTOGpxeDcwRW80ZjJU?=
 =?utf-8?B?dWdoMi80UFlCeXg5aFczSEFLSWhsS1c2ZmpNVHFCMFJ6c1lSWmV4MTBZRlBY?=
 =?utf-8?B?MUFIYVBpT0pOMktXbzVORFRsLzZ2dllYWlU0QUV6U0ZiYnkrYzA4OWt4Y2J0?=
 =?utf-8?B?L1JUclNuYlRua0N4Vkx5cVZzUXB1di91ejhNeGd3ZDRpWDRzVU1zSnpWazlG?=
 =?utf-8?B?ZjVKQXExcW1rOVNYUFdBTHV1cy9NaE0yQnFiejhFTHBsR1FJcXh0ZGpOd1NQ?=
 =?utf-8?B?bWJWMUhYQ3U5c21oSEJjZDh3SlFEUzB0VUJ4SVIzK3RTVHNiVDNrZ0JoVTZi?=
 =?utf-8?B?VHUxZDBadytXa0tPSGdTdWcxekF1U1lCLzg0Nk5qNTYvdkw2TWE0amFVVWQx?=
 =?utf-8?B?eG00UG5kRmRRUmxvS0J2bDhydS9yTG9mdG1heEFNbVM4MFZrMllOQTBNeTM5?=
 =?utf-8?B?b1IzNjBJME5QbmgyU2ZqdVdlS1dRTy9jTUlhWjc4dy9uRWxlYk5MSTk3azBF?=
 =?utf-8?B?Qm91V0kvTVJOQ2Vua3VFdXhzcDJBUWR6V08xbUwrWWp0c1JYYnhaUFVNeVVH?=
 =?utf-8?B?YnAzNElmZDBtSWFJU21ZUHExUlJ1dExSMzE3RGt3Q3RqU1A2U1F1U1E0UHJC?=
 =?utf-8?B?ZjVjbkxDTUVCQXp4RUd4YTMwL2QwREtrYmN1VFc0SGY0R0JWMlNQeFlsZjR3?=
 =?utf-8?B?WnNxenFuQ0RIMTVWKy9qSHdDNUlOMUF3TmhObHBzNHJuck42RFhTWkxkSW1o?=
 =?utf-8?B?VWIxVmRSdHQzSHVyVWRYS2VWUDNQZW1iY2hhZ211U1pSSlZ1QjdvcEhCOVVQ?=
 =?utf-8?B?U0h4N3RicnZENzBsdDRsMEFPM3N1YU5vMUJKNXZyeEVGaEwxTys5NENzb2NO?=
 =?utf-8?B?N0FtQ3l1Z3pKd0s3Q0dKVkNuZHBpV3FJYU9DM2diWDJUY0lFSDRvWFZQUUZz?=
 =?utf-8?B?Q1JWQm15bXNIeVY2NDdlZUt3MTdaUkNwbGFqL0NpZjA5MkhOWGg0SnNqOGdT?=
 =?utf-8?B?bHhhTDhhVU9KY0ZxajRkS1JmRzhseG5uQ1RsRTRPN0hvZkcwd2pGV3ovcysr?=
 =?utf-8?B?Q0lBUnZJMGh5cHl5OCsrRU56TkgrTUZRWVlZc1Q4ZXdSL0xvbVk1QkU1YjJZ?=
 =?utf-8?B?TnNDRWhMUUVMNzdMNFdFVUc5Umd0NnpWMXM1WHlKYWtUV2R5aFdzYU5PT2xo?=
 =?utf-8?B?VGdFNlRhOVAvOThFSk45aXFZMCtRcmpUajJOempJeEp5YUMyMGp6L0MzZENi?=
 =?utf-8?B?RHA0bnNSVXlvMVlYOUc4dWxHS0tzK0JaSC9TbkpaMGoxS1I5UGt2SGZqMnJM?=
 =?utf-8?B?K3l6TWhQSGViM0VTdlRLc1ZMMFh4OXJDRTl0dmpsd0RMSkVnSE90Q3d2Vk12?=
 =?utf-8?B?Y1ZBODVTZi9FZjNuT0oxNkRaUEc1Z0wrQktYYnI1cTNIRUk4dkYxRGlLaDlo?=
 =?utf-8?B?aTJwQWFGb2tGVHY5ckM1RS84UkM4WE1WRlZ2WCsxQkVsMGliZ0pRb1pNSitz?=
 =?utf-8?B?bEhFMGlpRzBjS0FqYk1lY25YTTBCSEpVODJMa0tzZ21ZbGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SStDSEk1MzB0cU5Bamw5U2FML0RhQ1NIZ2JianFhWHd6L2l6bUpYclAwUkZ5?=
 =?utf-8?B?UldQaDJScUdPT29UeXV5cXUvd0labjRzVCszamFnTWQyUXB3L0NRbHFETS9h?=
 =?utf-8?B?TVdxUVJmaXFHVDU1VXZvZW9jVWtCWkFBZmVuU3ArUXA2YmdQWEVZUXVTQzU1?=
 =?utf-8?B?a0RpTTdzNHh5ZFU4aDlzQ25scXhxMFFrS3RVcUlkQkFSMXU1QlhJbEQvWDJW?=
 =?utf-8?B?SlUwSUl5V2JIc2hJTGI3N2UrUEwxYjZ6cVQ3aXhWT1FLbzJSS05nanVxWDJN?=
 =?utf-8?B?MTBxZitYT2treXdxM1pVcjljajhOMHBUZjNQMnlqeE1XSDZ5VDlCNXpadFFz?=
 =?utf-8?B?dWwyNndVbkpOOUtXT3lsOWtqSFBDcTc5eGRMUmh3NndXTEFBN2UrTEM4VTZW?=
 =?utf-8?B?QUt6NEZjMWhlWmxweTB6empBVXljTmFFdSs5VFBwdTdkeFB3ZkZVeTJOd0ow?=
 =?utf-8?B?dS9xalJqOUdpYmUyWTcyR3pNTHF3SkNjZ05IUFhNOWtmUHYwMlVqVWE4OUFC?=
 =?utf-8?B?WFBLS1dhNE9DTmVGblpNWVBjOGFva211Zmt2TXYxU2dnRG5wU3phb1NzRnhD?=
 =?utf-8?B?S052QWJVL00yclAvSG1EV1FvL3htRVRvQ1ptU2piSDk2T1ZtYzY4alNwcHRN?=
 =?utf-8?B?bEs0MnBuUW51bWFiWi9vd2tDSGpVUE1qVit0dWxpU2VaL3cydVREd0wvWHBJ?=
 =?utf-8?B?ajRFMUFIUUlOcE52ZThNSkJpR0xVWi9kYjRQL0VuNkVHNk9rMjZkWHlXTmZq?=
 =?utf-8?B?bkVnTW0xSkcyVzFSNXRCZ3FLeTF2ODRrR0NwYzFFQWRvR0tsaGp5ZUM4RTZj?=
 =?utf-8?B?RU9QL2wzczFjZVV1WU1BVkVKL3N1Q29FZUVFS2h6TFl3RHpnbmE5TENwdmxM?=
 =?utf-8?B?K0JvZExBODVpMjBVRXhuTkVPNUhPa0FzVkdPYVZMYlYyMjVNQ0cvSEFnZDQ3?=
 =?utf-8?B?UUVYWkdIbFJlQVlyUjdXRUY2OExpa2ZZZ3JhZlcwNExGNWtIdWE0emdZTHlk?=
 =?utf-8?B?bkFySXhBd3lzbzJZSnUvdG52dEdmTWRWZjgyNkovbmRSeGluek9PaGZPNENz?=
 =?utf-8?B?UVd6SktoemJOd0sxQzB4M1g1VndnT09oWk81Z1dxSFFXUGN3eXhTdW9HUkRx?=
 =?utf-8?B?K0FnY0pzY1R1SFRwRmo5Y3kyZHpYWUFEUmZEbEYwSjU0RmVCQTFoMDJhZVhw?=
 =?utf-8?B?UXZ6ZTdTbERzYi9HWmhETHltVWhubnhQOHZvL1ZrRXcvNFF3dWRJdllhcG10?=
 =?utf-8?B?Tm82clJ2SVNJM1V2SE9xUkRuWjFzUThtVzc0eHd1cXlHQUhhVVVReTE2eEVn?=
 =?utf-8?B?bGVOQ3VOZ2JpRkQ5bW1MaGgrVzdubmhxTk0vbEd6RmZHRzU3UE52citZampK?=
 =?utf-8?B?TVZKc1RzemgwMXZnT0N4V1FXVkcrdDRtRmFmODVCQXArSTNZOFBpbTJFUFFw?=
 =?utf-8?B?TkhYTUtjcnN0NVNqczlPTHFWbnRiKyt3YTJEWWdBcXp5ZVRZOUlWTmRORXlU?=
 =?utf-8?B?VWo3ZGkyTEw0SFZENWlmOTZGcG5FeHB4VkZub1g0NjlHL2o3eVhWSmtaajB4?=
 =?utf-8?B?Q0FGMnlXVmxsK1FyNWxKQzFuaGxBTEk2MUxEMWxscFhQYWF3Z1pkbldmS3Qz?=
 =?utf-8?B?cG5URmFMa2hPMHJtZkdQZVpoZXNVSHhqYnc5RFZPQi9CeXcxZlo3SGFxTEg3?=
 =?utf-8?B?OTdKWU1NSFpvd05DcWNPdGpGSG94Y0xXUEZzUXlCTFlzTjJ4OFcwQ3dwM3Mx?=
 =?utf-8?B?L1BwQWRGWGlnVFZPbTRUZXVpVnRMTmYydlhPZ0MrR1orLzFQWnMraTZzUzdz?=
 =?utf-8?B?V3hnNEdCTWl1NzNQM0o3VHFOL0Y2a1pnaVRxU3dhWHM0NzNXWU1wTEJhQnpY?=
 =?utf-8?B?dWlQRVVNQ2FUY1A5SHlSOUYrN0xDU0NJVmFkYVM1a3BoL1BPYmc2cStUTStL?=
 =?utf-8?B?Ym9JbmYva0NuZkF6T1FjUkF4SU5RK1FsT0ZZVjBTSUNyVFF0d044TG1jM0o2?=
 =?utf-8?B?RlhydTdKa0txSVBBRjRNa3Zobk1qbVNwdEt4Tmt0U2ozL0UzT0NhMXVnNjdE?=
 =?utf-8?B?TkdvVy90NUNMaFNldDVCeVJoMDdpR3hWS2V6Y0IrY2pGb0pCUGhldms5SnZ0?=
 =?utf-8?Q?LOF0kXt05vogcE83s+x+IviTG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0329d7-8923-407f-8308-08dcd2244502
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 05:40:39.7657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8Boc8lBLssO2qCGdLwpRV6bLrCU0HRKa1UfqaSTbCPlcgC6RouBJXxnuO8riw2jiW4KaFHO+/WNu+k50+SPfCqMI37Pl7nFJ3oFDCck/ZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAy
MDI0IDY6NDIgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
R2hpbWlyYXksIEhpbWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT47
IFVwYWRoeWF5LA0KPiBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgVGhvbWFzIEhl
bGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggNC80XSBkcm0veGUvYm86IGFkZCBzb21lIGFubm90YXRpb25zIGluIGJvX3B1dCgp
DQo+IA0KPiBJZiB0aGUgcHV0KCkgdHJpZ2dlcnMgYm8gZGVzdHJveSB0aGVuIHRoZXJlIGlzIGF0
IGxlYXN0IG9uZSBwb3RlbnRpYWwgc2xlZXBpbmcNCj4gbG9jay4gQWxzbyBhbm5vdGF0ZSBib3Nf
bG9jayBhbmQgZ2d0dCBsb2NrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxt
YXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1h
bC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBDYzogVGVqYXMgVXBhZGh5YXkgPHRlamFz
LnVwYWRoeWF5QGludGVsLmNvbT4NCj4gQ2M6ICJUaG9tYXMgSGVsbHN0csO2bSIgPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9iby5jIHwgMTQgKysrKysrKysrKysrKysNCj4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgg
fCAgNiArLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGluZGV4DQo+IDUzOTQ4YTk2NTQwNC4uNDE3NmIz
MDJjMzhkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBAQCAtMjMyMCw2ICsyMzIwLDIwIEBAIHZv
aWQgeGVfYm9fcHV0X2NvbW1pdChzdHJ1Y3QgbGxpc3RfaGVhZA0KPiAqZGVmZXJyZWQpDQo+ICAJ
CWRybV9nZW1fb2JqZWN0X2ZyZWUoJmJvLT50dG0uYmFzZS5yZWZjb3VudCk7DQo+ICB9DQo+IA0K
PiArdm9pZCB4ZV9ib19wdXQoc3RydWN0IHhlX2JvICpibykNCj4gK3sNCj4gKwltaWdodF9zbGVl
cCgpOw0KPiArCWlmIChibykgew0KPiArI2lmZGVmIENPTkZJR19QUk9DX0ZTDQo+ICsJCWlmIChi
by0+Y2xpZW50KQ0KPiArCQkJbWlnaHRfbG9jaygmYm8tPmNsaWVudC0+Ym9zX2xvY2spOw0KPiAr
I2VuZGlmDQo+ICsJCWlmIChiby0+Z2d0dF9ub2RlICYmIGJvLT5nZ3R0X25vZGUtPmdndHQpDQo+
ICsJCQltaWdodF9sb2NrKCZiby0+Z2d0dF9ub2RlLT5nZ3R0LT5sb2NrKTsNCj4gKwkJZHJtX2dl
bV9vYmplY3RfcHV0KCZiby0+dHRtLmJhc2UpOw0KPiArCX0NCj4gK30NCj4gKw0KDQpMR1RNLA0K
UmV2aWV3ZWQtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQoN
Cj4gIC8qKg0KPiAgICogeGVfYm9fZHVtYl9jcmVhdGUgLSBDcmVhdGUgYSBkdW1iIGJvIGFzIGJh
Y2tpbmcgZm9yIGEgZmINCj4gICAqIEBmaWxlX3ByaXY6IC4uLg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaCBpbmRl
eA0KPiBkYmZiMzIwOTYxNWQuLjZlNGJlNTIzMDZkZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2JvLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgNCj4g
QEAgLTEyNiwxMSArMTI2LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgeGVfYm8gKnhlX2JvX2dl
dChzdHJ1Y3QgeGVfYm8NCj4gKmJvKQ0KPiAgCXJldHVybiBibzsNCj4gIH0NCj4gDQo+IC1zdGF0
aWMgaW5saW5lIHZvaWQgeGVfYm9fcHV0KHN0cnVjdCB4ZV9ibyAqYm8pIC17DQo+IC0JaWYgKGJv
KQ0KPiAtCQlkcm1fZ2VtX29iamVjdF9wdXQoJmJvLT50dG0uYmFzZSk7DQo+IC19DQo+ICt2b2lk
IHhlX2JvX3B1dChzdHJ1Y3QgeGVfYm8gKmJvKTsNCj4gDQo+ICBzdGF0aWMgaW5saW5lIHZvaWQg
X194ZV9ib191bnNldF9idWxrX21vdmUoc3RydWN0IHhlX2JvICpibykgIHsNCj4gLS0NCj4gMi40
Ni4wDQoNCg==
