Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377F8C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 23:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E6C10E073;
	Wed,  2 Sep 2026 23:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7KLI7mr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226A510E073
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 23:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788392277; x=1819928277;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1CtnlC1d939z1lHHWjsL7LG20XwKIL/RLJVGVvo+TO8=;
 b=e7KLI7mrcNo5VLxGrbNKFf28FM0HhWwcDcBf520JodqiGXRJ1uZJGW+Z
 XU5c1v0x3WmPQyaK8ipE5yRvWmYY4fbLxigjjScUQX9/wEh14rGzD8iLB
 Fs7WxytOvFXLo85i7MXlIw2V0GJcip3eK+kZKVgh9ePbQXCtLG3ubkT2I
 2y9QwQaeIve7oBbQWgJApmxDcRFRUSO0TT+19etMiYZpEGxh0FDS8kW2A
 4Y0+xUCm9QMTJbXjZC1D7IC1iKHe8ru7HyQ2d/uvxqMTxz1rkyMZprRA2
 4E3Ve9PSq1CCGUbTUFrUztRuP0OOYX04EGZcg3SqyvKSIx+3X5TqrcKhz Q==;
X-CSE-ConnectionGUID: 0+fklY/ySkWNPh/F0iW3Rg==
X-CSE-MsgGUID: k7YoGQFBSP2JHMtfc46drA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88738805"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88738805"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 16:37:57 -0700
X-CSE-ConnectionGUID: haQU1PSMQPKtQGMIzJVrDQ==
X-CSE-MsgGUID: hjL0eAbxRNeCrjqQgiMnug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263384854"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 16:37:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:37:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 16:37:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 16:37:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXyvGQOSCAnaw/fWVdPyTdtDrHSsqy0EIoACkkgjE1q/lXC+G4uMEwu9O6xFfVSlmUvW0rLps4qOMxo4xkpCJdt2jxG/EbPjaZRRZdFhprLJJnyPJ4P8ZBEXoBXXTRZXPYLkyeu0qlvXijNcYFiAefhFbDsxLKDJxzlnp99+jrcpTVIov5HxBtcEgyoDu3Y12IWdIACWsifH4jKTca3weksmrQ06oEQfcFcY6X+o0b5dA3L+qzPZAJaAHKgKJtq+yUCmrV0y+a6LjfYzzS45HDJP85uuL5nQjJS9E3d7JiaSfqqfnHTsDwml3UDYOJyhxOH9XoLO05J5mnw728dmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CtnlC1d939z1lHHWjsL7LG20XwKIL/RLJVGVvo+TO8=;
 b=usBY4CuL1hrThysBjZXkuyOeYMgxBz775Hgo6U3PVujpUxXjbCKRtgWI78f5t8OklGTh7dA5vz16wfcwwzidVxXX0Zie6cObf4EnZ8fG3fsd8P+cPTCbhwsP7kP0bE14On1yZNtFDHSeNZdj9mzBwJfclHuRkiv9KV3UA+uYjr1WJ+/+WWqj7LTBYerQc9UhedUkXs8OjOGfsltnqj9nmKw1+MaSDwcuZjT2j/b3W+cyoRms84RPSQr6SMNjqs4W8BD+eUEOnU6CQrvwS4Kn0Hmf7IXm4to1wAav1oT6eg9T+JdnAPODlUa2QJlcLCikmunEcpRpEClb62GxeuUNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by DM4PR11MB6119.namprd11.prod.outlook.com (2603:10b6:8:b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 23:37:53 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 23:37:53 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v8 0/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Thread-Topic: [PATCH v8 0/2] drm/xe/guc: Compress GuC log and CTB dump with
 zstd
Thread-Index: AQHdOyye1pr7q8Vc9U6AmYSyxyhNmra78csA
Date: Wed, 2 Sep 2026 23:37:53 +0000
Message-ID: <4c60954550bb53cfcc427b51c09d7746f55b48e6.camel@intel.com>
References: <20260731155411.496975-1-zhanjun.dong@intel.com>
 <20260902224417.879960-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260902224417.879960-4-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|DM4PR11MB6119:EE_
x-ms-office365-filtering-correlation-id: 366606b1-07db-4fcb-3ad4-08df094b3551
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|38070700021|11063799006|6133799003|10067099003|4143699003|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: oEakpJHW3GNwoABUgKEAuvlIQ5bEUhw49w8jKbVNHVbNBa6vCr5vqYgThCqT1gECcxycKxpqUpWjkLrl25k5ducSXm5SSM4qrGCQWaNT0UyIpn9VF3whYMfEqpTLu+6j1hFnGSv9prJNnFI3NT9jAngUFIOY1F15Qtobq3vBWCnbSX2l8ghHHvlCHEL9Jfdmt8+D1I8NupLtlk7q6s2BEmulCvccCnXssEDLjTqiXCuYn9XSvDsVOEqDdHC3bhFvn5KT9KoSJZBQW+yZAVYw/lPNECHFGVIVv94HE5ucfdqe0WOeg5pADeknh2hVlxhd1/vszol6VdbnWpIytu6d1eB6kyYWlCbK7Y44WdFB9QWrFXazRXHvWNJ4nYA5o1CUhZYWsR7jsxS3AY1ssYEJ1rAQj336iESJRQbNr467HZrp3aTAPr+LNxG4fUI/FqSWPhpzU60iVOsZt9UO6Z/lO70XL8nfKmYXKCEXCzb0kuKMqRXUn87fpDao01PTpAb44L/A/CEAohmbVp+RZwkJURbxHf/EvFWivXxRFYgXRfKD9VsTNDL0/G9vKLKGGKVQKXdfm/m0l1mn5EghXPTRYsyJwcOzqamHUmS3bejZBtxN6d875frqU6/dIu+BiQiJxX8qlYh6NeMNZmXpRzMeidiJwX3y5rcdmWFNs1nuxe6QsAiE+WiaCfI/L4y06PQQtcGLaQ5lnPKGoG3y7l3AQh3t7SqCxSkVL3IsYNx6fH0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(38070700021)(11063799006)(6133799003)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlJMUUFKWE1XYko4ZG52MXFZeG9GV1dDdkhhTFZob3pxcWlLU3pVM25CaCtS?=
 =?utf-8?B?d3ZLeWNjU0MxVXBHbFA3Wkh6V1pHakxxNjVYSHBBZkJVUE5TeXZGcm1VZVZx?=
 =?utf-8?B?RmVqNmhOS3ZseFhVWEJvaVQ2dlNYM2JZQVdvMjBDcXJ0OHVtUGgvZ3VvY0Ir?=
 =?utf-8?B?bC8xdHRwSytBNlFIQXBXN2Rkc3ozVHpxK1oyRUZQYVVHMFlvejZEUW9CN0JU?=
 =?utf-8?B?VTJOOTFmVEFBOFRrblVsYWlMMzBsYXpCeXhuZXlQRll2MnBwV1MxeTVPTFpY?=
 =?utf-8?B?T3ZtZlhTOWJ0OWpSaHdVV2czeHFDZ2VzOHc1NXJDTjVpRWlXNEE5R1VVcWY4?=
 =?utf-8?B?WWl1Ujh3SWdNVUx5QUFlTUVSN2wybmZmdlQ0bEEwZHVoYnNSTW9YbWJSNHRk?=
 =?utf-8?B?TDVMZ1FzTFNMaTVMaS9WVGY2RTFTNlZiMXgxZVV0ZGRzbUcvZkQvV2hMNCs5?=
 =?utf-8?B?bk9yTElaNW40VjJZVkNENEd5cFo3U1VZWDh5bW5DeE53Y3pXek5hT2g1Zk5G?=
 =?utf-8?B?cEJLQVhvOEV0V1I2REpKUFNFYjRvcEl3YUNWeUpDby9GY0Z3c29VUWhQY0pG?=
 =?utf-8?B?OTY3NWdnbzZXOW1OcklDd3NBVWQwcFRKVHRDWVUwZWxnVUwxNHYxb3ZtZno5?=
 =?utf-8?B?YnlpY01KU0xWRUY3eTlNL0pFRGtST3ZTTFd0cytseVpBdjFReldOK2UvQ2x0?=
 =?utf-8?B?azd4QjFoTlRreXBkUThuZ2ViNE5LeHY4d0dESGZyQ09BYXd1QThVT3ZkV04r?=
 =?utf-8?B?WE9qYWVGMWhzWSt4elM3ejFPU0ZSekY5dk5QTHRWUUF0aGRMZmV2U1BUZmlT?=
 =?utf-8?B?RlIyc3hVQkZycXpsU1RKcXZleXRkd2VGTE8yNVRqUUsvdlRnR0htSWFYS0VZ?=
 =?utf-8?B?bEJxU0ZSRWhNbExoMDB6Q3lXL3pLakFYYkMrUXZsSU9TcitlOWJoaGFjVHZZ?=
 =?utf-8?B?ODdrakRBQjVZb25mTkhIWDVlTFRBZkxzSW51TTlJZUNsVDFOTjNqY1d0bFZM?=
 =?utf-8?B?TFcyS3lVLzI3RXR4R2NrbjBxQjBBb0tMNE9TcGRNTDY1a2RVejFOdXVhRzdE?=
 =?utf-8?B?RkRYcWhOdEllZVBMTkN6WUYvb2pocUJuOVhhdzBOcVN4bzVNNERDOTFNRlpz?=
 =?utf-8?B?d0lvK256eWE5VlBTM2ZCbEpzUUdxR3RJUXlGK0JjdXhaam0veGl2SjErQ3Qx?=
 =?utf-8?B?RGc4SDVtYmFhcm5iQ2tlOTR1ZFFnM2lWR2lhOVRPZjJiVUJWejVqTHlxdDN0?=
 =?utf-8?B?WkVxcmQzWFJ3MlBvTjBZR1BDcnNRK3NkYWVhRTloUzJ2NGhCWFo4QmdzZFVm?=
 =?utf-8?B?UWpsRmxhOEFJWlZCbG9SMDBLMG5SVFkxdlh5SWZJNzdOcEYzMjBsTjROVk9W?=
 =?utf-8?B?eWxycGpvUkJ5dXl2MHRkRXZzL2NMcU94OVJIOG0rTkQ0ektwK1ZMUTFnVzRR?=
 =?utf-8?B?MjdxT1JWcUwvR1FHRWdPVGlZNVp1SWtOTmlQOGREaTdQVFRHdUdqM2Vmak5J?=
 =?utf-8?B?anZqYytBWGw4ODV4d0pOak02TGZ1SjNmTFE0aDE3SUpqcUtFZVArT2JtVytD?=
 =?utf-8?B?RG1jcC8weHQvbm4zTGk1djNrM3hMd0lkbVhwTlVtdXZkOFNuQ0pKQzZHQnM4?=
 =?utf-8?B?Z0NOYzBvNFV4dm9JZTZ1NGJoNGtBVDZVSkRUWkVaT3BuNFNMdEs5cStpWEJY?=
 =?utf-8?B?SlRuSEhxOVNacnUrdlJCSDBGYXlXaFBPS1d1N3pzQThQRDVTQTdnU2JTaDk2?=
 =?utf-8?B?RXNycUNsRkpkRFR6ckRwWVZNcDBlaDlOb0QzL280TDRSQVdQZ0VaZXhBd0J2?=
 =?utf-8?B?YVBjdTVtUUlkenU4M3R0MVppcVh2d0svRFppT2hZZ05pTCtObmxDSkE2SG83?=
 =?utf-8?B?S0tIWFFNUFFJbklHNDRSZE1TTkdPcWVhdTRkNnJyM1ZLZGNJS0FjbHAvMTBM?=
 =?utf-8?B?L0xPNTg0cTBYQmhEa09ROG5qaXI3S3dBTDNKamo4anMzUW13NjdNUDFoYUlw?=
 =?utf-8?B?VExZZ2pCTE9GaGpFbTZvQ2xXNk9sdzBIM3NXTVFqSUlaQ09jN3BrRm1hNnR5?=
 =?utf-8?B?VVQrTEN1QW82OVdjK2tWUitsMnRSWUwxaU1RdGd5Y0RsY2pTeTlHVXJwMXA1?=
 =?utf-8?B?a0x0cEMvK3E3RFh6TDV0ZFZtY0xSWXNvaWkycjFsOFhuSFpSSmwweVNvbEJE?=
 =?utf-8?B?N2RnNFNIbkVNekJXRU5iY2lZL2hvUUpueHZ1aGM0TWNFNENMRXFvdGxieTM0?=
 =?utf-8?B?eXhDKzNVc0JucTBWM2dSNFUwTU1HUG5yK1hIcjJLRUxQUWxrVXFDK2twS0xI?=
 =?utf-8?B?bW1yYW56dE8vbldZYzN6N0FSTjh2VmxUSTR3bHFNalpNc3Q1YTlJVUZsc050?=
 =?utf-8?Q?Ao/ZbCOQ2IBK8LXcT3PyioAQFi/2K3vqDgcbp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AFAACF6C08EEF4B8812EA1F720458F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: v26dqCFalRCb8gRKQ/G2ZAhlidsmfwBWa+/aYsfh1rcWLnIA6usNnoZqjI9w+6x3fB1L8Pe1rFzPg66U/ZqHcTNtd4tBYGM503BTZSbiiVE0IiCenMG7jWExzwSkogueEEy9jj6Vx5q6L05UD3rJYNuP3FsIBkF7tPBqJiv4SF+XiIgdww9SmtUhJMJLm1eJFePcqU5NvPl48K468kGAQDy386Obuv43ED/a5RkG9HNHl8y9PXS8+wwSwbCAMwkyFmp/z+b0rr5kljzdvGMCSDDs9YSYJXuWQ+0ajnkxaBSL77WHnxYsgZ5gk+Vyd3oV2FH+mPLZ2PO5eRNiigPPkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366606b1-07db-4fcb-3ad4-08df094b3551
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 23:37:53.1535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TqScA5fdO4f6CL032Q7uyYym78vs9cBnHvOBcD+Lt3xmDLWkwRL6GKwIoajiU7U7UD+iCmSErFSJJDpeWFUh3rT7RhXmLii+5v1l4RVgViRDejySYkvhsOy5B/ADxeee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6119
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

UGxlYXNlIGlnbm9yZSB0aGlzIHNlcmllcy4gSSB3aWxsIHJlc2VuZCB3aXRob3V0IGluLXJlcGx5
LXRvIHdoaWNoIGhhcyBjYXVzZWQgaXNzdWVzIG9uIHBhdGNod29ya3MgcGlja3VwLg0KQXBvbG9n
aWVzIGZvciB0aGUgdHJvdWJsZS4NCi4uLmFsYW4NCg0KT24gV2VkLCAyMDI2LTA5LTAyIGF0IDE1
OjQ0IC0wNzAwLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gR3VDIHNuYXBzaG90IG91dHB1dCBpcyBj
dXJyZW50bHkgZXhwZW5zaXZlIGluIGJvdGggc2l6ZSBhbmQgbGF0ZW5jeTogbGFyZ2UNCj4gbG9n
IGJ1ZmZlcnMgYXJlIGVtaXR0ZWQgYXMgcmF3IGFzY2lpODUsIGFuZCB0aGUgc3Vycm91bmRpbmcg
ZHVtcCB0ZXh0DQo+IGluY2x1ZGVzIGEgYml0IG9mIGF2b2lkYWJsZSBub2lzZS4gVGhpcyBzZXJp
ZXMgbWFrZXMgeGUgc25hcHNob3QgZHVtcHMgbW9yZQ0KPiBjb21wYWN0IGFuZCBlYXNpZXIgdG8g
aGFuZGxlIGJ5IGNvbXByZXNzaW5nIHRoZSBsYXJnZSBiaW5hcnkgcGF5bG9hZHMsDQo+IHRpZ2h0
ZW5pbmcgdGhlIHRleHR1YWwgb3V0cHV0Lg0KPiANCj4gU2VsZWN0IFpTVERfQ09NUFJFU1MgaW4g
RFJNX1hFIHNvIHRoZSB4ZSBtb2R1bGUgcHVsbHMgaW4gdGhlIHpzdGQNCj4gY29tcHJlc3NvciB3
aGVuIGJ1aWx0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRv
bmdAaW50ZWwuY29tPg0KPiANCj4gDQpbc25pcF0NCg0K
