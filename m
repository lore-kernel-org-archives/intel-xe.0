Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B61FCA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DAC10E52F;
	Mon, 25 Aug 2025 18:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnZ0ulDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC8310E52F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756146780; x=1787682780;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=n0dWwxBL2YKLexrEi2WYxbDxYWQtAX1g1pqL9qtXoDQ=;
 b=fnZ0ulDAprfb/Hzxrlb1OXVlFfFp29EI2qp+dWPWiTcfH4j8VZwuFelL
 ZUPTOrbc8Ipk+hfv5CVz6yEwbs6mbWAQCRk4kR/ehe7aCLJRgAXS5MyUa
 1igkiGjBvx6lMKt+OHwDpC9iYkmcUmeUQ617svsFC91uEsl8Lo0arOewa
 c70oAduxTUm/K8+QDnNEmMmY/1IHqzCDvKyY371qFJjHRB3bFf4CozWGK
 uj9hoqiK8GQ9lKb7bsgfiVUuN5u7H/znpeglq1bOpacSGAHZWAUcB5YgF
 fsqvMy5cnz7AgBDgDutCegGYmzwVNDd4p6bVchpw0oi1iFDrWrCOdHyF6 Q==;
X-CSE-ConnectionGUID: WDxmPtpjQ42Gvvdfvzkk8w==
X-CSE-MsgGUID: FP3oLu7+QY6A49VS6O+JFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58301044"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58301044"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:33:00 -0700
X-CSE-ConnectionGUID: 0OZ/uWr+StyiY00RDzLg0A==
X-CSE-MsgGUID: 5Vua/8wdSW6edwtrLHN5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168613847"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:33:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:32:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:32:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3JlR+n8N84MBQxGIW/qsHfWlb7YtO34woL6uv2wTSOcApqk23Gc5o+2QP1I/jM0t9UrmZFDmtW6xZ40bwYghdJs5FzaTPkgCAtQL9C4bexsx9afytFwKA5Aqenyn9CWu0fREZo/3A5VdzrPqum0hBVgibngwmwEm9yJyHSrpu4kujm8hjMFavd7JcuT9ys/jJponRUwNc0KrNfzZJE8yVUefzm6aPaRewR/u6UbC4TeYsO2Ow7vb/xe2ND9PKswCk9Zmx0KPC0AAutraTaw03CmrGLKTEVDHw/mttLMn8hDkKOf05KzkctM7LoJ4LpFvkx8PAbr6HOExwy0bTyJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0dWwxBL2YKLexrEi2WYxbDxYWQtAX1g1pqL9qtXoDQ=;
 b=R8GlK+G74RoXqgmBhZwz9EqUsj4gu1bou2uJeGYvgm/i5ozRmjW9GW5a7/FEMplB/yY/TX5SvRIobgPZupSoKR3OoRJGd2yGQMhbKwTIU3k3JstD1fZMfmnBralRMd6zdpA4CMxn9d+tTADQ0YAJztF/02TXyElvCl5Lx6GOtBjOb28dzsaaaoHelCHKlu8x/vqXPl12RYxM/NpqosGL7zc0yYnbJ8/blO9MX5FeoUs5wvxOMXc50Epb7s0IznrcxPy812Q3OLlbo5Pu9kxNlij7i3z3Gq6bMiVittjFckbEdtn6A6CnfUBBC3xoJo4SmP+9b88JAREfSGt07TjOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Mon, 25 Aug 2025 18:32:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Mon, 25 Aug 2025
 18:32:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Topic: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Index: AQHcFem/ACFsQ5t8tkCx+eaQ1GSwB7RzqjKAgAAD3QCAAADygIAAAoOA
Date: Mon, 25 Aug 2025 18:32:56 +0000
Message-ID: <b0832468776b295d33ed8d764c172392d2337d8a.camel@intel.com>
References: <20250825175721.89129-1-stuart.summers@intel.com>
 <20250825175721.89129-3-stuart.summers@intel.com>
 <049695bfb6f8496cafef33310f574b0a52737761.camel@intel.com>
 <aKypcLC+rauQ7sBN@lstrano-desk.jf.intel.com>
 <d126d7e70a034297c39a65105b3c28d9ea135751.camel@intel.com>
