Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F7606A320
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=majz/ltK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC52F10E52F;
	Fri, 23 Oct 2026 12:30:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2453E10E2FC;
 Fri, 23 Oct 2026 12:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792758592; x=1824294592;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=nt8z2D4KE2Nnlqu4fQGtph7KeXWobMhHLZ4cMcvP3Mw=;
 b=majz/ltKSe803HB9Utj+7cQDHM36SeqQ+yz9TGl//fmTgEOtD34rjcl9
 ZR3d0rx+0yOReJnc1kg9QOM8zfxpswF/alaHa8YwPWjKiujzfG0IVB8li
 87jbjDpZBYm3wIvCQQOo0DrNU26xs2aQZpkEgwTvGfgpvFihnxu+nCAI4
 sprTAlBVX4tr3en+y1Pm5E1S/iiK9bXQ7Od7VKwdWVyrUptaC9U3dCJRi
 a3hHgeP+ueUo/UXd9gpzGImiFNGlWBWZq9zLELqgnimUuOfIJVVnbK2Vq
 9SJgnk/aPvD7QW9bdiOyi6ZKUGIzfSuOpHHlkpKEkoXWZ4ki+rSsL//iP A==;
X-CSE-ConnectionGUID: 8aeTl5TTS4aEJJKOnaeIRg==
X-CSE-MsgGUID: GiETaC2oRP+s+owvcEqlFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1393394"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1393394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:29:51 -0700
X-CSE-ConnectionGUID: +cJBysaIS6+iioCwapnZsw==
X-CSE-MsgGUID: S6QFpTofS9ar7OVZO7v+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3662595"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:29:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 05:29:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 05:29:49 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 05:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cm3wr0AWuDsXq570zEdIBvX8vCg3yMU0cbdJSdHLRo7n07MpPmepXRYMjOWILprzyYqmz/m5po4Nry3p1Z5gdY8Bt6QNAhVm6vsx/Llsy+U01NbXXNKwnxg52clunGWb048v5Q+bmbb8PyL3TfFsJpjxeJbqmVJiT2RSpYe3MvNM+EcQqXHw/9uYpfhFbYuxcxezOOJzQnFV7ltc1D9mRwSmV3blaUA+xS0sdicyeJYLzSch4epfoWeDbw+brUyFr4HuKIS3RrwjV3YGP+vqwvPT6V/t/Dp1D5d/49v9OxQ9LpIEtZ3Cb3l+2p4ODvGZL2QEdUKjYIUzO/o10qTp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nt8z2D4KE2Nnlqu4fQGtph7KeXWobMhHLZ4cMcvP3Mw=;
 b=XdTfYrqJudDFQZcHoPMaHJPbYa1dGiUyIVuO9+0fRPLsjvWITLRpSW4P5bgsxSS2WDsZDvbCsKFgm8BXBvNtBOkfXIrYqlFoSg3gkiLl+DBlxwoKuZRPsEm80airP6DvUeEIA4W5A+a8SFs9XTpcTr+ApBU5Dps9PIX7MBQb8TBZPTUR0nJ8gjMDx2q1KFMa7JiH5IJOydAZ4ogDPDLxeydAUKze1RI2sCyaGfAnI2HQHVAq26ussJmzJPWLlOxt1s6b+OFgtJaBpAJbj3gSNwrSkJMOlh2FnNMzIzpbM/zZB0PGBAhNl42/MITA6imviKkN6c6Dv7pBEfirIZ+b0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 12:29:46 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 12:29:44 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/9] drm/i915/psr: Derive the alignment loop condition
 from the SU area
Thread-Topic: [PATCH v3 5/9] drm/i915/psr: Derive the alignment loop condition
 from the SU area
Thread-Index: AQHdYtV0RG1QW3w51Eyl4aTD+IoP+bcLDrGA
Date: Fri, 23 Oct 2026 12:29:44 +0000
Message-ID: <3f1c33ba2abd6dc22cc8a6aee9edccf0497fadc4.camel@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
 <20261023100052.683192-6-mika.kahola@intel.com>
