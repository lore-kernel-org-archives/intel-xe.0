Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0FCEDEBFC
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 23:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF50910E8F0;
	Tue,  3 Mar 2026 23:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxp5t4rl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F1B10E094
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772580536; x=1804116536;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cmxg7aurxwke4Oo+IT3LCkJor5KxpZTndhCz8bOk2qo=;
 b=cxp5t4rlQihab09YFP8qS7G0zsD3yLrsKfoIqqdMRiPomSJyTTvUG2BE
 23DW4CCQilLH6lkSVPBq3y5JrExMFKWrb/THC9HKB+9XsSxRUOI7wIh5x
 mSMYsifJjkyncTJxQEatThtWxvjJKnb9G3hgqohorcB811Sm9CF7rWRrh
 VlZmjK559+UUWu/KKwnHgLO3mwHFZZzqB5UvAHyLmS2FHz/fr4nr3mD7c
 vWImKmqfXP4iWebly3SHjDwSjqRJpl9+Uv1cWPSvpQok+nb0jeL/294w+
 uK8PI+vSEl5m64RJIvHjnIIyLSMG12oGmFqjYcSeDmlCYMmhU+MRRZ7fj A==;
X-CSE-ConnectionGUID: pSytdklkQz+K0x8wrkibFg==
X-CSE-MsgGUID: LsyQEbd2SNKJna9KxQKwvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="91026841"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="91026841"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:28:56 -0800
X-CSE-ConnectionGUID: jfj2w4ofRyuzuanO+oeZDg==
X-CSE-MsgGUID: vY6gb0Z4RDKaJQtwTjMQjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="256053977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:28:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:28:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 15:28:54 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:28:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUMgeOh+G6etNnz5taBPp52xejeCPAIJGvUdmaGlQKxDCIzh1EYToMl2/J4tdLTk96zVZjK6rm12C5mZ86PPLV1z8jGUZoYE2cly2gQtVHvXntwnh4fqyxjcM2xcviTDcQfGt2pOqFrhMsAxAelBDtZYKJd7YOqUJwJe/MOsC894TfnuxOw7Rd1JTBJDnKd1lq/r7slB6WhZLHwJT6jbctlNfjIWlZNeZeJvI1/vHWcRpEfdAT029/7ifjP/QE+gNvlINIVn3W8wEK6FLSYFFtNdqv6eXTCD25QnmdadFlQOJo1InbTyaBIfZ+6iXkDyFTLudSF/W95aAir/+px+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmxg7aurxwke4Oo+IT3LCkJor5KxpZTndhCz8bOk2qo=;
 b=KVVn9UeaXOCFDiJbpmQctQkdnO7UxgAxv3uZPk6V2IplbRunXb21P6C9lRkLPV16+aXb0OHLuGIIiIzHyvKQjVde/BC9IClSwVfkNqFBF274pGNgUcJJDRmnTP085EsQD9eXCS4fQvcZlc5NEtti8f1GecPMq196TCfLTGLmL0QcZ4bzGI3GaRaX54qxFnZVxMPhwtOAGMbCnYHYBYXgJjWfW3lPmCSo4upttWVPByZ3gvxXbA5l5B/eWqqaWY2H4hTVXmG2krT+s5RRMq829qKN1IsdOf3nnNHdCtmmjn0nC1efpGNBMBnT6Z2WXi/bcirFmpkDtbptq3ZEjo5l3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB4795.namprd11.prod.outlook.com (2603:10b6:806:118::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 23:28:50 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:28:50 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav,
 Arvind" <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 10/25] drm/xe: Update GuC submission backend to run PT
 jobs
Thread-Topic: [PATCH v3 10/25] drm/xe: Update GuC submission backend to run PT
 jobs
Thread-Index: AQHcqFKBNmMXHHoMBEuAmXiXn95e3rWdelKA
Date: Tue, 3 Mar 2026 23:28:50 +0000
Message-ID: <c044f56096bec2616ebcb6d0247a1238d9ef8209.camel@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-11-matthew.brost@intel.com>
In-Reply-To: <20260228013501.106680-11-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB4795:EE_
x-ms-office365-filtering-correlation-id: 807083f0-e903-4c55-8ab5-08de797ca055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: c6iLmRbGtT6er7fk8GTqxOwnhZ1t05dYdRlSTCsht7eetzrmiJq/WWNrSLaqsjLXsO5adLuBhEXgD+ZGov+wzZHOWfO3q/h1HudwQ8p5HCcrOi7WyELQrCZQv6ogApFanJ0S25MrZ912r2H7aik2TmbezjxcVN4jKRTz5GSklpbEEs8r5lSF7/EqmyOXIEq+kdkeVDJ1w/M6GF31YEQ1a9feEeKKGNcTTXz1XI9T2qaWIYCP9EifQci5MknCB39Cq0Jo6lTbaSkgXyrboacnACDQs7s7LWJ9brb5q6H1XBpsg4Svmby78QdBRPTW/uAAC06BQExdz3n+JcifcJtDVl4qZjc3QfkpgzUBK+Z4G5ffN8d2B4LneiiRduvBlEo5Z9dMJv5VlKUmgJ4j/WNlSSFp0M0v8IGFg7YkbIO6l+rLiQoj3sAj4AbuQwTq7OD0MjnczYESoOTvWcJ+DbjUA8Xqu5Bhdlx3pl6mft15L+qiRd5n4eQ+VDvGrBlvEukHwQK9f6kYT18NqnTFeIyHEbBVet8pDwPK2QonU30dV4QZjmAxbE109qt4ROc+ojqq52R7gghOVsSTWuHrtSwtLF7pO8iR22nT0IeXF8mf9esGtLELoSAGw2CHRWEuMemc8omGvK/agI78FRFVtKTVCOyPbB/7Fh+LD27EDYx0X1lvSz6rkwpPxO4gmnzs+YVWE/7XSibKcNBly5JUqZnKJ/5+gwswEGMnXjitCqPLTBKJftjyGXhzWcyJq10GvwFD7LoCPKeA3GC9UUYTIsKjE4M6K+QBhP3n52v6krfNQxw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2xvNE90T1BCcEZDcXpHcWZiV0F4TG94Y0xPSENWem5ubC9aWmYrVG16aXhh?=
 =?utf-8?B?RFR0dHloMXcwNnNGRmJlUTgxNjhvcmV5S3pSUytFdVFTc0pzeTdXWGJHZ3ZF?=
 =?utf-8?B?R1ZjblQvcStzbDRnOThLVjhmMy9JNUl3ZDM4TUgyTWFWOUlCRk54bnhHMHNU?=
 =?utf-8?B?ZXkyMFRzRDQzWlhzQUpJWGFGN3oxZ1RFNml0U0MxbXFoeFY5eGNjdlQwcnFF?=
 =?utf-8?B?ZTMzS1JwM2hSM3liSi9LaTcrM0tIQWtkNFVEZFRWcHZOd2Q5Sm5MZlFiSHds?=
 =?utf-8?B?bE5kcFB1N3M0SWIxbWxZT3NKMHZmMERPaTJRdE92MGUxaUl0OFpkUzZvenN5?=
 =?utf-8?B?NW83RlEzdUQxM2hhVk1pVHFJMjNRbXhVZno5VTQvc0VnbHJ4ZHFSV1Fxb2o4?=
 =?utf-8?B?M2NKd1I0Tk1xcEFEN09zc3J2d1Q5YkdxU0FZazdWb1ZXMUtheUlvNVBsY0xE?=
 =?utf-8?B?d3p3ZmcrVExwaGZmam91YlJJcXl1UkErUTN4UEwzRFFJaGlaTjVPaHV0S3Vp?=
 =?utf-8?B?K21vRlhqWmYvOWxFZUc2WHNQSUNvZncrK0MvV3RLUWw4V0d0blVYSllmU2Y0?=
 =?utf-8?B?TmhJeUU1Y2pQWnpXUWdNWTNEMFViNGtTY0k3OXlCazBlRFdmUkdSdUhVSmdK?=
 =?utf-8?B?Z2RPM2xIc0JVM01OZ09LeDF1WWxQQldJbEVyU2xQVG9XUFlIcWROWGNtL3Bo?=
 =?utf-8?B?WW5IMk83L1lkVUlpNlM2SCtEaTNRSlFyb1dYU3k3ekZwOS9veDdESVE5N1dR?=
 =?utf-8?B?K2FnRmJYdTJJOW9SNGllc1B6eFBvYkJjS3lHWHQ3SGFIckdib2tlODdJSG5L?=
 =?utf-8?B?dU1nd3ZnWFdUZ1RMbE5qSGNCNFd6UWYwQjcwVEhaUDZsZTdXWUV0L1AxMUxa?=
 =?utf-8?B?SWJ1QmdTS1RpVlAxYU9Tb01iVERrSGgyT2pQeGo1cnQxQ2s1VlBWQm5rYk03?=
 =?utf-8?B?UGdpbWM1TEhoaC9lR2ZiTDdoa1drSjNSR0JUWjZPRDQ2WmhoWTVnZHVXcWVm?=
 =?utf-8?B?cEh3K2RwWlU5L3dHbVJpUm5hSFF4eUZPd1NpR3VzbmcwK1FtcnRwVXpLSUMz?=
 =?utf-8?B?am9Gano3QTA4bVJmYmxPOURtU3BwSVFTOUNURG9ubnVxUUlKejlrdUU1MWdF?=
 =?utf-8?B?TjZOdW1yS1BPNkNEMGk5TVhoVkVrb241RUw5aU1LUU1PbU5WcExmb25IamJZ?=
 =?utf-8?B?bjV5QzVPN0xaOVZZMUYzWVNZbnVuWnlDVHFLSy91ZG1DWThrbHNDamY3T0Zm?=
 =?utf-8?B?MHBsR0FpUlRqUWpBR2Vhb3JlWDZBVDJHd3dtSU40bU10dkhOSWllVU91T3Zx?=
 =?utf-8?B?UXhsVU1JRXpIYkhzaDRvRmVVWEdPanJWNUM3bURWcndSOXNsMWpST2JJVHQ5?=
 =?utf-8?B?NDEzZFdBWFVqTEFpNkZKbWQrVmVRTlNNUmhzVWVFRWhKdnVHbmVmR2ZWS0xO?=
 =?utf-8?B?UWRHaGNlZ0lEYVNlb3FFd2pRcVE2MlQ5QXd4NGhzUEtwdTEvY3o1aGtNVHNG?=
 =?utf-8?B?ZFp5YnhmM2Fqa04wOGpZZ3ptWmNMNmJ2SjZKLzhFaTlkMmowTGJPdysyQVkr?=
 =?utf-8?B?MTIyTi8renFwWm1DVzdjcGxnMUkycE5mUTNlcVRRdU9JSVF6OHk5MXhDUWlh?=
 =?utf-8?B?cUdiMGlKN2F1bVBYSkJrK0dVS3k2ZnVCVkJrOTZ3OE8zS3lBMFMrQkhGNDJr?=
 =?utf-8?B?Tmp4K0NMMFRLNVN0TEs2ZXdVUmQ2NHkrcWMvUEp4V1dtRnpJaTY3YldMcHV6?=
 =?utf-8?B?VlJQZ2hOOHVJbkUvSk9Zb1pTWmowVHdVaW92RS9lYXA5cnB4QWVxdmRhTm8y?=
 =?utf-8?B?RVBEdXc1aTBlWHJpd0tSM3Y3c2FiQ2pnWFo4R2FnZ2wvRXo5alhyWHhNQWdY?=
 =?utf-8?B?TVZrVW9tSmhEeERaWmducmFQVkY1YkNZRFEvTzhkMnRXem5iMjc5dUt1SUJZ?=
 =?utf-8?B?c1lOVTYyNjZrdkFjMUtSQTNscDB0Q1dtWnhTbTdycElyelAzbFE4OElLamtw?=
 =?utf-8?B?WkhmaHRKMHpoR3k2QnRlMGlDK3Rld3p0VzlLdmhWR25yQ3NWMlFXMUU2Mmp2?=
 =?utf-8?B?U3hIdkdPSzhnU2x6aHVlU04rbDJDVVI5ZGc3OFBza1ppWGNOUWMrdy9YWHlV?=
 =?utf-8?B?WS9UWE9SOXFZaGNidlNCcXIvTFo1TmpURG1iOE5jdnM5aS9qU3FDWlNkL05v?=
 =?utf-8?B?bi84dUwvN3o5eGtUNFNOZU5jczd1S0hzZmVsMkVZY3B2R3VKaWc0S2Exb0pD?=
 =?utf-8?B?NHFVUHlkU29Pc1BINFpZVHY4MTgyeUhHNEZHMXlEK2dnUzBVazZwbXJTaXov?=
 =?utf-8?B?U3FnMGFDTG5DN2l4OXlzMDRKZFBMV1c2QXp2Rmc1bXpMSW5hUUxTcHJ4cHJR?=
 =?utf-8?Q?5X+528Y6CLvH4tAE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E569CEE1BED6148A534B778E3D0B53F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807083f0-e903-4c55-8ab5-08de797ca055
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 23:28:50.5590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4eGc/gOgP3ijFeDj/d/dvoPMBRftJf5ZVBJQpPf89p8shvcysvgS1IY3OcSomWeJasQLVc3gP82AAr+oy1ao9+bGuWLQ1rSoXCpmRc6Prs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4795
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

T24gRnJpLCAyMDI2LTAyLTI3IGF0IDE3OjM0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFBUIGpvYnMgYnlwYXNzIEdQVSBleGVjdXRpb24gZm9yIHRoZSBmaW5hbCBzdGVwIG9mIGEgYmlu
ZCBqb2IsIHVzaW5nCj4gdGhlCj4gQ1BVIHRvIHByb2dyYW0gdGhlIHJlcXVpcmVkIHBhZ2UgdGFi
bGVzLiBUZWFjaCB0aGUgR3VDIHN1Ym1pc3Npb24KPiBiYWNrZW5kCj4gaG93IHRvIGV4ZWN1dGUg
dGhlc2Ugam9icy4KPiAKPiBQVCBqb2Igc3VibWlzc2lvbiBpcyBpbXBsZW1lbnRlZCBpbiB0aGUg
R3VDIGJhY2tlbmQgZm9yIHNpbXBsaWNpdHkuIEEKPiBmb2xsb3ctdXAgcGF0Y2ggY291bGQgaW50
cm9kdWNlIGEgZGVkaWNhdGVkIGJhY2tlbmQgZm9yIFBUIGpvYnMuCgpTdGlsbCBsb29raW5nIHRo
cm91Z2ggdGhlIHdob2xlIHNlcmllcywgYnV0IHN0YW5kaW5nIGFsb25lLCB0aGlzIHBhdGNoCmRv
ZXNuJ3QgZmVlbCByaWdodCB0byBtZS4gSSBkb24ndCBzZWUgd2h5IHdlJ2Qgd2FudCB0byBob29r
IHRvZ2V0aGVyCnRoZSBQVCB1cGRhdGUgZmxvdyB3aXRoIHRoZSBHdUMgYmFja2VuZC4uLgoKVGhh
bmtzLApTdHVhcnQKCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1p
dC5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+IC0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jwqDCoMKgIHwgMTMgKysrKysrKysrKy0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9taWdyYXRlLmjCoMKgwqAgfMKgIDggKysrKysrKwo+IMKgMyBmaWxlcyBj
aGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX3N1Ym1pdC5jCj4gaW5kZXggNDUzYWY1MWZlODdiLi4xZDZhYzdhNjU2M2IgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiBAQCAtMzYsOCArMzYsMTAgQEAKPiDC
oCNpbmNsdWRlICJ4ZV9scmMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9tYWNyb3MuaCIKPiDCoCNpbmNs
dWRlICJ4ZV9tYXAuaCIKPiArI2luY2x1ZGUgInhlX21pZ3JhdGUuaCIKPiDCoCNpbmNsdWRlICJ4
ZV9tb2NzLmgiCj4gwqAjaW5jbHVkZSAieGVfcG0uaCIKPiArI2luY2x1ZGUgInhlX3B0LmgiCj4g
wqAjaW5jbHVkZSAieGVfcmluZ19vcHNfdHlwZXMuaCIKPiDCoCNpbmNsdWRlICJ4ZV9zY2hlZF9q
b2IuaCIKPiDCoCNpbmNsdWRlICJ4ZV9zbGVlcC5oIgo+IEBAIC0xMTgzLDYgKzExODUsMjAgQEAg
c3RhdGljIHZvaWQgc3VibWl0X2V4ZWNfcXVldWUoc3RydWN0Cj4geGVfZXhlY19xdWV1ZSAqcSwg
c3RydWN0IHhlX3NjaGVkX2pvYiAqam9iKQo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqB9Cj4gwqAK
PiArc3RhdGljIGJvb2wgaXNfcHRfam9iKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYikKPiArewo+
ICvCoMKgwqDCoMKgwqDCoHJldHVybiBqb2ItPmlzX3B0X2pvYjsKPiArfQo+ICsKPiArc3RhdGlj
IHZvaWQgcnVuX3B0X2pvYihzdHJ1Y3QgeGVfc2NoZWRfam9iICpqb2IpCj4gK3sKPiArwqDCoMKg
wqDCoMKgwqB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlc19jcHVfZXhlY3V0ZShqb2ItPnB0X3Vw
ZGF0ZVswXS52bSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGpvYi0KPiA+
cHRfdXBkYXRlWzBdLnRpbGUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBq
b2ItPnB0X3VwZGF0ZVswXS5vcHMsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBqb2ItCj4gPnB0X3VwZGF0ZVswXS5wdF9qb2Jfb3BzLT5vcHMsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBqb2ItCj4gPnB0X3VwZGF0ZVswXS5wdF9qb2Jfb3BzLT5jdXJy
ZW50X29wKTsKPiArfQo+ICsKPiDCoHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICoKPiDCoGd1Y19l
eGVjX3F1ZXVlX3J1bl9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2IgKmRybV9qb2IpCj4gwqB7Cj4g
QEAgLTEyMTAsMTQgKzEyMjYsMjUgQEAgZ3VjX2V4ZWNfcXVldWVfcnVuX2pvYihzdHJ1Y3QgZHJt
X3NjaGVkX2pvYgo+ICpkcm1fam9iKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWdpc3Rlcl9leGVjX3F1ZXVlKHByaW1h
cnksCj4gR1VDX0NPTlRFWFRfTk9STUFMKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0KPiDCoAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWV4ZWNfcXVl
dWVfcmVnaXN0ZXJlZChxKSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJlZ2lzdGVyX2V4ZWNfcXVldWUocSwgR1VDX0NPTlRFWFRfTk9STUFMKTsKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFqb2ItPnJlc3RvcmVfcmVwbGF5KQo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcS0+cmluZ19v
cHMtPmVtaXRfam9iKGpvYik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN1Ym1p
dF9leGVjX3F1ZXVlKHEsIGpvYik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
IChpc19wdF9qb2Ioam9iKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgeGVfZ3RfYXNzZXJ0KGd1Y190b19ndChndWMpLAo+ICFleGVjX3F1ZXVlX3Jl
Z2lzdGVyZWQocSkpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcnVuX3B0X2pvYihqb2IpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9
IGVsc2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKCFleGVjX3F1ZXVlX3JlZ2lzdGVyZWQocSkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnaXN0ZXJfZXhlY19xdWV1
ZShxLAo+IEdVQ19DT05URVhUX05PUk1BTCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWpvYi0+cmVzdG9yZV9yZXBsYXkpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcS0+
cmluZ19vcHMtPmVtaXRfam9iKGpvYik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzdWJtaXRfZXhlY19xdWV1ZShxLCBqb2IpOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBq
b2ItPnJlc3RvcmVfcmVwbGF5ID0gZmFsc2U7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+ICvC
oMKgwqDCoMKgwqDCoGlmIChpc19wdF9qb2Ioam9iKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB4ZV9wdF9qb2Jfb3BzX3B1dChqb2ItPnB0X3VwZGF0ZVswXS5wdF9qb2Jfb3Bz
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2ZlbmNlX3B1dChqb2ItPmZl
bmNlKTvCoMKgwqDCoMKgwqAvKiBEcm9wIHJlZiBmcm9tCj4geGVfc2NoZWRfam9iX2FybSAqLwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gTlVMTDsKPiArwqDCoMKgwqDC
oMKgwqB9Cj4gKwo+IMKgcnVuX2pvYl9vdXQ6Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IGpvYi0+ZmVuY2U7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRl
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiBpbmRleCBjZDY4MDI2NDJl
ZjMuLmU5YjlkZmUxOWU0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWln
cmF0ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IEBAIC0xNzE1
LDcgKzE3MTUsMTggQEAgc3RydWN0IG1pZ3JhdGVfdGVzdF9wYXJhbXMgewo+IMKgwqDCoMKgwqDC
oMKgwqBjb250YWluZXJfb2YoX3ByaXYsIHN0cnVjdCBtaWdyYXRlX3Rlc3RfcGFyYW1zLCBiYXNl
KQo+IMKgI2VuZGlmCj4gwqAKPiAtc3RhdGljIHZvaWQKPiArLyoqCj4gKyAqIHhlX21pZ3JhdGVf
dXBkYXRlX3BndGFibGVzX2NwdV9leGVjdXRlKCkgLSBVcGRhdGUgYSBWTSdzIFBURXMgdmlhCj4g
dGhlIENQVQo+ICsgKiBAdm06IFRoZSBWTSBiZWluZyB1cGRhdGVkCj4gKyAqIEB0aWxlOiBUaGUg
dGlsZSBiZWluZyB1cGRhdGVkCj4gKyAqIEBvcHM6IFRoZSBtaWdyYXRlIFBUIHVwZGF0ZSBvcHMK
PiArICogQHB0X29wczogVGhlIFZNIFBUIHVwZGF0ZSBvcHMKPiArICogQG51bV9vcHM6IFRoZSBu
dW1iZXIgb2YgVGhlIFZNIFBUIHVwZGF0ZSBvcHMKPiArICoKPiArICogRXhlY3V0ZSB0aGUgVk0g
UFQgdXBkYXRlIG9wcyBhcnJheSB3aGljaCByZXN1bHRzIGluIGEgVk0ncyBQVEVzCj4gYmVpbmcg
dXBkYXRlZAo+ICsgKiB2aWEgdGhlIENQVS4KPiArICovCj4gK3ZvaWQKPiDCoHhlX21pZ3JhdGVf
dXBkYXRlX3BndGFibGVzX2NwdV9leGVjdXRlKHN0cnVjdCB4ZV92bSAqdm0sIHN0cnVjdAo+IHhl
X3RpbGUgKnRpbGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QKPiB4ZV9taWdy
YXRlX3B0X3VwZGF0ZV9vcHMgKm9wcywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV92
bV9wZ3RhYmxlX3VwZGF0ZV9vcAo+ICpwdF9vcCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21pZ3JhdGUuaAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuaAo+
IGluZGV4IGMzYzA3NDBmOTA4ZC4uMzBjOWM5OTBhOGIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9taWdyYXRlLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWln
cmF0ZS5oCj4gQEAgLTI0LDYgKzI0LDcgQEAgc3RydWN0IHhlX3B0Owo+IMKgc3RydWN0IHhlX3Rp
bGU7Cj4gwqBzdHJ1Y3QgeGVfdm07Cj4gwqBzdHJ1Y3QgeGVfdm1fcGd0YWJsZV91cGRhdGU7Cj4g
K3N0cnVjdCB4ZV92bV9wZ3RhYmxlX3VwZGF0ZV9vcDsKPiDCoHN0cnVjdCB4ZV92bWE7Cj4gwqAK
PiDCoGVudW0geGVfc3Jpb3ZfdmZfY2NzX3J3X2N0eHM7Cj4gQEAgLTE1Nyw2ICsxNTgsMTMgQEAg
c3RydWN0IGRtYV9mZW5jZSAqeGVfbWlncmF0ZV9jbGVhcihzdHJ1Y3QKPiB4ZV9taWdyYXRlICpt
LAo+IMKgCj4gwqBzdHJ1Y3QgeGVfdm0gKnhlX21pZ3JhdGVfZ2V0X3ZtKHN0cnVjdCB4ZV9taWdy
YXRlICptKTsKPiDCoAo+ICsKPiArdm9pZAo+ICt4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlc19j
cHVfZXhlY3V0ZShzdHJ1Y3QgeGVfdm0gKnZtLCBzdHJ1Y3QKPiB4ZV90aWxlICp0aWxlLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QKPiB4ZV9taWdyYXRlX3B0X3VwZGF0ZV9vcHMg
Km9wcywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX3ZtX3BndGFibGVfdXBkYXRlX29w
Cj4gKnB0X29wLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgbnVtX29wcyk7Cj4gKwo+IMKgc3Ry
dWN0IGRtYV9mZW5jZSAqCj4gwqB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyhzdHJ1Y3QgeGVf
bWlncmF0ZSAqbSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCB4ZV9taWdyYXRlX3B0X3VwZGF0ZSAqcHRfdXBkYXRlKTsKCg==
