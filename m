Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F23C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 19:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94A10ED86;
	Tue, 11 Aug 2026 19:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZ7QESVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED83810ED86
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786478130; x=1818014130;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CaXbqfT9wWcxnPFC2gxj4rIww1h9e71pWqsrR6P4o4w=;
 b=DZ7QESVfEGWEBrvzT3wTM+WB8mI1KQ/goTZJJrzEooY3gHrFCyZ0i4jX
 eV5Q/JvPRwN2r1q9wvukEvQybp+5lg1Amode1JwS0mSmZ8WKijDhKX+ia
 B8PW1odVZGGU2ZL3NTv5ltnbsnmHY1QZLIbrRfSjqEAIBB5lp5aNC682K
 JNunX+vIZ4u41lU4brs+bhkwAuxYOOuAaj482THr499uqJPfZXjLTiSjR
 fmD9d6mY5ki6c5nw7lX9dn3dV/AMQN3xv1DW8kNTW8jtE+7eRmxhQ6OB/
 F+dXYNWGzwmMEEnl61/M8hQpmBx+S2PKu1V9toq0TrumoDYKPzLChfhn0 Q==;
X-CSE-ConnectionGUID: gtmCYujeS/mGHa8pYZMbIg==
X-CSE-MsgGUID: as/lFlOMSUG6lyNJD2gYWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87234109"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="87234109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 12:55:29 -0700
X-CSE-ConnectionGUID: I1vAjoB0S0u8oaQYf/C8Rg==
X-CSE-MsgGUID: OAa+++zoQ/2dXl3Wx9mWDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="259167735"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 12:55:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 12:55:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 12:55:28 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 12:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJcn9qwWAST8QeDNhBol/qwsIJPvQNFRRc49RC5JLlMp43VoW+IXsq7+6ymOcGrM3FP/9T2/9wVCgUiXHljrnvljM69u2CdjX73RnMoaW8bK5h2FTYuG8+xj+JQBET/UnX8JixS+UgelVtO1/C4g99vZ8TQGamsQM1jMKjyN9csN21fA/yyv26ioXtvDrhbppDa0NzpBhqg3/JJOSUoaSAca+EFRJWoXNoxfJoQmTErObIPctiN7c+YY3VHCznBHc/1tJfaJvnb/+4K0QJV4GaX8oRIcpEZMnHLuzw853ZWqymE4D7SfVSXHa2CL0PLEHwgeMsadKvwePJ71aAm3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaXbqfT9wWcxnPFC2gxj4rIww1h9e71pWqsrR6P4o4w=;
 b=wgGIleOQb3VrzqTSb6mxJ+ndDqAD860i1wb86DrAatN5ZuCTyCaCUFQ3KD2dpEw2qmTTjLRyuMc9MG4AV2Y8txsB/26/lY4bAGTM8LM0k9mf1aUM4PmlZnuhlKUlfSYOdZqn17TYhPi7NWhrRLCCBKmyKtlYq2Ws15VHzz5a9idlh63MjQjPmCQCCDh86o5wsn3BPDR0PkNdlM9BT3RJCI58J9WvICzv0nxow5VHu0QD4Ghq3UIARG+XhYWbUy3+xCeKikrfZCyutDprlojhQkVq1xzSpxk/iB3HzdndGilo818QtSqwq0WKZobZaaZyEvOi+m5KP2m+uOJtCD/cNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by SJ5PPF09F392AFF.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::808) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 19:55:19 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 19:55:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v3] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Thread-Topic: [PATCH v3] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Thread-Index: AQHdJTV6FE4qIpraF0GHgqfBOlF3eraZTD6A
