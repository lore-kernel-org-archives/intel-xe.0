Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D69C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 06:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710110E11C;
	Wed, 22 Jan 2025 06:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVENG6pW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A2210E11C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 06:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737527622; x=1769063622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6dOy1a5XAotSnfWKI706L2gdYVxNBuPY2+YM5A2hZoQ=;
 b=YVENG6pWjOW8MsnWbnry4/2Ua/Lyfl1IFEwVTQrV3hSEyfkkxVwJMkXz
 YivTGjrtexwyOoenQz1bZO0PyfZ7fqCnLi2RlKWf/DK/ipbuXCx1WJAvA
 mmC/do0O0y1LIROmPe2+VpUBXePTq6LQ2zb14afErGq6Equugsu1iply3
 Lm+m1xg6qp/fFl3wiYIp715E1S//Ikwy7Gliu0Ev+sekdCV4J4M2BHeUy
 agpNMacDfFcAhhoNmbUk0SuL3K7Nh4kbzHW/GH92PoAUVFFAnHj1+WerQ
 LdK5JgY8Fvs/vdQTEAOCN+OI2iyPTQTY/+w+NoTeZTVbq8TshN6AaihNY w==;
X-CSE-ConnectionGUID: yvifo9FtQKef6nPjVGdS/Q==
X-CSE-MsgGUID: nJeBWZ7fS0aPKzFjOQQvTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48463899"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="48463899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 22:33:42 -0800
X-CSE-ConnectionGUID: hIDinXSVTlmNKHQHNuj7Pg==
X-CSE-MsgGUID: aRUPx3wFTxiNalRNp+VSsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="112052096"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 22:33:41 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 22:33:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 22:33:41 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 22:33:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvJo9poBkPAUCOejjVAgXtfunsWFH4W5qWxniz7Ydbmwzz4VCxQmJqjKH4pv+QJvUebAsWMWphiX664jsNFQyjt0Oxv1Dckek+4bHQbEoh/WteCnMzI7lmWuNktmUlZEVRcyTQL/wdFWWAgtfsr3v1FW0NpTx4v6VuZuCdmg0Mf4f4o65bY2DxkuDI1WvqiPoga32dQORrNJom5ZZmUkno8+XPK43D22J84cVkGXZOvpytNSK/SAgRA2k3XOa/F++dRprq3ff1pgCU7/lAqPg2akxk4A/PuroEPDR7Q4b8IOfD4jMJZkKoK2BbaAoDGm6X4ZB2FbKkKpUKGSUo5zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dOy1a5XAotSnfWKI706L2gdYVxNBuPY2+YM5A2hZoQ=;
 b=xEudlYt9phYif5cGZnNEtEyc/hHDAJmLlsARVI+zby5kJPrHE3eg73EEC6S64bZSXx5kX4sS4U08PImjrE7VCuqNo0Fm5GuJsxU3rYdn7motjKipNb/3JKvFfI1yztbL1gd3owfnhRYtGoqhVWcqj9KlQldmhsIHP/6a5QpJaCluRm159cPYC92SorUkIagx/1DtCLYDG9/j+Z16A69i8arA0L2u8UxX7WTyUnYH1MXNFlvTBpZs9sfqe4SF8vHMO/cD4QQ1KJQexssEBNPLiEAdbibIx6nwC3UlIJDOcpe85ZzUjzoqx/lVyNP0pvCA8hvnV1v+ll7Yl+9mA49igQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 06:33:34 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 06:33:33 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH v3 3/3] drm/xe: Initialize mei-gsc and vsec in
 survivability mode
Thread-Topic: [PATCH v3 3/3] drm/xe: Initialize mei-gsc and vsec in
 survivability mode
Thread-Index: AQHbawN8omL/N1u/8UCW19mLxQtS5rMiWMUg
Date: Wed, 22 Jan 2025 06:33:33 +0000
Message-ID: <CY5PR11MB6366C0CEB0834437BBC12CB8EDE12@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250120064042.2596178-1-riana.tauro@intel.com>
 <20250120064042.2596178-4-riana.tauro@intel.com>
