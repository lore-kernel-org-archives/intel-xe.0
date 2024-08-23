Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37626C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 09:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7210E31D;
	Fri, 23 Aug 2024 09:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHMESPrf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AD810E12A
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724404094; x=1755940094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lEb1yn2+KcLBYnUxEB91653nIdLohD27dIO6QAHddVc=;
 b=iHMESPrfQGNtDnob3fXwyvdWIzJpQBMqY7LpWq5iHSbM1KKOWP58dtxY
 rcm06y6iYe0/pKzKzwO8A0Eq4kTdOExrw1mC0lLSLgd9jUBBd7YR8QA9T
 yXGyucvRolioxPXjL9qp+2dHXdwUSGGLrWj1IAawk3Qg5qBcPAx/69d56
 avuKhDAoCnYHQS571UPXVx62cKWOZQe4iU8eHDng99V2gUwLJ4AEsOnZA
 NDc/GmkpXEXKqMNWhpkZzK5GZlZiCNrTYR1nXA9b8p3rAyLMk9dOHI/+0
 gIsRXdAKhg4FMB51KKMZJVvPnNBeS62ZY5RY5gC0gD18wRIWiQwmbIDyk Q==;
X-CSE-ConnectionGUID: LmiGTKBuSpyo/o4oBRo2hg==
X-CSE-MsgGUID: 3mTcGQ2kR86MnghSeZWE7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23029423"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="23029423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 02:08:14 -0700
X-CSE-ConnectionGUID: qCbU7H3yRZ+GRIuRyduzoQ==
X-CSE-MsgGUID: SdkOX3StRZ2trneTK35bKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61880836"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 02:08:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 02:08:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 02:08:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 02:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sgq2wIu3L8CR52eCzHlHSKttBmx2HEjvXfgHWQ5+H49Z/TRbcteonHhN5weWUQre3+RoISSAGQ/pmClxi9DOewA+0W9eDf6CppnUeI7hWQLFEW+mPFHAZtl4zdI7On7gYS6DZLNhYMShLWWn9YgqQmGBrHwWPt14wzSEDphktaODklpJma0UTBxNO7E9Pot1Ktgg+fxHJyvbOWJaGfpwfBsvNp59u/FbFIVKnQUKxxJ4ebh3Y+FdT72m4gLvFDldYqlP2MY7jhAsZAWfWj8IsklHLnVeEKlx6CX5/p7/euJnaXI5gLHFs3ADrtAq5lUWD1YVgimrijNjX4XHxtamCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEb1yn2+KcLBYnUxEB91653nIdLohD27dIO6QAHddVc=;
 b=lv3YCK08kn/N/Zlkm70VA44Nv1Pf+VwkVqNS7AJkIUThPS2uxPbj9rfopBAqQ8aPdUyeQUnNFjeF+A51H6tfZoqnQI3R3SkFLyI51b7AUdIkeMoezEOr5xvD2y9c4907u3Cd4siWNEyNi2AiT1uvB3eK83mRSauvoNpFmpA84JNdJt/DapRP11dg30BPm+tbXK65Iqr4g/FkK7UTXCK3CUzzoRgbNOhuOVKqeogk3flezoROML5XH3GQIMXC6wxMfbVNUCceDG5RvzzfDmHvFuKIBDAuhS2sD+j9vaRooGmecajI5cxu9OhobnRkwK+u/P6XWrIb5Yzle0753CeN8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 09:08:09 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.7897.021; Fri, 23 Aug 2024
 09:08:09 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "ville.syrala@intel.com" <ville.syrala@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Topic: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Thread-Index: AQHa8yRxfJ4CHb70LEyCnWHhRM26erI0VNGAgAAbOgCAABrPgIAABssA
Date: Fri, 23 Aug 2024 09:08:09 +0000
Message-ID: <69f1c61b5d24b166f5ff3cfe966744c623969575.camel@intel.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
 <20240820171408.192309-3-vinod.govindapillai@intel.com>
 <IA0PR11MB73071438F92AEF10750E423CBA882@IA0PR11MB7307.namprd11.prod.outlook.com>
 <160aa8f8d1bc55fd12f6332a27aa325da3a0e944.camel@intel.com>
 <IA0PR11MB73074BBC068B36B8DD98EC24BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73074BBC068B36B8DD98EC24BA882@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SA2PR11MB4875:EE_
