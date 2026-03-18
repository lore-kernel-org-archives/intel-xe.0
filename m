Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7D11077604
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 19:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D48B10E731;
	Wed, 18 Mar 2026 19:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2Ip33SV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD2110E731
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 19:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773861466; x=1805397466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=liHWa+1A5w6/4Q61hKuqC0ick48bBMbP2nNu7sgmHtM=;
 b=n2Ip33SVCuCpELbxjeD7wgAUJoyuWi9G4Fe36yJQTxW8CJ7nIOStnoq1
 3TJdfF/i8Jp08BZUWganEZBoUYWIEbMDHynFqrRsnbxhz0+R+ycUioZnF
 iGJFv+pfDckowKcek88CjcpKXfvXDvR6Is1/fd4//p971+QcuTYy9N9cD
 gqsV1WI+lp5oKwmzNN3HfTSuc0m1fvlsjf72VouftNMRrMGzqhmAdVAWw
 +/JWEtJx1EJSpggGmIZlvYd9MX1s8a6IWab6NO12aLlpSU0fMXTeAol3H
 kJW2T8v/2v0UlYIrL3NnEq2CkmyIUe3wQHqezmKa5tkreBZDUFOluQuIy A==;
X-CSE-ConnectionGUID: hglWwiPySNym3mUdQFO/Sw==
X-CSE-MsgGUID: jHsy95dxRx+hOK27uLJzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86286158"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="86286158"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:17:45 -0700
X-CSE-ConnectionGUID: bHzTvwr9QJS1kDK1SBEnrQ==
X-CSE-MsgGUID: YQRNoDvpSgyvf+eukKJUtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218261492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:17:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 12:17:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 12:17:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 12:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gA2V9UmW3m0wiZYAbDvA87+hTR+QycKsV7nqdFt4nAOhkR+iM5vA7E22ZdAsPgLZem3m4gHRMMRoebvaFnTfg0RyxAOTcIOAzGTt6JSOfau7HJzNBLO7JTEK/x6KEMfifk09GiqzkkQmMbqqykUuhpAFisXYkjTBz5Ki2WyUeY3v+/r2DktmkuXihapgF1Il1SpPpwuEw92oHao8+O0I3eB9gQFKB8qP3llJ1mnhXTxjffRqxqiBw+sxduecAw6CVvg24Hbxl8zsPMmcO7vYK7z+i+fT7S8APL83Q4Y/5+2Clcd9zeIhnZn8IQJuNP8ntvcSviskgFWrVgBEUtfA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liHWa+1A5w6/4Q61hKuqC0ick48bBMbP2nNu7sgmHtM=;
 b=W4tn6FgC1J0fCYJ6xPnDLmcBpYSm0bkdTiIT/qQRFT1Cq5HWW8zkPkw9nbd8jVaQuU6F0pBiltv4UZoYHX9w4YUs6Uxd64iG+NkYNiCdPMedJ8G23hiwrcTM18hgEBRg+1Bs/Gw2Txnf3R1lTFD2TARGF890VySZL7knAdEV6cKx/YL7MJsWDu/SESRLGNm5o+a0hZZ17LG9Ou7lVKjDlTOtvE0ChsRl4TuHN1HVVJf/T+qIYqWlUMJeKvipp0Ieeq76WH7vZFepIc/JnWlDIXp4B3A/T30BzdNdu3aKOFZhmoVkU6FH+ftvDV0pvZRUR954Q+5DN1U+HqoAGqi63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 19:17:38 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 19:17:38 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v22 00/12] AuxCCS handling and render compression modifiers
Thread-Topic: [PATCH v22 00/12] AuxCCS handling and render compression
 modifiers
