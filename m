Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A4AC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 16:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A047410E152;
	Wed, 10 Jul 2024 16:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVeLVOd3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C70B10E152
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720628238; x=1752164238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=56zVVqvc0A8mQehR3ur2OBEPZcZNM0TymKO1IZXWu7o=;
 b=JVeLVOd3sSwEctG36Cq4KCh9ey51dbM89ufq3IQf9kwexjBOCp/ti1Px
 sIsFjbSxDTTmuFPOZ7lHrmt9kG+qHBbQGEc5RnTFG3kUcbLCE2/kDXcZM
 ncsPQJ3MUcfnMrdRV4Y/P4N5Xj+QEbDk6ywAz6cL8pLzgFxZpFVVxdWQg
 iuCoyO9mkjLAOgoi5J6zUnmPjTjju0bZHHSCNQmECrN8R25ub7csxySe+
 6/rlHW0OSAp6GCBY2phaDfN9+lCHpd2qGRpQpN3GlUNGipT2e9nxi6LYP
 jCZTEjBe7Da2xhUJUoBOTQh49wpZndHxkDOzWjYrdZ435O+j0+JsoF2Jw g==;
X-CSE-ConnectionGUID: 7+FDYOVbTeCCEx4SLOYi/Q==
X-CSE-MsgGUID: n85g86p3QTKwqudz7k4zew==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17834582"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17834582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 09:17:17 -0700
X-CSE-ConnectionGUID: SxrL0145QDKv9eU5gMis2A==
X-CSE-MsgGUID: gEN9BXM1S/m5CpWj/yo6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="52865798"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 09:17:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 09:17:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 09:17:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 09:17:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 09:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1OnXWhGh+MiJExaqr+peE08Nt7KpJAfiAa3FvNXBwyP5+TDVHQxPxUkVw9vT3m81AVUIJh6RcEpcpuTlEHfmPrq1/9bg6kKJx1C8XANaJSiD8CjyNRMKm4vLEJmKB8ASS5kXcw10sesUJyNfMPxobdOdVbSqeGCoCLFpE/FyNCetyAAXsI6/iD3T8F0Vozm/RtfecDFoS4E3AB3pDGW7cqnVVe0NeSHMGx6iAD9YTOtYguv7iMTGh6fYW6jZFSsfDOjB2Hk5e5NJ0Vw4MSUeKhwpWnQcRcq6EkerGjjPzoNPbg3ySyt0mP/R8sb+57hQbK/sCTZoIDIVglrFo9M5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56zVVqvc0A8mQehR3ur2OBEPZcZNM0TymKO1IZXWu7o=;
 b=jBlf6HmnN0T3juSyjHGGhRTFRW1gIG/lEvExjIwCXJ7nO2Y8vm7FNIi9w5AC7dfg6Ov6f61RrUh00y0zI70suGb2XaoB3ZuAJNRn79gEkxokksKM0psUgvU+rvJSAUwMt884n0Is4QOPB+qylLVQeLgAfuEydbKIH0MyYu/vuBgaq/rBlIvQWDHmETBBS2+xuKok6sdwaiAF2vc3O7aPs/kPH1jc9p3jtoIL33Xxm70dev45GTSmSTt0inf88thgC1mWwIS35kSOCiCCOkCe1seDGwMY7GAQ1OOeFOplIA0yMMVvnVHtXzzDcz1YpyD019TI1JiRiPGN19RIZC8UPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 16:17:10 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 16:17:10 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Expose EU width via topology query
Thread-Topic: [PATCH] drm/xe/uapi: Expose EU width via topology query
Thread-Index: AQHa0o23ZwyB6+1XsUOAuK1Jm1mldbHwDIEAgAACCYCAABWTAA==
Date: Wed, 10 Jul 2024 16:17:10 +0000
Message-ID: <f86f49ad7dac5b1c2d1ef3ffcb10082a1ffe135e.camel@intel.com>
References: <20240710055440.1985620-1-lucas.demarchi@intel.com>
 <20240710145238.GD2905419@mdroper-desk1.amr.corp.intel.com>
 <llboo4x7ihtit737wa23qmws4n7q5szvuvhxlakkvr4hhxshuc@gpbsxzfgrosw>
