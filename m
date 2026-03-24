Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE276F532E9
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715AA10E5FB;
	Tue, 24 Mar 2026 08:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHVKK/Ck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FF810E5FB
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774339438; x=1805875438;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cSvxdOhN8dO+nwx4XKclFpA0C2CSAgnybJwVyiPUuS8=;
 b=CHVKK/CkU+4wCeUCVvn5UVYWj+VBOQraaXGBRc15PSMOjVnIkmFF9i7L
 N/V8qrcHTlHNB/j4shgT2JNegGqPxHy723XIPfB/pMQ+tujE8Mhun0ha5
 RkelnHq2yOIHbltXPlAEy4T8UfktcmErrD6+pqK36aCFpDjzBWnpbAnVA
 eAiaIke+1DVXmayStiMtBmYjx9SjB4Yrfisg6hgFn86+57OWZ9BEKYL2v
 FBdjlsruVlzA+p2Jw4fgAx1c2+q6eL7CfXNcIxnsr+yfssS7x2E0N2YTj
 oaExMJmhmY1aDiRvlz/20uFOQJkCuEUic0WoeIVlTLzNGoi0z5aP1rSsQ g==;
X-CSE-ConnectionGUID: OXGyElPFSpOrBpl1sjzQ+g==
X-CSE-MsgGUID: 2psIrF5cRm2AlPqtvdL2vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75419125"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75419125"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:03:58 -0700
X-CSE-ConnectionGUID: 7TroPBAwRkW0PoHbm2lrwA==
X-CSE-MsgGUID: oPfzH+tiSrKwkbK0od0GOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228766007"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:03:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:03:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 01:03:56 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:03:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5nw+H/PvxAq7hetFPjoLxFEAH4aYWbokhQycJoah6a1Q2WmQpsTH4D7Ais45iIC8cFQzxoefgTHLCecIdxyLnzNgx1o+HdZ3xzDe6JBAwQEzxiE9STE+QcfgCKZQHQ0NWt1hLVQw062Uf1kkJjMids5TO262dE1XnUDQ2JZBMFhyFYgE6s3yxTSjPUUysw3/E7/LutlSyGYzJqRTajhuKt6kmENwj2OrNvScJamqfzGkMVE+uRhZqoJdOpBQfq/MUaSym74qUnSPrPZHw6/Qo2aYBO69qa4EFsln9wp8M8rt9MrHdo67bvs16/Y7z7pLKIqw73J8NtAaIqVVAD4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSvxdOhN8dO+nwx4XKclFpA0C2CSAgnybJwVyiPUuS8=;
 b=QgqVU2ORFFvoej/cj4y1LVVO4Agt4S+3+EuybTJD7qzPIEQpUFoJuTh/dptLwrMdsKFzY3K+/2ZkVIjGWkANe9DhPW8qkiecx5KqenFgSaEWpApDdLC5rOFF8MPiHACSqzvlXSEEi9O+dipVHnqbecw2ZrCItQ0D1lSKDwAFYYrvZteL4KK5CQvCRtpHl1h18kniqLrxe91n8mSl3uGNEWhTVEkOB4F1Kc9bNqDWaBdrXkwOVTY3Z5mY0l7dvTcSD7QNZXZ1dzJMuXXWzRYvfeZSmiUvrrQ2r8sMXc4dMN7imX5Qe0tR7y3Oyq3WCotMSq3ydXafonZ30POI5GRvCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 08:03:52 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 08:03:52 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Topic: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Index: AQHcqnEu80JaqR8qkEm5jk7+siCN4bWb3bMAgAD4bACAADGRAIAM6soAgBN/G7A=
Date: Tue, 24 Mar 2026 08:03:52 +0000
Message-ID: <IA1PR11MB62667C83C70E9E9884BA745EE248A@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com>
 <DM4PR11MB54568FCCFAA9BBED0EDC4C10EA7EA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <87o6l5m2yn.fsf@intel.com>
 <DM4PR11MB5456C9921D64DCF63901C692EA7FA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <87jyvi588r.fsf@intel.com>
