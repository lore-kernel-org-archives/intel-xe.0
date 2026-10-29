Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8456E606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 05:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KcJa0NA8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E091410E3E3;
	Thu, 29 Oct 2026 05:12:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CE010E380;
 Thu, 29 Oct 2026 05:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793250734; x=1824786734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M+NiFEcx4J7a0pacRHsnlUHHt28+3SeWQZuX7Ji0EFo=;
 b=KcJa0NA8ap4+ssKPvJvH13JmSu0xNZ32PbMJGXHmU60QIEshK0qbQnSR
 pjIPTikDstg0FQDeIi5gNQ2KK5I0fUM3/mQ0o3nm+k5kEtGdjrsXjh8Si
 CfhnRM7kG2yMI/AQSnMtTNvaZZpBAV7oW+7p56gH3RhcqjFDHULJOFiex
 d7bWtbm2lVAeHwJutPFLP5ImUQORvItRl2xSJES5e3JIzqpLn+n/wlF/4
 mTrV+wZcAxLGboKpQx51JvqwfoZJomLPsFmj58J7hWv59720caLneM/FX
 BXSGSGjDkB5Rvz3biycVd7RFREBM60JWIMA3nGzo5ALm/3mlgbiuv6e1x Q==;
X-CSE-ConnectionGUID: ls0QJL6IQdyPcC7eB9RNhg==
X-CSE-MsgGUID: time/GtzQf+fA326EMb59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1876550"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1876550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:12:13 -0700
X-CSE-ConnectionGUID: 3O7+XZZyTPKior8hvqELhw==
X-CSE-MsgGUID: ii8O1foiRKypifoYeamGRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5372966"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:12:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:12:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 22:12:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 22:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRdGS1m8KqoMZh2B7V+Wf42LvvEBXYq5rI+n3TqkVBp+SIF4buTWXidEP2oudtWiN+0wMJ/Mav3ACdiH9eaJMJphhNnxRqaAzagz/llZ62gjKDSJS68UJ7oAyft+avveiB9lN6bpfDx7afb43KDes2Dvgfg9glHYrk507HXQPnrtF3j91y4qV3jXJ9dbFGAa7ARaz4KWpYfd8azHvgcmcNdI2wkKcbMPLWUgumgvapUUseH/fpg+VM2zMxwRiZIfJxEZN7skkIFT/P0SuojtbL8MB38ITGfSLLTWChn3DFTINw4S5hCLFMWSDmfDyRpQXBPfxU6uZlWDAHrJK66ZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+NiFEcx4J7a0pacRHsnlUHHt28+3SeWQZuX7Ji0EFo=;
 b=qan1gtF0Ktx6qCJAv8mlHjTxgMNepaNr82xvf4SEyOF4ZrEapouN9mQzkiZisiru3HYybb0/4zyfTvrczhSg1HaUfi8jVUh9FQEbadfFhkThQFvXnlnbIc9h4xFXvERaS4HnonQnQ8cADwaBg7e/BvDaSRlLHcJxGA+M/0GGkQwa5q6QoyHQpWqASxBtaYxGXmpG9+h2EnRd7HeuT+unUgZ6LvwvNhq8kOqUmHxbhlWQl9j3iDiWhOfamTshs7cfiQSaRdGe1ClPL3SkfO9BOy+fWhQ/yskpN/rV5JsnqKH7iAWrwA56npI/0RWte3/XmhVIg7j8CN2k+PMveZTOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by MW4PR11MB7162.namprd11.prod.outlook.com
 (2603:10b6:303:212::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:12:09 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 05:12:08 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v2 3/6] drm/i915/display: Add HAS_DP_SYMBOL_TG()
Thread-Topic: [PATCH v2 3/6] drm/i915/display: Add HAS_DP_SYMBOL_TG()
Thread-Index: AQHdZphSLCvR/smaU02XvmAW1eHA+rcT+sfQ
Date: Thu, 29 Oct 2026 05:12:08 +0000
Message-ID: <DS4PPFE901A304FBB83308FDC4880F3BAC2E36E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261028-vlk-64036-dp-symbol-tg-v2-0-43849c325d32@intel.com>
 <20261028-vlk-64036-dp-symbol-tg-v2-3-43849c325d32@intel.com>
