Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7293FC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 17:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166DF10E560;
	Mon, 28 Jul 2025 17:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzKvXfuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635210E56A
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753725405; x=1785261405;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+1fH5EQ/87fhal3YXwAo8DcRdb3fK0KspqDEv9n8UdI=;
 b=YzKvXfuVmg6S/vdUH/PPgnPnsgl62tVnU7tbNurnGsJwSizEss4Cb6sv
 xxVWk9Quhdop/rv54ogJjlbsWTlZFlq8kVJ+U636m/v4Bau9ljhvAAhEm
 YNbKm48rh2IwMQC/AITxgKq+oj8EtOPgN3JtBhbGHnkv58jZ62IPnpZ6w
 bweh3W5MLokhVG2cNXAOmpIqtAyRYFt5O0FY/rwG7aPAKzmViyDpUOL8C
 HWD9OlEjYE3fpdZSY2gfu85h+exSbn6RA5MT5R0bdwUKoJwNe3H86ErYw
 XExQEDu19XHyAtjDmnhtPF7W5CZxTav8hvkjFMhwsSpHGBSkp666Mb72m g==;
X-CSE-ConnectionGUID: wRmgHo2fQnW/HNN6rtNY0w==
X-CSE-MsgGUID: gZMcK1epT4yAiC9NbIScNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58603899"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="58603899"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:56:39 -0700
X-CSE-ConnectionGUID: 3d6Ae3VQT/m4s34vPLtj8g==
X-CSE-MsgGUID: OwDZcpOzRRyVFs8BlX6blg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166686040"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 10:56:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 10:56:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 10:56:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 10:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2HYZUue6PwTm0j24fn26RKpc0qEI8G7+uKgJqHWbfg14/qqSQqZCPsSzz74VEBS15pe8DX/57PDkRtO2OOsXF+dbNuMyj+VYc7gV8XhQB7VIxD7UyFuRo7qgwCWp/M7EunNA+rdtHplG9Z1Ooim30iEzHqtCetBJokW8y6IpiJxbpn+KzoBNOJwNFepKOzviQujaXHqC89Msu+QKAA+X1fYOOl9G9KooEU/Yhx/dQsr8J8AroTCIrniSCcSiHhPXHaTsjYAvIKVzmPfKOXtUl5wR+FULRQ5HzAChvYth2Os/6fSCcDUkKeYdLwK52wazxQTHo8btay5xeAturl3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1fH5EQ/87fhal3YXwAo8DcRdb3fK0KspqDEv9n8UdI=;
 b=JjVnJIiIoNflypEHDnuAC7Gu6v/5wHTEJNvANBRY5jjGihIF4BDom13/HgfTXQZrhHiJvnQDawVhOMx18HkD+VQNjKzEs8zX0mvEG0l0oSGdz++/ZfYLyEM8SxUWX3h+KuPQ/Yp2jYt2Njrd9AmVu4wUQ1AIa8bAsrp+2jyRjirF+HrGQOudAIWyXgSGmo9hAdWRyeA4Jrv1ilTmYkGcRqzhKpT7KwaSsVeAT++gV36C17CMqCeMNA0pZ2byJy9974XQif9ih2vNH28WEtLW+3cF/FmB39dOwmQGikCE5ll1jDZJDslj0GXl62obF+EwVNPwAuBe2k4Cx2eYTAeovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Mon, 28 Jul
 2025 17:56:07 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 17:56:07 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Thread-Topic: [PATCH v2] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Thread-Index: AQHb/5w4RSKu+6XjVkGV1U/6L6vbEbRH0o6A
