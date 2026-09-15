Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C69CC88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7920310E2F1;
	Tue, 15 Sep 2026 20:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCm2WRN0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8F010E2F1
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502753; x=1821038753;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QYHMdmOlq5o9tKQkvtegnIIqQO1rCukGLnesOZSz4Bg=;
 b=iCm2WRN0X0Ic+fpIfVs/PkYVKcKBLBJM6PqodYhP6ghKluvEOLX3j/TJ
 xJTTIywy3mVRMwn6+aV8V5j/yLg+GHafKPwuQUckWhEYROWN04mO9cKMk
 BfI3wVrK7YFf9vdLK5+YNOtwKI4znlMgkjup97YppIDPt911fbgIyKTSQ
 EmpXdscZRY9Cz6mk0e18ijknQ31NkpCHUrYKldI5zvPRP5xxeN/h5cPwn
 m8LvjxM+xxbbgyjoBvS8z+WPWA4CoeRUDQBFNmxdppnjf4I6evjkRxAAh
 fiYt/yKGnwLdV8J0UdZf1rIJuGUjhydkFrL93YKu61prPjmlGOG5dC3VC Q==;
X-CSE-ConnectionGUID: JX0pHWAtQE+4WeAUn1gGqA==
X-CSE-MsgGUID: 3N5mDy/ZRuG4WXlRG3U7yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93578618"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93578618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:05:52 -0700
X-CSE-ConnectionGUID: 9UW2nFv0RdmeNs3wnDmANw==
X-CSE-MsgGUID: W1mYzj07TeC9RT2xNx2RUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277238697"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:05:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 13:05:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 13:05:51 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 13:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glDepTEUOjHfRTKW3CrExddUSbwcTQyHRaoLXGbp3CHdE/NY9ArYlgFzLyAXVtmx3AuiS50S+Pd3/hU7PeVR3vMPd0WhipaVfA5qXPmO/aKza4TZCi0oQDGpf0WMLjDFTgqXZs0bDfwZ5W98y+E0fUQWvAxyZX2Fvzno4BdiRkknIJrqvh/hNsiG90hFMmbjgnGhMVJ98Px+QAznkS1lPYApAxHq8oSHeIr0pBkWry8wvHm18U9i0KRWbFva+KYvMPY8V+PMThnEFALCgl4p4yds48zgDfwlZnzgfpaw/E0psGA9FnuRhFqgYI9n2RVibMxp63/CTpHyu4ThH1tIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYHMdmOlq5o9tKQkvtegnIIqQO1rCukGLnesOZSz4Bg=;
 b=a6UYU/UhiGr0PEeMezRZ7e5Ugxmdp3lEz8ixbMD/PLjAsM23zZUNpy0P+AdfwfbJiDU6RLpHHu/tg0PlZ/F+31xdSejTDJi/XWTqIWT20RdPpvrOXBU9jd+Q6ELwzMDii5RTc5AJ405lXf3tdM3bblRfdSlNHDPHnRpgZcu+stdK1P8Iu9r7Epg2hjpO/rlXA2cnhNe2drtKMt+ANkp9AE2HW2j8EeSyufuJq9RTicNKJa0zkX/GEW5pnFeOkqHmG/cFXdNk/SopRk3gb5/kQQSd5bJsIxsMVSJYVrti1u7iwWW4LPlRoS9Fuizc/dgT3vr4N64LOLxIEr0gIY4N1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by PH6PR11MB873569.namprd11.prod.outlook.com (2603:10b6:510:3fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 20:05:48 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 20:05:48 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2 5/6] DO NOT MERGE: drm/xe/gsc: define GSC for WCL
Thread-Topic: [PATCH v2 5/6] DO NOT MERGE: drm/xe/gsc: define GSC for WCL
Thread-Index: AQHdNX4bg+/KG9WqnEGQJZZqm00a97ay1xKAgB1ZI4A=
Date: Tue, 15 Sep 2026 20:05:48 +0000
Message-ID: <92fe037d2c25e88b8c4045940aa2b7aea9ead04f.camel@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
 <20260826171149.708378-6-daniele.ceraolospurio@intel.com>
 <f44d20610ac8d6d2660179294b0de6522590b9c4.camel@intel.com>
