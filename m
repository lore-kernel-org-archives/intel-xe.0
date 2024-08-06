Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E6DC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D74110E3E1;
	Tue,  6 Aug 2024 19:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6XynhXC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFEA10E3E1
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 19:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722972194; x=1754508194;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+MbVtL401BcpQWKApK05fyNkcw91k8EdUpZXn33Uy4c=;
 b=B6XynhXCFXql4rPhuzTkPQo1fszq4wKbbb3hRGbxEjSsgINc6Jt7XjQN
 U94c6icHXbdG7S2MZqTwRnQopyPRd+HCJu5N/4Oy0suhlK6ky0/PtuSwS
 2P6gKQ4Bdmm9//Pat6ONUbWsEKR0FHMOjhlLD9NRqlAffygHiM6IcZiQo
 DrCEc5C8XhXbVb86VBIN6hjKFhJr0YaIpfpOn5DMuIjh+3vvR8BPVjs8c
 FUGV8KcRas7PQcCPBE8XqC3oUn8J4nKw14l7iz1QkxAUgXRIMvDES1N/g
 B/uSL50qA4R7E27GxecEUqERhPBl2OoRkF1CeCKzzaEWkqtxmQAxKGKYQ w==;
X-CSE-ConnectionGUID: F+MN/iU0S6CWJQ9/sDIrFA==
X-CSE-MsgGUID: 0DHTjTsFQ/WyoN6VBcAPEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21136835"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="21136835"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 12:23:13 -0700
X-CSE-ConnectionGUID: U5wFge9bTKeS+uX+Sp0mPQ==
X-CSE-MsgGUID: EzxLffsZTmWKzWyNOAMC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56256471"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 12:23:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 12:23:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 12:23:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 12:23:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 12:23:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgTNvKJZ5FanX4bkn0qHbxa20JvGFlfrfxmmHCuWqiD1Lw2FElfDvIgSRPEtk6uucNRDfx1/TmCyihX6ogyP+c6/mHMN9aNrfUBhJ9r5gmAlxSXRqDB0IAjCb4W4uTibSE74+0+pSetQ+B3/MyimtrRkswqoZ9axgljrhB4moKxpHuCkL9kgu/yptB3/Bhn0PPZTWnu/0V19fSMlaXGxOaZSVOxoBgjSqGsqp3K3PiAVMXJB8kt/QWYZzv+ePAAAZ/wiTLhPxCsOEoZk32XWmPEPztE5Eu2uwgEPl+CkcTezytNDuilVklFM2+QF2qliIFMjNoID3kZVNCw+8BRJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MbVtL401BcpQWKApK05fyNkcw91k8EdUpZXn33Uy4c=;
 b=Zc5Pe6ZRzHkyz2x26r+0fARXHi5p3GJ+s3r4NdbVr0t5lsoNr0Q4nO77nb0VZXpw+7VTXCOPPXDGD1aBvlO8eIYoEh5AC7Ne79dFrYPwWSisi+BnRX7qfF0n7d+62cweHIjTfp9BDlM2qqTcJVRL2/9LbwIMZKD+rSPKL2YolZhIRYPHU/nhI562C/MBshYddDb3hw/sq/vBLh7epHux5JBDgYIK6urlakP1g5FjyIAh45VJFJp3HwqAzcmLHvPVR6WadSex9Auqb9OJKPSF6YxpgcimjdeXU6jenS/Iy0DHd7tBQJLr1K5A8h2wUxT1elnbkMt0HatZOZfUyMxIOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 19:23:10 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 19:23:10 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Add kernel doc for xe_hw_engine_lookup
Thread-Topic: [PATCH 2/2] drm/xe: Add kernel doc for xe_hw_engine_lookup
Thread-Index: AQHa6Bbw1M+4jRHIaUyC7324JeJxZbIam8Aw
Date: Tue, 6 Aug 2024 19:23:10 +0000
Message-ID: <CH0PR11MB54449EA265B0896576AF1B89E5BF2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240806153009.1081382-1-mika.kuoppala@linux.intel.com>
 <20240806153009.1081382-2-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240806153009.1081382-2-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8212:EE_
