Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E029DC369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 18:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A004010E39A;
	Thu, 17 Apr 2025 18:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Agy+rW33";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A1610E39A
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 18:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744913930; x=1776449930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qTsdPVIVyJMoguog4pt3kNtqOBnyQremqL/k8Z7mVww=;
 b=Agy+rW33xCvhF2vb0bbwtxh4Ehq8285mX80hv5eyOV3gOo/S0NldpIhb
 gIX0ftSLQn7T9Bal3OJlIWmWwfZiTMpXnIYA7Xn7NMyvxY23+hq4ActN5
 98azMyzwq01bnuzWThmDRSIbMNnJRkURLbREmQ/ishJL7VvHVSFWRrFJH
 fCl+sPUHzpxWKZd89OpW+GexAQA9i1lAKO802VWCPrTHvmE+g1bVG2+1S
 gUsnWcVu8mLBpRPny6VskiEieLxyzWfPGvnTAWSG8Zwso+HnmpeB3BkPF
 mp3FtHXB9xZyHAnt2xyfKjM+EXuP2ICuSpXeKfbhczlT2aceQiGxL6UF7 g==;
X-CSE-ConnectionGUID: eUbrQi4VRLGlyvdCyQmYjQ==
X-CSE-MsgGUID: Ddgr2ciSSLC8M7jJss716A==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="56709242"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="56709242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:18:35 -0700
X-CSE-ConnectionGUID: jf6x7gfHS7uCsVo/enKNWA==
X-CSE-MsgGUID: mpg9VXjyQIWfW3xO2Xcj9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="135855529"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:18:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 11:18:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 11:18:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 11:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGtfpMWSR0rFIYDhZM/rQ9ra/HoJ0+fzJ1lTr06ZaNpXWNE42vRlFTUXehQBo7dPGOZRNDMJNlZJoLxgT4GasxiMn+KG8uGMFTN1Yyv3mVC1xFKuqlOyds23QPzn9EVFcVBVht/EZgPnP22QKLp+Ii55TA71FjMYdVuaVCM3aBGQuIJn1uh7732hzhNIBAucepL+wNRjBLKzcH/OS+W2x5Zfqh+P+lMVXa7sQ4Z5+zDuEiBVOE4+/Qi77iED0w8+RA/UX77qW4sbi0iPWp3Tg5ZjNyV8bhV/hwTS1tegLt9c4dUkcC2sFGmKLC7Xf4sCKIMTxO7tBu4XXqYZI2lfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTsdPVIVyJMoguog4pt3kNtqOBnyQremqL/k8Z7mVww=;
 b=uzct0MajTjj4+LTZemjMjj/JbZAz0QiXoiB/5icj7p+zeWka0LlUbvGPnPbd3W+NWLIsIcg2NwM6GCaRE6iPWrbUENrEyNxhtSGjzqOar1GFPeK2pPHoliVHePBbLGC/hfz5lyqmbY9MrjT5vH3Jjr/9G99ZqneKdYIQhEJNbNJLowaC2CIfOBbB+Qki/tVdRLxGndzEy6KpUBebGrdDfUEYLe8MkY2OGL/GRw8OcpH0g7PmxpWtWeE7cEUUnOclyMWzW3ogafD5s5VtAl17w22AhC3IHvhVVZuFcwGLH+3hKn8FswBtFMuDTNkP2P7pQVQqSvxgdXjIajEopuJS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 18:18:31 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 18:18:31 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't
 available on the device
Thread-Topic: [PATCH v3] drm/xe/pf: Don't allow LMEM provisioning if LMTT
 isn't available on the device