In-Reply-To: <87jyvi588r.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|DM4PR11MB5325:EE_
x-ms-office365-filtering-correlation-id: d598ef10-e86f-44d6-4407-08de897be3b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: FvogwsDyv6KBodRgZ104m/PHPbGYIUV+bcjareJ5HKmw6g+qiaPpa9E6xMJO1x4iIRLVEj5ARQJJGgvqrD6AJFBAxw30YrBgLvElYxwlQRoiLtwsaQBBS/zRo9n/Cp3mP4G3ztCnsmYmb5lCfFLgY4+F31jFDyM+3oZbPnH+R7lkNf+YGcUEVUiEm/T+tr2i7Ab3NqfaILhv5K02DIHTIYo/eycRjoVSENVY3XtRylJ6b1QNS2XTywX3Z5644kMQ9rsZ/shlWr1eBzqwGD6iTp0xRqYO6+oLht6tGljVHjGh8PiwPALFSRra/70r0Ke27H+YGXUowtRDsn0ddlFr3SCBbkYN0fzRNDS5VKlUwyNP7VrWNGgf/FC7xwNAc53QRWqmnnD+ASDC1waS8IDslR5p2Wb7OTFjD4YbJ+pm/FCReEWupEu/bgE3ykjA9Qyen2nR5amMC93y7YxofqeX3Gn956rqbzPp5xBNQr7ExeBYIyqzwXi5LZKuQZKi2GgWrGVpBdB6xcTk+aL6yKpFrpKv+RXeIAs2IcVOfwLAR2jV2aMCkAkjDMUa3J2+fAfTgZK1c2yyOxZ0NY3wEMHbXHw1+TeBst+w19U+CHdN5LTuZc3VZiyZNgT/CUqfdXe042hTNpBK3yiqpFVHMOBUrSupRV9fnefm494ToOZOBeLdyHLmBL5hBkpvPUU9iSOP2xmkPeDVnbSUhOODRORDH3Ldv9P46LIx++0T7WCdKeHsR0kY/EnTOhr8XYEXTsu243lv8cxrWIBqQLc9e2SDhqJeIkRab+asO55QfA/OYmA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eit0K1VNaVh0aFpVRW5ZblpZR014ODdhTnFCdVhjdUpVWFlrUDh1UkUxVTYx?=
 =?utf-8?B?c3REeXhtZVFJZjFMYXg2dFN4aS93SEVlVE5Lajhac0RQazdvbGxyT1dVSjFl?=
 =?utf-8?B?c2xLbHZvS0pVUDVxR25FL251cDNXR0x0eElLS1V6NGdQL1Exclh0WThmcndQ?=
 =?utf-8?B?bGNkbWFWZjBIOVhtSWduTXNqM1RTdkJzVStNRzBkYWU4a0NlOFNqTk8wa1Fo?=
 =?utf-8?B?K1oxV2lSd1BDM0VnOEpSQWQzdTM5YkpWU0xYU3padlA2VEJ3VTduVFFobnhS?=
 =?utf-8?B?cld2MitYTFRNa00wd3ZpaTNJTTNMaU02Y2VMVStLVzk0c3JOdkZPS2FOVExU?=
 =?utf-8?B?ODkrMVczUFhPYjBMY1YwVHJZRlFCUGh6SU15b0o4Q1V3cFJWZWM1UEw5Mysz?=
 =?utf-8?B?UnZRUGZUc3MxUHMySHk5QVhNeTdTelJSeUFmRGtvRHV0eVhKQXErSVUrajd5?=
 =?utf-8?B?ZGFSSXNsVlZWVkdPYnhmSWVWZUUxa0dZVUlXakJ3SzlKQXR6QnY0dm9WZlk1?=
 =?utf-8?B?RDNheHBzb0ZUa2lmMnFSWkFKNEJwdTBiK1pJNlRqYkEzbGF1WkJOTFpVT0Jt?=
 =?utf-8?B?TDlKd2pyN1JNMFZzdU9DcUh6YWVUbFJJeGxDWTF0TkIrRXBUVUFRUWt1bU1K?=
 =?utf-8?B?RThmVm80R2Y4dVYvRjNCY0FvRmYzM2xtQ1lQNUdUb2Q4U3NTc3lHMGZwaDk2?=
 =?utf-8?B?enNzRStJcXRYbGoyZXJsT1ZLL3VFdHdqN0FQb1RnM3pwblJCcGI1bThRZUs0?=
 =?utf-8?B?c241cGszcDlkYmFrNHdUUll6c0dZbUJnbzJLQWs4RjhhYWNzU014MldLQzdV?=
 =?utf-8?B?QUJEQlhtZGpTbEpyVEFscGkvN2tqbnY3YSswVko1WHNYNXVoNnF2QXRFNDBU?=
 =?utf-8?B?dVVyQ2ZHWXlFbEV5cnE0WlFsS2c5a1JyOGU3MTd4TmhPbWtNK1dKWm8vZGZ0?=
 =?utf-8?B?WFB6ak5KcWpBZm5ydkhmMWRrWlJlTDZmbm1xT3B5OU4yTGZmYnZGWFpRRGox?=
 =?utf-8?B?UTlBYm8xNW9nR0UxWUx6MXFUUEYzbTV5RTMwTXdIU0Jkelp0M2ZZV2MxNldq?=
 =?utf-8?B?M0NMalI4NmsxcENtQWpWUHdxUVhpWi9VL3FXM0pSSEorNGpLN0ZBMmlESDV1?=
 =?utf-8?B?WVBhWVFOZjJySW96cG0xK1lsK3pyWkxZZ3B2c1VGMUdSUXNjREpkbCt5R2Vx?=
 =?utf-8?B?YXJlL2tiMnpVMGdBd2t2YnJNRVFaT29TK3VDcEhQTFU0V2J2cnZPSkppakFy?=
 =?utf-8?B?MmZleGdHQTAwL2VZRnM3VytOeCtJd2kvcVZ0OHpXd2REaUpVUmJuMHc1NmtB?=
 =?utf-8?B?RU04MVkwRWhEWmhZL0ZPMUUwZFliMjNnWnk2M21CNzA1aERXaHVqYmkrVVdz?=
 =?utf-8?B?Qk5NVStYSjhpYTJmcTUvRWU2YUpUQzJVU051ZkMrSUVIQWp5Y2NFTE1pbkox?=
 =?utf-8?B?czhJRy9TbHJFV0t2aVJKUlVCZk0zdCtJTkdWeFhiRlVFVmoyeFNWd3cyTzYw?=
 =?utf-8?B?bG91ZmcvMXJZSTFBeFd5U3VmVTNpaXBpU25NeUc4YU9zeXdZWDdPU240cmtx?=
 =?utf-8?B?NTR5NVFxaFRBR2RqS1hJSXphRUM3akRzTnJ3eko3WVlWNEptZUNBbm1YUG9o?=
 =?utf-8?B?K01JUjA2UFRKNWRWMkVpWHpmRjVYZklUU0ZtUUhVZ1N2K0ZJRGZiZkJjNFpx?=
 =?utf-8?B?VkZCbkJRN2NkQjMvSnVDOFdOVjRkWm04cHNxdDlCQVFSdTE5OVNIU05vK0Yy?=
 =?utf-8?B?T3JwNDdCZjBiVllJaElXZUhYbzR2SlFJbWFEeHlEUmFEOFhjMC9ZTjMrQ1BF?=
 =?utf-8?B?Vms2TFlCeFZyVmFIYndEWVFHbGFTYjMvaFJHWDZNL0RMVGM0Rk1jeGw4WnpW?=
 =?utf-8?B?MmNvTkcwN3BSbGpSeFJEY2JTY09TNjQrR2R2c1JQeDBaa1ZSc2M1VjFmYmht?=
 =?utf-8?B?YkEwS1ZNOXpaVS9pbzdTNmpBRWZVOG9Ydk1BdjZxdmJZdm96MWJ3U2lmV0tx?=
 =?utf-8?B?RCtGNXp6VzZEM2VhTHczR1ZKZ2VZWVRsdTBFL1M2djMyZE9kWEcvVjBaMlZK?=
 =?utf-8?B?amIwRmpyTVJ3d0x0Q0RGTzVoZ28rV2NHeUhNTktqYWRuL2NWUU9WUXNldnRH?=
 =?utf-8?B?SFp1elNIZHNvZ2NNUnBUK29DaTN3SDV1NHF5K2VoY2VwRlNabEVkZGtob0h3?=
 =?utf-8?B?dlh1Tk9relorRm9nbGhGamV6U0UwVURDMlJ1eU8rUjRzdlFzU1dJMW14MEdC?=
 =?utf-8?B?K1dsamVlanIxM2ZFdURGbTJkV05GQ2FWR0FUclUxSCsvL0lrNVdPNXBwdTd5?=
 =?utf-8?B?ZnZ6a3NyTkRHRjUxWmFET0g4cmNBYUc1Q1ZJOG9veFYvM0N5bGhydz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZOImN0tNpSInXX8i1MG+XjQ+eAd1JAbTvX/WE5gFWhsr8tMpH5GM6RxgnHwedMwOTaIoAvCD795qzLyY/cB6xnNFaCPzDI9Ra11Kk4pNasRLB1RvRPVGPafYCb75FB82eLkxUhYzZkRTepOuQwnwi8D+HIK2qo9FxtB6bz0xgTkkCgA6pwCqy9ljpDtaOF0X0/I3iyrrqh+qDmTanVYI4am1fKW0noL8tYJFZ1Ho/4kKVcvMljHmkQ7CYJOjkl6z8TKfSxK70y4CnJCGgpSnzhByf0crgA54gnOulx+wibGKLd4YcbLtIsPxG3ztyAS4fmpzVUnfqo2qQgoi0txTgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d598ef10-e86f-44d6-4407-08de897be3b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 08:03:52.6829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1IUA+cc9YZ1StgZPCurWZFVvOk41oSEu7edZ7Nadcr5VcOZGcSWuBVNBOUGR+ODPFlUwAbPH0zqG/pRUARCeQCsCHiYQOc8fPvldSr+Nfy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5325
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR3VzdGF2bw0K
PiBTb3VzYQ0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMTIsIDIwMjYgMzozOSBBTQ0KPiBUbzog
TGluLCBTaHVpY2hlbmcgPHNodWljaGVuZy5saW5AaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS94ZS9oZGNwOiBBZGQg
TlVMTCBjaGVjayBmb3IgbWVkaWFfZ3QgaW4NCj4gaW50ZWxfaGRjcF9nc2NfY2hlY2tfc3RhdHVz
KCkNCj4gDQo+ICJMaW4sIFNodWljaGVuZyIgPHNodWljaGVuZy5saW5AaW50ZWwuY29tPiB3cml0
ZXM6DQo+IA0KPiA+IE9uIFR1ZSwgTWFyIDMsIDIwMjYgNTo1NiBBTSBHdXN0YXZvIFNvdXNhIHdy
b3RlOg0KPiA+PiAiTGluLCBTaHVpY2hlbmciIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4gd3Jp
dGVzOg0KPiA+Pg0KPiA+PiA+IE9uIE1vbiwgTWFyIDIsIDIwMjYgMTA6MTkgQU0gR3VzdGF2byBT
b3VzYSB3cm90ZToNCj4gPj4gPj4gV2hlbiBtZWRpYSBHVCBpcyBkaXNhYmxlZCB2aWEgY29uZmln
ZnMsIHRoZXJlIGlzIG5vIGFsbG9jYXRpb24gZm9yDQo+ID4+ID4+IG1lZGlhX2d0LCB3aGljaCBp
cyBrZXB0IGFzIE5VTEwuICBJbiBzdWNoIHNjZW5hcmlvLA0KPiA+PiA+PiBpbnRlbF9oZGNwX2dz
Y19jaGVja19zdGF0dXMoKSByZXN1bHRzIGluIGEga2VybmVsIHBhZ2VmYXVsdCBlcnJvcg0KPiA+
PiA+PiBkdWUgdG8gJmd0LQ0KPiA+PiA+PiA+dWMuZ3NjIGJlaW5nIGV2YWx1YXRlZCBhcyBhbiBp
bnZhbGlkIG1lbW9yeSBhZGRyZXNzLg0KPiA+PiA+Pg0KPiA+PiA+PiBGaXggdGhhdCBieSBpbnRy
b2R1Y2luZyBhIE5VTEwgY2hlY2sgb24gbWVkaWFfZ3QgYW5kIGJhaWxpbmcgb3V0IGVhcmx5IGlm
DQo+IHNvLg0KPiA+PiA+Pg0KPiA+PiA+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFNvdXNhIDxn
dXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCj4gPj4gPj4gLS0tDQo+ID4+ID4+ICBkcml2ZXJzL2dw
dS9kcm0veGUvZGlzcGxheS94ZV9oZGNwX2dzYy5jIHwgNiArKysrKysNCj4gPj4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPj4gPj4NCj4gPj4gPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2hkY3BfZ3NjLmMNCj4gPj4gPj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9oZGNwX2dzYy5jDQo+ID4+ID4+IGluZGV4IDI5Yzcy
YWE0YjBkMi4uMWNhYzAwYzE3ZDRjIDEwMDY0NA0KPiA+PiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUvZGlzcGxheS94ZV9oZGNwX2dzYy5jDQo+ID4+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9kaXNwbGF5L3hlX2hkY3BfZ3NjLmMNCj4gPj4gPj4gQEAgLTM5LDYgKzM5LDEyIEBAIHN0
YXRpYyBib29sIGludGVsX2hkY3BfZ3NjX2NoZWNrX3N0YXR1cyhzdHJ1Y3QNCj4gPj4gPj4gZHJt
X2RldmljZSAqZHJtKQ0KPiA+PiA+PiAgCXN0cnVjdCB4ZV9ndCAqZ3QgPSB0aWxlLT5tZWRpYV9n
dDsNCj4gPj4gPj4gIAlzdHJ1Y3QgeGVfZ3NjICpnc2MgPSAmZ3QtPnVjLmdzYzsNClsxXQ0KPiA+
PiA+DQo+ID4+ID4gSWYgZ3QgaXMgTlVMTCwgdGhpcyAiJmd0LT51Yy5nc2MiIGlzIGFscmVhZHkg
dW5kZWZpbmVkIGJlaGF2aW9yLg0KPiA+Pg0KPiA+PiBJIGRvbid0IHRoaW5rIHNvLiBJdCBqdXN0
IHR1cm5zIG91dCB0aGF0IHRoZSBvZmZzZXQgd2lsbCBiZSBpbnZhbGlkLg0KPiA+PiBXZSBhcmUg
bm90IGRlcmVmZXJlbmNpbmcgdGhlIGd0IHBvaW50ZXIgaGVyZS4NCj4gPg0KPiA+IEkgYWxzbyB0
aG91Z2h0IGl0IHNob3VsZCBiZSB0aGUgb2Zmc2V0IG9mIHRoZSBzdHJ1Y3R1cmUsIGxpa2Ugb2Zm
c2V0b2YoKSBkby4NCj4gPiBCdXQgaXQgdHVybnMgb3V0IG5vdCBjb3JyZWN0IHdoZW4gSSBhc2sg
aXQgdG8gY2hhdGdwdC4gQW5kIGhlcmUgaXMgYW4gYXJ0aWNsZSB0bw0KPiBleHBsYWluIGl0Og0K
PiA+IGh0dHBzOi8vbWVkaXVtLmNvbS9AQ29kZV9BbmFseXNpcy9udWxsLXBvaW50ZXItZGVyZWZl
cmVuY2luZy1jYXVzZXMtDQo+IHVuDQo+ID4gZGVmaW5lZC1iZWhhdmlvci0zMjQ2MmEyMDAxMDYN
Cj4gPg0KPiA+IFNvLCBJIHN0aWxsIHByZWZlciB0byBtb3ZlIHRoZSBhc3NpZ25tZW50IHRvIGFm
dGVyIHRoZSAhZ3QgY2hlY2suIPCfmIoNCg0KSGksDQpUaGUgbnVsbCBjaGVjayBvbiBbMV0gYXQg
dGltZSBwZiBpbml0aWFsaXphdGlvbiBzb2x2ZXMgdGhlIHVuZGVmaW5lZCBiZWhhdmlvci4gDQpp
LmUuICpnc2MgPSBndCA/ICZndC0+dWMuZ3NjIDogTlVMTDsNCj4gDQo+IEkgZG9uJ3QgaGF2ZSBh
Y2Nlc3MgdG8gdGhlIEMgc3RhbmRhcmQsIGJ1dCB0aGUgYXJ0aWNsZSBhbmQgaXRzIGxpbmtlZCBt
YXRlcmlhbA0KPiBzb3VuZCBjb252aW5jaW5nLiAgVGhhbmtzIGZvciBzaGFyaW5nIHRoYXQhDQo+
IA0KPiBJJ2xsIGluY29ycG9yYXRlIHlvdXIgc3VnZ2VzdGlvbi4NCj4gDQo+IC0tDQo+IEd1c3Rh
dm8gU291c2ENCj4gDQo+ID4NCj4gPiBTaHVpY2hlbmcNCj4gPg0KPiA+Pg0KPiA+PiA+IEkgd291
bGQgcHJlZmVyIHRvIG1vdmUgdGhpcyBhc3NpZ25tZW50IHRvIGFmdGVyIGJlbG93IGNoZWNrLg0K
PiA+Pg0KPiA+PiBJIHRoaW5rIHRoYXQgbWlnaHQgYmUgdW5lY2Vzc2FyeS4gV291bGQgeW91IGFn
cmVlIHdpdGgga2VlcGluZyBpdA0KPiA+PiBhcy1pcyBiYXNlZCBvbiBteSBhcmd1bWVudCBhYm92
ZT8NCj4gPj4NCj4gPj4gPg0KPiA+PiA+Pg0KPiA+PiA+PiArCWlmICghZ3QpIHsNCj4gPj4gPj4g
KwkJZHJtX2RiZ19rbXMoJnhlLT5kcm0sDQo+ID4+ID4+ICsJCQkgICAgIm5vdCBjaGVja2luZyBH
U0Mgc3RhdHVzIGZvciBIRENQMi54OiBtZWRpYSBHVCBub3QNCj4gPj4gPj4gcHJlc2VudCBvciBk
aXNhYmxlZFxuIik7DQo+ID4+ID4+ICsJCXJldHVybiBmYWxzZTsNCj4gPj4gPj4gKwl9DQpbMl0g
DQpjb3VsZCBtb3ZlIHRoZSBhc3NpZ25tZW50IG9mIHRoZSBnc2MgaGVyZSBhdCBbMl0uIA0KDQpJ
IHNlZSBwbGFjZSBbMV0gbG9vayBnb29kIHRvIG1lLiBJbnN0ZWFkIG1vdmluZyB0aGUgYXNzaWdu
bWVudCBvZiBnc2MgdG8gcGxhY2UgMi4NCg0KRG55YW5lc2h3YXINCg0KPiA+PiA+PiArDQo+ID4+
ID4+ICAJaWYgKCFnc2MgfHwgIXhlX3VjX2Z3X2lzX2F2YWlsYWJsZSgmZ3NjLT5mdykpIHsNCj4g
Pj4gPg0KPiA+PiA+IEJUVywgaWYgZ3QgaXMgbm90IE5VTEwsIHRoZW4gZ3NjIGNhbm5vdCBiZSBO
VUxMLiBTbyB0aGlzICIhZ3NjIg0KPiA+PiA+IGNoZWNrIGNvdWxkIGJlIGRyb3BwZWQuDQo+ID4+
DQo+ID4+IFllcC4gTWFrZXMgc2Vuc2UuDQo+ID4+DQo+ID4+IC0tDQo+ID4+IEd1c3Rhdm8gU291
c2ENCj4gPj4NCj4gPj4gPg0KPiA+PiA+IFNodWljaGVuZw0KPiA+PiA+DQo+ID4+ID4+ICAJCWRy
bV9kYmdfa21zKCZ4ZS0+ZHJtLA0KPiA+PiA+PiAgCQkJICAgICJHU0MgQ29tcG9uZW50cyBub3Qg
cmVhZHkgZm9yIEhEQ1AyLnhcbiIpOw0KPiA+PiA+Pg0KPiA+PiA+PiAtLS0NCj4gPj4gPj4gYmFz
ZS1jb21taXQ6IDQwZTUyZWQ2YzY2Y2VmMDkxNTc5ZGQ3ZmU0OWNjZDJkZTEzNWY1YzUNCj4gPj4g
Pj4gY2hhbmdlLWlkOiAyMDI2MDMwMi1jaGVjay1mb3ItbnVsbC1tZWRpYV9ndC1pbi0NCj4gPj4g
Pj4gaW50ZWxfaGRjcF9nc2NfY2hlY2tfc3RhdHVzLTA3MTg5OGI4YTQwMg0KPiA+PiA+Pg0KPiA+
PiA+PiBCZXN0IHJlZ2FyZHMsDQo+ID4+ID4+IC0tDQo+ID4+ID4+IEd1c3Rhdm8gU291c2EgPGd1
c3Rhdm8uc291c2FAaW50ZWwuY29tPg0K