x-ms-office365-filtering-correlation-id: a31b46dd-40b4-4ffa-9cfe-08dcb64d3541
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aWJBRWdQbVZMdTBYV1pJL00rd1RFNmFEV3pPL0xreG5nWHA4K0lkSTRyTTRs?=
 =?utf-8?B?TUhCclBmRzJzWjRvOC8va2VXL3dNNjM3c3lCTVNPNlBXOWVuQ3A0cXA3UkVr?=
 =?utf-8?B?TFpqdVdUSGRQSGxvclczeXMyejJFc3pIN2UrVU9UN3UvQzV0Z0w4dkJCM3Qr?=
 =?utf-8?B?SUt4dGozeS9kcitQVTNFdGpmQkQ4bnM4NHVqTlhaL2dJTWlSSWJjcXNOdEE5?=
 =?utf-8?B?RUlDaFYyMHZ5RGlxa1Q0bk1aZ1Z0QWtsU2RxZ0s2a1VjcnNvRjlmYlpzek1w?=
 =?utf-8?B?cXF2cXhGcHdTWGFxenZWUlBRUVZYL1RoUHhocVB2V3ZtMGtFdmUySHNPM21x?=
 =?utf-8?B?eTlhMm1uNkt2SklxcmdlendKS3lmbEVNWXE0alpBcnliSVMyK214Wk56U2ND?=
 =?utf-8?B?YWpIZFpzd0dkR2lVL2dPVTRQWG0yTnNRVUlCY0luSlRUU0FqMFdKYXpHdTg2?=
 =?utf-8?B?QzAxQ3RYbXJxS21CVUhXeDhRdnowWFoxeHV5OFBZc0p0bndPTi80OEwrYVlN?=
 =?utf-8?B?cWNEQXRJc3VObWo2c1BUSDBOckh2Ky9KOGJ5OE93ODFmZ1NyOFhieldjenVO?=
 =?utf-8?B?Z2twVkhSUXNrNktnaytoV1hMeTNXMW9QdWJqbVR3Q2FXZ2FYNFEzQmNMbmhK?=
 =?utf-8?B?NCtTWHpNRWs2VVFPb0Rjdy9oL0N3T04wZkhuY3VncXVRcXIyUUFEUnUzcC9T?=
 =?utf-8?B?SHpzK0xkclVxZFNNaWYzcVVVV3FRaUxqZC9sRDZibld0RWJPdnV5eW9GYkZM?=
 =?utf-8?B?aEd4YW14bTRiT1VHTG5NOElTQ0xHbUJMMS9vUjYxclVjekFtcVE5eUwyNURL?=
 =?utf-8?B?eGRDdGVUdVhvckZJOW5CeSt6SjdHQ3FXNmxQV1pXaFpwNnVmMWZMUFE0NDhX?=
 =?utf-8?B?QnF5T25uNlNPWTk1T2Rsdk9ZUXBhM0djS1I1aWZiQmp6SzJXN2xOOWNiR0Ni?=
 =?utf-8?B?d1A0V2wvL0NLZjJSRTJBN053c3EwMTRxSitTbTdvUG5PNFhiM2wremVpTTh2?=
 =?utf-8?B?TWJRYjhGc2c3bFNYYkM5NmVGMnpicE12S2NRSitaMU4yTjhpQkszWmtJQmt1?=
 =?utf-8?B?TnRCT0hhNnVOZjl4SVQ0b0F3RXRKQlVGMy9jTHJKY2RVSlNJOEJnR3JVa2RU?=
 =?utf-8?B?ZXI1dmxVbkJMRXlHWFRSRmhadmJ3MkpoSXlydFpkS3hISFl4cHFYSXU0L1o3?=
 =?utf-8?B?WVkvY1k1WTBGc2dvUjdpMlFodzRWd0RzWGlhRzlVdnZoUGo4a2NTTUJGb1BM?=
 =?utf-8?B?WFpLTHhaZHhyNjNXMllDL1JXelZndGlROUhZQ3hxS284eVAvcWlMRXJYYVlC?=
 =?utf-8?B?RDEveU9uakVBdUptYkVqekd0aVB6L1FtT0dVVFh2bUlzdnN5T0FNdTVxVWFl?=
 =?utf-8?B?dVZzdW1remloYnRLY0Y0bUJiZ1BqVjRDWVhweWNIV3REQzZqa2VseWc5dmZY?=
 =?utf-8?B?WHQwY25uelVlRmhuR0JWKzI3bUFjcGlnT2JxLzZxaGhTSHBaUDhaejFQbG02?=
 =?utf-8?B?L0Q1QkJxSHNHazJ4YXJzQ0RTOWFxTVI4a1BZVlJRUC9TQjZkYTlXcUJxTjNO?=
 =?utf-8?B?T3I0MExQbG15dEZwaVFXZVJtajFBNFhjTC9DUTN2M0FkZzVuUi95c0ZLcnN5?=
 =?utf-8?B?K0JjVFN0NGwwVlQ1SFdpSXlQbytQV2E4Z3NGUHRudTRsbENnL3JoankyZjVO?=
 =?utf-8?B?ekZROWNPeDMvQ0Rudm1UdVdXWWEwTzk5MDI4M0ZXUVFwWUdwelpQZDNJcGxT?=
 =?utf-8?B?eUtjanU3M1JrMVo0UlJXckxaRlNROG1IZldBbjM5bzdIRUlsdHd0UldYck15?=
 =?utf-8?B?NEpTVkoyQUQ3cXNOWm5URzlhbnhwckxWL1VWZTl5QXN3aHFYVi9RNmNMb3ZY?=
 =?utf-8?B?eGpkK1pzSVAxLzdreUs4NzFpQjBRU00zQnlhTmlZbmE1cHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXRGNWpSazdacjhyWHpHeHMxWkVRZXZxM0o2UXUvdnRTc2pRWE00RUkrSkt1?=
 =?utf-8?B?Z1ZmWWlIaWFvOVBlMWdpMjlWdjEzYkpCRlhSTHBmNUxpYk9haGZPMmdwSDZH?=
 =?utf-8?B?d1hMTHowOEw3V0JUdVZVdFdodG9Hb0NWQkdUOW1GcEtjRHZ1NS9TOEVGT25h?=
 =?utf-8?B?NDlDN3FkVFY0Zyt1S1RuWUEyalZvR0h5VmEwQkc4dW5RLzZYZ2RIVnl4UGVM?=
 =?utf-8?B?M1doUkczTlFjNkkwOGFnTnNLbG5iZG8xelRDQk1YNW9hZEpROHJPV1UySHBl?=
 =?utf-8?B?djdzRVc3MkoyK0IzL1ZMUUNLYmhDUjZXYVFaNGVtdllRQjZjeDREZnpNTG80?=
 =?utf-8?B?T3JidXd4N0U0Y1o0Y1AwblVyVGNNNDdlSUpJTUhSbGVqa3c1cEV3Sm4rd21v?=
 =?utf-8?B?dmhYZktSQ3ZsS0k3UXRESWphZUZKa0Y1anEyemJrNEd0cVh4dldQblAvMmFM?=
 =?utf-8?B?b2J5WG5WUDJYNlNOK2lsYWNFMmlPY3RWbjNEK3RpU3FMS2taQmJjMWlYTHhL?=
 =?utf-8?B?cXN5L0luU3FsYWxMVGdHeUl5Ry9sTjg5djZMYVhEY1oxN3NmV1N4WjlWSGxh?=
 =?utf-8?B?UHVvQXpROE1rZlVCZWMxQ2xsdlprRHg0Q0V6WGl3OWtVNE92VjQzdTM5NWox?=
 =?utf-8?B?bWo1TkNTanZXOHdNd0hycGtoNTB1NDh3N2hnTU0weDBOREhsQjBHSjVwcGh4?=
 =?utf-8?B?VGMrMVVFVjhlcWZpdmxOU25zWk1CdFBCQlNmYk0xcEFIa2VqSGdMQm92bHpW?=
 =?utf-8?B?dlhIZ09aeTZSY25ETW9oUTE2YmVYb285eUZSRUptZFBRdlhYbmRHVFlJVXhK?=
 =?utf-8?B?U2xsN1hLL1NxSXJmUkNLdWxML1pGOWRqaGt4a1pkaVNhOU02UHZrWERkNndI?=
 =?utf-8?B?SFpRLzlYV2ZsMVdWMmpEMVlMYTBZRlVTWWtOcjJNekYxalU2dzQyRVJtR0pW?=
 =?utf-8?B?bDR2UHArSFMrUWYrQzlvZlZES3BrcU9YUUhmcEdrbEFpTUJBTXdjbTdtSkxQ?=
 =?utf-8?B?ZG94d1lySHZ5K0FXOEJLTEQvYVU4a3RoOFcwQTdNQzFrM2VwdERaeUNpRWcr?=
 =?utf-8?B?V0dvbVlWYStIQnVZSmlOY2kyMWhYVTdQOTdDQjdhVnQxQWZuSytVcXdLMTdz?=
 =?utf-8?B?TkhZUFd2VmUyK2FlRG01T255dmo3alREYVdXdlp0WGFub29WVFU1QW9SaDYw?=
 =?utf-8?B?eC9NbnFXd2lQNjFpSEh6Z2FRWCtMajAyWFcwbjNEVHo4Z0prUFhqc3U4My93?=
 =?utf-8?B?MnVBUTVNb3IraXdKUVdZdDR3SjJZY200QmZlQ2pJUWtLaDAvaEpoMGhRRXBj?=
 =?utf-8?B?VFh4SVBISzBRL3BnNWkrendvSEZQejhGWEZsQkNQeDB4d28vbXliSllxQ3E3?=
 =?utf-8?B?MzhaUlJNbjdTWDlGbmw3bzJnZml5S3pRWGFzd0l5eHR0bWRPcnRmTkxlWCtT?=
 =?utf-8?B?TmY5cGw3UGN2ZWorVHg2TVZpa3hNRUhqRkdNOFlxZFAvbU0yTWtudSs0V3hv?=
 =?utf-8?B?OCsyTTRxQiszTlhDL21YMk9udTBjbDhyWE14RVNnMkNUa1RwczhCVFhwM3Bu?=
 =?utf-8?B?ZUFJWkNiajVBaW15enEvRWU5SmZqTDdPWlhyd2svR1l0Z1MzVWk4Y2tvVDJj?=
 =?utf-8?B?Q2pGTFBXMmErSmNGc3NkVGJYQ3NrMGxITk04QkFiajNEZVpjTDNQd2Y5UnBV?=
 =?utf-8?B?Q1BmUWEwem90V2NlOCtlK1ZkWE9oai9nVFR3TEJ2aWl4VkJWNXdRVVprKzVp?=
 =?utf-8?B?ZnNiVEJWZUlpUXpqQmtZVlk1akphU2k0bnNqYm8zVlRUNVNBOHJqQi9GYlRZ?=
 =?utf-8?B?cXVpTkc4MTZZRVkrbzQ2VncxU1VxYVVPUFA5VUNDbkxCb0kxL1JMRlh1V250?=
 =?utf-8?B?RWc3MXRJUnpWQkFtV0Z3NURmdHYvOUtpTzRKM0tweEJNT2lpMTJaeWRIY0tk?=
 =?utf-8?B?R3Q4QmRHdFRrb0JXYjBZdjR1QVZmV1pWaGt0V2VmOFJZRk1FTm9EbitSY0Z2?=
 =?utf-8?B?OEY1bmhtZUkxK0dLMVdwcGZvcStOaC95VHFsb2pTb1BIY01tMXF2a0xJc3hR?=
 =?utf-8?B?MXVuNlBsbFRVWFl6K09JU0lwaURiUmlRR053eGQ1SVU4MUhLYytEdGtQOWJi?=
 =?utf-8?Q?UDh6GN3EyfeIELjTQfMDQYSMB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31b46dd-40b4-4ffa-9cfe-08dcb64d3541
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 19:23:10.1861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o3cC4QiLsVJg3eT8c1sF5aWahoOmL1Rhq/VHFCkWG2w0zFjO8iHZphshR8WaAbXbRbcMqMNXiplylknMWbB0HleViqrUaUk7cJMJVeaeDnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pa2EgS3VvcHBhbGENClNl
bnQ6IFR1ZXNkYXksIEF1Z3VzdCA2LCAyMDI0IDg6MzAgQU0NClRvOiBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4Lmlu
dGVsLmNvbT47IEdyemVnb3J6ZWssIERvbWluaWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5j
b20+OyBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBEZSBNYXJjaGks
IEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bSA8dGhv
bWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0v
eGU6IEFkZCBrZXJuZWwgZG9jIGZvciB4ZV9od19lbmdpbmVfbG9va3VwDQo+IA0KPiBrZXJuZWxk
b2Mgd2FzIG1pc3NpbmcgZnJvbSBlYXJsaWVyIGNvbW1pdCB3aGVyZQ0KPiB3ZSBleHBvcnRlZCB4
ZV9od19lbmdpbmVfbG9va3VwLiBBZGQgaXQuDQo+IA0KPiBGaXhlczogNmYyMGZjMDk5MzZlICgi
ZHJtL3hlOiBNb3ZlIGFuZCBleHBvcnQgeGVfaHdfZW5naW5lIGxvb2t1cC4iKQ0KPiBDYzogRG9t
aW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KPiBDYzogTWlr
YSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3
IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8
bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBDYzogIlRob21hcyBIZWxsc3Ryw7ZtIiA8dGhv
bWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFs
YUBsaW51eC5pbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0
IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IC0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jIHwgMTAgKysrKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdf
ZW5naW5lLmMNCj4gaW5kZXggYzdjNDRkZTdjMzBmLi42ODE4MGYxZmY4YTkgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaHdfZW5naW5lLmMNCj4gQEAgLTExNzMsNiArMTE3MywxNiBAQCBzdGF0aWMg
Y29uc3QgZW51bSB4ZV9lbmdpbmVfY2xhc3MgdXNlcl90b194ZV9lbmdpbmVfY2xhc3NbXSA9IHsN
Cj4gIAlbRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFXSA9IFhFX0VOR0lORV9DTEFTU19DT01Q
VVRFLA0KPiAgfTsNCj4gIA0KPiArLyoqDQo+ICsgKiB4ZV9od19lbmdpbmVfbG9va3VwKCkgLSBM
b29rdXAgaGFyZHdhcmUgZW5naW5lIGZvciBjbGFzczppbnN0YW5jZQ0KPiArICogQHhlOiB4ZSBk
ZXZpY2UNCj4gKyAqIEBlY2k6IGVuZ2luZSBjbGFzcyBhbmQgaW5zdGFuY2UNCj4gKyAqDQo+ICsg
KiBUaGlzIGZ1bmN0aW9uIHdpbGwgZmluZCBhIGhhcmR3YXJlIGVuZ2luZSBmb3IgZ2l2ZW4gZW5n
aW5lDQo+ICsgKiBjbGFzcyBhbmQgaW5zdGFuY2UuDQo+ICsgKg0KPiArICogUmV0dXJuOiBJZiBm
b3VuZCB4ZV9od19lbmdpbmUgcG9pbnRlciwgTlVMTCBvdGhlcndpc2UuDQo+ICsgKi8NCj4gIHN0
cnVjdCB4ZV9od19lbmdpbmUgKg0KPiAgeGVfaHdfZW5naW5lX2xvb2t1cChzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwNCj4gIAkJICAgIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGVj
aSkNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo=
