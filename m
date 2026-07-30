Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43404C55167
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 20:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12CF10F08B;
	Thu, 30 Jul 2026 20:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPaLnDqG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6B410F08B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 20:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785444653; x=1816980653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Oindzma/OFl9W+ZtH0VyjaPFBY7lWJmPmm27L6txfmI=;
 b=BPaLnDqGSKnlY7OcC214z0BSYEPim6i69HxQSnTOEesBM3hCA1CwS8Xl
 eEb6/zCgPxfdN77We0ZQC6J0eLbaet/jRpAVIxxeZHtWt28fm/apzsiAP
 j8Bvxd4hKVMr6m5GZNmibhux1poBKfv4jAxjnW2TGR6jqpny21yVgjXly
 ckBt9H6OxCu1ZsLqMvCYQaZSJnQDZI6Woqi1vXraZbOwmG63r+wJYpkLg
 4ZS/Arreyd5uHyh0Pzy9iTtfgyU5CeQbjgYYipvAQaMb/scHwnVjKQeQI
 QSWIGECRLQ8BPqpDaIxgeY2hVayKP94K0Edf09NskmNcUHWtz/qqnyq/8 w==;
X-CSE-ConnectionGUID: WYB/GEm5TrekT1eKsPyncg==
X-CSE-MsgGUID: 9fwguDuGRSCkfhR7uu2aLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86089612"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="86089612"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 13:50:52 -0700
X-CSE-ConnectionGUID: tc1zz6UmQOScxUaIxx5ZBA==
X-CSE-MsgGUID: nF5/8kDzQhquRrr24z01SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="263887209"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 13:50:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 13:50:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 13:50:51 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.32)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 13:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZgrx1hPTIPbmF/vYB+2xVNGitgNH/c6V3qpTm+YI7rrcx7x4Dn/m+9uP9jzRBD/e3GOKpu/pMLBVBNjSAnvZLQJfxKjl1T6V+ZmCsixXAHy+SRHYIeoiEaIYRUjNgpaQiPPh4AWKs83q471baj5mKTNuaWnlO2OVabYIK5kmlm+y80X/xE9fUxzgrpEdUpfGQGLqVqv4UgRTu5X50aVyb/ogOU37E5V1zRdh7YGjKRWP7Rf1aCIKEYI2/+mVC1A6zfy91PbToJ55PLG7PlBAaknddK3brIrh/myMTq0i04TCF8PTsCW3Zd6H7sDqDSSRMssPtwZdtD/K2VEeU4Z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oindzma/OFl9W+ZtH0VyjaPFBY7lWJmPmm27L6txfmI=;
 b=kGB12UMFujAIUkntNWRJ12avWAOQCqVTEMfgpKHJpFWz7I40wWRPLfoflhwzCcAjhDqQ5APlD7wBU4JTSdWn49DG7dLVC2V4KGQtSa6yAnH76XEFUHHgpVL6QlU0sxCzzk3j/liixYIPyaNHNiBpgmudQphO5TZuw7FC+k7S8FAoCBSU0/3ma7Xbz26HvRj2OXKGMpVsDXHwXjmXdfj8k2zDAtlIREJJ1oD4nezAoPK+d3tkvT2huCUcYKbywsvEUNDzwWnXUhhJ8JmVX9GiGiKZLDN+2y/QBrSVH6FPCtnRX4EXUMIMlwP5KVnDwyM7Rjf/aE/CinQyMRqsouzJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 20:50:47 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 20:50:46 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3] drm/xe/pxp: add termination on resume
Thread-Topic: [PATCH v3] drm/xe/pxp: add termination on resume
Thread-Index: AQHdGJcTvG1UWh3mVEac5dIP21Ndg7aDqZ4AgAE/kYCAAa/QAA==
Date: Thu, 30 Jul 2026 20:50:46 +0000
Message-ID: <32c433d4fbb0076adff665f8ca94d6b1225fd0f6.camel@intel.com>
References: <20260720222757.3876338-2-daniele.ceraolospurio@intel.com>
 <022017a6c1e93847a36867b4fbec508da15711a5.camel@intel.com>
 <11b5ae5e-9dff-4cd8-afd7-0ee9779e0d58@intel.com>
