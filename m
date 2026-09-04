Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B5C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 15:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036910E1D5;
	Fri,  4 Sep 2026 15:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnN0cwNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0F910E1D5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788535170; x=1820071170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d+QfHPQog3denBZzujW031oXlKS48bOW0vFG1lCoZZM=;
 b=SnN0cwNhtsh+4KXbADb5JHwWsKQ/hJDlgp3wO9bMd9nD/suzhl+brveQ
 Q7Z1fJggJft0rZ2c0A9+zCEBxHM0qzuFoDVplwmhg6rfwSp5z6I/jXEst
 W7e3pF5R0pu9MVpY2ZHGgsURcs/qPv+HTADU2ecpYkTM/nmCYLXB+RaBj
 psNLGHNs+F9BE0UDCtgbW4Z4D0w8YgCgnJk1tnZcnLy2mWRXZ2TLIfcfG
 hCzvnZVxcj/OB7S4/NAj7yneE6E3gmivthYw7e4bDKIZr7fTRqJ6EF24j
 Fs94MZjd5QOAquAD2aXQ9rjvP5n555/EUmO+4WhxEUVo3mRaAnFSRmiQx A==;
X-CSE-ConnectionGUID: zy1wsf7VTxm6/MX+otxqLA==
X-CSE-MsgGUID: Hjt2ylr7TYKIW4PwKSnxiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106408729"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="106408729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:19:29 -0700
X-CSE-ConnectionGUID: yD5UPFMVSv2mRfTJY18+9w==
X-CSE-MsgGUID: FFeUKufST9qYnM/WM5GOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="265717034"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 08:19:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 08:19:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 08:19:30 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 08:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wp6dLipEXybXrbBYhDNIDxtHDoQBNBOT9MNUgRlQJ/D/ceFj6c4TZc2rERARaJMCv8RDcaUmLcMhOup7JlXfeWe9Ph55aoDOdOCgPDSteRIN7zBUE0YZjsy5C7+jdODWUEZ69QSQyYTwsfLGz/vGlZnuv9+BiKULDrF1ZmtMcgqTHuhM5WPd7dTLG+HlPr01+H+7wxUDh5Phs4gudkEb06th0O4dzVgmhezfxOtD6SAMKlAIKLiz1BnF++Gf4d4HHu78fiiSx0O+60cOdpohTlCy0dD8//9JFZMnVscv05JoSxbxbQd3mT2aw0SN5zI7aGOmm8WmNcznv+svAloScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+QfHPQog3denBZzujW031oXlKS48bOW0vFG1lCoZZM=;
 b=FvF4fiN0w5PJ4hANPrfFSFPKP6IkefrmZZ5FW3hL+yeN3JEJco/WCcPkG1vjVupqaEOp4cAo/nGZ1AV3znMWu/d54TDHq8Vr5/rSum5X7Yx1KNFUpDEflMNX7cBI9wn7giWyKQAmqJJWecGFJK4JVPPJJNRGBf0oDqCGPNP25tQ50FUmO0UADKVPDdSizSK8NK/xofadZ9ZO+LIJugbGpjJrq7WRrtog7pvqEM8+KZ7jhXF1/2SMqw81MdVkARrZOcXXAPCeHGTp0t3lRIwJ0GOo1AnwkmqPIF2TCKN42iOO/MZmIBmc89ind9UWBDHu4oVlBVdW5MWJv3DsnidcFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by CO1PR11MB4961.namprd11.prod.outlook.com
 (2603:10b6:303:93::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 15:19:27 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 15:19:27 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v8 2/2] drm/xe/sysctrl: Add helper to check oCode firmware
 readiness
Thread-Topic: [PATCH v8 2/2] drm/xe/sysctrl: Add helper to check oCode
 firmware readiness
