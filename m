Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D75CE8E7D
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 14:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9147010E293;
	Thu, 24 Oct 2024 14:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exHTmiMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B24410E29B
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729779215; x=1761315215;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Rr8J/Kwjwy3N1AMTOjKrvOJBxu1lh76+8wgf28BJczg=;
 b=exHTmiMXN6YPE8Y38PyNdsOhQzPS55J8OU5fnkiNVXcVm4Yl9OnOmCL7
 /onB33IaL5nPHSW6a+goYKes/g6q5hqpKX+fSbkfdQ+0hhTTDK4I4Wl+u
 59Mdgt3dE20xHTY6ADe8vSYmjE6cdLzGwgt3pOWt8oaCZgpTWTzAqbk8f
 w2lReuKiuqqJoQ72ovy8mm1736vfjhhMZYQIrY88IwdtKcxufy+xz14v5
 3iNBCcakH3iT2mgi0qJDzd+cZHl1TFO2EdNxzKUUEgyi4wH8ot9Ek2EXK
 BARrxpYDMXwOI3NbNMWV7MyKKB+urwk6p1jiCnQ8CouIIqn/qi//nxQnD w==;
X-CSE-ConnectionGUID: 1bxhm4IWToqAZ3YNfZVtCQ==
X-CSE-MsgGUID: RVXs82WxR0eP8HOqQKbthg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29521716"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="29521716"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 07:13:34 -0700
X-CSE-ConnectionGUID: gR57y3N1S3SdSX7i11cyRA==
X-CSE-MsgGUID: dFwae6DlReyhlEbi/tAesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="85720332"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 07:13:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 07:13:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 07:13:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 07:13:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ch+/bxRR6XCWJVLUKC4tdMR7JBngR6qDObPC4lhF9MH2j/mofVOUsQqahHGKuoakSBopZUhOXNerq91KnfSh7m7ZJpgzejdi4q3Puom1VYiIH9ZkP/zkL4C3aMFM0bgwKysv98sC64k7kClvTpOiZ3qe2FUuADEicaQU3k78X7OjYmIObE0mj5Hlj9lV5YCksWoBXiGN8BSQ2BR3fZEiUjqlOOvPQRAB4KzvIQhQ+GfK5gdXcgzOKXglVlqihC+MY54k7QWpeW0NUc6TE1ct2joFlqzsXP4iQ07ed02F10fDnY6ZlbGaTLyVqg/4y2+Mis94Zjvd261PL4VLk2qbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rr8J/Kwjwy3N1AMTOjKrvOJBxu1lh76+8wgf28BJczg=;
 b=pjjL881FbG0M5uXjk1iWYfbVGEvUnzYksYY/FFMUvX+cAWqu2PWcwdojBfiYyiPT28WjMd5F9dblIQ0kXNA7vY/2FihUFF1Bw6LEgbIGUOPmGyFedeB0DQVulKj2/9HxNt2gr4N3opOO1qtQOk1fDLbXTQcu8Yp4JsSfGVwU2wnzRGmlwJBdRSj8mO/IOL5aSRraeczFCcYdOp3PFtZFQaHa7jYg6ovlM/l38pjaTfPcY68cKFd7JSwZDTIILaOJn6nKoNBc81HutMSkpHkxSfWDfyzrBz2x8C7EoOyA6PJGYL4XefRlECbKoi7zBO68llu1+L+O1cbIj7CVJmGm6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 14:13:26 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 14:13:23 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Everest K.C.
 <everestkc@everestkc.com.np>
Subject: RE: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
Thread-Topic: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
Thread-Index: AQHbJYEXGXcmm1GtsE6t4rdUtwn3GbKVxF+AgAAtxEA=
Date: Thu, 24 Oct 2024 14:13:22 +0000
Message-ID: <IA1PR11MB82006A9865919A669C83594E8F4E2@IA1PR11MB8200.namprd11.prod.outlook.com>
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
 <a6db328f-54ef-4941-99cf-b7da52287345@linux.intel.com>
