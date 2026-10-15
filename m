Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41AECC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 20:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B307810E84F;
	Thu, 15 Oct 2026 20:51:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F8C10EB77
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792097470; x=1823633470;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l9qX73aCQ0lqzDq1l1CSX5PRVHVB9BvyRpay36BQbQ0=;
 b=Q7QFMNeoyFjB/tCY6KYwxTOBZ+QqIccfpMirbEfmlhJsq5uyXSQnJlh7
 MkvoS6I9ExOgEJ0SwCIOp+mMal95WuWqe+8GDp5YRAEBPSJztnrxo9Dz/
 IXfuD4oybudJp8P6be8T7MSkPQvevoRVfOckLvBasvF+nS8AirgilWiHf
 Fc43aLP8YE2K/25WT2f3NQzyNlyuRyE1GpEeZPX4tEPG53lHXVBX+ud/A
 L/PEm9sWRRB4pVSUfcH1nCAVo3FewEtRanAlmrweI0vcQPwDeo3ugvGZB
 nRv6+P3i+WPfD+CBOy0pKYQLaTOZy4EQat9e/FvU8WuT1tuNlQmJg5baZ Q==;
X-CSE-ConnectionGUID: ZIaJ7EV/R46yJO0OLe3rww==
X-CSE-MsgGUID: 8wLTE1HcRPmQXuHLBi6O1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="893569"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="893569"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:51:10 -0700
X-CSE-ConnectionGUID: yiyFt3bvTn+bEAaCEwTvwA==
X-CSE-MsgGUID: BOgHxxY4SPeaSe2sUgCDZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3610850"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 13:51:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 13:51:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 13:51:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 13:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJse2rZk6C1X3VHJeOEyc1fJ/ZGTiapjTMTeiFxyJMWIQFMn6fBbwnCWbRnWr9bDOc9JVo8ipJU8XIWAYTBzt+yKq0vE9gHlgpCp/s2UuHfILpa3qxe1IMJhkO07Fi5fffkkWeZTZ34lCQMGXt9OrfbcJ33F/aBweFUUPPcsz9b4SgN08Pmzdz0FuszaIzqkBb/LehMke/rJ45t6bb+e8qGI/YU7G7v8uKCIm/rpWafR2mrCCd5Un/MP7RdCsigXzZbRO29rqqFjQLi7zf1Dghu2ChTb2PdTZVCkHjn4AqX8JcHpmIxAeKMq7Gg4gSv5NiovuDshGCmPVCRajzV5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9qX73aCQ0lqzDq1l1CSX5PRVHVB9BvyRpay36BQbQ0=;
 b=bEkBcJ59EBHiG/CRV1xXD/GuRAuzkPULrFRJu2F4MwMlK60Alj096V7/KLt3sXXvvkBGWJjsUuQ3p6Sqv7cEQbhvDyJwegA3Q0BxsYjN3arxAfA44dcoRhyjNgW6Og26tlc6O9xywJO0wHSe752ElweKF7Hi1ZA/q7HcRRcYRKfJsvCLCGvSwP7HFW5JyWZE1qHK45wZlE2XmhbWWRIVKyo2I7rPNp7QCBu9YleaI/4EeZM1tAOXL6M9ttyzFAvLHLwsmtDSDwFWaJIj1lPsHZAeV4Vkpc0X54Jo9u+7iQBIuviEAOnNTxEk29OslZv3B1PtSEggEZwJEEMJK6CnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 20:51:06 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 20:51:06 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH] drm/xe/gsc: Fix NVL-S GSC compatibility number
