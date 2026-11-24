Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA00606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l5EqasQ6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Hh1GBRLb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A26010F479;
	Tue, 24 Nov 2026 10:50:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8350710F479
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 10:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795517429; x=1827053429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SWdbd13Bt7OgLf3UPt56CjYq/nUwU11Wd4Acrjtw8eQ=;
 b=l5EqasQ6bzqdiXdwm1zJgsiC02pFIcLPD+O25CkESNS4m7znhGHJpXyi
 dGXufw2siIq2qJxuauP4v4DdRNS5fzYrObYpT5pAe93/8a2lL9k3xZVds
 vGkRRLB2xjDEzENEHTLP1NYHee4mDf+ncT9VxvNLoLMYF72uyyuLYuZ1d
 VtN+qkw1hgaAHsWSH5jmyApKazUbFZhEDXXXbwn0LUh0ju33ji5fNSpU6
 PZyMelWqgzstYztQO5Xzl7t/f/kFYZDzn4tre447oCNeI9ei/g9Z55gK1
 1SWkyc/uHHV7JmlvJ37xCChjK3fvtMr1sITIFNuzK1cgOxh9ePM3t+rYp A==;
X-CSE-ConnectionGUID: 5DAeaKfaTtOFP+GpdlXKxw==
X-CSE-MsgGUID: 1NftonssSIeJfkcPvPofGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4244233"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4244233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:50:29 -0800
X-CSE-ConnectionGUID: uUr8ozVgStundlgzRpHoqQ==
X-CSE-MsgGUID: QIeEvZD8TdWBFk/mgyYtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11848947"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:50:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 02:50:28 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+qbYSDe8lMV+MPmJCNrcQpHse/7+jgWJrHsYOT5XR8Ws67IhtSsQYnEOWYWJLe7BiodNI3iOthe/mcDeM1npbciEXb99u8/WXGJOKrSBlYTIvTNG5cD7YJ8fctOpkNe/LKZvLmToLtub8zTol2xJnQra0v5u21FuGSp8XFwe2bf6RTF9ayt4c7ilPGOfoEutbiKtvjAtpQqjPI05nC9mbAVVjOxBKQlWJae7YxqvpbFzat/MUPIAI/BxrLsk24TljDVwBjvjNJ762EOzMRaj5wv/y5gpdAD8rbKRB4i7+coeBDqIVJs/wpvD6jr1CLHSdAQ/BD2gdBvbox2f2j4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZviZynJ98L6v6id+yUWyDCmO9cGhDpk3QC4aUJ0xDA=;
 b=VZ8DVANHuidqSTVCrT07qHQxL+DFTMDx3JmWekV3zLwvm9WOSrb9SjBbmhBEvQG2zbxbOaH11ChER7MgFphgfZYYcKo3I/V7q4vOW01z7VoNs1QdiRpHqmMabwUkS+HG+0ozi49j3UHCYBtHSenBIsqz1UFFB5UxHDNQYw+3RtW1+2S4xhkTlpeudmI6mMSGiHIZk6y6fEQjjLEXoBHIDYGT/G6leIfMYfUVvcHEvtpOg0L3waBHWCRbS3aApDS4GEHM7N298b4OrA2bwhEYwERv7zCvb03wLPQYe6sDh14GHebnmVfqjAVmG3A1XWjm2/ddNJOv0iWbv7+C2BcHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZviZynJ98L6v6id+yUWyDCmO9cGhDpk3QC4aUJ0xDA=;
 b=Hh1GBRLbEXzmBfs0GdKVDmr7390h2PsAeRpPn9BmjfKzT8bM+DxFN8cK7Fwdf7CkDA6e+ID/kYiPvY1BAfDxvH8R49L4y/VmyvAg/LmY+F6QpmbyL0TU/IgT9/HsPiomaESUkVwlxe7hWbUr8c49Z0lkdUGGdCES/tVb3L6IKbE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8721.namprd11.prod.outlook.com (2603:10b6:408:203::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 10:50:24 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:50:24 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/3] drm/xe/pf: Restore default PF scheduling on failed VF
 enable