In-Reply-To: <a6db328f-54ef-4941-99cf-b7da52287345@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8200:EE_|DS0PR11MB6375:EE_
x-ms-office365-filtering-correlation-id: efbdc775-bee5-4f03-dde4-08dcf436050d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K2NVckpNZEE0c0VsVG9GQk1iWStycDVwZWsrajhJSTNRejZHaHNabmVsZk9L?=
 =?utf-8?B?a2dLcDFXQ3pHQTBZWW1ic3cvSGMrYW1yVzJYeEpjcWtxcFRxNzJHWHlhdU1X?=
 =?utf-8?B?cEdleE5WMWIybUxsMFdRU1IvTXoxMlI5YWV4NVFtOFZaNmxobXBoM2Urdk5v?=
 =?utf-8?B?aEF2ZnV2dXV2RTlVWXpEMGtNNmpZNDVZL2ZuR0VNc0RIN2orZGNJYXJja2NJ?=
 =?utf-8?B?Ky9aTmtnd2hmRTZIRTFpd1Nrc3picHN4aVp0SWs3Tmp6QmlmVFRxK0ovb3V3?=
 =?utf-8?B?KzJLSzZEb2xqcXY4RUQ1K2QzMFdzemlIMDFvTno4THc2MTJ6Um1QVk5vZlhl?=
 =?utf-8?B?c3dKU2kxaUdOR3piSytVQzBBV1lGcEFFbUlraERPb1FlZ0hQdGpWUW1kanVO?=
 =?utf-8?B?MjdHMUlLbGhwa0JHREs3b2R6L21DQk52RVZjeENpcnhQaFo2UmdXMWhWbkJ3?=
 =?utf-8?B?UzBicEU3NGFjY0U5Q29jR3U1Z3NEK0JUQ1RPVDhndkxuclMyeFBZait4MHIw?=
 =?utf-8?B?MDJyakJFVjRhV0RtQTRkQ2NtVWtDLzVFVlJ1cmxIcGtibStDbGZ6NWhtRXZz?=
 =?utf-8?B?bHBrelZCMnQ3OGdCQmNiRC9WcHJ2Z3lkTFdMQVEwRjJkSWdIclIvTzBRdXpX?=
 =?utf-8?B?blIzbVdoL09KaWpObkJMSk0vbTNyRWdHZnl5ditKSWFvZlluL0xqRzNyOEtz?=
 =?utf-8?B?KzdXbGVtb0ltb3BZR01jdzBDc2FyQTJiQVVIOWo3eXV0ejJubGJYR2czUDV0?=
 =?utf-8?B?K1NQTzdGeXFpTXRHR1U2dUZSVnRmcEUrZTQwQlhDbnJCU1lmd1hGR0twOWo0?=
 =?utf-8?B?c1B0M2xJQnArc1M2dXJCNGN4R3BwRFpINXljSmpmRlVFL056OGg5VWo2YUtj?=
 =?utf-8?B?MzM0NXhvMmNET3lCbXFKaTMyWlpKZkhuSi9kU3RGSU56NnRnNmZ2QURDTTA0?=
 =?utf-8?B?UnZXRTlmKzlQc1plVW5RU0xNTm5zY1FwbkdxeUJwZDBnY3dkOUd2R0FjZjlj?=
 =?utf-8?B?ZmNKR1YzZFM1RkR1OVNwenYzcEVCM1FmRXV2TnBZVzhBa2psN1FmbldMVFBZ?=
 =?utf-8?B?ZGhFQ2kzTXpYbHdnT1dONkZEWVFOK05IZDhCcUUrcjRXQXVEc1JFUUxaMEFa?=
 =?utf-8?B?NkZ2YXo1ZTZDbEtULzJ4RHAyRkFaSWhPNUFrcld3azFkaG03c3pNdllyMDZB?=
 =?utf-8?B?cUdORzdYek4xNTlFb1NpUXlKbmxiazJadnVNS0I4R2pSYlFUNE5oc0QvSlR1?=
 =?utf-8?B?dlVBalJuaVphY2srazJxMVpkQXdxN2wvdnVpYjk3d3A0alY1MDRZc3ZXcm02?=
 =?utf-8?B?eXEvVmVnUk04cENvS25xT0tqK3U2YVBIeTJOcWlZYTl1SUs4QXF1MXhNbGVR?=
 =?utf-8?B?OHMvMmROZ2o0ZnJTb0ZVWnVVdnEwS3VxM24xOUVsWGpNSjZpSFRhV1lMWGFH?=
 =?utf-8?B?THY4ODNUZlRiMFJUQjN3V0ZQYTE5VjltZ0F3U2lCa0hFUGd4SlhweGczSVZV?=
 =?utf-8?B?RFNwNnRFbHo4MTRSVFZjYVBwVjg2RXNDZHBvam03NkVNdzA2MlRYVkJ4a0VG?=
 =?utf-8?B?WXJoajE0RzlJYzUvWXRmdFZwaG9CS1hQdll4Njd3OUZ6cFcvYTZTYU01dGJM?=
 =?utf-8?B?Vi94Y0d0QkFYWUx5bS9OdXNxZG56U1BvcFNkRzNVS0FuZDhRdjZHMDg2QjJT?=
 =?utf-8?B?QmRYSFY5R3JoRVdvQlFDdFhWV3kzZkxGNW0zN2NSSlFxR24zRDg2Y1NYamFZ?=
 =?utf-8?Q?hLgHn6Zh8jNhx91F4//jz+FqRjrJa775v3P4sbx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWp5cmI3dzFNTVVRTUFjK21MQXowSU5PYU1YZVJPdmNFRkxnamx6S3FLMDlw?=
 =?utf-8?B?WmtkaU1aVHplRVVHRWxOUE4yN1E0RytZekpmcmlDQVk2eEFsVkVmM3Q4enlh?=
 =?utf-8?B?VzRidjg4bmRMYUlTZ01PT1FBQjhkSks3bTJXbWs1VlppdUpuYVd6WDBwVkp1?=
 =?utf-8?B?RXdFd1h5SHBDRkFuaVRqQk05Z1FqV3FqRnRuRFpsYzlaaGVObDBrQVk4WlN1?=
 =?utf-8?B?YW5jVGJLN1BuRTdUR0tHNGRFUHlVeWxRL3RweUNDN3Y5dk9KWlh0MmwxeXgz?=
 =?utf-8?B?aEp6eGRiRjJIbzg4aC9oTnlvNEpraFFLV3BPNnAxdld0ejQyMmpsd1Q2R09J?=
 =?utf-8?B?TXVxM2JKYlVWeDFPZjBFZGdVQmsxSEFJQXhMQ05IcUFKSGd2T0gwTWJ4b1hI?=
 =?utf-8?B?RUxZc24vd2crSE1uY3dBbHRPWlkvT3VVQjhyWEZCN0hmQS92VHpUNXdCeFBa?=
 =?utf-8?B?M3hOeTQvcWc4OStQL1N6ZGxkN3JpdFZlOEtGaEF1TDFXdXR2RDREVEJCT3Qr?=
 =?utf-8?B?NUdnSG9jbzNNWHp0ZEtkTm1GeUhkT1h1ZEY3QmpIR3RNdEIyRmtWR3VNeWhy?=
 =?utf-8?B?YTcreHNObG9Ma1AvNCtSYTVabktDQVk5anc4NmRIZ2pyNHBZMjI4SkFtZTBu?=
 =?utf-8?B?c1gyMkdoNHoyR3BQRDVSZ3l5ZXo3RGJPaDA5M2h1RWxPMXlBZ2FtbXpkOTBJ?=
 =?utf-8?B?R1pRMmdkK3VkZ215N0hTb0RoUXdHbkMra1J5bU9rTUZqUXIwZnozcnkrQW1N?=
 =?utf-8?B?aGZTQVJwSWdaTnQ4REVWSzlTcWprWlR2RWhmT2NoVXZqVi83U0lRVWJqeGYw?=
 =?utf-8?B?M3ViV3BIZ0pQTEptckpob3o0d3dXRGphRXhTNjNwRkJRRHdUTWthV29CUzZG?=
 =?utf-8?B?WkF2WmlzOEZKZnM5Q3VrNXNDMHI4QjdXVkJoMmptYStRWldkWi9SaWRaRWpP?=
 =?utf-8?B?TldxcGgxRjVnVnVmd1B4R1FUbzN2SWRHcTZtcXRoSmdHR1JEUTVyTFRPMjdX?=
 =?utf-8?B?ZHBtMHN6c29saUUzNXA1Mzl6RzBSVjJnME5PS0VDN2k3N1NFTTBGRndBUWVB?=
 =?utf-8?B?cEFzM3FtQUVxQjZLdWFhYnEzVnp4TnV2SkJialN3MzEzWU1Jd2NlSHMrMi9k?=
 =?utf-8?B?ZGIzUWF2RlJHcHRUWkorTFp0Z0pieURpT3lKRWk1NW9wd0luZ2w3SkEwa2Vi?=
 =?utf-8?B?UTg0bTNPOXFNc1VLb2pHdXZ1bXQ0a0t4ZjVzTmZEcnhVeXVXcFVxUnJrZlhL?=
 =?utf-8?B?c1NFazBObStWS2FhV1NpYkxwTXRIYVd0RkxDbXVJcWJDcVN5YWZyTlltaEIv?=
 =?utf-8?B?ek01K3FlcExPSGo1VU1lYVA3RzRLeU96VjRnYkJZWGNsL1RBWGlQNFQ4eWxD?=
 =?utf-8?B?dkt2T2RyVUtobUVkVmVvamlRNGF1aFVHN2dtbEQ1ckxON2pWQ2JxMlI2VVRE?=
 =?utf-8?B?Wk92ZEh4M1FBNW11MWVHQWcwL1NEOVVIaCtOcFRJWjdNWEFxa0hSS09CWk9q?=
 =?utf-8?B?RnVNVU1Nc2l2VmFXK0xVVDZYRm9tYklscFZDb1I5RFVldFRFc3hIcEJRNzlq?=
 =?utf-8?B?akppaW5qcXMrT1F5aFB0Y3BBL0ZNLzZnZHRqSjM3ZHhqU0FybWVMWFo3NDZp?=
 =?utf-8?B?Sm5TWGhLeDhDMW5hMU5jZUdScmVRZ3NJN3U1bGJpL3lUR3FCN0U1Uy85UEp5?=
 =?utf-8?B?cU5QSmVMTTJsckRyU3YzNUxxTXJOK3AzVHE0U3Bham5RdHdGbVVsVUVzNEZY?=
 =?utf-8?B?eDNjWTVscG1tQmFRa1FyQU5Ea2V5bTFDNVNraVRlZjJRYjNGWW5OMCt5Q0U4?=
 =?utf-8?B?M2kwdlJvN29tWTgrOWxlK1Uzbnl4VmY3MStLU2ljb0JIK291MnVTeWp6eWFG?=
 =?utf-8?B?RjEzVjJIN3dWUWNZbkxxRFkwOEkyUXEvVkNKNnhCbDM3NG5NQ3lDZE5ucW9T?=
 =?utf-8?B?eEJHWE9BNnRUZGs1MHBTdDNXTCtlVFdjYUtmamloUXRUM0FtcUFOUC9wZjBZ?=
 =?utf-8?B?cTljUWxudzBEazcyMTJrRWVVSDZOVWNZelU5NnpXYzlwTTRvYVlGejBoNFVC?=
 =?utf-8?B?cTFWbjIxbnVuWWIxZFVvRjJnMkVsM2orUEVVWVJ0c0RrNDVQeDh5VTlaNVNw?=
 =?utf-8?Q?8E0QDR5i8gxZ54ToP4mLcgjCm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbdc775-bee5-4f03-dde4-08dcf436050d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 14:13:22.9747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TylubuPaYSD+XKUB1XGzYmgU6Xz8eAprQYB5jOrPIq2ZNOJc30DsCqbBLfXM/44sJ8pJd3E9togkUzqbJaNVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6375
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