In-Reply-To: <20261023100052.683192-6-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS4PPF07B018B9F:EE_
x-ms-office365-filtering-correlation-id: 9bd265de-c930-4fe5-f974-08df310151dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|261021121427099003|38070700021|56012099006|261022115727099003|261009223027099003|11063799006|5023799004|10067099003|22082099003|18002099003|261021123027099003|261022105027099003;
x-microsoft-antispam-message-info: V2mji+RHTzgmpb8oY2bRtVb7f3L0YFCYFOTI3YLIMInBwgL6ZBIEisCPp38hRnaRKSGbBMTogVmdJHIPzLhJgtIyiIJiLlgNCdj/i8i/+1cOAhhZwsJIfxMQghSl4yeLer6PGr0q21NEm0QfaiWERlJgHSHGOfNoCukBmh8ZH5rOxHIA5zqSEe6hBnUDfjkMw9SArDzWmRYRqx1PE2OaLM2RyiJNlGYrq8rVNjkaDrfq0ZALGD4Hur+Qsgf01P/hja5AbzLVNRKnEIpHRn7jjYbimq9iDmPDFITzvlSt6z0XtVHbzWPg1asPXwZxxFHlE88JgqHnU/pU9lB101/YBTDTS7v9pYUl3fy8Qh+aqU1NXGZOr2zp55Ss24CvFKSs8MW7Zyujzu6w8A+fpWuc9lRooJoh5vEOF8eJuE/EZ9hdZ3IiCjXPTgF3+54+EHMWppK9QG8Ib7VtPDadkxnyd0XKofcVfmTV7Jar9HyZEYZQCbDn21SjBdoIrtNP797Yj6k7XmVtjN2igTOP6RS0h1Q7/QR+GTUh9+r7ciuaFpl7Pby0SQwmULu4w3jkTT4arpXr8fMQWIxMoDhohX7sLsSR71tIobpUHFQ8OtXulc2ysUAkDaTDxcxaKL3Tnd78BcycW3+Y8urlNdWeszXiX5CnUnEszC8FC4zyLPWYalMHxY4LuWxCJKWzQXYxkK/dM2URD16FiFcCxn2R+WOnESanG61CCt5Go4KBFyWgz14=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(261021121427099003)(38070700021)(56012099006)(261022115727099003)(261009223027099003)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(261021123027099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFNGd2FSeGFuRFJRSFNreENuSS9ldWgzYnRORzQwTm1OK1dRSDFMTW9PVWNN?=
 =?utf-8?B?MGdtQ1NlZW9RTEhhbFZaWHk1c21uRHZDaTlHT2JDYUZVWURZYVhlU1FRZHVB?=
 =?utf-8?B?L0ZoL3R5d0JJMHdYTEtZNXpKZ2c4Y05acFRZd2lZT25ONytPQml6djZJVmlk?=
 =?utf-8?B?eElUSjdXc0hQWjhzWDdhT3Z4UnZweS96a0dERCsvaldHNVM3QjhlajV2Tkx4?=
 =?utf-8?B?dytaekI5SWJuLytQdGsxQmNrUHJnVWZqVExZaU0ydXFtc1YxQkxMQk9jNUMv?=
 =?utf-8?B?NVQrajNjVk93L3gyK3dBUUFSWWxINDY5aDdCejg5UmVIdjNSb0FSRXZuL253?=
 =?utf-8?B?Vjl6eVp5aG9adlpLdjFCR3V1RUVINys0ZHhzOGZzMHdSenQvWUJjUG83czRm?=
 =?utf-8?B?ZG1KdXUwdmlRNFpjL2tGS3EyeHEwZmdYMERENllsaDhMczZac0JrMkl3WmRl?=
 =?utf-8?B?MFBrWUptOG9qbzdhNjgrbVZKY0QvMEpNbXBydngxNllWZ1B2RFJWaytmRVJ3?=
 =?utf-8?B?eHNuaGg1YTZma0RQbitZNUdrckRWcWJWSUVNaGRKVElXYWpqMEVXVGNib3Ji?=
 =?utf-8?B?WElkQ3BrYnlZQk1nckp1ckdnYnZKTEJrMkhoczRlRFlXS09mSWJWcjZQTjZi?=
 =?utf-8?B?cTgvVUYwOEFGRThycko0eWZaUUsydG5XQ01td0tzR3FwWnRkRkhPY1N1aFFW?=
 =?utf-8?B?aSsrY0o5VnpUQzd3U3dtWm15RWZiZDFvV3kwaDVlMTBKOW1JUE9mTHFrSjBo?=
 =?utf-8?B?Tzl4dndmV0V4ZGVXTVF2WGh2bWFPRzltS0RqVVJzdCtGa2c1RlF1MzFqQjN4?=
 =?utf-8?B?NHlrY1VFTk0rb2NjTlNkOE9nZlpLOUluem40ZC95L2VHQnZBaGxwU2NPeUsx?=
 =?utf-8?B?T3JRVkhMaEpma2xsRVlVcGs2SDdmdnZiay9IZlk1UVdNaVhyR2svZlBIcjRI?=
 =?utf-8?B?bWFQVmdCbW1uTWFYdDJJNmx0dnVqL3J6cURaem9jL1Z3VUI5TjFQYjg3Z3VP?=
 =?utf-8?B?R051S20xeU9aT0hraGh3T1BzdllNQ0RHU0NiRFpvOTIzOUYxUFU0ZTlEdnpO?=
 =?utf-8?B?WFR1WDU3dzJ4RG1HdnZWR1dEZG14emY2aXEvV004M3pvL2JQeWhFTWxwOWlZ?=
 =?utf-8?B?Q2MrMWZOeHczRzVWMFdOaFc2dk9TSmMrQUtGSkE3MFhWa3lBcDlnVVFGbll0?=
 =?utf-8?B?ZTdvRjhTZUdUVDd4Yk5DZmErNFhGRVlxUFJBaTNMZGd1ckpJOEpSK216di9M?=
 =?utf-8?B?RGJubjNCYURwMThpelZkd0xXaFRhcjhBRjg3UFpJSDhSTXAwK1lIck5UN3pG?=
 =?utf-8?B?SUZkMnRyTFI1ZklEQnlEMlZ5eDRrcWJjcTVLZUFPS2lzTW14ZUZVVXZkcDZX?=
 =?utf-8?B?WUM5cTlhZlBnNVB4ek50Q0RFMWVjdlZFY0V3ckhLbG1mTlZKL0llWGRvRzdT?=
 =?utf-8?B?SDNBOThpRHo0bEdraG0vTjl6S1ZnZktTQ3A5YWREeExBY0c1bTZ1RFFveWdj?=
 =?utf-8?B?Ykk3OVdYTEhXVzlLSVVKWCtqL2xMZ2ZqVUg4Z2EybnRBbUNjL2hBZURLRHFI?=
 =?utf-8?B?Z3VtandIWnMzTzFHWGtkcEtLRTBGL2w3d0h5NW1pdWpuYjRrZDVRbHlpTGtM?=
 =?utf-8?B?QmRIcGJRTUs5b0xPSlRlWWRpRGtkYUloZW9kbkdnSndhWGRMZHQ3c1ljSy8v?=
 =?utf-8?B?V2w2ajQvRUZTeTVXNGsrNVVyL1dEeUpMZTlVdksrVjRINzhjNVFaUkorQThP?=
 =?utf-8?B?VWNVYzYyRGpaUTdCdlpxU1RvYTdpRkk0NVZIRFBodW9aZjh2TXFFcWlIZDJS?=
 =?utf-8?B?NFJVRHdiZ01wakc4SzdHTFVnenc5U3M5Y1NOVkY3Yis1YnNMclM4Z0EwOUdN?=
 =?utf-8?B?NVdqVG5ndnpZNGNrcFlvTHdGeGlhTkQ2VnhBYTJaU2t5Q2FyWWdIMHo3dXl6?=
 =?utf-8?B?djNGSmZkMUp1MjZ5L0hSRHpYZjBlYTJpVDJEWG1FVzdUYjRLM1NWTVBtak1r?=
 =?utf-8?B?QUJmVkQvVDhZV3ZVckJvdENpTlNqZDdzVWFRZzdjSHpVakZvZjVXazJqQzdZ?=
 =?utf-8?B?a2lkNTNDWEhPdlZxQkQ5SXlhNkE4YUk4SUVMZGZzaHBVdFNvYUdBV1lCT0ZK?=
 =?utf-8?B?MXYzR2I1d3Q5RmYzTmxpMWpidkoxRXJwcGRPYUVMdURXRS9Ua2wvakQ5N3ZY?=
 =?utf-8?B?VjhYU2ZBS0FQblhKb0pMbmV0VjB0cXFZckQvWkNYcTBxY3NEK2hRUk5xZ3Fs?=
 =?utf-8?B?T0c2dVNIak5BSWdPRDdkdVlLbERCNzBXVVNlekVRRHAxUWlPYTNpSW5tYlY3?=
 =?utf-8?B?a0dkM3p4eTJnUmMyazVNcXcyR0tKViswVndNWHRTMHBmOFFXSDRwRzdlWVlr?=
 =?utf-8?Q?VzRw1NqCnK+JMtGc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D57233757F38B4A96E49590D4E3FD48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Q0ZVU7KVJmQ5fZvVkaIlQG9wlhy6Y58/Fo10IolPCldvB+B1gUmajMzgAXYZ1LfMm092oOynJcUVqBzp3ZUbmmQ3D+LfBsnvL3lSMsPdBDXeTUdLnv2v4kgw9NdamAGn7kkbbpQ+564SXZjhzxgfKArYaBnqapnWjdvJVNT1b9SCOO6H5HbGJHgB5fKW7MZA8u4+0NCks4YbtLqlWhRG2NiV+PTj3zIEP6n+mbLvoqUJs0+IPdZqWjfa/LYt5FyfkZr69cotePJWjF1L4SpB6Wo+SPPv9YtKNWgm6Ii0lMCt0wd2JMFRf9iEOk4iWrPvEesNEkTnonqGjVnU+7vfnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd265de-c930-4fe5-f974-08df310151dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 12:29:44.7796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gtT/hgKp4pfQyf+PJ1tLvv6SJESImCkEDWZM0dMdRw1q+INVPkaB8fBYRle5dueToJNxoajvedp49snpMMTet4jA0fABPKYzfsA7SL84spM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTEwLTIzIGF0IDEwOjAwICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
VGhlIGxvb3AgYWxpZ25pbmcgdGhlIHNlbGVjdGl2ZSB1cGRhdGUgYXJlYSBkZWNpZGVzIHdoZXRo
ZXIgdG8gcnVuDQo+IGFnYWluIGZyb20gdHdvIHBhcnRpYWwgc2lnbmFscywgdGhlIHJldHVybiB2
YWx1ZSBvZg0KPiBpbnRlbF9wc3IyX3NlbF9mZXRjaF9waXBlX2FsaWdubWVudCgpIGFuZCB0aGUg
Y3Vyc29yX2luX3N1X2FyZWEgb3V0DQo+IHBhcmFtZXRlciBvZiBpbnRlbF9wc3IyX3NlbF9mZXRj
aF9ldF9hbGlnbm1lbnQoKS4gTmVpdGhlciBhbnN3ZXJzDQo+IHdoYXQNCj4gdGhlIGxvb3AgYWN0
dWFsbHkgYXNrcywgd2hpY2ggaXMgd2hldGhlciB0aGUgYXJlYSBjaGFuZ2VkIGF0IGFsbCwgYW5k
DQo+IG5laXRoZXIgc3Vydml2ZXMgYSBzdGVwIHRoYXQgZ3Jvd3MgdGhlIGFyZWEgYmV0d2VlbiBy
b3VuZHMuDQo+IA0KPiBDb21wYXJlIHRoZSBhcmVhIGFnYWluc3QgYSBzbmFwc2hvdCB0YWtlbiBh
dCB0aGUgdG9wIG9mIHRoZSBsb29wDQo+IGluc3RlYWQuIEJvdGggYWxpZ25tZW50IHN0ZXBzIG9u
bHkgZXZlciBleHBhbmQgdGhlIGFyZWEsIHNvIHRoaXMNCj4gc3RpbGwNCj4gY29udmVyZ2VzLiBB
IGN1cnNvciBhbHJlYWR5IGluc2lkZSB0aGUgYXJlYSB3aGVuIGFsaWdubWVudCBtb3ZlcyBpdA0K
PiBub3cgdGFrZXMgb25lIGV4dHJhIHJvdW5kLCB3aGljaCBjaGFuZ2VzIG5vdGhpbmcgYW5kIGV4
aXRzLg0KPiANCj4gVGhlIHJldHVybiB2YWx1ZSBhbmQgdGhlIG91dCBwYXJhbWV0ZXIgYXJlIG5v
dyB1bnVzZWQsIGRyb3AgdGhlbS4NCj4gDQo+IFNwbGl0IG91dCBvZiB0aGUgam9pbmVyIHNlbGVj
dGl2ZSBmZXRjaCBtZXJnZSBwYXRjaCwgd2hlcmUgU2FzaGlrbw0KPiBzdWdnZXN0ZWQgcmVtb3Zp
bmcgY3Vyc29yX2luX3N1X2FyZWEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8
bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAzNyArKysrKystLS0tLS0tLS0tLS0tLS0tDQo+IC0tDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gaW5kZXggOWRi
MDY0ZmIzOWFmZC4uMTAyMTMzZTgwYWJjNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0yNzQ4LDEyICsyNzQ4LDExIEBAIHN0YXRpYyB2b2lk
IGNsaXBfYXJlYV91cGRhdGUoc3RydWN0IGRybV9yZWN0DQo+ICpvdmVybGFwX2RhbWFnZV9hcmVh
LA0KPiDCoAkJb3ZlcmxhcF9kYW1hZ2VfYXJlYS0+eTIgPSBpbnRlci55MjsNCj4gwqB9DQo+IMKg
DQo+IC1zdGF0aWMgYm9vbCBpbnRlbF9wc3IyX3NlbF9mZXRjaF9waXBlX2FsaWdubWVudChzdHJ1
Y3QNCj4gaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkNCj4gK3N0YXRpYyB2b2lkIGludGVs
X3BzcjJfc2VsX2ZldGNoX3BpcGVfYWxpZ25tZW50KHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRl
ICpjcnRjX3N0YXRlKQ0KPiDCoHsNCj4gwqAJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkg
PQ0KPiB0b19pbnRlbF9kaXNwbGF5KGNydGNfc3RhdGUpOw0KPiDCoAljb25zdCBzdHJ1Y3QgZHJt
X2RzY19jb25maWcgKnZkc2NfY2ZnID0gJmNydGNfc3RhdGUtDQo+ID5kc2MuY29uZmlnOw0KPiDC
oAl1MTYgeV9hbGlnbm1lbnQ7DQo+IC0JYm9vbCBzdV9hcmVhX2NoYW5nZWQgPSBmYWxzZTsNCj4g
wqANCj4gwqAJLyogQURMUCBhbGlnbnMgdGhlIFNVIHJlZ2lvbiB0byB2ZHNjIHNsaWNlIGhlaWdo
dCBpbiBjYXNlDQo+IGRzYyBpcyBlbmFibGVkICovDQo+IMKgCWlmIChjcnRjX3N0YXRlLT5kc2Mu
Y29tcHJlc3Npb25fZW5hYmxlICYmDQo+IEBAIC0yNzYyLDE4ICsyNzYxLDEyIEBAIHN0YXRpYyBi
b29sDQo+IGludGVsX3BzcjJfc2VsX2ZldGNoX3BpcGVfYWxpZ25tZW50KHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlICpjcnRjX3N0DQo+IMKgCWVsc2UNCj4gwqAJCXlfYWxpZ25tZW50ID0gY3J0Y19z
dGF0ZS0+c3VfeV9ncmFudWxhcml0eTsNCj4gwqANCj4gLQlpZiAoY3J0Y19zdGF0ZS0+cHNyMl9z
dV9hcmVhLnkxICUgeV9hbGlnbm1lbnQpIHsNCj4gKwlpZiAoY3J0Y19zdGF0ZS0+cHNyMl9zdV9h
cmVhLnkxICUgeV9hbGlnbm1lbnQpDQo+IMKgCQljcnRjX3N0YXRlLT5wc3IyX3N1X2FyZWEueTEg
LT0gY3J0Y19zdGF0ZS0NCj4gPnBzcjJfc3VfYXJlYS55MSAlIHlfYWxpZ25tZW50Ow0KPiAtCQlz
dV9hcmVhX2NoYW5nZWQgPSB0cnVlOw0KPiAtCX0NCj4gwqANCj4gLQlpZiAoY3J0Y19zdGF0ZS0+
cHNyMl9zdV9hcmVhLnkyICUgeV9hbGlnbm1lbnQpIHsNCj4gKwlpZiAoY3J0Y19zdGF0ZS0+cHNy
Ml9zdV9hcmVhLnkyICUgeV9hbGlnbm1lbnQpDQo+IMKgCQljcnRjX3N0YXRlLT5wc3IyX3N1X2Fy
ZWEueTIgPSAoKGNydGNfc3RhdGUtDQo+ID5wc3IyX3N1X2FyZWEueTIgLw0KPiDCoAkJCQkJCXlf
YWxpZ25tZW50KSArIDEpICoNCj4geV9hbGlnbm1lbnQ7DQo+IC0JCXN1X2FyZWFfY2hhbmdlZCA9
IHRydWU7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIHN1X2FyZWFfY2hhbmdlZDsNCj4gwqB9DQo+
IMKgDQo+IMKgLyoNCj4gQEAgLTI3ODMsOCArMjc3Niw3IEBAIHN0YXRpYyBib29sDQo+IGludGVs
X3BzcjJfc2VsX2ZldGNoX3BpcGVfYWxpZ25tZW50KHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpj
cnRjX3N0DQo+IMKgc3RhdGljIHZvaWQNCj4gwqBpbnRlbF9wc3IyX3NlbF9mZXRjaF9ldF9hbGln
bm1lbnQoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+IMKgCQkJCcKgIHN0cnVj
dCBpbnRlbF9jcnRjICpjcnRjLA0KPiAtCQkJCcKgIHN0cnVjdCBkcm1fcmVjdCAqZGlzcGxheV9h
cmVhLA0KPiAtCQkJCcKgIGJvb2wgKmN1cnNvcl9pbl9zdV9hcmVhKQ0KPiArCQkJCcKgIHN0cnVj
dCBkcm1fcmVjdCAqZGlzcGxheV9hcmVhKQ0KPiDCoHsNCj4gwqAJc3RydWN0IGludGVsX2NydGNf
c3RhdGUgKmNydGNfc3RhdGUgPQ0KPiBpbnRlbF9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0
YXRlLCBjcnRjKTsNCj4gwqAJc3RydWN0IGludGVsX3BsYW5lX3N0YXRlICpuZXdfcGxhbmVfc3Rh
dGU7DQo+IEBAIC0yODEyLDcgKzI4MDQsNiBAQCBpbnRlbF9wc3IyX3NlbF9mZXRjaF9ldF9hbGln
bm1lbnQoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+IMKgDQo+IMKgCQlj
bGlwX2FyZWFfdXBkYXRlKCZjcnRjX3N0YXRlLT5wc3IyX3N1X2FyZWEsDQo+ICZuZXdfcGxhbmVf
c3RhdGUtPnVhcGkuZHN0LA0KPiDCoAkJCQkgZGlzcGxheV9hcmVhKTsNCj4gLQkJKmN1cnNvcl9p
bl9zdV9hcmVhID0gdHJ1ZTsNCj4gwqAJfQ0KPiDCoH0NCj4gwqANCj4gQEAgLTMxMjMsNyArMzEx
NCw3IEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0DQo+IGludGVsX2F0
b21pY19zdGF0ZSAqc3RhdGUsDQo+IMKgCQlpbnRlbF9wc3JfYXBwbHlfc3VfYXJlYV93b3JrYXJv
dW5kcyhjcnRjX3N0YXRlKTsNCj4gwqANCj4gwqAJCWRvIHsNCj4gLQkJCWJvb2wgY3Vyc29yX2lu
X3N1X2FyZWEgPSBmYWxzZTsNCj4gKwkJCXN0cnVjdCBkcm1fcmVjdCBvbGRfc3VfYXJlYSA9IGNy
dGNfc3RhdGUtDQo+ID5wc3IyX3N1X2FyZWE7DQo+IMKgDQo+IMKgCQkJLyoNCj4gwqAJCQkgKiBB
ZGp1c3Qgc3UgYXJlYSB0byBjb3ZlciBjdXJzb3IgZnVsbHkgYXMNCj4gbmVjZXNzYXJ5DQo+IEBA
IC0zMTMyLDIyICszMTIzLDEyIEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3Ry
dWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+IMKgCQkJICogb2YgdGhlIHBpcGUg
YXJlIGFkZGVkIGludG8gdGhlIHN0YXRlDQo+IGJlZm9yZSB0aGUgcGxhbmUNCj4gwqAJCQkgKiBj
aGVja3Mgd2hlbiBzZWxlY3RpdmUgZmV0Y2ggaXMgZW5hYmxlZC4NCj4gwqAJCQkgKi8NCj4gLQkJ
CWludGVsX3BzcjJfc2VsX2ZldGNoX2V0X2FsaWdubWVudChzdGF0ZSwNCj4gY3J0YywgJmRpc3Bs
YXlfYXJlYSwNCj4gLQkJCQkJCQnCoA0KPiAmY3Vyc29yX2luX3N1X2FyZWEpOw0KPiArCQkJaW50
ZWxfcHNyMl9zZWxfZmV0Y2hfZXRfYWxpZ25tZW50KHN0YXRlLA0KPiBjcnRjLCAmZGlzcGxheV9h
cmVhKTsNCj4gwqANCj4gLQkJCXN1X2FyZWFfY2hhbmdlZCA9DQo+IGludGVsX3BzcjJfc2VsX2Zl
dGNoX3BpcGVfYWxpZ25tZW50KGNydGNfc3RhdGUpOw0KPiArCQkJaW50ZWxfcHNyMl9zZWxfZmV0
Y2hfcGlwZV9hbGlnbm1lbnQoY3J0Y19zdGENCj4gdGUpOw0KPiDCoA0KPiAtCQkJLyoNCj4gLQkJ
CSAqIElmIHRoZSBjdXJzb3Igd2FzIG91dHNpZGUgdGhlIFNVIGFyZWENCj4gYmVmb3JlDQo+IC0J
CQkgKiBhbGlnbm1lbnQsIHRoZSBhbGlnbm1lbnQgc3RlcCAod2hpY2ggb25seQ0KPiBleHBhbmRz
DQo+IC0JCQkgKiBTVSkgbWF5IHB1bGwgdGhlIGN1cnNvciBwYXJ0aWFsbHkgaW5zaWRlLA0KPiBz
byB3ZQ0KPiAtCQkJICogbXVzdCBydW4gRVQgYWxpZ25tZW50IGFnYWluIHRvIGZ1bGx5DQo+IGNv
dmVyIGl0LiBCdXQNCj4gLQkJCSAqIGlmIHRoZSBjdXJzb3Igd2FzIGFscmVhZHkgZnVsbHkgaW5z
aWRlDQo+IGJlZm9yZQ0KPiAtCQkJICogYWxpZ25tZW50LCBleHBhbmRpbmcgdGhlIFNVIGFyZWEg
d29uJ3QNCj4gY2hhbmdlIHRoYXQsDQo+IC0JCQkgKiBzbyBubyBmdXJ0aGVyIHdvcmsgaXMgbmVl
ZGVkLg0KPiAtCQkJICovDQo+IC0JCQlpZiAoY3Vyc29yX2luX3N1X2FyZWEpDQo+IC0JCQkJYnJl
YWs7DQo+ICsJCQlzdV9hcmVhX2NoYW5nZWQgPQ0KPiAhZHJtX3JlY3RfZXF1YWxzKCZjcnRjX3N0
YXRlLT5wc3IyX3N1X2FyZWEsDQo+ICsJCQkJCQkJwqDCoA0KPiAmb2xkX3N1X2FyZWEpOw0KPiDC
oAkJfSB3aGlsZSAoc3VfYXJlYV9jaGFuZ2VkKTsNCj4gwqAJfQ0KPiDCoA0KDQo=
