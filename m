Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B45D3901B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 20:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA1F10E36E;
	Wed, 14 Jan 2026 20:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UERqC7zZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8244210E36E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768423402; x=1799959402;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TJktzkQT1XL97cpGdwiP6vDZfsdXPpoOCE3+/n+02/8=;
 b=UERqC7zZVdCgxtnyzGWW+dJQRcyDj6EkxvFoemiaJl5eaSYtaIJJOpCL
 Ck7JYa3HZg/JZOjK7HQIcWlFJVmjASq+4ynNsPpPwgpmirarB0V64kcSH
 0ZHQJUy22Masoo3SeEoiUNAeIMOeCBxXuMZb5bjXcMQqPs+Iuc301fHmU
 b0kV1uBGn6SVljSNoi/tt6Un6vSnIaiiBpHYuuO/i316UAjfwc5mI8ffH
 LA28nWwXlWK+VopFGGr5U8h0GwomkpfclrzJlnJPkeqW0jve/xt6mQyCv
 szOOjvNAuGN6HwlpxGtobJ7dbJRABcpgfAASGSmxaDc8co2l2jYcf+GAh g==;
X-CSE-ConnectionGUID: moXQsAGARPWD/fiwJQl3Mg==
X-CSE-MsgGUID: 5OaXWVCNRSOgSee+Tj/ThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68939632"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="68939632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 12:43:21 -0800
X-CSE-ConnectionGUID: /M7e5HIXQLixS/RfRLreUw==
X-CSE-MsgGUID: fqh5ANIFTbWwyiMdREUfVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="235500020"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 12:43:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 12:43:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 12:43:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 12:43:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvbE6gUNbDvvHtd8aTBC8rizDZ2lvbngvq66HSdUQ7clczZBwfO+ljF8oFvNkMvb84Tnu4ii06JVAXzpxxL98B+P7+XwVAEO12dcClVfjky9EkF9HUBvZPbktjKB+ApU1uWrmjxk9wtEwswMfIZmdyS1g7hviw4p2NIGXFMVn99KwE9+ciijon45gTrTllKtnhh6T/0f8+65WA1ymYQ37Fiy961DHm7X1xuERaOg8qkC5mvXhE1e2pLkIHEmOUoeiu6u0oNK+FMEpBuxwwDwCM8aPIzlvLNqpbzwefGgTv0z8L8iA44lOmUYGIhXmw2Vc5o8yUcVxOhF4mMpbKg4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJktzkQT1XL97cpGdwiP6vDZfsdXPpoOCE3+/n+02/8=;
 b=ugy7SizzT5Xo0BWdtTKoxvv2PHPqhXzyMKpuYi4WWX+H495ChtKp0NVwPEw2U1eagEGlYXWBZTgXPG0v4aZT+LmGqZdXckBjmMd3732FrMQ6MeuXAzOXsYjbDaAEq4R49RuVBcrcUpvXmJ9MVYgtxydcT/eait1hJI62UDJhPbxVdMyb9j/2OtLb50tsbw2S5/T2Wd1mIqt6xHnB6wtAh5ayOwS0/kDT2jn3eYdr7DYWtslF8JSNrBS3ClE93SYK85jACuw0xUoVowSvFD/7Z+WNIFWyqdgnIfXWTwGNf0zhbW2EjAn7RPS1Cmwu6G23ccgPiKuzauMRyN6z5ExGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 20:43:14 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 20:43:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Thread-Topic: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Thread-Index: AQHchYaDrxfUY7xpfUmEiw6yUbS/OLVSHOkAgAADcACAAAFmAA==
Date: Wed, 14 Jan 2026 20:43:14 +0000
Message-ID: <563ccee86f66c06aa0eebc9430b06641eff36857.camel@intel.com>
References: <20260114184905.4189026-1-matthew.brost@intel.com>
 <cf8ccdcfa6e3e22b0979d88f6eeea5f2cf4e4a2b.camel@intel.com>
 <aWf+tGpSKfxmaQ+g@lstrano-desk.jf.intel.com>