Date: Mon, 28 Jul 2025 17:56:07 +0000
Message-ID: <8ca6af6970ef166f66b6786f55156af876133ddd.camel@intel.com>
References: <20250728084751.4057124-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20250728084751.4057124-1-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB6869:EE_
x-ms-office365-filtering-correlation-id: c17de78c-31a5-408f-64b6-08ddce000736
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q1JKYm5nemZCcnhqZ2s4VE9vWTVsRlc4U3U4TWVXeStTR0FBZVB3SHZuYVVL?=
 =?utf-8?B?b0htOE1OV0pXMFRvaTg3TS9reVNMY214YVBhMXFtckxRZ2ZlYjhqOUIvU0xD?=
 =?utf-8?B?S3hzUXU3bzZjMmV6WFJkcUM2N2RSSU5SdFRkQVNDUmxVb0h4aEF5RkJVdUVH?=
 =?utf-8?B?UVBxYTFoSHBkR1crUGpOaHVQMm9ZZHdhcFZqUjJwYWcycVNsSzhZdmZwdzZF?=
 =?utf-8?B?dWZCNUdHakU1cTNQY1dtQVlXbit1bWJIN0kyckpiVUpIUDdFQjhXbWhuZEpJ?=
 =?utf-8?B?NDFna21oUmpzWWVHTiswNWZ6R3V4dm1BYWVaRGdhM2MvUmZCWlhLVXJPdlpX?=
 =?utf-8?B?L0g5YWpQN3R1T1NxQzJlM1NFVjhXZ0F2NERkL1prUmNrMG5WamhQKzVFUWp1?=
 =?utf-8?B?Y2prNFZxdlJzZG9JOWxaVjVlS0lybkFRN3lZSHJFeDg1NjJuT0FoYklLb0Fm?=
 =?utf-8?B?S3EwRlhtZ1czUVdKZ2ROY1g3SG9mdGhKdFZSTk9xYk5HNkErSERobWlZby9N?=
 =?utf-8?B?eUdTZHBWOGhhOXQyYVB4VDJkMW9yZWtJUENCQklIM2xSUy9nSmxOSGV3REtq?=
 =?utf-8?B?QUZ6SnQxNVRUeTBUVFR4T0l1RjJCMHZxdkRhN3M0L0wzL2lQeWVYUGNQdWtm?=
 =?utf-8?B?cHg0eEtkR0IvL0ZuNUdVdStzMjFrUGJpQlBvTXJxeE5YQzNBN083WFhaTEwr?=
 =?utf-8?B?elNUTHVDQkE0b3V2eDVORXFnemJYRHNwTFJHUGF0ZGlxRzhEUEpJeXBpMldL?=
 =?utf-8?B?RUJvbGZmaTEyQ0EvSmxKM2t1Vm5ocDl4d2VGUHR0ZzI2UzYzd3gyL21YN0VC?=
 =?utf-8?B?VlpQcTdQTjhOM1FmSFg1UTFNYytJUit1YVJjUkU5Z3E2UFZUMXJZQVJmWEFG?=
 =?utf-8?B?eEx1VFFuSjNueEpRYkxLeU1DRDJ5MTVrNmF3VzEveVR1SC9TYisxd2Z2QVB1?=
 =?utf-8?B?NUZBYU5iMDNaNVZTRUdUQUJrb0hwM29jOFNGN01LcGsvc0M4WlVjSkFYT2Jy?=
 =?utf-8?B?cThINzFaY25YMUFVNU9kMThIYnJFOXVjMTJ3RUVGY3MrZzMvZnlWMnQvSEtI?=
 =?utf-8?B?R2Mwa0pTOXg2Y3l0NERTTHFWRkpZWGdmK01jTkFNRGN0ZkhqeTQvN1hXOFMy?=
 =?utf-8?B?TU5lelhPOVF6U2FvRVc4TldzNktXV1R3OEUrakNINUlya24zTDlVazZIclAw?=
 =?utf-8?B?V2VuWDF0bFNBMkM1WElOWmxDa1dIZ2FwZ3ExbmhFeityZ0NjUmVMUDNJYnQr?=
 =?utf-8?B?VXhPaTdvNXpGVmVuaXM3ckU0MEdybHEwSGpvYUErMHErcktUY2ZURXNoMWh6?=
 =?utf-8?B?WUdGN1dnL2ZHZHRnRVFGNFhiUnBWaXZGeSsyZkY3RXNuWStFMW5XN1B3Z2s0?=
 =?utf-8?B?bHRycDg4UW5IanREWmU4bTdNRGlGdnRHU251b0VpeDZ6eTl4REJJZkZ2OVR3?=
 =?utf-8?B?ZDVqUzdTM3dBRHdMMm54UUZiRjZZbW1hajc2UkFxeG1Gck5EWldIbVpvU3Zm?=
 =?utf-8?B?ZWJ5L3FCR05LMEh1Rko5WUhab0d6NGJJNWkzcDR3NW5wVW5KUytJOGxzbEo2?=
 =?utf-8?B?RDBndVh1Vmg0MHBQcktMRitXVkplLzhEK0RxMS9LTlhTL21TZFczcGF0cjRv?=
 =?utf-8?B?Mng2V3F3aTRzZ3lpRXRqS015RTZsdHRDQXJWUWI4bXR1dUtWSDB2a2oxUXN0?=
 =?utf-8?B?eC9UR2xHVEhCRGlNSUZ4dU9mb0hNUmp3NTBqZkcxaEw5NUJ4S01ZNjMwcDlF?=
 =?utf-8?B?WXNSNDA5b2hSR1ZIU3BFLzJLa3VaVWUvM1dqN21PR0R4TWkyUWJEcjZVbFNt?=
 =?utf-8?B?cWtjYjNTdC96N3ZUaVpTWllFc25DaUVGdzlhRE5IWjlOUFk2OU1aTWtpMlZ2?=
 =?utf-8?B?VzUvNlRHWTZtQ1Q0cWpOMkFLSy95NDZkTTRSalFqb2JDR25rS0N0ZjQ1R09V?=
 =?utf-8?B?cWttcHdFK0RNQlViSzRUZHFjOHdWQzNmTndhTEhnWk90bzBxa2dHNmJxSjdr?=
 =?utf-8?B?MlBTS3d5dzVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODNhVXc2WlpQT1AwZXVLK3h5blJRbjUreGdRRmZpOGVYSUdUb2NBbTVvSHAv?=
 =?utf-8?B?RE9Bcytmb00weEhDRFg3K1IyakZBMGkrOUt2YzVpckFFNk93dlVWdG5lSFYw?=
 =?utf-8?B?b2hZcWU3L21TbldHVHp6QlljSVVXcUpabWNCNHIyQXQzclVGK0I3bSszNzY4?=
 =?utf-8?B?aFpHVTl2eTNmQVpRMWlkMUlERGd5VVpwenJ1Q09jcEtVUVZ0cE5ETHVhaDlE?=
 =?utf-8?B?alNyVVNqVHVJZnROSGgwMWV0M2Vra2N4Q3FLU1dzOHNqdWhtcmxhazdTaURr?=
 =?utf-8?B?V3NRUW5wcDYvanJtSlJBRWFRSVpLZTFzRXhldjdHaFB5WTZOeE1TN0VVKzh5?=
 =?utf-8?B?WWR4MSsxTzEzZTIxUDFYeHdmamc2ZmNFMFhpR2xBSTh6L01oTmdTYlVtSGJZ?=
 =?utf-8?B?VFVSNlQ2dFdLRklPMngrNzBxZFc3MEZKdDN5bGNMS3Zhd1diaFcyM21NdWpJ?=
 =?utf-8?B?b25mWkV3YWNxa2kyQnFWYlBPUUZkQi9rc1J0c1ZmQWticzZwMEZ2RXVDQjBa?=
 =?utf-8?B?UXJxbUIvMk1FNjBaMGdxOEprL3ZnWXh5cWRabjljVy9VbDRjZEhYclM2MjJ6?=
 =?utf-8?B?bXdUdHNNTzBaTmFXaGdJSGVOOWJZU25lUmlRM2k0c2hDbWc5VzhPZkpNcXhq?=
 =?utf-8?B?clhrSlF1T216bk8wNzdBNnBtUWFlSUdaa05hMC8xQTJHQ2tMWnV0UHJ2U3JQ?=
 =?utf-8?B?NlV6ay9nVDZxQk5JZWpiMUJVVzZTSWEveGQ1Z243NWVvNGRDa0gydkpldnRj?=
 =?utf-8?B?R3dPUzR1S1JTcjFpWFRkUFNNU1o2VTZyK04wVFJIWmZ4SmFoVTBMbHV3Z2JR?=
 =?utf-8?B?dTJlRFYrNjlEN2VFMjlPcXR3cHhNQUdtNjJSalozTU55dDJmM1o1alF1dlNH?=
 =?utf-8?B?NnllTTlWc0JENFArTDNzUFU2OEFEeTBDL1hpdmM3dDhZVXdpcFRBTHpJblBo?=
 =?utf-8?B?VXNBMjJVekZzMTV2aENDb0RTUm5KSDZQR0JlQTJDcTlvK1RxREZReHFjY3VN?=
 =?utf-8?B?bktNYUVrd3FVZEhGUmJmZElZRHphSXM3YmJ4YVpUd0dEUWFCdUV1V2VZOFBJ?=
 =?utf-8?B?T3BNWXVpK3Z0NFdnNnIxYTlRSUVjYWdXTCtMdktBU3hBNXVDQk5wRG5WNHpu?=
 =?utf-8?B?SVMzUlQ4WEhxdUpHaldRTk5jVmI3WmY1VjJYYmVXMG12Q3Vmc3RaVjhOM2Fk?=
 =?utf-8?B?TDZqWURMY0M3NUhwWGh2Z3ZiczY0eWRwUmU2dDBtNlhmQ2dhMldqcU9xZUJY?=
 =?utf-8?B?Y0REOFNrblhZbGNwL3RnTTJNUmlQVzdzNHJncFp4bDBUMEcyc2Vtdnp6N05Q?=
 =?utf-8?B?V1Q4NVRzVElURXZkenRBb1lHSE1vR0FlT0crSW5JZW1KN2NDSjZHSDJIZTY3?=
 =?utf-8?B?RGVLWXVJaCtQcUhRcnA5SEdoZjc0a2xmTEsyUjVUc3g4VVZLQXF6dVZ6RE9v?=
 =?utf-8?B?blRLVjA4MmFLZWxINC90SWF6S1ZOdGIzTUxHZTlLc05mQlVVNjcwUDVVVTJF?=
 =?utf-8?B?NzlQTm83eWRHMkZ0NVh1ZHpTVUVFZUxrdnFKcE4xcDNoUTBxOFplMVJneXho?=
 =?utf-8?B?aWNGUGVqOFUxRnlWUE1oM2xXWXNVcVZiaUh4SjcydklBY0RrU05McnJtV21y?=
 =?utf-8?B?eU1rME1yeHB6eFY4bnJkVHZmR1Jqam5jeHZ5N0JMUEZVdENGbzBudFdZMXdU?=
 =?utf-8?B?aWpTUXhrcURGS2tQS0xicFo0SWgreFZxL3A3cEE0Z3NIN1h4M1V4eG4xaXND?=
 =?utf-8?B?b2ZaKys4RE1sRDZtUlp5b09RVFVUNU1mMXBjd2VPSUZXZEltMkc2N2s5Y0ZU?=
 =?utf-8?B?d0NLSXNsMGd1SDdvM2IvVHNaa0RSNDUrQXlnTE9kKzhCRmllcHFacFBiRTFZ?=
 =?utf-8?B?djNmRDNGa0JwSUttVkFPNVQwMitURXNKRWFlWDl4VVd0eHpRRXlXWUFyNG12?=
 =?utf-8?B?NW1URDhhb1JWVjZ4THhOc1AyOTZPRytZem5nWDhOTTNqV0oyS0IxdXN0OXNq?=
 =?utf-8?B?c0UrSFlyaTFxaUwybitPQ0JieWpUTzgrQVkvbW1NazRtRDdQcUUxWDJuYTV1?=
 =?utf-8?B?ZTljM1IxVXpiMzNHdU4yYk1LaTczelc5V294d1pUcGNOMEE1MDE2OHMvQzN2?=
 =?utf-8?B?d1lZMGcxTThwZWxnc2orNE1PK1c2UzNlc01LK1BFTWZmOVBXeTFRY2xza3RE?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7E7BDBA7A46464395AE20A4D708AD54@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17de78c-31a5-408f-64b6-08ddce000736
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 17:56:07.2295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+ri2DE1ZupDXzeADz+v9UyM7x/Bv2hMjrrkQ2iprcXmFB2yd79Ym8t52P9zI2JmKF8HAuJTqAVTr9tFiz6OWvW6KM00pFNpqoKJwGy0SHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
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