x-ms-office365-filtering-correlation-id: 157430c4-16fb-4cf3-09c9-08dcc3531bec
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UnNTR2NDa1NKTEo0Mi9DUkxXYjRVVTRZSC9DbXpZZ0hHVUNnSlE0djhOK3Fy?=
 =?utf-8?B?YS9FWlJOUmUvNUVzR1B2ajlxU2NZRXovZnFnZmk0MG5WWStFTFdUcGRlWDlT?=
 =?utf-8?B?SzlxNitkL09KT1lhaU9Da2g3Y1RVL0MrK05Edmt2VDYzNEFiNG1pWDNWbFph?=
 =?utf-8?B?UG1BcGlOWDZlWEdCdGU0MWNYZzlDdmpTTHJSWkc3MTErK2tYU0N3VnUrV25R?=
 =?utf-8?B?Ylkyd3hZeUtiRGRQQ1lHZGhwWklOd29DNElwaU9CdDhwMmREUVBWMXdHOHhV?=
 =?utf-8?B?TFRZVC8zRFozb3dWYVZ6MFVtWE9RRUwyUERndy9DYkdDZVl4TDNwM0pxSExp?=
 =?utf-8?B?MXBoN3VTdWtSOGpwcTkyUDR6ZmwyWWpWK2lXcE0wTUNiMlBFK1JLRkdyOWs5?=
 =?utf-8?B?ZHNjRHZCeElzQjdONVFHR0ZTWXoxa2d4dGx4WlFRdDlxbzJPWTJVNTFKWVkw?=
 =?utf-8?B?eUxRZ2R5SjhTbVZHZFpCdUp3b04zNHhBazV3dmdzeDVCMkhRRTVwYlpiNWtP?=
 =?utf-8?B?VnlHZUZGN3BheUZFZ2p2QVBKQWNyaEFCeitaSmtPbzMrS1NmQWdWbGJicHQ5?=
 =?utf-8?B?VUp1TUEvdFF3QkIwRmZmMXpONno4cXVld3paaFBJbHJnSjllT0VMWGtBNVhL?=
 =?utf-8?B?U2x0Mnc3dXF4RGRReVdlZFdNVk92RjZQNnFVSzJBOFd6MjMzSnI5VytCR2ds?=
 =?utf-8?B?YmNUWTJlTHdNOVQyampvTFJsaVhBUTV1TUJiTnJPVHR6ak03dTJRdUl6R3lP?=
 =?utf-8?B?OXJpUnk3NTdlMlY5NytCNGlwTXpNWjRxWFNuajVKRzVQVHBJZXNMQnV5MDZK?=
 =?utf-8?B?VGtXYXMrV1JzdnZYZFQrbGxZSUhSbzk5bGVJZUZIWnQzcndTdWN3VzNrLzM2?=
 =?utf-8?B?ZlhBSC8xZG1zNXRPRVI1TUVBTk5iVjExMksxOUROK1EvWS9GZWlBTnFDc0t3?=
 =?utf-8?B?eEZGM2swUlliRURpeEM1ZkduQVV1c2ZOVm5zZEtRR280VEc1L2M2b3VZMjU3?=
 =?utf-8?B?c3B6cW9EUnc4RmFabXc2UmJ6OTA3eXBteS85S0JHSjRUN1hkS2g5eDhuYVJM?=
 =?utf-8?B?UU90V0pzKzhQWGtpOUFaR2FRRGpyVHBLMlVuSWJnTnFmV0RwMGQ5MURUcU1C?=
 =?utf-8?B?dDQ1WjBubThpWUxxaWJvNzQ5cDNSUUNMZEY4aUVGN0Jtd2FUYTJhUE93bDlK?=
 =?utf-8?B?T3R5QjAyRlEraExrRUtLOXptQVp0UCtiL2x2OWxDSTlMWlNnNjBDVkllYVF6?=
 =?utf-8?B?VVpWdktIbWFTUXFvTmFURlh5cmxSZGhOVjdSdUdvL0pkUjV2ZUphbll0aHdn?=
 =?utf-8?B?bXNybGdYRTdwLytGNXExTW84OUk4eTBaMmN1RlBOdlg5aUdKdzlPVEVYYWlt?=
 =?utf-8?B?Wkd0UkNtd001ZXZteTFqd01IRk51WE9ld2lBL2Jia3F3TzFXQm1OZkE1cWts?=
 =?utf-8?B?cUJPLzNxOXNVNTdBdmZSNHhoRS9QazZrSWpCRnp4dTcyd3g0YVlENjE3ZTVH?=
 =?utf-8?B?UmlJYi91OHRHczg5cWtzVXFRbkdYU2RtclQ0RmNseVpmWU9OL3lSVko2QzUr?=
 =?utf-8?B?cHpVNmF2Z2l0eHFOQ2pRTG55aWt4aXJ0RU4xSTZmVjdWYmlSM2pOV3JpdWRs?=
 =?utf-8?B?QUlzOTZ3S3g2anlxWVE5ZTd0Y1J1S1h4UGJlT0cxbWRRcmRYQnlPemljRkYv?=
 =?utf-8?B?bFZyVk0vKzQ2Q0ZsbzBYYWdxeXMzOEorSytLWTNmREdMT0pQUTVpb3k3YWZT?=
 =?utf-8?B?RG9rOEs4cWdKV21rcVM0bjRoY3NOSHlmc1E3Tk9OUFN0YjRtN0xUY0t1NnFx?=
 =?utf-8?B?bVU2cVVUcmhJNXZ4SVpNcnpwemlhekh2VVBBTlZQV2tVbTR2TlZrY293RDNX?=
 =?utf-8?B?MWVwc0I5aUs3WFBKRVM0Ym1UOGNBalBicDZ3dzMra281UWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGU1cDE4NitJckpNNEFkckFMRi9QSDJiUkZvMlAyd29GUXNraWhsNEc2Uk11?=
 =?utf-8?B?UnlpRlh0d2hidENpZm1NZnBmVlg2WnFJZmNPMkZyV242Mlg1cnRhS3NkTE5s?=
 =?utf-8?B?RW1xVkd3eFpjakdHUWMxdnc3eHhYWHhVZG0wNTRoTDVTVXk1NmxBcEhtRGdS?=
 =?utf-8?B?QmNWOXZRV2h0cmx3ZzROMnoyL3ZvNG9VMGlETldSRGVHYjQydDFhUVVMcUY4?=
 =?utf-8?B?cnArVkwvZ3RBNy92alJQcDZrdnB4eGFKN2NwNUttREtyZXdhdmZua0M4MmlQ?=
 =?utf-8?B?WHhUaVd0L3dBcnU5UVhpaFF1emI4YnhSTEt6eFZNaW9YSmFBRU50SmZDWjZs?=
 =?utf-8?B?WkZ6S3hBZUFsbjU1ZHJJN2JudmdiWWJPM2t6SFZWcy9jWWN4blo2amNaai9X?=
 =?utf-8?B?UC9uRUU5djJOWURsZkRCWVdOWXFCZ0RsM0xnWjJjV2lJeG9YVHNJemxjMDdV?=
 =?utf-8?B?dHNwZG9iaEltSy80TklGSkVUQW9SdGcyMjg0aGhBb2VOZVlGUitKc0xMWS90?=
 =?utf-8?B?ejU4elFNbHhnbHNjSTVMekovcU5xeFMzZjFEMU1VaXF0ZzFheVI2OU5BLzlx?=
 =?utf-8?B?c0s5TFh2QXhoZHRod2h1MHNrNWlqWkgrNDlBby8vYU5wYWo2alFNTkJLb1ZS?=
 =?utf-8?B?dTFlUEEySVNYY2NCakcyUWZCKytGZnJJVUlqbUpZajk1Q2Z1T2tZVWUyR2NO?=
 =?utf-8?B?U2JFc0dvYWczZGRSMnljMlY5NHNjSDI4Zk05MDcwaDhqUnVZb3k1VXhBRHpL?=
 =?utf-8?B?OXRqRElSMTdqNy95SWlzUmhGQlRLZFlsV2lTNmFoTTFtSzBNS09zSEJ3RGJz?=
 =?utf-8?B?ZFQzT0QrODZQQ29wSFYzNlpaeW50cjJKUDBpMXdtdGNrTE4zUzhGM0Q1UjRE?=
 =?utf-8?B?YUxzTEU1QUR1ZVUvWGMvSkwyVGg3TXQ2UEF6blJTSkVqQUVNR3NkWmY3LzVi?=
 =?utf-8?B?bkQwWHdZc1d1VmdsYXg3NU5nLzU0MHJqMVdPMVUyZXdnQVg1UmFsSnYwZzJB?=
 =?utf-8?B?dUdhTjAvS2pxMFJrNGhBb0JQd002ZUtXNk0vb2RiOXAyanpWUVgvMlpLRnpH?=
 =?utf-8?B?RHd3My9rQUhiRWNnb3dsYnF6c0VxcitYMURwT3ZJSHljdFJtTXlKVnIrM3pD?=
 =?utf-8?B?ZEhRUTBQU25JQThMZGdmalJac0g3Sm1CQS9IUjVqYXNMSjlkN3hYWG43b3pS?=
 =?utf-8?B?ZVh6eG1LVndhVG5ubkZiVG03UHBMNStTOUlkd2xabGc3STB0V05wdm9zeVZ6?=
 =?utf-8?B?VlhMekJXYnZqckJqSnZHdGR3MHVaTXJoTXd4T1duVFhRVEtVOERmSnVtejV1?=
 =?utf-8?B?SUJ2aWE4dDkrVG9ubzl6eWMwQ0lxenZBWWlVYWFtTzhyellDbkFKMWRZRHl3?=
 =?utf-8?B?aHpwV3NIbERtRTFsWkhvZElzQks4akFobXVDUWVsTXZldUNGR2NEWEk4elU0?=
 =?utf-8?B?Z3FMeXFINzRrZUVZSG0yelVOZlMzampqNldPb0hoSjZSQUtGeCsrdGJ5ZGw0?=
 =?utf-8?B?MjZDRWNWMXF0dUZkTDkxQlR2cnZTZ2xyV2xsL01pY3c3YkVUajk5MUE4UmRr?=
 =?utf-8?B?UGhJeGl5UlVVRkNmUmhhOXJRZnJVdGpYNVVxQmkvUWxGMXdGOVBQZ0Q2MjU4?=
 =?utf-8?B?TXFVbEtidUcxS0Z5MVJKa0xuNjU5L1BHTnpiR0txOVVJSnVQRVo0RGhlKzNz?=
 =?utf-8?B?Y05kQWVlLzkzYndxem5YTjEvM3VkMWNic2Q0WWVnblQ4dlhpdFdKaG84QlNh?=
 =?utf-8?B?OU1yOUJCYVM0ZHAyeXdGeHN6YnM3V2JRbUFzZTZ2b2ppc2drUHoxMllLTm4x?=
 =?utf-8?B?eXFsMERuc1pnaTJPYWVMYWx1QXNZd3M0SVlVZnFOM3kwKzZYUzMzYWEwMERr?=
 =?utf-8?B?T2k3SGdFb1NOL0FUbGk3V3lLbG45WVFhNER6Mk1uT1l6clZSb0JwK2JzSXhL?=
 =?utf-8?B?Wm5aQlpqOEhVeUVSaDhUN0dCZ1lWUmNJbHNOUE04Q2hidG5FSHRlTFJvMXUw?=
 =?utf-8?B?TWtNc2E5YUFWemEvQ3d4MWVZYlRXV3B3KzJEWUdKdFVSYWVQSWtLb1RUemk2?=
 =?utf-8?B?VXBIY1NicWRVemlRaGNNb2dkaWJJc09keW9pd05FTjJYMS9HTVBaTllmYmVD?=
 =?utf-8?B?K05zZ0xkOXVsa0Z1S0VPUkpsVS9sanVnVktSR2ZsaXZHMjluc1J6ZU1XUjIz?=
 =?utf-8?Q?PtwGLW6/0lb8yOvoFydxckQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69A716AA1ACD6A4D8A33545D11C02B56@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157430c4-16fb-4cf3-09c9-08dcc3531bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 09:08:09.7430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gT3KCgcetZO1MCW2yANCcQTwVqYl+d3h8LjbfQhSZAhZTrz8K9fIcVSjcbupymI4ayo2n5Rlazwzf47awCpXbQMuSXkEpDH822vKXrS0xQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
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