In-Reply-To: <20250120064042.2596178-4-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ2PR11MB7426:EE_
x-ms-office365-filtering-correlation-id: 1f3ea3a1-25c9-458b-b2bd-08dd3aaeb1d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VGNna1ZsWGc5LzhMeXlsRlZPMHVleDlPeGdXdXlCVUZ2RWRIOExHNURvTlJD?=
 =?utf-8?B?OUdGaEV6bjJqUTVpTzFHaVY0U1V2OCtaVkdLV0ZpWXhMNGFzVG9LZFhsSWRZ?=
 =?utf-8?B?bSs2RitwN0taWG12Q1hjQ3JmK3BPWlNIOE1JZzE0NkdNSzJNR3FERVdNR2No?=
 =?utf-8?B?MlFZM1pMSk1WczM2T2lvRnNWUmhPUVN2R3BkdGY3alJIWCs0ak41aGpuMFRD?=
 =?utf-8?B?VFBFZGxaWHhodkZuNXhETTZlQitobzBqSCtrblhaUndvRHRLQTlQYkl1Mzly?=
 =?utf-8?B?ZUhQYVVaVDF2c0RiZHFqZVgvVkhKclVnMHBqeVRiaFRLdjB5MTFWMm1JMEwr?=
 =?utf-8?B?by84YkJIZ2hVT1JSeVRyVE51cHd4Z1ZvY2pQb2xyUkhpOWU0bTRpZWh5Wlgw?=
 =?utf-8?B?UzBJNVUwdXBWbmk0MVhsdTlnZncyTlVHSVdHU0puOFc1Q3A1eDhQODJCTjNC?=
 =?utf-8?B?VTZXSGs0cCszQWdFYmV5QTNONGhQb29YU2hQWTB4TzBUQWZQUDcvU051L0I0?=
 =?utf-8?B?aUhnMUZWU2RWTldXMUlTREhEbGJ1UHR5YS85dFlrOStwMXJVcHlYRHBQeEZX?=
 =?utf-8?B?c2U0MHRDcXNtcU8zUmYwRjFVcUxCNlM4T1FWVGZFMTMzVC9vOWdPeE0xYmZK?=
 =?utf-8?B?WkhxbkJlKzF4R1p6YnJoRjcxWU9XZHR2VFNPVnV4L3dONFhOMTRvdmhoRDAv?=
 =?utf-8?B?MkRrcDVieFNiT0xiR2dLR2FLNU9EWm1YQkIrcWZuMEJndndSNnBubVJpaGZl?=
 =?utf-8?B?K0M1eE4wOVhUbXNUcHVTcWIxVk1xbnNUV1NCSzkxaXZzK0xSVG03Rmt1b2JS?=
 =?utf-8?B?eDVscEd4UkdRYW1mZWtnVFZhY1hETngreWRvbDhoOThJMjdvY0N2VmJGbnd0?=
 =?utf-8?B?QlRZNzN3OWplUGNoZFlDR0ZlMjlmS1d4M0R1OCtYNkoxcW9TRkhhNG1MRmg5?=
 =?utf-8?B?YUlQZVJIcnVFMEdwOTBhWUxIeXV0R0lSalNpYUJlYTVRWlVWanZFc0RLbDlL?=
 =?utf-8?B?TDVyU0l4S0lDSnkrckdITDdsclFMRTd6ZmN5cU9PdHAvY0t2QVVTZmVOS1h3?=
 =?utf-8?B?dWpBTzdSOXgrWVBJektoTE5ZK3Z3a1RmYStDQy9pVkQrWFhTQklXZHpVNGR6?=
 =?utf-8?B?dTZDM1ZQbWdXSUlCNnp3eWJDWlRJU3cva2hpVFVxcHhiMUcxL2JPTWpFN2N1?=
 =?utf-8?B?bDFEMEFJaFRuczBOQUViR3dhdUxLOElpTG0rNzV0ZEVkTnhlaDdXdzQ1NEJI?=
 =?utf-8?B?dUM0d3ZSNlhpYmNSQ2IraXNIWExaRWNrR1RXVVFZL201REZFSnk2TEpuYWJq?=
 =?utf-8?B?M05Pem1QOGlnMFBJdUE3bWc0ZmpmV0lkeERxMWxWcnVONWZ0cnQ4M01BVm8x?=
 =?utf-8?B?SHZyOVl3Q2k1MjRwVmZxWkI3Y3hRaFFTZG5VWVJyTzJvcWtEMGhud0JaQmFu?=
 =?utf-8?B?cnB1QjZ5RnEyc05XTzRYcmRXRnBUS1JycmM1S2NScFJUdW5sY1dyU2VOSmRm?=
 =?utf-8?B?MHRTU0NZbVpUZGtnUlhwbFNPWTRtR1cwVmFuYUZmblhaVk5yK2U0YVJQa3hL?=
 =?utf-8?B?Ym1oelBoSnNMLzRISU9FV1phNVV3Mnh3VHdvZk1ZT2FhN09PTXE2eHQvQnNC?=
 =?utf-8?B?UFhqNVg5ZXpGVnBrcDFWbnYxWFRIclRvMS93ZDdMK3MvcUJkYm5SdUJQUnFp?=
 =?utf-8?B?THVhcTVlVGJSeitVMVJCL0xTWHBUbVZCUHU0VnlDbVZyMVovOFFmUFRnb29i?=
 =?utf-8?B?VFNWcTBvOGUyODdYNGJEUXlzdG5nc25hb3RtMEhSL2pvMXJxU2FLYmZRTit2?=
 =?utf-8?B?N2Jqd3dLakVtd2lSMzBqdzBoRFJpK1B6L1hsUmVzSGxGV0RmQTdVL00yYU9n?=
 =?utf-8?B?Sy9LOENpeU81dHJ5WTZpKzFWbCtGbDR0ZldlZnMvUjZxMEt1SmZTSW4vSzZE?=
 =?utf-8?Q?WbfpAJ8QNiC2CVJkYHddIE0ZcaVmNsbr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGUyeUduWmJuWkNGK1BHazNiOGtOaGhrdnJxU2RVTlpvZjJGbUhRNVIwV0xN?=
 =?utf-8?B?TTdBYnMyMlFpRHlLSFBCR3RySDVqZngxbW55aFZjUFluL1hLdWlYT0NBVnB5?=
 =?utf-8?B?Nm41Z3FYcCtMc2lGYisxb3pyK3g1M1J3TDZwOUJ3WHJUVnl1dWd3L0Y0blht?=
 =?utf-8?B?K2ZXbjVrYk9mb1JYZ28xUVRVOGRrYkw0TEVESUlNaDN6b2w5Y2JSVTBCdnA1?=
 =?utf-8?B?VzhCR0ZGVmV2dUU4SFFkN2N6VUsvaktjWmVPdFdFY0FzQk01QkFYa05KanpI?=
 =?utf-8?B?THdCNW9JeEY4Y2pMbURrUlVkNHZCV01qRXJSNXlJbHRRcTF1UFJWQWRmakRP?=
 =?utf-8?B?VXJaWkRidVE0TDVPSlpsVWw4djdkVCtGaXVIbmRsaDlBc0RFRGs3SjhZelps?=
 =?utf-8?B?Y1lkb1NPSHVVS0Z6V0NhUFF6T1djWWhHVHdUdFNQN0U5S2ZmY3ZaRC8vTVFs?=
 =?utf-8?B?Mnc2bEw4MXRwQWtXQ2o1V0U1NWllTlR2L0FSeEczaU4xUlNON0NCWVd0aXNG?=
 =?utf-8?B?UEtuYlpwZDl3TUI0d2R2LzdWVngxNXQzS1RRbVlwZktDVjcyZ2htcUxESXMz?=
 =?utf-8?B?RWtpZU5tVWJGcDdZK3hXb08vZGxvWWZzcm9wYi9mcFRmN280WHE3cURMYlJy?=
 =?utf-8?B?M0tGVFFxcFVLcW5MZHFuOEJIL2tSMzFJdVkwUWs3UGZqUWE2VFBkM0RRS29B?=
 =?utf-8?B?K09hRXM3WWMrVGdWRGxSVjdzZWFQTUoyUk5wanY5YWhIV2VhMjBIYkJWRnZF?=
 =?utf-8?B?VVpLRERxKzgrYmtZZTBIVDZMbUlXU3lSVTg3WkdLK0NQSW4yd1I0aEppVkN6?=
 =?utf-8?B?NnNpQ1VSaW44L3RoNzBmaGsrdnRVOTRjUHQ2UVhMTk1ZRTdtNWNnU2RMMWs5?=
 =?utf-8?B?Y3FsZzlvb2hoQzhpd25yU1Jzc084bEtnb1RqUkQvajRJY2FXclJ1QXoycDRw?=
 =?utf-8?B?Z2JGWDRWYTlXcXJCU1BoWWoreDRVYVRmem9NRVJWSVQwVUd3YjNZcGxEZDBJ?=
 =?utf-8?B?QnJLU1hWOGxTMHdPM1BXdG01QlRXbCtab0VoWVBVN3MwcFV0b3AwQ29tV0xu?=
 =?utf-8?B?Tm1IS3hZVTlFNWtoQUJVbno2WEpQMVAvMllBK0x1U0tmaW1FNDkvRk05ZU5m?=
 =?utf-8?B?MHhldldvMURpaENIUWZRVEtGYmdSQ0krREp5QnFzb3ZaY0crZXBWamxUVmN5?=
 =?utf-8?B?U3EreUFzQnJiT3lyYlJvelZEZXFNaW1NQkRBWW9iYjRwQzV0ckNyMno1RXlw?=
 =?utf-8?B?c1h5dXJJc0RQMzVLSXk4UE92SlRrRnNaQlZHRjBzT2JTemxXaGlycUlNczYy?=
 =?utf-8?B?TnFhdmVCTGlVc1FuZ2t6VisyVzA3YU45ekVpblhHbW1KVDgvTGtsaFhJcFpL?=
 =?utf-8?B?allrRFRwTGtKM1VSeUFIZ1ZJTUdKMDBwQ3NsK1RwZUN2ZkxxMDBoS1NFTWN3?=
 =?utf-8?B?VFNyV3BOSDdNNE03TUlmamVUdmJURm1ncHlNdDd0L3YrR0RRVUxuZDhkL3VN?=
 =?utf-8?B?dmZYNzJMdUYwTjFWQkhZUk4yR29uRi9Wby9RaXFyTnhxK3hxSXAyKysrZFg1?=
 =?utf-8?B?b2xwbmo2MmI3UU5jME5xOENvbDBMZVltLzRndnBCT3E1WEN4bVZJL2pRZXBy?=
 =?utf-8?B?WFd6RnR1dGViL0dEME9rYUZKU1o5c09MelVlc2lhbFV2QlFqWVRJU1MwRlFl?=
 =?utf-8?B?cGhUN0pXUnN1Qnd6UFg0UHhqTmtpVkd6YVFDbXdNZ0o1WDJvZmt1cUlxOUI4?=
 =?utf-8?B?dnNnRm11cUZLVk1HNUpkQk51NHh3OGZJbnFTUG8wMWNiM2VsRS9zRUltWTF3?=
 =?utf-8?B?UTdQQm1peGxZWVdYMnVqRGlRdFR2RC9LUmdTaHdEUUsxNVVKalM5VW04MGMx?=
 =?utf-8?B?S085TzVQWEY5V0tGMERaZXBValNpbjc1T2JJRnd6OWRzeEpRb0R1cWtSem9K?=
 =?utf-8?B?L1hwM3poczAvYnpOQjY5U0lVSlBTZVVLZzRQZXNFNkRkSTVCQVpkcFl6KzRF?=
 =?utf-8?B?VUs1MkFiQ0ZwUEpiMmt3UDVoL0k2YW54SGMybUFOQjhIWThwNlRld1RGd043?=
 =?utf-8?B?VVR4cFdiSXpoS2pqRG1HKzJRYXd6TW1KbGdLTWpuRzBOTStPTjd1NHlKcG9P?=
 =?utf-8?Q?gRmk9f2vIix7ubA5BfLoPGCRu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3ea3a1-25c9-458b-b2bd-08dd3aaeb1d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 06:33:33.8480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5LSxcahDg1Puoa1RujqQdRpyINCpTlHFSfdXtuGhODbPC0xLbwMAxuLgnYA6lhLsj3rz9ktYJDitEJ/jAH5bacwLw7R9IrYdSV8ggyQu5aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMy8zXSBkcm0veGU6IEluaXRpYWxpemUgbWVpLWdzYyBhbmQg