Date: Tue, 24 Nov 2026 11:50:07 +0100
Message-Id: <20261124105009.3431301-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
References: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: e18b7fc0-f6e8-42d1-1c86-08df4a18be0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022113327099003|261022075727099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 9E3dYyA7Ayku4HrvQS86kkEo3LTAefvdK38ulszq1TfmGDRKE7PpFlqBNoFKJ3iPmnNZcm5MBjHuYjTaClmGC4LFMEkIM+rQegEptjuHw8luj2ygJlK4Lxx7rCOkfBMV7gXK8NHTWB424vctrervwJ2yIaSNuskclGCKi1k6wnCp0OJ5cEcPWgk0AvlH5I+lPDWdROFHkynsGXWGKdsjltyg48OlmX1lgIJsOTTctCGQpayLH0BUpCgF+mVUaoXenLdbyKlYXum1bizOVcbtGd+fjVyGLaQuguew6cINTmCCHmV46BWbSBo46V+ixD5+FM0buAKnIvYhOnspehB9O+oMRyKyH0si92uCMXKMrG1un7C8vavWYIrF7+SCCaj+8ykQy/GEznxdTMzyOR25JhoHMnENbQNxnm73Au/nUr64SxM/4LAS2WRHi52GMvhtvZwHsVKNKZFCvUAwZJEkcOSgnGlUTckTXg3k+6agRdrApF42LVzsjYjUd3zd5VRxzTJyPcWIIgu/3AndXpeCPSIN5iS4A99R/k6XMNkG9/2Mrd9fokJN/fJ5mGpjy67oL61CB+Z/fMwsKFSla1VGCjaZuHGst+flLDMHzcjpoUPuxKtJUlJRh8JmU/P2dk3L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022113327099003)(261022075727099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R215dmVEeWt1MmQ2b0VZbTBZU0Z4QjVXNWorb1pIQmtyKyttQlE1RW0vTVFq?=
 =?utf-8?B?cHZLVW5ab1QvNUxrS1ZNMVFHakMwU3JHL0VWZ2FqTmN5RHJ2N2tMSkF2eW8y?=
 =?utf-8?B?SSsyVVlTR0FkRittTHRqcUMxWWNldFV1ZElPN1oxNWZrVnJJTGFoSTI5Mkty?=
 =?utf-8?B?OXo5VVd4bUpaaXo2ZXRaTzdGSlhQdmZNRDgrcG42ekQ0RVBQeUV1Z2dpcmY4?=
 =?utf-8?B?YldhZ0NLWmkydkk5WUxNOGlGakhXNHdmQVVPZmpGaHZsSVhid0ZmQ3NDMitU?=
 =?utf-8?B?WHVpZnQ4RWcyV3VuM3NZTFVkUEVUZFJ6ZWhjdU9LeWVESkYwcTl0RmJnc25C?=
 =?utf-8?B?RVM2aktaODFib0J4Z2lUaUx6RDkvblRDNHRIS1A4QmZhUEpVNmMxOGFjbEVD?=
 =?utf-8?B?cktvRkNwTmRqeXZPT3JpWkg1dktHYnphNjVsWUM3V0VFNEtaaFBkZWtuQU9Q?=
 =?utf-8?B?QVY0NTN0dFQvT1RsNDU5V08xclAwNFQ5L05wbmJwbzBQdmRpUzU4WkU4YzNI?=
 =?utf-8?B?bjZDaWFXTXBvT0kxK2ZGSWxDamZGSkV3RXZkQ3M3LzVSSmRuZlJMUzlXRFNk?=
 =?utf-8?B?MnAyN2YwVWJlTXNheTNpTmRKU0JrYkcwNTVuaHFFVi9ZZmppZ1FhaFhrS09B?=
 =?utf-8?B?U1ltS0pRQ2hlejY2Q3kzeHBWRnJGUU5qV0s4ZEdGemY0RnF4eG5BTXdxdWZn?=
 =?utf-8?B?QW9TTmVSSVNab3FrVC9BNzdEaE5FcGNEWWR3MUxWTUdDckw2MDBkayt2eWlq?=
 =?utf-8?B?OUtWY0pkNUFRdjV5enNwR0tTN0tDNkJmRlJWVUkvRUUzbTM0NkpwQkVJUDVN?=
 =?utf-8?B?Vnc3cVhOTHkxV0xweXdJdFpZcGNFZm1IamtzakFMSlFQS3MyWkJEMElxY3dL?=
 =?utf-8?B?bmZTZkFEdnlOZDViMHFEK3plcGRrUkFzTHA3RVR5NHVoTHQxS1AxS0E1T0Vn?=
 =?utf-8?B?eThtVHRLaEtibFBWNWNVYmdxaEZPZDRqTFF3eGxlMVJWNnJqUi9MeGdGdWNa?=
 =?utf-8?B?WW9ZUDVqMHNLK29wWm9lRk5GWDlZQXAzQ0lLNlVNVnFUVFRxTVpGU3BjbTBu?=
 =?utf-8?B?OTFGaEFNMVliUnJYWmhiVmRiS0Q1Y2JHaWtLUmUrVUlRYlBROGlzMytBYXlx?=
 =?utf-8?B?bHUxTWplNStEMHNhNzlzVXNnK3ZIaUY3U2RpMjJoeGVMWFJsSUxXOFVFbUth?=
 =?utf-8?B?N0xYQ0o1MVZQbFFPQ2VieFlkemRuTGgzWDltaktCSUdZZWlaVUJ4UFJBVzJu?=
 =?utf-8?B?VTcySXBFeFNhYVhNQXFydm02TUp3TEtjRWUyVjh5dktaTFVlRDg1UWRiV3Ir?=
 =?utf-8?B?czRwazdjRFRrTXRJdTdYUjRFL3RweitaOE92UnZmNTF5ZVd0Y3k2WWx1N1V2?=
 =?utf-8?B?SVViRWhhMWJFTngxbHZLWkdkTmhqdnJrMGgvdlhSWUFhbUhVbVN3TGRNcHpV?=
 =?utf-8?B?Mlg1UG1xY1gyVEFHZnFyaGpJWEZPTklmQ1k3WHFRZDBJYy90UXU0NGx2cEtD?=
 =?utf-8?B?WnpQQ0crVVVMOVlZNVRJdjZaMjNVRE5Rc0ZjWEpqU2ZnRCtTdEwrdE0yb2dh?=
 =?utf-8?B?WURndXRNT3pLZnJhM1IzWGRBMkQzd1d0TE85NTA3YlRKRXBzZ3lTQUk0QUIw?=
 =?utf-8?B?TXByalRrakRlQ2puSk10MzF2OHVXMmpxc1dpNmxzUzcxU09uMStNUmphcDc3?=
 =?utf-8?B?VlY1L042dzJqdnNtNXFDOVZGT3ZYcjIydjZzZldoRWc1d09sWmJKZjlucVZF?=
 =?utf-8?B?ak9BaXRnNWdQbTF6VXpVUmFmQ3hNUnRCb1FybjAxQjJrZUt4NC9tM2N1dUpy?=
 =?utf-8?B?K0xWM1E1KzZaVHJyeGNmclIwTEN3ak9iNFdMYjhqUThYVTJrOHlVbStwM0c5?=
 =?utf-8?B?aG1Db3l6VHB0VlgzazdUTnRYajdBQlV6aGNRc3ZTeWhoUVBmL3pNQkdkY09W?=
 =?utf-8?B?ZTVEdFYrcnB4WUhMUklmTklua0NQSkJJTFd0ajR2SUhFOEFaNTZyUzgrT1I4?=
 =?utf-8?B?OXFnMGQzTGZ6RGxNUGJNOExGVTRXZW5haDNsM2lYUng0ZTg3MjBGb0FXMHpQ?=
 =?utf-8?B?YmdLemFqWXhzdjJxQnlERHo4Uk5YblVCUGtTNXpsVWU1bXduNjZUU0h5M3Er?=
 =?utf-8?B?Y3V0U1RGR1ZPcy84MG5ydGRXdThsR0cxdC9nNTBFQURrc0E3S0xveGNTRUVr?=
 =?utf-8?B?WXJyemhNaEpISXBjNVFaTXJUWU1OaVJpM2xaS2RMSkR6c0JidWNFU2VRWmMr?=
 =?utf-8?B?QUFhMTQ2ZU1uWHhic2tFeStlbTFtOG16cHlpYkplRjNzNmx3a2pHTktUV3oz?=
 =?utf-8?B?TFg5cTEvaldrYmZVZmNwb09yTWxZeTNUQ2dLT2NLaWVIZGw3enZLalY5eWR0?=
 =?utf-8?Q?Ld7O8IRDw8JHlV1M=3D?=
X-Exchange-RoutingPolicyChecked: oNfe8SRpV+lyDedwt8OksYe2UeKsALDDhTox63Lem14VlK22CRdxE2mg2+JSAZh8ULG/3Aj0zsUm956symc7EnMxBARr06Tt6unNh4A68bcCWFI3uTW1Pk5m+BJA2PIb1PBBOvWy2D1wWwffhPbmsPaOY1NikjS5lg+JGnBFI9WrzmNIv2c91vCPXmLV4V3OXSc3MDb/xRK/4aO8PAQkjwIKqeDWcrRYAOMyS0BIqVWL8leLPI124OveIOO4DZDCPhk0A6rbkBHEg13fx431KhIyv3Y0KNUpBS6X8rNHza9MQNJUQ+83MpRcaZXRetGeWCKurtc3px0ewEWGEaBeXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e18b7fc0-f6e8-42d1-1c86-08df4a18be0d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:50:24.0035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VJSB+qyiuuShRu4LvjINWHd1zBGAVxJMsPQOgPfsRY1jHkED2sd0BTBx/XatJ4Hm270kmZ85g4sbjpMW3NKFVmYHlJCXX/AcB0RbBxIDO4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8721
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

When VF enabling fails, xe_sriov_pf_unprovision_vfs() releases VF
resources but does not restore PF scheduling parameters set by
xe_gt_sriov_pf_config_set_fair_sched(). This leaves the PF with
scheduling parameters (exec_quantum, preempt_timeout) set
even though no VFs are enabled.

Add xe_sriov_pf_reprovision_default() to the failure path, mirroring
what pf_disable_vfs() already does on the normal disable path.

v2:
- picked up from standalone patch and rebased (Piotr)
  https://lore.kernel.org/all/20260806095046.1360538-1-marcin.bernatowicz@linux.intel.com/

Fixes: afc480ff55c5 ("drm/xe/pf: Perform fair scheduling auto-provisioning")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 31abcee55211..3bf995736502 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -178,6 +178,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 
 failed:
 	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
+	xe_sriov_pf_reprovision_default(xe);
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 	pf_finish_vfs_enabling(xe);
-- 
2.34.1