Thread-Index: AQHctVm94o5Bsotpmk+RTdX8tXYKBLW0rESQ
Date: Wed, 18 Mar 2026 19:17:38 +0000
Message-ID: <DM4PR11MB63608C7C7FA2AF73DBF05F3BF44EA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ0PR11MB8293:EE_
x-ms-office365-filtering-correlation-id: 93a3f8a1-ac75-4681-aa0b-08de852304c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: CUOGcfmTZDiI0wTdgoUpywHU2vtiMCarTQZ3TPMrR3YGjynySoplayOP3IZ8GfdZDSAKNMWUYHU5M8HQZ8cOy0GnE02XIxMUSKM2HO+6r4CWTCjyyHv78ErkzygntKb2dL2xEbMO3UPUQBpKRS2uq4c5wltCMXt93yJ/iUhCzFxVBoeEC9YISnGU8cx4rLoL/Kh31kIVkTAQ88ldjmpuDlKATq0UI3umH3tnHosjhAn8Qm2kUujoNx4l5WohDhmIUvLjEjJlIAIRvGFCfx/EsJahYRimmskZoEclhXXjk15Yr+UvGfDGLBAlKwWORJT0nYbbdVpQcWfat8pfMTusiF9//smhC5P8FGQgHkkDUTqNCLJn+KtKjTJalC+mryGtwRO0S1p65aXInUeVPlc7+mXYpkctZ+nMriBL6CGMuHopXr8dS3Fzy4dCz68lu9SqmHovNETjuMFnDwA81aZgYGzN0b4HWNR+oFi8QSYXUjCCVvjm0Aj5s29Vgl/bc8tScbF6zJsOB+WLZ7uwWmuIXwE+BVZcRlpv0cwg5budaTiHUeXVdBMZCYncikAudfukZu816Wy6Ui3XWjw6uAFILPCj2+31jRl+Cs/91zEuVLwsZYJf8J0tsURgV9Fl4ycSu5y1NgjSNnpNJzJb3hVjCVOw8ftCvPUyvl6r7VSPgsrYXpJIJWoArDHYn9AcZHX83xsqqx1i8IYS+qRlTMSjIxBByogmkI9OnNE9tB6qYufw7zTHzzKR4LYQt/33LRp3q1E6i90+xHYDYJ7OkkkXBCRDKRAbcLkOkRwe+bzH2fo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUFydEx4b2JDVjJKanJEZlZWK09jZGc1eFh0RkMvZmE5eUtNaktQcmNCUjYz?=
 =?utf-8?B?RlNzbDZ3SmdlUThJVjNGb1pZWERDT2MrNGpEaUlUK3hMc1VMM3o0M1lUb3ZQ?=
 =?utf-8?B?eUk3MVV2cTlmMXRkNDBVeVpxMVc1b2VyT3RIV1lOQUpNQnphQ0lrNWxkTmRy?=
 =?utf-8?B?UTV5RWtqOEFqQXhSNzREdGJyWHJQbEkvaFlvMjJTYnN0S1FQQmZBNCtLLzEv?=
 =?utf-8?B?bExwb09Gc3BpdUo1OWZ6aXZPcHIzb1NtVElaLzJmMm9RempIZFl4N3U0cGls?=
 =?utf-8?B?K0RWWGFZZVU1SlR4TVZyTEplWHZKUG51QlowNmRDNHl6MFk1alFGMTUrVkxJ?=
 =?utf-8?B?ZVlWSlVrcm56ZkRwcHRWZTgxMnorZDN1cTI4UFRxbk8xZmxDdVNLc2tZL3Ri?=
 =?utf-8?B?M1l2eHI4TjY2ZEgySTBTTFFhT3VYSFJQdjBYTDFtUndnQzN6M1JKM2owTnNt?=
 =?utf-8?B?VVVMZGk1MTNpWUQxcDVaQTFoNitrMThBSkFZT3hnVzlPUE15aG50TW5rclRr?=
 =?utf-8?B?a1ozcWFKbU9NdC9jRmdoNEdFMjlhN2tGYUhUb2toN1NoQ3dLenFGd0FTMFpa?=
 =?utf-8?B?c1o3MmtuMTVnMG5qNXRmbHpoRG4vSGtzMUU2QTIzMU5JcHZUak1EbGw5ekNv?=
 =?utf-8?B?ejBBbHQzODhoYllVSEhkR292T3lZdzgybGo0VHRtOVVlS3hRRkVnV0FVbmdn?=
 =?utf-8?B?emtwK3BhZGVYRjRRTG50dFNCdDR2Y2F3c0FrN1dvZFk1NUxnUkl6MlJMZ0Y4?=
 =?utf-8?B?eXk2Qml5bXFtaXVWczV6b1RmeVFYemxFZzlhWFhoYWdxcVpKNHd2cGxYUVpP?=
 =?utf-8?B?eWpVV3VVbnU5UFRoUjJScytHOStqUTBWL3E3MWNNSkFPMGp4OU1PT29udG0x?=
 =?utf-8?B?aktDOHRBV1ptanhSQTBJUDJQQkI5Y3NXbzgzVE40UXlVOW9jUTVUeFdHTzRx?=
 =?utf-8?B?TlF5ZURRQUlHK0EyVktwTDVBU3REM2xjVXcrRU8vNVdSQys3dGZoOXpiMFV4?=
 =?utf-8?B?QW5QU0VTNXpjSVhUcFVGOHpOTHE0NXpoWXA3UlBYU2VzMERZSkxKQzBOY3lv?=
 =?utf-8?B?RnVPY1RpelpPcFRQUXNXeHQ3YlZ5dkdTL1RuVVZRRWF3ODRqOXdFZEY0KzYy?=
 =?utf-8?B?QStDL3BGS2I3K0Y3MWw0KzJNUWxxTFU3SjhNdmlKL0lPSG0rRlNGaUV4TnV4?=
 =?utf-8?B?ODJZQ2ZyQ0JrT0hRWmdZY2UxRTZ6d05Fd0VKNmNBSmpWQ25vOEZJK1h1Uzhu?=
 =?utf-8?B?amRtajM2aUF4aFNhRmJFUCszMURmVCsvY1RodUlIU3U1SVc0ZmdPTXhpeW9Y?=
 =?utf-8?B?djVOcURFRXV3Tzd4RTkvTGVjVU84MGdScUcrK3dGRy9zVnpWTUFjaDRmZkNx?=
 =?utf-8?B?MytJa1A5ZEhyVVBRbFNsR3NscmJlTVFpaFlIczZ3Y01TcFc4Tmh4bUVyZEhI?=
 =?utf-8?B?TWRRTzNUNHdqVWg4WXJsWXZER2lBZ3lJZDFYRTR4RFdDODkyWmNheHR4dldW?=
 =?utf-8?B?c01oK3YwM0djUG04YkswaU55MXhQTysvdGhGbCtUdGhtbkY2anM0TG1UYWFh?=
 =?utf-8?B?L0gvMUdnVTd1dmNsL2hkd2tBdFNENHRsU3VXNEQ2NUp3VWY2K3MyTEZnYTA4?=
 =?utf-8?B?WFFLcFhvczFoZVpuTjNuWXlvMVdiT2NPVWgwd0JCY21rUjk0alpTdWRtU3F1?=
 =?utf-8?B?d0xJZ3FISGVybE9hdi9xbU1HeVdJeE03RFRvaEFLVmpTK3dlVFoxeWUyTWhj?=
 =?utf-8?B?cWNQcGRSdUJlZU9YaWFkRFZFVFZLbURvYlZSNEN5QisrdTR3SU55S3JHL2gz?=
 =?utf-8?B?cXBYREtrdTJ6MmRRNHJlUXdQckpVR3VlakU3dXh3SWFsZy9XcFdweXI3b043?=
 =?utf-8?B?eWJSQ3RpdStPTU5aa1FEUDREUzM2czRMOGRLNFcvb1hXdy9yY3F4Zi9SYnRn?=
 =?utf-8?B?MTFSZUk3dVNzSnREc05PU3pPeXA0aytEaWc0VEFldGE4TDkralJDTkZmWS9y?=
 =?utf-8?B?Z1Vla0M3UHZSdnNCT2l5VUFtbllPblBKMGhnamdEZ1VIMGtxSDgrS21sbmFi?=
 =?utf-8?B?VkdiRmRGcnNadG02V09YMGY1NzRQTlhlQitLOHprVXhPMG1YM0gxMFhBN2Uy?=
 =?utf-8?B?bHhmdW9ZS2VDcUtSckxPa1BDZC9ZS3J1b0RhUk1pMzZiOWlMaXZOY3AxK2Fy?=
 =?utf-8?B?VFpiTlNwS2tyczFHN1FDUTd5QStJS1BDS2d0bU1jbC8vaEpKcFY2SVpRaU5R?=
 =?utf-8?B?QSs5b2t3VG5JN1c4eFV4bW03bFIyWHUxby9rVGdZelZVQnlvazI1Qi81c1ds?=
 =?utf-8?B?cDhaTkl2bmVZUm84elNqQm9QY09GdFZLRDhEZlRiMHYwN0RHbmRrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TP7QNXg1kzxZtO38N3ZrV2+0rH5a/TrHKYe3hXFiXLjsJ2DuAvB2nGcxyaXazDZ/N44ZEoa0zu2cme7/qLW1UkL1aemAlLptiJpHAd1sIbXWomeXzSr0dxE7Y0yGmxRyeSbrpVBQmoPqCBzdlTtwEQtBIyhaC9BFFLQNYF14VAKpd1YCC2Sb6/ViXuSnWQ4krAJfItGGoqrd6dvmue358OcrIh9TOMe75FMZFP78NNsWAE7qQaoduOqjz3FX49GuwD7NCWSSaN98/hjLBm/ghUG9dHYeD7cn/8dXYnRDWbQey2c7zdTdXp1UOd/ltkK2LuhfVpkDHmdWFCrRRaUTfw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a3f8a1-ac75-4681-aa0b-08de852304c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 19:17:38.2666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21NvC2149t4QdxtXgIy9p9P0YQppBJ01sbDKezMtoa7b0akwbsn2eDmS08GJF8KC8/QtaQcQmMZpIeooK/iC7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTYsIDIw
