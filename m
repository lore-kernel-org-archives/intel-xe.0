Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9BACFB441
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 14:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7DF10E086;
	Mon,  7 Oct 2024 14:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4Q9RM9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6D10E086
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728310639; x=1759846639;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ov5hLlzmigjdf82kNJjGmJAc/r1YOrZNokWWo1gvHZw=;
 b=b4Q9RM9G7+tZmYjYJSlUvf2x5Lyq9H8juJdEhV9zofLnxNzDvM4J6luB
 l7vDgYEx4a2SXr11CMw0I+UirWLrDp1hhNAG6d9ILLioPbvm76xeqrMBk
 Fowkoee/tl9IQ0MjfW0PSYfXbmnzNdf7615+qSSW5LEbny044TFgP9GjK
 aMXPhah8HK0lo7pCa+F13o53iB/0Bvzt/tHvZ8SgkXQKr8OlZ2x4XqQZh
 cDFoMufk401pb3o1nZ45M6eh0yYiZSHr0rtPz/9Kv4JKIiHnpa+MbVI2l
 Wq680U/RHAFNcK3RwK/qwxlGCZ/OWS9XZoPHWLfnlxpXXEmWwE8lqkSoX A==;
X-CSE-ConnectionGUID: g1OWUsOnRSGpH/5eoFYfBw==
X-CSE-MsgGUID: aQvS5JuDRF2Gjku857H5pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27593675"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="27593675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 07:17:18 -0700
X-CSE-ConnectionGUID: JdFCDhQyRsaX4StT0HBfgg==
X-CSE-MsgGUID: W4znuimhQjG28eAMYEzGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="75602115"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 07:17:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 07:17:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 07:17:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 07:17:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 07:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPJiaxBBP3VJZ+30beJE+9efs3Aro8+wghVlF8Bl+uu/mI7iRPVdtS1kvN9KgIJ9ZH9qNA2IGG3JHQP8HlE2i3sv1hVs3zfDgghgtMiT/94vjxqrkQXyWhMx1eLglPr4OxFtX06WHkvjTk87x3PUdAX0FlisBGfSbj9ofqyce+DoI+blIs/sqxl4KYsnamK9oOCoJuNG6rbPk4qvVKTeQd/8BUmWNqWeQLvcfa0JfWs3h0QK0VXmhpa+RdtUvkbxRsWvludzxdvVr4D6Ie+WNY4l7u1htanvVOxz6CP+LJQO+PwzukTtzWhvqUPwWzMS1IbDDybtznEBg/LGdbhSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ov5hLlzmigjdf82kNJjGmJAc/r1YOrZNokWWo1gvHZw=;
 b=q6ND8rwImmsVj6ijNszB+HJ8kNve7Qr/n52u/xKEEe9xUyedwUv4VcPrmApcVa96S+am/qi7xuozW0q0uHu/6FcsjWBO2EMRAbi7SCFiZNhEK71dP82pySkG2iCcOIuO8ZMk34p2AzL1bVE0egYrIMvP7KQ9rNKz1Onz5z/vz1LhfXYl8v7lscGGxyoKmpKxSuTt9hJcvp+mrRhg1rEYLpdZKv5bxgvZd69ZGgPRDdTsza/ASI5ppABSQUDMwNHiuy9DzhGlDI7U9vdcHT2yXrPqnAeJJ8vPz9b1eTWUzYEuSSuc8HAt3o9kaQKPaR7K3GLCrZWi3E9ZRY0iTeVnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 14:17:15 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:17:15 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v28 6/6] drm/xe/guc: Save manual engine capture into
 capture list
Thread-Topic: [PATCH v28 6/6] drm/xe/guc: Save manual engine capture into
 capture list
Thread-Index: AQHbFpSI9wXxvJrPC0iQivSQQSLlTLJ7WgsA
Date: Mon, 7 Oct 2024 14:17:14 +0000
Message-ID: <81fc740223c48602e065661b5beba2e2619cdeda.camel@intel.com>
References: <20241004193428.3311145-1-zhanjun.dong@intel.com>
 <20241004193428.3311145-7-zhanjun.dong@intel.com>
