Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5978C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 15:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9C10E3BF;
	Fri, 31 May 2024 15:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXvFsJJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732DB10E3BF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717170035; x=1748706035;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1EJgOTEV0XlQQ8e6k1TYSLOCFJobIBytVLSBHlCkZ3w=;
 b=VXvFsJJbmGmJ0GRAPGw9KFe4T4UIuzJLADOFfwek+Fzx229gDm84jLRU
 9buLTsq+FE0eInvFMMf1p92qew32P2h5f6/vk8xg+kQmDW3h7jmpJlC4E
 mRk229OxoZHEznKK4NcMjWEz9ZUiN/TZwpt8JFtQs6yAYw5YCnxqmV1Sg
 RZOqivU9dT/oJtcPnsYBLq/YRKrpeI8sjIYh+88BG7j9IbrLN/21aohDC
 x1860ZKeytVd/FavWLPwnUqXKISwSMS0PIuLaQ9Wo7oAe2kA7suJTuDOO
 cOnRQvfcPFBomXO2UvCZm4ZEwsRH0OsfXS8JdJnhEehuVl+vS32B0IRAa w==;
X-CSE-ConnectionGUID: Twe07rpdRWSq1efKb+GG9g==
X-CSE-MsgGUID: 8mQwwSA6Q+aVitiae6+yZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="24349326"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="24349326"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:40:16 -0700
X-CSE-ConnectionGUID: Wh1wIoXJQPu32Ef7mbOA7Q==
X-CSE-MsgGUID: beoTIB72To2Up+8ZlqoMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="73681527"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 08:40:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 08:40:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 08:40:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 08:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijOSufMqqyffjebYIE5gky1HQsXxDHlz8+N0hxBphGbZ2XktoSs+zcC6Hkvu729jxhBJE4OPVT9vW7lXTUkkBN6BM2eAEo5oLfvRXejoGxy0UzFwNMAGSxewLlM9S4M0aigwrOb+md5cTFoAJmPmDvM13jc7b+mec2eDV2WcUnoLg/5X0ku1m+8FriWVt77zzBCvMiYLSId/wgqRJ7udqZL1hb9U/fj2h6PbYeKLCelIk0Fpl9YAR6T86LhbALtgmJiA96yukYBErvNKUPRgNGsDJTj08WqCdY2zfz3phW0NXSB8XjoUm7IsGOUDVBkqg4+QDIyB4ijIvbIhKS7mTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EJgOTEV0XlQQ8e6k1TYSLOCFJobIBytVLSBHlCkZ3w=;
 b=ShxpKH2EGtge6EZFWFgjbSsnHIex4KuZdXpePhSEgNI5ove86Z+A1bKmqhekmHBhKGlgiJme0eN2fxMSJSOuSju7Q/OYXbWRyC9MCqi51lPN/7d4YjYyDeiEQE/LM/eQQZI0ih/s3s4zAmRwV4jKCrt4oSF0KMRDyeK9XWS1oPHooNZgZg1pHtYgkKxGxVCoxPJHQ3X8ez5Fpao3kbO60UqVmgAUja0NGyh+De94jCP8y7gGMuIBvOnIElT7ac0x0IOiSyU0XrPVauc6Qf8ovCr6X2yTEoWaNpU+N6vynZDv8U5ffUoL6W49MDNMvxHGNYL3q1ajhIbQEwmDQXesZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) by
 LV8PR11MB8723.namprd11.prod.outlook.com (2603:10b6:408:1f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Fri, 31 May
 2024 15:40:13 +0000
Received: from DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::389:52e7:d855:a6da]) by DS0PR11MB6424.namprd11.prod.outlook.com
 ([fe80::389:52e7:d855:a6da%4]) with mapi id 15.20.7611.025; Fri, 31 May 2024
 15:40:13 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 4/6] platform/x86/intel/pmt: Add quirk for BAR0 offset
 adjustment