In-Reply-To: <d126d7e70a034297c39a65105b3c28d9ea135751.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB5154:EE_
x-ms-office365-filtering-correlation-id: 82caf712-58c3-4df8-5be6-08dde405cf80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TkpHTmZTQ28rOGVOS3M3bCtYd2V0L09KeU9yTWxuTEpDeGN4TDd1b1lPbFU1?=
 =?utf-8?B?MWZuTDlFQzRiZmx2RmJzanphaDlkOWx6VmRWOEFUMEEvd3NBT0J5SjdsTTZR?=
 =?utf-8?B?TThzMUc0ZXdEQ29YSzNkNVl0cG1qOGFJa0F5RlpjVVVWblVWNDZ6cktjTE9D?=
 =?utf-8?B?ajYyOXVzM2t2S3M0dXQyWkEwL0FLMUh3bjhmTHBGczBKenJ0OHB0blhJMUsr?=
 =?utf-8?B?dWRmdmdkMW04UFp1OFNTRHpyWEpVZitmWHROMnRUOTcreVM2WjBKZHFwOVNI?=
 =?utf-8?B?ZTVNSWwzb3VoaXVTV3lkWm9UeUUxZm9HOWd2b1RQeEhxR3RVUGpkNTV1ZEUz?=
 =?utf-8?B?SDVURWxhd0Focm9HcC9zUDJtdzBVUW9YbGFhd21OYTFWOGZBUUpKcU5MbEFP?=
 =?utf-8?B?bWtGVGFwL2txRnNCRnZQcGZReGRsa2NYNXQ1ZGJVUFZmZnpiWE4zdjZVbm42?=
 =?utf-8?B?VXN0YjFIdXZlM3dHR0FGRXp3SXE3a0xNRmgrRmVnK0RsMVQyZWtGOElWK2Vh?=
 =?utf-8?B?eXg3WnBCZmN4cE5zcjFCbU43Y2EyZnhyMzJSVTN5SE9zYXVWMlRJREt4TGg4?=
 =?utf-8?B?Wng2OFhYUm1JQlBSd2xkTGI3SzROTlNaS01VQXNST0tsVXhOMnd5VFI1Rnpv?=
 =?utf-8?B?Z1VnS0hYN0pPbHZtNE5RNFlTelNpaWFZOUcyd3N1WW1meXR6UWxQRGt3UlFO?=
 =?utf-8?B?RjZqZ1JMM091V2syYnRTNmQ5bnBHQTRHSUtPRElCVE9PaVZoZzZaZlVLZ3Z6?=
 =?utf-8?B?NFRSMXh2MW8wSTlWYVhHMGlKSUFlM1VnK1FmeTBEK3o4aW9BOVIrc2loT3VH?=
 =?utf-8?B?bmJjdldiM2lEQ2E2TEhQQU1HVFkwVERQeEZJZ2Z3a2ZPVFBuaCtRaitPN3NU?=
 =?utf-8?B?NzdmNW1aVk8veENOYmZhcEpmVDZIaDJNTGtGTlh4cE1hSGVITjdnS2Y4U0NR?=
 =?utf-8?B?Ri95dmJIN0FGd2Jrb3BPNFZQMFNPK0dDVjF4TGxPSDVNTEQxd3kvNnJRTnY0?=
 =?utf-8?B?M005ZzBUWWo4Um9zbERiekxLMkxCWmZzTTRPQ3RYNzZmNXhaYU02bC9JaDJq?=
 =?utf-8?B?czVYcHZaZ2k2VERZZ0pJeFplc3FSSHBoNmxLT2RxQ2FNcUdja3FWRFF0ZGc4?=
 =?utf-8?B?M1c1cWR6QU9YMUp6cVNqVWptY3Q0Nm03aXlMSkp6dk4wdTF0MUNCZmNKOUw2?=
 =?utf-8?B?TDJldFlyd2trOGdTSCtWd0x5Y04vMkxrT3VZNlJnK1JmQUZYRXFzbHk0VUEv?=
 =?utf-8?B?MGhBL0tubTNHVUJzc3FlbVMxNVJuV01HSm5PNmtpMFpBUVVaSzQvWndkeFNn?=
 =?utf-8?B?bGtkUks2L0Y0cTI1cmhsUU9mOXF0aWJsL0JGckJZMkFwNGIxYlpFbG1GaUhB?=
 =?utf-8?B?aEF6dVBsOWVCbG50blAwSHdBSUlndlFVS01GcUZ3bTZxK2svT2FiS2NmY2NB?=
 =?utf-8?B?Q0tyTzhnZUdMRVFKdkhkaVgrS2pzeGVIVWRzSVRWMkl6OVJDdzJWNjgyTkN6?=
 =?utf-8?B?WDBNYlE4Z2RHaEFWc1FkS2hiTGZySjN5ck5KUGlhUlMrY2NTK2hyeS80NmxW?=
 =?utf-8?B?bzl6cDZKb2d6MVVpTnIzR2txdTgvbXFzQlp1cjhmNUtseWh6cHRvTEtLdzZF?=
 =?utf-8?B?ZExPcWpZVVNiaHU3bkZqdm1QbXVzZXR5NXVTRnVnS0VyMjlYQ05VZWtEQk5D?=
 =?utf-8?B?dnQ2TU1IWTVzS1FCcFdDUUJGWmI4ZGc2cW5MMG1renUrMW1jQXJxSTM3eUpH?=
 =?utf-8?B?QjZFR0k2VU5kTkljWmxUUmhrWWsrSis1RURocEN5MXVhdnFaWDFlUFkwTXdr?=
 =?utf-8?B?Ull4TWlLNERTd3kvYk54V1ZURUVFaTRlaUJWUDk1aTZ6dDRMNkFCdjdtMHU5?=
 =?utf-8?B?QVIyaDJXdDR5UGRVUXBrb2ZHN0hEU3VyRm0zL1UrQzJiNWFPUzI3VnJJYS9x?=
 =?utf-8?Q?BYjrxO9DUpk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0FwT05LMmhuUW80Y0dFaWpDWEJmQ3JSTjluTGozYzAzUmplRDBTYUdRMitX?=
 =?utf-8?B?NldVT0ZqaUZxUC91b2tSY1ZwRzZzYWZCTCs5RCtBOTBiUzRqa0M5SFdleGVO?=
 =?utf-8?B?WkdKeVBsVkdDNmNCeEdFZVFibHZNK3NVVGZza0NQRVNhNEdSZnNqdmFjd0p5?=
 =?utf-8?B?OUF1UTFWMEFOV3U5T1F0NkZRYk9sZk9qUmd3eVE1TVg3NWFBdUh3TjhIc1BT?=
 =?utf-8?B?TVhnM1lCaUZtaXRsQ0NuU0hvR2ZyWGQzZUZQa2xLSCtmbzVhNXBVV3N5eUhl?=
 =?utf-8?B?L09WaFZBcWt2OWJ5SUFtY3lMVlFkRDlibnkwcXEyRmQyeVhwUS8rUWlhaWpL?=
 =?utf-8?B?aHMxZVRRSFhZdlZ2cEZFeGp5Uk55SGx1ZFFIcXAwZWZvZjhmQnk0M0c1M2NS?=
 =?utf-8?B?SGZyVmZkaVd5OW42cS9uN3kybVRub3drcm5aTXV6Q3Bndk5TS3dKcmhHbUNQ?=
 =?utf-8?B?QTFZN1VvN3JrRzBTdndWUUIzcGJaaWZHZ1JjZnl5KzNQclMxZytVM0dNY2hN?=
 =?utf-8?B?aXAzeWZaeWs2QlBkTHdYQzBkRjB5T3BDbHpZdzhXZ0xrSFlVVWduTTJsQzJN?=
 =?utf-8?B?WlI3bnFpZEpxRTkwUTNta3ZPb2JJOGFhY1dkQmhBU3BLL1BvVCtwOGdYalA0?=
 =?utf-8?B?eDVtN0JCV0w4STdPbVJaeEhxS2o0MEQzelRNbldnaWtXNXgyTEtVdXVHU1p1?=
 =?utf-8?B?N2ZlNDVUVFV2ektCMUk2ZEExMDZ3Qlg5WkJOYXpWY3BqVW84c29hSW52OFJW?=
 =?utf-8?B?ZHZ0L1lnUTUyNjNUaXB5RDROOHdVNEQ4bXIwdVpGSk12a01rVkxqMml2NWtB?=
 =?utf-8?B?WWJmU1VyNVVkdG1nWjdXRE43cGV5MytCVm8rSG9hbnVlUHJZcVBiWEJEZm5j?=
 =?utf-8?B?cEtvT0dRalplYUhCb0EyVW15ejZQUzYrQzY3d2xpQ0Ywc2lnUEFTZGoyUFMv?=
 =?utf-8?B?Zyt1ajdFYWFWRG5qZDZCL0ViZ1U1V0VKSnZPZjFhWm5iUk1BbXBTbUhLTW1W?=
 =?utf-8?B?T3F4R1kzVmFLak1WQ3p6VkNPMWlNV1VMd0ZQblNkdkF4MU0veHBDYUJzREVj?=
 =?utf-8?B?N2IzcWhRNkJtaGRJbzVjT25TVFB3RWtoblBlR1l1Mm9NVGFNZnJ4bWprMjZS?=
 =?utf-8?B?Wkd6cmpET0NrM0habGJSS1NRVDhMSm5jN0FHVW9lTWtWayttS3JkY08zNUxh?=
 =?utf-8?B?Z3BBT2hTakpzNEMzbitOM1VCNkI5eHh1NGFkSE0rNjBQL1pPR042Y3JzWjho?=
 =?utf-8?B?Z2tudStXd1hlQVBvdUU0SGMxWEtwSmxTRXdoQ0JnZXgvbGNEZm1Ld1I0MGEz?=
 =?utf-8?B?OHFPN0NXV0t0R3ArRFdMOU1WY0gxbEVSc1B5YjdGSENhcXFVTFA3RGkzQkxM?=
 =?utf-8?B?RTAyclp5Zms3RU1lQ251NzFOUXZ3NFIyTWFibmcvbnZaSGthYm5aMmNudENL?=
 =?utf-8?B?Z3g0cnlxa2xITWRwbnZ6ek1JejdJSUJ5WHBranR3MXJDQ1lFL0FJSi9rVHVQ?=
 =?utf-8?B?cmszQktVM0Q5VkdxZTVDTkRMWnlZa1M5TTBkL2NWSitxSGJLczlrekpqajc1?=
 =?utf-8?B?VGIzRE0rMW1FTWJxSXVsZTkrTU83MGYwSmdmZ1R1Ui92MDgwU2NJUnBuMjRR?=
 =?utf-8?B?QXlKKzgvdm9QMHE1cmtzMjZyMHFYZk1DSXRwODc0ZEJXdElnUXZiVGVOVmV4?=
 =?utf-8?B?RlBUcUhYNTZuWXdKVE0wV2lIRE1QWklTUFAzU0trMzVMLzdRUnhlelJNNEM4?=
 =?utf-8?B?dzVKZGU1a1ZCVGJCbnpsNXBCMENDRUJtZVgxTFVnRDg1MzJ3ZEpJRHRyRWxo?=
 =?utf-8?B?UWp3WmpYb2tqbmpkbXprMkNVaXV2OWlxNVVGOHoycG5DcE1YZzQxdjFUbEFw?=
 =?utf-8?B?M2dkV1F5dmZqWWdVNHBMeFA5bkRuOVkya1hNZTZNam5BQ0FqTkJQQjl2Sm9S?=
 =?utf-8?B?Vlh4SDQwdXN1bEdHVVZzVjdjSFNrMFQ2enZVV1JmNE9xelR5clNkWTVLT3Va?=
 =?utf-8?B?OGkwdDkwNHRMRDZxeDNUamVxSUprMnI4S2lOZnIxRGM5UldHeUxWMlA5ZzN2?=
 =?utf-8?B?T0NkUVJ0K0pMRVRNbytkam1IMVR3OVZIaWNnQ2ZOUzIzbTNCdkg4Nm5TUGlF?=
 =?utf-8?B?WmZiKzltZk1NTUNJR2EzRzFjN2syYUVRRVBkUDNjclNtZ2thWnZtejNkZEV3?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EFC43E3563656408169EA2E2380F8FD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82caf712-58c3-4df8-5be6-08dde405cf80
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 18:32:56.3579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W70PddZEwssCrsyfndLNsQlJL1lTjQKAumZeWWc4DWMwfERAWfufjg5tniAsXnbw1w/N6uqy8PwewbJ00qotTbFzoNNxwQdTz76SManA6pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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

