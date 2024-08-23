Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B3AC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 09:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1866910E04C;
	Fri, 23 Aug 2024 09:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1G3v/H6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6E810E04C
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724405662; x=1755941662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qcm2s+2D2m8m/nJqD0mrLawgxwlqf681ZFSFfMBv8FQ=;
 b=l1G3v/H6S4sOFOqdVFRYXG9Z2MbpURehWDXau1H0xHcxd+aIhsF4w/gl
 j0pCjk4RpDBSMBEme8MUQwXnYgxh8Dh65KCkPGv/UXEFxguzNMStWBNPw
 LxtM6rMHjRGosI9y3+o4a78C5c7huMcLffX/hT+XGRyUt+5cbPZvJslYk
 l+MCa8Ltw8iK+yMzGxKO2FnIWgjFRdWXc1WywSm7FUobeASx0DSKtZwNM
 TimAbBJ5EB/ycKp4QioofpY8SVNkl0FDq/hWLMVL9gUXCnmuPUDQlsZbx
 9DfOOBlL4uwGtC38xo8RLoJQsfuB9wTyC15PodSx/MUBq19G5IpSLZnva w==;
X-CSE-ConnectionGUID: Ji9Yz8QFTfGWFkBolRYUGw==
X-CSE-MsgGUID: wnssEDLQQE6W51Eix8hvag==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25760589"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="25760589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:34:21 -0700
X-CSE-ConnectionGUID: 6wN9fWsiQPOj5Pb7LqKimw==
X-CSE-MsgGUID: ci9T9sckS2mGhhnPMNFnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61894007"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 02:34:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 02:34:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 02:34:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 02:34:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiArzBRGVZsmDZtdeAbE4UoMRr8fHmpplkKBMXg11YWJMBmPN44jDaVOkMIdP7h91bC7F0aI1F+m8PXZo3yfLYJErf4EtcNvnqll6SRHUnmYcXatqn0b+ZOZ73PhYCRv8ohvWejKcoBk9aP0vCQ+zyTXOFxT2jCUgz0CEm3RS+FhQAVunvWtDSCGjPzvvYdagakHJLWkX9litivZE3/hg2EAszGRRD5WXcPUIKWpzoeP3nB7TnDFeFDftRFkJ14lgVRAMmJvwxWVUgjrGcZCJShsXb9AyRHTKUBWeldOy5H6dul1aKCsWxf/5QUbDvTTu+3Mw0NiatL953IG38bIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcm2s+2D2m8m/nJqD0mrLawgxwlqf681ZFSFfMBv8FQ=;
 b=AI4XvyrAoX5HfBC1ulmr2yrxzkzc+R2I+vG+DskxCNkjndcdo3TIZhY4cDCN+XOy6OXnHB3xOku0fukTBxfHyEQBYBfLVx0xJyMgJbd3cMYsqIT/8eLTO867wBp8NucYByfPajW9wYsf1qgiO8jWQocawxnzx+pj1XWTHmAvJ19uJxjLJZ2YT6kpl3UbJrlnfzkqAWr6fqjvNXy30+E3ZJuRIO0sC/iEd6LdAR3q7j9aLELL++ojBUQZAd0tJ8B507pfm6StMlrsqZxQ+rxckmByPGJVENFTP1sNhHrNUbhbN2yRLirwB1IzLuSM31178sMLH7bjn7S5dkb4sK3QoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB7999.namprd11.prod.outlook.com (2603:10b6:8:123::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 09:34:12 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 09:34:12 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: RE: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Topic: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Index: AQHa8yRxSHbN2EGPg0GDkKIKvSAJeLI0MqbAgAA9ZwCAABW+MIAAC96AgAAG4SA=
Date: Fri, 23 Aug 2024 09:34:12 +0000
Message-ID: <IA0PR11MB73074E9E9EC279B63FE23C17BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-3-vinod.govindapillai@intel.com>
 <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
 <160aa8f8d1bc55fd12f6332a27aa325da3a0e944.camel@intel.com>
 <IA0PR11MB73074BBC068B36B8DD98EC24BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
 <69f1c61b5d24b166f5ff3cfe966744c623969575.camel@intel.com>
In-Reply-To: <69f1c61b5d24b166f5ff3cfe966744c623969575.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB7999:EE_
x-ms-office365-filtering-correlation-id: 7a78b552-854c-491f-9848-08dcc356bf3c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDNESmdaUnRyaTg1L3B2dGNxci9ja2p1a0pySmt1U1ZRMFVTZ3NMVXc3RDgx?=
 =?utf-8?B?c01aeFZwT3RaYUxtWm9Za2M4V0NseEtuY3dNRXpkMGhrZ3BpaWZ0TUhuZ1NE?=
 =?utf-8?B?ZlVyUDQ3SHN0WlZLUndhdWRGN0Y4akM4QXpLR0dFOVZzd2lCbXhMeWszb00y?=
 =?utf-8?B?NFBvYzFqL1UrKzRZQXRVZ3hUQVg4bWFySUtIeDZ4WXA1U0lwVmNMbGZGayti?=
 =?utf-8?B?Zm5sSVUvZ0NmbXR4NTZTaEszMnVOT01RTkdPZ3FScTR2RlpuQUNlZ3VjdGVG?=
 =?utf-8?B?NVJBV1F2QmJqU3ozMjA2SjJBMGRMUjVOV2tPQXo2YU9FQ3RyTDZOMTJkQ00r?=
 =?utf-8?B?ZnluUUhkRlZ3cXAvVVpZSnhReE1keDJOYTZLSGQ3cC9LNDFDWWdZS2w0ZDNY?=
 =?utf-8?B?RXo5Wm0zNkZqS0h1WmwybzQ1SnQwYU1BUW5YOGRxK2RjZHFwREdGdW8wd2Ex?=
 =?utf-8?B?ZE9uVzdXMUxGeDV0NW15Q3FkYk1IU2VDeXJmdTJtN2FSQUY2bVlsbElCV1Zh?=
 =?utf-8?B?cXpyUkF6OHM4aTNpYzNyREJuUGJMcXBnOE9SajFKclJtWHc0elBDRkxrUW94?=
 =?utf-8?B?RUFXMGhNSTJaT2xoYm5CVEpxQWppaGJDQzVpQjBCTmw0eFBncWNOVGlZTWRo?=
 =?utf-8?B?N3Zmcm5vQXBKakVDTlJZcDNJd3VUTm5Jcy90UEFremxhend5cGVJYkI3akFL?=
 =?utf-8?B?bDBrSDU2R0ZPSTFXSndqcnhESFNSaVR2YS80eWljalExNDBUVVB4M3pGM1hL?=
 =?utf-8?B?QlpFYkJSSWNLblI0RjlLejlaQk9jZG1wbC9oNzN5WGozZUk4bVZvMHl2UFor?=
 =?utf-8?B?bXNrbnFnUzVhaUlJM3dwWTdETStRY2VFUkxMdFhwWjdKbmZ2RCtWS2Fsb1NO?=
 =?utf-8?B?NnRHcTRQWlB3YzRRNUZQYlM1eG1sckJHbmMrOHVlQmxoaGptTjNJNFh1eG95?=
 =?utf-8?B?YmNJNlRtZmhFNHBoRHg2MnI0anF5VFpKTGIyd3hWeE5GZTUwY2dQeVJKZVdN?=
 =?utf-8?B?cnFWN1VJREowWTIvQVJSckc5K2czT3lpT2xkZEJJcW5HeHdkdTUxRUZaTGdF?=
 =?utf-8?B?TDNjRHd2K0tHUVg0dm9kS0UxTStwa1VuNk1zZXJEcEV2Q2tqcEhjbS84WklC?=
 =?utf-8?B?ZDBBaEY0cEhPU1U1QjV2bTY2bnlOVEdwRllGVDBWTkVtblo2L0xxdWpodnJY?=
 =?utf-8?B?NEFRM3VodnBCcFFwS0diVTIrTlNBZzQzK3grME5mUElmblRUOFBZOVM1dDlz?=
 =?utf-8?B?NThZZ3hCbFpSRHhSMWpTU3FQM1RoMlpnVVF4T1VIUjlrM2hYWCsveTJ5MDQ0?=
 =?utf-8?B?Qjh0TCt3TWRtanBjWWRZSVVocldqYkJ4Ujk1ajduaDA1dFBQcHpIeVJmWDk3?=
 =?utf-8?B?Z3BVb2RJZW5XWTF1aitQWFVLK1A5TlF1Mi9ncGorL0NURGJUT0pBNHF3TnBz?=
 =?utf-8?B?TXZzdU9xbzY3cjFtcGpObGV6dGJxcW9wcGJEZ2RXcS8zcXoweG1hU2taVlN1?=
 =?utf-8?B?ZzlGOXY0ZlpPM1kzRFc5YndIbU9FbHI2aXhaT21qUmh1ZXorR0czRGN4Slla?=
 =?utf-8?B?WkxkTFRpb0lkRCtoYk5JTStQRENHQkZDcGEyb2U4RU1nWEwzM0dUd3RiUnZG?=
 =?utf-8?B?ZjUvbTJzK011UC9FVk1iS0Jmenp4UlluMWx1SGwwL29NM0ZxYmZ5TlcyQ3gr?=
 =?utf-8?B?Rk5CaGE3eHllYkMxbHRKMFdQa3FPOXQyUnJRQVp6OTNSaGZDMVMrN3NyTXE1?=
 =?utf-8?B?RGlORjNEM20xWEpYeUZjbTlPWENIL09Ic1RsNUhJZlFMQ1lFZG9TU0hySkFi?=
 =?utf-8?B?ZGIzTW9nU0R2TEZUMDVpRExpazZyb0pKSFdqeENJRGxQakQ4dldBcDJzTzRt?=
 =?utf-8?B?S3JWU1ZmS3VwUVlFRlZyY2p0RzJrN21INSt5Y3hXeGdLeEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlZBcEhuZGZDK0k3MFdkcUxqb1pvdmRVbFErajFSWHJkTlVuTVlqN211a0NO?=
 =?utf-8?B?YnM3bVVHcThKRlpOSWFGNGlJMlM1TjAwVkhxMXpYUU5IdmRuUWdLTDlGSzRN?=
 =?utf-8?B?NFY0YXZxOTk1Nms5bHdwV2ViVEFRQjVqVkFaRDdoRHpSVEtWQ0FIV1NQbHZ1?=
 =?utf-8?B?NjBxSGRVSVE5cEZuUzlBUkJjUC95Q05lL1NSQSt6SUl3WXlwdTVMYWhxQklM?=
 =?utf-8?B?RmE0MnMxQ3NUMTlNcTlSaFNjWnNhOU1YOE9xZm41NFJIOWppMDc1a3BuYnB1?=
 =?utf-8?B?SEMya3IrREgwcXZ0UW5HUWhzZTZmVVByeGhlNHlzMklhd2czeU9wRytnSXM4?=
 =?utf-8?B?b3BnenEwOXhHZHNYemlYMGZxL3dBRlh1U08wMnJvdjk3TTNkTDF1U1RlaEtl?=
 =?utf-8?B?MWRCaVN3ZXNETWsxNTRodnNOZ2pWVUtnNkNmaklXTUY3TWhOaHNqdUF3UEgv?=
 =?utf-8?B?aEJTYVlvU0JoTWNTbWQvS0w4ZDRlTmgvQm9uZDc4LzlqQkd3RnZ3R3lIRkU1?=
 =?utf-8?B?Q0N6Yk53YWw3ZHZNc3dqeVlDdk84L3paT3UwZ0xmbTRnS2lZbHVMN1l1bFBG?=
 =?utf-8?B?N2o5WnRSczN2b0xsN2FubHlBaGw2b2svYmR2SGtKNXp2OUxEVnVNWDh3c2lS?=
 =?utf-8?B?czdEVjNzR3B6cXNtWHVlbGVxOHBmVXFvZmVlMlNrS3JIVUt5c3VwV3RNRFpq?=
 =?utf-8?B?SXpHUjdIdSsrcGozSS9rZXNZL1RNNHh6SkFDUm0xNVlZTElsMFBxdklwZ1JX?=
 =?utf-8?B?RGcxWWFjQWFWRmd0aFpoRXBIUHJvTTQrdzRLVkxRRnVDUmRaclIyUXNDbGN3?=
 =?utf-8?B?ZXp3dzh0ODlNUTkvckx6VmNJVTVOaXRoVDVTcUczbUNiTFVjLzVDNkp3bzRK?=
 =?utf-8?B?V1hlSVprU2FDK3l6OVNUNUtXc2tzek1jYWNTOEszNTFEWDJvVUlyVlhwUHJj?=
 =?utf-8?B?TTJpVS9MaHVacGRDL28yUEdQTTh6U0dUTnJXTzN4cnViQXNDRXNaVk9VMlhB?=
 =?utf-8?B?dFd2eXFQeGJyV09od2NmSW9udG9PNUgvdkllbkZwSk15amRSdGtZSGRjblMr?=
 =?utf-8?B?cXVHajdpQlRsWTdIZXhzenh1WTlybEdoUU95d0RTOHg5UGlBZFp0WUJkQ2dn?=
 =?utf-8?B?YkN6SjYxT3hGMThqUnhVbk9IY1luQ1Vhdm5sK0tYYklReFZ5VEJHVk5UeFB5?=
 =?utf-8?B?Tm5ZbkdiQUlQQ1BCVVZmQkhiMDhWSkdBTG9nOENwazRobmp6a1I4TFNNbi9T?=
 =?utf-8?B?Z3FZQnV0S2NZWXpJUWl2M3VkalR6YXVXYVVrbUEybEh5M1hIbkJ0MkxKMUpO?=
 =?utf-8?B?aWVqTm1TWFIzQlFFaEE1NkhWYVRtUlpGUFFLTXRyOUNpbWloVXJ0MzlCd1A1?=
 =?utf-8?B?UHNHSzN0Z0E3Z0lYWktPT2pvbzFwUmZYWEpsTmI2Q0RyV3U2QlMveVZ3UGor?=
 =?utf-8?B?MCtodTR0K2ZtUzVNK2p4SGlSSFhmVkVCRFhPV0ZHWVhabTc4WHJLMVhySlZz?=
 =?utf-8?B?b0JxeXlGVUQycnpGamVablU2MllXL0V5WHhudk1KTW84Zkxlamx2WjRUZ1FG?=
 =?utf-8?B?eVFyVnJvZFNBU2lnZE9lUklqT214YUFTb0l4d3JkeDBvNHdOUzZEaEdpSUh3?=
 =?utf-8?B?TEt3bjdzMkVLS0pxcU1pUjkzRUhRdmt5UWpBcjl2SUZ2LzZpOWdxb1VaZHcv?=
 =?utf-8?B?bEl3SkRYdFlla1dVSmJZZzZaL0hTRDdnb2NzaE9wb3l6NWtITjB2NkMrQ3J6?=
 =?utf-8?B?aTZlcnE2dnlILzZiTUEzc09yTlU5aWZmV3ExSm42L0xNZEd3NHlRWExBWkdz?=
 =?utf-8?B?VnhGRFJLb29GYzkxeTZaVUlZbi82c1RqZ1FndHAySmxHTnJmY3ptWHpYa2VT?=
 =?utf-8?B?RGlnc1JlZVZsbFBXZ0JROFFvZTI5R0MzZEh2eXRnTlB6NFpZNDUrTUJNR1FW?=
 =?utf-8?B?TDlMdjloYXh5WU9tY09rQnJXc1JCOCtGaGZHOVdZcVpYaEVtOXkraWp4aEtl?=
 =?utf-8?B?R1kvWlZlQ0pGNDg3cDA3OHlYMU1aVWR3bU5uUUZESUFJS096SkVnVXVyMHRr?=
 =?utf-8?B?bDQrd1JFOWlKQmszTXNGSU5GNXhXTlZCbGJqUjhaemhqVi96NU0wbDUza29D?=
 =?utf-8?Q?M2cUcLsSxRom/sWl8jFifd10t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a78b552-854c-491f-9848-08dcc356bf3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 09:34:12.2533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TnG77oFmKG+znKTCfFYZ8rbEQu/cSZlVifteRSH7yfaBw45cK7O5HepRdQfkD4JMxxA/pQ8FYQfuWkNl2McOag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7999
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHb3ZpbmRhcGlsbGFpLCBWaW5v
ZCA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0
IDIzLCAyMDI0IDI6MzggUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGlu
dGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogU2hhbmthciwg
VW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvDQo+IDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPjsgRGVhaywgSW1yZSA8aW1yZS5kZWFrQGludGVsLmNvbT47DQo+IHZpbGxl
LnN5cmFsYUBpbnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzNdIGRybS94ZTog
SGFuZGxlIHBvbGxpbmcgb25seSBmb3Igc3lzdGVtIHMvciBpbg0KPiB4ZV9kaXNwbGF5X3BtX3N1
c3BlbmQvcmVzdW1lKCkNCj4gDQo+IE9uIEZyaSwgMjAyNC0wOC0yMyBhdCAwODo0MyArMDAwMCwg
TXVydGh5LCBBcnVuIFIgd3JvdGU6DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiA+ID4gaW5kZXggYWQ3ZmM1MTM3YjQyLi5i
MmEwYjRiNWM0NWMgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rp
c3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rp
c3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiA+ID4gQEAgLTMyMCwxNSArMzIwLDEzIEBAIHZvaWQg
eGVfZGlzcGxheV9wbV9zdXNwZW5kKHN0cnVjdA0KPiA+ID4gPiA+IHhlX2RldmljZSAqeGUsIGJv
b2wgcnVudGltZSkNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICogcHJvcGVybHkuDQo+ID4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRl
bF9wb3dlcl9kb21haW5zX2Rpc2FibGUoeGUpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gVW4tbmVj
ZXNzYXJ5IGNoYW5nZS4NCj4gPiA+ID4NCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxf
ZmJkZXZfc2V0X3N1c3BlbmQoJnhlLT5kcm0sDQo+ID4gPiA+ID4gRkJJTkZPX1NUQVRFX1NVU1BF
TkRFRCwgdHJ1ZSk7DQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKGhhc19kaXNwbGF5KHhl
KSkgew0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcnVudGltZSAmJiBoYXNfZGlzcGxh
eSh4ZSkpIHsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9r
bXNfaGVscGVyX3BvbGxfZGlzYWJsZSgmeGUtPmRybSk7DQo+ID4gPiA+DQo+ID4gPiA+IENhbiB3
ZSBnZXQgcmlkIG9mIHRoaXMgQVBJIGFzIHdlIGRvbid0IHJlcGx5IG9uIGRldmljZSBwb2xsaW5n
IGFuZA0KPiA+ID4gPiB1c2UgaW50ZXJydXB0DQo+ID4gPiBiYXNlZC4NCj4gPiA+DQo+ID4gPiBO
b3Qgc3VyZSBpZiBJIHVuZGVyc3RhbmQgdGhlIHBvaW50ISBXb25kZXIgaWYgaXQgaXMgcmVsZXZh
bnQgYXQgdGhpcw0KPiA+ID4gY29udGV4dCEgQnV0IGFzIG1lbnRpb25lZCBpbiB0aGUgc2VyaWVz
IHBhdGNoIGRlc2NyaXB0aW9uLCB0aGVyZQ0KPiA+ID4gY291bGQgYmUgZmV3IG90aGVyIHN0ZXBz
IG1pc3NpbmcgaW4gdGhlIHhlIHJ1bnRpbWVfc3VzcGVuZCBoYW5kbGluZw0KPiA+ID4gYW5kIGEg
YmV0dGVyIHJlZmFjdG9yaW5nL2NoYW5nZXMgYXJlIGJlaW5nIHBsYW5uZWQuIFNvIEkgZ3Vlc3Mg
eW91IGNvdWxkDQo+IHRha2UgdGhpcyB1cCBhdCB0aGF0IHRpbWU/DQo+ID4gPg0KPiA+IE5vdGhp
bmcgbWlzc2luZyBhcyBzdWNoLCByYXRoZXIgdGhpcw0KPiBmdW5jdGlvbihkcm1fa21zX2hlbHBl
cl9wb2xsX2VuYWJsZS9kaXNhYmxlKSBpcyBub3QgcmVxdWlyZWQuDQo+ID4gSTkxNSB1c2VzIGlu
dGVycnVwdCBiYXNlZCBkZXRlY3Rpb24gYW5kIG5vdCBwb2xsaW5nLiBFdmVuIGlmIGNhbGxlZA0K
PiA+IHdoZW4gcG9sbGluZyBpcyBub3QgZW5hYmxlZCwgd2lsbCBoYXZlIG5vIGltcGFjdCBhbmQg
anVzdCByZXR1cm4gd2l0aCB3YXJuaW5nLg0KPiA+IElmIHRvIGJlIHRha2VuIGxhdGVyIGNhbiB3
ZSBoYXZlIGEgVE9ETyBvciBSZS12aXNpdCBzbyB0aGF0IHdlIGRvbuKAmXQgbWlzcy4NCj4gDQo+
ICJXaGlsZSB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQvcmVzdW1lKCkgcGVyZm9ybXMgc3RlcHMgZHVy
aW5nIHJ1bnRpbWUNCj4gc3VzcGVuZC9yZXN1bWUgdGhhdCBzaG91bGRuJ3QgaGFwcGVuLCBsaWtl
IHN1c3BlbmRpbmcgTVNUIGFuZCB0aGV5IGFyZQ0KPiBtaXNzaW5nIG90aGVyIHN0ZXBzIGxpa2Ug
ZW5hYmxpbmcgREM5LCB0aGlzIHBhdGNoc2V0IGlzIG1lYW50IHRvIGtlZXAgdGhlIGN1cnJlbnQN
Cj4gYmVoYXZpb3Igd3J0LiB0aGVzZSwgbGVhdmluZyB0aGUgY29ycmVzcG9uZGluZyB1cGRhdGVz
IGZvciBhIGZvbGxvdy11cCINCj4gDQo+ICJkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQvZHJtX2tt
c19oZWxwZXJfcG9sbF9kaXNhYmxlL2RybV9rbXNfaGVscGVyX3BvDQo+IGxsX2VuYWJsZSIgaWYg
eW91IGZlZWwgaXMgbm90IG5lZWRlZCwgaSBndWVzcyBpdCBzaG91bGQgYmUgdGFrZW4gdXAgYXMg
c2VwYXJhdGUNCj4gdGFzay4gSSBkb24ndCB0aGluayBhIGFkZGluZyBhIFRPRE8gaW4gdGhpcyBw
YXRjaCAvIHNlcmllcyBjb250ZXh0IGlzIHJlcXVpcmVkLg0KPiANCkFwYXJ0IGZyb20gdGhpcyBw
YXRjaCBsb29rcyBnb29kIHRvIG1lLg0KDQpSZXZpZXdlZC1ieTogQXJ1biBSIE11cnRoeSA8YXJ1
bi5yLm11cnRoeUBpbnRlbC5jb20+DQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBNdXJ0
aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCj4gQlINCj4gVmlub2QNCj4gDQo+ID4NCj4gPiA+
ID4NCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFydW50aW1l
KQ0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiBpbnRlbF9kaXNwbGF5X2RyaXZlcl9kaXNhYmxlX3Vz
ZXJfYWNjZXNzKHhlKTsNCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+ID4gLQ0K
PiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICghcnVudGltZSkNCj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGlzcGxheV9kcml2ZXJfZGlzYWJsZV91c2Vy
X2FjY2Vzcyh4ZSk7DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
bnRlbF9kaXNwbGF5X2RyaXZlcl9zdXNwZW5kKHhlKTsNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqB9DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfZGlzcGxheV9mbHVz
aF9jbGVhbnVwX3dvcmsoeGUpOw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQEAgLTM4NywxNSArMzg1
LDEyIEBAIHZvaWQgeGVfZGlzcGxheV9wbV9yZXN1bWUoc3RydWN0IHhlX2RldmljZQ0KPiA+ID4g
PiA+ICp4ZSwgYm9vbCBydW50aW1lKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoC8qIE1TVCBzaWRlYmFuZCByZXF1aXJlcyBIUEQgaW50ZXJydXB0cyBlbmFibGVkICovDQo+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2RwX21zdF9yZXN1bWUoeGUpOw0KPiA+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoGlmICghcnVudGltZSkNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqBpZiAoIXJ1bnRpbWUgJiYgaGFzX2Rpc3BsYXkoeGUpKSB7DQo+ID4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5X2RyaXZlcl9yZXN1bWUoeGUpOw0K
PiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoaGFzX2Rpc3BsYXkoeGUp
KSB7DQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fa21zX2hl
bHBlcl9wb2xsX2VuYWJsZSgmeGUtPmRybSk7DQo+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmICghcnVudGltZSkNCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gaW50ZWxf
ZGlzcGxheV9kcml2ZXJfZW5hYmxlX3VzZXJfYWNjZXNzKHhlKTsNCj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGlzcGxheV9kcml2ZXJfZW5hYmxlX3VzZXJf
YWNjZXNzKHhlKTsNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50
ZWxfaHBkX3BvbGxfZGlzYWJsZSh4ZSk7DQo+ID4gPiA+IERvIHdlIG5lZWQgdGhpcyBkaXNhYmxl
IGhlcmUgYXMgd2UgYXJlIGVuYWJsaW5nIHRoaXMgb25seSBpbg0KPiA+ID4gPiB4ZV9kaXNwbGF5
X3BtX3J1bnRpbWVfc3VzcGVuZCgpIGFuZCBoZW5jZSBkaXNhYmxlIG9ubHkgaW4NCj4gPiA+ID4g
eGVfZGlzcGxheV9wbV9ydW50aW1lX3Jlc3VtZSgpDQo+ID4gPg0KPiA+ID4gVG8gcXVvdGUgSW1y
ZSwNCj4gPiA+DQo+ID4gPiAiaW50ZWxfaHBkX3BvbGxfZGlzYWJsZSgpIGlzIG5lZWRlZCBkdXJp
bmcgc3lzdGVtIHJlc3VtZSBhcyB3ZWxsLA0KPiA+ID4gc2luY2UgaXQgZG9lcyBhbiBleHBsaWNp
dCBjb25uZWN0b3IgcHJvYmluZy4gVGhpcyBwcm9iaW5nIGlzIG5lZWRlZA0KPiA+ID4gYWxzbyB3
aGVuIHlvdSByZXN1bWUgZnJvbSBTMyBldGMsIGZvciBtb25pdG9ycyB0aGF0IGdvdCBjb25uZWN0
ZWQNCj4gPiA+IGR1cmluZyB0aGUgc3lzdGVtIHdhcyBzdXNwZW5kZWQuIg0KPiA+ID4NCj4gPiBU
aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLg0KPiA+DQo+ID4gVGhhbmtzIGFuZCBSZWdhcmRz
LA0KPiA+IEFydW4gUiBNdXJ0aHkNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQoNCg==
