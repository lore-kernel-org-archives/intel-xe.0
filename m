Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60D0CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 17:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9B10E31A;
	Thu, 30 Oct 2025 17:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdTv/Sl5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2BB10E31A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761845917; x=1793381917;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IDCFtEfgooBm+1MUrHO5Pkx16RUNQFzgEhC71/9f22A=;
 b=jdTv/Sl5U8CjWwCSTrtcN1vhb5JkjtMj7xtARVCEJMVReu7dUsC1fxLX
 XKciEvpIKOh+Pp3J5JR2fDp9OtuJ22FW01RE3h/aigrXhg81jCqmz/QtE
 Y4u3bWUvmR0wtiDJAGSb4Ycc7UkfzcNgcWZhEHFHwyeh1yAxQMopk7o6r
 VFVZpGrlg1fpcBX2tgPZD58SgqQ6ZY+mXXlpnWmAuxPkmTsOjXwfEWIkA
 jauNYtXJSw8Mb0kAY2DZn3LCmPMctKQ5GLGyNl8bt1dFnX19xeUvWJN9h
 921qTB//HBNCTe3++/t+hP15j4UM8H/yYHyDGj+xBKg6bnp2CmkRDfWqw w==;
X-CSE-ConnectionGUID: LBEcJO8fTuyMcLCNglYHxw==
X-CSE-MsgGUID: JH6ILMfJSouB+ZpqYhSLzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66611466"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="66611466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 10:38:36 -0700
X-CSE-ConnectionGUID: mTDasBJHS6elRhGSr89UbQ==
X-CSE-MsgGUID: kbUswJmASfOYYbQV0fPtJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186112419"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 10:38:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 10:38:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 10:38:35 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 10:38:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=St1UKTrbvboEPmm6fa5+dT1cFbK+MRJAM+lK/vEQ2ccUwzmEXGDm0BPP2SynZOkqCsQx0EJCoM9wQozwvXeLOYQPGz2MN3e+NYt1DtHtaoqt1BbaY1xoFJWT3iGQxlZ2kUnIgwf/WbqqyIficqsU7LyiPJH1YK1Bzpxo1HcMNXMHeedw3Z700XOYdyxS1ikCMl9JSDriMrpYGrf1Sz+BZ1jFYadYLIGobOETJ9KP6gL77GDNsdVoB3H3lrN4WnfK+YDa2HZcvmeUirACqviXrIT4CKrWDcd17gUvSgymY0Kb1QvP0SOJEoVJPhT/HkSYSaOpw1+fkM3ykW31pi+Tnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDCFtEfgooBm+1MUrHO5Pkx16RUNQFzgEhC71/9f22A=;
 b=xmvxz/AxTN/82M+HCQzF0d1pmfz1vvmQEkHqJye1jd//po04UrTqY26LVy3ROS7Vrt95oczHM11vZsoGiiFOa4+6uR1Kh8dQVHC9HaPy5pDIXuecTiuKxElamzlieN3Rbby3NBhzF5CVDomYwva+1nlSI/MiqN4pm7HVmFDs9f9/5A2KJX06SEfo9zYjffp+/vUAtSDsFzw/4JKwOYLr4uoALxRAnT+327LiojMPBApAgQYEftO9+LUdygaIix2BPWMizofrYZdoclsZqhzvDCKljaSbJCaOEhZOJcZEZS81yzOAPhNxAXYKUsyP/omMcj1bV2coQNNfe2eV4UzE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 17:38:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 17:38:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Thread-Topic: [PATCH v2 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Thread-Index: AQHcSa98EHbQlP87lkyFSEx+3Tvy9bTa9KYA