T24gTW9uLCAyMDI1LTA4LTI1IGF0IDE4OjIzICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNS0wOC0yNSBhdCAxMToyMCAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBPbiBNb24sIEF1ZyAyNSwgMjAyNSBhdCAxMjowNjo0NFBNIC0wNjAwLCBTdW1tZXJz
LCBTdHVhcnQgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjUtMDgtMjUgYXQgMTc6NTcgKzAwMDAs
IFN0dWFydCBTdW1tZXJzIHdyb3RlOg0KPiA+ID4gPiBBZGQgYSBuZXcgX2ZpbmkoKSByb3V0aW5l
IG9uIHRoZSBHVCBUTEIgaW52YWxpZGF0aW9uDQo+ID4gPiA+IHNpZGUgdG8gaGFuZGxlIHRoaXMg
d29ya2VyIGNsZWFudXAgb24gZHJpdmVyIHRlYXJkb3duLg0KPiA+ID4gPiANCj4gPiA+ID4gdjI6
IE1vdmUgdGhlIFRMQiB0ZWFyZG93biB0byB0aGUgZ3QgZmluaSgpIHJvdXRpbmUgY2FsbGVkDQo+
ID4gPiA+IGR1cmluZw0KPiA+ID4gPiDCoMKgwqAgZ3RfaW5pdCByYXRoZXIgdGhhbiBpbiBndF9h
bGxvYy4gVGhpcyB3YXkgdGhlIEdUIHN0cnVjdHVyZQ0KPiA+ID4gPiBzdGF5cw0KPiA+ID4gPiDC
oMKgwqAgYWxpdmUgZm9yIHdoaWxlIHdlIHJlc2V0IHRoZSBUTEIgc3RhdGUuDQo+ID4gPiA+IA0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Qu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKysNCj4gPiA+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jIHwgMTIgKysrKysrKysr
KysrDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24u
aCB8wqAgMSArDQo+ID4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+
ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gPiBpbmRleCBhMzM5
N2YwNGFiY2MuLjE3OGM0NzgzYmJkYSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gPiA+ID4gQEAgLTYwMyw2ICs2MDMsOCBAQCBzdGF0aWMgdm9pZCB4ZV9ndF9maW5pKHZvaWQg
KmFyZykNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSBhcmc7DQo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgaTsNCj4gPiA+ID4gwqANCj4gPiA+ID4gK8KgwqDC
oMKgwqDCoMKgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9maW5pKGd0KTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IFhFX0VOR0lORV9DTEFTU19NQVg7
ICsraSkNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9od19mZW5j
ZV9pcnFfZmluaXNoKCZndC0+ZmVuY2VfaXJxW2ldKTsNCj4gPiA+ID4gwqANCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4g
PiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+ID4g
PiA+IGluZGV4IDc1ODU0Yjk2M2Q2Ni4uZGIwMGM1YWRlYWQ5IDEwMDY0NA0KPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiA+ID4g
QEAgLTE4OCw2ICsxODgsMTggQEAgdm9pZCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX3Jlc2V0KHN0
cnVjdA0KPiA+ID4gPiB4ZV9ndA0KPiA+ID4gPiAqZ3QpDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBtdXRleF91bmxvY2soJmd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5vX2xvY2spOw0KPiA+ID4g
PiDCoH0NCj4gPiA+ID4gwqANCj4gPiA+ID4gKy8qKg0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAq
IHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmluaSAtIENsZWFuIHVwIEdUIFRMQiBpbnZhbGlkYXRp
b24NCj4gPiA+ID4gc3RhdGUNCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBDYW5jZWwgcGVuZGlu
ZyBmZW5jZSB3b3JrZXJzIGFuZCBjbGVhbiB1cCBhbnkgYWRkaXRpb25hbA0KPiA+ID4gPiArICog
R1QgVExCIGludmFsaWRhdGlvbiBzdGF0ZS4NCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiArdm9pZCB4
ZV9ndF90bGJfaW52YWxpZGF0aW9uX2Zpbmkoc3RydWN0IHhlX2d0ICpndCkNCj4gPiA+ID4gK3sN
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9yZXNldChndCk7
DQo+ID4gPiANCj4gPiA+IEkndmUgYmVlbiBzZWVpbmcgYW4gaXNzdWUgb24gZmF1bHQgaW5qZWN0
aW9uLCBydW5uaW5nIGluIGEgdGlnaHQNCj4gPiA+IHdoaWxlDQo+ID4gDQo+ID4gSSB0aGluayBm
YXVsdCBpbmplY3Rpb24gY2FzZSB3aWxsIGJlIGZpeGVkIGJ5IFsxXSB3aGVuZXZlciB0aGF0DQo+
ID4gbWVyZ2VzLg0KPiANCj4gT2ggZXhjZWxsZW50LiBJIGhhZCBzZWVuIHRoZSBzZXJpZXMgaGVy
ZSBidXQgaGFkbid0IHRob3VnaHQgdG8gdGVzdA0KPiBhcw0KPiBJIHdhcyB3b3JyaWVkIHRoZSBp
bmplY3Rpb24gZXJyb3Igd2FzIHJlbGF0ZWQgdG8gbWluZS4gSSdsbCBjaGVjaw0KPiB0aGF0DQo+
IG91dCBoZXJlIHNob3J0bHkganVzdCB0byBjb25maXJtLiBJIGRvIGhhdmUgdGhlIGJhc2ljIGVy
cm9yIGluamVjdGlvbg0KPiBjaGFuZ2UgbG9jYWxseSB0b28gdGhhdCBmb3JjZXMgdGhpcywgc28g
bWlnaHQgZmxvYXQgdGhhdCBpZiBpdCBkb2VzLg0KDQpZZWFoIG5vIHVuZm9ydHVuYXRlbHkgaXQg
c3RpbGwgcmVwcm9kdWNlcy4gQmFzaWNhbGx5IHRoaXMgd2l0aCB0aGUNCmVxdWl2YWxlbnQgZnVu
Y3Rpb24gaW5qZWN0aW9uIHBvaW50IGluIHRoZSBkcml2ZXI6DQp4ZV9mYXVsdF9pbmplY3Rpb24g
LS1yIGluamVjdC1mYXVsdC1wcm9iZS1mdW5jdGlvbi14ZV9kZXZpY2Vfc3lzZnNfaW5pdA0KDQpJ
J2xsIGtlZXAgcG9raW5nIGFyb3VuZCB0byBzZWUgd2hhdCBJIGNhbiBjb21lIHVwIHdpdGggdGhl
cmUuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiA+IA0KPiA+IFsxXSBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1Mjg3MC8NCj4gPiANCj4gPiBGb3IgZ2VuZXJh
bCBzYWZldHkgdGhvdWdoLCBJIHRoaW5rIGNhbGxpbmcgdGxiX2ludmFsaWRhdGlvbl9yZXNldA0K
PiA+IGlzDQo+ID4gYQ0KPiA+IGdvb2QgaWRlYS4NCj4gPiANCj4gPiA+IGxvb3AsIHdoZXJlIG9j
Y2FzaW9uYWxseSB3ZSBzZWUgdGhhdCBhIGNvdXBsZSBvZiBzeXNmcyBmaWxlcw0KPiA+ID4gd2Vy
ZW4ndA0KPiA+ID4gcHJvcGVybHkgdG9ybiBkb3duIG9uIGEgcHJpb3IgZHJpdmVyIGluc3RhbmNl
LCBmb2xsb3dlZCBieSBUTEINCj4gPiA+IGludmFsaWRhdGlvbiB0aW1lb3V0cy4gVXAgdW50aWwg
dG9kYXkgSSB3YXMgb25seSBhYmxlIHRvDQo+ID4gPiByZXByb2R1Y2UNCj4gPiA+IHRoYXQNCj4g
PiA+IHdpdGggdGhpcyBzZXJpZXMsIHNvIEkgd2FudGVkIHRvIGJlIHN1cmUgd2Ugd2VyZW4ndCBj
YXVzaW5nDQo+ID4gPiBzb21ldGhpbmcNCj4gPiA+IGhlcmUsIHBhcnRpY3VsYXJseSB3aXRoIHRo
aXMgX3Jlc2V0KCkgY2FsbCAob25lIG9mIHRoZSByZWFzb25zIEkNCj4gPiA+IGhhZA0KPiA+ID4g
ZGVjbGluZWQgdG8gaW5jbHVkZSB0aGlzIGluIHRoZSBvcmlnaW5hbCBzZXJpZXMpLiBUb2RheSB0
aG91Z2gsDQo+ID4gPiBldmVuDQo+ID4gPiB3aXRob3V0IHRoZSBzZXJpZXMsIEkgd2FzIGFibGUg
dG8gcmVwcm9kdWNlIHRoYXQgYmVoYXZpb3IgKC0NCj4gPiA+IEVFWElTVA0KPiA+ID4gb24NCj4g
PiA+IHN5c2ZzIGNyZWF0ZSwgZm9sbG93ZWQgYnkgVExCIGludmFsIHRpbWVvdXQpLiBTbyBJIGRv
bid0IHRoaW5rIHdlDQo+ID4gPiBzaG91bGQgYmxvY2sgdGhpcyBzZXJpZXMgb24gdGhhdCBkZWJ1
Zy4NCj4gPiA+IA0KPiA+IA0KPiA+IEkgYWdyZWUuIFRoZSBwcmlvciBDSSBydW4gTEdUTS4gVGhl
IGZhaWx1cmUgaGVyZSBbMl0gc2hvdWxkIGJlDQo+ID4gZml4ZWQNCj4gPiBieQ0KPiA+IFszXSB3
aGljaCBtZXJnZWQgbGFzdCBuaWdodC4NCj4gDQo+IEdyZWF0DQo+IA0KPiA+IA0KPiA+IFsyXQ0K
PiA+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE1MjAy
MnY4L3NoYXJkLWxubC03L2lndEB4ZV9leGVjX2NvbXB1dGVfbW9kZUBtYW55LWV4ZWNxdWV1ZXMt
dXNlcnB0ci1yZWJpbmQuaHRtbA0KPiA+IFszXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzE1MzE5Ny/CoA0KPiA+IA0KPiA+ID4gSSBzZWUgYSBmZXcgdGhpbmdzIGlu
IGNpLWJ1Z2xvZyB0aGF0IGNvdWxkIGJlIHJlbGF0ZWQsIGFsdGhvdWdoIEkNCj4gPiA+IGRvbid0
DQo+ID4gPiBzZWUgYW55IHJlc3VsdHMgaW4gdGhvc2UgdG8gY29uZmlybToNCj4gPiA+IGh0dHBz
Oi8vZ2Z4LWNpLmlnay5pbnRlbC5jb20vY2lidWdsb2ctbmcvaXNzdWUvNzE3NT9xdWVyeV9rZXk9
YTU3MDdhNGQzYWUyZWJiOGMwNGVmNmNlYTBlZjc0NzMyMmRmNGVlMQ0KPiA+ID4gaHR0cHM6Ly9n
ZngtY2kuaWdrLmludGVsLmNvbS9jaWJ1Z2xvZy1uZy9pc3N1ZS8xMDQxMj9xdWVyeV9rZXk9NDAy
ZjI2MTU0MDZjNGFmYTQ4MTRhMjk4NDliMzEyYTBjN2I2NmU5Yw0KPiA+ID4gaHR0cHM6Ly9nZngt
Y2kuaWdrLmludGVsLmNvbS9jaWJ1Z2xvZy1uZy9pc3N1ZS8xNTAwND9xdWVyeV9rZXk9ZTBjZTYw
MWFlNjllYzc2YmJkZjI3MjkzZGMyOTE5YmEwNzM1N2RlMw0KPiA+ID4gDQo+ID4gPiBBbnl3YXks
IGF0IGxlYXN0IGZvciB0aGlzIHNlcmllcywgSSB0aGluayB3ZSBjYW4gaWdub3JlIHRoYXQNCj4g
PiA+IGlzc3VlLg0KPiA+ID4gDQo+ID4gDQo+ID4gQWdhaW4gYWdyZWUuIEkgdGhpbmsgaWYgdGhp
cyBDSSBydW4gaXMgY2xlYW4sIGdvIGFoZWFkIGFuZCBtZXJnZS4NCj4gPiANCj4gPiBXaXRoIHRo
YXQ6DQo+ID4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwu
Y29tPg0KPiANCj4gQXBwcmVjaWF0ZSB0aGUgZmVlZGJhY2sgYW5kIHJldmlldyBNYXR0IQ0KPiAN
Cj4gLVN0dWFydA0KPiANCj4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IFN0dWFydA0KPiA+ID4g
DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gwqBzdGF0aWMgYm9vbCB0bGJfaW52YWxp
ZGF0aW9uX3NlcW5vX3Bhc3Qoc3RydWN0IHhlX2d0ICpndCwgaW50DQo+ID4gPiA+IHNlcW5vKQ0K
PiA+ID4gPiDCoHsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGludCBzZXFub19yZWN2ID0gUkVB
RF9PTkNFKGd0LQ0KPiA+ID4gPiA+IHRsYl9pbnZhbGlkYXRpb24uc2Vxbm9fcmVjdik7DQo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlv
bi5oDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24u
aA0KPiA+ID4gPiBpbmRleCBmN2YwZjJlYWY0YjUuLjNlNGNmZjM5MjJkNiAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uaA0KPiA+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5oDQo+
ID4gPiA+IEBAIC0xNiw2ICsxNiw3IEBAIHN0cnVjdCB4ZV92bTsNCj4gPiA+ID4gwqBzdHJ1Y3Qg
eGVfdm1hOw0KPiA+ID4gPiDCoA0KPiA+ID4gPiDCoGludCB4ZV9ndF90bGJfaW52YWxpZGF0aW9u
X2luaXRfZWFybHkoc3RydWN0IHhlX2d0ICpndCk7DQo+ID4gPiA+ICt2b2lkIHhlX2d0X3RsYl9p
bnZhbGlkYXRpb25fZmluaShzdHJ1Y3QgeGVfZ3QgKmd0KTsNCj4gPiA+ID4gwqANCj4gPiA+ID4g
wqB2b2lkIHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fcmVzZXQoc3RydWN0IHhlX2d0ICpndCk7DQo+
ID4gPiA+IMKgaW50IHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZ2d0dChzdHJ1Y3QgeGVfZ3QgKmd0
KTsNCj4gPiA+IA0KPiANCg0K