In-Reply-To: <llboo4x7ihtit737wa23qmws4n7q5szvuvhxlakkvr4hhxshuc@gpbsxzfgrosw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6699:EE_
x-ms-office365-filtering-correlation-id: 6e21056c-547f-4bd8-c395-08dca0fbc06c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NHpQZENlK3pyQzZIOXFhNDQwNjRVU1dRMlRPeHdja1ZLek5mK0d5L04xa0sv?=
 =?utf-8?B?S2tha0I3ZWlKblg1bkdJb0VZUzZhcDZkZVhwakNEYURUb0FlWkNEZVo1ckpz?=
 =?utf-8?B?Y2ErRDZOVWF0TDN2SnYxdVZHUFNPckVMV1BId0FRdGdqdHhKdjg5WFFQbWlC?=
 =?utf-8?B?eWlyNThhbEZ4aW96Uy9JTkNtNldkRDZqUFBrYkJkeWlhK3Y2c1V0d0FHMU1u?=
 =?utf-8?B?cXBQYS9IZ280bExLdStpbTZ2NFgzTHU3akVSTUEyWVJzK0ZLTWt5TXF3ZXJn?=
 =?utf-8?B?N0pBVEdBRDc3dzNDWGxtZS8ydTJpcEpISUZnbFZScWNuWWxseWtJWU9rbUtD?=
 =?utf-8?B?ZitqZDZ4UDQ4azZCNHZZckQyTWVGMjI5VXcva0h1bVRrWU12aU0wUkNCTW5O?=
 =?utf-8?B?WEJWS0ZZeGhBbmtzOG9yS2FaM284TkpSazJGbjE3bzZKbDlsR0Z0M2szbXBl?=
 =?utf-8?B?WGlIdEpaLzQvaXd3bm9kRDZXQ3AzRG1sQ3FQT2xFM2luc0htZEdOdm9TQjZ4?=
 =?utf-8?B?dGJBUHNBWVZDOXZRbXhkTVVFaGZzRTF4WXVIY3BMeDNSbmtzbWhYTHpiTE1S?=
 =?utf-8?B?SDd3T1ZwYXdXeEprcC9FZVRkMUdLZmFSQ0ZQQ0tJWFg5NG9yNUtKekNvN0hD?=
 =?utf-8?B?RStLUnlGbjRia3pVOFpvNzhrbk9ubkZQMWhRSkhXY3BJZWxpNk1WVXpqcmhB?=
 =?utf-8?B?WXM0RTBJSjZiM1hkdGdGZDB4djJQUXJtWkNDd2FVSlJKVUxQdXZsTkJNNXNk?=
 =?utf-8?B?cEZ4YlBwK3EvR1pmZyt0dXhyRElwTWd3RUtEZGVBd2FDdlBFcjU2aC9YaE1L?=
 =?utf-8?B?bzZjNWRYK2RnRml6c1NxcmhRVXd2UDBsMjR1Z1dqa05ZcXNZQ2p6NFNBNTQw?=
 =?utf-8?B?eDFSeGQ5WU9vcG5aNkNGUXYrMXo4djNpRkVGNjNud1FHNytNUWZFM1poN2hI?=
 =?utf-8?B?VG9nTGhBRFB1aUM3R3kyNkJSVU96RG4vQUNZanEwZlBxTDhRa0pmUzJCdmJH?=
 =?utf-8?B?WkczY2VMbk1HSFoxVlhReVk5ZldQNTI1Y2pObTVKdkQwMlVXTW8xV1VacUx6?=
 =?utf-8?B?T3p2S0lkcWU4cjVKcVZHakFsdXJNT2FIOEN4NXdEN2ZqbGljNFpCVGJaV0hY?=
 =?utf-8?B?Sm1ONE0yL0lSV09wN0l5QTF1SGRVcDFmUmwvb09SVHlzTzRyUVZ2cDkxWENl?=
 =?utf-8?B?QVRvam9ZRC9EcHBsOWN0RnIwWlhkZWwzek1hVHA3SEhmQmxDWjRmeS9kYkJX?=
 =?utf-8?B?OUR1VUZxREttY3ZBcm5MUHMxN2NMUlpGRmpGU2sxcHdibDVVMllmZDl1MTVs?=
 =?utf-8?B?UVR1d0cxeDdYZEpzZmMxaitEenRrYlZBWkpJelU0Zi9oYWxjeVJTbVNnWTJJ?=
 =?utf-8?B?VUNCZEQ4VFRpd1VSdlMyL0pqWS9iVkpkdUNaRmd3NjRwWlZ3NXVvTlFZbkVV?=
 =?utf-8?B?Uk5CMXZLZzhvbVFVaE53NFNpVVpUeWVzbTFvSlFIcU5tRGpQeExVSWVjaGdu?=
 =?utf-8?B?eSs0Q1VTYjVnRWpPWHRmdm5aZmlESm50V2ZXN3NJOHhkR2ZxdTZOSU1aZlhl?=
 =?utf-8?B?T3dHOGV3Nnc3NFFJcFFuNC95RmdkQklmTEc1ZmduTEkxZFphSXFFY01kT0xR?=
 =?utf-8?B?T291TzNnUGw3Q0gyUlpLWDkxdEQ4T21aVFc0ci9YMEo2SXY5Z2dmdzBZTGpQ?=
 =?utf-8?B?cysvd3NnNmJ3ZUd3ZGgzS0h0NjlaQ29Objd3dXBhZmZpdHhpb1R0VFZ1YS94?=
 =?utf-8?B?N0phSDNvUy84LzQzWnVoa0RjVzA2aXRXd0JlN3hHczlNZWtmQUZ5YVo4Y0tU?=
 =?utf-8?B?SFNGbGo2YmRDUkloYXRlZ2ZqY0JCdXQ4bllwN3ozbnBQY0xXaHI3b0w2alZK?=
 =?utf-8?B?LzdtL0VScUEzbStBRnJOejliUW9GTEV4ejNSRHNxMk4yYmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2QrUUF0dGNIcUxBbnlFUVc5bnMveEhSbGQ2UzZlc2hJUFF4Q202VFgzTVVO?=
 =?utf-8?B?UlptMkRWZk9PdHlEOTZRRUU5TGdIeldlZ2E1N2JodVJnN0s4R1pQaTVzUFlt?=
 =?utf-8?B?VFE0c0FiNHUrYXlGdFRxTHJOeExJQmgxK1ltZUtJT294QVhzK293RG5uM08w?=
 =?utf-8?B?ODNMYlBjVzhNL1EyV01TaE13MkFhVm5LY28wL2pjc1dqVmZ6TFdjUGhyZ2U0?=
 =?utf-8?B?V01aRHgxTlFOaFlVWFRuZ051QjZZeGt2NmlqZWpvRkhJQldIdUQxaHhIajd6?=
 =?utf-8?B?cUhxNUJsQzVLZkNRK0s3WWVLOHlmUDU2YUdHMXRkV2RRVFg3dTVCeEQxSXQr?=
 =?utf-8?B?L1VqWVoyRE1aRUhWVnd3TmRUYnQ1djF1dE9jNloyZGQ4VXFVcU9CTDV5UVE1?=
 =?utf-8?B?MFVtMXpxZU1pYVNKcHk2SmxMVldUTzRCNVBNelI3NWttajRVUFZJcVZuSGtE?=
 =?utf-8?B?Zlcra2VJelNydGp1Nmp4SlB4L1NKY2JTZ2FQOThkRHE2RlZ1cHJkVDNNZDgv?=
 =?utf-8?B?YXFzOGRUKzk2TlBBdFI0Vkp5NFFnR1EwR0RQZ0VJeWU3ZHJOUlE5bWNIRjE5?=
 =?utf-8?B?dllaNUVCd0pveWlNeW9FdU5leEQrMXo2Wk9QbXE5dUE5d0doUHAvWEtabllZ?=
 =?utf-8?B?V0xWcUp0TzdlaUo4NTlZMC9ydUUxSzExRWtiVjh0c0J0djhmZkhTRDUzWE1R?=
 =?utf-8?B?cCswTHlRVHNZUVN3enI0aVBmZDVsOThraVpHZUJ6UFN0SSt0RTlCK0VkUXVl?=
 =?utf-8?B?dzhmNmZsTzRaYmw1RmtZQzNmYS9MazVENXIvaHNxb01oQzArWDJBU0VNdnVs?=
 =?utf-8?B?L2I4a2xaUFA3NVU0WnR3c1JKOGZ6clAxT29adFk3K2pvcEs2NnhBSnZVRVQ4?=
 =?utf-8?B?T1BMOGhKOVc4djRRRTVoRDVvakMzZXBPcVprbVg0V2JmYXBmVkNUNm00V3dh?=
 =?utf-8?B?Rm0wV2RNMG1zNzN1MWh6VlNHYzJRTEYzTVhNS3M5MjFaekIwMWQrMnduZzRG?=
 =?utf-8?B?Ymx6MUhSdmRkNlhVaFk4bzRQTXdhSzc2QVUxUk0yNFViS0N1cTBLVzdIVUhY?=
 =?utf-8?B?SGZibUYxNTRhSTF3Tk1NOWRFNC9tVkxzU3ZXcWdJazRLVU04VG1QR2ozYW56?=
 =?utf-8?B?KzEvcXRnZHlPOHZWS0lKb1V4YS9HYWF5RlAxZGdGRTN1UDN4WDQwN1Jkd2hj?=
 =?utf-8?B?WTllYUNRa2pUS3dTMmdWTktCMjZwM01tRHprcXg1eVNXSHRCWGZVSkNrV21r?=
 =?utf-8?B?dmV2aERQdXBqTHpoOStMZGZMV1oyTXM3MlI5WmFoQ2JEbGNrL2g3eTc1TE1u?=
 =?utf-8?B?MU42V1dlWWlWWkF2aFV4c1dHekNSRHZpNjF5cTRVZVNCRHlleE9hK0didElC?=
 =?utf-8?B?K3JOZ1dzMjFzdTB0T1FaSU9uYzM1ZVFyb0syM1FoaDFleG9HRjlrOFJWK3Rv?=
 =?utf-8?B?TVkyRlFFTVJmTFQ5WXFGcWNITFo4eDNORkhKbDR0cGtHeGpuT3RabUlWenQ3?=
 =?utf-8?B?N1hoRVpBQ3dyS2FWaFFlQ1MrdFRUTG5VWEJxcXpJMXBabW51MXBGelRVdHAz?=
 =?utf-8?B?RWFMbk85ODN4L0RpOGh4bkRxcGJ2Q0hnb2pGd3RtSHBNNDdXWDV6Yk13Ujlm?=
 =?utf-8?B?QzNhRzh3VWxFT01DS1ozZEk1d3NGdEEwSmxNRXhNOFhHZVA3cXFPem41K2dR?=
 =?utf-8?B?TGRmOUlpTlN4KzBwSExoWkxSQVI2ek14RVpCMlFGWkFEMERXcjZWQU9ycGhm?=
 =?utf-8?B?V3RhVGFTK1FRcHUxY3kxVDB6cFZoaUpXRS9ncFpmTEVVVUlkTElMQ3B5MU1y?=
 =?utf-8?B?RnEvZk5sWHVpSFNpTHIzbVdtT2dpY2dtc2EycHp3Y1NmNUxCRVF2K0l3SkJD?=
 =?utf-8?B?QkNsNVA3MmE4OGlSZnpOeVdXUDBuUXlFc3RqdTUxZG5OR0Q0TFNVSkpRc0E4?=
 =?utf-8?B?L2VCTUpKelZhYXhYWEwvYTZJSmJLMDdpeHpNM3graTdaQ0UxZCtjcDJ0NXVi?=
 =?utf-8?B?Y21KRjlteDFXbWdWMmdqL3g1SHQ1RFladDh0UlR1L25oZzdTRENGVE9DSzNn?=
 =?utf-8?B?ZXo1dmpmRDhlQ252aHI3ejM2YnVTUzcxWUR1Q2p4YVRkWVlEbUExbC85blJ4?=
 =?utf-8?B?MXh1QjZ1enEzZStjMTQya0QyUDZaZUtyQ0xqakI2TlhBTzlTRytRRG5Da3RI?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F78134FBBCC584AA367937AC34D467F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e21056c-547f-4bd8-c395-08dca0fbc06c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 16:17:10.5023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vg5qlMj0ZKSTGYeA9v1Fa6NwLzESVPR7wNiQlGDnjtQ9tqL1KGw16nD46ohXgHz+U03uryqbWpLfapKhDm6cAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