Thread-Topic: [PATCH] drm/xe/gsc: Fix NVL-S GSC compatibility number
Thread-Index: AQHdXOY8rlMejdsP00yzYw+hd0pWO7b/E/wA
Date: Thu, 15 Oct 2026 20:51:05 +0000
Message-ID: <feb15e99f1bea55b0c0cb1c56921517ec3045146.camel@intel.com>
References: <20261015204548.147348-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261015204548.147348-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|CO1PR11MB4979:EE_
x-ms-office365-filtering-correlation-id: 5033328c-76ca-45bc-13a8-08df2afe0864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|10067099003|18002099003|11063799006|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: Zjrr4h08NTMAdvQkrgbC5kuWyULSSxU5oRiyKssq0V1RBfL3IY0OZZQUoKFuvNpW+0oy+wU+hWh422bw9aYuUpvxcGKVbk9og/s/FlAUNHxvMe2XN7OTW+RIp0PSWY9n+d9iO51+lYnG5lGFQNs8GMWn7R/rA9kShquE/Dfew2jPCAdqDdCqf+Grnb6YIbRNLencqh6iJwr7azwKZ1yUZ7ruRGUprCf9gOJBT8sfPqA5FNOZPw9QLWg6pSkeVar0vHHHZGkAhAPENTAXtADdSGYwH7e20mpr44Y6c3X6ZZXNbFl1jGrYi2QbH94gAzLP0CEvdv09FRNXAsze83KZZgIvBt8Yyzh/L9EKdTeBZTWIAATSBC0f6j8B+kYz/fseASjNUi6so13Iq3KW+JHaWGmWDAQtFVFN4+v21H2Enqe2Z4gVk8heHrLjmSdAnjre8t1/pG8AIJFX5NU8xLluOCNs1jfEPnZBPYbxm46mymAKWZl9QjlKVv9tzxkowyuz9CKKtv0wKTM8bTB/eUQV3wdHe8ZjCG/Ohot9uClGEPJ9QY47THu/imOxbFqkVV8YcH/0sBS+oszkOyOhzpjdMZr2XuqeDrunyWQgtpRegc+WWS2fUUQZX/oW2hcBuE2EEGmpU+INxr3YwbuN1+tB/RU2r+tiwkUVaqanYSeh+s0iq6Llh+h1y8wnuFEavGWcWhvwn34RJQP0aqjB3KKi+yLEZIXpwo3qDoePwACC64k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlR5RGhFMEJ6Qnd2ZC9yVVNXSDNiWENmcXRPUVZGd1pxdHFsWllPTTNDd1Bs?=
 =?utf-8?B?V2s5Q3dnQmFpenk0c0REL0tocXpVNVF2Rk4yVFMyNHNSOVMrUS9TeGxZWGhD?=
 =?utf-8?B?dVNPYzYwb0VxWGtDYi8vL2ZMZmlmWXNSVWxPUFFFeDVNUFJ3NXJ3R3dtc012?=
 =?utf-8?B?V0R2YndyelZHV0lhYVVmUE1HV2lCUnJ6VkhKMWxxRW5idXJKeHJlSkZYdHhx?=
 =?utf-8?B?c2ZlV2FmUk5IL2d1NmxqdjZqMmN2MmIrMmpwMWd0eGdBcFdtT0JkS1hDZENC?=
 =?utf-8?B?ejhteDkvMXVKcHFrZTM3bVBiaGFSQkt1MWhJZy9VVC84RDRlVFkxajA4b3BN?=
 =?utf-8?B?VERPZ29pS01qTXRUNHFVRmlwSEtzL3lvcmZBRnk1aUNyZi8xVTlRSCtBRzNQ?=
 =?utf-8?B?a2I3U0JxRlhpQmVJdGM4eCt1VXBIS0hKVmVLQWV4TVduZzhMRDNlMm1uK01x?=
 =?utf-8?B?LzUxQ3AwM09mNG03TlpUenlHV0JuT1pXQ3MxVkF6Q2FiNlF2alVwaXpoU0dO?=
 =?utf-8?B?WitIQTlKZWh1dkMxbStIRXBsQjYwbWhXdUZXcmlFcVZjbE5zeXZUSDFlcUNx?=
 =?utf-8?B?RE1WSkFVMUdER29xeVByWWdCYUhjeXl3YVRyTVF6NlVpVklMMnJjUTRLTkcx?=
 =?utf-8?B?R3R4NmFUbThUVXNxMnlXMXFDYkhXeXB6YzU3Z1FMc2NGa2pYNG5yVi8xNm10?=
 =?utf-8?B?RDVCQ3hOZ1MwdU5yRHhLcEtUR2tQaUVFNUtlTmpqZml3d2lSRDR6MG1UT0pH?=
 =?utf-8?B?UGZudzJ4Wi9GUVNPRXNONHM5TThEUG1PUm9raE5WYmh2ZDk4TzFmZEVBMmpZ?=
 =?utf-8?B?alZRamVTTlJ5VTUreU9MTEl6STNFcXVDK0xJK2tZZFcrTnpNWmp2ZHRSMUQ5?=
 =?utf-8?B?a3lQbXUxSEpKYThZMlQ4YnE4TXhSNmhnUDlGTGQvdnA4RXhwdEtXNUloT0NP?=
 =?utf-8?B?bVNIVDl5ZEVsTlh1aE1PSGhzQVppRkVzN2RWc3VIbFl1elFRd1JHcjRFY1R4?=
 =?utf-8?B?cjBwREJhRm1ySysxY0IrYzZsdHR0ancyRWpuUytnbm1IL2xFVkJOWnU3aDg3?=
 =?utf-8?B?VGF4LzFxbmJDT2ZmWEpPOW1zU2dQcW91dmIzMlVzR2hGSGVVamIxR0hiTlh4?=
 =?utf-8?B?K1d1S1Z1UkxCL05uTWhnVG9DU2RNMzN6VE1mMDBlQWtoYk9HTVpFbmlMRzVN?=
 =?utf-8?B?eDlKc1pzRnpma2xORlZ3akRzOXRUM0pYQ0hqUi96L3dLV1B6NGVSQVcyL1Uw?=
 =?utf-8?B?ZHZ6Y2VjRVM4Ui9FbTVjNVdrcDRSY0hBNkhUWWFxWFM5ZVhUd1pBeWczR0dz?=
 =?utf-8?B?ZS9JUVJLS3k4M0hraVRUU0F1YzkyTUx6cEUwd0tONy9rTjhZKzBXSDltMmJy?=
 =?utf-8?B?ZWJyN3l4dDZ1SmZ0YzJPakRFdzNUalFjcTNycU1KajM3TVU4MGNFNHM3RmI0?=
 =?utf-8?B?ZGIvc2Z4NHhubXBSZTdiZXd2OUh3eFRmODdrZzQwTTV5UHdNMm9FS2s4bmt1?=
 =?utf-8?B?aTI2b3lMNWxZMEZaOHpvN0NXTGhieUNFNlpoc3VDNUtBRVozbEpPcFV2bzNI?=
 =?utf-8?B?RlhqMGhWV1p3dUJvTEU0c05XMWxFcXl0RlN2dlVlRFY5QXJNcjJuRTNwSmNn?=
 =?utf-8?B?VWJzdHlDZGJKOTU0Q0JsUzBmUXBEQXR6ajZhVllsUXp0MnhTd0l1ODRDVWpl?=
 =?utf-8?B?Z09BU2NRaHgyKytHZXhLQ2o1QUlIMjZ4Vm00TGo0eTRWWERZUkF6cHFqdnor?=
 =?utf-8?B?TlByNFlDNUxUM2s1eTE1Ly9scjZFUWhxRDVYZ2hnaG92UGhHN0g4UlRpbnNO?=
 =?utf-8?B?cHRIK0I1UUFTOVFNTFdOKzdZZlNtZStxVVF1bmJtSTM3WjVnWmFMQU1tekMz?=
 =?utf-8?B?ZWFScFpPTG9TdjUzVjBNcDJtQS9nSlRBbU84Q29ZTTVUcHFkejNrSHMvK0V3?=
 =?utf-8?B?WWtDM1hIemtGRmRKY2lacXgvMXJwbGF3cDdYWW9yb2pMRHc5djNJWUFWRU83?=
 =?utf-8?B?TFRIUHJLNGJpdFcrNEZqWjdOMDM5azFQVW9UNlZUYjhKbysyZXUzZTlOTG54?=
 =?utf-8?B?RXVacitZS1NMdEtodkF0Mkx0S1JsdUg2QlQ2dXJISUs3Zzd0aXJGZ0FNZW90?=
 =?utf-8?B?ckUyMkJDblM5bUJKSnBNRDZHOTJGcWNTTmUvSUY2RGlxL2ZVd3BOQVFJQjNi?=
 =?utf-8?B?d0hPeDA1aUx5eFRuWWR0QlZtOXFZQnhYVWYxMFhscDN1R2N6U2FOUzhPeUN5?=
 =?utf-8?B?ZTVnZGdGRG84QlVVSVgxV3RqL3I5c2ZnTXFleHNrelRqUkluWHVubDhiL2JG?=
 =?utf-8?B?cFFLMEdTRG5GSWlLVThuTll1NWNmK0NERUpoVlVubzdqWllnNFJkK08wcEt1?=
 =?utf-8?Q?He48Q3puenba9/ab6kNuLHh0ZTZ+X9gR3XUgb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9F16E05FA4FDF479D2BD37D6E0E92CC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: U8HNJUprKLu7ZXWhzeTK6ihhrzBLx/WizbwVFFvm43gFHn4yI20DOKWZC5oy7O1Fyb+f/DgBGXbzPQoVvUkhWbCO05zSPJx/cbTcu/twxkksqPO1pJT56opMtSRqafWA0/jfGlphYlYId4vekIBosbf+TJtK//zDEATTtRF6qbCjXdexsYeg/S9ced3J1f4zAqwOP9cIj6Yi4tC/BceeGARWzak/4xAUnCapc9he6HVXxu1ueokVlf6ArBwOnM1FAasdsZia2E2zhIOT1C9pyVCDjqwoaxfHYFwPDg/tnWnmqhgSo5weHMNSxvHVoy1gpLClyT+7VBjL43WHEEzhsQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5033328c-76ca-45bc-13a8-08df2afe0864
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 20:51:05.9604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLdahpartmWXq6tr1lRCmKUy+xYA1OkJ3oak6WVxKg2dTS3gZE72QNJ43V0/0crEInlXBM9hmdztobfZDYAHNFHvsNsa1y6BdTls6zhtD8WzBMBZJpxLl+t+TG+40ZvK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

