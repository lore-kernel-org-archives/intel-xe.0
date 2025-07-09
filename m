Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89184C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 21:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C88A10E0C2;
	Wed,  9 Jul 2025 21:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCdRp0sM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB9E10E0C2
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 21:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752097497; x=1783633497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cMpi7KTx5vGA3tpJX3MLOKgxeLjrzSYN4p5/nWENPV8=;
 b=YCdRp0sMJmdtvegDK9/RhGeACixTsRyHrjOSi/acQNnYmmaPBjUG9Zof
 I1ZOwbFpxxGwWfAy59Dq+PFn/iFOUVf1x4SVibidxNA+5K+kfuISIqOK8
 kX0dCzcmG4z/Bn+r/PMdqvwWOS7rzwvXIsC/rwrG9Ybcs9TflM+DH6fwb
 56m9TxR/OIi/xwYuP9tSNSZPrtL8YKuvNgdg5ij1ce2rLBRcYzlTU/mHk
 Qs1XtuYtoBNHOpfNs5tvku9eu2pNKALmZXQPpXkMybF1EkiT3qj4z2MIu
 jFF35Q182xISki7e7BT1q+Vl0eluohoszjOigWJhOHShXxQY5chY4GRN/ g==;
X-CSE-ConnectionGUID: C6Q35bB9TBKgYKwaIFQF1Q==
X-CSE-MsgGUID: pM5vb5WhRU2rXx/XbYHxWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65720601"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="65720601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 14:44:56 -0700
X-CSE-ConnectionGUID: 7tViHs2lQJiMbIs3dF1/kA==
X-CSE-MsgGUID: /yJY8L05SbeX0uS9aRxZyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="193089402"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 14:44:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 14:44:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 14:44:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 14:44:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRIlVDRDI2E6ml9mcsAmzpbCC6vp+smniZNTQCJ5m665QpnDM5LwwOiVzY1pvbcyalbkpu0N3wG7bB2rsbVV7NcydLgY5IxKg5hqcnloDLIx0b7UGuAxJgXFld5juYUQXxOAXtDWOymJ7KxLeKnI2jmLxun76SEMlJ1PSixYDQucwrTdN4UG0Es7uUOPxP5XQMfiq418krFKVf7YKZBsDsdzegd3rfbSnnaWvO6ykPpN7Ae0EZhXVmCFG8fn1YhQ4st+LzaP5BOzyAEIsq78q1eWVU0tCbEbNpEkKX1TLVOZycUh2DMcHMWTynTIgj2YISRDkOqz8rpDwEmhZAoVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMpi7KTx5vGA3tpJX3MLOKgxeLjrzSYN4p5/nWENPV8=;
 b=F8b8it4R0ng7GMIjKRWSPt4VvIlDlTX/G8hcCjLX/Lttd/ssK9iJtV1RMtYyDoSUgA5l/VkqFXkDUVblOb0wOyQQtlGjlHDFiK23NYHNJrhS7sQw4AVwxyy2L1xchoVVK6rgIVlEacKyjuDjoM2IUt4RYIs7D9QOjF/wk+gmV7AelnTB1gHnEs5XGxMYrxkrKf8npoI/a+yRE3CPVFvBo5IyHdj6ytPhQYnZhuMLZ3Mtrr4dY9MVN9FJlJrR4IyXSAa8Dk3eqHz8ctLHRBt/H1qPJZ1uFTnJNEh/N++8WRCFcBgvuzOPo9bbMHfRoeepPtR5UnSE3GixHRFvcKoxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Wed, 9 Jul
 2025 21:44:52 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 21:44:51 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "tvrtko.ursulin@igalia.com"
 <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Thread-Topic: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Thread-Index: AQHb7Guz0HSDyWXKmkuT2dMkiFIbJLQqONaAgAAd5QCAAAXSAA==
Date: Wed, 9 Jul 2025 21:44:51 +0000
Message-ID: <8314fcfb7ca13296469b68cb77392933d118d453.camel@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
 <8e4710aa4b3d241c27f01661ae2a2cb862367cbb.camel@intel.com>
 <wxagvld5vyqf7sb2h6l3kee7b4uvgrvb7hclw4rpy2idqmreif@4csjak43m3hk>
