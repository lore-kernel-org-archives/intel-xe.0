Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E50CA1016
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 22:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8B210E20E;
	Mon,  8 Sep 2025 22:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF5LRwyF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBE910E20E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 22:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757370221; x=1788906221;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eDSf3/q0AlWlRbtwLz1zXnu/K3gsBjxjzx33gh/Lor8=;
 b=PF5LRwyFRaqZmBxu8aKMEjQUkKozWdxrdDbzIzgxXxzMceN+PN5shTEf
 9DOXkH3bVTvXFEpMEE38HlHoYd6ntC7Nf0WEmY++ZvhmMu8LMiWiVNu0N
 7c/pMhOa94fmF+tRQJvcahX3nhevcFd8In1zl8xC9WX6RPKaDz8z7jIvn
 XKUOikLN45t7jpOfTbDwNY+5hjErPbB03PTFUP5T+F6T7vahSwnZII/p5
 TfGDSA+6IdJvVL+Ivcn9vqeyZU2fgpXZ6kcMLc959Gm1dEI+Awf3n0fhN
 Pu6vHQ9tdmfMlIgtz+VVP1ld99ESY+Zww3eLmYgxfMB9i+Q380wux+fTH A==;
X-CSE-ConnectionGUID: t1wHrq45SIy8/vSvzrCVRA==
X-CSE-MsgGUID: zrkSWtImQz+fox4IMqkJRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63284507"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="63284507"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 15:23:40 -0700
X-CSE-ConnectionGUID: ghSpfk9qRyycl+jA47HOXw==
X-CSE-MsgGUID: uyE8RyLwQwexyqtNlpk8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172096598"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 15:23:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 15:23:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 15:23:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.82) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 15:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvhkS83o2q7oULK0iaDDutjUJfbmlHMeKOTq/AwBoVtDxt9m4lsjbwISvuA9AflCW5f1/5yOHEy8yKqIwAkNGLkcH9AysaHbp1di0Annpfs1VlHJPAqLH+mDSzRU+jibycel2Y2QIoRtYhc4QaO8C7ziB1rpJ/UlzYnRX0utaXy7nCAEMjTBF7GgXvMHWv/cta99BP3m0P5ddvT2ARmAtotDjPKwkJJg2NpuG9XpwLSoNxXT8sDwVWC8rd2mVYThMttiq9ug34HxvZqBflJWFp8p3BETA0mxPAwx3Do+U1mW7Bu8BVc9flrIIRYAprePDY41eWt3ZsD2ZFboenpSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDSf3/q0AlWlRbtwLz1zXnu/K3gsBjxjzx33gh/Lor8=;
 b=qwQP6iP90gD8AzwEOiu41Up77C4P8q+sW/Hv8M655icF30OLaqEvgUhshMSoB6DqS6EQ7FHVYLqQXjML0XS6bxUrnUDff4CR3EnStiC83WNo/kNo3rbsEnNY37snrec7ftC/FnEBJds+TNY2C/kWZrMby1FxcMPujlnpF5pVhnCa2tMG7cINyzuMD4Yg2hlpAU/RaI3Fm/PUG68Sz2/EJcRky6l8jf+A9Zwf3scLldXKP2xia27muisrPyIGkCHoWTL55m15o8F4xFPWUoGid2b7Q39Hr1lRHiNoSmGBOonTn/nHFVqKNzgHFpLtm+dAAFPUoicfaio+VGdka1HibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by CY5PR11MB6367.namprd11.prod.outlook.com (2603:10b6:930:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 22:23:35 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::75a5:f8d8:935f:d968]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::75a5:f8d8:935f:d968%5]) with mapi id 15.20.9094.016; Mon, 8 Sep 2025
 22:23:35 +0000
