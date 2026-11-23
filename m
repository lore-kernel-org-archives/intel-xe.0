Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39245606A32E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GjoEEm+2;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=A25S4Cjg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025E210E79A;
	Mon, 23 Nov 2026 09:29:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FF610E0F5;
 Mon, 23 Nov 2026 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795426149; x=1826962149;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ug0nqVo4JAV/Ds52/0IWI1ajJ0UxKkcelyv47IxxIA0=;
 b=GjoEEm+2r1DAVzvouFjZhZdBQRpL7n20Axy386dP74EC11p4mnAM/+q1
 CqET3liHajXE9JDV/tXuVODRn3NAF5ZJ0SnmJRy8QV5KxIlkYLJsAj2SD
 eICIe4rmzt+O+4jJMjeB8hVinZF1jFUmNCEy6flGZsJZY/Olpw4k5ZWHO
 T2SNSVWq+hg2377jltVwzESGmmgng7lNGGhCOghe+JMeeXRfKQ+SfYDFf
 JNtTJynFMUO0VnYmG6/SQcFXs+V4uOYbrK6y4du4XDtCf4LkOldeLzOlW
 9k4T3tSmOBw1btnSqpHlJrRSzdnto6bv5JGm6/okBhyG6pWygzcdHGcI+ w==;
X-CSE-ConnectionGUID: hdFf1hl2Q3Gddkx2fKtL5Q==
X-CSE-MsgGUID: p9NY/icdT+CRbNb2Yq8BSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4120624"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4120624"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:29:09 -0800
X-CSE-ConnectionGUID: qihgskGUR/SD8PTKrYO9Aw==
X-CSE-MsgGUID: Q9xXPlaASr2blV+m3Ce5fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11400417"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:29:08 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:29:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:29:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:29:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHw5hisuj4p5FJ4Pto2cJR0Evs6NFEFzuWNwMoXoOd+f8SQ334LDElv4mXR0AR/r0/sxm4FBYY38JUaVA/rREVdmngw9R+PUleNOFc1z/a0iArWPTYoMyAy4ZgmjvX/+h57HaR2Cf7rT7s6HCQb04v04ZHjcZ+GLYY0lj8pyfVALlfB7FUYIkx7YmlkTw7ar1bffNFObvJ3wdiI8C5SejS9xOQjywzg5MIJVlnGXtS7L1tyMCRCtnK6wW9FeGuXKmyDflk2hq9y86BLRwJmloLqd8r8H4NvrunPSKYEVruvdXswSk+bhgRQFggT0tFSnNnxECB4K2z2kBRDukxPNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug0nqVo4JAV/Ds52/0IWI1ajJ0UxKkcelyv47IxxIA0=;
 b=OI023CiRVmY4jBo/0oQcgnHZj80wBId6vicjDFpuBmtuozppQ9bH33r9aoELxv+PcyE3jrwGzkBMX0rgdX6J68d519NMvs5PpCbe7Ekwir3oXKgKZj7ZYYzES2k9/ps2Fl2bskx/vSfUrKIhX5i0LQ3q6VPBbjebBCC7HC7d81ndqRL2JvqGh+5vr5O4YO+KcMbhfNFax6cdQdbFZKxY0nTIG8iW2i6+wNtIRbqdMHXexTxOfIz4sHusa/rmB3w+sV427/1EVbZKerMWoqMLWfJBUpW6j5cfkUhRYczgtgGQh2USsN2rG17zAULo9LcoE9GedoTvM3EoG5u8rsXRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug0nqVo4JAV/Ds52/0IWI1ajJ0UxKkcelyv47IxxIA0=;
 b=A25S4Cjg8bbnFjlkiylcKdUxRtgTOKYQ9DvE3iZus9xpAa9In35UjDIu5GEujAVNm/IQP2IDfMBA9qdTfmR5h5CxJealapW9fQvqQmh6chF0Xkm6te7d7poXNk+Gtz6zRphGv5/T6Yo7S1HxV2Af9152bPbUiYj+DtJxUWSDSzw=
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 FT1PR11MB875833.namprd11.prod.outlook.com (2603:10b6:170:37::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 09:29:01 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:29:01 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "j@metarealtyinc.ca" <j@metarealtyinc.ca>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, 
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Thread-Topic: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Thread-Index: AQHdVd7OB1r9KQ3+QkGsgdXDuCF/37c2+zcAgABZjACAABl2AIAADcqAgAQyYQA=
Date: Mon, 23 Nov 2026 09:29:00 +0000
Message-ID: <ba1ee8b0cd9bde1c1b93048a5d3a29a867dac8e1.camel@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
 <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
 <awBhLKnEiGt69Vr7@intel.com> <20261120163416.66175-1-j@metarealtyinc.ca>
 <awCCGeCxHToY8tsI@intel.com>
In-Reply-To: <awCCGeCxHToY8tsI@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|FT1PR11MB875833:EE_
x-ms-office365-filtering-correlation-id: a4648453-6a5f-4b66-1473-08df4944353b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|261021123027099003|261021135927099003|261021121427099003|10067099003|261102123227099003|38070700021|11063799006|4143699003|56012099006|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: FSkdqf7tqJ/bx80sjP7w5a3O9GBiChaubkevxFsdB3LKQfhKCdg81JXodmJeDZ93HyBYYp80ljlZBq3HqcmBtZoh2iAhatb7GWCEnU1+VsERfNQqhjmboENtLra+VpH05wD29mXDJnaOP2NaJIZcy6PLNAnN7vh25MVHY7/afYb5tIbC+Rjr/IUtu+LoUFajeBu1jIEe7z4NU/UMKZz3zd83dUmL83IKA5K0XdaZ6mUI6UfHdeIjQCYjaQTIwG4+70wQb4qvyyAz9CUWXX+vt4Nw16U5dbRf/+K6e8JAMiWDJniiRqR90RFZmz2fQIjz1URo+5DJH9uyma2vA/s+1xWPEYoWRQ5gE1VL4W5b2+KfIV0DLnotLtPrq5IKndE/yGiVRYRMCyu2PDroOFhdzc34HfBX0DQahmBGsn5rQ0hE/9ZbVOPnVT6M/ggF53pHXR6iF5c66sC+OSpFZGUErO/WKHJI9xfLevO270VuAsxbKVTF36Gh1kRyVWnK7E4A1hZSx2BBzayo8cOgQ8tXMUkc6IIFJG3D7eMTxQWkv+5uVvWwWV7wjxG/PqJoAmbOy7+XptLp+nNMpjctEPrPW2toOvmnBxX/idLHQkNO8fEp7cWhQlQqmVetgQCbH4VBbz34Ydby4T/+58XUDxFhHulD2iazj2PNXqwQe/5KQC13OiaSa4+e8f2R6POxpj5L2LNjClxR36HFChJflnTVqE821mFa0DOmS1WHVuBLTBk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021135927099003)(261021121427099003)(10067099003)(261102123227099003)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1FzVTlrSnprbDU2U0p5SHlIOHZEa2RVQWZhZGtYVjcycUo2bGtOTEh3Zk5z?=
 =?utf-8?B?S3RsR2E4eXdOVzZ1VGNsY0ZKUzhZTFRHcFF1ZXBkbkowQTZXWjBUbjU2eWZx?=
 =?utf-8?B?cW5Pd1BRS05tYmJXNExYcXZyVzFQK0M5Y1cwZWFjd202anJoRWlnNXBGZms4?=
 =?utf-8?B?NGIwd2xxV01zMkNCT25zWTlJYVBvL3F3aEF3dEZ6dHN1OXFYUjhNSWpGM0lx?=
 =?utf-8?B?Vmtyekx0SUNLSXpIVEtPKzIrNHVLcWp4YWRCdnBzS20vd0hKNlJ3Y1lzM1Bq?=
 =?utf-8?B?dUMzU0tTeDdCcHZCQjMrQ0cwUkk1RlVHalVMQUZXVUdUcWF2a2RlOTd5bjkz?=
 =?utf-8?B?Q2ErY2xMVzR1UDZPS2V1b1JOWmRsRmx1WUlqdnpwRURKQ1VUQ2UzT0VubXFx?=
 =?utf-8?B?SU5Wc1ZqZUtmQXE0STIzWEIvRkJXK3JGQ3gzYldCb0dmMDU1K3Y1dFduRnBp?=
 =?utf-8?B?TDB0M0RXeW1LZkJWejUvUjJmYTFQQzJiU2dZekR3dGxXWk1SeW5xMUZFcW5F?=
 =?utf-8?B?TGQ1NFNLWFlJRWp1U09YZEhqUjdsNy9kVGtaVCs5ek1iV1dSTTVXamswRjIv?=
 =?utf-8?B?M1Zlem52bmdSTStzblh1ZFJkMW8rMXg2ek10ek5pdURTN2k3YktQTmV3Wm9B?=
 =?utf-8?B?MG5INTRHWVNMaEpnRnAxb1EvTkY5RFdIWkhILzNFejRQNzhUS0RJMExhMUxK?=
 =?utf-8?B?ZE5hNDhSQWU5eXM1RXpaV243UFNCbzNyM0VVczN4UjZQZGdIcnFDeFRNWnNv?=
 =?utf-8?B?dEEyeGhYajdRUW1qaURILzdtNUdIKzM2amlaZWo1SW1kMVdqM1QzVE1WVEcr?=
 =?utf-8?B?djRrRHNaMEhrYWIxRjVrQys1b3pueTlMRzJZZExLbTlOQTBick0vY0FkWTRJ?=
 =?utf-8?B?VzZCSUxpdGdTT0RMSU9mRDU2dzREcVpVbDJTNEwxOGxZRVZjaERNSjBqSXVL?=
 =?utf-8?B?S3Q2MzR4ZEJPVnIySlF4L2FWYnFKaHBEUHNNYzBxaFc0QWQ0TUlzWFFWYzV4?=
 =?utf-8?B?b09pNVlOM3RpdkhtRE1nemx1VThkanJyQWI2ODhXMU9ZYWFPUkZxeW9pNUFk?=
 =?utf-8?B?MEFyQ2Rzd2hWSlpNSEsraW42aTNTVzErM1JrcENXWlFjaVNWemkyTDRPU3ZG?=
 =?utf-8?B?aGxuNCswM1Rrc0xzdVRLeVdOS3RhVVRkMXhndUVzQVZRdEZzbG0zU0IvN2tP?=
 =?utf-8?B?OWt4NTNHdzFoeWkxRjZ5R1R0ME9PU2hISEE4MWIyNlp2K1dKOTZMYzRwU3Q1?=
 =?utf-8?B?dXNsTXZ3S29ZMFJrWkJTV2FpdVpubmZwTmVQUmNRZ0NWeVV6RFV4aHREWEtX?=
 =?utf-8?B?TEFoVWdFa0NMNlFBUmFuOVoya2tLZ3IxU3RPQjRCZDVyL25McmVyTEJ4TGNi?=
 =?utf-8?B?YmlIMHkvc08zcUFVdmRKdlEyeHk0WGpLMXJXem1zWUJlQnFzRHRuLytFRmFD?=
 =?utf-8?B?Q1BNTnRWcFRkTXNMUlhDN0ExVmh3RllMbjVXRUFqL0ZWa2JKaHlVanNHL0pQ?=
 =?utf-8?B?cDNnRWNNNXRwK1NOMWh3NXVIUFdRWEU2MUc1Rk8wM1FlS1FWMXFaNm9sV3Ez?=
 =?utf-8?B?TnFSM3pWckdXT1VKVkJVTEtuVzN1RURQNnFNODZYckJaaHRGLzhxaG1WSTVB?=
 =?utf-8?B?Y2tLWU5mQ0NLSjNwSHBLN3JlK1hmKzR4MGt1Vyt5V0psOFhIR3Bva24za0pC?=
 =?utf-8?B?WTBLL25lemNodDQ2bWgvNmtEMHZjWm1keUp0OVcyRnhPSEpyRThRQTNTalhQ?=
 =?utf-8?B?c0ErYllFR3pvRGFCMnN4SlEvbTdabXlnY3RPTHFMREhUMUJwMnVBT25jS2JO?=
 =?utf-8?B?MUduVkdadDI5bjBiWDBjeHJ5cnZHUzhWd2xsSThISlpRdXYrU1VBWU41TVRZ?=
 =?utf-8?B?ODRWVytGYVlhcDlhb2YyaUQ5YVNUK2xDMXgwci8vVCsyVk16WGJFdlVvemZx?=
 =?utf-8?B?WHFnSVpqbExnY2IvMnNkTEUxenFlMHAxeC8wWHk4UHpkRllhZTRQa05QNEQy?=
 =?utf-8?B?OTM1MHhmZmJEWDl6V3ZZNzRmK2tTSG5lc2Nhb1Z1bWJCSHlxVW5zanU1N28v?=
 =?utf-8?B?Mld6TFNUT2l5L2FBd0ZyaWlKaDlTS0hKbUN3cGJHUmlqZy9tcjlaUVNrbFBs?=
 =?utf-8?B?NUV6ZDJqdUZiYUNRMnNWTFg1ZmM1dEkrWUo4eWcvZGhDaXMzdWc3dWxCSzNN?=
 =?utf-8?B?elN4TWsxUG9MV0NHQlVVSXNvc1ZtZDZvMVc3T0ticVRobFhYUUFMM2t4elkw?=
 =?utf-8?B?QjBvd2N0NnltUzh1N3V0T1hqRUZ3UXpRa1JOenlrcFJvMDZOTWZPS1MrSmsz?=
 =?utf-8?B?MmoxWE5kd0Q1ZUFHaFU5YkwrSDRxNFAwL3dsbUpXVENySGo1YjI3YzJFSHdt?=
 =?utf-8?Q?P53a+FnMAjLxol4U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B457EBCAEE19954180C7205DD04F80F2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: P9Hd0JThVlPgEHPcBUE/wy90oD0l1XVJb2JdGuKyvHnXNQeGRs6H/M+BlFktkz0rrEYLWtu9/JEF32zEHUNLiXUaHi4Nl/ytqVzZQ7WAbBswgvFiHUWJeH7w3QsPr3LAh3XsamByq/hXikBgw2cDueDRpTT/OqP7b21XYtq1cjb9xIVb00IDe77OVwJ7ybQ/3LHnFhuL6kg9G1csvIuS8IyX8czUqYedfyOJYhTWUA99bA4LutvgJmkIkBhX2TERZ0nOarhVgrWzrVAwHWCk0mV+CEq2YMD4KT/JL/jUdmDwDicSuP1X8OqiWmkfv76auEBlEabnoa6esi9/Y46xVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4648453-6a5f-4b66-1473-08df4944353b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 09:29:00.9414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c60Sih71YMfYN5zxGFLCO5DZVqLhZVmpVUbH+CQZ0tvIZOPZmg+b7APhbAo5gf12AlEBdOCaycD2QlhFoLm50lwZtEj0ZGDE2G9D2sb4UfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB875833
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE5OjIzICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIEZyaSwgTm92IDIwLCAyMDI2IGF0IDExOjM0OjE2QU0gLTA1MDAsIEpha2UgU3RlaW5t
YW4gd3JvdGU6DQo+ID4gSGkgVmlsbGUsDQo+ID4gDQo+ID4gT24gRnJpLCBOb3YgMjAsIDIwMjYg
YXQgMDU6MDM6MDhQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOg0KPiA+ID4gSXMgdGhp
cyBzb21lIHdlaXJkIGhhcmR3YXJlIHF1aXJrIG9mIG91cnM/IEkgZG9uJ3Qgc2VlIHdoYXQNCj4g
PiA+IHZibGFuaw0KPiA+ID4gaW50ZXJydXB0cyAocHVyZWx5IGFuIGludGVybmFsIHRoaW5nIHRv
IHRoZSBkaXNwbGF5IGVuZ2luZSkgaGF2ZQ0KPiA+ID4gdG8NCj4gPiA+IGRvIHdpdGggdGhlIGV4
dGVybmFsIHBhbmVsIHJlY2VpdmluZyBTRFBzLg0KPiA+IA0KPiA+IFRoZSBwYW5lbCBkb2Vzbid0
IGNhcmUgYWJvdXQgdmJsYW5rIGludGVycnVwdHMuIFdoYXQgaXQgbmVlZHMgaXMNCj4gPiB0aGUg
QVMNCj4gPiBTRFAgd2hpbGUgZnJhbWVzIGFyZSBiZWluZyB1cGRhdGVkLiBXaXRoIHRoZSBBUyBT
RFAgc3VzcGVuZGVkIGluIFBSDQo+ID4gQWN0aXZlIGl0IGp1ZGRlcnMsIGFuZCB3aXRoIGl0IHNl
bnQgYWxsIHRoZSB0aW1lIGl0J3Mgc21vb3RoIGJ1dA0KPiA+IERDNS9EQzYgaXMgYmxvY2tlZC4N
Cj4gPiANCj4gPiBWYmxhbmsgZW5hYmxlIGlzIG9ubHkgdXNlZCBhcyB0aGUgImZyYW1lcyBhcmUg
YmVpbmcgdXBkYXRlZCINCj4gPiBzaWduYWwuDQo+ID4gVXNlcnNwYWNlIGhvbGRzIGEgdmJsYW5r
IHJlZmVyZW5jZSB3aGlsZSBpdCBmbGlwcywgYW5kIFBhbmVsIFJlcGxheQ0KPiA+IGFscmVhZHkg
aG9sZHMgRENfT0ZGIGZvciB0aGF0IHdpbmRvdywgc28gc2VuZGluZyB0aGUgQVMgU0RQIHRoZW4N
Cj4gPiBjb3N0cw0KPiA+IG5vIERDIHJlc2lkZW5jeS4gSXQgaXMgc3VzcGVuZGVkIGFnYWluIGJl
Zm9yZSBEQ19PRkYgaXMgZHJvcHBlZC4NCj4gDQo+IFZibGFua3MgYmVpbmcgb24gZHVyaW5nIGZs
aXBzIGFsbCBjb21wbGV0ZWx5IGFjY2lkZW50YWwuIFVzZXJzcGFjZQ0KPiBhc2tpbmcgZm9yIHRo
ZSB2YmxhbmsgY291bnRlciBhaGVhZCBvZiBhIGZsaXAgaXMgbm90IG1hbmRhdG9yeS4NCj4gVGhl
IHRlbXBvcmFyeSB2YmxhbmsgcmVmZXJlbmNlIHRoYXQgcXVlcnkgZ3JhYnMgYWxzbyBnZXRzIGRy
b3BwZWQNCj4gaW1tZWRpYXRlbHksIGFuZCBpZiB0aGUgZmxpcCBpc24ndCBhY3R1YWxseSBjb21t
aXR0ZWQgZHVyaW5nIHRoZQ0KPiBzYW1lIGZyYW1lIGFzIHRoZSBxdWVyeSB0aGUgdmJsYW5rIGlu
dGVycnVwdCB3aWxsIGFsc28gaGF2ZSBiZWVuDQo+IHR1cm5lZCBvZmYgYnkgdGhlIHRpbWUgdGhl
IGZsaXAgaGl0cyB0aGUgaGFyZHdhcmUuDQo+IA0KPiBXaXRoIHRoZSBEU0IvZmxpcHEgcGF0aHMg
d2UgZG9uJ3QgaG9sZCBhbnkgaW4tZHJpdmVyIHJlZmVyZW5jZQ0KPiB0byB0aGUgdmJsYW5rLCBh
bmQgdGhlIG9ubHkgcmVhc29uIHRoZSBtbWlvIHBhdGggZG9lcyBzbyBpcw0KPiBiZWNhdXNlIHdl
J3JlIHVzaW5nIHRoZSB2YmxhbmsgaW50ZXJydXB0IGZvciB0aGUgY29tcGxldGlvbi4gSWYNCj4g
d2UgaGFkIGEgYmV0dGVyIGludGVycnVwdCBmb3IgdGhlIG1taW8gcGF0aCB3ZSB3b3VsZG4ndCBu
ZWVkIHRoZQ0KPiB2YmxhbmsgcmVmZXJlbmNlIHRoZXJlIGVpdGhlci4NCj4gDQo+IFdlIHNob3Vs
ZCBhbHNvIGJlIGxvb2tpbmcgZm9yIGEgd2F5IHRvIGhhdmUgdXNlcnNwYWNlIG5vdCBkbyB0aGUN
Cj4gdmJsYW5rIHF1ZXJ5LCBvciBtYWtlIHRoZSB2YmxhbmsgcXVlcnkgY29ycmVjdCB3aXRob3V0
IGFjdHVhbGx5DQo+IGVuYWJsaW5nIHZibGFuayBpbnRlcnJ1cHRzLiBUdXJuaW5nIG9uIHZibGFu
ayBpbnRlcnJ1cHRzIHJlcXVpcmVzDQo+IHVzIHRvIHR1cm4gdGhlIGhhcmR3YXJlIG9uIHBvc3Np
Ymx5IGVhcmxpZXIgdGhhbiBuZWNlc3NhcnksIHdoaWNoDQo+IHdpbGwgd2FzdGUgcG93ZXIuIFdp
dGhvdXQgdGhlIHZibGFuayBpbnRlcnJ1cHQgZ2V0dGluZyBlbmFibGVkDQo+IHdlIGNvdWxkIGxl
dCB0aGUgaHcgc2xlZXAgdW50aWwgaXQgYWN0dWFsbHkgbmVlZHMgdG8gd2FrZSB1cCBmb3INCj4g
dGhlIGFjdHVhbCBmbGlwLiBUaG91Z2ggSSBkb24ndCByZWFsbHkgaGF2ZSBhbiBhbnN3ZXIgaG93
IHRvIGdldA0KPiBhbiBhY2N1cmF0ZSB2YmxhbmsgY291bnQgZm9yIHRoZSBxdWVyeSB3aXRob3V0
IHR1cm5pbmcgc29tZQ0KPiBoYXJkd2FyZSBvbiBhdCBsZWFzdC4NCg0KQ3VycmVudCBpbXBsZW1l
bnRhdGlvbiBpcyBiYXNlZCBvbiBteSB3cm9uZyBpbnRlcnByZXRhdGlvbiBvZg0KUFJfQUxQTV9D
VExfQVNfU0RQX1RSQU5TTUlTU0lPTl9JTl9BQ1RJVkVfRElTQUJMRS4gSSB1bmRlcnN0b29kIGFj
dGl2ZQ0KaW4gdGhpcyBjb250ZXh0IG1lYW5zIHBhbmVsIGlzIHNlbGYgcmVmcmVzaGluZyBhbmQg
c291cmNlIHNpZGUgaXMgaW4NCnNsZWVwLiBUaGlzIGlzIG5vdCB0aGUgY2FzZS4gSXQgbWVhbnMg
UGFuZWwgUmVwbGF5IGlzIGp1c3QgZW5hYmxlZC4gSXQNCm1heSBiZSBhbHNvIGluIGxpdmUgZnJh
bWUgbW9kZS4NCg0KTm93IHdoZW4gdmJsYW5rIGludGVycnVwdCBpcyBlbmFibGVkIGl0IGlzIHRy
aWdnZXJpbmcgUGFuZWwgUmVwbGF5IGV4aXQNCmFuZCBlbnRyeSB0byBsaXZlIGZyYW1lIG1vZGUu
IElmDQpQUl9BTFBNX0NUTF9BU19TRFBfVFJBTlNNSVNTSU9OX0lOX0FDVElWRV9ESVNBQkxFIGlz
IHNldCBBUyBTRFAgc2VuZGluZw0KaXMgbm90IGNvbnRpbnVlZC4NCg0KUHJvYmFibHkgcmUtZW5h
YmxpbmcgQVMgU0RQIGlzIG5vdCBuZWVkZWQgb24gc2luZ2xlIHNlbGVjdGl2ZSB1cGRhdGUgb3IN
Cm1heWJlIEhXIGlzIHNlbmRpbmcgb25lIEFTIFNEUCBhbmQgY29tbXVuaWNhdGluZyBTVSB1c2lu
ZyB0aGF0IGluc3RlYWQNCm9mIFZTQyBTRFA/IEFueXdheXMgd2UgbmVlZCB0byBjbGVhcg0KUFJf
QUxQTV9DVExfQVNfU0RQX1RSQU5TTUlTU0lPTl9JTl9BQ1RJVkVfRElTQUJMRSBmb3IgdGhhdCBs
aXZlIGZyYW1lDQptb2RlIHRyaWdnZXJlZCBieSB2YmxhbmsgZW5hYmxlLg0KDQpCUiwNCkpvdW5p
IEjDtmdhbmRlcg0KPiANCj4gPiANCj4gPiBKb3VuaSBjYW4gc2F5IHdoZXRoZXIgdGhlIGludGVy
bmFsIGNvbmZpcm1hdGlvbiBleHBsYWlucyB3aHkgdGhlDQo+ID4gcGFuZWwNCj4gPiBuZWVkcyBp
dC4gRnJvbSBteSBzaWRlIEkgb25seSBrbm93IGl0J3MgdGhpcyBzaW5rIChMRywgT1VJDQo+ID4g
MDA6MjI6YjkpDQo+ID4gb24gdHdvIERlbGwgbW9kZWxzLg0KDQo+ID4gDQo+ID4gVGhhbmtzLA0K
PiA+IEpha2UNCg==