T24gV2VkLCAyMDI0LTA3LTEwIGF0IDA5OjU5IC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFdlZCwgSnVsIDEwLCAyMDI0IGF0IDA3OjUyOjM4QU0gR01ULCBNYXR0IFJvcGVyIHdy
b3RlOg0KPiA+IE9uIFR1ZSwgSnVsIDA5LCAyMDI0IGF0IDEwOjUzOjU0UE0gLTA3MDAsIEx1Y2Fz
IERlIE1hcmNoaSB3cm90ZToNCj4gPiA+IFBWQywgWGUyIGFuZCBsYXRlciBwbGF0Zm9ybXMgaGF2
ZSBhIDE2IHdpZGUgRVUuIFdlIHdlcmUgaW1wbGljaXRseQ0KPiA+ID4gcmVwb3J0aW5nIGZvciBQ
VkMgdGhlIG51bWJlciBvZiAxNi13aWRlIEVVcyB3aXRob3V0IGdpdmluZyB1c2Vyc3BhY2UgYW55
DQo+ID4gPiBoaW50IHRoYXQgdGhleSB3ZXJlIGRpZmZlcmVudCB0aGFuIGZvciBvdGhlciBwbGF0
Zm9ybXMuIFhlMiBhbmQgbGF0ZXINCj4gPiA+IGFsc28gaGF2ZSAxNi13aWRlLCBidXQgaW4gdGhv
c2UgY2FzZSB0aGUgcmVwb3J0ZWQgbnVtYmVyIHdvdWxkDQo+ID4gPiBjb3JyZXNwb25kIHRvIHRo
ZSA4LXdpZGUgY291bnQuDQo+ID4gPiANCj4gPiA+IEFkZCBhIG5ldyBpdGVtIHRvIHRoZSB0b3Bv
bG9neSB0aGF0IGFpbXMgdG8gY2xhcmlmeSB3aGF0IHRoZSBFVV9QRVJfRFNTDQo+ID4gPiBtYXNr
IG1lYW5zLiBUaGlzIG5ldyBpdGVtIHVzZXMgbWFza1tdIGFzIGEgc2luZ2xlIHU4IHZhbHVlLiBY
ZTIgYW5kDQo+ID4gPiBsYXRlciBwbGF0Zm9ybXMgc3RhcnQgcmV0dXJuaW5nIHRoZSBudW1iZXIg
b2YgU0lNRDE2IEVVcy4NCj4gPiANCj4gPiBTbyBpdCBsb29rcyBsaWtlIHlvdXIgcGF0Y2ggaXMg
YWRkaW5nIGEgbmV3IHN0YW5kYWxvbmUgIkVVIHR5cGUiIGl0ZW0gdG8NCj4gPiB0aGUgbGlzdCBv
ZiBtYXNrcyByZXR1cm5lZCBieSB0aGUgcXVlcnkuICBJLmUuLA0KPiA+IA0KPiA+ICAgICAgICAt
IERSTV9YRV9UT1BPX0RTU19HRU9NRVRSWSA9IC4uLg0KPiA+ICAgICAgICAtIERSTV9YRV9UT1BP
X0RTU19DT01QVVRFID0gLi4uDQo+ID4gICAgICAgIC0gRFJNX1hFX1RPUE9fRFNTX0VVX1BFUl9E
U1MgPSAuLi4NCj4gPiAgICAgICAgLSBEUk1fWEVfVE9QT19FVV9XSURUSCA9IHswLCAxfQ0KPiA+
IA0KPiA+IEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBuYXR1cmFsIGlmIHdlIGp1c3QgZGlkbid0
IGluY2x1ZGUNCj4gPiBEUk1fWEVfVE9QT19EU1NfRVVfUEVSX0RTUyBpbiB0aGUgbGlzdCBvZiBt
YXNrcyByZXR1cm5lZCBvbiBuZXcNCj4gPiBwbGF0Zm9ybXMsIGJ1dCBpbnN0ZWFkIGFkZGVkIGEg
bmV3IHR5cGUgb2YgbWFzayB0aGF0IHdvdWxkIGJlIHJldHVybmVkDQo+ID4gb24gdGhlIG5ld2Vy
IHBsYXRmb3Jtcy4gIEkuZS4sDQo+ID4gDQo+ID4gICBPbGQgWGUxIHBsYXRmb3JtcyByZWNlaXZl
IGZyb20gcXVlcnk6DQo+ID4gICAgICAgIC0gRFJNX1hFX1RPUE9fRFNTX0dFT01FVFJZID0gLi4u
DQo+ID4gICAgICAgIC0gRFJNX1hFX1RPUE9fRFNTX0NPTVBVVEUgPSAuLi4NCj4gPiAgICAgICAg
LSBEUk1fWEVfVE9QT19EU1NfRVVfUEVSX0RTUyA9IC4uLg0KPiA+IA0KPiA+ICAgTmV3IFhlMiBw
bGF0Zm9ybXMgcmVjZWl2ZSBmcm9tIHF1ZXJ5Og0KPiA+ICAgICAgICAtIERSTV9YRV9UT1BPX0RT
U19HRU9NRVRSWSA9IC4uLg0KPiA+ICAgICAgICAtIERSTV9YRV9UT1BPX0RTU19DT01QVVRFID0g
Li4uDQo+ID4gICAgICAgIC0gRFJNX1hFX1RPUE9fRFNTX1NJTUQxNl9FVV9QRVJfRFNTID0gLi4u
DQo+IA0KPiB5ZWFoLCBJIGxpa2UgdGhpcyBhbmQgd291bGRuJ3QgYmUgYW4gYWJ1c2Ugb2YgdGhl
IGZpZWxkICJtYXNrW10iIGxpa2UNCj4gSSdtIGRvaW5nIGhlcmUuDQoNCkFjayBvbiB0aGlzIGFw
cHJvYWNoDQoNCj4gDQo+IFNob3VsZCB3ZSBkb2N1bWVudCB0aGF0IHRoZSBxdWVyeSBtYXkgbm90
IGhhdmUgYWxsIHRoZSBpdGVtcz8NCj4gDQo+IHRoYW5rcw0KPiBMdWNhcyBEZSBNYXJjaGkNCg0K