In-Reply-To: <f44d20610ac8d6d2660179294b0de6522590b9c4.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|PH6PR11MB873569:EE_
x-ms-office365-filtering-correlation-id: 9f070083-c19e-4e50-4baa-08df1364bc64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|38070700021|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: EYa+MixkpsOwVsqG7HK3mseXvJZqhnQPDC+drsVpoAk+HzLawFSXodd0K8Xd8tUURmqTxDGhmlHAdawroaPjWDno6v9tRRazl34eceWRLnVQO/UIlUaeTEAbM67F6izVy3C+p6a+XDKh0NdAX/8vqQ64/dO3TvCKv7a02IaB2opOsTqyBfCJARJ1f+y8+6U0hG+9oaBjXcbD7LjKNAccDiizgwMAYDFSiZmz3Tk5d4/3F+iVjP2zxYqncDjPqieJvST1hExusstrZ4NXcfciuEc+9sMlOk1gObyPGPWTzbi9xiu5YnLR8MwllmnO67CcJdA4WV9BbPMhPLSiC0eaKOCHguzNog3Rd0Xmmplp4mgn2tnelboJz77eO1X4J0Hq9wZSdETiI7E10a7Bj2EIENioo4RBqtdhwBax0Z1CRukCJzPpum45/i3UIaQu5EEI7Xlpx9OurOOz8O7GtJQL5cNMkB0q5IBC4ueoZYLeY9INJwcQMfWQVioRXe+LQsjrGYJboJLNz0m4sGmedkdtQ0937bTv6Ac8QiexGLwOEIXvOsxZlyPUA1ZDmBK4eIY2IrmFSQanbXqEDFd3ZcIByjJAPaCu+D96T2MWFASNoSiYDeikuuRa2CGM4kiOtP3/YF8g2m1qOT0xiBPIQN1adc5+/c34Hv4RE6ftefgY2krfxnZcC0/0ec+4l3FSzEfduIVIo5h0gjEkYpQrw0fXWtnFZhv26EwkOyzmHPvoUyU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUxHRjQxMHI1d2MyS1F5T3NUWUVBeDFJbENQUDVNWUR3STU0cGNyNUEzSUV3?=
 =?utf-8?B?UFViWlBUTkNQa1RJWTlLSDVncHBPcDVoZWlVdFNaY043WXc0Si9MUC84YStM?=
 =?utf-8?B?c09pc0RxTkNVNk5wV2hCRWUyTlJYVzQxajRYNkhOZ1RXem51MlpWa2ZzTnVt?=
 =?utf-8?B?c0IyZGQxeGE0Qi9tZnM2YjNyenRGTVg1L1FBZFFTQ2pQTWNhN0MyV2FMc1lr?=
 =?utf-8?B?OEkvaXoxZDF3OFhLbFkwTDhKOG41NzZDU0I3WUVlVUJPdE14WWpLTnlZYlp0?=
 =?utf-8?B?SkRrc1JmS1NNcWU3dFhUK0k4bG53dGR1TWN0WEF5d0RHUDE0Z2JBc0szeURH?=
 =?utf-8?B?YWp3c0ZxU0R2Q0x3dVpKaE9OaHV5SzIwN2pJb1B5THVlS2RseFd6Z0pWMXpS?=
 =?utf-8?B?MTIzQTR3c01vVmgrOGhkVmg0VW9Od204VlJGUVdxam1lSjN6VWpVQ0g3K25k?=
 =?utf-8?B?UmpiYk9BSWs3dmxLZU5aMFVoSlFqQWtiTHFjTUp5OTVFUUtXYlp1Z1dreHJ5?=
 =?utf-8?B?dCtHN291MVpST2RTQ1ZoaENROEZLNkFMTkxtSEIzeDMrdGZXT0I2REJULzhZ?=
 =?utf-8?B?ZlMrU21lQnNZZm91QW5jVDBQY3FHeEdCYk54VkZCUjA4VFBpOXlqSGE5MWw5?=
 =?utf-8?B?NDBlMVk0OTQzTXhiSEk5dEFQR3hXNkZXVDFabWJrZ1NoVDZBSWtaZWJxSmVJ?=
 =?utf-8?B?QldoRUJVc2U4V0c4bnhBblFXbjVOV3QrSVJQOGNaeG04Y2ttUmJ5WjM4Rlh3?=
 =?utf-8?B?THRxRzVac3J3MjlGWWQ0dWszUDdtaU9IeDJ6d3VnR3NOcXZOT2UxckNHMVA1?=
 =?utf-8?B?d0R5RVpES01hNHN0YjU5YnhsYnNWaUFiT0w0eEZCc3l6WEFOUVJxYjVVS0Zx?=
 =?utf-8?B?U21pM2ZIZEl0cndxK2hKNnRHbTlMb0lrVDJ5cmo1Q2tJeEhNc29QQ3Z1blc5?=
 =?utf-8?B?R2xkNWJoNExQWUg0QSs2Q0Z3OG54L3ZCVEhUcTVnZHBoVDd3RUxRT1MvbSsv?=
 =?utf-8?B?YVFLTGQxVkVoYThYQXNhbVJxNDNyOXc5RDFqUjhmU0pzdzJtNjJ4eGo0YzNh?=
 =?utf-8?B?OG53QlFwTzdiRmswRWtpbUJHV05ta3RNWk9yUVEyMFBxMWlOYWxrU1BMVVF5?=
 =?utf-8?B?UHJGWnAxN2RuWXV6V2Nxb0YxcnJKdjBxN3kzc2E2b01YcGFocTQvYWZCNmx3?=
 =?utf-8?B?Nk1UTnhyY0EreFlQQlBaa0tmb3pHOWhrNllkYTFqTVJpUUNOSktQM1B5U0xm?=
 =?utf-8?B?a3cyK01NdEQrY2d6S0RDdFpmYUJYL1RFakxLUXg0RDdvTlhJTVN0L0Qwc1Rw?=
 =?utf-8?B?TndkV1pLc0tuT1ZGUks2U1NWclBWbnp0ZHluajZRa29td05obUgwTi95aUVs?=
 =?utf-8?B?UGRnWXVjemtqcGVCWFRJemZNdzF1cEEwaHhEQjBIS1lLbmc0SnlyNXkxc1Bs?=
 =?utf-8?B?YW5weFhUZUtQbHJhV2NNNksvSmRscTIvZkJKMlQwTGZLUk9XU1FnQTB2TzlN?=
 =?utf-8?B?RFRBNWhIZWcweC9idUEybm5RZkFvNk51aDZMMFVEeU1mMnVLUVNDZnZNdjRm?=
 =?utf-8?B?WDUybE5aZmk0UWdSMENXc0JNanZoMGRDcVUyQlBsZU9JZ0hhYXRCcGhLdFZR?=
 =?utf-8?B?RVR1dnM2S0VKUXhjeWY0V2p6UWpjemRicWkrSThJVnhPTkZMQlUzOTRINGhv?=
 =?utf-8?B?V2ZvWS8zSzBFUHFKK1I0N0dCN0EySzF5bUJvY3JLYkpSRWkwTE1kenFIV21j?=
 =?utf-8?B?S1l5SlZiU3pyREYwNlJtWG90UmtJSTM0UFB4VTJTWTBMUWFyOWZLMnc5UWlM?=
 =?utf-8?B?WFJnTlNyZWxsQXpXbTM1MXpWYU1GdWQrcWhvMmU4SDNta014OWNnNFRSbzNu?=
 =?utf-8?B?d3RzWmlJRVE2a3BDSGQwNmdOZE4rOGszRmJobW5na3g3TGdnVUlFK2U4YW14?=
 =?utf-8?B?NHBucjUyVEd0N21pMnh0cy9KZ0p5d3ZYcUlZVytvTjhYSzlmTFBXUTg2Nnpn?=
 =?utf-8?B?N0pEdk9hNW1xSFJHSXdVVnhLWnZKL04wT01Edmo1Z2M2ZWplRjcrQkUwOWNV?=
 =?utf-8?B?UDZ6TGQ2YUlySlNpcGpVOGZueU1TdDBFMS9DQ0xMT3g2bzJlcHNyOEdGNHBx?=
 =?utf-8?B?MEdvVmlnbE9ySzQzMEZUbU55NjVNaGh4SzFjWmFvZXI4U0FlOElreE1vT0Zh?=
 =?utf-8?B?SjFpYzBMWHg4cXNzZHBiKzd3TXFuZGlCb3FWZE1XeklVVEQwdzBvRzRyZTFk?=
 =?utf-8?B?dmZhZkRaWDdVYVBhL3VsaGlEZTRvT21lb3JOWVlGRDRLU0lLa1pLSi9TWWVi?=
 =?utf-8?B?K2FzLzRhS01LM2FiZXBRQ21mbTU2UEl3bk9OUGlURUtveitESDZLMUdkOTN5?=
 =?utf-8?Q?UIkSafnKXuR0vljcG7u9PTn5MLe22wyG2A2sT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3A6AE44A319004A8F4CEF865934EEF3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cvnFfUwQCglS58ci+WO8zHHhihV1ngru+nk3Q4POy/LPCe+dvyR/+IJ+ug/6+R+I7h0UEPelQRrwvIqV1E4nv7Wrk2vxugRbHR/PMDs6cH3iV/tJm1iZOtrf0cPAW0D6qsergpooJ5o6J5MYjkIVW88wZkKojLNY+cHbC8GogfJc66kEk35k4CjZi1m/saEK5xliu7SxenBsdPtK4oKANPxmSM7eSNwAG/J4HpvKqn2KFhNDxRpIycQUN+Yf5Qqei+VffYvMHd6YAx/0OsZNKUai3Fj7weZqCTGqUZoAxOX2s/KV9b9uaZEdX0pgy++4w9mBketEe1rrm2mNbJWApg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f070083-c19e-4e50-4baa-08df1364bc64
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 20:05:48.7638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KEjxS9+mXhTHC086L9iGvD2+ZiAVbMbdA9l1NGXtz3l4jx7865Ek5yd8Ldl3TECxhMzbe15xV76/QsHGZvfiC4pkSw3vTw2ETBxaJyzxNJV1Mr6vmEeop/XtEqg1i7Av
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR11MB873569
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