Thread-Index: AQHdPHRIg7dZIgz2CE2IfL59woOWkba+iJTA
Date: Fri, 4 Sep 2026 15:19:27 +0000
Message-ID: <CH3PR11MB046149A9C630BDF129135EFC9EC1B52@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20260904134935.674507-4-anoop.c.vijay@intel.com>
 <20260904134935.674507-6-anoop.c.vijay@intel.com>
In-Reply-To: <20260904134935.674507-6-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|CO1PR11MB4961:EE_
x-ms-office365-filtering-correlation-id: dbcdd69e-8ee0-4efe-489f-08df0a97e92b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|10067099003|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: datNsaBB+9hywMHGBIKUrgtvpWcBVMAsQd+H9Ya19REIwwZJCJiZMEp7NNDYsB3eSf1v1Z8pVm3o+owWXs3L7BW59geC8bupZZqJkz+itV/aWyChMKn3gCLmgF6sGR2pzS99FU+nhrA+weJx9K4xqWd0DaGSxcdH+A1wptEVyk/Lk+XlyFiasVP+eLYf0VShnRlz59W3aNMjqyt8qBiSg0aLF3GobYB5vODiu7D0J1KP+zQYbr3f62L0cu0zgqOvSnrMRBwfuhj7XMJvvpVVmR2E5KaUSpzOOZS/ZzZBsl8uvttZiduwcB/Vi6M0v34wicusOhiaBYft5pcVaCYa0rzcmIbTDqMpDmFGSwJ5LQSUJaNjuuM+cb0lKct7IaQcapQ6q2tjJSp4+xN7lNUDaH4+lCEqrQyDeiuiSRFkHHrSJPD2oSaSJERxLdjf0EI7+0pWMLhxMUdAmahhTlBxvPQBL+rF5eu1Ys6KxROe1zIgTrEZOhtpWjFFK6zuYjxt7AebrwXu/KvJ/o1gak5EyASUo/Fhee3QGWkHx+PMx1eLHJ4JWAlx08W8aL/bulpKv1T0WUYM5Cd24TCAAK/fmMGmlDL3UnYSZ4ZsAhhyw8DSGhWDo/BHUWBPoVDAzGl528RjyC4t8aJ1nIm5xwGS14ZULjL+VR8gKpwGrSf4gQtLG+lOm1dZOeGytq8u2EklvpTtDmHI0XiskBCzj5CEYJEfhugWeSYgFpHLW1ZdTIk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tmo3YXlsS2lVQytObk1YWXcwR282bjFadGw4eTV0dmU5SWlOTDZPRGZMdUhs?=
 =?utf-8?B?V0FYQ0Q0QzBCTUF3Zjg3eXVKWlRUS2V5RGNQMXZrbEYxRjNYdkZaTnUxdVFM?=
 =?utf-8?B?ZlRkZHhEcWxaeGlCbFBNUi9PZStpYjZ6UkNRdDVidlhPTTBkL1RndUVRdXJx?=
 =?utf-8?B?N3M5cjNnTmJzVjFqaDJ5Q3cwcVp3dDNGaGo5ZDNhdnY0MjdVTUFZcFVGSHkw?=
 =?utf-8?B?RVJFMFBDTG5DVmtJdUxwSGtyeEFiYkhxSjZ1a3dJSHRsK3NKTDJqdTdDU3dt?=
 =?utf-8?B?OUhsK01WdFpUYmpPRHFyYnZhWS93QjMxSUtCbzZTQjZIR1k0THJzazdZcnBs?=
 =?utf-8?B?cUQvbEExL3FvWlU5K29XQWV1Z0NFUXpJT0U0WFE4SVVaVGFqelkzOE0yMTUy?=
 =?utf-8?B?UjV5bFpQb01mTmdLbXNQQzFNczZjekl5VndSS1dPSFFrT0xoUkg1dEFnZG1E?=
 =?utf-8?B?a1ZISURRUUFRV1IvYUFzYTc5bGQ5UCt2dTVESCtucFVxTVdFZWlHR2ZVL3Q0?=
 =?utf-8?B?bDNNeTRmN2pac0xpVEc1bDFtSWJtYzZWUW94TzFrY0Z0K05JOFZMd1hTR2Zy?=
 =?utf-8?B?SVdIbEx6ejZKbkhkcW5uTkFVOFRSYmJMRW5YTmdqbGJvalVPcUNreHFrdHVu?=
 =?utf-8?B?Q3N1Z3pnZnhwQkxwTlZ5N3VWalB1UGtxMkV0WW5pY213bGd1Zjd1MDlEZHpt?=
 =?utf-8?B?aytkd0FMdFM5ZHBpcHNNK3lXQ2dPaHZ0OTVxR3Z6UnpNSnFHTEZtWGdPSDEw?=
 =?utf-8?B?NGQrUGVFUHp1Y2ZCTXg2Rk9kLzNmTTRSVDdWbGZCcmlIZDVlY1p2b0RrYU9F?=
 =?utf-8?B?V0VWMmJac0ErZzBEQXFHN29aZHFFRytqZzRLcUhkaW5DVXhyY3g5eTUwVThL?=
 =?utf-8?B?cGt1YmZJWVg5Y1RPUkpFZFQ5TWZ0Q1FVaG1LWmxkT1NiRUNqZkdBM2lMNC9U?=
 =?utf-8?B?Q2FRTitncXRndzg2MWhHU2lhYmxONnhZMm5ORHh1SEc4dWNqUUExUjYzeUR4?=
 =?utf-8?B?T2tVaUVDRHZSZ2p1dU5nUGdCdGNVMEFuZzExWTMyaXJlR2dnMEtmdk91ZDFF?=
 =?utf-8?B?c1ZETklMbjdFSXVlM0MxamhJRXozUWVpTnNrbTdDT2U2TGZneHpyVHFzNXJ4?=
 =?utf-8?B?b0VVNGhwUUc2Qm9FaS93dHE3NXNiMCs2M3hXR095eFZERzNmcVJ0aExDUjRJ?=
 =?utf-8?B?RXhUNkhCWmtvbEVOLzZ5U29MN2RNdWg1RWRPQnZPRVJ4b0RmbkIyMllCdTg1?=
 =?utf-8?B?SENFUVZZR1ZiclB2K2VsS2Qrby84VStsRDlhaVdHUlAreW41dWhQUHZjMXM2?=
 =?utf-8?B?aDBIcHlHSStBWXR4SXpRUTdJdVNLWjZHeGdnN2JvZVcvT0twczJpaTVlZjVy?=
 =?utf-8?B?SCtFWFN6RCtiMlpnRE9qK1pTMHVqUy9SMWhVcTZuMG1wd28zYXdNa3pPL1RM?=
 =?utf-8?B?eXJDUldXTnA5SmF0RG41ZlQ2cHZrOWVtbWlEVWMxQlpPamJ1azRMY1VrR0E0?=
 =?utf-8?B?elpaL2pWVkNIM0FxQXZiWklXbm93MC8yOEcwd3ovU0tmNVJ3eTFzd0NlU2Zt?=
 =?utf-8?B?dGFYajNqRXNNQyt1eFhRODd5dWdaYzNBa29XSWdVMnFCOTlsWmVac2h4RVR6?=
 =?utf-8?B?WVJXY21vMmpYako1YVh2OS9Ga2laaXVMVkEvei9oU0IrUU90aUFyZnlZS2Jp?=
 =?utf-8?B?cXo4YVg3V0tZV2FaKytTWnBiTFJOWkprOHdmUHVTWjlrUUFsd0lkYU1mMEZE?=
 =?utf-8?B?MWFNdzFZU2k3NTQ1cjRHWVJSUmNUdXg5Ly9FZjREZUpOajRiWWVSWGhRSnp1?=
 =?utf-8?B?ZTd5OGxMNHB2U0licGtBVHk2R2tBV2JZU2hCZ1VTbFpzSVlUYWhBUklJaG9U?=
 =?utf-8?B?TXk2dFJCaitUSnRFQk01SkVFTURDOVBFTWV2RGxxZ29MbklKQlVwc3h5OTZX?=
 =?utf-8?B?dzhqZEgzaU53SEJFeWpaQ0dubjdPLzNPTWI5NCtMdXNoQUNmdzMycjRyTzZq?=
 =?utf-8?B?Tnp4UzZPNndUcmVzRDYzeWtIUDN2RWNRRFA2Vi93anZLMm94UzJSV0RMNTVu?=
 =?utf-8?B?MExZWk1wZy9ReS9KK3dZa0ZraEE5TkMxOFFTSnJjaHZwSis4THd3dmFxT3p6?=
 =?utf-8?B?bVNjQkYzNC80L3RwbzFaOSswR3RkNmtiaUUvRzdQRUZ3ZU1WVGRWbkNVRmRr?=
 =?utf-8?B?MVd1dWdBYytVVW1nZktPb21tY1hrOFBMNUtmdk10dWYxZy94NmRkaG9ROGR1?=
 =?utf-8?B?VXI2T3lKT2QvSlV3TFQrMXQvd2RGRVU5U2hya05oSTR5UC8vVzBzc25RR1V6?=
 =?utf-8?B?RENvMU4zcSswSGZEa0pRQWR3K21tNlJSTzZZYnMrb3BpK1dJT0Fhdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fL3fME/B7A46FA0JjfmGFlqo88dklWgkq1M1matOmHwMw1ZDqFZJ++cz5GrSWwmykeklkcG2YtNFpzumqmANKEExr1tfAvj6PlD/c6l3rvQZeDesHmqcd1jMbhtMjVKo+yeBETKiR+9E48OYtk0TqujynDG4i+EOnm6xaSNHVxjuj2+AAqysy+bKTft+zJSMwdqkmM6FNLnHQF63fz0NbjlEF3soavQJwIUt/X5h0rreHvooWW76rNumD6LjdoM3uVOfE6TKR69eGv6kGuYXOqGYj/Rd/qu7V0LxFnlFlZuBRcUuskbmO1gY2s+oU30yTK2uMN/M+jetMQBmM2VAqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcdd69e-8ee0-4efe-489f-08df0a97e92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 15:19:27.7707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdIwvu8JTsNOOLNvk7lhrLdzyVoKKCA3gJufgWh71eQE3qbQsQ3zU25YGjJvs40GobqCMQzEtcJygEGf7Ic9pps+mn70UKvmzXWwQ/RO8uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFZpamF5LCBBbm9vcCBDIDxh