From: "Bai, Zongyao" <zongyao.bai@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Thread-Topic: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Thread-Index: AQHcHq1ftv3awGbUkUWPdrwkeAulfLSFNJSAgASqSxA=
Date: Mon, 8 Sep 2025 22:23:34 +0000
Message-ID: <SN7PR11MB7539411E72AFCDA10131D4E6E00CA@SN7PR11MB7539.namprd11.prod.outlook.com>
References: <20250905213738.2936785-1-zongyao.bai@intel.com>
 <b846e886fbcacb1265a408c8e077a842971e9c1c.camel@intel.com>
In-Reply-To: <b846e886fbcacb1265a408c8e077a842971e9c1c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7539:EE_|CY5PR11MB6367:EE_
x-ms-office365-filtering-correlation-id: 016470c2-b91b-4343-e4e0-08ddef2659d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bSs5RUZlMjFGMFN2TWQxOHpPY3YyTE53amV5RS9hd2RIYmoxWWhrdUdadXV5?=
 =?utf-8?B?cjdFeU5vbEczV0ZvTkl0L3VDU09zUHZjSHBZOHdiMWV2WnZicmRBdCtScHJE?=
 =?utf-8?B?c3VPZWR4NGdKSGUyN0c5Y1BCNWJsTTFTVE8rZmpMcVgwM2xWVjhlbEw4dTA4?=
 =?utf-8?B?ZnM1cTBBb0Z4NEk1cVVhUHdWbGNuTExGSXJhdEZwbXFpSXZ5d1hCTEdZbXBW?=
 =?utf-8?B?TUlpc2c1cVlLbUJZMjBXSFFXcFJFTUI2bmhLbGVldFIwWXYwb2ZNcmZ6eEtq?=
 =?utf-8?B?bDEvOG9nSWYwaEh3ejBKaTNZVjFWWS9ZQVMwbEVLaDM2ZlhJV3FkRGNjOHhp?=
 =?utf-8?B?QXZ6MGZDRFYxc0VDcU96MWFtMkpnY3VhRCt2NTRSL2dwWjRMZ3czRDdGT3FH?=
 =?utf-8?B?bm1NZE9Zc3B3ZEFHdm92K1A2TGVrUGdmT2RNRjRwTU5rQkxMVkFxU0REdXNE?=
 =?utf-8?B?L2loZmw5Qnl2SlN1bmNCLzFhMmNaOWxIM3YzZzhqR2Q2bG1jYTYrempqa3ZY?=
 =?utf-8?B?bGt1YXh0MlptTTY5RzFzL0c0RVZadkRTMVhIK3h4N09lYU5LaWwxbXZXOVJS?=
 =?utf-8?B?QmZzb3RhaDk4aTQxU2paR29jZUdhclRtbWRsRTlYWEhEak85RVhsUmt6MThr?=
 =?utf-8?B?NHJONmIvZk1vK3hnZ2R1MUs5WGNzNGdjNVA1SEF1S1hNaFVGZXhBZllKVktu?=
 =?utf-8?B?dTBQNkdTZzVsSmFqNXcvRlIvK3BLS1RUS0Q1LzNPVWFibWNNSFpWQ1NmVUVF?=
 =?utf-8?B?czEwSDN0a0E0dVc5VzRsRGJuZndBY0FSWkw1ajUrYVNtRXB0TVladjNINFlv?=
 =?utf-8?B?V0ZzQnQ1b2dQSFRKT1ZKdmpCbHlXYjFxVHd0aytLMEh2T2dGSkdubGVlWDdv?=
 =?utf-8?B?Z3JKK2E0eEJlWS9UNTBuOVZNZnF1dzZ1QXN3TWxobUxKMUo3RVN3czBNQTVs?=
 =?utf-8?B?OXNlTHpmaFNWVE8yRnpOZmkvY3Ura1hQdUZBcXBCZWVHM1hJYWV1UGFxcHZ0?=
 =?utf-8?B?MzlhaWE2S0swYmhhZW5Hem9hb3h3MWRGQ2Y5dTBlK3hmdWFhemZtMVNsM3FT?=
 =?utf-8?B?c2dXcXptdmVZZEFlQjlhQWR6dVdvckdhTjBtV0tybmtDT0FONHhwdGlrK0Fl?=
 =?utf-8?B?QmhzZG8zT1VJTEgwbUhuMTZhZGJrMzR3VDlVSzVyTWdzSDAvWXNDeEhpalYz?=
 =?utf-8?B?eFFENG54SWoyc2FvdTAzNWN2amJ5VGh0ajZPUHIxdG1qSENqeUk4TWtKdFFn?=
 =?utf-8?B?RElzNlc1cGdUR0tjakdrT0szK0lTSUl0d1hneXpaM2FLelJON3ovenA2Z0Js?=
 =?utf-8?B?SkdaM1Zyemo3RXlZREpRTnpGUEFkb2laMnQyUk9wYUxTT1ZxSitzTDFEeDZK?=
 =?utf-8?B?dHF3NmhyTWo3WEpYTDFxUUtrMzVBZHRKMDZSREFtSkNwS1FaOUlrZ0dNdm1z?=
 =?utf-8?B?WlNVRWlKZGtOTDNhK0UvV0VRSlpUaTBoUXBvTkd0dDFJZ0dHT212YWZmRmR6?=
 =?utf-8?B?Q09VdkdaNmR2OXVEelVSVFVBamJkdjk3MS9hRy9mR1Qzd05lWWdiSTBUblJV?=
 =?utf-8?B?YTlCSzJvTjNDd3dWTHBpYXNvREd0U2l2VXFNNHo1LzljdUNZRmVneHpEV0NP?=
 =?utf-8?B?WEJzK0hrUjNvU0dVRTY2Y0NDV3lOWUQxeVpTYld5clh6S1VZUXdCcS9ETFl6?=
 =?utf-8?B?a1JFMGthOXdsb2xmM1Q4MUUzOEYrQm5yTGlZNzExaGUzaG5ERjFYU2xiL2Q5?=
 =?utf-8?B?QW5LNlBTTlp4NHZZbkM2S2l3b2JIQkg1aTVCejlqTDk5MzFYZXZKVTFYcmNl?=
 =?utf-8?B?SGpJMG5ibzBIZERSc3lLUGdrWGViTkhEenhxNlU5cjNZampZbDBVQ3FZdHlT?=
 =?utf-8?B?eHdBSGpCdkorSHEvK1RMRFVacE1wbUJsc05NUEZZSXQzL0xUSUQyY21ib0Ix?=
 =?utf-8?B?RWpZOFlqcmJXZDNFOEFUWmNXNVAxYzZucm05TmR4ZGJWbDc5MkdnOWhGVmNJ?=
 =?utf-8?Q?Tv4bsq8cuoGBnVxPQV82J8PhmXh3FU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2s2RjZtNXlnazNzTGErdFVINXJRYjZMN25tN2FXWGtibzZkNnIxVEpoNFJU?=
 =?utf-8?B?cUVmS3JNODNyUGU2aVdMdXVuMVVwRFExVjIvWit3YUNETEtNOXhvdmh0N0la?=
 =?utf-8?B?RVV3RDBvVXd3Y1R3UEZxSVJlV3hiVDR4MllBWXpwOWlhZW94YWxRUnphdENy?=
 =?utf-8?B?Nzh5QnhSQjZMdjIwaUMzYTd4WVM0K0dLN3RtSnlSQnFUbFVtSEc1RDBZNU96?=
 =?utf-8?B?c3h6NVAxS25JT1hZaG95SU4yTzd2bHcrd2krSWVhTmE5REcxNkhmT0EzekYv?=
 =?utf-8?B?anY2WGdvZnFWWWtPWmMvamlhSEIvOFQ4NUFOc1EweXV2OTl5VGFEMU95MXRJ?=
 =?utf-8?B?NU9OelR5L1pvZ0J6SzV5SzFpblhhd29rZkdydXNsbUViR3ZhbHV1cUdheUtj?=
 =?utf-8?B?NUx3ODlISGNoZ3diWVc3b0RHUVU1Qzd6OHpXRFAxUUFWMHNwdzBkMm8xbFBR?=
 =?utf-8?B?TkZmNUR5dkNQL1FkYkY3OStyRjlJUE9hS2ZaVVR6dFBjeXdnL0JZbVFtL1hq?=
 =?utf-8?B?c1lQempKV2VtbjVsSVNuYVk4YVlKRklIV2YyNmtSSWRXTHdqMWlUMjBDcVZv?=
 =?utf-8?B?VjBJVlpyY2EwRTBKY3o5ZS93aWxBSk9qNVZiaXN0NjFvVUl3MFZUR0pLZk9Q?=
 =?utf-8?B?Uk9idC93Mi9GQ0hUdmJEQXliVlpOOU5qRkxWOC91MGN2Rktzdk9vcWJGYjI1?=
 =?utf-8?B?WGhmWUZWWWZGNzVnbWlraUdpd3lnVEcvZkZnS2U0RUlGeTROZHRqeVZKeEU1?=
 =?utf-8?B?VXhSWnJTTFpndmpjZjF1SFpjdE0waHA0YjRqdnZ1ZnJSdWVYQW9CZnZJUDM5?=
 =?utf-8?B?NWROT3hIYnNBVlN3a3ZBMngwb0dJaWUxQUVlQUhsSkJoN2JGNFlROFBUT1Ra?=
 =?utf-8?B?SWltWHdic2kyRy9LdHB0ZlJLTUNLSlQ3R0FQM2JjbmFOZ0pWRlJ6ZnJhZUlx?=
 =?utf-8?B?Y1BHdmtPcWoycW5sTFh3WUlLeWdXT1FWL0hjN3l2VUdPbyt5cXJTNHlUYUtt?=
 =?utf-8?B?R1M2akR1ZlRWYnpZNHpTVTk0WXlnK2RITEFOTXZIMTgvazFWOFFHZ3puQVIr?=
 =?utf-8?B?eHVIRG81ZzhiN3Z3RXE0Nnl6Q0FTSDdYSDA5QzFGVkdjZHUybWJGa29HY1Iv?=
 =?utf-8?B?ZG90dzlZR2Z0TlRROHpnVnNpOEVvaFBOZnBsT3FqQjQzNDY4NmJPWE1Yc0dS?=
 =?utf-8?B?SmVwTVNrSFBsalJITkVTUjZOZlh0TEhSQ01jSHJBYUVFR2lUZkFQZmxaZkdk?=
 =?utf-8?B?RkJ4RUVPL1ZNUUtmTnlPTmlCREE1eGxtajFQTVRGNk1LZkdFeG1zVVRqbmlo?=
 =?utf-8?B?SUN2SnBVMnZHaGIzVkR6bHdtOStVbmN6UTl0NC9MeSsyeExnQXBOa0FhYW5M?=
 =?utf-8?B?UEhiM1dkSnVKbDRlUEJuQ1BOdGQzVk8zckJRTjA4WUZnMUw5UUpmMDNOYUdZ?=
 =?utf-8?B?Wm1SdEl3eXRzTkQxczlIOTFOVk8yRmJ4RE9qYStaelZBK0EwQjF6ZUZIc2hR?=
 =?utf-8?B?MTQzMHBRSGlzMkJwUW1hYXhqSEhIbmpJR1VSWGhLN0lzWW8remxndmppMldz?=
 =?utf-8?B?Y0FGZTdFNExBR3VNRkVqZUxEN29VMXNXdkIveDNXK2xtTnRTOGs5UXBCem1t?=
 =?utf-8?B?bDhndGJQQjdpeDUyQ3ZOdlRGcnVtWE1zdDJiZ1FwdVMzd3htSkRkcWJ3bGc4?=
 =?utf-8?B?b2dQYVNpTmxEMFRaM1ZVdHZIRWpuOEIza2NRT1hjZWVjWmVSeTVIcXFMY1I1?=
 =?utf-8?B?ZnAzVzZ4Lyt1cGdYWWsrdi8zbEIvWC9GMjQvMmtsbmdqMnZUQ1grMXJOcE9p?=
 =?utf-8?B?WDhFODYxSVpyUUN4a2N5K2VGUDNwRS9QOUF4bTNBcm1wS0VoWkhveUlCTU4w?=
 =?utf-8?B?SExNb290V2ZxYmphemhlZmlnOWF6NlRleEJFMDcwMElJeVBYLzRmVHYvL2FO?=
 =?utf-8?B?NHNCd0ZGc0hlVHFhdysrc21NbmJxRDhlZzV6SUN6dzZPdDExcWtkMDNyc0hJ?=
 =?utf-8?B?TVZYL1F2OGZpeVVXRDdjVW1iQjNqNzQvZ0cyVFhjSEx3M3hZZFVsTEpjdmxa?=
 =?utf-8?B?d05GQnE0cnVYd1dHU2licWdGOXZuZFJLb0txY3h6OGR0TFNQditxU3pjb004?=
 =?utf-8?Q?BzDhclotBmS3/y63koJxpXboP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016470c2-b91b-4343-e4e0-08ddef2659d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 22:23:35.1163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HyaDLJeQ2yyaQ1DwTrdZpX/tgB0GlVTeVtWNUE/kqo8Uxlqd9TPBiu/8g9NQYZmEE9vpfTwmAms99zlpe4atfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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