In-Reply-To: <20261028-vlk-64036-dp-symbol-tg-v2-3-43849c325d32@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|MW4PR11MB7162:EE_
x-ms-office365-filtering-correlation-id: f4b40d81-6cb1-4d74-37a3-08df357b2e70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|261021121427099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: BJLgjEPQ2B3NDv8J5wt9OSYiAcSgVyKRCW7zJDlc0hVtaU50ItoxffoN6KIzjGT2jpc0O0rAxTMiPyLXXLsQ5DxzybOxRReJUc+jZeaDLn96Vs7aEjWvfKcfJszpUVx8z3z7IXofnjtEZZ2yEMHsTG0ArpQumIQ4M/A0tIqvUeWDBj3dfeObTvOd8BkRdVOs6ktsKp7DqEACxTKWr4pr/8jxJ0c1nQ1+1mCVBhGKsjyDmBqCYbA0tOa/wQRXHqWHSuSh4HwVDsjt1YZ49VV2jszonGJkxIdASfLREn1oYyW184zcPy8u07glA/lqKp23gvrJU9wMx8hZ6J+/MHRBz7JQYHoh289P4JPsFxXH4g3iPaLx3RTX3u7uTVDbA13X1J6bfZxrTiv92enaZDapv+tQZ5btd5E1S0yWlYEuepxsa1de8WypxUpRZd0geaq237X1jjEEXict8seqbsrdVi0323g4pgWd8+M0L4F8jZjcT10/3ubwQ5d2XdlPybbAG0NCybJVMcA1hFRLzZda+EnE0o1zbL5LzyZs/Hm/noJfhki9zpdKLjEIVO+27y2rbjBfKJHMrIp+n+oBof6u9t4IQRnV4kPoRt7O8LV1ZLQhb0Spu36h/TdN3gC3O/9e5A5c0IPSiXeUENE+Y6LzyMmfcurZ5Y+0ELcb/Mmnh1ahA6ZCQzyZUpSQIuvic+WAbZ71smNX0mjF3b8eukLspKyOw8YnCmUikeSRjayF800=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHYzaUJKTytGS1lpckV5cGt0Vm1OYTBUcUMzVnZzUG9QWHZwU3dzU21DWkx6?=
 =?utf-8?B?OEl5WGtLSlE0R2cwWjUzRlRCU3J1dkwvM2I2SS9abFgxY21saE45YmQ1Wkxn?=
 =?utf-8?B?Rk96UmxmakEyZzZZM2piRDQ5M1htNkVxT1ZuanFlN2ExK25oZEhyWjVxamZ5?=
 =?utf-8?B?dHhiMk5hUzBIM1NOLzJuZ2o3d3JJbE82Y0tKblVOc1BCZjEyRjYvbVZwVm12?=
 =?utf-8?B?NjJ3Mk83THNsK1RlWk53NlJiY0xMSm5JVTh4VEFQKzJ4UkFTMmxSM0dQRTVu?=
 =?utf-8?B?Z04xOS9BbXJIRk5CcFhOM1ZLdERaVkVuME5TYk50U0NOYktJTlRpSFNsY2JQ?=
 =?utf-8?B?aC9IMHl1SFBFL2FvMTFQZDJ5MVBBeHo1bGlsNSs5T2syUzBLaW40RHpOREww?=
 =?utf-8?B?azdyaEN5Y2lRdVlzOFdzYk9WR1lpNUJXM3NFRHA3dXpOQW01SkxLS0o4Tis2?=
 =?utf-8?B?SmZ2Z1RyaUZUMjVXeXRKZ1VaMWRUUlZDc2xBZFV6RmVyeUpkMkZDTjFVRE81?=
 =?utf-8?B?ZEVMM0IwNVZydDlMSTVjTFMvOXEzWC9HOWtKTFNuRks4Lzd6WHVKVnFjdUtB?=
 =?utf-8?B?bjBhR3ZGaUxlbXBtZCtqQUNvVVVLZFU3d1c3M2ZSMGF3VWZ0Nzc2Q0luTWxZ?=
 =?utf-8?B?LzhPUmZrNmF4bnUraTVWR1MxMWZtRHZEdVdaN0dEZCt5aWR5d1RlaHgycTBP?=
 =?utf-8?B?M05rNE1idUk1akI2dFMxZmRFaVoxRHU5ZGp3ZEF5bDAveVIxZXFHWWhDVC8v?=
 =?utf-8?B?TVdWc3l6MThWWlhnQmdnTEhLTkhLMGhnUmIzajRuVnlpOVc4SUhzQ084cXJT?=
 =?utf-8?B?TjJrUjNreUNNT2Ura0VQZnZpc1RybGxCTUU3REZWRjJtZTRSeTJmU0VZQUY3?=
 =?utf-8?B?eE5MRnZtMWtmeHA0Ri9PUXhlblF6cXJyQUxKYXU4S2kwS3QvekxOcDdpNXhO?=
 =?utf-8?B?MnE2V2gwSnluRjJackVnajVweEFVbWZFemlqd3RwR28veXBHTEZMSWU2c0Rt?=
 =?utf-8?B?N3hGSytZU2tQTDk4ejg2QVp1WVU4SGhRRWh4REV0WSt4bWI2VHFhb0FyTlZH?=
 =?utf-8?B?TkRidXloV2J6akpjektVVnVMSnU3MFQ4bWJxQVpRREZTOWZRMW4rUnNmcGhk?=
 =?utf-8?B?SVdSRkZVMDIrUEVOMEh2YUFlQzQzSmtQTHY0TUxKUjhxK05VNWpkcWdvSklY?=
 =?utf-8?B?bjh3K3FHZUg4djV0Ym1uUE50UXZDZEdxaWNMRE1LblY2L1lJUWJZRmJtYmRo?=
 =?utf-8?B?RmxrN2YyUmlWc0MwQVlmQTI0WU4zRFY0ZWVmcDFjWjc1UStyT20yOXFRRzRX?=
 =?utf-8?B?dVJXNmZxQ0dnNXdlT3RBeWtzakJlNWhuVGg2ekh1ajEreU9YWGptMHd0SUNh?=
 =?utf-8?B?Nmp5Nk9Xdk41cGRUOUNxSndCdzlLMzEwb1pWeTJTajJobmhOa1BpSUtjK3M2?=
 =?utf-8?B?cEY3YmhyNklERVdpczNEUk5VdDFPQWtZRkRibnJ1SkJLUjVzcnArT2VxQ1Zl?=
 =?utf-8?B?TmJpdmU3eExRazBKTklsLzFMSlRKTUJuaXNJaklRZ3UvSDQ0TEFqY1ZBSEpa?=
 =?utf-8?B?YWZoNW9EbHgxR1VCOWFHYzBPcWxSWUxYSGNZTzJWUy9qM1JvQmNsU0tPUlRm?=
 =?utf-8?B?NU9WYks0dWVzYndzb1Z4cG9VNEpDd09qcTljZm9FNDlGN3BTR1pzWE40U3hX?=
 =?utf-8?B?WjN3c1E1TEk2bmZJM3hnYnZEOHV3Mnh6NTE0ckRudGtxMVRNdC9LdHpuUjRs?=
 =?utf-8?B?bm1zVURNVXRtSGk5UnErOEpPM3d0dXNhbEpZaklwRElrR0JLUEh6a29HSExZ?=
 =?utf-8?B?YnJZN1BRanBLRU9PUXIybEE5WlZZbkRTWFQzc0pLU21NOXd2Z0N4OGRnVS9I?=
 =?utf-8?B?N3lVVS9ta2FGQkNZZmVieE1zTjYwdUdseVZSOVZrclA5YUlvQ0hEaDNJdWhH?=
 =?utf-8?B?aUlDMnhFSXdwVTNaUHZDSUlBSndJTko0c1ErVDlwWndSVGNNdzR2b0JSSVo0?=
 =?utf-8?B?TTkzLy9abHRmMzBKTjFWQ3B5Ly95ZS92OTFqaU5JS0Q5UjY1YTYzTjJOekQz?=
 =?utf-8?B?TDMrdFAwTUJqVnNSN0p6ZHVxb3VWRnhMdWpjRXBIQThvcGZlWXBHU0xPQUtB?=
 =?utf-8?B?dVlNNUlpZEx4N2hEU29PYmZ1emNJWnZIRkVrd1dwTmo4ZFI4TnpxMEpteDBR?=
 =?utf-8?B?b0VMaVRFWENONFNpS3J0R2pTaHlqMk5Wa1Fob3FaYlU1RmZneFlGZGlGVlM5?=
 =?utf-8?B?MVYvTEdQYzNiUTI0TTdja3ZzQjJBcG4raFVmc0FzakZGR0pUaE1oWkRaZXQ5?=
 =?utf-8?B?QnNjN21mMFlQbkhkTTVUamZUQWRuQkF1dkNIcngyU05Gei90YnJKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xyS5i0rIZ/l7ZsSX7x6exCaI6W8W8XLQwQ2P65LkNhArp1RLHVTSdzDLaBK/WKtZvBqCllA1rgtbZm7mw9IBcj04Pa5wyI/YJNe/4VaR9nj/pFAZ0wUDr3CLfyxssDOatTUpVa3Q6sOaFL0dDPxjOVH/9m40Dg62xboBWWeOlrU41wsshZbnBTYiXNoaHook6cfJaFK7454KUN5OAGs1NPoFrnulymRW0tyTI4v4dKB7zFM1XmIBpQ+9XK2XMM2T6/hQtUw7W41MBDHIN08ErkqMBMLdY0WPuXHFX1vBL7b5oAg+FxgRg2+0I8f0htdgAN1qVBTSu67/DgiT2pQ1Dw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b40d81-6cb1-4d74-37a3-08df357b2e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 05:12:08.5300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fB3rT9Xzq45nIifZm3R+WQa4F0UAAZi8huYpcLjl9qL3y25soKcHU4hZ3PpXPND2ivXiBTOemFkn7HxHEPVknQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy82XSBkcm0vaTkxNS9kaXNwbGF5OiBBZGQgSEFTX0RQX1NZ
