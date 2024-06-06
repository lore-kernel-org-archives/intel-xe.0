Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D24AC27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 14:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1165410E122;
	Thu,  6 Jun 2024 14:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHSrBLJR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F274D10E122
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 14:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717683067; x=1749219067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lNJbOdHsMiUUs4y1eXqG3IAsyxRlQNenb8KTvgGgn+I=;
 b=oHSrBLJRGlU1dYycB/d+FJ6ARzxWszsdD6ybSpyCU6Jw6K0Cry9oP7Ms
 LicqKlyjbb1vYs4ydmsBCaMLhr31Sobt8WJf6bw5qRJMokKAQ88DHEyVW
 T4Q5C8t4f14QF/7fXMuCRN71o6ZoLy3shKzZVNa3HJaBvWGa1Kk+IPXnW
 D+R3kh9Embwty7aX9tFIztl7qszmDlnahWKE2bZwsuFuCtLJyE+oUOyeK
 9I6KUgcTBtH2UiRf8E7DDrNKogcAdXr0HW3q9GHyn2iOOetOj6HoulUjX
 dKt3QlspE2gg9UaLwPLBzwmCaXatB0S35H5YAOdnrL0cmFcYqJ/l2TxWl w==;
X-CSE-ConnectionGUID: Rx+EJ6GjR361HKJOqk/syg==
X-CSE-MsgGUID: n4VL0LZXTwmBRM5TYnkpgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14505940"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14505940"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 07:11:07 -0700
X-CSE-ConnectionGUID: DYc5rxZ7TcC0viBFJa0+Bg==
X-CSE-MsgGUID: RKhoy5/1T+6upp4N7LEF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61174970"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 07:11:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 07:11:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 07:11:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 07:11:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 07:11:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlI4KhADDfHGOKrbCKkr2+/wf/9PtOqq+TokmzsY36KEflNiuUqqSNOlZZtjq6Ipmt47a2dUVnikq+i3If069Brtryzuo3nYcBnfJzurPnP6cYd7KdDJHuVpDcDGp0TBJzo7sKjdkPWidqd1pdAQZ7zbHN14suDcCQpzMei4rSE3xDYHKF2qzD3FpNshG1R7vGvFDK509q5axcMTiqIpl2XxvumRgSGiS94G3rP1lmEX8HvIsW/6B6k2j7mlwUZNqxDZzU7gsL2Ja54hls1lnIRCD1Q6A8D/6SXe5eVC+kRM2eSRUbrmasE/FYaHMrErjIQohsgYhWVAwghczrFvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B82DNucy7tbZgveOPzklgkxhNwONzTvIkQgaSCTOeRQ=;
 b=SVJrgp+03b9DfquIhqecBW2ePPJ3XQepKo+WbT0ooxsofoTVQwaZkQdGl5eBrcKm6RCo/TKdGnxtaUR0HJ46GiXn5CkzhdjYxIb26FaYAMk3wSXWJU4RTaIyuosEv1SkIK+/2jJgzpHdILMWtrBeeqOhgwlJTgIV6jyI/Fucq8c4fQRN8JMyfzOOXgE9N4rmEVGsFJxzjZUKGBsIUvW/Gfe87bZEFhSpD0qltRyErDwIMtTlwfP8Xx67ooH9v8wI807JccnqKSI+3BeT7gkDL8sMICcc1NQ6LSUlX34FoGRKunP/sQg1+xDAmAkU8pMw5TCp9Q3EDFtIMouN1qy5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 14:11:02 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 14:11:02 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Thread-Topic: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Thread-Index: AQHat1xc98ApSoJSkkCqes8UMcIlE7G5u3GAgAEJZgA=
Date: Thu, 6 Jun 2024 14:11:02 +0000
Message-ID: <CH0PR11MB54444909E70839CD751A14E6E5FA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
 <ZmDiLcMGBdCcz2Rx@intel.com>
