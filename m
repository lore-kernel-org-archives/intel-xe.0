Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF8AF43821
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 14:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2B610E248;
	Wed, 15 Apr 2026 14:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrv0Cmxp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6941C10E0E2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776263122; x=1807799122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3eCDIMKweToll7LLC6lVDWMZFPa6P3Stj1bXWOcLvBg=;
 b=nrv0CmxpwxCt+ErIZiUtei13CSIUAw4hP/LNekYJ4VMos4gmwe0FlQd3
 SMo13F4y703iRT9Ha5VeNt9F4BgO/wVIwT/0o6gOaBGVKNOUpcTNE529R
 eYuwkofm7cJ5AEGsTsECDwdUDghsIp/P0SNzQfuQYKq3f1i+VgGSXwEL6
 e7Zm979N3v3fqatTlDKIlucKzrqYbm6kVCmJ7cIfrlKjq2ZLh61OKKROf
 FyDjQbnXjRyXcy9OoVET7w+CwwOUFm8FGsAuTgJT5APKC7mdpcAIODM0B
 j/R6qrpaUQ3uGNfr3RxABnNC8EChgwT8TNqxnuKEQib+FXkTawa7I1Ckt A==;
X-CSE-ConnectionGUID: oDGYDDXtSReeVjgfLB8A5w==
X-CSE-MsgGUID: 7fqJS6ElSFeZwRZvupY9sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88691696"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88691696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 07:24:18 -0700
X-CSE-ConnectionGUID: ntVbXdG4QsyO3NhFvobs9Q==
X-CSE-MsgGUID: m16FXXn/R1qS+7+wxoS7lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230285463"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 07:24:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 07:24:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 07:24:17 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 07:24:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZekKDVom7Pk+q2qKaF/Kpul/mVeR8pw22/o1ilKeDmA6TeL8dSIoLDIqlHHNIXN24FvzeZzjrl8TZtmRcVPTSZAxglvpOBHYwqlu+4HueXV6AxIKKXiyxMhIBCuxLmMq44+rmQASB7NoihmgX8IcPcXfRf3YdMMjvYyHxHXRrzuTm7fD5dbotPlrE4RsqnxDB31B8TY8GqhcN/E4VW9ioKEivCNPeRqqo8Vm7ZlVEd7i66Lo80Cm+3gDxqTZY9yXMYn74R2D5F+HdqeiW12j+1QdUWer6ExvBJhsj0yOGgn52K3msPUIE25e9kAHSAEJnDEnMNonuV6Ai2EpPnW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eCDIMKweToll7LLC6lVDWMZFPa6P3Stj1bXWOcLvBg=;
 b=HMFeH4vtbgBOIl/RFa362HZMivik5/2Snyl/CykXiz2N8IzjF7Fe7tolkZSWPrevZznpLTqaGVc4hH1UQs5XN7SF3CNhknXQ9N8oBxZwmzCWb+Xkn9rRrNNhymYPu9NVGPPWO0Vv26Y+vSCxNtMSqnwp01u5ny8WrERQtr2xyKgDxhZ038P/A2Q/TGYNUxfO0eJZx7bTOt8EBhym71EcHcl0ofXvyW1DK9UFPSQu2R6n7RZaK86YyD4CtOuuOKcWgPbSHJGXwZi6Dv3JRz3bm2fBqpztGwk7KpSPJpBfvzcYKLlhhMH9Jd5TjJx9X5wO39/SCFcKpnoEbIG/PelTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB9876.namprd11.prod.outlook.com (2603:10b6:806:4d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 14:24:15 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 14:24:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/pf: Streamline fair scheduling error reporting
Thread-Topic: [PATCH] drm/xe/pf: Streamline fair scheduling error reporting
Thread-Index: AQHczFqv28CvvpD+rEG99na26NFsirXf6e6AgABEC3A=
Date: Wed, 15 Apr 2026 14:24:14 +0000
Message-ID: <CH0PR11MB5444B205CA037CC48F96F400E5222@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260414220409.119614-2-jonathan.cavitt@intel.com>
 <66230450-64f5-440a-bc5e-f09a449733df@intel.com>
In-Reply-To: <66230450-64f5-440a-bc5e-f09a449733df@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB9876:EE_
x-ms-office365-filtering-correlation-id: 9ecd3954-1d12-4f80-95e2-08de9afaabde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: FET4YLGC/OkmpFiKS1H27FmXxAl1J0KxIRh6usjDLUwZ4purzrNQK3IbExC76dYsVm9Xy4gHRU1AeIP/fT7MmDWjA+rTKp6q2kHk2jSRuWJUcX9TLkSI8XoyOC+MKzA1eKJXFDQZPdypjFcEI3tyQKHEO1ALfV54wGmakWGbu99gagmq6uVC2MhQ/dOQqedT0zetxQss6UX/tvZ/wb67rR/rfn8og0kPvpTkZeT6hA+IR2TvE8n9WxJTcAT+mncEfUsEQqcC0q3xcuNRPRdlnfOJnpAjtItfWljCIlvxXABU/JRaHdic4rfNoFtaBQb+jhV5udxfDmi5vllRI+diuECEyVb1j/a5Zy8OiGb2/82J2nXO/ozsWWyTiCvkm6jczA3MNpIvvkOvDnS7rj5S3FWa6oREGgtXx2qU0RBur+vvQdHsPp1Nec8T0AqE2pINGdby7lFvKNC7ZSvUc0rSLl//AGysVbnXEKoveGTGNaZsPD1uTd/+MUJEJ8jaTX+ZfyBp9fmXvPvmXZvxf9N/k1ehupOZaIbb3BZOH9U/cRqPIyOT70JNK2E9uOie9aHwYLfpG9hzI4on87LVOKxkFZKVmSAWSkeZzqTbqAxAta0/w7hy68L9ookTgLlMFiQk4EzPQ/9+xR8KAICaLrV2PxioQxIbvfxZWq/TQgicDj/Z44XCClchGNXGsufrKFtUd9NaS85UpHjKVB9hUF2RMsS1Kjb6xrkIU3Q94mywYSzAehADfLuk5TRFuz9Wgugi5/ysFtuB7GQnbP7b9NXy7s79IlnhnqVSYRed3v+5UJ4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1g1VkEyeDJtdEJVR2x5NFVhUWNTR2NNZ082dVlHM0VNWSs3RlZFZlhRVUo5?=
 =?utf-8?B?a3FtUi8zVWJ2bEc5UmFTMDF4aXhVdlJOL1l3bW8xeVQ3bzdOSHVsZ0lLZU96?=
 =?utf-8?B?MnhSSzJmUGNQdmRRRkZBT3VvVVJSL1gxNjhSQzFPaDVpUnpxMWdqUUZwSTZK?=
 =?utf-8?B?bi8vb3NNQ3lBNi84RU53NGZTUklrNWNFN3FkMmt0c2VoOW5qQXlxT1FIWXZ5?=
 =?utf-8?B?WjFqZUZKZkZ0Y0tQMDgxTG85c1FpVlMyKzB5YTAxTGhmWkcrUHJ4NE9zMUlB?=
 =?utf-8?B?QjVueHR6dFdoNHZEeTcvVTZWTjlrd0VyNHhUSUQ0SVlJaitZT3ZlTFh1SkRU?=
 =?utf-8?B?djh3TEFGMFdXNUQ2V1RIblBLaFo5T1ZncGZaMmI3U1dCSE9QdXpTWVpNb3lw?=
 =?utf-8?B?dUE1M2d3TlV6QlNFdk5lUDhZTThKMzFUUkZTMVhFOVozNDNESC90OTNWNTM2?=
 =?utf-8?B?SGtqUXloUnczRStlSGFVZ3FmT25PZkU4UjlrbS9jb0hackhpOFpuRHZ6ZWoz?=
 =?utf-8?B?SENEZWhUSVEra1BJdmVySW5ZQXQ2RGVPZ1BoY0l5YWpBQW51MFhUdHphdGJt?=
 =?utf-8?B?M3BYQW1UaGEyRTBjWUNFUEJIZ0hIcVZjSHI0ai93bTExdWpBNnpSZG1Cc0VC?=
 =?utf-8?B?Z3o4MFU3YXhEcVB4NVlONVRiTE13SUlHbHNQd0Jzc3QrL0VyQWRIdEw4VWkz?=
 =?utf-8?B?Tnl2aW9xNTk2UlB2WG1BTzdOZE5aWWFock5WRFVSL1Fib21TQXhhL3c0N3V6?=
 =?utf-8?B?amF6dlN4MitJRWdqRStxYnhTa09Wd0FKQXNUOHFubURMbnJOVm9DSFRQMW45?=
 =?utf-8?B?WHNxbHpML0licDEzM3VLamh3RyttNGFTTHlzTVBTWUE0NmRWZ0d6NXVZWGJJ?=
 =?utf-8?B?elpFc1ZSdjZUTndWSmtXRkJpQ0k2YmRtTnU5Y2d4T05BZU50czlYSmJJb01S?=
 =?utf-8?B?cHp3QXpjMTByemtQdElXalVYVUtmOEhYMVpFUzRRS0J0TXg0RkJWUnc1emhI?=
 =?utf-8?B?TmRiTzZlajFoanZycHNuQ3FvTjFQR2pPWklveGlwcnNVMGhxQk1KVTFhQ2Fj?=
 =?utf-8?B?RERjNndmWXN4cWcwM3RDaDFDN2lLL1Y0THBoTms0ZUppMkc0Z1QxRWt4Tkh1?=
 =?utf-8?B?RENUUVc0VEZlcmNsczNwSldsVmJXSU5FVWdqSnRUWUdiYWIweUtiWmpyQVBr?=
 =?utf-8?B?QlI3ZGtTRTFCUXdVSEwrUnlKcnBwTFdRU3c5ZkNNTG9GdG56QWZvMk0vc0Zk?=
 =?utf-8?B?MXBJdVRiNjBRR1p3SE5rTVBNNjlTNXdpQ1lYVkZxaXFIZllYekVGRGxXcVl2?=
 =?utf-8?B?emJLampOQzFybm84Ym8zcVZ4VWxzS2IzMXZMaXFmeTdzQmd6dGVDMm5pTEVC?=
 =?utf-8?B?VnNQa1k1QkpWTGhWTkIzcENEbGJDVWJId2M4M2lkM3NYSE9pN0x4T20yN1h1?=
 =?utf-8?B?aDF5VlpheHZOcTJoM0VDSmN4OFFmVmxDRmZNRmxzOUQ5NG44bjRDYmFRUWlR?=
 =?utf-8?B?VS9tSTlUY2FhTDAvS3VLNUpFU1NzY2diejJkQW5kT2txWUpJQnVGcXEvT1oz?=
 =?utf-8?B?WXg1QnVqU2FsZVF2bnp2b0IzbGRuR3RKSnM5WEFOR29ST3Vkczc5VzRTRC9u?=
 =?utf-8?B?ZzhDZmRrMEE3ZXkwdmhtVjdTWllpMEZYaWFHM3ordS9MaFY1dThsSXQxdG9z?=
 =?utf-8?B?V045cmd4aTNnSlVCcXpyMkR2eXNDLzNkZEpKcG03alhYeWdBTlRmdVJVcDkz?=
 =?utf-8?B?dkxYb0RMczlNczUxamwvN2sxakhVVTNLdUJRR0QxMGxmMDViSWlyNE0rSVF6?=
 =?utf-8?B?b0hFaktsd3NPRlM1YnNDTmYzUUJTbHZzTHRtS0I0b1pMbGliczFiSWRUcXgr?=
 =?utf-8?B?TEd4V2x4Z3dnRXlUcVA2Zi81UzNtQzRMU0J2cGYxQ1lvZTVITXQ3aXRtaW91?=
 =?utf-8?B?UmVvZGtTcnd0dWhodG9tS3V0RHdneno1c2NkZFMrUE82OVBjQXd1OWx0cTg2?=
 =?utf-8?B?UGpRS0tIYVlXZEZ6OGN5K05rSjVXaUg0dUVMRFFCVnIyUEhiOHlCdlA4SXFV?=
 =?utf-8?B?WWd1eDV4a1QwZENrZjlFWGptNiszRk9hTWFpTGtlb1hvL1ZVeWJVSjNkTEZ1?=
 =?utf-8?B?ZXdVYXRZbnNWdkVtdm4vaU5KTzIrUkZBb1B5S21zYU5iRDdVd015THFsVGl4?=
 =?utf-8?B?RFM2aEc2THk4YVRXenhXR2VBUjJXeVV2QURHVDBUUG5wT09YUUlpNlFxV3JK?=
 =?utf-8?B?UWhUS01ZYXhYam9FVVVldUhTMVgrcHFVdjgyUndHcXk1VisrdTlpc2F5ejlI?=
 =?utf-8?B?VGkyMk1YN0ZTRWdNMTd4TnA1cGZsQlovakVnbUJvM2ZadUxXRjdVaklodVZ6?=
 =?utf-8?Q?zFpo1PBALnlbDP5XoB3wKRqochg3zXFPrQJUtMpg6qyvD?=
x-ms-exchange-antispam-messagedata-1: Lne8k5g8UUnogg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m5JBacW6qotajFWoq3EhhVxqaiK5/DNZG9fBZ3ojDbsvbnTZU+d72VzVNmMNznJ4Mt00z9Vh0nFv2yi9PoeONw0M7pfsrHYyitfwhYqOmANpy+1iHxxChZeVvBssvCo2jG7NbEjDWoH3GhC8MTBphSvCw+Pjci4Kn1288nZ5pgwRKOOCMXkWqzZEtbWIrhpeBRWf25XG0T/JFrq6gXxwYc+tfwBtMCYIfkALYvcjoYM0H9yY2pgjd1EvvthGpR5IqZlnKvo9g6LApxdK96oU39XMr96sLmaY/KY1kP7JdC1MaFeXZbw4JJWPG1/5JqYPKQHPYbb0olxyMJkQLPbpFQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecd3954-1d12-4f80-95e2-08de9afaabde
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 14:24:14.8928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cYRJNwrMGngm+mGBgkScvGyoEXvZWwhY28vNlTSaxhQKRPJ/gfhwUweo1R+aFgwMto6/0fMHpLX/Dg/nAAXzUtU4k3SirOFHR97rUQjjIyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9876
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDE1LCAyMDI2
IDM6MTkgQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29t
PjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIFNhdXJhYmhnIDxz
YXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT4N
ClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS94ZS9wZjogU3RyZWFtbGluZSBmYWlyIHNjaGVkdWxp
bmcgZXJyb3IgcmVwb3J0aW5nDQo+IA0KPiBPbiA0LzE1LzIwMjYgMTI6MDQgQU0sIEpvbmF0aGFu
IENhdml0dCB3cm90ZToNCj4gPiBUaGUgZnVuY3Rpb24geGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnX3Nl
dF9mYWlyX3NjaGVkIHJldHVybnMgdGhlIGZpcnN0DQo+ID4gZXJyb3IgcmVzdWx0IGl0IGVuY291
bnRlcnMsIG9yIHplcm8gaWYgdGhlIGZ1bmN0aW9uIHN1Y2NlZWRzLiAgVGhlIHdheQ0KPiA+IHRo
ZSBmdW5jdGlvbiBhY2NvbXBsaXNoZXMgdGhpcyBpcyBieSBvbmx5IG92ZXJ3cml0aW5nIHRoZSBy
ZXN1bHQgdmFsdWUNCj4gPiBpZiBpdCBpcyBhbHJlYWR5IHplcm8uDQo+ID4gDQo+ID4gVGhlIGZ1
bmN0aW9uIGNoZWNrcyB0aGlzIHRocmVlIHRpbWVzLCBidXQgdGhlIGZpcnN0IHRpbWUgaXQgZG9l
cyB0aGlzIGlzDQo+ID4gdW5uZWNlc3NhcnkgYmVjYXVzZSB0aGUgcmVzdWx0IHZhbHVlIGRlZmF1
bHRzIHRvIHplcm8sIG1lYW5pbmcgdGhlDQo+ID4gcmVzdWx0IGlzIGFsd2F5cyBvdmVyd3JpdHRl
bi4gIFdlIGNhbiBzdHJlYW1saW5lIHRoaXMgYnkganVzdCBkaXJlY3RseQ0KPiA+IGFzc2lnbmlu
ZyByZXN1bHQgdG8gdGhlIHJldHVybiB2YWx1ZSBvZiBwZl9idWxrX3NldF9leGVjX3F1YW50dW0g
aW5zdGVhZA0KPiA+IG9mIGFzc2luZ2luZyBpdCB0byBlcnIsIGVsaW1pbmF0aW5nIHRoZSBzdXBl
cmZsdW91cyBjaGVjay4gIFRoaXMgYWxzbw0KPiA+IG1lYW5zIHdlIGRvbid0IG5lZWQgdG8gaW5p
dGlhbGl6ZSByZXN1bHQgc2VwYXJhdGVseSBmcm9tIGVyci4NCj4gPiANCj4gDQo+IGJ1dCB0aGUg
ZmluYWwgZWZmZWN0IG9mIHRoaXMgcGF0Y2ggaXMgLi4uIG5vdGhpbmc/IA0KPiANCj4gJCBzY3Jp
cHRzL2Jsb2F0LW8tbWV0ZXIgLmJ1aWxkL2RyaXZlcnMvZ3B1L2RybS94ZS94ZS5rbzEgLmJ1aWxk
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZS5rbzINCj4gYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5r
OiAwLzAgdXAvZG93bjogMC8wICgwKQ0KPiBGdW5jdGlvbiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhDQo+IFRvdGFsOiBCZWZvcmU9MTcyMDY0
MSwgQWZ0ZXI9MTcyMDY0MSwgY2hnICswLjAwJQ0KPiANCj4gYW5kIGl0IHdhcyB3cml0dGVuIHRo
YXQgd2F5IHRvIGZvY3VzIG9uIHRoZSBhY3R1YWwgc3RlcHMsIG5vdCB0aGVpcg0KPiBvcmRlciwg
YXMgb3JkZXIgY2FuIHBvdGVudGlhbGx5IGNoYW5nZSB3aGVuIG5ldyBzdGVwcyB3aWxsIGhhdmUg
dG8NCj4gYmUgYWRkZWQgKGFuZCBtYXliZSBzb21lIG11c3QgYmUgZG9uZSBiZWZvcmUgc2V0dGlu
ZyB1cCB0aGUgRVEpDQo+IA0KPiBhbmQgc2luY2UgdGhlIHNhbWUgc2ltcGxlIHBhdHRlcm4gaXMg
dXNlZCBpbiBvdGhlciBwbGFjZXMgKHdoZXJlIHlvdQ0KPiBtYXkgc3RpbGwgYXJndWUgdGhlIHNh
bWUgJ29wdGltaXphdGlvbicgY291bGQgYmUgYXBwbGllZCkgSSB3b3VsZA0KPiBwcmVmZXIgdG8g
bGVhdmUgYWxsIGNvZGUgYXMgaXMsIHRvIGJlIGNvbnNpc3RlbnQgYW5kIHNhZmUNCg0KSSBmb3Jn
b3QgdG8gbWVudGlvbiB0aGlzIHdhcyB0YXJnZXRpbmcgYSBzdGF0aWMgYW5hbHlzaXMgaXNzdWUs
IGJ1dA0Kc2luY2UgdGhpcyBwYXRjaCBpcyBiZWluZyByZWplY3RlZCwgSSdsbCBqdXN0IG1hcmsg
aXQgYXMgYSBmYWxzZSBwb3NpdGl2ZQ0KYW5kIG5vdCBwdXNoIHRoaXMgZnVydGhlci4NCi1Kb25h
dGhhbiBDYXZpdHQNCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpv
bmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+IA0KPiBidHcsIGluc3RlYWQgb2YgQ2M6IG1hbmFn
ZXJzLCBpbiB0aGUgZnV0dXJlIHBsZWFzZSB0cnkgdG8gaW5jbHVkZSBpbiBDYzoNCj4gaGVyZSB0
aGUgYXV0aG9yIGFuZC9vciB0aGUgb3duZXIgb2YgdGhlIGNvZGUgeW91IGFyZSB0cnlpbmcgdG8g
bW9kaWZ5DQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3Zf
cGZfY29uZmlnLmMgfCA2ICsrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
c3Jpb3ZfcGZfY29uZmlnLmMNCj4gPiBpbmRleCBlMTEyYWExNDhkYWIuLmJiOTgxMWJjNjRkNCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmln
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfY29uZmlnLmMN
Cj4gPiBAQCAtMjcyNSw4ICsyNzI1LDcgQEAgc3RhdGljIGJvb2wgcGZfbmVlZHNfcHJvdmlzaW9u
X3NjaGVkKHN0cnVjdCB4ZV9ndCAqZ3QsIHVuc2lnbmVkIGludCBudW1fdmZzKQ0KPiA+ICAgKi8N
Cj4gPiAgaW50IHhlX2d0X3NyaW92X3BmX2NvbmZpZ19zZXRfZmFpcl9zY2hlZChzdHJ1Y3QgeGVf
Z3QgKmd0LCB1bnNpZ25lZCBpbnQgbnVtX3ZmcykNCj4gPiAgew0KPiA+IC0JaW50IHJlc3VsdCA9
IDA7DQo+ID4gLQlpbnQgZXJyOw0KPiA+ICsJaW50IHJlc3VsdCwgZXJyOw0KPiA+ICANCj4gPiAg
CXhlX2d0X2Fzc2VydChndCwgbnVtX3Zmcyk7DQo+ID4gIAl4ZV9ndF9hc3NlcnQoZ3QsIFhFX0ZB
SVJfRVhFQ19RVUFOVFVNX01TKTsNCj4gPiBAQCAtMjczNyw4ICsyNzM2LDcgQEAgaW50IHhlX2d0
X3NyaW92X3BmX2NvbmZpZ19zZXRfZmFpcl9zY2hlZChzdHJ1Y3QgeGVfZ3QgKmd0LCB1bnNpZ25l
ZCBpbnQgbnVtX3ZmcykNCj4gPiAgCWlmICghcGZfbmVlZHNfcHJvdmlzaW9uX3NjaGVkKGd0LCBu
dW1fdmZzKSkNCj4gPiAgCQlyZXR1cm4gMDsNCj4gPiAgDQo+ID4gLQllcnIgPSBwZl9idWxrX3Nl
dF9leGVjX3F1YW50dW0oZ3QsIFhFX0ZBSVJfRVhFQ19RVUFOVFVNX01TLCBQRklELCAxICsgbnVt
X3Zmcyk7DQo+ID4gLQlyZXN1bHQgPSByZXN1bHQgPzogZXJyOw0KPiA+ICsJcmVzdWx0ID0gcGZf
YnVsa19zZXRfZXhlY19xdWFudHVtKGd0LCBYRV9GQUlSX0VYRUNfUVVBTlRVTV9NUywgUEZJRCwg
MSArIG51bV92ZnMpOw0KPiA+ICAJZXJyID0gcGZfYnVsa19zZXRfcHJlZW1wdF90aW1lb3V0KGd0
LCBYRV9GQUlSX1BSRUVNUFRfVElNRU9VVF9VUywgUEZJRCwgMSArIG51bV92ZnMpOw0KPiA+ICAJ
cmVzdWx0ID0gcmVzdWx0ID86IGVycjsNCj4gPiAgDQo+IA0KPiANCg==