In-Reply-To: <wxagvld5vyqf7sb2h6l3kee7b4uvgrvb7hclw4rpy2idqmreif@4csjak43m3hk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA3PR11MB7610:EE_
x-ms-office365-filtering-correlation-id: 22942f87-4a35-414e-5732-08ddbf31d5e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eVd2bkpOdDIwREthZ1F5bnc3NVlPcmxVSXZNc0QyT0VTMmlQWEIyRlR1U2pH?=
 =?utf-8?B?WlNqcU0zNHFBME5SLzVpTm1KU1dTRmo4Qk03Z1MyaXZySjM4WFVQSlZTUytU?=
 =?utf-8?B?c3pZVDZhMTFtZFl0V2g5ZUI1ckJGVUZTdW5sQkhRTU5hWGYrb3g1VnE1MFp5?=
 =?utf-8?B?a3FEWGpyellMSHBXM0lnQVhMU0hZK2s4ZzBIRDJVS1ZhME41V3pzT3dmYjlO?=
 =?utf-8?B?UDcwcjV5bHU4dWVMTCtDREdGbDhkVGdJRG1ZZ3NBV3crMHlBWHc2emk3WEZK?=
 =?utf-8?B?Q2tESkJDdk5oQmNIeWhGTmRrQVBvUDlFcnFsekRxcTN1SlpiaVVqVjBkdDR3?=
 =?utf-8?B?UUV3dHp6dkVVZDltQ1VQTVR6K1ZmOXAzdUhLSnR5VzN3dXZ4ODZTcDlMd0hQ?=
 =?utf-8?B?Zk1xRlZPak4yWjQ5dnk3WElZMG4wQWtnM2RKZzQzbWZvU3JJNjZDMGVYR1ND?=
 =?utf-8?B?UDZqRnB2b2ZGRE1EekFaNEpQNFlSUGx4MUVUMlo0Y2plSFVPenhLUWo3R281?=
 =?utf-8?B?SHNRRDlpRXJWejUrSjlKSWhWMjJhekk3V29rWk5OaG5jYWdiQ0ZyRzMxdkww?=
 =?utf-8?B?cG5aK0VzckxMcERwaHVYUHRyaHk0NlVIT2FGRFZyMHlQdFBzc0ZyUTd3Vjg4?=
 =?utf-8?B?Y2o5RGlWdjRtb2pXTDdETXJzb1FBUzNSTjNVNm9WVEFFSHBYaU5lNTNhQlMz?=
 =?utf-8?B?MzArS0liSVkvSWRQakFNcEF5ZDM0MzRzNWhDZ1NNWGdGK3p3dys5cGIxRDRW?=
 =?utf-8?B?ZXNqTlNyN09tc003b0lFVzloTFU4dVJNMUJMWVlyYVp3LzVEMUU4cUFGcXFM?=
 =?utf-8?B?WVdCeTIrbXM3UTNLbjFqRlZJV1RSM0hWMGVPeGtXTWJiZDVSNjVEMjVsc0wr?=
 =?utf-8?B?QUVOSVo3VVBWdlZzd3dRYjhGeHlkSC90MnVZKzY0cXNpNHN1RzRnMzZYZjho?=
 =?utf-8?B?RFlJWStwU3BpWURoV29xRHlYay9xVENoM1F5M05NQWJZREt3c3VQeG4zZ0ZM?=
 =?utf-8?B?a0ViWHU0dmQzTHlDUWhTMjE1V1RUM0RJUTd5bys2ckVTeENKeTViMllEYkVo?=
 =?utf-8?B?TEJqV2I3bFBSbTdlMGVadCtLOGxOM2tqRWhMZTlGWHpVZElHNzVpaEZoazRj?=
 =?utf-8?B?VVBMWUlVV0tnbjVaK2RPRmNRcElWeFpOWDBtUkY2RDJxY0x5WFQ5Yk0yY0RK?=
 =?utf-8?B?dUlHeTZXNkJuNjBoU3NCQ1ZuQWRSbTB5T0xsNUg5aDMrMjRmVmlWYTRoV3Qz?=
 =?utf-8?B?d0JrOXVrR3A5ZlhoSVQvSDVMWDJvMXkyakhHOCtUMVNWc0Z4blB2ZEw1THUw?=
 =?utf-8?B?L1ErNzdMWjZJTThMck1ZMCs4WW53T1pFeTU0MWI2WlVtbStrdTd5RWt0alJr?=
 =?utf-8?B?T2l0RzVXU1RuME53Z3N6WUVYdDdOMDBzYk1RV0JJZlVvMExXaWl2UEllTUgw?=
 =?utf-8?B?TzhwQ0RwUWhLd3crZDNwVnBGN0pKc1I5ZEl0QkFkaFExeUZOMjRyUVNSaXA4?=
 =?utf-8?B?OUJMVHgvVG9sSFJaNmlldnlscjlxOWpsTDZFVXhTdDgrOUNsL3B5WWN3a1JV?=
 =?utf-8?B?SXVWNUp1MGhDM3gzclV3NStEUFVUa0VXZTliMjU5UXNNanVjeTNsQkV0SXd0?=
 =?utf-8?B?Y01RWmFnTkI3WGd2SktPclZnUE4xbGxmYXlZM1VRSWw2dllHckIwZkZwTEdp?=
 =?utf-8?B?WXhnZUIzUkpMbW95M2NKaCtYbXg0SyszazNaU2ErYTBYcDBQSmpwVUlvSnlG?=
 =?utf-8?B?ZjJjaHNhU2U1Z1JnR0x3MTJQMkRQMC9EZlFJTDJmeFBRUC9wc2Rzai9lNXhk?=
 =?utf-8?B?emVFMmtpcWVNYjdudVFVemtXclJlRnZpMU10WGNzSDJiWFpnYUp5S1dRTTFJ?=
 =?utf-8?B?alNNSWN4b1BnZTRKUGRQRzJKVXJnNTZRRGdoWFMvaklJZ2Z1b3JzR0w4NnFp?=
 =?utf-8?B?SGY2aGllUk5RRlhlYjJYMnlQNmNsNGlBUG5XaTZ0cjdURUZ0WXRJajZMd1lq?=
 =?utf-8?Q?TyLVs5uZX/GyfmnNva42s6ujC7NBf0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTNnQ2h6Q2ZMQzFFdng0TTlRbndqdkVKNFozeU96cVIyWVQyYStMazA5SjBi?=
 =?utf-8?B?MU5Xb2UrY3A3UEh2NnloUy9ueENGTlRqRThrWnoySEhJZHNybWx6MER6VTdV?=
 =?utf-8?B?bmpUSm40NXU0N2VwOWNtZkZJOWt3VUNscnozM2ZublNqTEtkWkVwN1l6cEo2?=
 =?utf-8?B?QlJuVXJnVWtVazZveVliRW1YS3NUaWxyRFpjS3lUU2lXcW1Yd3N0bzFSK3BI?=
 =?utf-8?B?bEVWaGljMDJ1bDM4TENYTVJsZDZJQTRzWlY1WDdVU2QyREtyYXhsTXJvWGJy?=
 =?utf-8?B?L3N5NUl1SGZKaHQrRFllbnN3VFBhM29PcThqMDVBWStkd3lndzMwS3ZhWFJi?=
 =?utf-8?B?M1lJTDFnUkw0Qkd1U21vTFh3bzZ4aEZrOHVzTVdjMjRuMytvV09qRnpaY3RD?=
 =?utf-8?B?N1V3a2NnQkJ4eGFNcC9Hb2ZPQTBpbFZEdE1DaTR0REF3eDZnTnRDTlhJTjV3?=
 =?utf-8?B?SjhEbm5HZ1l5U2xoNlFCZ2JjZ3k1THpxakY0WFlpNm4yWTZPaTYxN05oVGZt?=
 =?utf-8?B?VStOeUxpWUZKZi9xSnhPZnkrR2U5OUpsZVZCa1k1ZkpjWHV5OEV0cWJhK1Bm?=
 =?utf-8?B?RVp2Qkp4Y0RkMXlPeHZsVmFPUUlya3lCTm0rV0YzT0dsSXZ5MUZOV1VrVzdV?=
 =?utf-8?B?N2V1MXVFYS9tWlJGTW8ycTV0WDJ5enN4eE0wdVVyMXE5QXV4UUFKT1cyaWMx?=
 =?utf-8?B?NmU5bzhQaTlRNSt2ZVNBOW9mY2NKYk85TktWMzVuY3FUeDQvbG1yRytnRVVv?=
 =?utf-8?B?dnhYMDJvMnhNRnk4R2xZNS9tWHFWQ21yUnY0MHZHZWs2Q0NOOUVDNytsVndP?=
 =?utf-8?B?ODJSZkZ4bVRvZW9uNVovTWpXWU9CZWd1RDA3dzdvSlJYUENxQlZzeWVFVGRK?=
 =?utf-8?B?WjIxRkJGNXNUMHVtTnMreEFXV0FrN0taeHhESk9PeVA4ZGIyLzJwV3NXMkgz?=
 =?utf-8?B?RHJzTUpvdGU2ZmsyUWdIMVRUdFFIRjlsdVBrT3VrMlRZYWV5dmZNekEzZVNy?=
 =?utf-8?B?eC93T24yMmVXcGNQOGpkZngyMW13clpMWDNLb01mZmdaTlMxeFhiVzdidW9j?=
 =?utf-8?B?MEdkdWZKbE9wS1dlc0N0d2FhSiswdG1xc2lCQVc2MmxTUFJ0RHlLZWlRUHpS?=
 =?utf-8?B?Y2ZuQW82MFRtbm80MnZ2THJpQ2p0SCsrN0tCZmduS0o2WTVWRkNOY2NSWFE3?=
 =?utf-8?B?VmQ3WC85eW00MDVVQk1CVVVpWnRUQ243Mm5SU01BczNLVk45RDJhTEtnRm5i?=
 =?utf-8?B?bk1PUWVvS2xrYVNHYWRYRkwrckltZEdNaHdFejkxZjBJV0Y4cUxPZ0crUnZx?=
 =?utf-8?B?eUZWMlVJWjhwc1dEbW5GMTJ1d2U3SUxkZnU0aVUzN0ROT2RlTXN6SWpoUnBx?=
 =?utf-8?B?Y2NCOEtTbmQ1OVY2NS9sa3hkcVJmTzhwbW9ZV3VJTXY4L3lGM1drTkRIUjlK?=
 =?utf-8?B?UHgyRzBUd3pweWVzUVZKL1dvRmhvQWlCSGxCbmUrNTlFc0ZTRElnSllWVlB2?=
 =?utf-8?B?R0oyMFJBcERxUzViQUtoa3FBZnIxOHkxc1duUStncWVybjlsbXRHeWluN0Zv?=
 =?utf-8?B?cWE4aHpMMXlqZkVZOXJ0Tm9nWitsbG95SWlpTms4TzE0aFdRNHNMUURSeCtT?=
 =?utf-8?B?UUFRcTdkTC9ta1VCQUcwYUVLODU5emhsV0VFamRWdzNqU1R3VHE0SWt2ZkNy?=
 =?utf-8?B?N0loZ0UvOUloRlcwQ29DQUdnNG1yUHl0dVBvSVVvWWtuZi9qc1RLajU4NnFQ?=
 =?utf-8?B?WEltOFVvelh0RXpKcFJrVzRET2xOVHVnZnB0MEZ4R1R3dWlvMjBtcUY5OEI3?=
 =?utf-8?B?YXg0Ymh1dEFVbnJHd1FwdDg1MTQ4b2F5Z09EeGhFbTY1ZlVvK09JSGozRGZN?=
 =?utf-8?B?eXd5c3dEeTJZUjNCN3pMR0QvVWJ4bDZ5S2ZwenRYdFZjSmVOeWVTSTluVTJz?=
 =?utf-8?B?ZkdmVjdYZG1LUzR1eDJrSFZNY2duVXVTS1NlT00xa1ZrV2NKVWhrdkcxdm91?=
 =?utf-8?B?RHdkYnJSOFVnNDJiOVRab2NPSS9RR2Jld0tTY1V4MGFFanNld0NMdWRQRjlE?=
 =?utf-8?B?K2dTdk1USGNUQzMvVmF1a2hGVExoMHZ2TUE3a0Urc0NJQ1FhRmlKeUYzMnZD?=
 =?utf-8?B?bmE0WlJDdytWTC91NWV0dDh4M1MyVWRyZG5qTnNoM1R0cWttUUEzUmlyYWxJ?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B8B326AF6466548875A565C1E39DBFC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22942f87-4a35-414e-5732-08ddbf31d5e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 21:44:51.8981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uJvn2cWlKzxptZNMJ6Ca5Wgw78Yyjg+HMHYRoKevDNjZDKR0QK3vBGj+7A0XPJz2j8OAUy+oaCknvD4qIm5kvwK8CjcB3+uyLu00auJ/Qig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
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