In-Reply-To: <ZmDiLcMGBdCcz2Rx@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5152:EE_
x-ms-office365-filtering-correlation-id: 8d1212fc-ef97-481d-1c5c-08dc86327f53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?dpNT/UZJ/VxbZnlKpVvePIPmhM5BqlzDbRk9LN1mRPEoUJ7uEjHZlAFZHBKr?=
 =?us-ascii?Q?wufRo3P0ah4YUjUXPV4AoGfnZLsnZCXbETR8+v0Nr84WgF2zbLY7c8TtLlpU?=
 =?us-ascii?Q?UXpad6ow6uaQe91zIajs0xnkZOr88FgHzIfBMshqUVR3qENzobuSVbU78KzQ?=
 =?us-ascii?Q?kGWgLTXMFtMuDcdBwsiN1Uju79mu0Gv2svnx0MZTxniFxpLXlbPPM9+kF12k?=
 =?us-ascii?Q?/uI+EmWYy0p6LFBeE74avljof6MDAgPMNA/TzOsa1iuXbCrzBz9wlbZ1BpK0?=
 =?us-ascii?Q?r/HmXzeIv90HPIZR7Qt2FUAGqiR08NYQqhVlfaWXJjUuMjtSRqz+feceGd8a?=
 =?us-ascii?Q?BmmusIgjOvWF/Iy8uIWM+18uyojsV0cL9s/N8AaKOpD9YKxGtlYynJNhGU4d?=
 =?us-ascii?Q?vHItsmOPjPUyGZexTUP9ssg1nUaM6nhH+Q6i0v6hmla4GqwmjZbwLHBJEbhQ?=
 =?us-ascii?Q?oh+c37mO6MaxupEQHDyinHCu/xVgjG5q9R89B+BgzYMIAtpvIX/7pHnO2CVg?=
 =?us-ascii?Q?b3GP2fBb+pcRy1gCHo2eB4hpRjCCkXBDGEtvrAe73vN0gEDPnUd5xz6z80cw?=
 =?us-ascii?Q?W3EE9Hx5d/DvMQ9ugQnNlmDzX5JFTCfHbmcO75wVjswiRNNGk7b0UcwqeLnG?=
 =?us-ascii?Q?FjQX87y/sVmvLEcMXPNY05Ye6Ro6x7nnLA1ttS/vcJOIMaALHaH481BTmRYA?=
 =?us-ascii?Q?+4XmNWPJNUDgGa+Bn/KUBcmVCR7RdcEAWqvswc1vyxAplWGQkbv/NFYHiAXp?=
 =?us-ascii?Q?26Nre90Dakp5r99fe0Y7aBpwyqQXV1Kn1G0bnr8gthSiXBMiw8wXyiRfSxq4?=
 =?us-ascii?Q?vQwgFZfi2XS6jZvvzBAHJhrH0jbIcenoZdyNcxSRvvDMP0vJ6JaWhLCQgZjP?=
 =?us-ascii?Q?9C3vEcATERZEbrbfb6aNSXMK3OxSELTM4s7qmZhClwaU9Id2JiZ2Uqm92EkT?=
 =?us-ascii?Q?zjihSb0VLZADSbaOSdpssLq2Lvt/SnA/3CoqowZ0hmvi8o6Ah5yDbuLoKoUP?=
 =?us-ascii?Q?f+VC8SQQGPt6qGOTBnBo5obPjZmLQLFrKC7pRMjJCQBO8NMteemR/LZ1RRI3?=
 =?us-ascii?Q?mZXD2huTlQ9kFDXopxWaJRXB0CBlnB4YVjH0V7dN8Kp4Ay3Io6pzwegkUdiB?=
 =?us-ascii?Q?p6cBwBqB/uw0T4ojg9psWbaCHDclKTha5SMmSs6MBhZ+cFdtIIvrxb7jrHtQ?=
 =?us-ascii?Q?mkxQmqvKxKUdgXVygjuLOiLT+1/+O0Xq6LhfEnl8G85obgDF2mYuJUU2mDXv?=
 =?us-ascii?Q?Y/WBrbLF4qon0ps4Ip54E+i0mSeQcaYdgtLVLAlbwaUg6mD0F0pvGBCTzEEN?=
 =?us-ascii?Q?hpwA2SReD6pI7FNaVKeX7v6V?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kheR7T5pLDRiVUF0L4ezWCIEAaQ4JmTuIHCgQ4HlsDn7PO0ozqZESz4dcgyE?=
 =?us-ascii?Q?KWnkXugcWMWHySe5lqhJgMew1m9m5NlDbuN7bxs7d8YMBb8isUeVyjutVPvQ?=
 =?us-ascii?Q?d/3IPeuBOaruKwYaU58VH19vmdYoRMRX3tx+F3JtuPbAvQ8KSvXrScXKXmvI?=
 =?us-ascii?Q?/Wu+9i9371Q7P4BGczX2s2iBjGhhHQCrP0XATO0x6TH+mJjMwkMH58WKV7S0?=
 =?us-ascii?Q?RSkHZUG5hSKgGcRff50tS8UbfqBsx/ez08FIt2D2KbKRnByc47qDsj/5u4oG?=
 =?us-ascii?Q?L+hkD+poionN83ej5U1nfl7mTdaPaFlNDwY3PHjYQOyJI9jH500dDEYXhsU4?=
 =?us-ascii?Q?bTPubV0w9PMiEkfjwK+Q745cDi/r5Ly+hZTQmWp2uNwUCsOOfchcv+0HaP5V?=
 =?us-ascii?Q?aQ0REiB5BhZ4j+cqWl+IRaVdIAmDNEn4hB871v80iqkJVP7AqE9BsRQsAymn?=
 =?us-ascii?Q?fjoS4EDt0R78Gjwe05vuonx4JAVMGRWzwegW6CVTrHa337fGcpvuCjRXae4F?=
 =?us-ascii?Q?mOdkQstIXjjhVC63awUReez28ex3Rczn6V0KleOETKIeb1akWGSJUIn8efQv?=
 =?us-ascii?Q?hFfUZ2jYAVkvJAqTvjrGlrADelU3jUlfonf5izyxiUOLcDor4917nAC8pZFB?=
 =?us-ascii?Q?PcRsbJUb4b5AFQ8VKqqiXFkBNRKNkgTD+7OR3jO9DglVIroQw+/FRpiWszVl?=
 =?us-ascii?Q?4gn9k7At3MXIqBdrzXIt/TdE9SJexsJr/UrPPYqW3h1+IKrjLu0ilNnEeDOe?=
 =?us-ascii?Q?iEvXDnOtEEvRTrDn+204k4uabjXdu8s9vP8oFZ5/Pf3yLmhHTMvEBaCV84Qh?=
 =?us-ascii?Q?LyBWZHOIdkMKCWWCTuy4K3Uio67LEV3f1t6/ygsGUUdU/OxBG+aoQ9cttSc/?=
 =?us-ascii?Q?5q3u9z+XAntgn9cz8bkiLB+9c9igkbpa2VawogUBauTTRpc6NwRP3AzAkISN?=
 =?us-ascii?Q?qSuLvxJnLSEgbGhE0A3hC9Dinr/C0lhj0lyv6XQDvjxVnFraFS/AjrpFAkTv?=
 =?us-ascii?Q?NOXAFRndfQ4wjevUDGRIFF65/kMKja3k8dfbsuRhJgkVtgDaHf5ALQFdHx7y?=
 =?us-ascii?Q?EoEYLSYTpfd6ym3UYb7WhS/xMo+Mc9efA0GTke/l9RcbaXjp9F7gxalLuVpn?=
 =?us-ascii?Q?HVp2j+RL1zAELcIJTIoVcctc2qoM3YCMKRoFgQTaj2VCVTT48LzynA/QmClK?=
 =?us-ascii?Q?fo5QhnYzOYTVTVI+c3q6v8cOdrCJYmGokLOpZycG/4mRmkyBtVeprzgKLTvb?=
 =?us-ascii?Q?4ylS/JB+HntV4BjblR2xSFgId8ytf69Ui14sfJ8QR9quHcEAsVE/IP1IooJ9?=
 =?us-ascii?Q?OXY6QizgwhqVMurW9X2GFVrvaFWNdmylI3fGTz1RNNgPVTB2ubv8kRnOWbjb?=
 =?us-ascii?Q?koZUdJU7BB4mTC37Rp3EQT3tcb1BElEIt47Gv8Mh3VAjthIVcabdV7+BV6jY?=
 =?us-ascii?Q?5gH6GYaPFSSseLoh6Q5fNZ7k2JBExlrnJ/mRrWxM7ij8TlqObyQ8BKnllYgC?=
 =?us-ascii?Q?142HJMaBITSVM9cXoOFPR3zPp6HvDTZxN3kmarbQrUEGu1Mg+x2/nXCAGKmA?=
 =?us-ascii?Q?Oj2sM+lFfkCebR1YE1niroRrIuYKaoq+Yxw9KsFEsxx+vx09bqHyA7Wc4WjO?=
 =?us-ascii?Q?aQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1212fc-ef97-481d-1c5c-08dc86327f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 14:11:02.1933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uqrOq2qZM0dTw0nDHa781CM/dMG9Qiq3pDD6+VWSqT4mnbHJKJS4xIozvImD6afkMppLvc9qsan6YxgiXTuxQGtUZA7V/nrMLC9QqkYlTjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
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

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Wednesday, June 5, 2024 3:10 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Brost, Matthew <matthew.brost@intel.com>; Harrison, John C <john.c.har=
rison@intel.com>; Summers, Stuart <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
>=20
> On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
> > We currently have debugfs support that allows the userspace to initiate
> > an asynchronous gt reset on command.  However, userspace may also wish
> > to wait for the completion of the gt reset before performing any
> > additional work.  To that end, add a version of the force_reset gt
> > debugfs function that operates synchronously.
> >=20
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068
>=20
> do we already have the igt changes that really closes this?