Thread-Topic: [PATCH 4/6] platform/x86/intel/pmt: Add quirk for BAR0 offset
 adjustment
Thread-Index: AQHaox0VLOmpO1ZzRU+vAuK6B1J+gbGwYm2AgAEss7A=
Date: Fri, 31 May 2024 15:40:13 +0000
Message-ID: <DS0PR11MB64247F125AE7726A582408CFC1FC2@DS0PR11MB6424.namprd11.prod.outlook.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
 <20240510205948.904409-5-michael.j.ruhl@intel.com>
 <f6c0cabd8807e27e9d3751df302531dcd67fa1f7.camel@linux.intel.com>
In-Reply-To: <f6c0cabd8807e27e9d3751df302531dcd67fa1f7.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6424:EE_|LV8PR11MB8723:EE_
x-ms-office365-filtering-correlation-id: 24f581bd-d4ed-466f-e869-08dc8187f64e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?M1NZVlNndzlPV01tZnYwRWFXSFYrSVdZRDVzU0F0RmJpRGtvNEVpTnJ6RUxu?=
 =?utf-8?B?bmhwUzdNWHVFNTBPbW5yWTNMZW9MSGl3RjlaSXRuNjQzaWMwMVhuR3BRV2RG?=
 =?utf-8?B?d2dBbkYvY0tzcHFxeGQ0VDJvUGNqU0lRazljTm4wQmNXTURqYjFPS0Z0WFU0?=
 =?utf-8?B?R0IxYlZkM2ZLcXAzV2ttZk5NTWhKY0tlTFpQRjFMMmxHWktuaS9NMHVvWkx0?=
 =?utf-8?B?aTJHMk9pSGV2NWVjZ3ZBU3AwNGVaajBRK1hyQXRTRk5VVGwwRHl0OVpyU3ZO?=
 =?utf-8?B?NXhNT2M4Q0ViNmRzVDlQYm5FeTBJWnBTTXZUT1Rabmw2T3RnL3lIWjVHTU9P?=
 =?utf-8?B?dmZrbFMyTmE2dXl1cUVnVkdyaXBkeVVBVXlzQWhFMW0rNEhmQzJFUG5HRWxl?=
 =?utf-8?B?SmtaMHhQUGJJOWs4TlRIb2xSczI2TE1hQXFTeVUwM0ZKMUZuZmFnbnpDZWc3?=
 =?utf-8?B?dkVUWWNOYmZpMis0bG04YW1BZmhTZ2d1SVZOSmlKQnFQUWtrTEduYXJVeG1R?=
 =?utf-8?B?WU9tTFZrWndPSlRMRG5DQmJxRGt3R2o3ZC9rQUVvRVB1MUJ0M1VNcERZV0dY?=
 =?utf-8?B?N3NoRTdJSTVrMFV1ZXlxY3hEZFhLdWVSQy9xcmNQOGF6dCtPdjIxYmhlaVR5?=
 =?utf-8?B?RmViR0QyVGtSQzhtVGFvUWJzM1BGZnJmb0R3QTVCajEva2dSQm5tZ2tMREwv?=
 =?utf-8?B?NEFYSVdGZkNONHF5bzRSd2c3NDdQL1k0VUxjLzNUaWFEOWN0bnZ2TXFnUWZp?=
 =?utf-8?B?RXR4WGdmMEpxSlpMUVNhRFE4eFdBckNvVnZ4NWtFM1Q1cXRKdVMrcFJ0YmFF?=
 =?utf-8?B?Smx0Sms2UkJFQUY1WXlFdTJsWlh6Tm96SWo2RVJ3R1VPUjhEZ05KK1V5dWJU?=
 =?utf-8?B?a2d2RDU4elBMd01SWFl4UFYzU3RUK3FWRDJKbFEwalYzOWdobm5OcytaWnNS?=
 =?utf-8?B?SnNIZDFuSGo4VFd4akN1ak1aYnNoZGZFc2hsMjFKNVJtK2d4Q0NrelJIZVhI?=
 =?utf-8?B?ZkJmMWlUNUxKMGxEVlNPOFg0alFKTmtaRk9vNkNXblp3ZjFGdTdlZU5JZlpF?=
 =?utf-8?B?QjhCZTJGNlpCdzh1ODMvZ1JXK21CUzVlT0RET2RhbzhVcENtTHRTMk5lSjlr?=
 =?utf-8?B?RWFDL1NsQVBoWnh1MlpFdFd6WGticUw0NVBvWXBxYXZ1cU15L0RVN3JZVG9o?=
 =?utf-8?B?em5rby9MK0wwR0J0MzBqNVVUNWZpK3d5Q3ZqV1djMXE5UytXTllNdGJUcVRO?=
 =?utf-8?B?YnhhYk5zOG8rY3hJUkRva0swZGVwOHRtT2gzY05GYSt5R3RLbk1mdHNMZkIv?=
 =?utf-8?B?RFBoOURuQXkyWHd4djAwMytnOGcxdVFlRUl3WndpS3h1b09HaVRDZUtWNDBn?=
 =?utf-8?B?MWZFb3dBZFRBZmRlMjUyYlhMMnRiUGRiQVVSZVFkMkd0elp1NjA3amNpS1BH?=
 =?utf-8?B?SkF5K1R3dzBTTGErSWNCcHVnSFhRZlhZZEMzcVlwSkJyaEErd0ZMc29lZHJZ?=
 =?utf-8?B?QVkzdStOM1VJdGptYVFTS2I5cENENUJ2YVZ4eGJGV1g1Y2s0VjMrcVBwNith?=
 =?utf-8?B?WUFtaFpCRWZXRnpVbzlrdzN4bk9udHg5eEVMTFpCQzJXYi9uRmR6cko5QmlI?=
 =?utf-8?B?NzluVHZyU3hYM2VuY3FZc1FxZDRWbnlINTlBciszSkZuU01xb3Fub0FSUjhk?=
 =?utf-8?B?c05MRHJ0Z2JxQ3dwUXZDbldRNVUwQkdib1YrKzZZa09IOTdKdnhvUUkxb2R2?=
 =?utf-8?B?K1ZPSnJHS3AyTWdsVXR5SkY4c1k1anA0ZVR4WHNnNlRkNHA1Qm1PM1FNaGtk?=
 =?utf-8?B?MS96S0V2TlBRMGNCT2Ywdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnBNTnJBaGk0MFBDYzhIYysyd1dJNGRyTWp4U0hYZFdtVUhkTjB3QnB5UHp5?=
 =?utf-8?B?UFZDcHNvazBSdnUweHZrNzJldXdGUWt6c1YzVG1GZmx6YWl6cWxsUGpzKzh3?=
 =?utf-8?B?OUFBVUoyN1JtNGRaOUZEOFZGL25CVlh0WWw0VGVIQlNGWFhyakpnU0tRb205?=
 =?utf-8?B?WG1ZblVzclNLSGk0OVpwSDQzQkt4cUowWFlxRit6TVJCS0xVd1NVak80aWpW?=
 =?utf-8?B?VzlRd1NUeFVJTzVMcVU4UHhqdXZVeHdFbVlWZHRaV2phNVo1bzFmeldiTFl2?=
 =?utf-8?B?eEZWN2w5aWZBOWpYeDFDUWVUK2xqVjBzT1BGVlZTcVlTQTlvVnhEZGxmNnRJ?=
 =?utf-8?B?Q3RRQnFiQmNvRlFqVmpidXRzdVBGWGRPNGJreW1DKzhSeVptTUgvR0xoZ3dj?=
 =?utf-8?B?bFNBcHhRbloxUlhIM2JBU3JyRUJWVVpGSnE1eUpFS0dCMlJHZkxGdkF3WDZl?=
 =?utf-8?B?VUdNZWIrQVJnY29YVVRzVDRpQ0M0eUo3SFU3WlBwdVNPQVNpaUJodWJPYXNF?=
 =?utf-8?B?OGIwZ0ZKMEtpRkFRRndyR3NuL3ozSVg0aHpjbU1CcS9TTG0zL2tOSEFQZmI0?=
 =?utf-8?B?Sy9WODYwVVIrZndNZTRJV2s0K2d3aW5vRFdhb3pkY3dyUlEzZnM2d2EvSFFI?=
 =?utf-8?B?ek5ZVXJLOWJvNUN5T1BqV0x4S25USW9RajVmclBLNVZCQkFWSTExUktnZERw?=
 =?utf-8?B?c0lLVDgyOWN6UDFoSitWV2IrQmd4bzc4YkxIOWRrVEZuT09QQTR6SGNqNWxh?=
 =?utf-8?B?ckdLT3VsNDFHZUQ3SWFEWWxpdStycThiSHFoV0hwUVRDVXh5WitsZ3kvNjAw?=
 =?utf-8?B?RWtrQ0x2UWxHVXlBMmV0aDBtM1Y1cXhZYXp3eFRlQkRUTW0zblJ1Tm1aM2dU?=
 =?utf-8?B?MzdSWDZ4TmNoUlMvLzNQSnNTMXZXV0c3S1pKeXZOaDBwUzNFV2lKenA1VnBv?=
 =?utf-8?B?MkxzNzRFRk9UN2VmRFpnQVE3dWpRRFFJc3kzQTBtb0NwWTRuNVRvekQxREhU?=
 =?utf-8?B?eEV1eFd1SnRxMlJYTEp1dFZVT0ZxbHVPZHNqeVdkNldUVWZENzM1WWU4U3Rk?=
 =?utf-8?B?NFZsNGFYWU5HSWlGdHE4aDl5S1BOUFZvbXNvdGo2b1BJY3h4VTRDdXludlBH?=
 =?utf-8?B?RCtUOXVkbHdsZVNBMTJCb1o3TElkYWJjYWZBRU1BRkx0SzBib3hsYmpqcHVT?=
 =?utf-8?B?anVhWG9FWWJJTXlVU3B4dHpBTGNsNE5xYjcvRzBLdVNFNWo5dVFVOGt6ZXVF?=
 =?utf-8?B?VE5aV0pTQXFBV2U3SmRvVEFJdXp4V3lFMldIUzE5YjBvMWx4VDQzSmhtR0pV?=
 =?utf-8?B?ODdVL1lxRGNCSEF4QW5ERHpRZjRrZCtuK2diQmNiK0UzYlREYllNS2FPZG9t?=
 =?utf-8?B?WUdCWDYzZEZEUThjcG5DTHFndTlybUZucWpJRGtLLzFhU0hMYWFTQTBsV1Ix?=
 =?utf-8?B?Rk1WTWlYSmE0dGZsWUtFSnFmbXR1RnkzVlpmcTJSMjFPM0lDbHltNGpTVUVX?=
 =?utf-8?B?VS9FNXlLODVZcG9SeTE2S0RCNFFZc2syUmViUHBKYW9kNUo4bHlySUFKOXU5?=
 =?utf-8?B?eGthYzdTdTlqektsYXFVNEJPRTRhMzNKeG5RQmFRRlU2YUJPSW4vL0w4VlVW?=
 =?utf-8?B?ZmpZKzg4WlNZVXFueHBWeDdkVkZzTzFpNUF0WWpLS04zaGhocTJNcTZMSTRN?=
 =?utf-8?B?Tlp0dXVCZkNadEsyZFBoL05KajNsN0ZKZmUySHJjam81RzE3Njcwa2oybkIw?=
 =?utf-8?B?ajRXSlVlR3ZKcS9GZFR1dmFzcVl5QUVOYnNKWlJIOEVqc3JJUC8xTUI1U2oz?=
 =?utf-8?B?YVdDNy8ycVZhTGFFc09HaGxuK0FDb0tSeVJuRkMzeFBVSkpaNGJ3WENFaFBm?=
 =?utf-8?B?aHVuSHZ3Sk1GYU1wM3RlN2twVzZ2KzE4eEdNTlBjT20xZ3BwSkFCNmVkSmkz?=
 =?utf-8?B?N3VKSDR5NmlnYTQ4MU1HVTZTcitwdnNsVENDWmtLTzJ0QnA2TElUQ3FRV2li?=
 =?utf-8?B?M3JRS3NEQUdmWHozWFFubzZBTllIT2g4Ump1aFFnVW1XR1c4NldmWldublRs?=
 =?utf-8?B?c2duWkhJQStJQTAxRU45MUdFaW55dWJBTUxjbS96K1VQMUdpVUE4c21SZjFT?=
 =?utf-8?Q?Kz4HTco5V6QX1XuRBZQ+iwvpP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f581bd-d4ed-466f-e869-08dc8187f64e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 15:40:13.2479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFIen2OMs06tJtIqjjFrZ3ht+GZkBrjEeKCq3oK9zIJt+kXgr0XWuYLBUzcXmYXKUPMDXyEy1liraKkPWxC17q/BpjDIzFjWvUHDUrYHM7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8723
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogRGF2aWQgRS4gQm94IDxkYXZpZC5l
LmJveEBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogVGh1cnNkYXksIE1heSAzMCwgMjAyNCA1OjAw
IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCA0LzZdIHBs
YXRmb3JtL3g4Ni9pbnRlbC9wbXQ6IEFkZCBxdWlyayBmb3IgQkFSMCBvZmZzZXQNCj5hZGp1c3Rt
ZW50DQo+DQo+T24gRnJpLCAyMDI0LTA1LTEwIGF0IDE2OjU5IC0wNDAwLCBNaWNoYWVsIEouIFJ1
aGwgd3JvdGU6DQo+PiBUaGUgb2Zmc2V0IGZvciB0aGUgZGlzY292ZXJ5IHRhYmxlIGlzIGJhc2Vk
IG9uIHRoZSBQMlNCIGJhci4NCj4+IElmIHRoaXMgYmFyIGlzIG5vdCBhdmFpbGFibGUsIHRoZSBw
YXJlbnQgZHJpdmVyIG1heSBuZWVkIHRvDQo+PiBhZGp1c3QgdGhlIG9mZnNldCwNCj4+DQo+PiBB
ZGQgYSBxdWlyayB0byBhbGxvdyBmb3IgdGhpcyBhZGp1c3RtZW50Lg0KPg0KPkknbSBub3QgYSBm
YW4gb2YgdXNpbmcgYmFzZV9hZGRyIGluIHRoaXMgd2FzIHRvIGFkanVzdCB0aGUgb2Zmc2V0LiBU
aGVyZSB3YXMgYQ0KPnZlcnNpb24gdGhhdCBwcm92aWRlZCBhIHNlcGFyYXRlIGJhc2VfYWRqdXN0
IGZpZWxkIHRvIGFkanVzdCB0aGUgb2Zmc2V0LiBJcyB0aGlzDQo+Y2hhbmdlIG9ubHkgbmVlZGVk
IGZvciBERzI/DQoNClllcy4gICBUaGlzIGNoYW5nZSBpcyBuZWVkZWQgZm9yIERHMiBzdXBwb3J0
LiAgTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IERHMiBzdXBwb3J0DQppcyBkZXNpcmVkLg0KDQpI
b3cgY2FuIHdlIGdldCB0aGUgYmFzZV9hZGp1c3QgY29kZSBpbmNsdWRlZD8gIFNoYWxsIEkgdXBk
YXRlIG15IHBhdGNoIHdpdGggdGhpcyBjaGFuZ2U/DQoNClVtbSwNCg0KV291bGQgaXQgbWFrZSBz
ZW5zZSB0byBkbyBwYXRjaCA2IGZpcnN0IChCTUcgc3VwcG9ydCkgYW5kIHRoZW4gYmFja2ZpbGwg
d2l0aCB0aGUgREcyIHBhdGNoZXM/DQoNClRoYW5rcyENCg0KTWlrZQ0KDQo+RGF2aWQNCj4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj4+IC0tLQ0KPj4gwqBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvY2xhc3Mu
Y8KgwqDCoMKgIHwgMyArKysNCj4+IMKgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L3Rl
bGVtZXRyeS5jIHwgMiArLQ0KPj4gwqBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC92c2VjLmPC
oMKgwqDCoMKgwqDCoMKgwqAgfCAyICstDQo+PiDCoGluY2x1ZGUvbGludXgvaW50ZWxfdnNlYy5o
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICsrKw0KPj4gwqA0IGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmMNCj4+IGIvZHJpdmVycy9w
bGF0Zm9ybS94ODYvaW50ZWwvcG10L2NsYXNzLmMNCj4+IGluZGV4IDYyZTM2ZGQ4OTEzNy4uOTU3
Y2Y3NDIzNGRhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10
L2NsYXNzLmMNCj4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtdC9jbGFzcy5j
DQo+PiBAQCAtMzQ5LDYgKzM0OSw5IEBAIGludCBpbnRlbF9wbXRfZGV2X2NyZWF0ZShzdHJ1Y3Qg
aW50ZWxfcG10X2VudHJ5DQo+KmVudHJ5LA0KPj4gc3RydWN0IGludGVsX3BtdF9uYW1lc3BhDQo+
PiDCoAlpZiAoSVNfRVJSKGVudHJ5LT5kaXNjX3RhYmxlKSkNCj4+IMKgCQlyZXR1cm4gUFRSX0VS
UihlbnRyeS0+ZGlzY190YWJsZSk7DQo+Pg0KPj4gKwlpZiAoaW50ZWxfdnNlY19kZXYtPnF1aXJr
cyAmIFZTRUNfUVVJUktfUDJTQl9PRkZTRVQpDQo+PiArCQllbnRyeS0+YmFzZV9hZGRyID0gaW50
ZWxfdnNlY19kZXYtPmJhc2VfYWRkcjsNCj4+ICsNCj4+IMKgCXJldCA9IG5zLT5wbXRfaGVhZGVy
X2RlY29kZShlbnRyeSwgZGV2KTsNCj4+IMKgCWlmIChyZXQpDQo+PiDCoAkJcmV0dXJuIHJldDsN
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbXQvdGVsZW1ldHJ5
LmMNCj4+IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvcG10L3RlbGVtZXRyeS5jDQo+PiBp
bmRleCBjOWZlYWM4NTllNTcuLjdiZTlmOTc0NjM2MyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
cGxhdGZvcm0veDg2L2ludGVsL3BtdC90ZWxlbWV0cnkuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvaW50ZWwvcG10L3RlbGVtZXRyeS5jDQo+PiBAQCAtNzcsNyArNzcsNyBAQCBzdGF0
aWMgaW50IHBtdF90ZWxlbV9oZWFkZXJfZGVjb2RlKHN0cnVjdA0KPmludGVsX3BtdF9lbnRyeQ0K
Pj4gKmVudHJ5LA0KPj4NCj4+IMKgCWhlYWRlci0+YWNjZXNzX3R5cGUgPSBURUxFTV9BQ0NFU1Mo
cmVhZGwoZGlzY190YWJsZSkpOw0KPj4gwqAJaGVhZGVyLT5ndWlkID0gcmVhZGwoZGlzY190YWJs
ZSArIFRFTEVNX0dVSURfT0ZGU0VUKTsNCj4+IC0JaGVhZGVyLT5iYXNlX29mZnNldCA9IHJlYWRs
KGRpc2NfdGFibGUgKyBURUxFTV9CQVNFX09GRlNFVCk7DQo+PiArCWhlYWRlci0+YmFzZV9vZmZz
ZXQgPSByZWFkbChkaXNjX3RhYmxlICsgVEVMRU1fQkFTRV9PRkZTRVQpICsNCj5lbnRyeS0NCj4+
ID5iYXNlX2FkZHI7DQo+Pg0KPj4gwqAJLyogU2l6ZSBpcyBtZWFzdXJlZCBpbiBEV09SRFMsIGJ1
dCBhY2Nlc3NvciByZXR1cm5zIGJ5dGVzICovDQo+PiDCoAloZWFkZXItPnNpemUgPSBURUxFTV9T
SVpFKHJlYWRsKGRpc2NfdGFibGUpKTsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9pbnRlbC92c2VjLmMNCj4+IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvdnNlYy5j
DQo+PiBpbmRleCA1Mzc4ZGE5MzU0YjYuLjVhMGRmYzIxZWIwZiAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3ZzZWMuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWwvdnNlYy5jDQo+PiBAQCAtMTg1LDcgKzE4NSw3IEBAIHN0YXRpYyBpbnQgaW50
ZWxfdnNlY19hZGRfZGV2KHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPnN0cnVjdA0KPj4gaW50ZWxf
dnNlY19oZWFkZXIgKmhlDQo+PiDCoAlpZiAocXVpcmtzICYgVlNFQ19RVUlSS19UQUJMRV9TSElG
VCkNCj4+IMKgCQloZWFkZXItPm9mZnNldCA+Pj0gVEFCTEVfT0ZGU0VUX1NISUZUOw0KPj4NCj4+
IC0JaWYgKGluZm8tPmJhc2VfYWRkcikNCj4+ICsJaWYgKCEocXVpcmtzICYgVlNFQ19RVUlSS19Q
MlNCX09GRlNFVCkgJiYgaW5mby0+YmFzZV9hZGRyKQ0KPj4gwqAJCWJhc2VfYWRkciA9IGluZm8t
PmJhc2VfYWRkcjsNCj4+IMKgCWVsc2UNCj4+IMKgCQliYXNlX2FkZHIgPSBwZGV2LT5yZXNvdXJj
ZVtoZWFkZXItPnRiaXJdLnN0YXJ0Ow0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW50
ZWxfdnNlYy5oIGIvaW5jbHVkZS9saW51eC9pbnRlbF92c2VjLmgNCj4+IGluZGV4IDA0ZjkxNWEx
YmEwYi4uNjhlM2E0MjA0MGU4IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9saW51eC9pbnRlbF92
c2VjLmgNCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvaW50ZWxfdnNlYy5oDQo+PiBAQCAtNjUsNiAr
NjUsOSBAQCBlbnVtIGludGVsX3ZzZWNfcXVpcmtzIHsNCj4+DQo+PiDCoAkvKiBQbGF0Zm9ybXMg
cmVxdWlyaW5nIHF1aXJrIGluIHRoZSBhdXhpbGlhcnkgZHJpdmVyICovDQo+PiDCoAlWU0VDX1FV
SVJLX0VBUkxZX0hXwqDCoMKgwqAgPSBCSVQoNCksDQo+PiArDQo+PiArCS8qIEJyb2tlbiBQMlNC
IGFjY2VzcyB3b3JrIGFyb3VuZCAqLw0KPj4gKwlWU0VDX1FVSVJLX1AyU0JfT0ZGU0VUwqAgPSBC
SVQoNSksDQo+PiDCoH07DQo+Pg0KPj4gwqBzdHJ1Y3QgcG10X2NhbGxiYWNrcyB7DQoNCg==
