Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384F5C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED08D10E82C;
	Tue, 21 Jul 2026 09:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQ9aI5l/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A05B10E815;
 Tue, 21 Jul 2026 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784624862; x=1816160862;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SjrkS/zlV7fD/0/VaDtG+GqVFakmPVwIWiehVs/0mDU=;
 b=nQ9aI5l/6sAk8SOkB6DWB7YbAdRrHozF1sX3yqB+yV6k0tDC3GQxgnXO
 zeOK7y+oFi6iLy+I6L58I+zMzSwpzstBA1gnsTYtPehFgDcSXNAeBYdVK
 M610ZKhHu15rYBDv9EDlBL/AnEwH8sbFbqKuBcUkeM6g7wu3d6xTKH+yW
 df75EAiA3d+vka3osIePTDzX3uRQ+RCZg0UQwKTjUTm5rmh18r1uu16M/
 k4R/VzG6nDfLWFsJZDCmdGkjrFBLnW4CqdwdAjkf6F2gwu8Qpht8wI2qU
 isQWnyNAjMsO8tVu0MVBmtTg/qhkUG7UUdsc3c2OU18sAZWwq11umS27F g==;
X-CSE-ConnectionGUID: FSNmEgwPQu6kHAY6xe9ZmA==
X-CSE-MsgGUID: X/Lo/gLoRhCO+u/+Edr+UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="108006692"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="108006692"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:07:41 -0700
X-CSE-ConnectionGUID: 77bXHMPxRu+GHyw3q6fEVg==
X-CSE-MsgGUID: 52fQu0nDSlGHO79TVQSI9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="261981468"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:07:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:07:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:07:40 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:07:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a44U7N9fn8Jv5hHcnhD/DgTLDcg6JCyX+z/18j/tXNSxz8HRkmOy94grrah+lGgd93b3YszufmdMSbK76tC10aJoupTY7Ff+7JCuBobzn8n8+kEVfQtedysXptBE/VX/qTL+gd8ldIrYHQMh+P7RZmNCZvP/ruCZW7ABkM0hKhITM957KdygmQD2FYs0DWgcE4FlW7L4tHiNOC9sAP3LD6Kdbig/Vk9h/t/iWzyPKgGJKyxvScFOgV9zgRTysKK2eCh1Uw5hN3VZJ8eqPTsB7FXSc3w+JGUv90sRS4qcINzrpvoPFyT2dcAFM15QQezphjFyqTG5rEf5Psyzi9yhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjrkS/zlV7fD/0/VaDtG+GqVFakmPVwIWiehVs/0mDU=;
 b=MkQ9g4qC6ZCE00QQfUuQLxYJHnoWBMMP21mtNNfIjDtfu0rIjy9tuW8QtgpDBGfGx7nwdLq0GQgIeCev9p9usGraDqvG3riyeVYQuIDukOg8fagZiZ2cbIH4hiDJK/6jHbb+M8PzI9x0f6cXzbFTCQkAEIoGvUVs2qty3uGdTFm/iyeasg93gWrVhVjvis9/Z+JaY8aUV8CUAOKvgcgQY2PHXpeSU6MCxc6oqtZ7plDIKDnSC2RPL7rE92+oth8A8x/DhLv/vWvklMYg5YY43wfnRMpyoasVVBKEjYunLplOsa/rndelVNcx+sRNteIIGoR01xaeRVEQPsrypMV9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CHAPR11MB9654.namprd11.prod.outlook.com (2603:10b6:610:302::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:07:33 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 09:07:33 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe/display: Expose plane max width/height helpers
 to global scope
Thread-Topic: [PATCH 1/4] drm/xe/display: Expose plane max width/height
 helpers to global scope
Thread-Index: AQHdFXb9KfQSdKDstUeHK3VijmvBULZ3tcsA
Date: Tue, 21 Jul 2026 09:07:33 +0000
Message-ID: <605bba7a65760309d729b0b3fcd2475369b4758b.camel@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
 <20260716225956.555995-2-vinod.govindapillai@intel.com>
In-Reply-To: <20260716225956.555995-2-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CHAPR11MB9654:EE_
x-ms-office365-filtering-correlation-id: 9029d99a-7173-4b00-1996-08dee707802b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|10070799003|376014|366016|10067099003|3023799007|4143699003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: faHbt9f6TlvLfsLeLNobcn8/z2ckVJ82SL+PrKYAT+vP3zOrtiQPt6B5z0p3S/qcW3Y3aF6E3YK43CQnC0/IHnmE0/BVQYpL5l7MsBPHbggdz1UsYS6EahmZqjRiMIpjmgYOAAw9+rrOkCB0g0WdR1+JBqo39IGi50PU4dYm6nNuUY1pXL7FnyH5yRPhcVp9r7rVARKu7xQzeUR1XgaRCv+8hoRedeCsu0Cy2Vsj5f/7/8zKjkoaa2zvOk6OyjDVoenf1UkXXo1MCljoGSgYBs9LZhl970l6kOEOHQW0hvTFZsvx3FGVwcQVHkydCYPrWbaf3zOkMHqeIQRRFvJTCynEE0sF1BP8uPxmp1sl1YMZ83U9djqcTuWb85drii7f+uZdZ8UEtnSSSzAqRrcdx8LTeN6XpX8oGUF1yJqdefRXOC+TQyL5JGAyQybbtOKuXKZzxRKt4v7T8HreYItA/+lMn9s0S4kTNut23k81v+YzmOJSjErFYRN9Ktcs8fS83YyPgOyF7RrweFQ6CPEx15jj9UBXPFwefkegcIG3b2v+yXQWMArFVg+J/YwPWjzt4CDwIAjtT8ne0CoYnuvXyin6aqnbCH9+8oBsXvuR6hKs53GmC8vHJUiV9Ib3InAqyKfP574e5gxgUoDKRi2920MaxhgWT0tYOiUm+zq9zS86dP4PKpXdaQqWF/lbCUyIsyzTobSevE9BXQgLFQRJSDxSLYWR2ntqfMCb3tbCLtQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHBDV1Y0RnFGYVI2bDBlYTlabUlLdlI5NWxvVFFTWmxITmJ0V0RsQWVqbjQr?=
 =?utf-8?B?YlBMbjhuSDIyYW5LVXZYVTh0OHlvdC9HeEVsQkZzNWJPUXEzMm1IZ1YwczEz?=
 =?utf-8?B?QnNoYWh0Q00xbzEwdDF5c3FjVHRHMHRjZzBnMlhIdXhUMGhrUjFVbUI3MnhR?=
 =?utf-8?B?ZlA3QU84Tkl6N2NwK3NDVWgra09zWk9tT2pNNmJkc0pYV0lqS01SYmt6Nk9a?=
 =?utf-8?B?cVNqa09xRlVzQ0QvbEFKeU9OU3hFQk52VXFzREI2V0dvTHg3d2xNRVQ0aE0w?=
 =?utf-8?B?WGQ0ZnV1YUVqeHlpTjdpUnIrYVhsM0VsY2dGZ3Q0c0ZZRDVEdUxUNkUwZW54?=
 =?utf-8?B?dXRVNjFhMGlxYUhKclJyS2g5cExDRWU5UXVJNGtYVzZPcmlpbGNsZi9VdjhP?=
 =?utf-8?B?aWtzVTBxR1ZOMlQxM3BRNlgrRkNMUmZWcCtRTGoveGtqTEhqeTl0aWl5TWpm?=
 =?utf-8?B?NlBGcHB0aDJZcnRKdVUwNmRoVjd2ZlRGUkFOQnRNZHg1MVVhN3VuYU5lWEp0?=
 =?utf-8?B?SWFFWUNvaFRnTTdqNXVJb0RNWW44cVFUWlZXNWZ5QXpRS0dTUjdtTjI0SDVB?=
 =?utf-8?B?TGw4RDQybkFVb1p6bmtRWkswQVY5elI1N204ZmlYTGs5K1NEUE1XVmZBNllO?=
 =?utf-8?B?OXdJVXBhNFhhYVI0NGUwWWw1QUNndjUwZ29iL3BwNW1WNVZwRGQrdFMzUUx5?=
 =?utf-8?B?RGFTQ2JYeFJzZzgzSDdoc25HWTlUYi9UbjV2VSswMFYyRDU1d05MalN6VEdN?=
 =?utf-8?B?c0U4V3RMYndOTXhJRnUyS3NrRGF6Zit1VWNtRDczZkZ3WFZPMS9ob09OS2Rk?=
 =?utf-8?B?czlwZ3MwL3RlK0V1eklwZ3BjUi9pY2hCRDVmalROelIwUmk4TVMxSFd4dFZm?=
 =?utf-8?B?ZlpaT2J0WmN4TWZxUUdpZjV4RjJydEdYMjR6NmRQeDhkRFlCYjAxMEM4WEJQ?=
 =?utf-8?B?WEh5QmduVVRCVEwwR1NDcjFzQzhLTUhtbXhGd0JLN08wWUFyZmtyVmhYVUp1?=
 =?utf-8?B?ZGEyQk5mWGNOQmZwc21nRitPT1c0V1lBUlRFSGtzY0xacVRMMVRKcmF2NlpD?=
 =?utf-8?B?eXRoaVZXQW1mdGJwMGF3ejRPU1lWNllCSmZPVmM4NXkwNW9iSldUd0kxN2FU?=
 =?utf-8?B?THhEOVMzdHVHME9Xb0FFdjY0WTdzdHlkV1pENk9NdFNRYzl2OG00T3dHZisx?=
 =?utf-8?B?elNnWFAxdWlGOFNmSXNIY2trSFVPWkIzblpaU2dxeG4vQTYvRGxCdlBvQXlY?=
 =?utf-8?B?d1hNTlpranZNUThMNHNvcXhhTUNjRGtGYmRwOGFtWjN3TTRLZlJvb0pZS2NX?=
 =?utf-8?B?YVA1WmkyWmJEdG8xa2trVk5TaWFEQUdIQjBYMXpuWWZFSUxCRUlsdW5PY25U?=
 =?utf-8?B?RTE3eEV5TGFIUXRYcWpzdXZCajUwTEdSWkszc0l0YUVOUlJHeFA0NlhKMWRz?=
 =?utf-8?B?cFpQS0xOdmVpdVRudWVGTlpqVWxzN2Fkb1Rxd0dVc2xJaEFZUGRNcHdBWk5y?=
 =?utf-8?B?MFBvMS9tUHFYR3dDTFByTFE2VEFKRXRobUh5RS9DZnBnNndIc2Rkcy82OHNT?=
 =?utf-8?B?S2VVcFYybWZBeGdBdXNSd3RKRmpBdlk1VGhHcGo1ekI1dVpiekZ4bDZmSDVD?=
 =?utf-8?B?cVI3VXgxZlg1bkVvTXNpbGo4eVVUVncxUmxtL1VFVXRxY2sremNJSTJZb1dF?=
 =?utf-8?B?dFBzRG9HWCtCT1ZCTzRUU3RmWjl0dmVqamlwQVluVTlpT2pGSkJ1Z2Q4WW9E?=
 =?utf-8?B?VzJHeU4yVWVOWHhXdTVnYVpiOWlBcnVCbzdWSnpuMFl5U1FJbENGMlYvRy9S?=
 =?utf-8?B?dk9xN2hBcTlBVFFZY3ZIZC82WTRET1ZHTHdMdXYxNU5zZnVXY3kxMlV5ckpj?=
 =?utf-8?B?KzIwUk1Iclp5RTgrNnhvcWMxUm5HaUZ0TzRZT291bVZHODZnQWxaVFU0M3Nx?=
 =?utf-8?B?NTFVdHY2QXozd1dVbGd6bFVzR3VNUFdZZ0Z3S0xQZ3doSit4c3pLN3BaSTU0?=
 =?utf-8?B?RTBGeXNpb0VPMGtQNmZaaHFJdkRiMWhHS0ttazU3Qk9kUDVjbWNNQkdWRXN2?=
 =?utf-8?B?ODhOOWdaaUY4RjJxTkJPMVRmdnN3Y0hVaEtFNThMb204aER4SnFsd3hmeEpP?=
 =?utf-8?B?dG8zend3OVJ2T2MwQUl4b3B3cXZ3QlB4Z3pSQys1WjcyU0w0VU5Jd2NnWWhQ?=
 =?utf-8?B?QUk5WDU2cU5FWWpCZmQyRXhxeWhvbXdFa0RmeURTbG1MOXpmTVhWQVBadk5D?=
 =?utf-8?B?TUN3c0t6Vm85VjV1a0Z5ZlB2aUlXdFk5WllrelJPRWErVFhRblFUdHE2U1Z5?=
 =?utf-8?B?NW1MeC96OTBXUzc3bkJzeDE4eDNsdS9iREVLc3E4Wk53UmU1RWxFZC9ZYklm?=
 =?utf-8?Q?5xJfHyaisPtSZaWXk/aoMdVNhha/Wex36uABqHrJLPr+G?=
x-ms-exchange-antispam-messagedata-1: B9fHoDhyeIM/gLMnBQrfJ1RddpLNmI/0nfQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D255668120DD44282477E31DAADD94D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: f6AtBzchyBw/G4jeXC278tK+m8PQ6Dtv1Zkh89TeeSxPnSlIOGQieMtbKZd1hdsNE7mUXLzjr3w2ZvFvoY4g8vRtufFS55YrOomDdJRboR6OekkOdvP8k5jH6djDfQLu3JFdiE3bJpc8GZheWB3dcu0ppKMWAZ7jSCXK4dsnOmTw8bvIFf5sZutUV/kR5TWIWyxVgdPWXGF/MFnham5r4pZWMOTOlUXjPEguDMBwL3KMAWouVgvwQ/VHM1AhDKHiYzgDSsm/h5O1Y/rIv02wAtYIe0HSxE3hM0GU/hI/aJ49x08atRmDw2wmaVmd87CCOkKfuN1wMjpzRetsRjOeCQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9029d99a-7173-4b00-1996-08dee707802b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 09:07:33.3647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eKDBBcufrA9RuBGdLeGskK/ELNrG1R4QlJ8pWSH8LRh7JHVlDreNO/0h1LHDjKTgy1oLyDsfGgC7FRAreOpH8WwfAtiFTTBLLKnEXMw4OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9654
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

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDAxOjU5ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBFbmFibGluZyBmZWF0dXJlcyBsaWtlIEZCQyBvbiBwbGF0Zm9ybXMgbWF5IGRlcGVu
ZCBvbiBhIHBsYW5lJ3MNCj4gbWF4aW11bSBzdXBwb3J0ZWQgcmVzb2x1dGlvbnMgb3Igc29tZSBv
dGhlciBhcmJpdHJhcnkgY29uc3RhbnQNCj4gdmFsdWVzIGJlY2F1c2Ugb2YgaHcgcmVzdHJpY3Rp
b25zLiBDdXJyZW50bHkgdGhlIGhlbHBlcnMgdGhhdA0KPiByZXBvcnQgYSBwbGFuZSdzIG1heCB3
aWR0aCBhbmQgaGVpZ2h0IGFyZSBwcml2YXRlIHRvIHNrbF9wbGFuZQ0KPiAvIHNrbF91bml2ZXJz
YWxfcGxhbmUuIENoYW5nZSB0aGUgc2NvcGUgdG8gZ29sYmFsIHNvIHRoYXQNCj4gdGhpcyBjYW4g
YmUgcXVlcmllZCBmcm9tIG90aGVyIGFyZWFzIGFzIHdlbGwuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0K
DQo+IC0tLQ0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5l
LmPCoMKgIHwgMTYgKysrKysrKystLS0tLS0NCj4gLS0NCj4gwqAuLi4vZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5owqDCoCB8wqAgOSArKysrKysrKysNCj4gwqAyIGZp
bGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5l
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUu
Yw0KPiBpbmRleCAxNjRiN2Q2MWM5YTMuLjc3ZDMzMDEyYmRkZSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gQEAg
LTE5MzIsMTAgKzE5MzIsMTAgQEAgc3RhdGljIGludCBpbnRlbF9wbGFuZV9taW5faGVpZ2h0KHN0
cnVjdA0KPiBpbnRlbF9wbGFuZSAqcGxhbmUsDQo+IMKgCXJldHVybiAxOw0KPiDCoH0NCj4gwqAN
Cj4gLXN0YXRpYyBpbnQgaW50ZWxfcGxhbmVfbWF4X3dpZHRoKHN0cnVjdCBpbnRlbF9wbGFuZSAq
cGxhbmUsDQo+IC0JCQkJIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiAtCQkJ
CSBpbnQgY29sb3JfcGxhbmUsDQo+IC0JCQkJIHVuc2lnbmVkIGludCByb3RhdGlvbikNCj4gK2lu
dCBpbnRlbF9wbGFuZV9tYXhfd2lkdGgoc3RydWN0IGludGVsX3BsYW5lICpwbGFuZSwNCj4gKwkJ
CcKgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiArCQkJwqAgaW50IGNvbG9y
X3BsYW5lLA0KPiArCQkJwqAgdW5zaWduZWQgaW50IHJvdGF0aW9uKQ0KPiDCoHsNCj4gwqAJaWYg
KHBsYW5lLT5tYXhfd2lkdGgpDQo+IMKgCQlyZXR1cm4gcGxhbmUtPm1heF93aWR0aChmYiwgY29s
b3JfcGxhbmUsIHJvdGF0aW9uKTsNCj4gQEAgLTE5NDMsMTAgKzE5NDMsMTAgQEAgc3RhdGljIGlu
dCBpbnRlbF9wbGFuZV9tYXhfd2lkdGgoc3RydWN0DQo+IGludGVsX3BsYW5lICpwbGFuZSwNCj4g
wqAJCXJldHVybiBJTlRfTUFYOw0KPiDCoH0NCj4gwqANCj4gLXN0YXRpYyBpbnQgaW50ZWxfcGxh
bmVfbWF4X2hlaWdodChzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lLA0KPiAtCQkJCcKgIGNvbnN0
IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPiAtCQkJCcKgIGludCBjb2xvcl9wbGFuZSwN
Cj4gLQkJCQnCoCB1bnNpZ25lZCBpbnQgcm90YXRpb24pDQo+ICtpbnQgaW50ZWxfcGxhbmVfbWF4
X2hlaWdodChzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lLA0KPiArCQkJwqDCoCBjb25zdCBzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCcKgwqAgaW50IGNvbG9yX3BsYW5lLA0KPiAr
CQkJwqDCoCB1bnNpZ25lZCBpbnQgcm90YXRpb24pDQo+IMKgew0KPiDCoAlpZiAocGxhbmUtPm1h
eF9oZWlnaHQpDQo+IMKgCQlyZXR1cm4gcGxhbmUtPm1heF9oZWlnaHQoZmIsIGNvbG9yX3BsYW5l
LCByb3RhdGlvbik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L3NrbF91bml2ZXJzYWxfcGxhbmUuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
c2tsX3VuaXZlcnNhbF9wbGFuZS5oDQo+IGluZGV4IDVlMjQ1MWMyMWVlYi4uZGNmYmRlZDc3M2Ex
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJz
YWxfcGxhbmUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2
ZXJzYWxfcGxhbmUuaA0KPiBAQCAtOCw2ICs4LDcgQEANCj4gwqANCj4gwqAjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4NCj4gwqANCj4gK3N0cnVjdCBkcm1fZnJhbWVidWZmZXI7DQo+IMKgc3RydWN0
IGludGVsX2NydGM7DQo+IMKgc3RydWN0IGludGVsX2Rpc3BsYXk7DQo+IMKgc3RydWN0IGludGVs
X2luaXRpYWxfcGxhbmVfY29uZmlnOw0KPiBAQCAtNDIsNSArNDMsMTMgQEAgYm9vbCBpY2xfaXNf
aGRyX3BsYW5lKHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ICpkaXNwbGF5LCBlbnVtIHBsYW5lX2lk
IHBsYW5lX2lkKTsNCj4gwqANCj4gwqB1MzIgc2tsX3BsYW5lX2F1eF9kaXN0KGNvbnN0IHN0cnVj
dCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUsDQo+IMKgCQnCoMKgwqDCoMKgwqAgaW50
IGNvbG9yX3BsYW5lKTsNCj4gK2ludCBpbnRlbF9wbGFuZV9tYXhfd2lkdGgoc3RydWN0IGludGVs
X3BsYW5lICpwbGFuZSwNCj4gKwkJCcKgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZi
LA0KPiArCQkJwqAgaW50IGNvbG9yX3BsYW5lLA0KPiArCQkJwqAgdW5zaWduZWQgaW50IHJvdGF0
aW9uKTsNCj4gK2ludCBpbnRlbF9wbGFuZV9tYXhfaGVpZ2h0KHN0cnVjdCBpbnRlbF9wbGFuZSAq
cGxhbmUsDQo+ICsJCQnCoCBjb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJ
CcKgIGludCBjb2xvcl9wbGFuZSwNCj4gKwkJCcKgIHVuc2lnbmVkIGludCByb3RhdGlvbik7DQo+
IMKgDQo+IMKgI2VuZGlmDQoNCg==
