Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754DAC4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 12:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EAF10F021;
	Wed,  1 May 2024 12:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgE1IuiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169AD10F021
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714567080; x=1746103080;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1mS/NbGmKNIZlG5VJibrQ/jDBuOSstvzYzzZJ5k+0Bs=;
 b=cgE1IuiVAOftVNodUBplkuRS1R932NyZUn8Qbnf9djOxHdt9/2djIvi8
 VYtyn3+4kIQ3KfjiZahQmkNN7JKQ23mqVUJ4V5tjHKzQ6KflWbKhey03P
 YG4G9fHBWbuQU/9CtL4L+kpOIP4/mUMSFwSLRT+ulN0bYfq9qN0PVnpYw
 wpFd8ZK76jU49CxwHUsLETPzpzlBbkzrT2ED5E67Gy3QELUeNo53GxFKg
 5WS1V8dds6LKwWcX68E9/LuBGm5jA7wCW/bv1mR8tdG968aRxsiq1/4IM
 NrSQZTc++dj17ZJuUMsjjIDoe53h9zwb8pSnSUbE9kW6tyii8qIjUTym5 Q==;
X-CSE-ConnectionGUID: JcKqNj0DT8Knd6PMELGIZg==
X-CSE-MsgGUID: OGrtnmnCRzq1AzByASjFAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10121482"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10121482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 05:37:59 -0700
X-CSE-ConnectionGUID: yl+frjQEQGC6fhHpkkZtzw==
X-CSE-MsgGUID: AzJpAaFBRpi0QQQ73wen5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26730323"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 05:37:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 05:37:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 05:37:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 05:37:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fm12H/nOxwioLAozfPX3WmCa/Fw1H3Gq3jJyPNUcZLSWAi4sbYRcoSUHmZw9EhvjFSf+ht92XkXSAvf1kst7b64los3WVpg8UCni+evnr7TmL3y16ePADKwgw4GerWi0564AXW1VMny7wVQ7KwPEI+0djPLGIIb/2cfM0VBPKCpBlXC9MxwL5btFsfg+x1ukSKjRHGTLHfrGMCy3lIQUlEkPuv/Zr5LyY2wAhJoHBiuBSJu68Heh9jCVZQKM0eyCwc7WuLnRFPpmXYTyFxEY/dLJGWSbyFsbtRbwgtU96Fup+fON4bpvlAeu1K28GbDPefwyp8TP79eGxbR/jUCr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mS/NbGmKNIZlG5VJibrQ/jDBuOSstvzYzzZJ5k+0Bs=;
 b=H5AXpn45RyvDQDy1X5Ih5ljws5aaDw3iCqdQ42Rxc/7lq6DiFMbAYY4mjNDHBO+N/PPeksQ6TH4R0dMKS/xuJ804f24Coh0o3IB3OH7Jf/TFu1r1j+67uyzKhn6tTC12WD8rduhiohwYE07lpwFapTOV15ppwMBPSJBo5DFVdeDVw2Gh2w1UIVjGuXMkCtmyWzHF7wGmpf5S3UK4l/qFhi1lEo9KutxnyKw+JvTAnyfXgEi1EqGQ9V1dEKEA4tJ+xpFmT85X5fWanKGb1xbuBZywV52BQcBuP8nRuTAs6WLzfxbYYQ3cYFGG81+xpghse6U4dFy17pLWBT4khJowpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Wed, 1 May
 2024 12:37:56 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5afc:274:3b02:f45]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5afc:274:3b02:f45%4]) with mapi id 15.20.7544.029; Wed, 1 May 2024
 12:37:56 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH 2/2] drm/xe/stolen: ignore first page for FBC
