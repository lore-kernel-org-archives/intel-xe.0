Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2360C5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 10:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8D510EAA3;
	Tue, 18 Aug 2026 10:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVuvpfou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AF610EAA3;
 Tue, 18 Aug 2026 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787047553; x=1818583553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KcPNJ/nIpuh3SrQJUGtLNiufRewNpcwwbplB4I56zAY=;
 b=JVuvpfoulQXS7U4TprbgxWbQDwTld5oIRQVBALo+IxLtgu/d7boFgSEV
 uxsBBV8lJ/GsQT4tdRjOBtc3xsUzfXK8EEvY30JYLxDY4fqjj0BzsHfte
 mKcpSlGRvJ1fLMzzSzZmSKoq/op81y+7Z1fuNJ9ktbvvyFGwP5zTbi1ln
 1D0Lh40RViJ7oZgInnt6ysrQq7vE0k90q51j7dLMiLg1lOoI34+tS4U3/
 aRgcKvd9sszHM5DlLz9AiCmxVKJmhPUjzTLXUbkVtKnge+Xt8HGxfxKsc
 1z5Lv9o78nnClmvTk24pnYzyn5gdKxtSZofRR+RZWR3+l7NqKjLAOnjYY g==;
X-CSE-ConnectionGUID: V/bdFTwCRBOUC2cKEYDgfA==
X-CSE-MsgGUID: toye0XahRSajcumrVBDSnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87410886"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87410886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:05:52 -0700
X-CSE-ConnectionGUID: E6VbdsduS4GOUdNX3F9K9Q==
X-CSE-MsgGUID: Ys67L0hJRA+QXlYByTz76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="264738857"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:05:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 03:05:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 03:05:52 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 03:05:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/ZVWOR48nR5reNKTM1GLtHrwp/juzf0kFzfHVfaWMx/qsq7cvAkJW5RAVXSop/rxhf7rqBJNiRAKbU6R2AcAcX+zK5Vu90tPwjfREZV5IITkNOUFrl1gFn5yqwhr6PwTji9vPrDeSwYIBvHePNRIOcW4i0H6wi+/tjScu0alJSfyz9EX0Gt4dA7J4jkN7mYMam1O9EjVU8HzjB1k6OAuz2S6IdhP/kTGZLUHOZT+VoWARXEhaO+9suVPLq7mbHTIjvspXnso8bHbvCX0NDZgm09dC6o55AUBmYdbAb8WYbXz48S5XxctSTJWBwH8Btc5ZLsL2syC0WufbU8w0bk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcPNJ/nIpuh3SrQJUGtLNiufRewNpcwwbplB4I56zAY=;
 b=LPmA5NTvfR6/Wx2ySXU3r4kkvPbPzZ/PIKx7xfyvo+5agZ45nrGTzh4QwAKpiajgAkZseNRJpvONeeM+kYhOClOyWcYDzav5gRStLVBh8xxnvwA3bUAXG9cXDPFA6x2H0JKGadRtEOruyd7QBCHifE0wN72+f+lI0ZSs5KhKPPo8cVf6CKzkfNic/+/jZ1b92aj4kuKQMPje7SVOU6gAyOHTWT4KRbYTePFhoQtsyXcnt/z9HIknkG+A939y4KuB6h2f+JnpADQydHOEwrL/2N4oVq+mbeyMMTNKl/5+tpi2bYuQWPv+H01MB7rX/8WQpnVHxwl47j1xr3KZLpsRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:05:49 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 10:05:49 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Garg, 
 Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Manna, Animesh" <animesh.manna@intel.com>