VGhhbmtzIERhbmllbGUgZm9yIGZpeGluZyB0aGlzIC0gdHdhcyBteSBtaXNzLg0KUmV2aWV3ZWQt
Ynk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KLi4u
YWxhbg0KDQpPbiBUaHUsIDIwMjYtMTAtMTUgYXQgMjA6NDUgKzAwMDAsIERhbmllbGUgQ2VyYW9s
byBTcHVyaW8gd3JvdGU6DQo+IFRoZSBjb21wYXRpYmlsaXR5IG51bWJlciBmb3IgdGhlIHB1Ymxp
c2hlZCBHU0MgbnVtYmVyIGlzIDEuMC4gVGhlIGJpbmFyeQ0KPiBpcyBjb3JyZWN0bHkgbmFtZWQg
bnZsX2dzY18xLmJpbiAobWF0Y2hpbmcgdGhlIG1ham9yIGNvbXBhdGliaWxpdHkNCj4gdmVyc2lv
biBudW1iZXIpLCBidXQgdGhlIGRyaXZlciBpcyBpbnN0ZWFkIGxvb2tpbmcgZm9yIGNvbXBhdGli
aWxpdHkgMC4wDQo+ICh3aGljaCBtYXBzIHRvIG52bF9nc2NfMC5iaW4pLCBsZWFkaW5nIHRvIHRo
ZSBiaW5hcnkgbm90IGJlaW5nIGZvdW5kLg0KPiANCj4gVGhlIGRyaXZlciBzdXBwb3J0cyBydW5u
aW5nIHdpdGhvdXQgR1NDIHNvIHRoaXMgaXMgbm90IGZhdGFsLCBidXQgYWxsDQo+IGNvbnRlbnQg
cHJvdGVjdGlvbiBmZWF0dXJlcyB3aWxsIG5vdCB3b3JrIHdpdGhvdXQgdGhlIEdTQyBGVy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9s
b3NwdXJpb0BpbnRlbC5jb20+DQo+IEZpeGVzOiA4YTkwZjBkMTA5OGYgKCJkcm0veGUvZ3NjOiBE
ZWZpbmUgR1NDIGZvciBOVkwtUyIpDQo+IENjOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVy
ZXMuYWxleGlzQGludGVsLmNvbT4NCj4gQ2M6IEp1bGlhIEZpbGlwY2h1ayA8anVsaWEuZmlsaXBj
aHVrQGludGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdWNfZncuYyB8IDIgKy0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3VjX2Z3LmMNCj4gaW5kZXggNmVkYmExNDAxZjdhLi43MDliNjUzMjc2YTIgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV91Y19mdy5jDQo+IEBAIC0xNDUsNyArMTQ1LDcgQEAgc3RydWN0IGZ3X2Jsb2Jz
X2J5X3R5cGUgew0KPiAgDQo+ICAvKiBmb3IgdGhlIEdTQyBGVyB3ZSBtYXRjaCB0aGUgY29tcGF0
aWJpbGl0eSB2ZXJzaW9uIGFuZCBub3QgdGhlIHJlbGVhc2Ugb25lICovDQo+ICAjZGVmaW5lIFhF
X0dTQ19GSVJNV0FSRV9ERUZTKGZ3X2RlZiwgbWFqb3JfdmVyKQkJXA0KPiAtCWZ3X2RlZihOT1ZB
TEFLRV9TLAlHVF9UWVBFX0FOWSwJbWFqb3JfdmVyKHhlLAlnc2MsCW52bCwJMTA4LCAwLCAwKSkJ
XA0KPiArCWZ3X2RlZihOT1ZBTEFLRV9TLAlHVF9UWVBFX0FOWSwJbWFqb3JfdmVyKHhlLAlnc2Ms
CW52bCwJMTA4LCAxLCAwKSkJXA0KPiAgCWZ3X2RlZihQQU5USEVSTEFLRSwJR1RfVFlQRV9BTlks
CW1ham9yX3Zlcih4ZSwJZ3NjLAlwdGwsCTEwNSwgMSwgMCkpCVwNCj4gIAlmd19kZWYoTFVOQVJM
QUtFLAlHVF9UWVBFX0FOWSwJbWFqb3JfdmVyKHhlLAlnc2MsCWxubCwJMTA0LCAxLCAwKSkJXA0K
PiAgCWZ3X2RlZihNRVRFT1JMQUtFLAlHVF9UWVBFX0FOWSwJbWFqb3JfdmVyKGk5MTUsCWdzYywJ
bXRsLAkxMDIsIDEsIDApKQ0KDQo=