T24gV2VkLCAyMDI1LTA3LTA5IGF0IDE2OjI0IC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFdlZCwgSnVsIDA5LCAyMDI1IGF0IDA3OjM3OjAyUE0gKzAwMDAsIFN0dWFydCBTdW1t
ZXJzIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyNS0wNy0wMyBhdCAxNTo0MSAtMDcwMCwgTHVjYXMg
RGUgTWFyY2hpIHdyb3RlOg0KPiA+ID4gVGhlcmUgaXNuJ3QgYW55dGhpbmcgdG8gc2V0IGZvciBD
VFhfVElNRVNUQU1QIGhhbmRsaW5nIGluIHRoZQ0KPiA+ID4gZW1wdHkNCj4gPiA+IExSQywgdGhh
dCBpcyBzZXQgb24gZXZlcnkgTFJDIGluaXQgc2luY2UgaXQgc2hvdWxkIGFsd2F5cyBzdGFydA0K
PiA+ID4gZnJvbQ0KPiA+ID4gMA0KPiA+ID4gcmF0aGVyIHRoYW4gdGhlIHZhbHVlIHNhdmVkIGlu
IHRoZSBpbWFnZSBhZnRlciBmaXJzdCBzdWJtaXNzaW9uLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiA+
IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgfCAyIC0tDQo+ID4gPiDC
oDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9scmMuYw0KPiA+ID4gaW5kZXggNzVmNDY3OGNiMDkwYS4uMmM3MzViMzY3OWY4NiAxMDA2
NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jDQo+ID4gPiBAQCAtNjAzLDggKzYwMyw2IEBAIHN0
YXRpYyB2b2lkIHNldF9jb250ZXh0X2NvbnRyb2wodTMyICpyZWdzLA0KPiA+ID4gc3RydWN0DQo+
ID4gPiB4ZV9od19lbmdpbmUgKmh3ZSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfZ3Rf
aGFzX2luZGlyZWN0X3Jpbmdfc3RhdGUoaHdlLT5ndCkpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZ3NbQ1RYX0NPTlRFWFRfQ09OVFJPTF0gfD0NCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9NQVNLRURfQklUX0VO
QUJMRShDVFhfQ1RSTF9JTkRJUkVDVF9SSU5HDQo+ID4gPiBfU1RBDQo+ID4gPiBURV9FTkFCTEUp
Ow0KPiA+ID4gLQ0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgLyogVE9ETzogVGltZXN0YW1wICovDQo+
ID4gDQo+ID4gU2VlbXMgaW50ZXJlc3RpbmcgdG8gYWRkIHlvdXIgY29tbWl0IGNvbW1lbnQgaGVy
ZSBpbnN0ZWFkIG9mIHRoZQ0KPiA+IFRPRE8NCj4gPiB1bmxlc3Mgd2UncmUgYWxyZWFkeSBkb2N1
bWVudGluZyB0aGF0IHNvbWV3aGVyZSBlbHNlLg0KPiANCj4gSXQgc2VlbXMgY291bnRlciBwcm9k
dWN0aXZlIHRvIGFkZCBhIGNvbW1lbnQgaW4gYSByYW5kb20gcGxhY2UgYWJvdXQNCj4gdGhpbmdz
IHRoYXQgYXJlIGRvbmUgZWxzZXdoZXJlLiBJZiB0aGlzIHdhcyAidGhlIG5vcm1hbCBwbGFjZSB0
byBkbw0KPiBpdCwNCj4gYnV0IGhhbmRsZWQgZWxzZXdoZXJlIiwgb2suIEJ1dCB0aGlzIGlzIG5v
dCBhbmQgaXQncyBzdGlsbCBoZXJlDQo+IGJlY2F1c2UNCj4gaXQgd2VudCB1bm5vdGljZWQgd2hl
biB0aGUgdGltZXN0YW1wIGhhbmRsaW5nIHdhcyBhZGRlZC4NCg0KSSdtIGp1c3QgdGhpbmtpbmcg
YWJvdXQgaW1wbGljaXQgemVyb2luZywgYnV0IHdoYXQgeW91IHNhaWQgaGVyZSBtYWtlcw0Kc2Vu
c2UgdG9vLiBJIGFncmVlIHRoZSBkb2N1bWVudGF0aW9uIHdvdWxkIGJlIGJldHRlciBlbHNld2hl
cmUgYW5kIG5vdA0KcmVhbGx5IHRpZWQgdG8gdGhlIFRPRE86DQpSZXZpZXdlZC1ieTogU3R1YXJ0
IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCg0KPiANCj4gTHVjYXMgRGUgTWFy
Y2hpDQoNCg==