Subject: Re: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
Thread-Topic: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
Thread-Index: AQHdLvefWSFoBVzYy0+dYmfLdCizi7ajlFeA
Date: Tue, 18 Aug 2026 10:05:48 +0000
Message-ID: <d8e2febaea91285de7d34929cdd22b63c5ab2f56.camel@intel.com>
References: <20260818095149.2172935-1-nemesa.garg@intel.com>
In-Reply-To: <20260818095149.2172935-1-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB7666:EE_
x-ms-office365-filtering-correlation-id: 1dc3e54b-d37c-471d-6083-08defd104749
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10070799003|22082099003|18002099003|56012099006|38070700021|6133799003|11063799006|10067099003;
x-microsoft-antispam-message-info: oPk3xe4Z3j7yr4X+gfPsOzCGREdRcYYwCeR+SKHYv3l77WjOB52i6hqWjZHd05jdGBwSZtuWcFC4atLyxdVQIhXzA1yK/z+1YKWsCN9K7ZqdJul6oLh3+TnbNlAO4RmOxxq5iLA57g4FImhTygQObV5modiHonsYCOlhJJgjeUAB8YgyM783znwH6KVCAMq+obvntHaizWoOG6WnDviOgPNcOGApkEuHTDG7UBElflxjsHMwxp4iyy/tvcog0Rqh1ogcS9GJ68V7d9YXNGHm665RGuVUPdyYRWx/XL/oB6OHvPnvqf1KFlMh26dPBLSAr6e6qlvNl6w+zZNLIN2KQ6U8YbTpWdHJSYO1gSH0JgJtY5JQazo5XJuoOxJZiQQBe03FZG4IAhXOjbUwof9FLOOmMcCs1WlCUWE0wA/DVoM0OhmzMxqbczfjtlQ270IXShpuqXEIEOsYJ0Lw+nepBOGlx1dmdpqavzf0c/ZFYdFPrDCC3pcWFjStj5+4yJdcnhnL8wlvDWcpuwQucRaQvBSMzptX82cdVIwR/4de7Sq6yJyITor3fjj9lTIguxAZTPLq64EwkvFaV0gYM0hOt56QznKZt5MiMJf29Pa683Yu9OmYxZsMOEGrbm3ejj5HpoCd2E6+Bxv747ToWdHqLrPK6EXwAA8YZZ4u/jVAT1Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10070799003)(22082099003)(18002099003)(56012099006)(38070700021)(6133799003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHRNZlhRcFV1UElkMlVQUVhOU0cyQVlwSlcrTnZ0VnFzVUtxZHcxeFczMzE5?=
 =?utf-8?B?TVZDSFk2Rm45eTRjTmxGMlFMeDJtaWFRQlJhbUxjZDRsazMvTDFmeGpjZi9Q?=
 =?utf-8?B?ME83Mit0ckkvUWJSbzgzeHd0bjJwVXVIU0lVRkxCcnVVSjZtM2Y4dEM0RzZh?=
 =?utf-8?B?SFQyaUhmV3ZueHV5RnE4NjVvZUQ0NjRNcW1NazRpYURvVm42ellkSEM5OG0v?=
 =?utf-8?B?T3JLOHZYaloxNm1hNVdoZXl5QjlCYkxQQ0R6ejZ1dlBGUFBqVW8rUkhmSUUw?=
 =?utf-8?B?ZEl0VGw5aTdUcC9lR09tMnliWGpIUEJRUGR2RUJpMnVtYUJWRkpxS0R4blZs?=
 =?utf-8?B?MUxLQ1QyUCtBV0xZTWNwWjB3enpmUlAvQWFNZHV3Smc1c1pMMXlZMlhKNnp2?=
 =?utf-8?B?S1JrcWdBUm92VTBjNzFJYUttU2xKWWZyZFBleWNxdlNTL1ExMkhQaDl3T29y?=
 =?utf-8?B?YUZXaHI3b1hqLy9RSnFxVlU0SitaeS96VFR2VWtpbkozNGxCd2kvSFhlZlNq?=
 =?utf-8?B?NmtXOWdFYTFYZjFNMXVmcEVPQWJZTmhydGFTeVQ2YkM1Q0JHSkxOeG9vdnM2?=
 =?utf-8?B?cTNTc1UwcStETVQ1ajR3VXY2eEVWWDBuVUxnWjYzdWlQdXNaUlpCOWs5cWdv?=
 =?utf-8?B?VkF1SWxJM2lkL041UnlsOGVQQWs5Qjd4Mkk3dzFNSWpIVVJOeThkV1g2TzIz?=
 =?utf-8?B?YWEvS0VJSU95MU90ckFFUlZGbnl0eEROWElhTDVYV1BDWlVDVVJoczJnaXhM?=
 =?utf-8?B?dFJFaVBiU0lEOEt3UzBoRDlBNG93d1NpRG5QOUFaQUdjSURVcERUY2Q3UjNS?=
 =?utf-8?B?b3M4NUVuL2VyOFZVbDJyazNuc044eUdLTjBXY2NqU0FobDQzUmdIK3ZGYWdC?=
 =?utf-8?B?S0VyWll0M083NlUzUVp6Vldsd2grZ0d3am95ZFBtZlh3L2xvWjVTVXBRZ0N6?=
 =?utf-8?B?alFDeEEyRnBCV0Q0b011bnN6cWl4aFphMVNKVnQ5K2hwNjBZV0V2elA4S1Qx?=
 =?utf-8?B?ek8yT2pzTzkvKzdxR1FCWms3ZExodytVV3NXbjF2cUJCOVBSREhrK3NhR2VN?=
 =?utf-8?B?ajNxaEhEbHluK2dwN1c5cVFBbTA3RFdEZVhYNW93WmV1NUxFNlBCS2tFWmRx?=
 =?utf-8?B?SFpVYVNERzNzWDRWZURpUjRHd2RWcXk2VTFoZW1qQ3lWeXB5SnA1VW0zaE9E?=
 =?utf-8?B?aURxQ2hzMXh1OHZmUnoyczBiYTlrbjdORzJ4ZHArTy9oejNIeGhzWUZ1QnV0?=
 =?utf-8?B?YTY1ZHVhV1VkSDArNHNKeXoyM3E3elNsWm5XZE5tcTRrZzBDZXFtZGFzMTVv?=
 =?utf-8?B?R1M1VkY0eGtTMFkzWGJNaGNVNGhSa2hOOU9PdTdMQklNdGVyQkhYUThlTVdh?=
 =?utf-8?B?S214cWs4L0piOUppS2pCYUZCMEkxbXBtWXNRUlpMTDE1TEdZSlJ0YmFqc2k1?=
 =?utf-8?B?OEkxdVhzYkZxV2pqZDdzcFB2aHlCUWpMcEk5MkJ3dm9ieUdxY3lmR2U0aVNl?=
 =?utf-8?B?Y2pzVmxraHVzTW1DcU1JNk5sY3FWc3VHL1hKVUtkTDdjMHEyYUVYc2x2WTN4?=
 =?utf-8?B?NjZOT2U4QzFmVmdzeGlLQUFsSklTVTVCUWFRSFZmRGY2R2d3ZU5namJNNWJE?=
 =?utf-8?B?UFRpajhzd1Y1ZDRGTzl2M09GbWNDR09pMlh3UWh1RlIrSlQyWDNWYkNvc1o2?=
 =?utf-8?B?Q2huQnl4U0FLNWtzbWVjaElYNjQrd2s3S2Y4d3MvcXJVSStFcUFlcEJOV3Zt?=
 =?utf-8?B?Qk0xV28vaDg2U3hjTWhQaVVPV3E3TlpPOExEL2pLZzR6KzlMUjk3NHZVaGdN?=
 =?utf-8?B?bXlHVnh6MWMvbDFvU1JZeVZyM3Uza1VhNFdNeGEzL2dJUVZTSTFOWXZ3TElR?=
 =?utf-8?B?ZHRaVVR5eElPZE9FMWo0MzNNaG5iU29pZkc1NGhpK1pZaFBQOW4xTU9Tekhr?=
 =?utf-8?B?WlhOVGhXY2M3dWkzMXBJQXhJbkkwckl0clBjdWcrRkZkcFNLZlNHckhMVmZP?=
 =?utf-8?B?WHJvMm9Cd3lrZzRhL21Dd3ZpdkgwN2xNUTBaYWhacUNwSTdBRjdtK2dTa1dq?=
 =?utf-8?B?NDV2aVpReDQyaStYSUVhT21sOFIrT1dYOXFGS0w5TGJNdmZBVW1HSTN3V3lR?=
 =?utf-8?B?SWFyeUllSmZlMWk5aGlVaklHQXJ5dkZ1bC9GeDJ5UUZ5SldGREVyZVFaYnFh?=
 =?utf-8?B?OFFxeitzT3Nib1RDUGUyT3RkMVBFZDBjS3UyOG9iRGRwRGkzOW5Wbk85eEt0?=
 =?utf-8?B?K2FPbHRqRFJWVXNvbDdzNnFMOTlHUlB2eUd3cDlJTmxUTGd4aFFvZGgxbW5J?=
 =?utf-8?B?R0kydXpvdDBPRFNBcU81WVA5RVZOcmg1K2xYYjE0SGp2Y1FXYzlvbEkzWXhn?=
 =?utf-8?Q?otFH5AJEeDNQB1l8u5RlIQyMF+tHkjDQ7MuX2DUG7GMMU?=
x-ms-exchange-antispam-messagedata-1: m3e3y6FuGjtOiGJn0CnrgoE7eB3jUQs+Zgo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AE2B204F2A00A459AFAC01F391EE6A1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SFESxYvSjg6YqtEtGOrB+VdZ4E6IM6qFMvvHxlYL0dP2ujB/HxvuUeKtOxFe2O07yqXrcvkbADUfsU0LBONCMNO1WJShXYqtJzsnaATT+4d86IQLgsF22QrEIstA2+qpVnE+5k8fTHbIKc8CEd4fKBWPUOjcDkVZxnXIZLqNrjZlOeHWAb+zkeQHjMTbtvnmEDhdTbadtS3KuVRaTYH0+/KP2fs27Zqzax2dWKZLJon50xDq85zXAXOtTFSFLcdL92R9eLDAUAO5NT0ihGl4GQkshhLXQln4VrrG0ALsTKxpc7+ujQhj417MFzaEbKKCnuEh6zrPN6XEF5VNC/cGhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc3e54b-d37c-471d-6083-08defd104749
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 10:05:49.0018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +E6Fj9tQQb0SWpIGexxJue3h0Nw/dxLcePr6pvgSIAKOEjNi+/gk1BmcsjWCd91TOrpAY8z+eLjsOQaNFH5S7iqZVFoFbFNpOSRouTUZvPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDE1OjIxICswNTMwLCBOZW1lc2EgR2FyZyB3cm90ZToNCj4g
aWNsX3BsYW5lX2Rpc2FibGVfc2VsX2ZldGNoX2FybSgpIHdyb3RlIFNFTF9GRVRDSF9QTEFORV9D
VEwgPSAwIG9ubHkNCj4gd2hlbg0KPiBjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2gg
d2FzIHNldC4gSWYgYSBwbGFuZSB3YXMgZGlzYWJsZWQNCj4gYWZ0ZXINCj4gc2VsZWN0aXZlIGZl
dGNoIGhhZCBiZWVuIHR1cm5lZCBvZmYsIHRoZSBndWFyZCBmaXJlZCBlYXJseSBhbmQgbGVmdA0K
PiB0aGUNCj4gcmVnaXN0ZXIncyBlbmFibGUgYml0IHNldCBpbiBoYXJkd2FyZS4NCj4gDQo+IFRo
ZSBiaXQgaXMgaGFybWxlc3MgdW50aWwgc2VsZWN0aXZlIGZldGNoIGlzIHJlLWVuYWJsZWQuwqAg
V2hlbiBpdCBpcywNCj4gdGhlDQo+IGhhcmR3YXJlIHJlc3VtZXMgZmV0Y2hpbmcgZm9yIHRoZSBu
b3ctZGlzYWJsZWQgcGxhbmUgYW5kIGtlZXBzIGl0cw0KPiBvbGQgRERCDQo+IHJhbmdlIHJlc2Vy
dmVkLg0KPiANCj4gaTl4eF9jdXJzb3JfZGlzYWJsZV9zZWxfZmV0Y2hfYXJtKCkgaGFzIHRoZSBz
YW1lIGd1YXJkIG9uDQo+IFNFTF9GRVRDSF9DVVJfQ1RMDQo+IGFuZCBpcyBmaXhlZCB0aGUgc2Ft
ZSB3YXkuDQo+IA0KPiB2MjogQWRkIHNhbWUgY2hlY2sgZm9yIGN1cnNvciBhbHNvLiBbc2FzaGlr
b10NCj4gDQo+IEZpeGVzOiBiMWY1Mjc5YjU5ODEgKCJkcm0vaTkxNS9wc3I6IE1vdmUgcGxhbmUg
c2VsIGZldGNoDQo+IGNvbmZpZ3VyYXRpb24gaW50byBwbGFuZSBzb3VyY2UgZmlsZXMiKQ0KPiBD
bG9zZXM6DQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0v
d29ya19pdGVtcy84NzM5DQo+IEFzc2lzdGVkLWJ5OiBHaXRIdWItQ29waWxvdDpjbGF1ZGUtb3B1
cy00LjYNCj4gU2lnbmVkLW9mZi1ieTogTmVtZXNhIEdhcmcgPG5lbWVzYS5nYXJnQGludGVsLmNv
bT4NCg0KR29vZCBmaW5kaW5nOg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jdXJzb3IuY8KgwqDCoMKgwqDCoCB8IDE1ICsrKysrKysrKystLS0NCj4g
LS0NCj4gwqAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jwqDC
oMKgIHwgMTUgKysrKysrKysrKy0tLQ0KPiAtLQ0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMNCj4gaW5kZXggMDY3M2YxNmY2ZmQwLi44NmJiOTZh
YzQ0OWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
Y3Vyc29yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJz
b3IuYw0KPiBAQCAtNTMwLDEzICs1MzAsMTggQEAgc3RhdGljIGludCBpOXh4X2NoZWNrX2N1cnNv
cihzdHJ1Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gwqB9DQo+IMKgDQo+
IMKgc3RhdGljIHZvaWQgaTl4eF9jdXJzb3JfZGlzYWJsZV9zZWxfZmV0Y2hfYXJtKHN0cnVjdCBp
bnRlbF9kc2IgKmRzYiwNCj4gLQkJCQkJwqDCoMKgwqDCoCBzdHJ1Y3QgaW50ZWxfcGxhbmUNCj4g
KnBsYW5lLA0KPiAtCQkJCQnCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlKQ0KPiArCQkJCQnCoMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9wbGFuZQ0K
PiAqcGxhbmUpDQo+IMKgew0KPiDCoAlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRv
X2ludGVsX2Rpc3BsYXkocGxhbmUpOw0KPiDCoAllbnVtIHBpcGUgcGlwZSA9IHBsYW5lLT5waXBl
Ow0KPiDCoA0KPiAtCWlmICghY3J0Y19zdGF0ZS0+ZW5hYmxlX3BzcjJfc2VsX2ZldGNoKQ0KPiAr
CS8qDQo+ICsJICogQ2xlYXIgdGhpcyB3aGVuZXZlciB0aGUgaGFyZHdhcmUgaGFzIHNlbGVjdGl2
ZSBmZXRjaCwgbm90DQo+IGp1c3Qgd2hlbg0KPiArCSAqIHRoZSBjdXJyZW50IHN0YXRlIHVzZXMg
aXQuIFRoZSBjdXJzb3IgbWF5IGhhdmUgYmVlbg0KPiBlbmFibGVkIHdpdGgNCj4gKwkgKiBzZWxl
Y3RpdmUgZmV0Y2ggZWFybGllciBhbmQgaGFkIGl0cyBlbmFibGUgYml0IG9ycGhhbmVkDQo+IHdo
ZW4gdGhlDQo+ICsJICogZmVhdHVyZSB3YXMgc3dpdGNoZWQgb2ZmLg0KPiArCSAqLw0KPiArCWlm
ICghSEFTX1BTUjJfU0VMX0ZFVENIKGRpc3BsYXkpKQ0KPiDCoAkJcmV0dXJuOw0KPiDCoA0KPiDC
oAlpbnRlbF9kZV93cml0ZV9kc2IoZGlzcGxheSwgZHNiLCBTRUxfRkVUQ0hfQ1VSX0NUTChwaXBl
KSwNCj4gMCk7DQo+IEBAIC01ODYsNyArNTkxLDcgQEAgc3RhdGljIHZvaWQNCj4gaTl4eF9jdXJz
b3JfdXBkYXRlX3NlbF9mZXRjaF9hcm0oc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiDCoAkJaWYg
KGNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3N1X3JlZ2lvbl9ldCkNCj4gwqAJCQl3YV8xNjAyMTQ0
MDg3Myhkc2IsIHBsYW5lLCBjcnRjX3N0YXRlLA0KPiBwbGFuZV9zdGF0ZSk7DQo+IMKgCQllbHNl
DQo+IC0JCQlpOXh4X2N1cnNvcl9kaXNhYmxlX3NlbF9mZXRjaF9hcm0oZHNiLA0KPiBwbGFuZSwg
Y3J0Y19zdGF0ZSk7DQo+ICsJCQlpOXh4X2N1cnNvcl9kaXNhYmxlX3NlbF9mZXRjaF9hcm0oZHNi
LA0KPiBwbGFuZSk7DQo+IMKgCX0NCj4gwqB9DQo+IMKgDQo+IEBAIC02OTUsNyArNzAwLDcgQEAg
c3RhdGljIHZvaWQgaTl4eF9jdXJzb3JfdXBkYXRlX2FybShzdHJ1Y3QNCj4gaW50ZWxfZHNiICpk
c2IsDQo+IMKgCWlmIChwbGFuZV9zdGF0ZSkNCj4gwqAJCWk5eHhfY3Vyc29yX3VwZGF0ZV9zZWxf
ZmV0Y2hfYXJtKGRzYiwgcGxhbmUsDQo+IGNydGNfc3RhdGUsIHBsYW5lX3N0YXRlKTsNCj4gwqAJ
ZWxzZQ0KPiAtCQlpOXh4X2N1cnNvcl9kaXNhYmxlX3NlbF9mZXRjaF9hcm0oZHNiLCBwbGFuZSwN
Cj4gY3J0Y19zdGF0ZSk7DQo+ICsJCWk5eHhfY3Vyc29yX2Rpc2FibGVfc2VsX2ZldGNoX2FybShk
c2IsIHBsYW5lKTsNCj4gwqANCj4gwqAJaWYgKHBsYW5lLT5jdXJzb3IuYmFzZSAhPSBiYXNlIHx8
DQo+IMKgCcKgwqDCoCBwbGFuZS0+Y3Vyc29yLnNpemUgIT0gZmJjX2N0bCB8fA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0K
PiBpbmRleCAwN2E2ODMyOTMzNTIuLjVjZGExYWI5MGU0MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gQEAgLTg3
OSwxMyArODc5LDE4IEBAIHNrbF9wbGFuZV9kaXNhYmxlX2FybShzdHJ1Y3QgaW50ZWxfZHNiICpk
c2IsDQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkIGljbF9wbGFuZV9kaXNhYmxlX3NlbF9m
ZXRjaF9hcm0oc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiAtCQkJCQnCoMKgwqAgc3RydWN0IGlu
dGVsX3BsYW5lDQo+ICpwbGFuZSwNCj4gLQkJCQkJwqDCoMKgIGNvbnN0IHN0cnVjdA0KPiBpbnRl
bF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiArCQkJCQnCoMKgwqAgc3RydWN0IGludGVsX3Bs
YW5lDQo+ICpwbGFuZSkNCj4gwqB7DQo+IMKgCXN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5
ID0gdG9faW50ZWxfZGlzcGxheShwbGFuZSk7DQo+IMKgCWVudW0gcGlwZSBwaXBlID0gcGxhbmUt
PnBpcGU7DQo+IMKgDQo+IC0JaWYgKCFjcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9zZWxfZmV0Y2gp
DQo+ICsJLyoNCj4gKwkgKiBDbGVhciB0aGlzIHdoZW5ldmVyIHRoZSBoYXJkd2FyZSBoYXMgc2Vs
ZWN0aXZlIGZldGNoLCBub3QNCj4ganVzdCB3aGVuDQo+ICsJICogdGhlIGN1cnJlbnQgc3RhdGUg
dXNlcyBpdC4gVGhlIHBsYW5lIG1heSBoYXZlIGJlZW4NCj4gZW5hYmxlZCB3aXRoDQo+ICsJICog
c2VsZWN0aXZlIGZldGNoIGVhcmxpZXIgYW5kIGhhZCBpdHMgZW5hYmxlIGJpdCBvcnBoYW5lZA0K
PiB3aGVuIHRoZQ0KPiArCSAqIGZlYXR1cmUgd2FzIHN3aXRjaGVkIG9mZi4NCj4gKwkgKi8NCj4g
KwlpZiAoIUhBU19QU1IyX1NFTF9GRVRDSChkaXNwbGF5KSkNCj4gwqAJCXJldHVybjsNCj4gwqAN
Cj4gwqAJaW50ZWxfZGVfd3JpdGVfZHNiKGRpc3BsYXksIGRzYiwgU0VMX0ZFVENIX1BMQU5FX0NU
TChwaXBlLA0KPiBwbGFuZS0+aWQpLCAwKTsNCj4gQEAgLTkyMSw3ICs5MjYsNyBAQCBpY2xfcGxh
bmVfZGlzYWJsZV9hcm0oc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiDCoA0KPiDCoAlza2xfd3Jp
dGVfcGxhbmVfd20oZHNiLCBwbGFuZSwgY3J0Y19zdGF0ZSk7DQo+IMKgDQo+IC0JaWNsX3BsYW5l
X2Rpc2FibGVfc2VsX2ZldGNoX2FybShkc2IsIHBsYW5lLCBjcnRjX3N0YXRlKTsNCj4gKwlpY2xf
cGxhbmVfZGlzYWJsZV9zZWxfZmV0Y2hfYXJtKGRzYiwgcGxhbmUpOw0KPiDCoA0KPiDCoAlpZiAo
cGxhbmVfaGFzX25vcm1hbGl6ZXIocGxhbmUpKQ0KPiDCoAkJaW50ZWxfZGVfd3JpdGVfZHNiKGRp
c3BsYXksIGRzYiwNCj4gQEAgLTE2NDEsNyArMTY0Niw3IEBAIHN0YXRpYyB2b2lkDQo+IGljbF9w
bGFuZV91cGRhdGVfc2VsX2ZldGNoX2FybShzdHJ1Y3QgaW50ZWxfZHNiICpkc2IsDQo+IMKgCQlp
bnRlbF9kZV93cml0ZV9kc2IoZGlzcGxheSwgZHNiLA0KPiBTRUxfRkVUQ0hfUExBTkVfQ1RMKHBp
cGUsIHBsYW5lLT5pZCksDQo+IMKgCQkJCcKgwqAgU0VMX0ZFVENIX1BMQU5FX0NUTF9FTkFCTEUp
Ow0KPiDCoAllbHNlDQo+IC0JCWljbF9wbGFuZV9kaXNhYmxlX3NlbF9mZXRjaF9hcm0oZHNiLCBw
bGFuZSwNCj4gY3J0Y19zdGF0ZSk7DQo+ICsJCWljbF9wbGFuZV9kaXNhYmxlX3NlbF9mZXRjaF9h
cm0oZHNiLCBwbGFuZSk7DQo+IMKgfQ0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkDQoNCg==