Rm9sbG93IHVwOiBPZmZsaW5lIGNvbmNlbmN1cyBpcyB0aGF0IHdlIGNhbm5vdCBtZXJnZSB0aGUg
c2VyaWVzIHVudGlsIHdlIGhhdmUgYSB3b3JraW5nDQpmaXJtd2FyZSB0aGF0IGFjdHVhbGx5IHVz
ZXMgdGhlIHBhdGNoIHNlcmllcy4gQnV0IFYyIHdhcyBhIGltcG9ydGFudCBzdGVwIGJlY2F1c2UN
CnRoZSAiRE8gTk9UIE1FUkdFIiBwYXRjaGVzIHByb3ZlZCB0aGF0IHRoZSBmYWxsYmFjayBwYXRo
IHdvcmtlZC4NCg0KV2UnbGwgcmUtcmV2IHRoaXMgc2VyaWVzIHdoZW4gd2UgZ2V0IGZpbmFsIHJl
bGVhc2UgRlcgYW5kIHdlIGNhbiBwcm9jZWVkIHRvIGRyb3ANCnRoZSBmaW5hbCAyIHBhdGNoZXMg
b24gdGhhdCBuZXh0IHJldi4NCg0KDQpPbiBUaHUsIDIwMjYtMDgtMjcgYXQgMjA6NTUgLTA3MDAs
IFRlcmVzIEFsZXhpcywgQWxhbiBQcmV2aW4gd3JvdGU6DQo+IFNpbmNlIHRoaXMgaXMgdGhlIHBy
ZXZpZXcgb2Ygd2hhdCBtaWdodCBsb29rIGxpa2UgdGhlIHJlYWwgcGF0Y2ggYnV0IGNhbnQgZ2V0
IG1lcmdlZCB5ZXQsIHRodXMNCj4gQWNrZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50
ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KPiANCj4gDQo+IE9uIFdlZCwgMjAyNi0wOC0yNiBhdCAx
NzoxMSArMDAwMCwgRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyB3cm90ZToNCj4gPiBUaGlzIHBhdGNo
IGlzIGp1c3QgdG8gc2hvdyBob3cgdGhlIHNlcGFyYXRlIFdDTCBkZWZpbml0aW9uIHdvdWxkIGxv
b2suDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFu
aWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV91Y19mdy5jIHwgMSArDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3
LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYw0KPiA+IGluZGV4IDEyZmJjMjVkYzZi
OC4uZGM0ZTI2OGYxMzc5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91
Y19mdy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VjX2Z3LmMNCj4gPiBAQCAt
MTQ3LDYgKzE0Nyw3IEBAIHN0cnVjdCBmd19ibG9ic19ieV90eXBlIHsNCj4gPiDCoA0KPiA+IMKg
LyogZm9yIHRoZSBHU0MgRlcgd2UgbWF0Y2ggdGhlIGNvbXBhdGliaWxpdHkgdmVyc2lvbiBhbmQg
bm90IHRoZSByZWxlYXNlIG9uZSAqLw0KPiA+IMKgI2RlZmluZSBYRV9HU0NfRklSTVdBUkVfREVG
Uyhmd19kZWYsIG1ham9yX3ZlcikJCVwNCj4gPiArCWZ3X2RlZihQQU5USEVSTEFLRSwJU1VCUExB
VEZPUk1fV0lMRENBVExBS0UsbWFqb3JfdmVyKHhlLAlnc2MsCXdjbCwJMTA1LCAxLCAwKSkJXA0K
PiA+IMKgCWZ3X2RlZihQQU5USEVSTEFLRSwJU1VCUExBVEZPUk1fQU5ZLAltYWpvcl92ZXIoeGUs
CWdzYywJcHRsLAkxMDUsIDEsIDApKQlcDQo+ID4gwqAJZndfZGVmKExVTkFSTEFLRSwJU1VCUExB
VEZPUk1fQU5ZLAltYWpvcl92ZXIoeGUsCWdzYywJbG5sLAkxMDQsIDEsIDApKQlcDQo+ID4gwqAJ
ZndfZGVmKE1FVEVPUkxBS0UsCVNVQlBMQVRGT1JNX0FOWSwJbWFqb3JfdmVyKGk5MTUsCWdzYywJ
bXRsLAkxMDIsIDEsIDApKQ0KPiANCg0K