Thread-Index: AQHbr6Q1nQdfSkxanUeiXoB04Iy/J7OoKvSA
Date: Thu, 17 Apr 2025 18:18:31 +0000
Message-ID: <0b9ac8787dc00ed191b8cea981a56c6b29dc9e85.camel@intel.com>
References: <20250417142147.278727-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250417142147.278727-1-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV8PR11MB8723:EE_
x-ms-office365-filtering-correlation-id: 7783d1b0-ae4b-4d86-7337-08dd7ddc420f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RHNjS3FpQXBZeXVxZEkycmkxOUozYUxYWm96M2NrR2VMbjRCclBBMHcxWHJy?=
 =?utf-8?B?cnJYa2NORGxpR0tXb3FqaTV0NFVWSEIxRTV0QmZoazQ2Qk01c2hobElCQzhC?=
 =?utf-8?B?VU5KZVI1OXlyUHhoMEhQc0hlNFBlRFBvUVkzbXExMlJXZjQzeFBQcVJiNXNI?=
 =?utf-8?B?T2Q5N3hFQ0RoQnpGTURWNGViZkpsbkZ4UlhCcHAwRGNKWTFFVnhNYWpRRnRv?=
 =?utf-8?B?eTZ3MDNleUhzcnJqNVVUZmpqVU54aDhTWSsrUHdEZGZ6ZThuY0luejRuVUhz?=
 =?utf-8?B?R0x4MHpUNURHNFMyeHkvUGlMbnV2SDlJUzFJN0ZITkxLT2pPSzdsOXpycUQr?=
 =?utf-8?B?cXdwaElici9ybjV3SlNsVE1aVWRHTWh2YkxsaTZjMVlGckl5RzMyQmRPY0cx?=
 =?utf-8?B?NzZmWkhRTzFRU2xOd2dwSkxFc3pEODFrVU9wYUdLMHlNNW9uMGRDNWNGSnFM?=
 =?utf-8?B?NEhQNUYwamJCVFhPbmNMakRwVTBESTN5K3ZCcWJ6ODJXeUtoNXYwZXhHcldD?=
 =?utf-8?B?ZnllVWhrTy91ZXhPZjBPWjZ5NFlhT3hJaUM0YVJweHphRmtWTm5qK1lKVmpw?=
 =?utf-8?B?b25lekZESXo2dG9Vd0tyWERqRTFFcnd4TVRjWEpndjBaVzRzeEhWYWdiUm1X?=
 =?utf-8?B?ZTNHRmJtNGdiZTlBMXdjbXAxb3JMOTZSSkhUNm8ycVdLRjZ2clNDSXJhSmJY?=
 =?utf-8?B?N1RXa2RIVThiOGx6MTZwc3FpMUwwSEJzRE5oRWFOcVY5UXFiM0U3MnJDVVlE?=
 =?utf-8?B?SFkwb2lmMkx5VTRINlFqQ0k4amxIYlhyejJxeE43c0M1VnlGVkhGbzU3eWFW?=
 =?utf-8?B?MmVGcGRudXFleU5UOW5FZUtZclBSdTdOTnFGazIvZmFqODlJOEp3OXc2bnE4?=
 =?utf-8?B?bTZvYmpONGpUZWcvblgxckJvZ0pWNmFsb0dCeHl6WW82TWwwejNVOGZGR05z?=
 =?utf-8?B?TElLUzNMbno2azh0STZ3R0t4QzBjcVdyeEJyM0VRd3ZwK2ZIMjNzcjJkNzlN?=
 =?utf-8?B?SkJxanF0T1YzUEZ1M0owQnQvY1oyS2dXQ1UvMjdoVmE0SFlDdGdvY2paVU5X?=
 =?utf-8?B?cFNWZlZuNDZpYklLWnlwU1BiKytKY0FPd05hMGYrTk5iUkdUQ1dCZUhaWnJz?=
 =?utf-8?B?TDBjcGZCKzJVR2NnMFZSSGNWK296WWxsTVNuQlJ1ZGhLNngzYld4M3FkYjRV?=
 =?utf-8?B?TFBkTkR2SUh2QnhtZGZ0VTdycWhsck1TdDh0eFlFa1JjUmJHdEFqMGF1TDZz?=
 =?utf-8?B?eno5ampGUmxXNVJxd3NmV0VPVjRUdFc4VStSUC8xZzUzRHNNa2I4Y1RKc1VO?=
 =?utf-8?B?MUMzcUN4anF1UUxiUXFreWZSV1l2NlRoZ2FzRFNmWGRuTWJhKyt6eDdhdktk?=
 =?utf-8?B?SE01RHJRZExrbGJLdzFOZVlxRnpYanBxeWo4VGtYQkV3OFpmR0hmb1RESmtk?=
 =?utf-8?B?V3VYNUdBUEVHb0w4eGNTQW9VVmZKaWtPWXRSYmFFY1VTY3JCM1NmUnJTeElG?=
 =?utf-8?B?bEJpcDQ2dllVeWFMQXgzL2NJRlFPbGZsemY5cUkxaUVnWnptNmpMSHF1NVdx?=
 =?utf-8?B?a0NBb0Zxek4vR3VmaktjNWNsSUR4ampsWVdPS3VrempRTXJ6QUVpNldKZnln?=
 =?utf-8?B?UnArTnh4NDN1WWo1TzRHemdoV3FlTlRnTWV2cTFFNE9UcGIveVN1Vk8rc0oz?=
 =?utf-8?B?T1VoV2RWWVp4NXlOTHlqUS9mbGNUZTYzWTB0cVJyeVR4OWpmenVMc0tSQi84?=
 =?utf-8?B?cEpxWE9aZk9TVUdLcVhlUU91YjU1ZDRQOHBZRW1za2JKRW95NG1LWHIrSlhm?=
 =?utf-8?B?Ui8zMlpLOEM2S3VYeDM5alZFdkNURW84ZlpMTDZvZ0lWVHg4RmdtUU53bzBh?=
 =?utf-8?B?ZHYxMjc1d2NCSUxsZkpCQVBuS0hPYUZHT05iR2JpbGFrUmxiZFNFaUViSW5h?=
 =?utf-8?B?Y1NvWXpmbURja0VWc290YjVkSk9SUHhuNWlxa1FsZE90ZmlJNCtmV21ZV0hF?=
 =?utf-8?B?WW5HMU1veExnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkhBempLVDQwaXpIWEU0NmJ1bVN0UE1SWDB1Q2dNSmtFeHZ0WDdhWVovZ1NC?=
 =?utf-8?B?OFFvaE9WaDMxNGtBcTQzeDZFQW41WXFmZGZYWUtYcEp3aWtoMUNmbG96Zit2?=
 =?utf-8?B?M0hGWXExZHNmWkw5R0IzVk03MlVBcXBqTGYvdnhsQzRUVkQ0cXM5RXZxdGQz?=
 =?utf-8?B?RkkvL1R5bWJvUkMyRWpqLzJmSUt3RVRycFJUVGJKRld0S3p0U2RtQS9YaTFY?=
 =?utf-8?B?QmJzb2s4aElKUWJSQ3RLZWRROFN2bUhsQk8wbm5ESzhyZHVZOERoOTBFeVhO?=
 =?utf-8?B?L2cxcHV1em9aNjduMHVsMFhPNnNGMjV5NVEwdEtkR2VWdk9nRVNWemJjdTlK?=
 =?utf-8?B?cjUzSlB5NHVYZDR0czBDUlNwUURTU3hFeDZDK1FiRFQzaVVkamdEbDNvZEtm?=
 =?utf-8?B?dnhSYmRyWWF6Y3BhZnNVd05sVXBvbDRhZVlXeTY1QUtCTTNzNGVCNnIwUFND?=
 =?utf-8?B?TUF4VVd5WGdBSVBlWjl1MEd2Z2M1R3pzYUVlSzVLMzVGYWVGWXE0elljNEpr?=
 =?utf-8?B?M0RIc0cxT2dhNVgvbXgweDAzakxzdGJXNWcxLytVbHNyN0ZNN1RZZ0ZMTkRF?=
 =?utf-8?B?bFF3YUpzcXpNU29lc1hCa0t1UVBDeVJxQVFma0xxd0R3cFhDazRZVEZnSDkz?=
 =?utf-8?B?VE5tNjlKRDdWS21yTUErVVF0cmMwc3F6SW0rdmpEazdzSEJZM2xVTWltWkky?=
 =?utf-8?B?Y2FTSW5MeWs0ZGVnTUU2RlAvZ1FJUTl5S2c2bXNnS1ZqUHJleUQvYkwwYkJ2?=
 =?utf-8?B?VlRKNDVGaHMwZXprYjdaQVljOHZiZTZMSVVKbld3dXphR3ZPaEZyQ0MwVFZ4?=
 =?utf-8?B?MGRHR213eEJKZGc2K2pXVlEzSXFwUXFsYS9VVEQyUEJGSWVnaFJFU2lWZjVJ?=
 =?utf-8?B?RnhsR2VNNGUwVWc5akFoNW9xWTVXUUUySFNLNVFXWGdSeU5ncGxzcDRrd2JG?=
 =?utf-8?B?eExDUlhYR25MTjNZWFVYQm0yZCs3UEUrTkxJUUIzbUNlUUUyS21wQis4cEQw?=
 =?utf-8?B?ZkdPbHRqaDEwbVNhL0Y2cGgxTGN4ZU9rTE1veC9ScTNiNjVadHg4bU94My9q?=
 =?utf-8?B?eFBaVXJiWDBxRVp5NWxXV2U5U3RZYTZDWjgzL2VRQ0FtdUxXSENyZSszT204?=
 =?utf-8?B?dXR1VW8rYTV4Wi9ueVZYS3ZhSlk2bS80RHdROXZRbHQvYU52dGhtMXFlTmtW?=
 =?utf-8?B?Qmpla0lydEpNREo0RWgvTXBFMnJiZnJMWldVeXFWak9QTHh4cE5kMU42MGJH?=
 =?utf-8?B?SzVLL2dBM25IZFZVVW1vYlhLZlJFWmhyL0kxTUVVc3YxbURqYVZoRG1CU3oz?=
 =?utf-8?B?RTA3Y244THFoWm05eDBZVU02eFZBejEvTW1iNUN3MDF6NjlKRHY1TU5yQjBx?=
 =?utf-8?B?VW51OS9uYUNzVDlMYkk0dWRTRHJtL3hMcUJEK1R4Z1d2M1FxT1kzY0VVcHRW?=
 =?utf-8?B?ZU44YlZuZ3VJY1o1RG4raVRDUzhtMkR2RVBMRGUzYlV1Q0lNYlE5R3FRL1pL?=
 =?utf-8?B?SUptZ0hhWFMvWm1qMFkrV2JDZFlmRFRFZVB3SWhBb3E4MmNCZHZCb3VzRHRj?=
 =?utf-8?B?bUN5UTVTV2ZNVEpBcFljSVVQWGNXeGVtQ28zbFF6cXZYbVE1Skt4UVJoaWlY?=
 =?utf-8?B?OStzdGQrMnBiRDJiS2U1UE43aGlpM0tMdzJIdFNPK2dhdGlsVXRzQUhCUDFx?=
 =?utf-8?B?U1Fwa3paOEVpTXlvSGRrVHVOS0dMRVJzTXZJOHVqdDBrMjhmbXdDeldiNlBt?=
 =?utf-8?B?TzRKempxUVZvd1QzT1lOQmJQU3EySWtpbVNiVE1lNTNtdVAwMjJlcUszenZZ?=
 =?utf-8?B?YmlQZkZXOENTVnpORkZQYjVQeFBpMm5qTE9kZ3hnQ1JNYkRGWU1zUFNkUzY0?=
 =?utf-8?B?RGQ1VEppUFEvQ3d0R1NZdFdTVTJZcXFvUG05aFYyS1AxZmYvNVMwUVZRNkhh?=
 =?utf-8?B?YWhvaEplOEFnT0MyTXRQb3FaRVRkaG1xcDhRby9LRSthbWMyRUc5SmVLQ1c4?=
 =?utf-8?B?VWpkeWFxRDN6dVVzSDJndjZtQVVHc3NkaTFxdXNCU0QvWE5zRXFTMWFIMGta?=
 =?utf-8?B?c2hJckZPTTJkcUl2MDBzNXo5MG9LbUpFMlJkeWpiaFRpc1p2QVYwNHF6OEFi?=
 =?utf-8?B?R0RtNHdXZ0xRbE1JbUpqU29XaCs2eHlRRWhPZnRCQm9rMWZrd3dFWmU3dkRn?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3774AF7489B9824EB4C81049C484D9DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7783d1b0-ae4b-4d86-7337-08dd7ddc420f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 18:18:31.0751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IoL3oKAaudosyLNfdZ+MF38Wel+ZWzEzRTSz6gHBcvbvtCugFbQoCQzcH161Fy6cObq/7lLov2olg6A5kwZK5m0/wUj4f/mSFdn5AaCT+o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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