In-Reply-To: <11b5ae5e-9dff-4cd8-afd7-0ee9779e0d58@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|MW4PR11MB6957:EE_
x-ms-office365-filtering-correlation-id: e8a27865-ac8b-45a9-8320-08deee7c3b25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: WbhOTGtV/lnQIdX7UmRPzbvHyaUmpM3mYvFwh5mrokcyF/dws+EMti8GKOXiHm6R8NJiuAvhOh+RgvWL/21vFz6tzXRFGwlwaymRDJd1HVqRVP0nl4luTpXZUMueLroEJ6av/3gYh1n6QKhkyIdGK015SKINTicLo9T+66z8EUOCcnKbu3GPGM28X3+B2IB33kWTW+5R940V5iNctL+qkzHiu6Iz4QEJ0YqVm8nFu245pTNZo5juNMFJ/OZ4A6WFKv4F959/7CPLzo0dWHL5St6Ym1i7RzCGyjh9DMapDdj5IdzrqsiHKqr8VPBSJXrr8IZEY8DuVmY4Z7FFwsntzZlaTqiG157LMQ3Qp3WBq9tjrl2njXjX3mT8JBccbmYUJ0KqqAyDhdXM5D0YM5qdX0H2ovXtPqqzx2q30pTPKIZppt/IZfmktADuGlndqxxOLg6Agu1Tuo2xI/VAGVRr0r6GR4sKMy5bSt228LASvHjCy3JLN6L4kr8/n1aj1lVBDeerD8+XakiShKupjX5pgUxkgYBQhYyelmy1JFYn3SGMxDKJg1N/63uJt1kGiQvsmxumKR3ZFyp0F1ammaEPsqN5IJeRA2rDZiMeZuv5hqGv2PHsIAkOwOBCdQY4zByq1eQIt8xs13LCRPcGbHz4SVo1Ehl9YGegdug1RmEijlpAsCquIGOkZRRzm8y2+sVnGcUoGFayvSjDRmao7UgOedCN+rjDbvuopaOUxWUUKgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3RyRFNtSk5MMFlxazB1ZExhdnM1cG1OMzZqSENKL2VLR0RQdGI4aXFPTC9U?=
 =?utf-8?B?L3l4blV3NU51WWhvL1A3MHFkRXJqNmZMb3dFNEp1aXdWeUVFOGpBcWdNNVh3?=
 =?utf-8?B?N0wyYmpYcFljTGl3bHdQdWpBZGxCYVVPTDVsclR3U1UyRjUzQnQ0RlZlTmN6?=
 =?utf-8?B?NnhGZDRyUktWN0s0NFlvTk9tb2xGZitielBOanZ6UitkbTdIek5aR1lxY1k5?=
 =?utf-8?B?RlBLWjRKQ3JRN2d4amlMN3dYTGlkdzhTNFVadTlrWDVMZUN0VUVNWS9FNWk3?=
 =?utf-8?B?ZkRSMmc3VnVNRTVkM2tVWkVZNW05R1BCWDhJZm9QbEtONzBPTzk3cDlxS0VD?=
 =?utf-8?B?b0FYSWhPTnRHeWxoVDJpTmlKREFmd2QyTkhmaTc0MUQ5eHVjUTljdlRIelJn?=
 =?utf-8?B?dXkxSjVCRzlLOElqSzlINjdMeWs2NngwTTRYelk2TnBldE9xRUNDcGg1eEg0?=
 =?utf-8?B?eHB5clZhdm9YeGFOV2VWYU5VVGhUVDljdC9vT2xxOGdmR2poNVY4UnJLaHJM?=
 =?utf-8?B?c0c3MVV1ZmZNVjRFc3d4S2M2NXRzYTlsbXlWS0xnZnFpclo3OHczUnE2N2p1?=
 =?utf-8?B?azBRT1NYR2pmWTExeUFoWDZQNEVMeHdjd3Mza2ErWDdoaE51cUpUUlMwc2ZE?=
 =?utf-8?B?blJZWENtSkM1bWVYMWJpRmt4QTdUeXNueHRHOVg4ZUZHWTBKTmI1dVFtWXYz?=
 =?utf-8?B?QlVzcmVGdlgwcm81Z0krYjYzRDh2VjJGY1ErdE1lQmV5MmRneXlVWFV4Y01L?=
 =?utf-8?B?ZUQ0OWhhV0d6MWlOZWp3dU9SMDlLUzVmRjBpcWNrcXZsS3ZpOHpNc1NTMVhB?=
 =?utf-8?B?WVBPbGxYSURscXVZZDl4SkVyRXlaNzNCVXRwRkpyNXFZSm9XdGIxZ04ybUM3?=
 =?utf-8?B?S0kwQVJta3hSclVSeGs0bnB0TFdZRGNPWEoyN2MwbkF2VTdhcWJzZnJ6bHAv?=
 =?utf-8?B?WkNFRmNKNmdSZWdVM3V1K0dnbU1FTi83OVJIOVVLWHVmR0hUWlNBdDVWa01I?=
 =?utf-8?B?Zk1JelNOWnZURFhZa2UweHRaWkhMSStPN280aWQ4RmE3QWpEL0t0TVJtOGxh?=
 =?utf-8?B?NVdQMmhHUThYb09wV0I3WWhIVGJoVXRZOFd6bkhDNGJoNzUwcUFyVWYrOVMz?=
 =?utf-8?B?bm80UmIvVTliUzZJdWx0cFhIY1AyU2M2WFBKQlROcmRBeDVZVUpHWjdWN0ZE?=
 =?utf-8?B?RExvU05tYlpkaWVlVStueDBFcE1idkF5M2pjSGlKaVRZVDZXT0pvR0tadGhK?=
 =?utf-8?B?TFNPMk9hTzhXWnNRV3ZBb25QaGJCM2ZNb29kVkdXd1VPOTcrRE9XOUE4Rldy?=
 =?utf-8?B?ZEo2L01JRDcyNTQ3d0lBNWdYbEpwTVkwWmxmRkVRd1F5T1llVnMxOWovZWRH?=
 =?utf-8?B?QzFEdFE2R3MrWUxjMVZ3SzRYOEVWV1FwcnVPTmhYd2poeXpYMTBMOEw0ZG96?=
 =?utf-8?B?Y3VxK2dINDFPaGJyWmhtTi85OEVPdjRwZzRBUlNBVkZlZVJkN1lMKzdPaTF1?=
 =?utf-8?B?SVdPWFdNbGVLN2k0ZFFyeEhBTXZISm4vWlJiWFNQV0FmTFdIVzB5ZFhyMUcx?=
 =?utf-8?B?cy9Bdk9kK21PdTF3ZlJmSHV3aFJ0SEs3M1Y0NkpaN1o2UHhHbGtPTUdVbE1K?=
 =?utf-8?B?S2NEK3R2ZUt3Ym1wQ2puQ0FBcVFrSkN3Q1BZUzF4MUZFL0tpWHNmWFZkRWhl?=
 =?utf-8?B?aFJjcm5MVk4wMXllZ1M2aXVVSDR4U3R5VmZlMkpDWVdhR3VHSVEvUnM2S3NK?=
 =?utf-8?B?c25ZRE91REVEWlBiRDJpY1J0L21kMWdrQWx2YmhMZ1RMWGVVWDR5SmFwMStQ?=
 =?utf-8?B?Y0xhd2grRzNEQmY2Y1REY0RRR21IelNkNGZqK1dXTkp3UWNjY01YTFhKYlk1?=
 =?utf-8?B?SVM5T2pubFhqNmpjVWdmcFNldG02WThCQ0NxRmM1WmZGc2VvendZOG9mQUVM?=
 =?utf-8?B?d1MvMUhmcUtaQUFpdUk5SFNxcE9tNGtvVi8zbEt1ays4YUVUT3RwTm1DZDBi?=
 =?utf-8?B?dU5zZi9GRVpuZ1BrNGJrQlBMN2xKUUNqRTdKTnBwdFNBellnTTJ1cGplTEE1?=
 =?utf-8?B?YnFsTnB3QmxCdzlkQlVzZUhna0Rqd2RMbVZjSFg1WjA5WExwYyt6R1dicHJI?=
 =?utf-8?B?UktCWVdpNi9MSHFEcDNBZWNOK3paKzlWbGxpNWxiZ2ZtWjR4QmRhVGY2Ukdh?=
 =?utf-8?B?eXBBUnNJbk1BWHRhRldGWktYd09hNXdvZTduSmJMNzUySEVWQWpaREVzOThD?=
 =?utf-8?B?Ti9LWEw0SXpzOWhScENTYVN6SXBFYmwvWUkyT2krVEtOVVRkTmVtT1JQbUNP?=
 =?utf-8?B?VUlxMGIzNWJKR0tRL0pDM2VHb3FWTmM0blIyMUN4YlZiNWIxUFRzN252Yy9u?=
 =?utf-8?Q?TpgLzvxMgq8TkwVMOWZ5gpHd0F1ODCdGn2IM6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE6EB13B7D72F0458224A3E5E743097D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: IGRPSd4OSWvg5FDry0kuL0sWomXe3HSS1uJXmqKOLD0DAI561peZDEsW1gdbofR0sDBJeQPYWwptYe4ct6IxpBMQaH2Snrad59z5nOGvOU4JbERhCCCAOedjYmW6T/qhUOKP3ZWAUbkwg2BZy3ccJPkFXGjEw2ea34aiBcUWYO/CM3sBqLaxv3/wdnLtldDjAo+dLBcYGUMYvaI1BSIZyQ5uv5IIsBd39y7PzNKBPTt6D1k7kBxZJOip8xsM1X5OcyiI3x3PO+AuLIILongNIzqqWVYkeIJwSEN7Y57wUMXqjNN+6gaQPIq8Tj1rVkbOOwIbvJEN8Czlgw8H0p19HQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a27865-ac8b-45a9-8320-08deee7c3b25
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 20:50:46.8439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VoA+0kY06uUOgGvHqUpfqPY8nDylxeMB4uRU2ieZZWC0OU0CSY9HtZwzEJdXyDETRNfYJ7i8OTZtd0SkVPECCa0dTxq2+NwtymrsiyoD3Nf23u6UVJjGYI7dPKpGch/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