T24gTW9uLCAyMDI1LTA3LTI4IGF0IDE0OjE3ICswNTMwLCBCYWxhc3VicmFtYW5pIFZpdmVrYW5h
bmRhbiB3cm90ZToNCj4gRG9pbmcgZGV2Y29yZWR1bXAgaW5pdGlhbGl6aW5nIGJlZm9yZSBHVCB0
aG91Z2ggbG9vayBoYXJtbGVzcywgaXQNCj4gbGVhZHMNCj4gdG8gcHJvYmxlbSBkdXJpbmcgZHJp
dmVyIHVuYmluZC4gQmVjYXVzZSBvZiB0aGlzIG9yZGVyLCBHVC9FbmdpbmUNCj4gcmVsZWFzZSBm
dW5jdGlvbnMgd2lsbCBiZSBjYWxsZWQgYmVmb3JlIHhlIGRldmNvcmVkdW1wIHJlbGVhc2UNCj4g
ZnVuY3Rpb24NCj4gKHhlX2RyaXZlcl9kZXZjb3JlZHVtcF9maW5pKSBsZWFkaW5nIHRvIHRoZSBm
b2xsb3dpbmcga2VybmVsIGNyYXNoWzFdDQo+IGJlY2F1c2UgdGhlIGRldmNvcmVkdW1wIGZ1bmN0
aW9ucyBtaWdodCBzdGlsbCB1c2UgR1QvRW5naW5lDQo+IGRhdGFzdHJ1Y3R1cmVzIGFmdGVyIHRo
b3NlIGFyZSBmcmVlZC4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgY3Jhc2ggaXMgb2JzZXJ2ZWQgd2hp
bGUgcnVubmluZyB0aGUgSUdUDQo+IHhlX3dlZGdlZEB3ZWRnZWQtYXQtYW55LXRpbWVvdXQuIFRo
ZSB0ZXN0IGZvcmNlcyBhIHdlZGdlZCBzdGF0ZSBieQ0KPiBzdWJtaXR0aW5nIGEgd29ybG9hZCB3
aGljaCBoYW5ncy4gVGhlbiBkb2VzIGEgdW5iaW5kL3JlYmluZCBvZiB0aGUNCj4gZHJpdmVyIHRv
IHJlY292ZXIgZnJvbSB0aGUgd2VkZ2VkIHN0YXRlLg0KPiBUaGUgaGFuZ2VkIHdvcmxvYWQgbGVh
ZHMgdG8gYSBkZXZjb3JlZHVtcC4gVGhlIGZvbGxvd2luZyBjcmFzaCBpcw0KPiBub3RpY2VkIHdo
ZW4gdGhlIGRldmNvcmVkdW1wIGNhcHR1cmUgcmFjZXMgd2l0aCB0aGUgZHJpdmVyIHVuYmluZC4N
Cj4gRHVyaW5nIGRyaXZlciB1bmJpbmQsIHRoZSByZWxlYXNlIGZ1bmN0aW9uIGh3X2VuZ2luZV9m
aW5pKCkgd2lsbCBiZQ0KPiBjYWxsZWQgd2hpY2ggYXNzaWducyBOVUxMIHRvIGh3ZS0+Z3QuIEJ1
dCB0aGUgc2FtZSBkYXRhIHN0cnVjdHVyZSBpcw0KPiBhY2Nlc3NlZCBkdXJpbmcgdGhlIGNvcmVk
dW1wIGNhcHR1cmUgaW4gdGhlIGZ1bmN0aW9uDQo+IHhlX2VuZ2luZV9zbmFwc2hvdF9wcmludCBi
eSByZWFkaW5nIHNuYXBzaG90LT5od2UtPmd0Lg0KPiANCj4gV2l0aCB0aGlzIHBhdGNoLCB3ZSBt
YWtlIHN1cmUgdGhlIGRldmNvcmVkdW1wIGlzIHN0b3BwZWQgYmVmb3JlDQo+IGRlaW5pdGlhbGl6
aW5nIHRoZSBjb3JlIGRyaXZlciBmdW5jdGlvbnMuDQo+IA0KPiBbMV06DQo+IEJVRzoga2VybmVs
IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAwMA0KPiBX
b3JrcXVldWU6IGV2ZW50c191bmJvdW5kIHhlX2RldmNvcmVkdW1wX2RlZmVycmVkX3NuYXBfd29y
ayBbeGVdDQo+IFJJUDogMDAxMDp4ZV9lbmdpbmVfc25hcHNob3RfcHJpbnQrMHg0Ny8weDQyMCBb
eGVdDQo+IENhbGwgVHJhY2U6DQo+IMKgPFRBU0s+DQo+IMKgPyBkcm1fcHJpbnRmKzB4NjQvMHg5
MA0KPiDCoF9feGVfZGV2Y29yZWR1bXBfcmVhZCsweDIzZi8weDJkMCBbeGVdDQo+IMKgPyBfX3Bm
eF9fX2RybV9wcmludGZuX2NvcmVkdW1wKzB4MTAvMHgxMA0KPiDCoD8gX19wZnhfX19kcm1fcHV0
c19jb3JlZHVtcCsweDEwLzB4MTANCj4gwqB4ZV9kZXZjb3JlZHVtcF9kZWZlcnJlZF9zbmFwX3dv
cmsrMHgxN2EvMHgxOTAgW3hlXQ0KPiDCoHByb2Nlc3Nfb25lX3dvcmsrMHgyMmUvMHg2ZjANCj4g
wqB3b3JrZXJfdGhyZWFkKzB4MWU4LzB4M2QwDQo+IMKgPyBfX3BmeF93b3JrZXJfdGhyZWFkKzB4
MTAvMHgxMA0KPiDCoGt0aHJlYWQrMHgxMWYvMHgyNTANCj4gwqA/IF9fcGZ4X2t0aHJlYWQrMHgx
MC8weDEwDQo+IMKgcmV0X2Zyb21fZm9yaysweDQ3LzB4NzANCj4gwqA/IF9fcGZ4X2t0aHJlYWQr
MHgxMC8weDEwDQo+IMKgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwDQo+IA0KPiB2MjogRGV0
YWlsZWQgY29tbWl0IGRlc2NyaXB0aW9uIChSb2RyaWdvKQ0KPiANCj4gRml4ZXM6IDQyMDlkNjM1
YTgyMyAoImRybS94ZTogUmVtb3ZlIGRldmNvcmVkdW1wIGR1cmluZyBkcml2ZXINCj4gcmVsZWFz
ZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEJhbGFzdWJyYW1hbmkgVml2ZWthbmFuZGFuDQo+IDxiYWxh
c3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQoNClNvIEkgY2FuIHNlZSBob3cgdGhp
cyBmaXhlcyB0aGUgcHJvYmxlbSBmcm9tIHlvdXIgZGVzY3JpcHRpb24gYW5kDQpsb29raW5nIG92
ZXIgdGhlIGNvZGUuIEkgdGhvdWdodCBnZW5lcmFsbHkgdGhvdWdoIHdlIHdlcmUgdHJ5aW5nIHRv
DQpkZWNvdXBsZSB0aGUgZGV2Y29yZWR1bXAgZnJvbSB0aGUgdW5kZXJseWluZyBzdHJ1Y3R1cmVz
Lg0KeGVfZW5naW5lX3NuYXBzaG90X3ByaW50KCkgaXMgZ3JhYmJpbmcgYSBsb3Qgb2YgaW5mb3Jt
YXRpb24gZnJvbSB0aGUgR1QNCmF0IHRoZSB0aW1lIG9mIHRoZSBwcmludCByYXRoZXIgdGhhbiBw
dXJlbHkgYXMgYSBzbmFwc2hvdCB3aGljaCBkb2Vzbid0DQpzZWVtIHJpZ2h0IHRvIG1lIC0gd2Ug
c2hvdWxkIGJlIHRha2luZyB0aGUgc25hcHNob3QgYXQgdGhlIHRpbWUgb2YgdGhlDQplcnJvciBh
bmQgdGhlIHByaW50IHNob3VsZCBqdXN0IGJlIHJlbGF5aW5nIHRoYXQgaW5mby4NCg0KU28gbm90
IHRoYXQgeW91ciBjaGFuZ2UgaXMgYmFkLCBidXQgSSB0aGluayBpdCBtYXNrcyBhIHByb2JsZW0g
d2UgaGF2ZQ0KaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoYXQgZW5naW5lIHByaW50LiBJZiB3
ZSBjYWxsDQp4ZV9ndWNfY2FwdHVyZV9nZXRfcmVnX2Rlc2NfbGlzdCgpIGF0IHRoZSB0aW1lIG9m
IGZhaWx1cmUgcmF0aGVyIHRoYW4NCmZyb20gdGhlIHByaW50IGl0c2VsZiwgZG8gd2Ugc3RpbGwg
c2VlIHRoZSBzYW1lIHByb2JsZW0/DQoNClRoYW5rcywNClN0dWFydA0KDQo+IC0tLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyB8IDggKysrKy0tLS0NCj4gwqAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2UuYw0KPiBpbmRleCBkMDRhMGFlMDE4ZTYuLmFlNDhjZDNjN2JmMCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2UuYw0KPiBAQCAtODIxLDEwICs4MjEsNiBAQCBpbnQgeGVfZGV2aWNl
X3Byb2JlKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOw0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0K
PiDCoA0KPiAtwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9kZXZjb3JlZHVtcF9pbml0KHhlKTsNCj4g
LcKgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiBlcnI7DQo+IC0NCj4gwqDCoMKgwqDCoMKgwqDCoC8qDQo+IMKgwqDCoMKgwqDCoMKg
wqAgKiBGcm9tIGhlcmUgb24sIGlmIGEgc3RlcCBmYWlscywgbWFrZSBzdXJlIGEgRHJpdmVyLUZM
UiBpcw0KPiB0cmlnZ2VyZWVkDQo+IMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gQEAgLTg4OSw2ICs4
ODUsMTAgQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9XQSh4ZS0+dGlsZXMtPm1lZGlhX2d0LCAxNTAxNTQwNDQy
NV9kaXNhYmxlKSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9ERVZJQ0Vf
V0FfRElTQUJMRSh4ZSwgMTUwMTU0MDQ0MjUpOw0KPiDCoA0KPiArwqDCoMKgwqDCoMKgwqBlcnIg
PSB4ZV9kZXZjb3JlZHVtcF9pbml0KHhlKTsNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7DQo+ICsNCj4gwqDCoMKg
wqDCoMKgwqDCoHhlX252bV9pbml0KHhlKTsNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDCoGVyciA9
IHhlX2hlY2lfZ3NjX2luaXQoeGUpOw0KDQo=