Date: Thu, 30 Oct 2025 17:38:33 +0000
Message-ID: <4996795cdb5a48ab19247de78334df2b080c8758.camel@intel.com>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-6-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251030151122.3021436-6-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6401:EE_
x-ms-office365-filtering-correlation-id: 4fbf73de-6cd6-487c-e8ac-08de17db25ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aGMvQzN5SEVXN28rYS9GNmNSZCtvOUZRZmovNnNITjg5MElZeENZVjlNVU1r?=
 =?utf-8?B?MENreHd2UEpqNDQ1dGZialkrdEprT1NyL0kxKzhDU0FoN3U4eXBvL01WOVpO?=
 =?utf-8?B?anI4YWpXWDNlemxBQjhyTTJnMWRhYVJOaG80Z3pkYkdUdjViclZTUGNGUk45?=
 =?utf-8?B?MFRzQzhDWkhhWHR5RmdHMWdrUCtUY0NEa1J4enhLcWtSRWpSRGlBUlVMMXdR?=
 =?utf-8?B?NEZHTThWeDAwa0F4bnNBcitjKzhEWWdpZGc4MW1GZWQ2T29SYW5HVjJtb0Nn?=
 =?utf-8?B?YmZrNEg4S2kzd1FGQ1VSSWttSnhEeG1kQUR6ZjFaTXRRSnBBK2FTMDl2Smpk?=
 =?utf-8?B?QVNzRHNkNWN6RHowY0QwTzk5T0RBSkZsVk5KVW5obCtVeFF2SHZMRlFVZ2sv?=
 =?utf-8?B?SnRHUHRoTGU3eUV2NHJMbTFjakltSURISTVGL3dmR3NYeWRLNlNlMFMxTXF0?=
 =?utf-8?B?S2tUQ25iL0V2aXoxZGEwVTlhRFE5dk91OWZPK1NEdUVCSnNWamhxTElMTTZ6?=
 =?utf-8?B?L1BDSU1tbTRHelZVYzAwTllvSVFycGhjVjdxWTZQQ0d5Rk9mMGNLSm45Skgw?=
 =?utf-8?B?VU96Y2NIYVo0QkNWOGtnNi84YlVrVkxMdTBpRWlvU0k2dVgrYTkzTWV5d0Nx?=
 =?utf-8?B?L0NKZ3A4MVBWK1RPMXpjOUhWN2ZGNXFvSzAvVjNsZWpsSEc5SFNNaFNtTFk0?=
 =?utf-8?B?QWI3NnkwRDBtUGp2ZHBzblEvcTZuSnAwTEQvZ1RQTXBWQ2dzckdkd2dxRUwy?=
 =?utf-8?B?dDBnclRaSUhQREFuVCtQaldCb3JtOFFuV2JSSjhoUEh4bnNHMmlZNzlpVEtV?=
 =?utf-8?B?bTNXY2ZWaW9WMm0zbzZpNnpHS1Zubm10L3ByTWhrMHJQOTZIbWQ2SkRaWVNu?=
 =?utf-8?B?S2NtVVptbXhhV1BBUk56T2JRdGhZNHUrOFVNOU11aXFpeVpNTzJVNEswdDF6?=
 =?utf-8?B?U0lPOG5tVVE1ZW85aTVOZktDblFCSG1iejVsZUE4c3JUOVBBc3lMQ3RUbG5m?=
 =?utf-8?B?SXRQRXplSE9mSEc5VFliK0IrSHNVVFp4bDIvNUVvaTJoaEwrV01IUWsxMmUx?=
 =?utf-8?B?bytQLzBOKzV0N3lHTDB0V1dGUkFiMm9aZ0dLR3BwSk84VnlPZ09IZkQyOEJM?=
 =?utf-8?B?bDArVElueEt1dmxvOFZJNVZDR2xvMWNSR0VXeXJVVzVJaEp3Q3BIM3FMUGp4?=
 =?utf-8?B?N3liNVkvRW83NEt2Wjl1QzRmcDhNTlJqWXlXcUZ5d0E0U0pCQlY4YUJwdDJH?=
 =?utf-8?B?b1l0SEtSS0U2djNxK0pqYlM1SGptTlcyR2ErS1VKeG1OSG5oQXd1SE1nS2N0?=
 =?utf-8?B?dE5pV2NNeFZJajI0UlNhMFlnSnZBdis2VW1md2k0QUpDYWIzc3pFU3RhS2Y3?=
 =?utf-8?B?b1k5cjZTeXZNSzlvdFhBOW9DdEN4cmlRMnlEZ0hpeXQyUXhFelZZY0Y0OFFy?=
 =?utf-8?B?VkVVMEU4QXBaSjZOVlBiaEMyb0U3ZFBrOWhTQnoyTnRkbVNXNWh1Qm85MUxk?=
 =?utf-8?B?NEREdFhJbnNhWi9HUUFkWWY3M0k4b2pVak1iZldWdGZqNUw2b292eVFmQk5l?=
 =?utf-8?B?VE1yL0lHMnUvTFFrdSswejJ2d1VJUnc2SWRIeWM3ZXEvYTJva0N2Q29YcGp0?=
 =?utf-8?B?eXpLdU1sNmZPb2ZiamhwMmZtc0FDWXFIZUxSV2FaOHZobm9kblAwdVBTNmhy?=
 =?utf-8?B?bWhkS3BIZFExSDFhaERTbDBhTnRpWFl3U0FpY1UwZDVFSXNOVmNzUnZWYzlJ?=
 =?utf-8?B?dWwyaklKRlBPaFlhR3RwWWR2alpHemdMS3prL0hvWXdXTklaZXB5ZDdUMktu?=
 =?utf-8?B?dmNwR21FVk4yT0RDZ0F6UG50TW5kQ3NLQUZmL3RrMmUrbnR0dDZWSCtyL0ps?=
 =?utf-8?B?SURqRnYyQ2x5dW50bW1NTTN5aEI4cHNVTzV6RmlKUGwxblJXRmxZNDZiRi9T?=
 =?utf-8?B?ZTVTVDI5OGgvVTkvSXJqUlJmRi9uNEx4a01jRFVDREdGZmZ6RGp1dFo3K3JZ?=
 =?utf-8?B?VFVwb201OUZHeHBGcTlOV2xpTXAzanNiRFgzNUFrdEZsSHZ5MFdGZnAxcEtH?=
 =?utf-8?Q?uvGIun?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTdQanRtSlFEaklCRFBEeHQ1aUVzYW43L3Jtc0NIbnFLZGhHUFN5cW9mZ29C?=
 =?utf-8?B?dzFwcTFRemJGYjlIL2ptNlNQRkY2SFZ5MnhpK0xGd3VsR2YycUplN0oyUGFs?=
 =?utf-8?B?NTNOWjlKR21kaDZ6eGlxMlBsZTQ5RkNpODhRQnVON0p1OSsyMyt2alMxQW9v?=
 =?utf-8?B?emtHekI3UFdYR1ZoV3BERlBxdUJyeFgzTWlnU1R6ZVNoclZSREt5RkpXaDdp?=
 =?utf-8?B?YkFFbHVmbXB4QVpJQkx4SjJhZlZxcWFmVDFIWVpVekM5NGVPZ3pKdDdOd3RB?=
 =?utf-8?B?Zi96UGw0U0JWUElJZFJ2MlB3MWxqQUx6YVRiLzdCVVJ2TVVLaHY1T1VwWk4v?=
 =?utf-8?B?YmNhK1NCMXNkT1gwQkJTRUlJMGw2b3hCZDcveTdKbFNZUy8xTiszU3VPZExE?=
 =?utf-8?B?VkplUzVPZ1BMRUEyUUFOUDhkWUJFdGNWSFJ5WCtlMDNTdlROc3VnL3pzendQ?=
 =?utf-8?B?cm1xSVhSakVvaXRiQzNoVjlFcUk1cml1TWNWcEt1cmxrQkVMZ3prKzVuVi9y?=
 =?utf-8?B?M1oySEFYZm54MzlFR0xrMHFDaGc0SldQSStDZ1FNM3FlTXV6R3crWjFkMm5T?=
 =?utf-8?B?S1IwWG9uRzcyVXowQ09TaHpBcnZMSlFubXNQbC9tYmJ4SjAyeDU3emtObHhS?=
 =?utf-8?B?M0o3WkJyTDNUWFlIaWRkREkyaDBRZ0hhaWtuN0ZWU1JtQUFlRjFyUGFpL3Fr?=
 =?utf-8?B?NGRSbzVsM3NwMjcxbGVxc0dBQlk2aWtLNG9SczZvY2RZNWtON25xZDFGODcw?=
 =?utf-8?B?ZEtrZHc5MEZYQ3kwd0E2Q2xha1hvUWFHQWcvUDVlbk9ydDc3QVlFaWY4WmQ2?=
 =?utf-8?B?akRmNXBDd3VMUU1aSU5VUlpUSVlkS0FMejZTeFQ5cUhlWk1JWVZrM2pLYjZo?=
 =?utf-8?B?Z1ZhTFE0RjRNeWtnS2paQmEzM2h4K2thN0xtUmRrbkp1QlZLaWpXdkRtaVVN?=
 =?utf-8?B?bVBRZERvejc4VC83M0Nac0NGcVBlWE1lWXByNStVSDZKOWdQMjRyY1daMkxr?=
 =?utf-8?B?TXYxY2l3WDdkWHVmYlRrTXQ0SHdYL1NZdHV5N2Vlc2NKb1M2U2REdzR5MThw?=
 =?utf-8?B?M0NjcDEzZG9rc0daMVFHWWF4Y3IzMm9qR1RWSlNDWi9XS0JyZGJpeGlwelJS?=
 =?utf-8?B?ZVlRVktHUEhwYXkxNlZlWnZhWHRTaHJES0gzY0VTRkNlVys2S2thc2lYeTcw?=
 =?utf-8?B?VUlwUjh4dGUrb0U4WEIzd2R2UGp3MEROT0lRM2JQTFdhY3kvRi80dTkrNkJP?=
 =?utf-8?B?UHJUbG5XekJobnZyWVVTaEFpWnRYZUxDeGc2Q1YvaS9NdWtvMEZFcytmOGFT?=
 =?utf-8?B?QlBkbEw0QTRkTW4rejBCVVFVOHcvS0hzclJ2UUVHTmFGdkJCYjhvZnpMQmNz?=
 =?utf-8?B?MlQvLzIrc3V3V2pMWGFaUjZiYXhoMmhZU1BCNFZnM3c3UUE4VGxCbXFXbi9O?=
 =?utf-8?B?REZzRGxsMHRGZmxRNGZLTHhIdWdqMzdvVVJXT1Z2Mk1yLytjZnBJNzlqR1RP?=
 =?utf-8?B?UHpqR1U0RHBkSWdqUXdsWlVwRXJjRVJnKzZ2aTJYcnUrNi9TREl6MFh5elJ2?=
 =?utf-8?B?Mk1kelNpZjFHdjRjTlBqVWdiS3pwdmhmWTd4MzFIV2NHZXpaeDl1TU1obVFY?=
 =?utf-8?B?ODFtd1hwdEZVcmpXRG1uUU5aRk11V2EwcnltbHpCMSsvWGlwKzhGMzl6ODN2?=
 =?utf-8?B?aE9XTDJ2NFRvWW9hQk5TcDBWTzZ2SlNsLzBGK1BFOXduRkE1ZkM1ZnFSbmdm?=
 =?utf-8?B?REFZeU1mSGd4dHdyUEZoUnhGU08vZ3lrdjdtdHpqajlsbnR0NUJCZlhobzBl?=
 =?utf-8?B?NTg0SEo0Vld0d0NkQTEwQy9kMTNBMzdURjg0bTVXTjVvcTgvY2FuZTlNbWFX?=
 =?utf-8?B?eUxNKzk1TWViS1BWc2NDZmVFSXFneWhocGxIYzVNaEZOcFJmNHlaTmpuT1F0?=
 =?utf-8?B?YXgxeElNa0hsMGZNREt6MHhOZzRKK3pvUGl4WjJobW9lRkhLcmpoUHZiVWRF?=
 =?utf-8?B?cllGUVAvVldwbDFwb3dUZDRYK0ZUZE9GZmJUSUxPLzZsY0p3Zi9ZeUVkRVNV?=
 =?utf-8?B?QzlTTWUzWTVUZVJPUVRlMDlCOUM0L21CMTZLMDJKKzI3d1NuZzZpd3BmbzFK?=
 =?utf-8?B?R0F6VkZhNjhzbFJRZTQxemdrU0tHa2pKOWtnUnBjQjJxS3l6MDQ5NUgvS3lI?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5A22C0E716E2C4B9E4F89290DEF2D26@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbf73de-6cd6-487c-e8ac-08de17db25ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 17:38:33.4523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTMBg4tWj8kHFDo6cj2kEMMGkiM7WQ0oLOHIOte47Amk1CC9CAPlZdM30UfTZHJAo/ro9ZfuB4Wu7nVw+NjlvbaH9qi7VQux7nQFpCEqcLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDIwOjQxICswNTMwLCBCYWxhc3VicmFtYW5pIFZpdmVrYW5h