Date: Tue, 11 Aug 2026 19:55:18 +0000
Message-ID: <1f809ee1978cfa9fb9f9906cc85ca8bdf2681278.camel@intel.com>
References: <20260805234649.2076384-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260805234649.2076384-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|SJ5PPF09F392AFF:EE_
x-ms-office365-filtering-correlation-id: 597b8bd5-e5e4-4cea-e071-08def7e2787c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|3023799007|38070700021|10067099003;
x-microsoft-antispam-message-info: QrG1rkq53F1QxWY7dUH9Vk6TgU1kMTu67GIa/dK0yVNu+Qvk47Phfj+ZA1IHyGjP1dlXBHithH6ie5ww8bDEtnVYdUiv7VxeEtKG8pkmfLeaZpRC4NEGK/BX37JM1bwhwScYPmf1jK/plVdXzoj6Fvba39SCLopRJzhmUlohgZGfTjpZfoCJeobHEuv460z71LRlFFZK5/9I9TEZk75UehTRPKKf6ib21qxdoLVOnCTChPFLX2zJbvy1VEi8g7OzSZOzIu6a99stRWMJcfDv1oeDfTtzaT+rQC91u9o7cYnX8oCT6j08K3mjAl8nIYtX1U1/czhTSyQI1M2veSPMH2Rym4pbcbGrez4M8WrXV1su2tTAXGnIO3RcU3IB7f13xftoFqmO4KqJWQFxKLeXq7yBy2iUgk8ypcMK7PKHOU2/T9NM45Gm7HRqWadA5mXuN5b4dKiC9PXbYcmivDc5Ng7KU80ZKrBNR37nFS4hpkVYNTuXyhFpvCV3TEIq0w8gtBXpGkW+Lof+lhnMOWNI4xX2AIh6X7Ta9xiaz7gG8Il8ZggG+yneic64jgQfeZ7QLHM2C59Mi9J2fBLoDhyzHmaPPcTVZBi/Kw+ZeJTlwBAgEL0Z1wfP/GvDUmRxdSX9tlu0wLxmHZK9AEXAWrRK4S8mL/4c6IA5YA9tZ4doS3SwF20+oqlcWQyL3xE4ROQ+2qouJw6MLI/virioBGxa9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmpyRkFObXpoYUlGNm1HemJueFE5REd4RGhOZHRlS05iRGw3NXIvNGlWejg4?=
 =?utf-8?B?M25pd0tDenBWeXFXZ016eGJOUndRN2kwYlBXeWdtK2IxZ21oWS9TTTdsTUFi?=
 =?utf-8?B?QVIyd1dVcksvU1ZsSU41dnNvbng4MER2TkRKMTJOUnloMHZNN04rMlBnU0FJ?=
 =?utf-8?B?OTR4aVQrWjE4M3dsRldLSU9DSVRheFkvYVBLckxDUkNZNU5CcUVkMTR1bmFG?=
 =?utf-8?B?ZW05YWZ2Y0JTR1lteEhDRCt1Sm1id29WQmgxY0JFMTBLcnQ3enZLcll4SEZK?=
 =?utf-8?B?YVVVRUQyaTRoSC9mdW1RQnh4SWlpNjNrK3Fxa1o0U3YzaURieEdJVyt1WHdz?=
 =?utf-8?B?bThlUEh0L3F4K1hQa3ZBUXlzblEyVGZKSFlyMHE0N2VELzZablE4VkJFMG5T?=
 =?utf-8?B?di9wQzdYenArYk5Ka2NCblVGTXV1MERzSlJESmgxVDJ2dm9tZGxsRUM3RGZO?=
 =?utf-8?B?Ymt0U0hocGRkb2p0alRkTU1GdUFVcC9jUDFxbTdtV0hvWUtCUXJaS2dya3Fq?=
 =?utf-8?B?NzZxZXh6K2NpbktQYTFQZHBMMXBHaHI3YTBTcER4Q0ZZWGhVeEx2RVE2Y1BO?=
 =?utf-8?B?Yjd3bEFMd01yVk1yNlo3MFhkRXQyOGFSa1pZNnlXMVB5WjJ4ZEl0U2NCMUpD?=
 =?utf-8?B?dk01M3hOeDd0WVZqVExMdzArK1ZJZVI3U2xWWm9uNExVa3JXM3VUT3dKSExO?=
 =?utf-8?B?emRXS1hTditBR3JIZ2pjMEFGMmN4N0VKdS9vRXkwQlptVGllMDlOSDFIMG9z?=
 =?utf-8?B?QkdOQ25yNVhsMUtJVWNjNmNGdGQwOEVaWXBVUmlmZEYycDdYN0MzVm1qOWJF?=
 =?utf-8?B?NkFxYUYybzFRUVdCSXhIeElhTlJNTGxJN0dCMEpRaVNsUm9LeVZLa2tTNFRp?=
 =?utf-8?B?ekorTnN4NVpsQUZ0R1oza3VhQkQwdmR3M1dMdzI1eG9DcmpUckNURFFXUFV3?=
 =?utf-8?B?MkVJNzhnS1JmVEs4d0x5dW5YMGdveGt5eFg2T2xkN09mMXc5ZGthaEliZDlJ?=
 =?utf-8?B?eEprOVc5MUZkTmpZc0FvSmlrU1ErVTVJVVZyMERrOGcyNlY1cmtkTWo0aVR6?=
 =?utf-8?B?ZG0rcnpobk1iazAwTFRrV2J6YjN3eDR3S09aZ01sS1FYY0FPeWhFMTE4bTJO?=
 =?utf-8?B?K2FGcHZ4VFlxS2J6U200NlNnSnBRVlpIdTlmdTRjL1BrU3lXN0liVUdQUnA4?=
 =?utf-8?B?VTNHUUpUVWQzc0dxci8yemNBNTN6T2w3NGM2SWJqTEN3RHlhQllwOWJENFJH?=
 =?utf-8?B?ZHBvS05yK1BITC9nSjRYY21OZWVoQ0Mzd2hiT2J4VS9FbTFZYW1mR1JZc3pK?=
 =?utf-8?B?U20ydHlxWVdrY1NoN2dsUUhoQzZBT01sR0t4ZkROa0tsSVVqUVpGT2tzYXI0?=
 =?utf-8?B?Y29ycXYrVHJTc1FFWUoyZlpIcXl6bTBhOTRpaDJSVmRRZzhXejBXaVp5dDJj?=
 =?utf-8?B?UkswUStFN3Z2emEvanNHWERNaXpHLzhXbG9tbUlhMTFJMSs5dlV2OS84TDh1?=
 =?utf-8?B?THVLWEozUys1M3RzUWZ3Ymk1d2tUS1lTaytxOTJya3E1bTRvUWRZUjBZY3o0?=
 =?utf-8?B?bGV3a1pMZ2V2QmxPdnFmT01WMjM0aGFWUFdNbWpFN1pURlNMdGdQZFVkUm85?=
 =?utf-8?B?VEMzaVBqY2Rmdm5FL25wN3NyT0xMMzhJa2NmajM1M0lFNnRWOHAyOHk2VUFC?=
 =?utf-8?B?RXFQT0lGZDdDdWNZTVFpb2MxQUNSRkhGWGg1TmdQdDNHazBrVkdUamFxdjRp?=
 =?utf-8?B?MGNBbUMzZXVBNXJObmYrMkRuQXM0TXkyRWlzNTBYZnQvd0owTi9UT2IrMXc1?=
 =?utf-8?B?bHJIVmtVSVF0a28xN1pkeXVTcUcrK3ZTVDdtZGREU2dFL2ZSeVp3cHBQRTh0?=
 =?utf-8?B?Ykc4QnN6N2JoUjRwNnlIOUQ5MW5iYkpycDg4MCtCYVJqVlFGS0RTMlI3TE9s?=
 =?utf-8?B?WVNoWElINHJUcjhhMFJ0ZTBUU093enRacTFqSWMzb3RLTGNZdmdKQVF1NHo1?=
 =?utf-8?B?TE9BdHE2d3Vpc0ZUSXRRR2l2bmplOGRmSHNBZmlmQXpRQmtyVlJMRXRMdENZ?=
 =?utf-8?B?ZXlEK0lxeFpkNjVienJmQ2l3eGZWR2k4OHpGeWh0b1N6ZGJDWG55c21OSzlz?=
 =?utf-8?B?R1lpWmtWL0l2dGtUdHJqUnYreXJjZ2lmQVZvQXVyb1NibGlNc2cyUHdGTDcz?=
 =?utf-8?B?c3hFZmdSQWNsR0FYa0lxS2I3c1kvakpRQU15aWxMZEhzQnBvUTZLR1laS2Nk?=
 =?utf-8?B?RmpOYitlY3ZpTldzck5zcVNVMzFZSFkrM3ZuUktPQllqbU9jcGJxd0dmSGlB?=
 =?utf-8?B?eDhQdGZSdGpuQTRRa0lrYllnNFQ4NFlrOGo1V2lmMVVsNkVaR1RUV3VjWDR1?=
 =?utf-8?Q?eqmSVQONC6o22YiI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D13CA150CE46ED41818230317D2625A0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y3dvvoqdzLgRrljy/0bRwny8l4WbqrngiDWN5r159RKHGvl+2RwFfglLgs1gp7vcBkd2KxmWimJSXEVpcWvN6vQrnNkW52YlnpN61IdFogS5UGMOE3tAJqYNBeC7MmV6mNLgoUurrTy6pHTQxOxClGqBZJEXoeuxM0kDN6gWdOeD/EcrD2kbn1G8QtX/8rLUsY/WYsu1Ioe3aBPXjDRQl3DvYr95pHgPPzhSaI7eQ6BVRj1Yyr0Doc8YzihQmfMEWCCrgAiChxrZCmRnbCzDOTwzQ7FgU5ABlaOY0unwmI9VSzckP6k/aVdsxrZRKS8L8njuNk2ojL8gicQFgrFvbw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597b8bd5-e5e4-4cea-e071-08def7e2787c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 19:55:18.9171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4FF9xI+plLpS7I9qpAawRGZvlyr7Fx6tJxmG9eRDm6yKnJeLQzM1cNKptOyITSbZXbnulM3F/E/onk5xElL35da4d7yuHX9V2w9zsLVL9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09F392AFF
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