The IGT change that closes this issue has not yet landed.  It relies on
using the new debugfs, so if it landed first, we'd be attempting to call
a nonexistent debugfs function.
-Jonathan Cavitt

>=20
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: John Harrison <john.c.harrison@intel.com>
> > CC: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe=
_gt_debugfs.c
> > index 66f897a9b6ca9..5e7fd937917a1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct dr=
m_printer *p)
> >  	return 0;
> >  }
> > =20
> > +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	xe_gt_reset_async(gt);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> > +	flush_work(&gt->reset.worker);
> > +
> > +	return 0;
> > +}
> > +
> >  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> >  {
> >  	struct xe_tile *tile =3D gt_to_tile(gt);
> > @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struc=
t drm_printer *p)
> >  static const struct drm_info_list debugfs_list[] =3D {
> >  	{"hw_engines", .show =3D xe_gt_debugfs_simple_show, .data =3D hw_engi=
nes},
> >  	{"force_reset", .show =3D xe_gt_debugfs_simple_show, .data =3D force_=
reset},
> > +	{"force_reset_sync", .show =3D xe_gt_debugfs_simple_show, .data =3D f=
orce_reset_sync},
> >  	{"sa_info", .show =3D xe_gt_debugfs_simple_show, .data =3D sa_info},
> >  	{"topology", .show =3D xe_gt_debugfs_simple_show, .data =3D topology}=
,
> >  	{"steering", .show =3D xe_gt_debugfs_simple_show, .data =3D steering}=
,
> > --=20
> > 2.25.1
> >=20
>=20