MjYgODo1OSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBr
ZXJuZWwtZGV2QGlnYWxpYS5jb207IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PjsgVHZydGtvDQo+IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+OyBWaXZpLCBS
b2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIyIDAw
LzEyXSBBdXhDQ1MgaGFuZGxpbmcgYW5kIHJlbmRlciBjb21wcmVzc2lvbiBtb2RpZmllcnMNCj4g
DQo+IEEgc2VyaWVzIHRvIGFkZCBzdXBwb3J0IGZvciBjb21wcmVzc2VkIHN1cmZhY2Ugc2Nhbm91
dCB1bmRlciB4ZSB3aXRoIEFsZGVybGFrZS0NCj4gUC4NCj4gDQo+IEN1cnJlbnRseSB0aGUgYXV4
aWxpYXJ5IGJ1ZmZlciBkYXRhIGlzbid0IG1hcHBlZCBpbnRvIHRoZSBwYWdlIHRhYmxlcyBhdCBh
bGwgc28NCj4gY2Y0OGJkZGQzMWRlICgiZHJtL2k5MTUvZGlzcGxheTogRGlzYWJsZSBBdXhDQ1Mg
ZnJhbWVidWZmZXJzIGlmIGJ1aWx0IGZvciBYZSIpDQo+IGhhZCB0byBkaXNhYmxlIHRoZSBzdXBw
b3J0Lg0KPiANCj4gT24gdG9wIG9mIHRoYXQgdGhlcmUgYXJlIG1pc3NpbmcgZmx1c2hlcywgaW52
YWxpZGF0aW9ucyBhbmQgc2ltaWxhci4NCj4gDQo+IFRlc3RlZCB3aXRoIEtERSBXYXlsYW5kLCBv
biBMZW5vdm8gQ2FyYm9uIFgxIEFETC1QOg0KPiANCj4gICBbUExBTkU6MzI6cGxhbmUgMUFdOiB0
eXBlPVBSSQ0KPiAgICAgICAgICAgdWFwaTogW0ZCOjI0Ml0gQVIzMCBsaXR0bGUtZW5kaWFuDQo+
ICgweDMwMzM1MjQxKSwweDEwMDAwMDAwMDAwMDAwOCwyODgweDE4MDAsIHZpc2libGU9dmlzaWJs
ZSwNCj4gc3JjPTI4ODAuMDAwMDAweDE4MDAuMDAwMDAwKzAuMDAwMDAwKzAuMDAwMDAwLCBkc3Q9
Mjg4MHgxODAwKzArMCwNCj4gcm90YXRpb249MCAoMHgwMDAwMDAwMSkNCj4gICAgICAgICAgIGh3
OiBbRkI6MjQyXSBBUjMwIGxpdHRsZS1lbmRpYW4NCj4gKDB4MzAzMzUyNDEpLDB4MTAwMDAwMDAw
MDAwMDA4LDI4ODB4MTgwMCwgdmlzaWJsZT15ZXMsDQo+IHNyYz0yODgwLjAwMDAwMHgxODAwLjAw
MDAwMCswLjAwMDAwMCswLjAwMDAwMCwgZHN0PTI4ODB4MTgwMCswKzAsDQo+IHJvdGF0aW9uPTAg
KDB4MDAwMDAwMDEpDQo+IA0KPiBEaXNwbGF5IHdvcmtpbmcgZmluZSAtIG5vIGFydGVmYWN0cywg
bm8gRE1BUi9QSVBFIGZhdWx0cy4NCj4gDQo+IEFsbCBJR1RzIHBhc3MgZm9yIG1lIGxvY2FsbHku
DQo+IA0KPiB2MjoNCj4gICogTW9yZSBwYXRjaGVzIGFkZGVkIHRvIGZpeCBrbXNfZmxpcF90aWxp
bmcuDQo+IA0KPiB2MzoNCj4gICogUmViYXNlZCBhZnRlciBzb21lIGNsZWFudXAgcGF0Y2hlcyBm
cm9tIHYyIHdlcmUgbWVyZ2VkLg0KPiAgKiBBZGRlZCBwZW9wbGUgdG8gQ2MgYXMgc3VnZ2VzdGVk
IGJ5IFJvZHJpZ28uDQo+ICAqIEFkanVzdGVkIGxhc3QgcGF0Y2ggdGl0bGUuIChSb2RyaWdvKQ0K
PiAgKiBBcHBseSBHR1RUIGZsdXNoaW5nIG9ubHkgdG8gaW9tYXBwZWQgc3lzdGVtIG1lbW9yeSBi
dWZmZXJzLg0KPiANCj4gdjQ6DQo+ICAqIEFkZGVkIHBhdGNoIGZvciBwb3RlbnRpYWxseSBtaXNw
bGFjZWQgV2FfMTQwMTY3MTIxOTYuDQo+ICAqIEZpeGVkIChob3BlZnVsbHkpIE1BWF9KT0JfU0la
RV9EVyBvbiBNZXRlb3JsYWtlLg0KPiANCj4gdjU6DQo+ICAqIFNwbGl0IG91dCByaW5nIGVtaXNz
aW9uIGNoYW5nZXMgdG8gc21hbGxlciBwYXRjaGVzLg0KPiAgKiBGaXhlZCBNQVhfSk9CX1NJWkVf
RFcgZXZlbiBtb3JlLg0KPiAgKiBEb24ndCBlbWl0IE1JX0ZMVVNIX0RXX0NDUyBvbiAhQkNTLiBU
aGlzIHNob3VsZCBmaXggTWV0ZW9ybGFrZS4NCj4gDQo+ICB2NjoNCj4gICogQWRkZWQgQXV4Q0NT
IGludmFsaWRhdGlvbiB0byBpbmRpcmVjdCBjb250ZXh0IHdvcmthcm91bmRzLg0KPiAgKiBBbHNv
IGFkZGVkIHRoZSBpbmRpcmVjdCBjb250ZXh0IGhhbmRsaW5nIGFuZCBzb21lIG90aGVyIHdvcmth
cm91bmRzLiBUaGV5IGFyZQ0KPiAgICB1bnJlbGF0ZWQgYnV0IHRoZSBzZXJpZXMgZGVwZW5kcyBv
biBpdC4NCj4gICogRHJvcHBlZCBEUFQgcGluIGFsaWdubWVudCByZWR1Y3Rpb24gc2luY2UgQk1H
IGFwcGVhcnMgbm90IHRvIGJlIGxpa2luZyBpdCBmb3INCj4gICAgc29tZSByZWFzb24uDQo+IA0K
PiB2NzoNCj4gICogUmViYXNlZCBvbiB0b3Agb2YgcmVjZW50IHhlX2ZiX3Bpbi5jIHJlZmFjdG9y
aW5nIGFuZCBhbHNvIHRoZSBpbmRpcmVjdA0KPiAgICBjb250ZXh0IHdvcmthcm91bmRzIHNlcmll
cy4NCj4gDQo+IHY4Og0KPiAgKiBSZWJhc2VkIGZvciBiby0+c2l6ZSByZW1vdmFsLg0KPiAgKiBD
b3JyZWN0ZWQgUElQRV9DT05UUk9MX0ZMVVNIX0wzIHRvIGJpdCAzMC4gKEpvc2UpDQo+IA0KPiB2
OToNCj4gICogRml4ZWQgZmIgcmVtYXBwaW5nIGNoYW5nZXMuDQo+ICAqIERyb3BwZWQgdHdvIG5v
dCByZXF1aXJlZCBwYXRjaGVzIGZyb20gdGhlIHNlcmllcy4NCj4gICogRml4ZWQgY3JpdGVyaWEg
Zm9yIEdHVFQgZmx1c2hpbmcuDQo+ICAqIExpbWl0IGNsZmx1c2ggdG8gdGhlIGNvbXByZXNzaW9u
IG1ldGFkYXRhIGFyZWEuDQo+ICAqIFJlYmFzZWQgZm9yIGluZGlyZWN0IGNvbnRleHQgd29ya2Fy
b3VuZHMgbGFuZGluZyB1cHN0cmVhbS4NCj4gDQo+IHYxMDoNCj4gICogUmViYXNlIGZvciBYRV9H
VF9XQSgpLg0KPiANCj4gdjExOg0KPiAgKiBEbyBub3QgdXNlIHN0b2xlbiBmb3IgRFBUIG9uIElH
RlggKyBBdXhDQ1MuDQo+IA0KPiB2MTI6DQo+ICAqIFJlYmFzZWQgZm9yIHNvbWUgcmluZ2J1ZiBh
bmQgTFJDIGNvZGUgY2hhbmdlcy4NCj4gDQo+IHYxMzoNCj4gICogUmViYXNlZCBmb3IgdmFyaW91
cyB1cHN0cmVhbSBjaGFuZ2VzLg0KPiAgKiBEcm9wcGVkIGNsZmx1c2ggYW5kIHN0b2xlbiBhdm9p
ZGFuY2UgcGF0Y2hlcyBhZnRlciBtZXJnaW5nIElHVCBNT0NTIDYxDQo+IHVzYWdlLg0KPiANCj4g
IHYxNDoNCj4gICogTU1JTyAweDQyNDggYW5kIE1JX0ZMVVNIX0RXX0NDUyBhcmUgTVRMKy4gKE1h
dHQpDQo+ICAqIENvbnNvbGlkYXRlIGVuZ2luZSBmZWF0dXJlIGNoZWNrcy4gKFZpbGxlKQ0KPiAg
KiBCcm91Z2h0IGJhY2sgdGhlIHBhdGNoIHRvIHB1dCBEUFQgdGFibGVzIGluIHN5c3RlbSBtZW1v
cnkgZm9yIDEwMCUgQ0kgcGFzcw0KPiAgICByYXRlLiBJdCBsb29rcyBsaWtlIE1PQ1MgNjEgaXMg
bm90IGVub3VnaCB0byBhdm9pZCBzcG9yYWRpYyBwaXBlY3JjDQo+ICAgIG1pc21hdGNoZXMuDQo+
IA0KPiB2MTU6DQo+ICAqIExpbWl0ZWQgdG8gZW5hYmxpbmcgb24gQWxkZXJsYWtlLVAgb25seS4g
KERyb3BwZWQgYWxsIE1ldGVvcmxha2UgcGF0Y2hlcy4pDQo+ICAqIERyb3BwZWQgdW5yZWxhdGVk
IEdHVFQgYWxpZ25tZW50IGZpeC4gKFNlbnQgc3RhbmRhbG9uZS4pDQo+ICAqIFVzZSBkaXNwbGF5
IHBhcmVudCBpbnRlcmZhY2UgZm9yIHByb2JpbmcgQXV4Q0NTIGRyaXZlciBzdXBwb3J0Lg0KPiAN
Cj4gdjE2Og0KPiAgKiBVc2Ugd3JpdGUtY29tYmluZSBmb3IgRFBUIGluIHN0b2xlbiBtZW1vcnku
IChWaWxsZSkNCj4gICogRHJvcHBlZCBjbGZsdXNoIHBhdGNoZXMgdW5kZXIgYXNzdW1wdGlvbiBw
cmUtcHJvZHVjdGlvbiBBREwgbWFjaGluZSB3ZXJlDQo+IHRoZQ0KPiAgICByZWFzb24gZm9yIHNw
b3JhZGljIHBpcGVjcmMgZmFpbHVyZXMuDQo+IA0KPiB2MTc6DQo+ICAqIE1lY2hhbmljYWwgcmVi
YXNlIGZvciB1cHN0cmVhbSBjb25mbGljdHMuDQo+IA0KPiB2MTg6DQo+ICAqIEFkZGVkIGEgcGF0
Y2ggdG8gcmVuYW1lIFhFX0JPX0ZMQUdfU0NBTk9VVCB0bw0KPiBYRV9CT19GTEFHX0ZPUkNFX1dD
LiAoUm9kcmlnbykNCj4gICogSW5zdGVhZCBvZiBleHBvcnRpbmcgYSBoZWxwZXIgZnVuY3Rpb24g
Zm9yIGVtaXR0aW5nIHRoZSBhdXggaW52YWxpZGF0aW9uDQo+ICAgIGludG8gdGhlIHJpbmcsIGFk
ZCBpdCB0byB0aGUgcmluZyBvcHMgdmZ1bmMgdGFibGUuIChNYXR0aGV3KQ0KPiANCj4gdjE5Og0K
PiAgKiBUd2Vha2VkIGNvbW1lbnRzIGFuZCByZW1vdmVkIHNvbWUgc3RyYXkgaHVua3MgZnJvbSB2
MTcuDQo+IA0KPiB2MjA6DQo+ICAqIEluY2x1ZGUgPGxpbnV4L3R5cGVzLmg+IGZvciB1MzIuDQo+
IA0KPiB2MjE6DQo+ICAqIEZvcndhcmQgZGVjbGFyZSBzdHJ1Y3QgeGVfZ3QgdG8gZml4IHN0YW5k
YWxvbmUgaGVhZGVycyB0ZXN0Lg0KPiANCj4gdjIyOg0KPiAgKiBTcGxpdCB1cCAiZHJtL3hlL2Rp
c3BsYXk6IEFkZCBzdXBwb3J0IGZvciBBdXhDQ1MiIGludG8gZm91ciBwYXRjaGVzIGZvcg0KPiAg
ICBlYXNpZXIgcmV2aWV3Lg0KPiANCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4NCj4gDQo+IFR2cnRrbyBVcnN1bGluICgxMik6DQo+ICAgZHJtL3hlOiBSZW5hbWUg
WEVfQk9fRkxBR19TQ0FOT1VUIHRvIFhFX0JPX0ZMQUdfRk9SQ0VfV0MNCj4gICBkcm0veGU6IFVz
ZSB3cml0ZS1jb21iaW5lIG1hcHBpbmcgd2hlbiBwb3B1bGF0aW5nIERQVA0KPiAgIGRybS94ZS94
ZWxwZzogTGltaXQgQXV4Q0NTIHJpbmcgYnVmZmVyIHByb2dyYW1taW5nIHRvIEFsZGVybGFrZQ0K
PiAgIGRybS94ZS94ZWxwOiBRdWllc2NlIG1lbW9yeSB0cmFmZmljIGJlZm9yZSBpbnZhbGlkYXRp
bmcgQXV4Q0NTDQo+ICAgZHJtL3hlL3hlbHA6IFdhaXQgZm9yIEF1eENDUyBpbnZhbGlkYXRpb24g
dG8gY29tcGxldGUNCj4gICBkcm0veGU6IE1vdmUgYXV4IHRhYmxlIGludmFsaWRhdGlvbiB0byBy
aW5nIG9wcw0KPiAgIGRybS94ZS94ZWxwOiBBZGQgQXV4Q0NTIGludmFsaWRhdGlvbiB0byB0aGUg
aW5kaXJlY3QgY29udGV4dA0KPiAgICAgd29ya2Fyb3VuZHMNCj4gICBkcm0veGUvZGlzcGxheTog
TW92ZSByZW1hcHBlZCBwbGFuZSBsb29wIG91dCBvZiBfX3hlX3Bpbl9mYl92bWFfZHB0DQo+ICAg
ZHJtL3hlL2Rpc3BsYXk6IENoYW5nZSB3cml0ZV9kcHRfcmVtYXBwZWRfdGlsZWQgZnVuY3Rpb24g
c2lnbmF0dXJlDQo+ICAgZHJtL3hlL2Rpc3BsYXk6IFJlc3BlY3QgcmVtYXBwZWQgcGxhbmUgYWxp
Z25tZW50DQo+ICAgZHJtL3hlL2Rpc3BsYXk6IEFkZCBzdXBwb3J0IGZvciBBdXhDQ1MNCg0KSGkg
VHZydGtvLA0KSXQgc2VlbXMgSSBhbSBub3QgZ2V0dGluZyBhYm92ZSAyIHBhdGNoZXMgaW4gbXkg
bWFpbGJveCwgYWxzbyBmb3Igc29tZSByZWFzb24NCnRoaXMgc2VyaWVzIGlzIG5vdCByZWZsZWN0
aW5nIGluIHBhdGNod29yay4NCg0KQ2FuIHlvdSBhbHNvIGNoZWNrIG9uY2UgYW5kIHJlc2VuZCBp
bmNhc2UgYW55IHNlcnZlciBnbGl0Y2guIFdvdWxkIGJlIGdvb2QgdG8NCmhhdmUgb25lIGZ1bGwg
Q0kgcnVuIGFzIHdlbGwuDQoNClJlZ2FyZHMsDQpVbWEgU2hhbmthcg0KDQo+ICAgZHJtL3hlL3hl
bHA6IEV4cG9zZSBBdXhDQ1MgZnJhbWUgYnVmZmVyIG1vZGlmaWVycyBvbiBBbGRlcmxha2UtUA0K
PiANCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L2ludGVsX2ZiX2JvLmMgICAgICB8ICAg
NiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkvaW50ZWxfZmJkZXZfZmIuYyAgIHwg
IDEyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5LmMgICAgICAg
fCAgIDggKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2RzYl9idWZmZXIuYyAg
ICB8ICAgNCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMgICAg
ICAgIHwgMTE2ICsrKysrKysrKysrKystLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3Bs
YXkveGVfaW5pdGlhbF9wbGFuZS5jIHwgICAyICstDQo+ICAuLi4vZ3B1L2RybS94ZS9pbnN0cnVj
dGlvbnMveGVfbWlfY29tbWFuZHMuaCAgfCAgIDYgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2JvLmMgICAgICAgICAgICAgICAgICAgIHwgIDE1ICstLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmggICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfbHJjLmMgICAgICAgICAgICAgICAgICAgfCAgMjMgKysrKw0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgICAgICAgIHwgMTA2ICsrKysrKysrKysrKy0tLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wc190eXBlcy5oICAgICAgICB8ICAgOCAr
LQ0KPiAgMTIgZmlsZXMgY2hhbmdlZCwgMjM3IGluc2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygt
KQ0KPiANCj4gLS0NCj4gMi41Mi4wDQoNCg==