TUJPTF9URygpDQo+IA0KPiBBZGQgYSBtYWNybyBmb3IgdGhlIGRpc3BsYXkgdmVyc2lvbnMgd2l0
aCB0aGUgRFAgbGluayBsYXllciAoTEwpIHN5bWJvbCBiYXNlZA0KPiB0aW1pbmcgZ2VuZXJhdG9y
Lg0KPiANCj4gQnNwZWM6IDY4OTIyDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFy
dW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRw
YWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RldmljZS5oIHwgMSArDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGV2aWNlLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGV2aWNlLmgNCj4gaW5kZXgNCj4gNzEyMWU3Y2Q5
NTEyNGYzZGY4OGZhMzlmNDMwN2RiNGEyMDlmZWVhMS4uOWM0Y2FmZDE1YzE5YzM5YmMwNDAzYTA1
Yw0KPiAzYjJkYTU4YWRjZTFhZWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9kZXZpY2UuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGV2aWNlLmgNCj4gQEAgLTE2OSw2ICsxNjksNyBA
QCBzdHJ1Y3QgaW50ZWxfZGlzcGxheV9wbGF0Zm9ybXMgew0KPiAgI2RlZmluZSBIQVNfRE9VQkxF
X1dJREUoX19kaXNwbGF5KQkoRElTUExBWV9WRVIoX19kaXNwbGF5KSA8IDQpDQo+ICAjZGVmaW5l
IEhBU19EUDIwKF9fZGlzcGxheSkJCSgoX19kaXNwbGF5KS0+cGxhdGZvcm0uZGcyIHx8DQo+IERJ
U1BMQVlfVkVSKF9fZGlzcGxheSkgPj0gMTQpDQo+ICAjZGVmaW5lIEhBU19EUFQoX19kaXNwbGF5
KQkJKERJU1BMQVlfVkVSKF9fZGlzcGxheSkgPj0gMTMpDQo+ICsjZGVmaW5lIEhBU19EUF9TWU1C
T0xfVEcoX19kaXNwbGF5KQkoRElTUExBWV9WRVIoX19kaXNwbGF5KSA+PQ0KPiAzNSkNCj4gICNk
ZWZpbmUgSEFTX0RQX01TVChfX2Rpc3BsYXkpCQkoRElTUExBWV9JTkZPKF9fZGlzcGxheSktDQo+
ID5oYXNfZHBfbXN0KQ0KPiAgI2RlZmluZSBIQVNfRFNCKF9fZGlzcGxheSkJCShESVNQTEFZX0lO
Rk8oX19kaXNwbGF5KS0+aGFzX2RzYikNCj4gICNkZWZpbmUgSEFTX0RTQyhfX2Rpc3BsYXkpCQko
RElTUExBWV9SVU5USU1FX0lORk8oX19kaXNwbGF5KS0NCj4gPmhhc19kc2MpDQo+IA0KPiAtLQ0K
PiAyLjI1LjENCg0K