T24gRnJpZGF5LCBTZXB0ZW1iZXIgNSwgMjAyNSA0OjAxIFBNLCBTdW1tZXJzLCBTdHVhcnQgd3Jv
dGU6DQo+IE9uIFNhdCwgMjAyNS0wOS0wNiBhdCAwNTozNyArMDgwMCwgWm9uZ3lhbyBCYWkgd3Jv
dGU6DQo+ID4geGVfZGV2aWNlX3N5c2ZzX2ZpbmkoKTogc3dpdGNoIHRoZSBvcmRlciBvZiBsYXRl
X2JpbmRfcmVtb3ZlX2ZpbGVzIGFuZA0KPiA+IHN5c2ZzX3JlbW92ZV9maWxlcyB0byBmb2xsb3cg
dGhlIHJ1bGUgdGhhdCBmaWxlcyBjcmVhdGUgbGF0ZXN0IGRlbGV0ZWQNCj4gPiBmaXJzdC4oTElG
TykNCj4gPg0KPiA+IHhlX2RldmljZV9zeXNmc19pbml0KCk6IG9uIHBhcnRpYWwgZmFpbHVyZSwg
YW55IHN5c2ZzIGZpbGVzIGNyZWF0ZWQNCj4gPiBiZWZvcmUgdGhlIGZhaWx1cmUgd2lsbCBiZSBj
bGVhbmVkIHVwIHZpYSB4ZV9kZXZpY2Vfc3lzZnNfZmluaSwNCj4gPiBlbnN1cmluZyBubyBsZWFr
ZWQgc3lzZnMgZW50cmllcyBBZGQgZnVuY3Rpb24gZGVzY3JpcHRpb24gY29tbWVudHMgZm9yDQo+
ID4geGVfZGV2aWNlX3N5c2ZzX2luaXQoKS4NCj4gPg0KPiA+IEZpeGVzOiAwZTQxNGJmN2FkMDEg
KCJkcm0veGU6IEV4cG9zZSBQQ0llIGxpbmsgZG93bmdyYWRlIGF0dHJpYnV0ZXMiKQ0KPiANCj4g
SSByZWFsaXplIHRoZSBleGFjdCBsaW5lIHdhcyBhZGRlZCBpbiB0aGlzIHBhdGNoLCBidXQgdGhl
IGxhdGUgYmluZGluZyBwYXRjaCBpcw0KPiB0aGUgb25lIHRoYXQgaW50cm9kdWNlcyB0aGUgb3Jk
ZXJpbmcgaXNzdWUuIFNvIEkgdGhpbmsgeW91IHNob3VsZCBtYXJrIHRoaXMNCj4gYWdhaW5zdDoN
Cj4gY29tbWl0IGNkYzM2YjY2Y2Q0MWQwZjZlMThlODZkN2FhNTA1NTRjODUyZjk3ZTINCj4gQXV0
aG9yOiBSYWFnIEphZGF2IDxyYWFnLmphZGF2QGludGVsLmNvbT4NCj4gRGF0ZTogICBXZWQgSnVs
IDkgMjI6MTI6MjQgMjAyNSArMDUzMA0KPiANCj4gICAgIGRybS94ZTogRXhwb3NlIGZhbiBjb250
cm9sIGFuZCB2b2x0YWdlIHJlZ3VsYXRvciB2ZXJzaW9uDQo+IA0KPiAgICAgQWRkIHN5c2ZzIGF0
dHJpYnV0ZXMgZm9yIGxhdGUgYmluZGluZyBmZWF0dXJlcyB3aGljaCBleHBvc2UgYm91bmQgdmVy
c2lvbg0KPiAgICAgdG8gdGhlIHVzZXIuDQo+IA0KPiAgICAgdjI6IFJld29yayBhdHRyaWJ1dGUg
YW5kIG1hY3JvIG5hbWluZyAoQmFkYWwpDQo+ICAgICB2MzogRHJvcCBmYW5jeSBmb3JtYXR0aW5n
IChSb2RyaWdvKQ0KPiAgICAgdjQ6IEZvcm0gdmVyc2lvbiBzdHJpbmcgdXNpbmcgbG9jYWwgdmFy
aWFibGVzIChSb2RyaWdvKQ0KPiANCj4gICAgIFNpZ25lZC1vZmYtYnk6IFJhYWcgSmFkYXYgPHJh
YWcuamFkYXZAaW50ZWwuY29tPg0KPiAgICAgUmV2aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9k
cmlnby52aXZpQGludGVsLmNvbT4NCj4gICAgIExpbms6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNTA3MDkxNjQyMjQuMjY3NjA4Ni0xLXJhYWcuamFkYXZAaW50ZWwuY29tDQo+ICAg
ICBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQoN
CkdldCBpdC4gV2lsbCB1cGRhdGUgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBab25neWFvIEJhaSA8em9uZ3lhby5iYWlAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jIHwgMjIgKysrKysrKysr
KysrKysrKysrKy0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZV9zeXNmcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2Zz
LmMNCj4gPiBpbmRleCA2ZWU0MjI1OTRiNTYuLjI3YjZkOTBhMDAwOSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPiBAQCAtMjkyLDExICsyOTIsMjMgQEAg
c3RhdGljIHZvaWQgeGVfZGV2aWNlX3N5c2ZzX2Zpbmkodm9pZCAqYXJnKQ0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lzZnNfcmVtb3ZlX2ZpbGUoJnhlLT5kcm0uZGV2LT5r
b2JqLA0KPiA+ICZkZXZfYXR0cl92cmFtX2QzY29sZF90aHJlc2hvbGQuYXR0cik7DQo+ID4NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0Up
IHsNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lzZnNfcmVtb3ZlX2ZpbGVz
KCZ4ZS0+ZHJtLmRldi0+a29iaiwNCj4gPiBhdXRvX2xpbmtfZG93bmdyYWRlX2F0dHJzKTsNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxhdGVfYmluZF9yZW1vdmVfZmlsZXMo
eGUtPmRybS5kZXYpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzeXNmc19y
ZW1vdmVfZmlsZXMoJnhlLT5kcm0uZGV2LT5rb2JqLA0KPiA+IGF1dG9fbGlua19kb3duZ3JhZGVf
YXR0cnMpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gwqB9DQo+ID4NCj4gPiArLyoqDQo+
ID4gKyAqIHhlX2RldmljZV9zeXNmc19pbml0IC0gSW5pdGlhbGl6ZSBzeXNmcyBhdHRyaWJ1dGVz
IGZvciB0aGUgWGUNCj4gPiBkZXZpY2UNCj4gPiArICogQHhlOiBQb2ludGVyIHRvIHRoZSBYZSBk
ZXZpY2Ugc3RydWN0dXJlDQo+ID4gKyAqDQo+ID4gKyAqIENyZWF0ZXMgYW5kIHJlZ2lzdGVycyBz
eXNmcyBhdHRyaWJ1dGVzIGZvciBkZXZpY2Utc3BlY2lmaWMNCj4gPiBjb250cm9scyBhbmQgc3Rh
dHVzLA0KPiA+ICsgKiBpbmNsdWRpbmcgVlJBTSBEM2NvbGQgdGhyZXNob2xkIGFuZCBQQ0llIGxp
bmsgZG93bmdyYWRlDQo+ID4gY2FwYWJpbGl0aWVzLCBkZXBlbmRpbmcNCj4gPiArICogb24gZGV2
aWNlIGNhcGFiaWxpdGllcyBhbmQgcGxhdGZvcm0gdHlwZS4NCj4gPiArICoNCj4gPiArICogT24g
cGFydGlhbCBmYWlsdXJlLCBhbnkgc3lzZnMgZmlsZXMgY3JlYXRlZCBiZWZvcmUgdGhlIGZhaWx1
cmUNCj4gPiB3aWxsIGJlIGNsZWFuZWQgdXANCj4gPiArICogdmlhIHhlX2RldmljZV9zeXNmc19m
aW5pLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gwqBpbnQgeGVfZGV2aWNlX3N5c2ZzX2luaXQoc3Ry
dWN0IHhlX2RldmljZSAqeGUpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBk
ZXZpY2UgKmRldiA9IHhlLT5kcm0uZGV2OyBAQCAtMzEwLDEyICszMjIsMTYgQEAgaW50DQo+ID4g
eGVfZGV2aWNlX3N5c2ZzX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4NCj4gPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UpIHsNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHN5c2ZzX2NyZWF0ZV9maWxl
cygmZGV2LT5rb2JqLA0KPiA+IGF1dG9fbGlua19kb3duZ3JhZGVfYXR0cnMpOw0KPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kZXZpY2Vfc3lzZnNfZmluaSh4ZSk7DQo+IA0KPiBJTU8g
aXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgYSBnb3RvIGhlcmUgdG8gdGhlIGVycm9yIHJldHVy
biBhdCB0aGUgYm90dG9tDQo+IG9mIHRoZSBmdW5jdGlvbi4gVGhhdCBzYXZlcyBhIGxpbmUgYnkg
Y29tYmluaW5nIHRoZSBjYWxscyB0bw0KPiB4ZV9kZXZpY2Vfc3lzZnNfZmluaSBhbmQgbW92ZXMg
dGhlIHJldHVybiB0byB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbi4NCj4gDQo+IFNvOg0KPiAJcmV0
ID0gc3lzZnNfY3JlYXRlX2ZpbGVzKCkNCj4gCWlmIChyZXQpDQo+IAkJZ290byBjbGVhbnVwOw0K
PiANCj4gCXJldCA9IGxhdGVfYmluZF9jcmVhdGVfZmlsZXMoKQ0KPiAJaWYgKHJldCkNCj4gCQln
b3RvIGNsZWFudXA7DQo+IA0KPiAJcmV0dXJuIDA7DQo+IA0KPiBjbGVhbnVwOg0KPiAJeGVfZGV2
aWNlX3N5c2ZzX2ZpbmkoKQ0KPiAJcmV0dXJuIHJldDsNCj4gDQoNCkFncmVlLCBpdCBpcyBjbGVh
cmVyIGFuZCBoYXMgYmV0dGVyIHNjYWxhYmlsaXR5Lg0KV2lsbCB1cGRhdGUgaW4gbmV4dCB2ZXJz
aW9uLg0KDQo+IEkgYWxzbyBzZWUgdGhlIHN5c2ZzIGNyZWF0ZS9yZW1vdmUgZnVuY3Rpb25zIHdp
dGhpbiB0aGUgbGF0ZV9iaW5kIHJvdXRpbmUgYXJlDQo+IGluIGZpcnN0IGluL2ZpcnN0IG91dCBv
cmRlci4gU2hvdWxkIHdlIGdvIGFoZWFkIGFuZCBmaXggdGhhdCBoZXJlIHRvbz8NCg0KWWVzLCB3
ZSBjb3VsZCByZWZpbmUgaXQgdG9nZXRoZXIuDQpBbmQgZHVyaW5nIEFJIHJldmlldyBteSBtb2Rp
ZnkgaW4gbGF0ZV9iaW5kX3JlbW92ZV9maWxlcygpLCBpdCBnaXZlcyBhIG1vcmUgc2ltcGxlIHN1
Z2dlc3Rpb246DQpSZW1vdmUgdGhlIHBjb2RlIGNoZWNraW5nIHRvIGF2b2lkcyBleHRyYSBvdmVy
aGVhZC4NCkkgdGhpbmsgaXQgaXMgYmV0dGVyLiBXaGF0J3MgeW91ciBvcGluaW9uPw0KDQpzdGF0
aWMgdm9pZCBsYXRlX2JpbmRfcmVtb3ZlX2ZpbGVzKHN0cnVjdCBkZXZpY2UgKmRldikNCnsNCiAg
ICAvKiBSZW1vdmUgaW4gcmV2ZXJzZSBvcmRlciBvZiBjcmVhdGlvbiAoTElGTykuDQogICAgICog
QXZvaWQgcXVlcnlpbmcgcGNvZGUvcnVudGltZSBwbSBoZXJlIOKAlCBzeXNmc19yZW1vdmVfZmls
ZSBpcyBzYWZlDQogICAgICogd2hlbiB0aGUgYXR0cmlidXRlIGRvZXNuJ3QgZXhpc3QsIGFuZCB0
aGlzIGF2b2lkcyBleHRyYSBvdmVyaGVhZA0KICAgICAqIG9yIGVycm9yIHBhdGhzIGR1cmluZyBj
bGVhbnVwLg0KICAgICAqLw0KICAgIHN5c2ZzX3JlbW92ZV9maWxlKCZkZXYtPmtvYmosICZkZXZf
YXR0cl9sYl92b2x0YWdlX3JlZ3VsYXRvcl92ZXJzaW9uLmF0dHIpOw0KICAgIHN5c2ZzX3JlbW92
ZV9maWxlKCZkZXYtPmtvYmosICZkZXZfYXR0cl9sYl9mYW5fY29udHJvbF92ZXJzaW9uLmF0dHIp
Ow0KfQ0KDQo+IA0KPiBUaGFua3MsDQo+IFN0dWFydA0KPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldCA9IGxhdGVfYmluZF9jcmVhdGVfZmlsZXMoZGV2KTsNCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKHJldCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2aWNlX3N5c2ZzX2ZpbmkoeGUpOw0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0K
PiA+DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
ZGV2LCB4ZV9kZXZpY2Vfc3lzZnNfZmluaSwNCj4gPiB4ZSk7DQoNCg==