bm9vcC5jLnZpamF5QGludGVsLmNvbT4NCj5TZW50OiBGcmlkYXksIFNlcHRlbWJlciA0LCAyMDI2
IDk6NTAgQU0NCj5UbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Q2M6IE5lcmxp
Z2UgUmFtYXBwYSwgVW1lc2ggPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+OyBOaWxh
d2FyLA0KPkJhZGFsIDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+Ow0KPklkZGFtc2V0dHksIEFyYXZpbmQgPGFyYXZpbmQuaWRk
YW1zZXR0eUBpbnRlbC5jb20+OyBUYXVybywgUmlhbmENCj48cmlhbmEudGF1cm9AaW50ZWwuY29t
PjsgR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+Ow0KPlJvcGVyLCBN
YXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBSdWhsLCBNaWNoYWVsIEoNCj48
bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgTHVzZSwgUGF1bCBFIDxwYXVsLmUubHVzZUBpbnRl
bC5jb20+OyBWLCBNb2hhbWVkDQo+TWFuc29vciA8bW9oYW1lZC5tYW5zb29yLnZAaW50ZWwuY29t
PjsgTmFzaW0sIEthbQ0KPjxrYW0ubmFzaW1AaW50ZWwuY29tPjsgVmlqYXksIEFub29wIEMgPGFu
b29wLmMudmlqYXlAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFtQQVRDSCB2OCAyLzJdIGRybS94ZS9z
eXNjdHJsOiBBZGQgaGVscGVyIHRvIGNoZWNrIG9Db2RlIGZpcm13YXJlDQo+cmVhZGluZXNzDQo+
DQo+RnJvbTogQW5vb3AgVmlqYXkgPGFub29wLmMudmlqYXlAaW50ZWwuY29tPg0KPg0KPkFkZCB4
ZV9zeXNjdHJsX2lzX29vYm1zbV9md19yZWFkeSgpLCBhIGNvbnZlbmllbmNlIHdyYXBwZXIgYXJv
dW5kDQo+eGVfc3lzY3RybF9jaGVja19hcHBfc3RhdHVzKCkgdG8gY2hlY2sgb0NvZGUgYXBwbGlj
YXRpb24gcmVhZGluZXNzLg0KPg0KPlNpZ25lZC1vZmYtYnk6IEFub29wIFZpamF5IDxhbm9vcC5j
LnZpamF5QGludGVsLmNvbT4NCj4tLS0NCj52NjoNCj4tIE5ldyBwYXRjaCDigJQgc3BsaXQgb0Nv
ZGUgYXBwbGljYXRpb24gcmVhZGluZXNzIGhlbHBlciBvdXQgb2YgdGhlDQo+ICBvcmlnaW5hbCBw
YXRjaCBpbnRvIGl0cyBvd24gY29tbWl0DQo+DQo+djc6IChVbWVzaCkNCj4tIENsYXJpZnkgeGVf
c3lzY3RybF9pc19vb2Jtc21fZndfcmVhZHkoKSBjb21tZW50IGZvciBzeXNjdHJsLWxlc3MgcGxh
dGZvcm1zDQo+LSBBZGQgWEVfU1lTQ1RSTF9BUFBfT0NPREUgdG8gZW51bSB4ZV9zeXNjdHJsX2Fw
cF9pZCBpbiB4ZV9zeXNjdHJsLmMNCj4NCj52ODogKFVtZXNoLCBSb2RyaWdvLCBNaWtlKQ0KPi0g
U2ltcGxpZnkgb0NvZGUgcmVhZGluZXNzIGhlbHBlcnMgdG8gYSBzaW5nbGUNCj4gIFhFX1NZU0NU
UkxfRklSTVdBUkVfQVBQX0lOSVRJQUxJWkVEIGNoZWNrDQoNClJldmlld2VkLWJ5OiBNaWNoYWVs
IEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KTQ0KDQo+LS0tDQo+IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmMgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+IGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmggfCAgMSArDQo+IDIgZmlsZXMgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
c3lzY3RybC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N5c2N0cmwuYw0KPmluZGV4IDNiN2Zh
MmM5YzMzMy4uNDA2N2UxZGZkY2Q1IDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zeXNjdHJsLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5jDQo+QEAg
LTQyLDYgKzQyLDcgQEANCj4gICogYXBwbGljYXRpb24gSUQuDQo+ICAqLw0KPiBlbnVtIHhlX3N5
c2N0cmxfYXBwX2lkIHsNCj4rCVhFX1NZU0NUUkxfQVBQX09DT0RFCT0gMHgwQywNCj4gCVhFX1NZ
U0NUUkxfQVBQX0RJQUcJPSAweDBELA0KPiB9Ow0KPg0KPkBAIC0xODEsNiArMTgyLDI0IEBAIHhl
X3N5c2N0cmxfY2hlY2tfYXBwX3N0YXR1cyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj5lbnVtIHhl
X3N5c2N0cmxfYXBwX2lkIGFwcF9pZCkNCj4gCXJldHVybiBYRV9TWVNDVFJMX0ZJUk1XQVJFX0FQ
UF9JTklUSUFMSVpFRDsNCj4gfQ0KPg0KPisvKioNCj4rICogeGVfc3lzY3RybF9pc19vb2Jtc21f
ZndfcmVhZHkoKSAtIENoZWNrIGlmIG9Db2RlIGZpcm13YXJlIGlzIGZ1bGx5DQo+aW5pdGlhbGl6
ZWQNCj4rICogQHhlOiB4ZSBkZXZpY2UgaW5zdGFuY2UNCj4rICoNCj4rICogUmV0dXJucyB0cnVl
IGlmIG9Db2RlIGZpcm13YXJlIGhhcyByZWFjaGVkIHRoZSBpbml0aWFsaXplZCBzdGF0ZSwgaW5k
aWNhdGluZw0KPisgKiBpdCBpcyByZWFkeSB0byBoYW5kbGUgcmVxdWVzdHMuDQo+KyAqDQo+KyAq
IENhbGxlcnMgbXVzdCBvbmx5IGludm9rZSB0aGlzIG9uIHBsYXRmb3JtcyB3aGVyZSBTeXN0ZW0g
Q29udHJvbGxlciBpcw0KPisgKiBwcmVzZW50ICh4ZS0+aW5mby5oYXNfc3lzY3RybCkuDQo+KyAq
DQo+KyAqIFJldHVybjogdHJ1ZSBpZiBvQ29kZSBmaXJtd2FyZSBpcyBpbml0aWFsaXplZCwgZmFs
c2Ugb3RoZXJ3aXNlDQo+KyAqLw0KPitib29sIHhlX3N5c2N0cmxfaXNfb29ibXNtX2Z3X3JlYWR5
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPit7DQo+KwlyZXR1cm4geGVfc3lzY3RybF9jaGVja19h
cHBfc3RhdHVzKHhlLCBYRV9TWVNDVFJMX0FQUF9PQ09ERSkgPT0NCj4rCSAgICAgICBYRV9TWVND
VFJMX0ZJUk1XQVJFX0FQUF9JTklUSUFMSVpFRDsNCj4rfQ0KPisNCj4gLyoqDQo+ICAqIHhlX3N5
c2N0cmxfaXNfZGlhZ19md19yZWFkeSgpIC0gQ2hlY2sgaWYgZGlhZyBmaXJtd2FyZSBpcyBmdWxs
eSBpbml0aWFsaXplZA0KPiAgKiBAeGU6IHhlIGRldmljZSBpbnN0YW5jZQ0KPmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3lzY3RybC5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3N5c2N0cmwuaA0KPmluZGV4IDhkYzU3Njc5Njg5MC4uYjY5YTNmNDc0MjM2IDEwMDY0NA0KPi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zeXNjdHJsLmgNCj4rKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfc3lzY3RybC5oDQo+QEAgLTIwLDYgKzIwLDcgQEAgdm9pZCB4ZV9zeXNjdHJsX2V2
ZW50KHN0cnVjdCB4ZV9zeXNjdHJsICpzYyk7DQo+IGludCB4ZV9zeXNjdHJsX2luaXQoc3RydWN0
IHhlX2RldmljZSAqeGUpOw0KPiB2b2lkIHhlX3N5c2N0cmxfaXJxX2hhbmRsZXIoc3RydWN0IHhl
X2RldmljZSAqeGUsIHUzMiBtYXN0ZXJfY3RsKTsNCj4gdm9pZCB4ZV9zeXNjdHJsX3BtX3Jlc3Vt
ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+K2Jvb2wgeGVfc3lzY3RybF9pc19vb2Jtc21fZndf
cmVhZHkoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiBib29sIHhlX3N5c2N0cmxfaXNfZGlhZ19m
d19yZWFkeShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+DQo+ICNlbmRpZg0KPi0tDQo+Mi40My4w
DQoNCg==