T24gVGh1LCAyMDI1LTA0LTE3IGF0IDE2OjIxICswMjAwLCBQacOzcmtvd3NraSwgUGlvdHIgd3Jv
dGU6Cj4gRnJvbTogUGlvdHIgUGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29t
Pgo+IAo+IFRoZSBMTUVNIHByb3Zpc2lvbmluZyBpcyBhcHBsaWNhYmxlIG9ubHkgb24gcGxhdGZv
cm1zIHdpdGggTE1UVC4KPiAKPiB2MjoKPiDCoC0gbmV3IGNvbW1pdCBkZXNjcmlwdGlvbgo+IMKg
LSB1c2UgeGVfZ3RfYXNzZXJ0IGluIHhlX2d0X3NyaW92X3BmX2NvbmZpZ19zZXRfbG1lbSBpbnN0
ZWFkIHJldHVybgo+IMKgwqAgZXJyb3IsCj4gwqAtIGRpc2FibGUgcGZfbG1lbV9pbmZvIGlmIExN
VFQgaXMgbm90IGF2YWlsYWJsZQo+IHYzOiBmaXggY29uZGl0aW9uIGluIHhlX2d0X2Fzc2VydAo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFBpw7Nya293c2tpIDxwaW90ci5waW9ya293c2tpQGlu
dGVsLmNvbT4KPiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5j
b20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmPC
oCB8IDYgKysrKy0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfZGVidWdm
cy5jIHwgNCArKy0tCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92
X3BmX2NvbmZpZy5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmln
LmMKPiBpbmRleCAyNDIwYTU0OGNhY2MuLjM1NTZjNDFjMDQxYiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmMKPiBAQCAtMTUyMCw2ICsxNTIwLDggQEAg
aW50IHhlX2d0X3NyaW92X3BmX2NvbmZpZ19zZXRfbG1lbShzdHJ1Y3QgeGVfZ3QKPiAqZ3QsIHVu
c2lnbmVkIGludCB2ZmlkLCB1NjQgc2l6ZQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgZXJy
Owo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgeGVfZ3RfYXNzZXJ0KGd0LCB4ZV9kZXZpY2VfaGFzX2xt
dHQoZ3RfdG9feGUoZ3QpKSk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF9sb2NrKHhlX2d0
X3NyaW92X3BmX21hc3Rlcl9tdXRleChndCkpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAodmZpZCkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IHBmX3Byb3Zpc2lvbl92Zl9s
bWVtKGd0LCB2ZmlkLCBzaXplKTsKPiBAQCAtMTYyOSw3ICsxNjMxLDcgQEAgaW50IHhlX2d0X3Ny
aW92X3BmX2NvbmZpZ19zZXRfZmFpcl9sbWVtKHN0cnVjdAo+IHhlX2d0ICpndCwgdW5zaWduZWQg
aW50IHZmaWQsCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2Fzc2VydChndCwgbnVtX3Zmcyk7Cj4g
wqDCoMKgwqDCoMKgwqDCoHhlX2d0X2Fzc2VydChndCwgIXhlX2d0X2lzX21lZGlhX3R5cGUoZ3Qp
KTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGlmICghSVNfREdGWChndF90b194ZShndCkpKQo+ICvC
oMKgwqDCoMKgwqDCoGlmICgheGVfZGV2aWNlX2hhc19sbXR0KGd0X3RvX3hlKGd0KSkpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiDCoAo+IMKgwqDCoMKgwqDC
oMKgwqBtdXRleF9sb2NrKHhlX2d0X3NyaW92X3BmX21hc3Rlcl9tdXRleChndCkpOwo+IEBAIC0y
MTYzLDcgKzIxNjUsNyBAQCBzdGF0aWMgaW50IHBmX3ZhbGlkYXRlX3ZmX2NvbmZpZyhzdHJ1Y3Qg
eGVfZ3QKPiAqZ3QsIHVuc2lnbmVkIGludCB2ZmlkKQo+IMKgwqDCoMKgwqDCoMKgwqB2YWxpZF9h
bGwgPSB2YWxpZF9hbGwgJiYgdmFsaWRfZ2d0dDsKPiDCoMKgwqDCoMKgwqDCoMKgdmFsaWRfYW55
ID0gdmFsaWRfYW55IHx8ICh2YWxpZF9nZ3R0ICYmIGlzX3ByaW1hcnkpOwo+IMKgCj4gLcKgwqDC
oMKgwqDCoMKgaWYgKElTX0RHRlgoeGUpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHhlX2Rldmlj
ZV9oYXNfbG10dCh4ZSkpIHsKCkkgc2VlIGEgZmV3IG90aGVyIGNhbGxzIGxpa2UgcGZfc2FuaXRp
emVfdmZfcmVzb3VyY2VzKCkgYW5kCnBmX3ZhbGlkYXRlX3ZmX2NvbmZpZygpIGFuZCBwZl9yZXN0
b3JlX3ZmX2NvbmZpZ19rbHYoKSBhbmQKcGZfZ2V0X2dndHRfYWxpZ25tZW50KCkgaW4gdGhpcyBz
YW1lIGZpbGUuIElzIHRoZXJlIGEgcmVhc29uIG5vdCB0bwpqdXN0IGNoYW5nZSBhbGwgdGhlc2Ug
YXQgb25jZT8KCkFsc28gcmlnaHQgbm93IGhhc19sbXR0IGp1c3QgY2FsbHMgSVNfREdGWCwgYW5k
IEkgY29uZmlybWVkIHRoaXMgbG9va3MKcmlnaHQgZnJvbSB0aGUgc3BlY3MsIHNvIGF0IGEgaGln
aCBsZXZlbDoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRl
bC5jb20+CgpUaGFua3MsClN0dWFydAoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGJvb2wgdmFsaWRfbG1lbSA9IHBmX2dldF92Zl9jb25maWdfbG1lbShwcmltYXJ5X2d0LAo+IHZm
aWQpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2YWxpZF9hbnkgPSB2
YWxpZF9hbnkgfHwgKHZhbGlkX2xtZW0gJiYgaXNfcHJpbWFyeSk7Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9kZWJ1Z2ZzLmMKPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9kZWJ1Z2ZzLmMKPiBpbmRleCAwZmU0N2Y0MWI2M2MuLjEz
OTcwZDVhMjg2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3Zf
cGZfZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX2Rl
YnVnZnMuYwo+IEBAIC0zMDgsNyArMzA4LDcgQEAgc3RhdGljIHZvaWQgcGZfYWRkX2NvbmZpZ19h
dHRycyhzdHJ1Y3QgeGVfZ3QgKmd0LAo+IHN0cnVjdCBkZW50cnkgKnBhcmVudCwgdW5zaWduZQo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlX2d0X2lzX21lZGlhX3R5cGUoZ3QpKSB7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZWJ1Z2ZzX2NyZWF0ZV9maWxlX3Vuc2FmZSh2Zmlk
ID8gImdndHRfcXVvdGEiIDoKPiAiZ2d0dF9zcGFyZSIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDA2NDQsIHBhcmVudCwgcGFyZW50LAo+ICZnZ3R0X2ZvcHMpOwo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNfREdGWChndF90b194ZShndCkpKQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfZGV2aWNlX2hhc19sbXR0KGd0X3RvX3hlKGd0
KSkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGVi
dWdmc19jcmVhdGVfZmlsZV91bnNhZmUodmZpZCA/Cj4gImxtZW1fcXVvdGEiIDogImxtZW1fc3Bh
cmUiLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDY0NCwg
cGFyZW50LAo+IHBhcmVudCwgJmxtZW1fZm9wcyk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiBAQCAt
NTU4LDcgKzU1OCw3IEBAIHZvaWQgeGVfZ3Rfc3Jpb3ZfcGZfZGVidWdmc19yZWdpc3RlcihzdHJ1
Y3QgeGVfZ3QKPiAqZ3QsIHN0cnVjdCBkZW50cnkgKnJvb3QpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMocGZfZ2d0dF9pbmZvLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFSUkFZX1NJWkUocGZfZ2d0dF9pbmZvKSwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwZmRlbnRyeSwgbWlub3IpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoSVNfREdGWChndF90b194ZShndCkpKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoeGVfZGV2aWNlX2hhc19sbXR0KGd0X3RvX3hlKGd0KSkpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2RlYnVnZnNf
Y3JlYXRlX2ZpbGVzKHBmX2xtZW1faW5mbywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAKPiBBUlJBWV9TSVpFKHBmX2xtZW1faW5mbyksCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBmZGVudHJ5LCBtaW5vcik7Cgo=
