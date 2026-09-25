Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA258C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 12:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938F110E90C;
	Fri, 25 Sep 2026 12:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ze7kj6J/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5810E90C;
 Fri, 25 Sep 2026 12:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790339561; x=1821875561;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=g5AtXbcawfgBXKbd42KkkZYOr1zXQs4Pa2c3VUwIGjE=;
 b=Ze7kj6J/3ELqlPKGLRuLdqF2TVUEpfDlIv+W1/t9w+9SJ5z4+7Iwaf1o
 OeUCvydlMLEh4UpSV6LtdA5/7nqCtXsSUov93gxa/ezJbG1J83+CwXYuF
 RC8W2hI/NvqGULmgYzDXFnm/A7H1DkcIkTsCL7boNu1xnZrIloJRpyjtS
 7xien0hkAlD9aJO8FHqnBtkJOY5eTsDrTLk0gKJr8id+x/I7uvzXD0X17
 DBeUfbADcFl07hWHlH2m9EGhD2vB5v33QJzfPMCxBNhJ7Lt8CuoEqOg9D
 nI9s7KSSKh9/b6QFXYXuD8hvpZZ8fHI6IZkXqmOrbY93E8ksjsbxeIJu/ w==;
X-CSE-ConnectionGUID: 2EFWSjxUQt+jX3+fJNVATQ==
X-CSE-MsgGUID: 4KKl+ohaTOCxGx/l1xhxBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101296356"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="101296356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 05:32:41 -0700
X-CSE-ConnectionGUID: xOW6PgHwTEWWUF9S4tZVrg==
X-CSE-MsgGUID: NjfHeEs/TFmFWZdLKkVooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="300595981"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 05:32:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 05:32:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 05:32:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 05:32:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op9jay+SN8VqeUGT2C3JfFluC+UoGKzax50UTIPhNb9gqyXvOWxNRRuLl8UPoVU5U7WCXNy7JIve6MHwiyEsS0fRRDeAjFVXeUTj6hGSNDNsb2Mkh5muNMVkrXi4CEXkUlArdzCYEgAZ0v4eLTx+bL9/6MlWKlRH36dH2fzU2hLqHC1WZtF3CYJz4BLcwnWYCiYkc0Am18hJ5fMsvm3nPRKPfTnTNkry6rMH5rxRV+WSVoBcAFfD1cimiII4on0Xc5tUuAdmk6VDyK6MoXXztST1gHHpsBsfxX92TInU0KNXfU/jk+iYrhVRv4mh8afVp6iqmN+YiF8kRq5NTnStWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5AtXbcawfgBXKbd42KkkZYOr1zXQs4Pa2c3VUwIGjE=;
 b=J0stP71BZ5EPq7abl/LSz04nQtscdKVnLrUuNv4b6iu040wnpUbsmsxMU9hh4hwxQAWvBhpQWnU8MUQNsY4USqL/N1ZfWQQmLzfDRcUeHKySx4z82uXQG1+cD3g3hDzftmSZejSlfz2tYVxaGcNnl2P3uojYG93HrVF1P4M+Uzx6qQ3xA42M6CtuenqTvQ+adVRIGRIT/4xl1NTSq1f/4oXMDm5zkTMZbFaX874yN1aIofIlIeNuBk6RV2MYys0iT76+Y9jZG0NLonKyTW5MJL0OlnVoG2t8XG4wJ7kvyiCmyziVMxog6GEok5saXyp3payD0SKw+GXM73/6jrw4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by MW5PR11MB5810.namprd11.prod.outlook.com
 (2603:10b6:303:192::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Fri, 25 Sep
 2026 12:32:34 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 12:32:33 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/psr: Allow Panel Replay and PSR2 with joiner
Thread-Topic: [PATCH] drm/i915/psr: Allow Panel Replay and PSR2 with joiner
Thread-Index: AQHdS1MRPtfqIPmcj0qPGwAm6lhasbbfJU4AgAAUolA=
Date: Fri, 25 Sep 2026 12:32:33 +0000
Message-ID: <DS4PPF69154114F664B860F6482CD2CCF78EF802@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
 <20260923115941.746934-5-mika.kahola@intel.com>
 <0e3a5c8d0ce949af917011f3b6329ce66c95a382.camel@intel.com>
In-Reply-To: <0e3a5c8d0ce949af917011f3b6329ce66c95a382.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|MW5PR11MB5810:EE_
x-ms-office365-filtering-correlation-id: c3af7f5a-87e8-4f72-ada5-08df1b01131b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|22082099003|56012099006|11063799006|4143699003|6133799003|10067099003|260925021311599003|3023799007|18002099003|260925021911599003|260925022911599003|38070700021;
x-microsoft-antispam-message-info: AkcHExD1YctgE80So8JFUvSFTjkznx/8WOXDbjmm+6LOc16aPsEubC9OLbnqWoNmGAzViu/qhEdNVztHTvXsAvZbmTfc633HTLZO0hs5+pUygTT1EgN0t+kgK+Wf4e/uJ2bETMCH31TVCF16CKufibxJd8yBT0ptbgoiGp6xMsCw52dSPD5CDXpDlv5DSnmS3nn7OFmvklI9qD1Ab6jJxV+ZD3QbKiw6Y2jAute+UIIxgn3wWegby/fEuAuda6OxJrUu+wRPWGznNAA7G1Aa4yltMq/TwBkAaSNOSfFV6N3Ab9vhEyX1gr+iYOmckRyL0OvtyfbZu5vlUr+th5foked0NatrANMFpUIgr/+oUiR/nBC4kpDGToyrMDLkD4JOgAKHz2DB9bZGCCVBdhHDVUdhN2b/768WaPJ6pu46S2ydZoZGTrfBsLnbUwmqQlfLPjZ31FECH5WZeDzX/M7QJ+4tzJLz5gIg8XApZf9/gZeX3LD5WUDY+lILQeBbZfA9D1dBoWQ/dvWq5bSMLRsSXUzNZ6FTdv6ZLhqO+Mot5d1+Is3dB+ZRkrRh+qMEPJCzd7zZBcIfemOHcRJvxdixL3PFpomsHp9WO8clwEV9duTqIpjsC6J/+MY2zetaSxEjAjpIWkvI1yOlYvpUiIQCfN50AS/UajBqdYyeAhUNu2vvDPdGXYWXqlY/AZzd/TaUwFwhC4z8vOraYvQ1jDAbtuZs0lycKsDzRFgcC0jLMic=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(260925021311599003)(3023799007)(18002099003)(260925021911599003)(260925022911599003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHptdWhMNHNKTUMzMWplLzdiSHdXaUtLWmJJaXY1NnZLcUd4V2JnVnNGS3Vp?=
 =?utf-8?B?czF5RmFMeGNDWjdTUWFHUWNEc1d2WkNhS1Bmb29hWWpmclV3R1VHVXBIY0xr?=
 =?utf-8?B?OS9VMzhBdklHSEFYTFhyeTdpYk9PSnhWdysxckFFQXVBZEMxTTYrZE9mZm5H?=
 =?utf-8?B?MjMyTVJGK3FtRm42MzNkMyt3MlhrREhWaE5rWlB1SEZFdHVmTXk1L2Z1YTdW?=
 =?utf-8?B?bENLbUdLcnJxOW0yV0hQUktwaW13Q08yd0RzTkZQNldXeUpEK25iUjRYbW1W?=
 =?utf-8?B?c1d4T1QwMDNtNGlZOXNuWkpsWTFDSGcwRFlQOG5XV3pDNjlBakR1bGlQVWs4?=
 =?utf-8?B?OFFDQVBKUTBLekZsd1ZCa3N5aW4yUHJpeFk4MHdYblgrVFlZeXZqWGVKUWVG?=
 =?utf-8?B?dmxxdUdTTUpkdy9NY2kyQW9xL0Z5b0NtQzB6QnNUb1VvanZnRUQ5NC9UMWdY?=
 =?utf-8?B?dnoyM004Q3hLNU5vbU5sVFpqL3BWYzdpaytkeittZlFUeWdlTFlHNkZYVXUx?=
 =?utf-8?B?MUNPTkpQV0pnYTNCdE42OXY3bzA3Q0c2eTF5T20vdE55UmQ4emQ0R0JZQ1ZF?=
 =?utf-8?B?Q0VGb1p1dWdoSXc3d0JIaUlvaDhwYVREbmRGalhQL0Z5dU5HNy85UnVuMERQ?=
 =?utf-8?B?WXgxUDltUkFWaTNXY1VkMUJ4MUVIdFVCUVNoQmxjTUZLd01sSHhvQzIwczl3?=
 =?utf-8?B?WXV2V0J5aEIydVI1OFpZYW9sbENoLzlJS21ENVIxYU5TQUJSaDdsWHdpeHcy?=
 =?utf-8?B?VjVkSVdaQ3liMlppbFI1NnZZU2pSK2hFU3c1Z0JEMFh2bDJ6ZFRkK3pxSHZG?=
 =?utf-8?B?N3hTbkNldnd6UzAwd05WSkwyam1Rem5ZRUxtZDM5MlZyTHJWM1lSNEtId1Z3?=
 =?utf-8?B?TXJucWJFWHYwYWkxUFpnSUtaVGhSclpMSWRXakVuYUtFSURHUFpqMFY5bzVk?=
 =?utf-8?B?OVpzdHlHUTdkSXgvdXg2RS9lN3pNbE5TV1JqbFhrTjM1MS9jNXNHcVJVMkpr?=
 =?utf-8?B?eHRnT3gwVHMzL1VnOGdnaW9VRS82NkdRVFdpc2wrbTdWUmMrK2RsaW9pV0NW?=
 =?utf-8?B?TzJnNS90VnZ3U2xLNmtiamYvcWtHQ1lQSWxWTmhwVkNjUittMmVQSmhNTWJW?=
 =?utf-8?B?TnRNRGt5SlEwMUV6TGZPRVQ3NkVpbTVzMFdDbXhKUC9DZndPbG44aFd3QW5Z?=
 =?utf-8?B?aHU2c21iY0JrZ21xdGtGd3NBUEI1bnMxcTJaaXl5MmJoZ0lsRW51MnZ4eFpt?=
 =?utf-8?B?VXA5UTdEeXUvcVNaWDNBQmZQYjRUK0Y0WGJad2dTWXpWcDVsL09velM3RllQ?=
 =?utf-8?B?ZmtxM1ExWVpwZmF0cklxVG9CNFF5U21FTDJ5Unl4QngxajgyNDJtcFpHMFRx?=
 =?utf-8?B?RlUzV0txQ0RjN2Mvdk1VUDBhK0FLT0JLWUN6dVg2RDVaa3pYeEQwTndOdVc3?=
 =?utf-8?B?NEg5MFh0V2lyNGRTSTBEVzZNdXNxUi9nMVpyVTVISCtBR0w5aytFaDE2bUYy?=
 =?utf-8?B?bFVNYXdqMzhTWXZtOFFFd2tlU3JmZmZkUjR6L3hGa3VIbG10MjcwV2piaVZq?=
 =?utf-8?B?cGFpWmlOdmFPdTlWMnVxc3pkcU9CU251ZklxZGRWbEhIbElCeE11RFBRbS8v?=
 =?utf-8?B?QnhvM0gyVHZ6MlpoZlMvVktnQndjTEMweTRPQ2E3a3N0eEQyMm5rSkNrRU1k?=
 =?utf-8?B?Uk4yeU91eWl3Tk5sRzBYT09HV2JzbU1MSWNEWTJIWWRTZm1yRk11ZTZ1Qmlu?=
 =?utf-8?B?UU1LbDFDcWwwU2tjSW5oampoMzA4dEtQWW11SS90dHh4OE1qMy90dUJWbXhk?=
 =?utf-8?B?dDdtZDFsWUFFODZGZjZHclMvMVIzR2dCQ3lmY1NCY0JNM1BaY1BUak9WSksv?=
 =?utf-8?B?OHNFaFFXNjZwdm9wajZQY2RYMktob2xkZ0lLeVRRTGF0TzdtbjdmQzVBelgy?=
 =?utf-8?B?V0o5SER1VUVqWXBvcUd1OGpoelB3SCt6RDB0N1htdTE1Zks5VHNYb1U3R3U3?=
 =?utf-8?B?RUhsRDlWRlZKU3RVZkttcGFsbGxlRmFhVEVDb2pqNnlGbmo3SlpGRDlZS25M?=
 =?utf-8?B?MjVqUlhONytVWlJiRlBUb21UMTJHbitaUHpJaXlUT3cvazZtQ1dzM3d1c2Yz?=
 =?utf-8?B?OFcyN25WdEZZUUM1TDFyWFZkcTIrNjQzYTg1NmtyWndmaXBDeWhrTEJEY25W?=
 =?utf-8?B?S0lQNzY0UDgzRUc0aVZ1S0pyMFp6Q3ZyeVdWWGN4RDBmWTdqd2Z2M2F2T3BL?=
 =?utf-8?B?anFHS24zMWkrTDBPeEhwSngyeDZkN2lyZ3FlMlZlbTZwWWI1TTMwdDRieGg5?=
 =?utf-8?B?Tkd5ZTR3eldLNE01b0NDUFBsRU9hWjhYRDhGUU9ua3c3YkJxMGVva2FiMy95?=
 =?utf-8?Q?Ahat7Pggej0RzpWC1EAuB7171AIIru70LxWnVzP6VKDNR?=
x-ms-exchange-antispam-messagedata-1: adgFSs8p3YhHtA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HtgVCQJjF5u3ciJEs3G4gwk+9tJLCmNoTBG0RBeUpv4Xi7q7KUY2Kh7Mmu4vUGsN1ORT2HgfQ08U/3XAn4HmQmZAF9LPVp6dEs6PqaBF3caGrpecS0xusfINOVGUoKiOTMvsFTWGPGqK8dOAJ0xSwrVL2PstnhZ2V2JbAsVnR/ikBh7Y3HfI6tVqDDGGC2FGHdSvzdSAxxNJaX0tdZ2mqbtAmYahE1e8u8Tzl8i2fJ5ZuoqmrGN/F+Xn9Bbq4NiD4OeowO/2D2EGc9DTmpzhXCKMpLfiC7DxytWxI7+T3CKTP0tvVXhAx7qN3w2ek+mzXBRJ35S+t9NG/1o61CcYpg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3af7f5a-87e8-4f72-ada5-08df1b01131b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 12:32:33.8901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GfegbLYs4kA1CbZmbGaIXuR6uI9hiPinxsWo4kOMsJ8HzjRrECejsI/l3CqCu9DU8o/Zx9U3N1uJC78SdcXSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCAyNSBTZXB0ZW1iZXIgMjAy
NiAxNC4wNw0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLYWhvbGEsIE1p
a2EgPG1pa2Eua2Fob2xhQGludGVsLmNvbT47IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUvcHNyOiBBbGxvdyBQYW5lbCBSZXBs
YXkgYW5kIFBTUjIgd2l0aCBqb2luZXINCj4gDQo+IE9uIFdlZCwgMjAyNi0wOS0yMyBhdCAxMTo1
OSArMDAwMCwgTWlrYSBLYWhvbGEgd3JvdGU6DQo+ID4gRWFjaCBqb2luZWQgcGlwZSBoYXMgaXRz
IG93biBQU1IgcmVnaXN0ZXIgYmxvY2ssIHNvIFBhbmVsIFJlcGxheSBhbmQNCj4gPiBQU1IyIHNl
bGVjdGl2ZSB1cGRhdGUgd29yayB3aXRoIHRoZSBwaXBlIEEvQiBqb2luZXIuIFBsYWluIFBTUjEg
ZG9lcw0KPiA+IG5vdCwga2VlcCByZWplY3RpbmcgdGhhdC4NCj4gPg0KPiA+IEFzc2lzdGVkLWJ5
OiBDb3BpbG90OmNsYXVkZS1vcHVzLTUNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8
bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuYyB8IDczICsrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAt
LQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfcHNyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMN
Cj4gPiBpbmRleCA0NzQzYjViOTE3NDMuLmM4MzAzMzJiMzNmMiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IEBAIC0xNTg3LDYgKzE1ODcs
NTAgQEAgc3RhdGljIGJvb2wgaW50ZWxfcHNyMl9jb25maWdfdmFsaWQoc3RydWN0DQo+ID4gaW50
ZWxfZHAgKmludGVsX2RwLA0KPiA+IMKgCXJldHVybiB0cnVlOw0KPiA+IMKgfQ0KPiA+DQo+ID4g
Ky8qDQo+ID4gKyAqIEpvaW5lciBuZWVkcyBhIHBlci1waXBlIFBTUi9QYW5lbCBSZXBsYXkgcmVn
aXN0ZXIgYmxvY2ssIG9ubHkNCj4gPiArICogc3VwcG9ydGVkIG9uIHBpcGUgQS9CLg0KPiA+ICsg
Ki8NCj4gPiArc3RhdGljIGJvb2wgcHNyX2pvaW5lcl9jb25maWdfdmFsaWQoc3RydWN0IGludGVs
X2RwICppbnRlbF9kcCwNCj4gPiArCQkJCcKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19z
dGF0ZQ0KPiA+ICpjcnRjX3N0YXRlLA0KPiA+ICsJCQkJwqDCoMKgIGNvbnN0IGNoYXIgKndoYXQp
DQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxf
ZGlzcGxheShpbnRlbF9kcCk7DQo+ID4gKw0KPiA+ICsJaWYgKCFjcnRjX3N0YXRlLT5qb2luZXJf
cGlwZXMpDQo+ID4gKwkJcmV0dXJuIHRydWU7DQo+ID4gKw0KPiA+ICsJaWYgKGNydGNfc3RhdGUt
PmpvaW5lcl9waXBlcyAmIH4oQklUKFBJUEVfQSkgfCBCSVQoUElQRV9CKSkpDQo+ID4gew0KPiA+
ICsJCWRybV9kYmdfa21zKGRpc3BsYXktPmRybSwNCj4gPiArCQkJwqDCoMKgICIlcyBub3QgZW5h
YmxlZCwgam9pbmVyIG9ubHkgc3VwcG9ydGVkDQo+ID4gb24gcGlwZSBBL0JcbiIsIHdoYXQpOw0K
PiA+ICsJCXJldHVybiBmYWxzZTsNCj4gDQo+IFBTUiBhbmQgZURQIFBhbmVsIFJlcGxheSBhcmUg
cmVzdHJpY3RlZCB0byBwaXBlIEEgYW5kIHBpcGUgQiBnZW5lcmFsbHkNCj4gbm90IHNwZWNpZmlj
IHRvIGpvaW5lci4gU2VlIHRhYmxlIGluIEJzcGVjIDY4OTIwLiBEUCBQYW5lbCBSZXBsYXkgZG8N
Cj4gbm90IGhhdmUgdGhpcyByZXN0cmljdGlvbi4gUGFuZWwgUmVwbGF5IHJlc3RyaWN0aW9uIGlz
IGhhbmRsZWQgaW4NCj4gX3BhbmVsX3JlcGxheV9jb21wdXRlX2NvbmZpZy4gUFNSIGRvZXNuJ3Qg
c2VlbSB0byBoYXZlIHRoaXMgY2hlY2sgYXQNCj4gYWxsLiBJIGRvbid0IGtub3cgaWYgaXQncyBl
dmVuIHBvc3NpYmxlIHRvIGhhdmUgZURQIG9uIHBpcGUgQz8gSnVzdA0KPiBxdWVzdGlvbmluZyBp
ZiB0aGlzIGNoZWNrIG1ha2VzIHNlbnNlIGJlaW5nIGpvaW5lciBzcGVjaWZpYz8gQXJlIHlvdQ0K
PiB0YXJnZXRpbmcgdG8gaGFuZGxlIHNjZW5hcmlvIHdoZXJlIHByaW1hcnkgcGlwZSBoYXMgcHNy
L3BhbmVsIHJlcGxheSwNCj4gYnV0IHNlY29uZGFyeSBkb2Vzbid0Pw0KDQplRFAgaXMgbGltaXRl
ZCB0byBwaXBlIEEgYW5kIEIgb25seS4gWW91J3JlIHJpZ2h0IHRoYXQgUGFuZWwgUmVwbGF5IGRv
ZXNuJ3QgaGF2ZSB0aGlzIGxpbWl0YXRpb24uIFNvIHdlIGFyZSB0YWxraW5nIGFib3V0IGFib3V0
IFBJUEUgQyBldGMuIEluIGNhc2Ugb2YgUGFuZWwgUmVwbGF5LiBMaWtlIHlvdSBzYWlkLCB0aGlz
IHBpcGUgY2hlY2sgaXMgYWxyZWFkeSBpbiBwbGFjZSBpbiBfcGFuZWxfcmVwbGF5X2NvbXB1dGVf
Y29uZmlnKCkuICBJIGRvbid0IHNlZSBhIHNjZW5hcmlvIHBvc3NpYmxlIHRoYXQgcHJpbWFyeSBw
aXBlIHdvdWxkIGhhdmUgUFNSL1BSIGFuZCBzZWNvbmRhcnkgZG9lc24ndCBvciB2aWNlIHZlcnNh
LiBTbyBhbGwgaW4gYWxsLCBJIHdpbGwgZHJvcCB0aGlzIGZyb20gdGhlIGZ1dHVyZSBzZXJpZXMu
DQoNClRoYW5rcyBmb3IgYSByZXZpZXchDQoNCi1NaWthLQ0KDQo+IA0KPiA+ICsJfQ0KPiA+ICsN
Cj4gPiArCXJldHVybiB0cnVlOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiBQU1Iy
IHNlbGVjdGl2ZSBmZXRjaCBhbmQgUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUgc2hhcmUg
dGhlDQo+ID4gc2FtZQ0KPiA+ICsgKiBqb2luZXIgbGltaXRzLCBwbHVzIG5vIHVuY29tcHJlc3Nl
ZCBqb2luZXIgY29uZmlndXJhdGlvbiBpbiBZVVYNCj4gPiA0OjI6MC4NCj4gPiArICovDQo+ID4g
K3N0YXRpYyBib29sIHBzcjJfam9pbmVyX2NvbmZpZ192YWxpZChzdHJ1Y3QgaW50ZWxfZHAgKmlu
dGVsX2RwLA0KPiA+ICsJCQkJwqDCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUN
Cj4gPiAqY3J0Y19zdGF0ZSkNCj4gDQo+IFJlbmFtZSB0aGlzIGFzIHNlbF91cGRhdGVfam9pbmVy
X2NvbmZpZ192YWxpZC4gcHNyMiBpcyBwc3IyIGJ1dA0KPiBzZWxfdXBkYXRlIG1heSBiZSBwYW5l
bCByZXBsYXkgb3IgcHNyMi4gVGhlcmUgaXMgc3RpbGwgc29tZSBvbGQgY29kZQ0KPiBub3QgZm9s
bG93aW5nIHRoaXMsIGJ1dCBsZXQncyBub3QgYWRkIG1vcmUuDQo+IA0KPiBCUiwNCj4gSm91bmkg
SMO2Z2FuZGVyDQo+IA0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxh
eSA9IHRvX2ludGVsX2Rpc3BsYXkoaW50ZWxfZHApOw0KPiA+ICsNCj4gPiArCWlmICghcHNyX2pv
aW5lcl9jb25maWdfdmFsaWQoaW50ZWxfZHAsIGNydGNfc3RhdGUsDQo+ID4gIlNlbGVjdGl2ZSB1
cGRhdGUiKSkNCj4gPiArCQlyZXR1cm4gZmFsc2U7DQo+ID4gKw0KPiA+ICsJaWYgKGNydGNfc3Rh
dGUtPmpvaW5lcl9waXBlcyAmJiAhY3J0Y19zdGF0ZS0NCj4gPiA+ZHNjLmNvbXByZXNzaW9uX2Vu
YWJsZSAmJg0KPiA+ICsJwqDCoMKgIGNydGNfc3RhdGUtPm91dHB1dF9mb3JtYXQgPT0NCj4gPiBJ
TlRFTF9PVVRQVVRfRk9STUFUX1lDQkNSNDIwKSB7DQo+ID4gKwkJZHJtX2RiZ19rbXMoZGlzcGxh
eS0+ZHJtLA0KPiA+ICsJCQnCoMKgwqAgIlNlbGVjdGl2ZSB1cGRhdGUgbm90IGVuYWJsZWQsDQo+
ID4gdW5jb21wcmVzc2VkIGpvaW5lciBkb2VzIG5vdCBzdXBwb3J0IFlVViA0OjI6MFxuIik7DQo+
ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiB0cnVlOw0K
PiA+ICt9DQo+ID4gKw0KPiA+IMKgc3RhdGljIGJvb2wgaW50ZWxfc2VsX3VwZGF0ZV9jb25maWdf
dmFsaWQoc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gPiAqY3J0Y19zdGF0ZSwNCj4gPiDCoAkJ
CQkJwqAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUNCj4gPiAqY29ubl9zdGF0ZSkNCj4gPiDC
oHsNCj4gPiBAQCAtMTU5NCw2ICsxNjM4LDkgQEAgc3RhdGljIGJvb2wNCj4gPiBpbnRlbF9zZWxf
dXBkYXRlX2NvbmZpZ192YWxpZChzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwN
Cj4gPiDCoAlzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwID0gaW50ZWxfYXR0YWNoZWRfZHAoY29u
bmVjdG9yKTsNCj4gPiDCoAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVs
X2Rpc3BsYXkoaW50ZWxfZHApOw0KPiA+DQo+ID4gKwlpZiAoIXBzcjJfam9pbmVyX2NvbmZpZ192
YWxpZChpbnRlbF9kcCwgY3J0Y19zdGF0ZSkpDQo+ID4gKwkJZ290byB1bnN1cHBvcnRlZDsNCj4g
PiArDQo+ID4gwqAJaWYgKEhBU19QU1IyX1NFTF9GRVRDSChkaXNwbGF5KSAmJg0KPiA+IMKgCcKg
wqDCoCAhaW50ZWxfcHNyMl9zZWxfZmV0Y2hfY29uZmlnX3ZhbGlkKGludGVsX2RwLCBjcnRjX3N0
YXRlKQ0KPiA+ICYmDQo+ID4gwqAJwqDCoMKgICFIQVNfUFNSX0hXX1RSQUNLSU5HKGRpc3BsYXkp
KSB7DQo+ID4gQEAgLTE3MzMsNiArMTc4MCw5IEBAIHN0YXRpYyBib29sIF9wYW5lbF9yZXBsYXlf
Y29tcHV0ZV9jb25maWcoc3RydWN0DQo+ID4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwN
Cj4gPiDCoAkJcmV0dXJuIGZhbHNlOw0KPiA+IMKgCX0NCj4gPg0KPiA+ICsJaWYgKCFwc3Jfam9p
bmVyX2NvbmZpZ192YWxpZChpbnRlbF9kcCwgY3J0Y19zdGF0ZSwgIlBhbmVsDQo+ID4gUmVwbGF5
IikpDQo+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ICsNCj4gPiDCoAljcnRjX3N0YXRlLT5saW5r
X29mZl9hZnRlcl9hc19zZHBfd2hlbl9wcl9hY3RpdmUgPQ0KPiA+IGNvbXB1dGVfbGlua19vZmZf
YWZ0ZXJfYXNfc2RwX3doZW5fcHJfYWN0aXZlKGNvbm5lY3Rvcik7DQo+ID4gwqAJY3J0Y19zdGF0
ZS0+ZGlzYWJsZV9hc19zZHBfd2hlbl9wcl9hY3RpdmUgPQ0KPiA+IGNvbXB1dGVfZGlzYWJsZV9h
c19zZHBfd2hlbl9wcl9hY3RpdmUoY29ubmVjdG9yKTsNCj4gPg0KPiA+IEBAIC0xODg2LDE3ICsx
OTM2LDYgQEAgdm9pZCBpbnRlbF9wc3JfY29tcHV0ZV9jb25maWcoc3RydWN0IGludGVsX2RwDQo+
ID4gKmludGVsX2RwLA0KPiA+IMKgCQlyZXR1cm47DQo+ID4gwqAJfQ0KPiA+DQo+ID4gLQkvKg0K
PiA+IC0JICogRklYTUUgZmlndXJlIG91dCB3aGF0IGlzIHdyb25nIHdpdGggUFNSK2pvaW5lciBh
bmQNCj4gPiAtCSAqIGZpeCBpdC4gUHJlc3VtYWJseSBzb21ldGhpbmcgcmVsYXRlZCB0byB0aGUg
ZmFjdCB0aGF0DQo+ID4gLQkgKiBQU1IgaXMgYSB0cmFuc2NvZGVyIGxldmVsIGZlYXR1cmUuDQo+
ID4gLQkgKi8NCj4gPiAtCWlmIChjcnRjX3N0YXRlLT5qb2luZXJfcGlwZXMpIHsNCj4gPiAtCQlk
cm1fZGJnX2ttcyhkaXNwbGF5LT5kcm0sDQo+ID4gLQkJCcKgwqDCoCAiUFNSIGRpc2FibGVkIGR1
ZSB0byBqb2luZXJcbiIpOw0KPiA+IC0JCXJldHVybjsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gwqAJ
LyogT25seSB1c2VkIGZvciBzdGF0ZSB2ZXJpZmljYXRpb24uICovDQo+ID4gwqAJY3J0Y19zdGF0
ZS0+cGFuZWxfcmVwbGF5X2RzY19zdXBwb3J0ID0gY29ubmVjdG9yLQ0KPiA+ID5kcC5wYW5lbF9y
ZXBsYXlfY2Fwcy5kc2Nfc3VwcG9ydDsNCj4gPiDCoAljcnRjX3N0YXRlLT5oYXNfcGFuZWxfcmVw
bGF5ID0NCj4gPiBfcGFuZWxfcmVwbGF5X2NvbXB1dGVfY29uZmlnKGNydGNfc3RhdGUsIGNvbm5f
c3RhdGUpOw0KPiA+IEBAIC0xOTA4LDYgKzE5NDcsMTQgQEAgdm9pZCBpbnRlbF9wc3JfY29tcHV0
ZV9jb25maWcoc3RydWN0IGludGVsX2RwDQo+ID4gKmludGVsX2RwLA0KPiA+IMKgCQlyZXR1cm47
DQo+ID4NCj4gPiDCoAljcnRjX3N0YXRlLT5oYXNfc2VsX3VwZGF0ZSA9DQo+ID4gaW50ZWxfc2Vs
X3VwZGF0ZV9jb25maWdfdmFsaWQoY3J0Y19zdGF0ZSwgY29ubl9zdGF0ZSk7DQo+ID4gKw0KPiA+
ICsJLyogUGxhaW4gUFNSMSBpcyBub3Qgc3VwcG9ydGVkIHdpdGggam9pbmVyLiAqLw0KPiA+ICsJ
aWYgKGNydGNfc3RhdGUtPmpvaW5lcl9waXBlcyAmJiAhY3J0Y19zdGF0ZS0NCj4gPiA+aGFzX3Bh
bmVsX3JlcGxheSAmJg0KPiA+ICsJwqDCoMKgICFjcnRjX3N0YXRlLT5oYXNfc2VsX3VwZGF0ZSkg
ew0KPiA+ICsJCWRybV9kYmdfa21zKGRpc3BsYXktPmRybSwNCj4gPiArCQkJwqDCoMKgICJQU1Ig
ZGlzYWJsZWQsIFBTUjEgbm90IHN1cHBvcnRlZCB3aXRoDQo+ID4gam9pbmVyXG4iKTsNCj4gPiAr
CQljcnRjX3N0YXRlLT5oYXNfcHNyID0gZmFsc2U7DQo+ID4gKwl9DQo+ID4gwqB9DQo+ID4NCj4g
PiDCoHZvaWQgaW50ZWxfcHNyX2dldF9jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29k
ZXIsDQo+ID4gQEAgLTQ3MjgsNiArNDc3NSwxMCBAQCB2b2lkIGludGVsX3Bzcl9jb21wdXRlX2Nv
bmZpZ19sYXRlKHN0cnVjdA0KPiA+IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiDCoAkJY3J0Y19z
dGF0ZS0+aGFzX3NlbF91cGRhdGUgPSBmYWxzZTsNCj4gPiDCoAkJY3J0Y19zdGF0ZS0+ZW5hYmxl
X3BzcjJfc3VfcmVnaW9uX2V0ID0gZmFsc2U7DQo+ID4gwqAJCWNydGNfc3RhdGUtPmVuYWJsZV9w
c3IyX3NlbF9mZXRjaCA9IGZhbHNlOw0KPiA+ICsNCj4gPiArCQkvKiBQbGFpbiBQU1IxIGlzIG5v
dCBzdXBwb3J0ZWQgd2l0aCBqb2luZXIuICovDQo+ID4gKwkJaWYgKGNydGNfc3RhdGUtPmpvaW5l
cl9waXBlcykNCj4gPiArCQkJY3J0Y19zdGF0ZS0+aGFzX3BzciA9IGZhbHNlOw0KPiA+IMKgCX0N
Cj4gPg0KPiA+IMKgCS8qIFdhXzE4MDM3ODE4ODc2ICovDQoNCg==