T24gRnJpLCAyMDI0LTA4LTIzIGF0IDA4OjQzICswMDAwLCBNdXJ0aHksIEFydW4gUiB3cm90ZToN
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3Bs
YXkuYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYw0K
PiA+ID4gPiBpbmRleCBhZDdmYzUxMzdiNDIuLmIyYTBiNGI1YzQ1YyAxMDA2NDQNCj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYw0KPiA+ID4gPiBAQCAt
MzIwLDE1ICszMjAsMTMgQEAgdm9pZCB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQoc3RydWN0IHhlX2Rl
dmljZQ0KPiA+ID4gPiAqeGUsIGJvb2wgcnVudGltZSkNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oCAqIHByb3Blcmx5Lg0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICovDQo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqBpbnRlbF9wb3dlcl9kb21haW5zX2Rpc2FibGUoeGUpOw0KPiA+ID4gPiArDQo+
ID4gPiBVbi1uZWNlc3NhcnkgY2hhbmdlLg0KPiA+ID4gDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBpbnRlbF9mYmRldl9zZXRfc3VzcGVuZCgmeGUtPmRybSwgRkJJTkZPX1NUQVRFX1NVU1BFTkRF
RCwNCj4gPiA+ID4gdHJ1ZSk7DQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChoYXNfZGlzcGxh
eSh4ZSkpIHsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFydW50aW1lICYmIGhhc19kaXNw
bGF5KHhlKSkgew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9r
bXNfaGVscGVyX3BvbGxfZGlzYWJsZSgmeGUtPmRybSk7DQo+ID4gPiANCj4gPiA+IENhbiB3ZSBn
ZXQgcmlkIG9mIHRoaXMgQVBJIGFzIHdlIGRvbid0IHJlcGx5IG9uIGRldmljZSBwb2xsaW5nIGFu
ZCB1c2UgaW50ZXJydXB0DQo+ID4gYmFzZWQuDQo+ID4gDQo+ID4gTm90IHN1cmUgaWYgSSB1bmRl
cnN0YW5kIHRoZSBwb2ludCEgV29uZGVyIGlmIGl0IGlzIHJlbGV2YW50IGF0IHRoaXMgY29udGV4
dCEgQnV0DQo+ID4gYXMgbWVudGlvbmVkIGluIHRoZSBzZXJpZXMgcGF0Y2ggZGVzY3JpcHRpb24s
IHRoZXJlIGNvdWxkIGJlIGZldyBvdGhlciBzdGVwcw0KPiA+IG1pc3NpbmcgaW4gdGhlIHhlIHJ1
bnRpbWVfc3VzcGVuZCBoYW5kbGluZyBhbmQgYSBiZXR0ZXIgcmVmYWN0b3JpbmcvY2hhbmdlcw0K
PiA+IGFyZSBiZWluZyBwbGFubmVkLiBTbyBJIGd1ZXNzIHlvdSBjb3VsZCB0YWtlIHRoaXMgdXAg
YXQgdGhhdCB0aW1lPw0KPiA+IA0KPiBOb3RoaW5nIG1pc3NpbmcgYXMgc3VjaCwgcmF0aGVyIHRo
aXMgZnVuY3Rpb24oZHJtX2ttc19oZWxwZXJfcG9sbF9lbmFibGUvZGlzYWJsZSkgaXMgbm90IHJl
cXVpcmVkLg0KPiBJOTE1IHVzZXMgaW50ZXJydXB0IGJhc2VkIGRldGVjdGlvbiBhbmQgbm90IHBv
bGxpbmcuIEV2ZW4gaWYgY2FsbGVkIHdoZW4gcG9sbGluZyBpcyBub3QgZW5hYmxlZCwNCj4gd2ls
bCBoYXZlIG5vIGltcGFjdCBhbmQganVzdCByZXR1cm4gd2l0aCB3YXJuaW5nLg0KPiBJZiB0byBi
ZSB0YWtlbiBsYXRlciBjYW4gd2UgaGF2ZSBhIFRPRE8gb3IgUmUtdmlzaXQgc28gdGhhdCB3ZSBk
b27igJl0IG1pc3MuDQoNCiJXaGlsZSB4ZV9kaXNwbGF5X3BtX3N1c3BlbmQvcmVzdW1lKCkgcGVy
Zm9ybXMgc3RlcHMgZHVyaW5nIHJ1bnRpbWUNCnN1c3BlbmQvcmVzdW1lIHRoYXQgc2hvdWxkbid0
IGhhcHBlbiwgbGlrZSBzdXNwZW5kaW5nIE1TVCBhbmQgdGhleQ0KYXJlIG1pc3Npbmcgb3RoZXIg
c3RlcHMgbGlrZSBlbmFibGluZyBEQzksIHRoaXMgcGF0Y2hzZXQgaXMgbWVhbnQNCnRvIGtlZXAg
dGhlIGN1cnJlbnQgYmVoYXZpb3Igd3J0LiB0aGVzZSwgbGVhdmluZyB0aGUgY29ycmVzcG9uZGlu
Zw0KdXBkYXRlcyBmb3IgYSBmb2xsb3ctdXAiIA0KDQoiZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0
L2RybV9rbXNfaGVscGVyX3BvbGxfZGlzYWJsZS9kcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJsZSIg
aWYgeW91IGZlZWwgaXMgbm90DQpuZWVkZWQsIGkgZ3Vlc3MgaXQgc2hvdWxkIGJlIHRha2VuIHVw
IGFzIHNlcGFyYXRlIHRhc2suIEkgZG9uJ3QgdGhpbmsgYSBhZGRpbmcgYSBUT0RPIGluIHRoaXMg
cGF0Y2gNCi8gc2VyaWVzIGNvbnRleHQgaXMgcmVxdWlyZWQuDQoNCkJSDQpWaW5vZA0KDQo+IA0K
PiA+ID4gDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRp
bWUpDQo+ID4gPiA+IC0NCj4gPiA+ID4gaW50ZWxfZGlzcGxheV9kcml2ZXJfZGlzYWJsZV91c2Vy
X2FjY2Vzcyh4ZSk7DQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4gLQ0KPiA+ID4g
PiAtwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRpbWUpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5X2RyaXZlcl9kaXNhYmxlX3VzZXJfYWNjZXNzKHhl
KTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNwbGF5
X2RyaXZlcl9zdXNwZW5kKHhlKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfZmx1c2hfY2xlYW51cF93b3JrKHhl
KTsNCj4gPiA+ID4gDQo+ID4gPiA+IEBAIC0zODcsMTUgKzM4NSwxMiBAQCB2b2lkIHhlX2Rpc3Bs
YXlfcG1fcmVzdW1lKHN0cnVjdCB4ZV9kZXZpY2UNCj4gPiA+ID4gKnhlLCBib29sIHJ1bnRpbWUp
DQo+ID4gPiA+IA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLyogTVNUIHNpZGViYW5kIHJlcXVp
cmVzIEhQRCBpbnRlcnJ1cHRzIGVuYWJsZWQgKi8NCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlu
dGVsX2RwX21zdF9yZXN1bWUoeGUpOw0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRp
bWUpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcnVudGltZSAmJiBoYXNfZGlzcGxheSh4
ZSkpIHsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kaXNw
bGF5X2RyaXZlcl9yZXN1bWUoeGUpOw0KPiA+ID4gPiAtDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDC
oGlmIChoYXNfZGlzcGxheSh4ZSkpIHsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBkcm1fa21zX2hlbHBlcl9wb2xsX2VuYWJsZSgmeGUtPmRybSk7DQo+ID4gPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJ1bnRpbWUpDQo+ID4gPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZGlzcGxheV9k
cml2ZXJfZW5hYmxlX3VzZXJfYWNjZXNzKHhlKTsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGludGVsX2Rpc3BsYXlfZHJpdmVyX2VuYWJsZV91c2VyX2FjY2Vzcyh4ZSk7
DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9ocGRfcG9sbF9k
aXNhYmxlKHhlKTsNCj4gPiA+IERvIHdlIG5lZWQgdGhpcyBkaXNhYmxlIGhlcmUgYXMgd2UgYXJl
IGVuYWJsaW5nIHRoaXMgb25seSBpbg0KPiA+ID4geGVfZGlzcGxheV9wbV9ydW50aW1lX3N1c3Bl
bmQoKSBhbmQgaGVuY2UgZGlzYWJsZSBvbmx5IGluDQo+ID4gPiB4ZV9kaXNwbGF5X3BtX3J1bnRp
bWVfcmVzdW1lKCkNCj4gPiANCj4gPiBUbyBxdW90ZSBJbXJlLA0KPiA+IA0KPiA+ICJpbnRlbF9o
cGRfcG9sbF9kaXNhYmxlKCkgaXMgbmVlZGVkIGR1cmluZyBzeXN0ZW0gcmVzdW1lIGFzIHdlbGws
IHNpbmNlIGl0IGRvZXMNCj4gPiBhbiBleHBsaWNpdCBjb25uZWN0b3IgcHJvYmluZy4gVGhpcyBw
cm9iaW5nIGlzIG5lZWRlZCBhbHNvIHdoZW4geW91IHJlc3VtZQ0KPiA+IGZyb20gUzMgZXRjLCBm
b3IgbW9uaXRvcnMgdGhhdCBnb3QgY29ubmVjdGVkIGR1cmluZyB0aGUgc3lzdGVtIHdhcw0KPiA+
IHN1c3BlbmRlZC4iDQo+ID4gDQo+IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uDQo+IA0K
PiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+IEFydW4gUiBNdXJ0aHkNCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KDQo=