In-Reply-To: <20241004193428.3311145-7-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB7597:EE_
x-ms-office365-filtering-correlation-id: 1616b4c7-8d1d-4fd7-a6ce-08dce6dabe5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cTAzK3licExoZEloQis4eS9zVVQ5Z2lKUlRNVTFPbTlDZ1VEM3JKdk00K1Qr?=
 =?utf-8?B?Wlk3UmdYTk1Kb1dteDFjdHNiTUJqYno4ZWM0UkVERTM0NTdVL081WWFvdkl0?=
 =?utf-8?B?NzQyUHhmc1g5SmJodTVPSGVUUFBlRzR6K2F2c1hHNTZPSlh1NFVJdVZtbHF5?=
 =?utf-8?B?RncwNUYvWGlENHRyeHFZU01aMStVTGd2MXMvUFZsdlF6MTI4UlliQ0Y0VjU2?=
 =?utf-8?B?S2JVOW8wdnpEa0JmdzdBOGZvYzJLRTM5ZUs1bWQ2WDRNVlcxZXFwdkZHZ1JV?=
 =?utf-8?B?NFFNcTFlcS94b1V1ZmRZNTBIeGZ5S2FoZlhLSXE4NHpWTnpQdTh2VWJISUNM?=
 =?utf-8?B?bFk3QjRmZWhudWFCRGJnZ3NtdEdic2dMeG81MFIwS2lYSGF4aXN6OXJmRzkr?=
 =?utf-8?B?ajAwVXpGUlRLTWJ6Y3A4UEZGT1oyNklWbk1LOEVDL2FxT0VRU1Nma0FmSURP?=
 =?utf-8?B?SW80ZHUzdFZMQzJNSmlicndvZjdROFdudXhWOE1HTEJzQ0JYdEw3VVU1R0tZ?=
 =?utf-8?B?ZlJ5TkpYa21MZ1FwZyszS1VFVTBWOC82cmtNcUdNQXBTWVNXVUFCQktlVzRC?=
 =?utf-8?B?RS9zUDF6VEs1Q2lKZW16cURNTFFLZjh2RkRGWW8zbVJ2cnFmQUM4Y2o4NFp6?=
 =?utf-8?B?RkYxOTBwVzNaQ2ZiOGF0Y0N3TEIveUlDQlpQdzl3UnVpdlZOK2h2UFlOTG5W?=
 =?utf-8?B?YzVTRysvSUtER3lKNHk5SGxhVU81VG9YWUx5UzV5UTJHaklmRjlQdXM2OXNz?=
 =?utf-8?B?bXFyRVRObmVoU1hQUkxyZDNFTS9iZnFQZUMxQnRsc2F3SXVpNFRpQldjZXRh?=
 =?utf-8?B?K2w3c3dvMkVMTEdHOFlHaGFEV3JNejNqY1BHY0xRcWp5aGVySCtIMGxQNWVR?=
 =?utf-8?B?RkROcGFWODRhQmlQc2VpanRNalcyMHl0QkFqY250cmZ2QUdJZk1qL0VqM2ZL?=
 =?utf-8?B?Y3V6c3NnVS9Pc0psY3V6MmRpMmV0SktHRUFLcFFHTFNtamdNOG5VZGV5Uk1Y?=
 =?utf-8?B?WmlXTjhCRUpDdm92RFQ2eUNyNCtjaWliaW40YmNTTzRTRUM1MndLRGRpT0FI?=
 =?utf-8?B?ZVVlMExFNVV1WllRb1RReWlRRUJmS1czSHBvZTVTQ0JDNlVxUzdYak5za2Rj?=
 =?utf-8?B?eVYyYXc5Z01IMjJxTDZuWXRjQWRLdS9zREsvTFlhNVRPREZaMFJEODBXN3FO?=
 =?utf-8?B?bU95SVZLaXF3Y2RrNjgzTEtQYVRWUjJpa2x6QzArZlRtSm5IdVFORGZIT3dW?=
 =?utf-8?B?UkYrOC9mMGZJWUZWU3pVdEJyMmpxemY2WjhXUHRVQjc2ZTJFV25xakpQRGNy?=
 =?utf-8?B?bXBVendxVkt3aWFZMGdYc1owUVJEMVNWcFd2aWtVb0FQdEpsc1pndXlzcWFY?=
 =?utf-8?B?a0xHWndaWTl1Z1hUbEZuMERpS0RoQWZLZTNJQzFHSHd4cjZwWEZXbnI0NW0y?=
 =?utf-8?B?UHBzeEZKZjBhaC9pZ2NSaDc4Y1NzMDMzK3AxOW1NS1VJaHRnVDdHQlR6OG9p?=
 =?utf-8?B?L1puaGw2YTdERDBGMHVmTTlmVGY3NXVObG1paWRMUkdHYTBRNno0VEtDckQx?=
 =?utf-8?B?eWpDWjV2Q2svYi9CUzQ4VVJ1UUgyK3J0ZzYwSjVwbmJGMXdpNHBmQ1l2bUZQ?=
 =?utf-8?B?VU5aN2hFZ25qU01IdkZya2Z6NnRxYVZwMnF4OXZEM1orRTg0cnArWjdJckpX?=
 =?utf-8?B?aEE3YnIwVEN5c0hJNm85ZG01MUxjeXpBSUtaU1dCamdXd0JkbWYxcEFQdUNi?=
 =?utf-8?B?NDJ2Vk1IaUo5Q3hVYjVGZ0NYUWRNWkwrRFJ0SDJxM1ZZaURleXFTUmdrUTh5?=
 =?utf-8?B?WTdFZTVtY2d6U3ZNUkt4dz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjgrMHMzL2NMSnE1dVdWTWpNNjlQQ0tzLzByb3VlY28xdTBIQlJFL1JSU3ZO?=
 =?utf-8?B?QWV6TlJNc3JzTG9RcVUzSDNLeGJOZXVibzhET25nSDV0VEtBS3dsY1Q1aWpl?=
 =?utf-8?B?TTBBdHZCVGhQYllxRks1OVc0dDVpd2lSdmZ3Z3M1OUJEU0JrdEE0WEhwcGJa?=
 =?utf-8?B?SDZuSndUekxnL2JYU2xzaFNIZldzQ0g3b2ZaVWpzQm5IeFJhM1ZpdDhnQ1Z5?=
 =?utf-8?B?cnNtVytabldWK1pnZWtUL09tQ2FpMjhHdmNkVVNacjl3aUxSUTFzdDdEVUk1?=
 =?utf-8?B?R0xVdGR2Z1owNUpJRnFLZ2I4S3lBQ1d4dWdzdFlhOW81WWRwYksyWFhuQXVV?=
 =?utf-8?B?dXdYbGEySVZrc29XeXFZMVVoUHRVTXRpK0xlelVxR0tOdHVGcENxaXlDU1NB?=
 =?utf-8?B?MHpsRWZLWTNYTG9GTkhwWnM3UDN4eExlQ1h5QTNUMkJHc0liRWx6cExVTGNI?=
 =?utf-8?B?YTRIOXhKR3VDSjlMUDNrRThGUklkT2tkQnJqOHN2MG5nRmhEZzU4QVVGcTkz?=
 =?utf-8?B?U2U2Q3FoQ2FSK0pEeDN6aVU1WnI1QnhkNXNJK3c3dTFmNmt2RDAybnI2TWln?=
 =?utf-8?B?bWdjVDFkT0JIQmxXUUQ3aW5ycWQ3Q2VZMmlURkNXY0dlajVERTZObERFM2l1?=
 =?utf-8?B?QW5xbDNxenY1RzlZR09WRW9xRStZUUZkTGhNQ1VSVUduSHpNaFh5eXo3bFZE?=
 =?utf-8?B?ZjRnNExCREM3WlRFcnhPZVpFWHRzU255Vk9kUDdyZmFUVThTUlk3bjhPSGND?=
 =?utf-8?B?aFZTYmhzcituZG5tTGdHb0JUMUdNTDlwbFJaTTBkTmxBM09yczlBYTFURHd4?=
 =?utf-8?B?R0puWW9VSWhGVUNJTWN0aXg1YlZqWVZaa3hzaExVajNTZjVvUVk4WmJqdlpH?=
 =?utf-8?B?U0Mvd2d1VTQ1Z2toOFU1aXZUSTlXa01KQ3Q5OGRlODhQMWcvZEJjaExJTjdO?=
 =?utf-8?B?SmRoRURKOVNUbUxpam5pOE1Wa3BhRlRiT1lWVFdLYnRlR1pabVYvMHJEc24z?=
 =?utf-8?B?UEVRWXBySyszYWdEbEZUU0xLUkRoV3NaMDJZV2thN3ZxeFQwWEw1dE1zOTBs?=
 =?utf-8?B?QkV2QWFSMVgrdkFrRVBrNFA5UFFIY09mYWR0VUpIYnVCYU1tQlVCZlpyV2hG?=
 =?utf-8?B?dkJKK2F0cytBZmlCR1BDWDZmeWFwbll0YXQwbU1tUUNLY0FGa3BOeFg2czFH?=
 =?utf-8?B?VllhQ1hNcXJiYXdZcGpCOTBNUGJGMUhxSm52SkNqVnN4N1Fka1pWMmNSaUxq?=
 =?utf-8?B?WFRNcHZ2OENOY2xiRG1pUVhncGRjbHhOTUo1bGc0L1BQdDY5bHROKy9POEp3?=
 =?utf-8?B?cWZlK25GQUd2OTRROUQxcHRGRFNVTEpCM0tMMW8vblk0U1czYUJNZC9xZTFD?=
 =?utf-8?B?emU1cTZUcHhoY1FXSE50UGtQK2puK29ZRU1kR3hNYjlUdEd0TDFXMmgxMlJa?=
 =?utf-8?B?ZDMvc3JZdW00aWZmQUJDanJ6M1pkdW1oSnJMNDdkbk5mTHlKRGxLMC9uMENI?=
 =?utf-8?B?L0NCaDRNZVZ4aXFXMjhlQm4wVFpsSkFnc2lEZGNkbkY4anRJZFdLK1U1SDZz?=
 =?utf-8?B?cUx6VUhYRURLS3NwV2YvK1RqRnhQOXpuYzQ2NkNZRGd1ZXd4SFRxM20rYzVw?=
 =?utf-8?B?bmJoc1o0UjZZeUE1UmhUdHNDRjVQZnh4MGZHNXNyZmk3Z0xPU2FsR3h6aHk3?=
 =?utf-8?B?VE93L1pzb1F0bUNwTzlPY09EYlNBb2pyS3NXbjFFbExCUTlGS3dLQWxxSGl1?=
 =?utf-8?B?VnhFWFVMVUN6VFBoU2lMODNZL0JXdWw4cGhmazk1OEp2LytsUlRUM2pNKzk0?=
 =?utf-8?B?cm9EVzZMY0l6ZHV3UmtXYUFSdmZLYTlBRjM1SzBuOHVVRUFVN0E3bVEzdWNU?=
 =?utf-8?B?VVRqVjNxMXo5Qnl1QytwdzE0MmdFa3Q5ZnpJd2I5NnJYZ2R4dEFZRkJTcSti?=
 =?utf-8?B?TXJ2SkRjaDhLUmh5am40L01DclpZMy9IWW8vQXhSZWRGaDUvdExsbkxQK1d5?=
 =?utf-8?B?WHRERmlXYW0zblhOR0VPSFN5VmNCRkZHMnNEbkkrOTRmSjZTdzdlUUtpbmZF?=
 =?utf-8?B?VnlpL1hOcDVncHhkU3lveE1mN3FRcnFpY1BlZjMveGpjODBZMGlxblhUUWJX?=
 =?utf-8?B?bnFhRjNSckhsc09nSUovZUFadGhoemZMS212cTZqRlNYSmN6TXFwNHVTM0lW?=
 =?utf-8?Q?PNHITLfOufqGh2bu8yEfFn4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A16ECB99298024FBE8FA9FFD75533C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1616b4c7-8d1d-4fd7-a6ce-08dce6dabe5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 14:17:15.0275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lE2lBk2C4XR8Q1+wT4F3SZnr/BydSwwTKPR9MBlJRbyzmz0LFSPfVJZPHoaDJy7bJXTNVfj3CeSLanDEt/bCQO6XamtgAHlmoSR11ihFH2mphMYm+FAKJhmf8aSlU8W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpPbiBGcmksIDIwMjQtMTAtMDQgYXQgMTI6MzQgLTA3MDAsIFpoYW5qdW4gRG9uZyB3
cm90ZToNCj4gU2F2ZSBtYW51YWwgZW5naW5lIGNhcHR1cmUgaW50byBjYXB0dXJlIGxpc3QuDQo+
IFRoaXMgcmVtb3ZlcyBkdXBsaWNhdGUgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgYWNyb3NzIG1hbnVh
bC1jYXB0dXJlIHZzDQo+IGd1Yy1lcnItY2FwdHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpo
YW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCg0K