WWVzLCBJIHdpbGwgc2VuZCBuZXh0IHJldmlzaW9uIGluIGEgc2VyaWVzLCB3aGljaCBpbmNsdWRl
IHRoYXQgcGF0Y2guDQoNClJlZ2FyZHMsDQpaaGFuanVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogTmlybW95IERhcyA8bmlybW95LmRhc0BsaW51eC5pbnRlbC5jb20+
DQo+IFNlbnQ6IE9jdG9iZXIgMjQsIDIwMjQgNzoyNyBBTQ0KPiBUbzogRG9uZywgWmhhbmp1biA8
emhhbmp1bi5kb25nQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IEV2ZXJlc3QgSy5D
Lg0KPiA8ZXZlcmVzdGtjQGV2ZXJlc3RrYy5jb20ubnA+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEgMS8xXSBkcm0veGUvZ3VjOiBGaXggbWlzc2luZyBpbml0IHZhbHVlIGFuZCBhZGQgcmVnaXN0
ZXINCj4gb3JkZXIgY2hlY2sNCj4gDQo+IEhpIFpoYW5qdW4sDQo+IA0KPiBUaGVyZSBpcyBhIGVh
cmxpZXIgcGF0Y2ggcmVnYXJkaW5nIGxpc3QtPmxpc3QgY2hlY2sgd2hpY2ggaXMgcmV2aWV3ZWQg
YnV0IG5vdA0KPiBtZXJnZWQgeWV0LA0KPiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoLzYyMTI1MC8/c2VyaWVzPTEzOTgxMCZyZXY9NQ0KPiANCj4gDQo+IENvdWxk
IHlvdSBwbGVhc2UgcmViYXNlIHlvdXIgY2hhbmdlIG9uIHRvcCBvZiB0aGF0wqAgYW5kIG1heSBi
ZSBjYXJyeSB0aGF0DQo+IGFsb25nIGFzDQo+IA0KPiB0aGUgbGF0ZXN0IHJldiBvZiB0aGF0IHBh
dGNoIGlzIG5vdCBzZW50IHRvIHhlIHNvIENJIHJlcG9ydCBpcyBtaXNzaW5nLg0KPiANCj4gDQo+
IFJlZ2FyZHMsDQo+IA0KPiBOaXJtb3kNCj4gDQo+IE9uIDEwLzIzLzIwMjQgOToyMyBQTSwgWmhh
bmp1biBEb25nIHdyb3RlOg0KPiA+IEZpeCBtaXNzaW5nIGluaXRpYWwgdmFsdWUgZm9yIGxhc3Rf
dmFsdWUuDQo+ID4gRm9yIEd1QyBjYXB0dXJlIHJlZ2lzdGVyIGRlZmluaXRpb24sIGl0IGlzIHJl
cXVpcmVkIHRvIGRlZmluZSA2NGJpdA0KPiA+IHJlZ2lzdGVyIGluIGEgcGFpciBvZiAyIGNvbnNl
Y3V0aXZlIDMyYml0IHJlZ2lzdGVyIGVudHJpZXMsIGxvdyBmaXJzdCwNCj4gPiB0aGVuIGhpLiBB
ZGQgY29kZSB0byBjaGVjayB0aGlzIG9yZGVyLg0KPiA+DQo+ID4gRml4ZXM6IDBmMWZkZjU1OTIy
NSAoImRybS94ZS9ndWM6IFNhdmUgbWFudWFsIGVuZ2luZSBjYXB0dXJlIGludG8gY2FwdHVyZQ0K
PiBsaXN0IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0Bp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVy
ZS5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX2NhcHR1cmUuYw0KPiA+IGluZGV4IDhiNmNiNzg2YTJhYS4uZDdmZjdkZDYwYTFk
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY2FwdHVyZS5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmMNCj4gPiBAQCAtMTAy
LDYgKzEwMiw3IEBAIHN0cnVjdCBfX2d1Y19jYXB0dXJlX3BhcnNlZF9vdXRwdXQgew0KPiA+ICAg
KiAgICAgICAgICAgICAgICAgICBBIDY0IGJpdCByZWdpc3RlciBkZWZpbmUgcmVxdWlyZXMgMiBj
b25zZWN1dGl2ZSBlbnRyaWVzLA0KPiA+ICAgKiAgICAgICAgICAgICAgICAgICB3aXRoIGxvdyBk
d29yZCBmaXJzdCBhbmQgaGkgZHdvcmQgdGhlIHNlY29uZC4NCj4gPiAgICogICAgIDIuIFJlZ2lz
dGVyIG5hbWU6IG51bGwgZm9yIGluY29tcGxldGVkIGRlZmluZQ0KPiA+ICsgKiAgICAgMy4gSW5j
b3JyZWN0IG9yZGVyIHdpbGwgdHJpZ2dlciBYRV9XQVJOLg0KPiA+ICAgKi8NCj4gPiAgI2RlZmlu
ZSBDT01NT05fWEVMUF9CQVNFX0dMT0JBTCBcDQo+ID4gIAl7IEZPUkNFV0FLRV9HVCwJCQlSRUdf
MzJCSVQsCTAsCTAsDQo+IAkiRk9SQ0VXQUtFX0dUIn0NCj4gPiBAQCAtMTY3OCwxMCArMTY3OSwx
MCBAQCBzbmFwc2hvdF9wcmludF9ieV9saXN0X29yZGVyKHN0cnVjdA0KPiB4ZV9od19lbmdpbmVf
c25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3QgZHJtXw0KPiA+ICAJc3RydWN0IHhlX2RldmNvcmVk
dW1wICpkZXZjb3JlZHVtcCA9ICZ4ZS0+ZGV2Y29yZWR1bXA7DQo+ID4gIAlzdHJ1Y3QgeGVfZGV2
Y29yZWR1bXBfc25hcHNob3QgKmRldmNvcmVfc25hcHNob3QgPQ0KPiAmZGV2Y29yZWR1bXAtPnNu
YXBzaG90Ow0KPiA+ICAJc3RydWN0IGdjYXBfcmVnX2xpc3RfaW5mbyAqcmVnaW5mbyA9IE5VTEw7
DQo+ID4gLQl1MzIgbGFzdF92YWx1ZSwgaTsNCj4gPiAtCWJvb2wgaXNfZXh0Ow0KPiA+ICsJdTMy
IGksIGxhc3RfdmFsdWUgPSAwOw0KPiA+ICsJYm9vbCBpc19leHQsIGxvdzMyX3JlYWR5ID0gZmFs
c2U7DQo+ID4NCj4gPiAtCWlmICghbGlzdCB8fCBsaXN0LT5udW1fcmVncyA9PSAwKQ0KPiA+ICsJ
aWYgKCFsaXN0IHx8ICFsaXN0LT5saXN0IHx8IGxpc3QtPm51bV9yZWdzID09IDApDQo+ID4gIAkJ
cmV0dXJuOw0KPiA+ICAJWEVfV0FSTl9PTighZGV2Y29yZV9zbmFwc2hvdC0+bWF0Y2hlZF9ub2Rl
KTsNCj4gPg0KPiA+IEBAIC0xNzA2LDExICsxNzA3LDI3IEBAIHNuYXBzaG90X3ByaW50X2J5X2xp
c3Rfb3JkZXIoc3RydWN0DQo+IHhlX2h3X2VuZ2luZV9zbmFwc2hvdCAqc25hcHNob3QsIHN0cnVj
dCBkcm1fDQo+ID4gIAkJdmFsdWUgPSByZWctPnZhbHVlOw0KPiA+ICAJCWlmIChyZWdfZGVzYy0+
ZGF0YV90eXBlID09IFJFR182NEJJVF9MT1dfRFcpIHsNCj4gPiAgCQkJbGFzdF92YWx1ZSA9IHZh
bHVlOw0KPiA+ICsNCj4gPiArCQkJLyoNCj4gPiArCQkJICogQSA2NCBiaXQgcmVnaXN0ZXIgZGVm
aW5lIHJlcXVpcmVzIDIgY29uc2VjdXRpdmUNCj4gPiArCQkJICogZW50cmllcyBpbiByZWdpc3Rl
ciBsaXN0LCB3aXRoIGxvdyBkd29yZCBmaXJzdA0KPiA+ICsJCQkgKiBhbmQgaGkgZHdvcmQgdGhl
IHNlY29uZCwgbGlrZToNCj4gPiArCQkJICogIHsgWFhYX1JFR19MTygwKSwgUkVHXzY0QklUX0xP
V19EVywgMCwgMCwNCj4gTlVMTH0sDQo+ID4gKwkJCSAqICB7IFhYWF9SRUdfSEkoMCksIFJFR182
NEJJVF9ISV9EVywgIDAsIDAsDQo+ICJYWFhfUkVHIn0sDQo+ID4gKwkJCSAqDQo+ID4gKwkJCSAq
IEluY29ycmVjdCBvcmRlciB3aWxsIHRyaWdnZXIgWEVfV0FSTi4NCj4gPiArCQkJICovDQo+ID4g
KwkJCVhFX1dBUk5fT04obG93MzJfcmVhZHkpOyAvKiBQb3NzaWJsZSBkb3VibGUgbG93DQo+IGhl
cmUgKi8NCj4gPiArCQkJbG93MzJfcmVhZHkgPSB0cnVlOw0KPiA+ICAJCQkvKiBMb3cgMzIgYml0
IGR3b3JkIHNhdmVkLCBjb250aW51ZSBmb3IgaGlnaCAzMiBiaXQgKi8NCj4gPiAgCQkJY29udGlu
dWU7DQo+ID4gIAkJfSBlbHNlIGlmIChyZWdfZGVzYy0+ZGF0YV90eXBlID09IFJFR182NEJJVF9I
SV9EVykgew0KPiA+ICAJCQl1NjQgdmFsdWVfcXcgPSAoKHU2NCl2YWx1ZSA8PCAzMikgfCBsYXN0
X3ZhbHVlOw0KPiA+DQo+ID4gKwkJCS8qIEluY29ycmVjdCA2NGJpdCByZWdpc3RlciBvcmRlci4g
UG9zc2libGUgbWlzc2luZyBsb3cNCj4gKi8NCj4gPiArCQkJWEVfV0FSTl9PTighbG93MzJfcmVh
ZHkpOw0KPiA+ICsJCQlsb3czMl9yZWFkeSA9IGZhbHNlOw0KPiA+ICsNCj4gPiAgCQkJZHJtX3By
aW50ZihwLCAiXHQlczogMHglMDE2bGx4XG4iLCByZWdfZGVzYy0NCj4gPnJlZ25hbWUsIHZhbHVl
X3F3KTsNCj4gPiAgCQkJY29udGludWU7DQo+ID4gIAkJfQ0KPiA+IEBAIC0xNzI3LDYgKzE3NDQs
OSBAQCBzbmFwc2hvdF9wcmludF9ieV9saXN0X29yZGVyKHN0cnVjdA0KPiB4ZV9od19lbmdpbmVf
c25hcHNob3QgKnNuYXBzaG90LCBzdHJ1Y3QgZHJtXw0KPiA+ICAJCQlkcm1fcHJpbnRmKHAsICJc
dCVzOiAweCUwOHhcbiIsIHJlZ19kZXNjLT5yZWduYW1lLA0KPiB2YWx1ZSk7DQo+ID4gIAkJfQ0K
PiA+ICAJfQ0KPiA+ICsNCj4gPiArCS8qIEluY29ycmVjdCA2NGJpdCByZWdpc3RlciBvcmRlci4g
UG9zc2libGUgbWlzc2luZyBoaWdoICovDQo+ID4gKwlYRV9XQVJOX09OKGxvdzMyX3JlYWR5KTsN
Cj4gPiAgfQ0KPiA+DQo+ID4gIC8qKg0K