T24gV2VkLCAyMDI2LTA3LTI5IGF0IDEyOjA1IC0wNzAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiANCj4gDQo+IE9uIDcvMjgvMjAyNiA1OjAxIFBNLCBUZXJlcyBBbGV4aXMsIEFs
YW4gUHJldmluIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAyNi0wNy0yMCBhdCAxNToyNyAtMDcwMCwg
RGFuaWVsZSBDZXJhb2xvIFNwdXJpbyB3cm90ZToNCj4gPiA+IFN1c3BlbmQvcmVzdW1lIGNhdXNl
cyB0aGUgUFhQIGtleXMgdG8gYmVjb21lIGludmFsaWQsIGJ1dCBkb2Vzbid0DQo+ID4gPiBhY3R1
YWxseSBraWxsIHRoZSBzZXNzaW9uLiBUaGUgZHJpdmVyIGFsc28gZG9lc24ndCBleHBsaWNpdGx5
IGtpbGwgYW5kDQo+ID4gPiByZS1zdGFydCB0aGUgc2Vzc2lvbiB1bnRpbCBhIG5ldyBQWFAgcmVx
dWVzdCBjb21lcyBpbiwgd2hpY2ggbWVhbnMgdGhhdA0KPiA+ID4gdGhlICJ6b21iaWUiIHNlc3Np
b24gY2FuIHBvdGVudGlhbGx5IHN0aWNrIGFyb3VuZCBpZiB0aGVyZSBhcmUgbm8gbmV3DQo+ID4g
PiByZXF1ZXN0cyBmcm9tIHVzZXJzcGFjZS4gV2hpbGUgdGhpcyBpcyBub3QgYW4gaXNzdWUgZm9y
IFBYUCwgSERDUCBoYXMgYQ0KPiA+ID4gbmV3IGJlaGF2aW9yIHN0YXJ0aW5nIG9uIFBUTCB3aGVy
ZSBhIGNvbW11bmljYXRpb24gaXMgc2VudCB0byBHU0MgaWYgYQ0KPiA+ID4gc2Vzc2lvbiBpcyBh
Y3RpdmUgYXQgc3VzcGVuZCB0aW1lIChldmVuIGlmIGl0IGRvZXNuJ3QgaGF2ZSBhIHZhbGlkIGtl
eSksDQo+ID4gPiB3aGljaCBjYW4gbGVhZCB0byBkZWxheXMgaW4gdGhlIHN1c3BlbmQgZmxvdyBp
ZiB3ZSBzdXNwZW5kIHdoaWxlIHRoZQ0KPiA+ID4gem9tYmllIHNlc3Npb24gaXMgc3RpbGwgYWN0
aXZlLg0KPiA+ID4gVG8gYXZvaWQgdGhpcywgd2UgY2FuIHRyaWdnZXIgYSB0ZXJtaW5hdGlvbiBv
biByZXN1bWUgYW5kIGtpbGwgdGhlDQo+ID4gPiB6b21iaWUgc2Vzc2lvbiBpbW1lZGlhdGVseSwg
aW5zdGVhZCBvZiBkZWxheWluZyB0aGUgdGVybWluYXRpb24gdG8gdGhlDQo+ID4gPiANCj4gPiBb
c25pcF0NCj4gPiA+IA0KW3NuaXBdDQo+ID4gPiAtc3RhdGljIHZvaWQgcHhwX3Rlcm1pbmF0ZShz
dHJ1Y3QgeGVfcHhwICpweHApDQo+ID4gPiArc3RhdGljIGJvb2wgcHhwX3ByZXBfZm9yX3Rlcm1p
bmF0aW9uKHN0cnVjdCB4ZV9weHAgKnB4cCkNCj4gPiA+IMKgwqB7DQo+ID4gPiAtIGludCByZXQg
PSAwOw0KPiA+ID4gLSBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHB4cC0+eGU7DQo+ID4gPiAtDQo+
ID4gPiAtIGlmICghd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZweHAtPmFjdGl2YXRpb24s
DQo+ID4gPiAtIG1zZWNzX3RvX2ppZmZpZXMoUFhQX0FDVElWQVRJT05fVElNRU9VVF9NUykpKQ0K
PiA+ID4gLSBkcm1fZXJyKCZ4ZS0+ZHJtLCAiZmFpbGVkIHRvIHdhaXQgZm9yIFBYUCBzdGFydCBi
ZWZvcmUgdGVybWluYXRpb25cbiIpOw0KPiA+ID4gLQ0KPiA+ID4gLSBtdXRleF9sb2NrKCZweHAt
Pm11dGV4KTsNCj4gPiA+ICsgbG9ja2RlcF9hc3NlcnRfaGVsZCgmcHhwLT5tdXRleCk7DQo+ID4g
PiDCoCANCj4gPiA+IMKgwqAgaWYgKHB4cC0+c3RhdHVzID09IFhFX1BYUF9BQ1RJVkUpDQo+ID4g
PiDCoMKgIHB4cC0+a2V5X2luc3RhbmNlKys7DQo+ID4gPiBAQCAtMTkyLDEwICsxODcsOCBAQCBz
dGF0aWMgdm9pZCBweHBfdGVybWluYXRlKHN0cnVjdCB4ZV9weHAgKnB4cCkNCj4gPiA+IMKgwqAg
KiB3ZSdsbCBtYXJrIHRoZSBzdGF0dXMgYXMgbmVlZGluZyB0ZXJtaW5hdGlvbiBvbiByZXN1bWUs
IHNvIG5vIG5lZWQgdG8NCj4gPiA+IMKgwqAgKiBlbWl0IGEgdGVybWluYXRpb24gbm93Lg0KPiA+
ID4gwqDCoCAqLw0KPiA+ID4gLSBpZiAocHhwLT5zdGF0dXMgPT0gWEVfUFhQX1NVU1BFTkRFRCkg
ew0KPiA+ID4gLSBtdXRleF91bmxvY2soJnB4cC0+bXV0ZXgpOw0KPiA+ID4gLSByZXR1cm47DQo+
ID4gPiAtIH0NCj4gPiA+ICsgaWYgKHB4cC0+c3RhdHVzID09IFhFX1BYUF9TVVNQRU5ERUQpDQo+
ID4gPiArIHJldHVybiBmYWxzZTsNCj4gPiBhbGFuOiBpbiB4ZV9weHBfcG1fcmVzdW1lLCB3ZSBh
c3NlcnQgInB4cC0+c3RhdHVzID09IFhFX1BYUF9TVVNQRU5ERUQiIGJlZm9yZSBjYWxsaW5nDQo+
ID4gcHJlcF9mb3JfdGVybWluYXRpb24uLi4gdGhpcyBhc3NlcnRpb24gd2lsbCBtb3N0bHkgYmUg
dHJ1ZSAoaS5lLiB3ZSBkaWQgc3VjY2Vzc2Z1bGx5DQo+IA0KPiBJIHRoZW4gYWxzbyBjaGFuZ2Ug
dGhlIHN0YXRlIHRvIFhFX1BYUF9ORUVEU19URVJNSU5BVElPTiBiZWZvcmUgY2FsbGluZyANCj4g
cHJlcF9mb3JfdGVybWluYXRpb24sIHNvIGZvciB0aGUgcmVzdW1lIGNhc2UgdGhhdCBpZiBjb25k
aXRpb24gaXMgYWx3YXlzIA0KPiBmYWxzZS4NCj4gDQo+ID4gZ28gaW50byBzdXNwZW5kIGJlZm9y
ZSBleGVjdXRpbmcgdGhlIHJlc3VtZSBjb2RlKS4gSW4gdGhhdCBjYXNlLCBhYm92ZSBjaGVjayB3
aWxsIGFsd2F5cw0KPiA+IHJldHVybiBmYWxzZSAoaS5lLiB0aGUgd29ya2VyIHdpbGwgbm90IGdl
dCBmaXJlZCkuIGkgYW0gb25seSBndWVzc2luZywgYnV0IHBlcmhhcHMNCj4gPiBhYm92ZSBjaGVj
ayAoZnJvbSBvcmlnaW5hbCBweHBfdGVybWluYXRlKSB3YXMgbWVhbnQgdG8gZGVhbCB3aXRoIHRo
ZSBjYXNlIG9mIGFuIGluY29taW5nDQo+ID4gdGVybWluYXRpb24gSVJRIHdoaWxlIHdlIGFyZSBp
biB0aGUgbWlkc3Qgb2Ygc3VzcGVuZGluZz8gKGkuZS4gd2UganVzdCBkZWZlciB0aGUgdGVybWlu
YXRpb24NCj4gPiBjb2RlKS4gQnV0IGZvciB0ZXJtaW5hdGUtcHJlcCwgaSBndWVzcyB3ZSBzaG91
bGQgbm90IGNoZWNrIHRoaXM/IHdvdWxkIGp1c3QgcmVtb3ZpbmcgdGhpcyB3b3JrDQo+ID4gZmlu
ZSBzaW5jZSB0aGlzIHBhdGNoIGFkZHMgIlBYUF9URVJNSU5BVElPTl9SRVFVRVNUX09OX1JFU1VN
RSIgaW50byBweHAtPmV2ZW50cy5wZW5kaW5nDQo+ID4gYW5kIHlvdSBoYW5kbGUgdGhpcyBpbiB0
aGUgZXZlbnQtd29ya2VyIG5vdyAoaS5lLiBpZiBpdCBpcyBhIEhXIElSUSwgdSBkcm9wIGl0IGlm
IHdlDQo+ID4ganVzdCBzdGFydGVkIHN1c3BlbmRpbmcgYW5kIHByb2NlZWQgd2l0aCB0aGUgbmV3
IHN1c3BlbmQtcHJlcC0+cmVzdW1lLWFjdHVhbCB0ZXJtaW5hdGlvbi4NCj4gDQo+IEkgY291bGQg
c3BsaXQgdGhlIGNoZWNrIG91dCBmcm9tIHRoZSBwcmVwX2Zvcl90ZXJtaW5hdGlvbiBhbmQgb25s
eSBoYXZlIA0KPiBpbiB0aGUgIWh3X29ubHkgcGF0aCBpbiB0aGUgdGVybWluYXRpb24gd29ya2Vy
LCBidXQgSSBsaWtlZCB0aGUgaWRlYSBvZiANCj4gaGF2aW5nIGFsbCB0aGUgY2hlY2tzIGluIHRo
ZSBzYW1lIHBsYWNlLCBldmVuIGlmIG9uZSBvZiB0aGVtIGlzIA0KPiBtZWFuaW5nbGVzcyBmb3Ig
dGhlIHJlc3VtZSBjYXNlLg0KPiANCj4gRGFuaWVsZQ0KYWxhbjogbXkgYmFkIC0gbm90IHN1cmUg
aG93IHRoZSBoZWNrIGkgbWlzc2VkIHRoYXQ6DQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFs
YW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+IA0KPiA+IFtzbmlwXQ0KPiA+IA0K
PiA+IA0KPiANCg0K