In-Reply-To: <aWf+tGpSKfxmaQ+g@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB5163:EE_
x-ms-office365-filtering-correlation-id: 4881da35-1853-417d-4bf7-08de53ad8a36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d3dzdFlLaDZIeUdCM1h6YlBnSFJYWDFTRld4endOYmNxZXBxdDY2L2lRVXpi?=
 =?utf-8?B?eGF1cVMwemxQOWNaQUlvcXM3STdWYURZNExpUjhpaU9JTVh0L0pqZHpNeVRU?=
 =?utf-8?B?clZHSmY3WGtTZFRhQXhDckFLbkU0ZkdtTUhubTcrblJad20ydHVPdFNjb2xx?=
 =?utf-8?B?NVlkYk51OEQ5WDlsQSt3eHpJLzkyTTNUYW9ONEp0UkkyS2l2UjF2b1daLzZS?=
 =?utf-8?B?dGh0RFB6cHU2cjhHZy9vajdUZm82WlA1Ym4rWXhOamtGaU9jOVFzOExBOElD?=
 =?utf-8?B?eStUQnZ4a0I1N3FwRjJMY2FYQ3V6ajB1Z0JRMDVKL2RiZG9Sbm9QUTJUUzFR?=
 =?utf-8?B?d3d3K1RteDNVWWRXQ1A3aDg2cUNEeERKWTNsTHIvM1VGNzVLSThURFMrVjJ1?=
 =?utf-8?B?NHJ5cDM0WS9xYjNHSzBNYWc5dTUxSU80SUNyeURRM252Q3IxQUNuY1ByQUZu?=
 =?utf-8?B?dXhVazJDcUdnS0NJMEVqZVJETXhqMkhWbnBMQ2N2SFVkNURMRTFUTlJaMndk?=
 =?utf-8?B?WVUzdDI5RlNwTFU4aGozekV3R0JGdW5UQlZ6c090RGhIWFA4UEVtdDZtMTcw?=
 =?utf-8?B?MUpBeUVWTFgyOThoQ3lENGNIS0RZY3pRQmZhQVpWRGtQR1k5UzNuMnB4M2sv?=
 =?utf-8?B?ZVhNUWNPWG9NdkdUc2EyTlVRa1l3bEtLMjM0emJLeEJRTWZKQ05mUkFOeHB5?=
 =?utf-8?B?WWFxdUk2a0VoRElNTWRlUXRZUWw3d0I3QUk3eFZ5Y2NWNEoyYisrMGJzRm9F?=
 =?utf-8?B?VkpIV215SEtyWjRyOU9FUnQ5bERSbmp4d2Z5eElZVFpGejh5UHU3RXFrUnc2?=
 =?utf-8?B?Vk1tczV6Ris3b3FZWlRHREUrTzlUdEczZEZaNEttWEVWZytVYVVXMnhhTko3?=
 =?utf-8?B?a1EzMlBhZ3lPaEZDMnVUYTczS21JYmhzSnQzbzcxNzlmVWcxdWNxbm1yWUt1?=
 =?utf-8?B?dGNoUkxLT3RQSVROKzU0LzZ2UXpkOU1DcU9Wc29pZU5OZnlMdWRIU2c2endP?=
 =?utf-8?B?VkFEbEwyMWNUOUJGWGtqamNTWU1rZ2doZWI3d1pkZnhrYitHOUpYb200SGxw?=
 =?utf-8?B?OHZhMDRoL2tLVFZWTFVRaUpvOTcydkRYS1hWVlVzekxkTjMrbkJzT1k4QTli?=
 =?utf-8?B?S00vN3dBbDU2akJDOTJWUnpmM0NsVlRtUk9LRGdBZitFTllQd3hWeFRNRWNR?=
 =?utf-8?B?WWJLYWkwbUh2c3d4TDVYbG1KMXZLM2xOZWJLQUpTdVozSlc2TS9rdm1WU1Z0?=
 =?utf-8?B?Q3dnUm0yeTlFNHgvR00za0pnUzE0eHVEZGRHMVBWWkYyQ2U5Q3dPY1NjSEkx?=
 =?utf-8?B?c0xrb0owbXBjOXY3WXdCK0JhU3M4aDEzdmFYZGV3cXZwYlNuaVZpQUkwZUZZ?=
 =?utf-8?B?dloxeWpsSjhnQXI2a0Z3L0R1ODRueXRnNUw0WVhTUHFvMENvcHRYNmh5SlRl?=
 =?utf-8?B?a0JGMi84bzhZNkhqT2FIai9vaWJXOC9SaTlTVCthb3BMcUI2WjdiYWlISm5u?=
 =?utf-8?B?dE1uTzZwTzBSZzVjc2FqMTlEanJ6Y2JCN2J0TCswblhJOHFobzF2SGJLck1y?=
 =?utf-8?B?Ym51WVlZUmh3MnRsMW11SG1WbjI4R2I4Mjd1UThiTVNRaHhselZ5Z1J1Y1hL?=
 =?utf-8?B?aXh5dWtJdndpQlpMZkRHeW1EaWF4cjZFQzBJNUpGcW5hdzhlZGpFU3FxRkwr?=
 =?utf-8?B?czRmVjRuY25aWXdNOVp5aXhzeU8xS0Q3UzRuVTdhdlkzOUNlM2phSHN0d3Ju?=
 =?utf-8?B?VVcvbjFpMm9sd3U3QTNLaUw4QVhvUWxSUGhFWVV6czB6Y2RnRzNIUmIzQkVy?=
 =?utf-8?B?VEJMSWNXTzRzemdCdTdBRlNUQXBOV3Jyd2hLcXpoNU5vNEVmNkl1MmN2QTQ0?=
 =?utf-8?B?R3hIT2JSY2t3bjhXaVk0c1pKV2RYbEM4eG1EYWVEbGNmelRwZ2k1WWlUc211?=
 =?utf-8?B?TWZieDlNZUlsZ3RQTlFRWVB6TW5aeHVGTHlrZ1J5V09nSS9KbHE4TkZQd2RZ?=
 =?utf-8?B?ZUx5NUFKM0VSZitkamZNZlNaVENiOWF5cTJHRmVXMkx0ZEM4OEhuZWtWQUti?=
 =?utf-8?B?ZXJNdEFJaXlIVE5ZOEp3RWtqYWp6YkJ4MG1tbEcyU1RJL2tZMGZYN3pqZFFG?=
 =?utf-8?Q?9/GVCTdDn/FzuhznXK4YecrhM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlROQXdTVVJzbmVvTzR1d3p1d0xWRng4MXBjWUFUR1JvWkNlUGZoL2pSZlMy?=
 =?utf-8?B?cnIxYnArdzJxUEtNN202TUM0UForUGQzQnVwYWV3clRMcC9MNFdzSThjTjAv?=
 =?utf-8?B?Q3J0dGkvb3YxVENHNjNKOUNINHZRR1hMN0VBZTBwbjhsM3NMUjM4V3p6bUo2?=
 =?utf-8?B?STVDOXFMeElOcDVqdDRFTXBFM3YyMCthZU85Z0UvL0czQVBsMDl6KzBGVzFW?=
 =?utf-8?B?SDJTZDg1blozdXRGVTJLRmFueXpWZG92SjFCRkhiQkVUWkpNelI0WHc3eG9v?=
 =?utf-8?B?MU5KbTlxOThZVHlhV3BUS0FMSmVvZ1Q5YXprYWFBMVFXSlI2MlNTdGxXWmg5?=
 =?utf-8?B?NkNiNmpsUGk4WXV5QWVLN004UWRiVjhFRElKTFh0aXNrZkd3QzRjR2FQZTJ5?=
 =?utf-8?B?SllXeXFjOFh5dmhwT04wWG1IMnl1clRIdHd0aG9HWFFlZG9KRWt0T2xiZTk3?=
 =?utf-8?B?VXNia0Fvc0hWYWR6Z01pUW5saDBHOEZjSTB2TjY3RzJUZ3hPckZlUjRJeXIv?=
 =?utf-8?B?eWNDTmxZQnQ2SlhIQklhd3d4d3FYc0FlVHlPOG5iL2o3SlF0dVFHcjdvUHFD?=
 =?utf-8?B?MUFzbUV3TFc0Wkk1REc1azNFSElWNEF3NmpyOXFhZVg2WFNBRlRNRVcwSmp1?=
 =?utf-8?B?MU1xcHhmbGttNDNabzBMVHlYNXRDWUpZKzdDS3pack5kVW5oY1NNSE5wM0FS?=
 =?utf-8?B?T2dONmVNOTlaelZ5UGU0cEliU2JQazdPVHNzck8wdkdPaGluU3ZzNGJ0K2ho?=
 =?utf-8?B?bEt0V2VnVStiaFJYa2FKLzlOb3hwZyszTXBWU1JFVnVNZTltT3lZSFFvN2Nm?=
 =?utf-8?B?NWdxa1JZdm5xSkpISjh2cE9WM2I4cjQ3WXFKK0V4eVB5aDJRZjVvVVFYcGFO?=
 =?utf-8?B?b1Z2SndFRjcwQ1d1cUZjZjJhNDNHT1YvUmFaeCtqQ2JDRmZhYXpvNGFtVjRu?=
 =?utf-8?B?OEhNQ1RXVU9Nam1SdmdLajJOUHVYSlRPcXNRT0xLUENLbkJZMDduOUZoekV6?=
 =?utf-8?B?VHdyVlFzWjRUV20vcmV4dGcybGZ5N3FpemdrQTUwOWgrOFkweGo5TytkYkkv?=
 =?utf-8?B?Y09zdUtSem4zSEFSVHNSMkVsc1dHaUhiTmRyVHhiUW5xcnl4TFFDZmpFOU5L?=
 =?utf-8?B?eVM4Ny9VUkNSTmNwRktlbFM4NmdlOUJGR3d4T0NZejloODBQaU5KaitPczJp?=
 =?utf-8?B?aTZTVVJJK1h6Q0tGb2dVNEJvVm1GOE0rVThHbEhsc1pjWnlZY3ZjRVpkYUdG?=
 =?utf-8?B?VTZnMEJBblc1WXVLbjBubTZ2Sys5ZC9CTGIza0o3OU9oNGdiYzFjeGZ3RXlj?=
 =?utf-8?B?ZFg4M2NNZnp2YWNURVJoa01BV2RGbU9lb0dmRTRaSVZ1aXd1YjdMemVHK1Fr?=
 =?utf-8?B?UStpb0hITWJXZTBWL2N0TC9uNmdsV2wweVpRaFBsTmxkZnp3enNiaTJkUTdl?=
 =?utf-8?B?RHdLVlErNkE3c1V1UzBnOGRpSjBnS1h5U0ZlMXZHMTBEMGNGTVVrUklxa05r?=
 =?utf-8?B?Y1BpUHJuNHdOZjRPem05cTVxbytzSHdhdGdlcStBeDJhbkJ0NCtQc1RtVjdY?=
 =?utf-8?B?bDhxYXlVd3BnU2FPa0JHbkpxdFFWamQ5Sm55ZXR4dEh5aHJheTdHMjRCZUY0?=
 =?utf-8?B?aTJkT0FHM2cvbUtqbVBUL3dmSWZPMC9HdVVrZnpYWFBxTWJ0Z21BZFVtRWhL?=
 =?utf-8?B?bkZrMWp5aHpHT0FQRWdPVW9NQVRBRDZrWUJNd09mZEJ0RTlOZThZZUZuMHFT?=
 =?utf-8?B?cUgwbG9NY2lXTFlZVDlvUU44ZUExSTlDRE1iOERSVm1sMHlSUVJ1eFFtY1VU?=
 =?utf-8?B?MjdPMDZoQUpuOVVhemUva3pEakFESGtabjFxRFVFRjg1VWZZZDY4ZmQyZ0ZQ?=
 =?utf-8?B?UCt0bmtRM1ZHRTNvZlJBeStYVnJIdHF1NldySnRpWkVwdVgwQ0tsbUk2NTE0?=
 =?utf-8?B?TTY0QzJvN3Z3Mytqb1F1OGRlcDcyTDF3ejN1S2E0eXUwT2RRYXUwZjZQQ2Yx?=
 =?utf-8?B?dU1RNDVFTjZpRlJIcEsvbHRnTHdVTEdaNFFYMExlclFFdGNJbzcwMldOVE1R?=
 =?utf-8?B?d1ZacVpOQkF1Zkk1SDdWVFZWNHVWTmxLdDZXWEEyS0VBSE5HUWlyNHpPL2wr?=
 =?utf-8?B?SkNWYjc5b0pzT3FQdDVoL0VXNkVSTThuVWd5TW93UXg5WkcreWxIaXhuVDlr?=
 =?utf-8?B?QmdMUmJVVFppTmdZUDBIeE92LytjeTdmaEx2RmNpZUw5anJNaU9TSU9Cb3V4?=
 =?utf-8?B?RVNoVHUvbmQ5dFJNU2RIYXpjZHJGMzIvRW9DY3hyeXhaa2IrQUo4SWxQa2ZJ?=
 =?utf-8?B?MWQ4ckJrTWMzY1VZbzlRcmxMeFc0RDFwb0pWZFphZlJXcnFmSjRvSTdsNjBJ?=
 =?utf-8?Q?KGfdJANNB4iJeXGo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E21CDBE05DAEA941A702C26C67657170@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4881da35-1853-417d-4bf7-08de53ad8a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 20:43:14.6218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0O/BZ6td3an9IkCc3nQOpKKQoL514S1PRWtqnFWNTOQ430WjAEUJTW0eQPyuQWcq2y99SyQqQYYUvFzJWrvDCmfeDcy4f+nPHd+ifU/LTrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
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

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDEyOjM4IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAwMToyNTo1NVBNIC0wNzAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI2LTAxLTE0IGF0IDEwOjQ5IC0wODAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gQW4gTFJDIHRpbWVzdGFtcCBnZXR0aW5nIHN0dWNrIGlzIGEg
c29tZXdoYXQgbm9ybWFsIG9jY3VycmVuY2UuDQo+ID4gPiBJZiBhDQo+ID4gPiBzaW5nbGUgVkYg
c3VibWl0cyBhIGpvYiB0aGF0IGRvZXMgbm90IGdldCB0aW1lc2xpY2VkLCB0aGUgTFJDDQo+ID4g
PiB0aW1lc3RhbXANCj4gPiA+IHdpbGwgbm90IGluY3JlbWVudC4gUmVkdWNlIHRoZSBMUkMgdGlt
ZXN0YW1wIHN0dWNrIG1lc3NhZ2Ugb24gVkZzDQo+ID4gPiB0bw0KPiA+ID4gbm90aWNlIChzYW1l
IGxvZyBsZXZlbCBhcyBqb2IgdGltZW91dCkgdG8gYXZvaWQgZmFsc2UgQ0kgYnVncyBpbg0KPiA+
ID4gdGVzdHMNCj4gPiA+IHdoZXJlIGEgVkYgc3VibWl0cyBhIGpvYiB0aGF0IGRvZXMgbm90IGdl
dCB0aW1lc2xpY2VkLg0KPiA+IA0KPiA+IE9rIGFuZCBpZiB0aGlzIGhhcHBlbnMgYW5kIHRoZXJl
IGlzIGFuIGFjdHVhbCBwcm9ibGVtLCB0aGUgcXVldWUNCj4gPiB3aWxsDQo+ID4gYmUgYmFubmVk
IGl0IGxvb2tzIGxpa2UgZnJvbSB0aGUgZWFybGllciBwYXRjaCwgc28gc2hvdWxkIHN0aWxsIGJl
DQo+ID4gb2suIA0KPiA+IA0KPiA+IE15IG9ubHkgcXVlc3Rpb24gaXMgd2h5IG5vdCBtb3ZlIGJv
dGggY2FzZXMgKFZGIGFuZCBub24tVkYpIHRvDQo+ID4gbm90aWNlPw0KPiANCj4gVGhlIG5vbi1W
RiBjYXNlIHRoZSBMUkMgdGltZXN0YW1wIHNob3VsZCBhbHdheXMgYmUgbW92aW5nLCBpZiBpdA0K
PiBpc24ndA0KPiBzb21ldGhpbmcgaGFzIGJhZGx5IGdvbmUgd3JvbmcgYW5kIENJIHNob3VsZCBu
b3RpZnkgdXMgb2YgdGhlIGVycm9yLg0KDQpPayBidXQgc2hvdWxkbid0IHRoZSBqb2IgdGltZW91
dCBnZW5lcmFsbHkgYmUgdGhlIHNhbWU/IChzaG91bGQgd2UNCmNoYW5nZSB0aGF0IHRpbWVvdXQg
dG8gd2Fybj8pDQoNCkFuZCBzb3JyeSBpZiB0aGlzIGlzIGEgYmFzaWMgcXVlc3Rpb24uLi4gYnV0
IHdoeSBpc24ndCB0aGF0IHRoZSBjYXNlDQpmb3IgVkYgdG9vPyBCZWNhdXNlIG9uIHRoZSBWRiBz
aWRlIHdlIGFyZSBpc3N1aW5nIHJlc2V0cyBhcyBwYXJ0IG9mIHRoZQ0Kc3VibWlzc2lvbiBmbG93
IG5vcm1hbGx5PyBPciBiZWNhdXNlIHdlIHdhbnQgdG8gbWFrZSBzdXJlIHRoZSByZXNldHMNCmZy
b20gb25lIFZGIGFyZSBoaWRkZW4gZnJvbSBhbm90aGVyIFZGPw0KDQpUaGFua3MsDQpTdHVhcnQN
Cg0KPiANCj4gTWF0dA0KPiANCj4gPiBJcyB0aGUgaWRlYSB0aGF0IGluIHRoZSBub24tVkYgY2Fz
ZSwgdGhlIHJlc2V0IGlzIGFscmVhZHkgYW4gZXJyb3INCj4gPiBhbmQNCj4gPiBzbyB0aGUgZXh0
cmEgd2FybiBpcyBvaz8gQnV0IGluIHRoYXQgY2FzZSBJJ2QgYWxyZWFkeSBleHBlY3Qgc29tZQ0K
PiA+IG90aGVyDQo+ID4gZXJyb3IgbWVzc2FnZSB0byB0cmlnZ2VyIENJIChsaWtlIHRoZSBlbmdp
bmUgcmVzZXQgbm90aWZpY2F0aW9uDQo+ID4gZnJvbQ0KPiA+IEd1QykuIFNvIHRoZSBleHRyYSBp
bmZvcm1hdGlvbiBoZXJlIHJlYWxseSBpc24ndCBkb2luZyBhIHdob2xlIGxvdA0KPiA+IG1vcmUN
Cj4gPiBmcm9tIGEgd2FybmluZyBsZXZlbCAoQ0kgdHJpZ2dlcmluZykgcGVyc3BlY3RpdmUuDQo+
ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBDbG9zZXM6
DQo+ID4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lz
c3Vlcy83MDMyDQo+ID4gPiBGaXhlczogYmI2M2U3MjU3ZTYzICgiZHJtL3hlOiBBdm9pZCB0b2dn
bGluZyBzY2hlZHVsZSBzdGF0ZSB0bw0KPiA+ID4gY2hlY2sNCj4gPiA+IExSQyB0aW1lc3RhbXAg
aW4gVERSIikNCj4gPiA+IFN1Z2dlc3RlZC1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbw0KPiA+
ID4gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgMTEgKysrKysrKystLS0N
Cj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3Vi
bWl0LmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiA+ID4g
aW5kZXggYmU4ZmE3NmJhZjFkLi4wMzExYzg5MTA3ZjkgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiBAQCAtMTMxOSw5ICsxMzE5LDE0IEBAIHN0YXRp
YyBib29sIGNoZWNrX3RpbWVvdXQoc3RydWN0DQo+ID4gPiB4ZV9leGVjX3F1ZXVlDQo+ID4gPiAq
cSwgc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iKQ0KPiA+ID4gwqANCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqBjdHhfdGltZXN0YW1wID0gbG93ZXJfMzJfYml0cyh4ZV9scmNfdGltZXN0YW1wKHEtDQo+
ID4gPiA+bHJjWzBdKSk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGN0eF90aW1lc3RhbXAg
PT0gam9iLT5zYW1wbGVfdGltZXN0YW1wKSB7DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3Rfd2FybihndCwgIkNoZWNrIGpvYiB0aW1lb3V0OiBzZXFubz0ldSwNCj4g
PiA+IGxyY19zZXFubz0ldSwgZ3VjX2lkPSVkLCB0aW1lc3RhbXAgc3R1Y2siLA0KPiA+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX3NjaGVk
X2pvYl9zZXFubyhqb2IpLA0KPiA+ID4geGVfc2NoZWRfam9iX2xyY19zZXFubyhqb2IpLA0KPiA+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHEt
Pmd1Yy0+aWQpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChJU19T
UklPVl9WRihndF90b194ZShndCkpKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9ub3RpY2UoZ3QsICJDaGVjayBqb2IgdGltZW91dDoN
Cj4gPiA+IHNlcW5vPSV1LCBscmNfc2Vxbm89JXUsIGd1Y19pZD0lZCwgdGltZXN0YW1wIHN0dWNr
IiwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX3NjaGVkX2pvYl9zZXFubyhqb2IpLA0KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfam9iX2xyY19zZXFubyhqb2IpLA0KPiA+ID4gcS0NCj4g
PiA+ID4gZ3VjLT5pZCk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWxz
ZQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9ndF93YXJuKGd0LCAiQ2hlY2sgam9iIHRpbWVvdXQ6DQo+ID4gPiBzZXFubz0ldSwNCj4gPiA+
IGxyY19zZXFubz0ldSwgZ3VjX2lkPSVkLCB0aW1lc3RhbXAgc3R1Y2siLA0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB4ZV9zY2hlZF9qb2Jfc2Vxbm8oam9iKSwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRf
am9iX2xyY19zZXFubyhqb2IpLA0KPiA+ID4gcS0NCj4gPiA+ID4gZ3VjLT5pZCk7DQo+ID4gPiDC
oA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4geGVfc2NoZWRf
aW52YWxpZGF0ZV9qb2Ioam9iLCAwKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gDQoN
Cg==