dnNlYyBpbiBzdXJ2aXZhYmlsaXR5DQo+IG1vZGUNCj4gDQo+IEluaXRpYWxpemUgbWVpLWdzYyBp
biBzdXJ2aXZhYmlsaXR5IG1vZGUgYW5kIGRpc2FibGUgSEVDSQ0KPiBpbnRlcnJ1cHRzLiBBbHNv
IGluaXRpYWxpemUgdnNlYyBpbiBzdXJ2aXZhYmlsaXR5IG1vZGUNCj4gDQoNClJldmlld2VkLWJ5
OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KDQo+IFNp
Z25lZC1vZmYtYnk6IFJpYW5hIFRhdXJvIDxyaWFuYS50YXVyb0BpbnRlbC5jb20+DQo+IFJldmll
d2VkLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2hlY2lfZ3NjLmMgICAgICAgICAgIHwgMyArKy0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYyB8IDcgKysrKysrKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9oZWNpX2dzYy5jDQo+IGluZGV4IGQ3NjViZmQzNjM2Yi4uMDZkYzc4ZDNh
ODEyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaGVjaV9nc2MuYw0KPiBAQCAtMTIsNiArMTIsNyBA
QA0KPiAgI2luY2x1ZGUgInhlX2Rydi5oIg0KPiAgI2luY2x1ZGUgInhlX2hlY2lfZ3NjLmgiDQo+
ICAjaW5jbHVkZSAieGVfcGxhdGZvcm1fdHlwZXMuaCINCj4gKyNpbmNsdWRlICJ4ZV9zdXJ2aXZh
YmlsaXR5X21vZGUuaCINCj4gDQo+ICAjZGVmaW5lIEdTQ19CQVJfTEVOR1RIICAweDAwMDAwRkZD
DQo+IA0KPiBAQCAtMjAwLDcgKzIwMSw3IEBAIHZvaWQgeGVfaGVjaV9nc2NfaW5pdChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSkNCj4gIAkJcmV0dXJuOw0KPiAgCX0NCj4gDQo+IC0JaWYgKCFkZWYtPnVz
ZV9wb2xsaW5nKSB7DQo+ICsJaWYgKCFkZWYtPnVzZV9wb2xsaW5nICYmICF4ZV9zdXJ2aXZhYmls
aXR5X21vZGVfZW5hYmxlZCh4ZSkpIHsNCj4gIAkJcmV0ID0gaGVjaV9nc2NfaXJxX3NldHVwKHhl
KTsNCj4gIAkJaWYgKHJldCkNCj4gIAkJCWdvdG8gZmFpbDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21vZGUuYw0KPiBpbmRleCBlMWNlMTRkOGRlYzIuLjE2ZTgw
NWUzMjg4NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxp
dHlfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5X21v
ZGUuYw0KPiBAQCAtMTIsOCArMTIsMTAgQEANCj4gDQo+ICAjaW5jbHVkZSAieGVfZGV2aWNlLmgi
DQo+ICAjaW5jbHVkZSAieGVfZ3QuaCINCj4gKyNpbmNsdWRlICJ4ZV9oZWNpX2dzYy5oIg0KPiAg
I2luY2x1ZGUgInhlX21taW8uaCINCj4gICNpbmNsdWRlICJ4ZV9wY29kZV9hcGkuaCINCj4gKyNp
bmNsdWRlICJ4ZV92c2VjLmgiDQo+IA0KPiAgI2RlZmluZSBNQVhfU0NSQVRDSF9NTUlPIDgNCj4g
DQo+IEBAIC0xNDIsNiArMTQ0LDEwIEBAIHN0YXRpYyB2b2lkIGVuYWJsZV9zdXJ2aXZhYmlsaXR5
X21vZGUoc3RydWN0IHBjaV9kZXYNCj4gKnBkZXYpDQo+ICAJCWRldl93YXJuKGRldiwgIkZhaWxl
ZCB0byBjcmVhdGUgc3Vydml2YWJpbGl0eSBzeXNmcyBmaWxlc1xuIik7DQo+ICAJCXJldHVybjsN
Cj4gIAl9DQo+ICsNCj4gKwl4ZV9oZWNpX2dzY19pbml0KHhlKTsNCj4gKw0KPiArCXhlX3ZzZWNf
aW5pdCh4ZSk7DQo+ICB9DQo+IA0KPiAgLyoqDQo+IEBAIC0xOTQsNiArMjAwLDcgQEAgdm9pZCB4
ZV9zdXJ2aXZhYmlsaXR5X21vZGVfcmVtb3ZlKHN0cnVjdCB4ZV9kZXZpY2UNCj4gKnhlKQ0KPiAg
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+IA0KPiAgCXN5c2ZzX3JlbW92ZV9m
aWxlKCZkZXYtPmtvYmosICZkZXZfYXR0cl9zdXJ2aXZhYmlsaXR5X21vZGUuYXR0cik7DQo+ICsJ
eGVfaGVjaV9nc2NfZmluaSh4ZSk7DQo+ICAJa2ZyZWUoc3Vydml2YWJpbGl0eS0+aW5mbyk7DQo+
ICAJcGNpX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KPiAgfQ0KPiAtLQ0KPiAyLjQ3LjENCg0K