bmRhbiB3cm90ZToNCj4gQ2FuY2VsIGFuZCB3YWl0IGZvciBhbnkgRGVhZCBDVCB3b3JrZXIgdG8g
Y29tcGxldGUgYmVmb3JlIGNvbnRpbnVpbmcNCj4gd2l0aCBkZXZpY2UgdW5iaW5kaW5nLiBFbHNl
IHRoZSB3b3JrZXIgd2lsbCBlbmQgdXAgdXNpbmcgcmVzb3VyY2VzDQo+IGZyZWVkDQo+IGJ5IHRo
ZSB1bmRpbmQgb3BlcmF0aW9uLg0KDQovcy91bmRpbmQvdW5iaW5kLw0KDQpBbmQgc2ltaWxhciBo
ZXJlIC0gY2FuIHlvdSBwcm92aWRlIGEgc3RhY2sgdHJhY2U/DQoNClRoYW5rcywNClN0dWFydA0K
DQo+IA0KPiBDYzogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29tPg0KPiBGaXhl
czogZDJjNWE1YTkyNmY0ICgiZHJtL3hlL2d1YzogRGVhZCBDVCBoZWxwZXIiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbg0KPiA8YmFsYXN1YnJhbWFuaS52aXZl
a2FuYW5kYW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2N0LmMgfCAzICsrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gaW5kZXggZTY4OTUzZWYzYTAwLi41MzY0MzNiMDYx
ZmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gQEAgLTE5OSw2ICsxOTksOSBAQCBz
dGF0aWMgdm9pZCBndWNfY3RfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLA0KPiB2b2lkICph
cmcpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d1Y19jdCAqY3QgPSBhcmc7
DQo+IMKgDQo+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0RFQlVHKQ0KPiArwqDCoMKg
wqDCoMKgwqBjYW5jZWxfd29ya19zeW5jKCZjdC0+ZGVhZC53b3JrZXIpOw0KPiArI2VuZGlmDQo+
IMKgwqDCoMKgwqDCoMKgwqBjdF9leGl0X3NhZmVfbW9kZShjdCk7DQo+IMKgwqDCoMKgwqDCoMKg
wqBkZXN0cm95X3dvcmtxdWV1ZShjdC0+ZzJoX3dxKTsNCj4gwqDCoMKgwqDCoMKgwqDCoHhhX2Rl
c3Ryb3koJmN0LT5mZW5jZV9sb29rdXApOw0KDQo=