T24gV2VkLCAyMDI2LTA4LTA1IGF0IDE2OjQ2IC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Ogo+IEluIGNhc2VzIHdoZXJlIG1pbiBmcmVxdWVuY3kgd2FzIGFjdHVhbGx5IGdyZWF0ZXIgdGhh
biBCTUdfTUlOX0ZSRVEsCj4gd2Ugd2VyZSBub3QgdXNpbmcgdGhlIHVwZGF0ZWQgbWluIGZyZXF1
ZW5jeSBhcyB0aGVyZSB3YXMgYSBtaXNzaW5nCj4gY2FsbCB0byBwY19hY3Rpb25fcXVlcnlfdGFz
a19zdGF0ZSgpIGJldHdlZW4gdGhlIHR3byBzZXR0aW5ncyBvZgo+IG1pbiBmcmVxdWVuY3kuIFNp
bmNlIHdlIGtub3cgd2hhdCBtaW5fZnJlcSB3YXMgbGFzdCBzZXQsIHVzZSB0aGF0Cj4gY2FjaGVk
IHZhbHVlIHdoaWxlIGNvbXBhcmluZyB0byBCTUdfTUlOX0ZSRVEgdG8gZml4IHRoaXMgaXNzdWUu
Cj4gCj4gdjI6IHBjLT5mcmVxX3JlYWR5IGlzIG5vdCBzZXQgdW50aWwgYWZ0ZXIgcGNfYWRqdXN0
X2ZyZXFfYm91bmRzKCkuCj4gU3RheQo+IHdpdGggcGNfYWN0aW9uX3F1ZXJ5X3Rhc2tfc3RhdGUo
KSBpbnN0ZWFkLgo+IAo+IHYzOiBVcGRhdGUgY29tbWl0IG1lc3NhZ2UgKFN0dWFydCkKPiAKPiBG
aXhlczogYmRkZTE2YzlhYzVjICgiZHJtL3hlL2JtZzogVXBkYXRlIFdhXzE0MDIyMDg1ODkwIikK
PiBTaWduZWQtb2ZmLWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbgo+IDxiYWxhc3VicmFt
YW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmluYXkgQmVsZ2F1
bWthciA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1
bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KClRoYW5rcyBmb3IgdGhlIGNoYW5nZSBo
ZXJlIQoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyB8IDEzICsrKysr
KysrKystLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYwo+IGluZGV4IDU5ZjJmYTc5YWQ0Mi4uN2Nm
OGY0ODU4NTk4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYwo+IEBAIC05MTEsNiArOTExLDcg
QEAgc3RhdGljIGJvb2wgcGNfbmVlZHNfbWluX2ZyZXFfY2hhbmdlKHN0cnVjdAo+IHhlX2d1Y19w
YyAqcGMpCj4gwqBzdGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QgeGVfZ3Vj
X3BjICpwYykKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiArwqDCoMKgwqDCoMKg
wqB1MzIgbWluX2ZyZXE7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVs
ZCgmcGMtPmZyZXFfbG9jayk7Cj4gwqAKPiBAQCAtOTMzLDggKzkzNCwxNCBAQCBzdGF0aWMgaW50
IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QKPiB4ZV9ndWNfcGMgKnBjKQo+IMKgwqDCoMKg
wqDCoMKgwqAgKiBTYW1lIHRoaW5nIGhhcHBlbnMgZm9yIFNlcnZlciBwbGF0Zm9ybXMgd2hlcmUg
bWluIGlzCj4gbGlzdGVkIGFzCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFJQTWF4Cj4gwqDCoMKgwqDC
oMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoGlmIChwY19nZXRfbWluX2ZyZXEocGMpID4gcGMt
PnJwMF9mcmVxKQo+ICvCoMKgwqDCoMKgwqDCoG1pbl9mcmVxID0gcGNfZ2V0X21pbl9mcmVxKHBj
KTsKPiArwqDCoMKgwqDCoMKgwqBpZiAobWluX2ZyZXEgPiBwYy0+cnAwX2ZyZXEpIHsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHBjX3NldF9taW5fZnJlcShwYywgcGMt
PnJwMF9mcmVxKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gb3V0Owo+
ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWluX2ZyZXEgPSBwYy0+cnAwX2Zy
ZXE7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gwqDCoMKg
wqDCoMKgwqDCoCAqIFNldHRpbmcgR1QgUlAgbWluIGZyZXF1ZW5jeSB0byAxLjJHSHogYnkgZGVm
YXVsdCBmb3IKPiBAQCAtOTQ3LDggKzk1NCw4IEBAIHN0YXRpYyBpbnQgcGNfYWRqdXN0X2ZyZXFf
Ym91bmRzKHN0cnVjdCB4ZV9ndWNfcGMKPiAqcGMpCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHdlIGFy
ZW4ndCBleHBlY3RpbmcgaGlnaCBwb3dlciBvdXRwdXQgYWNyb3NzIGJvYXJkCj4gwqDCoMKgwqDC
oMKgwqDCoCAqCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoGlmIChwY19u
ZWVkc19taW5fZnJlcV9jaGFuZ2UocGMpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXQgPSBwY19zZXRfbWluX2ZyZXEocGMsIG1heChCTUdfTUlOX0ZSRVEsCj4gcGNfZ2V0X21p
bl9mcmVxKHBjKSkpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChwY19uZWVkc19taW5fZnJlcV9jaGFu
Z2UocGMpICYmIG1pbl9mcmVxIDwgQk1HX01JTl9GUkVRKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXQgPSBwY19zZXRfbWluX2ZyZXEocGMsIEJNR19NSU5fRlJFUSk7Cj4gwqAK
PiDCoG91dDoKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKCg==