Thread-Topic: [PATCH 2/2] drm/xe/stolen: ignore first page for FBC
Thread-Index: AQHajOqnoycFYHkYxkupAHMUDFRMCLGCbs/Q
Date: Wed, 1 May 2024 12:37:56 +0000
Message-ID: <DM8PR11MB56558EE296742E462C1BA72AE0192@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20240412150301.273344-3-matthew.auld@intel.com>
 <20240412150301.273344-4-matthew.auld@intel.com>
In-Reply-To: <20240412150301.273344-4-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SJ0PR11MB5070:EE_
x-ms-office365-filtering-correlation-id: 24f33fbf-c9f8-4e19-924a-08dc69db8726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?aTIxWGFHUmdUdlFaZ2llc3ZEejN6bm1POFVNZ1ltUTZ5NllVYjJuVExtS2dy?=
 =?utf-8?B?M2NtR2pIQ0FBWEFmb0MwcUluZ2tDemRFc3lwWHRZMXAyOGdyb2xXRllxekdB?=
 =?utf-8?B?SVlJbUpHc2hFZStNNjZhRnczdzIwWDVWOHQxVXZaT0RrZUxqR3RQTWllSUhD?=
 =?utf-8?B?U3Q1VG9ETWt6bUtHL1lWMnMxblI2QnQrNGQrMDMzaHhPdFJUVHI1NEdpS25P?=
 =?utf-8?B?WkhEL2FEb1ltQ2VKUjRiaVpUWDREY1RKR2Nna2JHNXJmNG9MRlROQjdBTVNu?=
 =?utf-8?B?L0hPQnhKYXR0WWRudmh0MTZxTW41OFJMMGRuVVRmWEtIVzI4ZTRhVFB4dVJx?=
 =?utf-8?B?WWM1eWpDQU5nb0lucW0vNWZtZitZbkhiKzdkeFArSkJHRUdLZHlJMWpLYkxV?=
 =?utf-8?B?RmRyN3hmZXNhVjUvTzFYM3ZURm4ydDZHcDlvaVVkVk5vdjJpMS85VzJDMVZL?=
 =?utf-8?B?S1p5WldKUjJLVjA3eUFMMmNlejh6dTZNTGVPRzZUaWpTdlVXYnJGb0duTGlP?=
 =?utf-8?B?SVRCRnkrUGM2MDd1RU9OQjVaYVJnNU5VbVo4OEwveXVVNHlMYm0zQlZEK1Ru?=
 =?utf-8?B?Zy9KaHhLNkE3UVZBV0ViV3JJRVNSQWJ3eVFtWjZsM044dWJWaEhNbEdldmJj?=
 =?utf-8?B?SVlXcHc0eWJwRVIra2FSc2Rmb1RSUnFEbUJVM3JMcGRLTkdUSVMzOG9oQkxI?=
 =?utf-8?B?VXBBbHBTcG5wbFB6dDNSdWhZaVJMQzZ6TzZMMHZBVnFMSE5nZDQrYVRZTHAw?=
 =?utf-8?B?UFFKOFd4NXpLSHlDYzJCYTU0MU1JOG5XUDYzYU5GcVhXZUlTTWlqWWM2NXJB?=
 =?utf-8?B?TUhPSk1Dek82amJQYTBsRTRCNHF3NFh4ZDhzVzZ6aVBFT2Fienh0bVJNVTEv?=
 =?utf-8?B?TE5LbnlDVk5QRXdMcDJscWE0ZkVxQTlOcVloU3l3M1FZdkxkb0RoZzZPTmVW?=
 =?utf-8?B?QzJFc09tajNGay9JZ0tHcGdIT2M2VVVUcTh4RTFrWkZaTTA1enhqTnJ6Y3dN?=
 =?utf-8?B?d3NYRXN4Y0ZKeTNucnJaYXZZZ1VyODk2ejVoeEl1ZmhUNEpacDNHSU1FRnR2?=
 =?utf-8?B?MEQ2N1E4OStZVEg4Unh4K0FCUldSRExZZk1qcHRRYjlPVE9nMnZKWi81NjVF?=
 =?utf-8?B?VStSWFVUSldqdlZYeThlTG9UdzRmbng3TTdGZ3c1bUdwcTYzRWFZQTFrRitx?=
 =?utf-8?B?aTc1a1hvSFkwMGQrdjFFQWxuQ3FBZW0xZDNZcm5XOGJ5M1pIUFZtaVhOTnI1?=
 =?utf-8?B?RnJFOHpvY1cxZXZyUWNGWWQ1SVFrRzhselg3QXgyaFNKT2Z6MFZhSE4veGRp?=
 =?utf-8?B?bWF1ZDNKdytGeC90N21Hemp1R3pRNGtLL2VIcklqM1k2TzI1N1ZqSEFzSE1F?=
 =?utf-8?B?K29lY3RleURSOXo4UjVNakJmY3FyTE9rRTNKZjNLV2g5cW0xUXJzeG1mQTBn?=
 =?utf-8?B?aVhnWHUyaHpqMkhBRXFiNXdUVStoNW5PWCtQMUdZbk8vbkV3eUJxSWhvWW1D?=
 =?utf-8?B?YzJBcXRuK2tEKzNXZ3AzdUg5NUxhK0V0ZDdaOHFlb0p4SVRJanpvV0phMGpS?=
 =?utf-8?B?ajNLY3grVjMwRGRYcEpxRnlqWWZXeUc0L0RSeXpPREZKaFJLekF4L3A3SmNU?=
 =?utf-8?B?MFNkaUJjamZscXkyZE90Sk1OMFVlbjBxMFl5ZWZXcVBmQ0Mwb2twK0J6L3kx?=
 =?utf-8?B?L2ppY1pYVzFFSWtDV1FHUjErcUNDS29IUEN0NlpONk1tQ3hiL0Fwd3F3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkZFQU1sQ2NrRnpqWVc2SWhKcVJEdlVoT3V3ZGMrUU1tYTByN2ZyNFZzOUd1?=
 =?utf-8?B?ZGV4K2lqUGdZRkhFay9RMi9Sb2JYV2tkejBjQ002bzVxNXJxYTczUTNPNG9o?=
 =?utf-8?B?SnBXUStuVlU4cXdLUnN6T0V3a1pucWNBMmQrVTBqdGkyYzJ0Q0duMnp0bHJs?=
 =?utf-8?B?SWxQMHBhaEdMZEcyZTVyMDRjakt6QWxpNk56SzF1WDVJTTdjN0hGSnQ0dXdM?=
 =?utf-8?B?a1oranQwMks2M2lYc3FsVVV5SlNtUVVBYjNGNVVTTnc1SnhXd2gvYm5VcDZ3?=
 =?utf-8?B?SCtteEZZQjVwazU1eHZxd2JubnFTb2xkYXliWEZ6eU5sNng5bFBCZnhTOGJS?=
 =?utf-8?B?WU9mOFBIL0NTUWJodldueFdpSzk2MFpCZU4veG9yck5EaXFrandlR2NCemVR?=
 =?utf-8?B?VXdYRUVZTGNTSHN5Q002UVNxVE96UFc4NzJnNnlSaHlZZktFT0RzSmxzTis4?=
 =?utf-8?B?TWZJaithK2JqSzIrUzYyOHRxT2RuVEJ4NDBLc254K0Fsb2xueG9rQXdaWkt3?=
 =?utf-8?B?K1h5OHByajB1K1JLRnEvODJXaHBxT3p6YUI4eU40OUVvNjd6RXIwQVFURWxy?=
 =?utf-8?B?TUltTDZ0a1VERDJRSXdSTEZKeCt0eFpzWGdxeXdOTVJJNWw1ckZHdHhXTys1?=
 =?utf-8?B?RElJcXF0am93YzlTYmJBSmZUc1dPRGp4cEdiVFNUTnRhdXN2Zm14TjllZXRj?=
 =?utf-8?B?bXZpUGsvVE8vUTdLMmhXdDF4OW9mcUl6ZDVqaXhPNDV6SGFlU1ZhSmVSR3Ra?=
 =?utf-8?B?Y3d5Znlsd29CMW81Ly9nYVB4WHh0aGtSL0VybTdmaG9iTEhaVmFra0lIYmlR?=
 =?utf-8?B?eDQ1MXRtcVdrYWpUSDBxaC9uaUIyV0FBc3hYOTA2THJyY1AyNC9CdEZhZEtB?=
 =?utf-8?B?SjhPYThHM1diMml6bTd5U2xsdGJ1eHVWcktkeEVWakFqVUxCM1pHeGZmWFJO?=
 =?utf-8?B?cWhOV0tIZDNqZk5KOHYveitzYmlSdDZRSnRGaVZRbittVjJJUzBrMGZTV0hj?=
 =?utf-8?B?MmF4ZUlUaStFR3JoU2N6V0l0RXF0WlYzTno0Q2UwTm5wd1BWTjVmT0pKeGx0?=
 =?utf-8?B?QjMrdlp2aFNNNmFkQzVickxjN21ickNIT2pBaE10NlQwalV2ODlxenY4SDlR?=
 =?utf-8?B?M2xWYzN2ekFFOEVSYWhOMXFtOEYyTHpoSVpQSlM2cjNjaU45QlR1aTJDL01o?=
 =?utf-8?B?enRRaThxKy9yTHg1YzM0RnJDS0FwTUlhditDQXZ0aDJjTHNzckhScEQ2RnVw?=
 =?utf-8?B?UVdQL0xCVXN0djNMZ3ovY29wdktZYzJILzI3S2RXRThLTmgzcGQ5eitrUjFF?=
 =?utf-8?B?NmdPZ21vekEzZzBhcWJNdHEweFYwTVhpOFhuZjlINWp5b29MQzNmWStkLysy?=
 =?utf-8?B?RE1YbW9CRmlOQXNCRXBPdWpDOCt3ZGpVd2hDdzdnTytsM0FvVUR3clEvbVFK?=
 =?utf-8?B?OGtoZU1QNG9OYy9zcmF5elZnQWdvMUlkcWViTGwxcG9UZGhISlVBUlpGZ05M?=
 =?utf-8?B?b2dRc2RhdjNuZkRyR2lvRVo0dktWNE9yK1dTOTdnTUFkY2ZDcGVyN2VZTmhS?=
 =?utf-8?B?amhHdWlqbTJUeXZUWFVmN29IQkRhNVRYeUNKUTlFSzdvMUZOVTZhbVpIcFhp?=
 =?utf-8?B?RE15bUZpSVUwdkovTGRCUWN1aWNHSHRiRUJTbklpYnNOQXhXblFRZFVoMHkw?=
 =?utf-8?B?TnRGdlF2d3gvT1ByRS9JNngwS0FnQzNGYkswOGp5b1FqdFE1WHpteDFmN0tB?=
 =?utf-8?B?ODUxUWIramJXbkZ0MlNGb1puMW5mVnluM0lkVElUcnYwWmNMTjJRRCtjaTc3?=
 =?utf-8?B?WkNWWENBMmdoQTNrQ002L29CZXdrUjJHNWlXUkdQRmpQVFVna083eUUvc2hm?=
 =?utf-8?B?ZW5GOEU5T0ZackRwK2dyZm1XUFN6dHYwemlGd0dYSW1pVUNjV1JMQ2tjcjcx?=
 =?utf-8?B?WHM1TzQ0ejYzNDZyQ2ZNSEZwRW9aTGlvZ3RhUHVzMEhaTEkyYlNtWStsRjJ0?=
 =?utf-8?B?YnU4L0tkZ3dhcVB2bm1JSW1IVnRCM0VuQnNuWHRNczdmT0thQ3BYM1dFdkdX?=
 =?utf-8?B?dnc2YStHaDZqZExSMnMrS2tHeVJCaHNvRHd4Tlo4eldzV2hGTlg5cnNqZXZH?=
 =?utf-8?Q?HYl2fqPrDsPN5vLZzDH/31Kv/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f33fbf-c9f8-4e19-924a-08dc69db8726
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 12:37:56.5514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y77GaiMFu0ZKcaI+xJyQqTcbgTSMNaYIV4JdFKz5ucD2A4qPUza1YmV/TGl3P5LkBYPOO/7aG1CDHjEOl9DR8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50
ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBNYXR0
aGV3IEF1bGQNCj4gU2VudDogRnJpZGF5LCAxMiBBcHJpbCAyMDI0IDE4LjAzDQo+IFRvOiBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0veGUvc3Rv
bGVuOiBpZ25vcmUgZmlyc3QgcGFnZSBmb3IgRkJDDQo+IA0KPiBXZSBoYXZlIG9ic2VydmVkIHVu
ZGVycnVucyBvbiBzb21lIHBsYXRmb3JtcyBpZiB0aGUgQ0ZCIG9mZnNldCBpcyB3aXRoaW4gdGhl
DQo+IGZpcnN0IHBhZ2Ugb2Ygc3RvbGVuLiBKdXN0IGxpa2UgaTkxNSBza2lwIHRoZSBmaXJzdCBw
YWdlLg0KDQpUaGlzIGNhdXNlZCByZWdyZXNzaW9uIHdoZXJlIGRnMiBzdGFydGVkIHNraXBwaW5n
OiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy8x
NjY1IA0KDQo+IA0KPiB2MiAoTWFhcnRlbikNCj4gICAtIEFsc28gYWxpZ24gdGhlIHN0YXJ0Lg0K
PiANCj4gQlNwZWM6IDUwMjE0DQo+IFJlcG9ydGVkLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQu
cm9wZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcu
YXVsZEBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZ2VtX3N0b2xlbi5oIHwgNyArKysrKystDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9nZW1f
c3RvbGVuLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1
X2dlbV9zdG9sZW4uaA0KPiBpbmRleCBiNGNjYzQyMzFlN2QuLmNiNmM3NTk4ODI0YiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9nZW1f
c3RvbGVuLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMv
aTkxNV9nZW1fc3RvbGVuLmgNCj4gQEAgLTE5LDggKzE5LDEzIEBAIHN0YXRpYyBpbmxpbmUgaW50
DQo+IGk5MTVfZ2VtX3N0b2xlbl9pbnNlcnRfbm9kZV9pbl9yYW5nZShzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwNCj4gIAlpbnQgZXJyOw0KPiAgCXUzMiBmbGFncyA9IFhFX0JPX0ZMQUdfUElOTkVEIHwg
WEVfQk9fRkxBR19TVE9MRU47DQo+IA0KPiAtCWlmIChhbGlnbikNCj4gKwlpZiAoc3RhcnQgPCBT
Wl80SykNCj4gKwkJc3RhcnQgPSBTWl80SzsNCj4gKw0KPiArCWlmIChhbGlnbikgew0KPiAgCQlz
aXplID0gQUxJR04oc2l6ZSwgYWxpZ24pOw0KPiArCQlzdGFydCA9IEFMSUdOKHN0YXJ0LCBhbGln
bik7DQo+ICsJfQ0KPiANCj4gIAlibyA9IHhlX2JvX2NyZWF0ZV9sb2NrZWRfcmFuZ2UoeGUsIHhl
X2RldmljZV9nZXRfcm9vdF90aWxlKHhlKSwNCj4gIAkJCQkgICAgICAgTlVMTCwgc2l6ZSwgc3Rh
cnQsIGVuZCwNCj4gLS0NCj4gMi40NC4wDQoNCg==
