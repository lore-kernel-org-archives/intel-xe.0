Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A79E67495
	for <intel-xe@archiver.kernel.org>; Sun, 21 Dec 2025 03:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8638E10E03B;
	Sun, 21 Dec 2025 03:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2rDHiCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4842F10E03B
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Dec 2025 03:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766286509; x=1797822509;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8vpT+YPM1E9KNZ8IBn4JpmbKaxRNvAyqYwKrxXq76VE=;
 b=j2rDHiCCS3iMG6GwTDMmiMUnPE+2FTfnl8Se0/kYpXgmJm53i2uw8vHu
 1Qk/5V3aYf+c7hysXrOU1LoGXhUb7H9x6SCbQztnu5dHGO6BJr3kCUYLb
 c5XMewCodwe80xXVYT6g0oz1AOTeUH7Onhp9m9D762I2fb7LyrF5x3KPD
 WmlZkqMoxMT0430SextNRAW6FZqPoxUjmYBnDYlzoJrGJ6S7vuZOKvrvn
 b/pSyRK7sDZYa70m24cdWgDJwyGsxfMVzePA01ROCg/3dgi0kIH/yhvfB
 S74hDOIVJihsah37eBzzlZy2RQUiWH5VlvbSgfRrorCYDh4PbuSAYTo1w A==;
X-CSE-ConnectionGUID: fM6k5u6AQ5qW3g6iHIRnZg==
X-CSE-MsgGUID: 6CpRPu/8RTagEy7SivScBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67188006"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="67188006"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2025 19:08:28 -0800
X-CSE-ConnectionGUID: N6rHIkxYQYKT4yfDvuBuHg==
X-CSE-MsgGUID: xjh6/ptlScKI0ov+i4HqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; d="scan'208";a="229872168"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2025 19:08:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 19:08:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 20 Dec 2025 19:08:27 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 19:08:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIZIAkGFf2lMVwzXa+28sSHCisSuI9PCdIqKigPFvdUm5/un4FlHCaua1TFIz7Ku17urF03oNYl2dTSt8nyAyqxuQPp4UiVVnIIhvlDJNMDgl12hXcsGpTpNCwpoqmmBt3lbfxXqEu4m7KkUlnyYXs3NcIYNQvVa4KvZQ/aAI7u1inSNRyGMH7UYyQJZBLw2nHhWKwfyG7Z1BbuuJBDJrK6d51rvis5zccHY5EQN23/qp7BAgwTUWLj5LE9LFsxws5xKQ98Ka991x21PSHbEgElG2zqBPa54JN3MY/F17wVdGxWAJMTBJCZdlzn5ogF7h48vPLlgGm6nqSKJ/1RqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vpT+YPM1E9KNZ8IBn4JpmbKaxRNvAyqYwKrxXq76VE=;
 b=nHjOPiLuJS5qdIdJ50dAOC6IUtJsLWNgRVWpZHzBz2Y2sN4Wah3OrN55yhWO2PCcbcKe38pG3I6mR3zoA09v6LCAjL/GUM8+JcBcP+30CbpGPY9knMm7IIgw1W6p7/o5WvmnQyIK52xp6hfNfpk0nWRTKSH/1TWeTa9NjiID3ixfTClG2t84AvGXCFNtAF8fZxNrgGWOkylG8ndn0wN5zksGl03Y3XbxadI9OQ7+8GQz+py2fj7Cp8uPpb8X7zpDYn3iTOKYaxXKCgxYcAom2CDCWWtSFH5M5iwD+Q5XXczDB7qMiv84YeCKdtHH23XH0CFps+JwtKtuccrMbusZdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 03:08:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 03:08:24 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "dev@lankhorst.se" <dev@lankhorst.se>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Poosa,
 Karthik" <karthik.poosa@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
Thread-Topic: [PATCH v2] drm/xe/pm: Handle GT resume failure
Thread-Index: AQHccYPNIzH9IDP9EECqmFjJMhNYKbUraxkA
Date: Sun, 21 Dec 2025 03:08:24 +0000
Message-ID: <1424d50e95dd5410a9e91527383fa9c8f1182298.camel@intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
In-Reply-To: <20251220073657.166810-1-raag.jadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|PH8PR11MB6928:EE_
x-ms-office365-filtering-correlation-id: 4b64082c-36b0-4541-80cd-08de403e346a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RDdrdGszRTZjZ0pnRnJMdm9NUUVhZElJdXA3M0pVWk92eitEWEJZWDBpQVh1?=
 =?utf-8?B?dWdmaUREVVFMU2RnbkU4ZzFLMG55aW1TbUhFNkcyU1ZKbG13N0Q0OFFpdE0w?=
 =?utf-8?B?bUVqTUVNd0NGVmliSmZzMmdVay8yM3lBd1Z3RFE3emNGbFRmRXViSEFQZnRB?=
 =?utf-8?B?dCtvWTU2S3dYRk03alFMQVNvTzNqaXFBRm9vZWRFZGQwKzY4VElLWFZzUThz?=
 =?utf-8?B?MjFvUTQ0Y0dBSXM5REdjazhYNkQwM25kVlFEbHZqT0RoTTVGbndGS043R2RT?=
 =?utf-8?B?NExOb2dueFhFM3IwQVB0SVRoZXd5WEdTSnFhTU1vK0NGM29SaVVpMkFsK2lu?=
 =?utf-8?B?Wk5nQ1lxMW1VZXNzT2cvVFh0K2ZXcDgydm01bmRQcXlIMU9OS3JMeHJxVGNX?=
 =?utf-8?B?NmpjVGRVbW51ZUlKN3ROSVozaERLMVM1cml3MDVSWVhicXBhY0phUzJTSzBT?=
 =?utf-8?B?dGpIb285K21yU2ZsM2EwTXdKRGNrSDFRWklMU0c0QWJVRGIxNXVvb2FTNFNF?=
 =?utf-8?B?SStBcFEwNmdBRE1lS3ltTlMzWFRoemRLbGIvd1N0cjVEeGxZa3l2ajlUWW9B?=
 =?utf-8?B?cG1UMlhlaFp5b3pZdEJ3VW1OWVp2TW4vSEdtdU11UVRWYmtRZVFVSTRydzBD?=
 =?utf-8?B?WS9vckRDb1k5bGllWjM4ZFdOQ0VBVHZ3L0hiakdVcE13dkE2TE5kMkFDK2dF?=
 =?utf-8?B?SmRHREt0M3c4UUEzZCtlWUZZNW00RlV6ejh3cUViajUxZWh5RFpHTXkwNVYz?=
 =?utf-8?B?ODFrMUlsUThsakFTK2FPelYzTmZNK3hWRW9aRG5DN3cvenhEVjk2U2g2ZFFL?=
 =?utf-8?B?S1c0WUhLK3FiQ1RIc2NmUWV6NDZVNmh3clpVVnBSZzMwQmU4Qkg2dDVmVzFn?=
 =?utf-8?B?OEMyUCtsbzQ3czZhbU9lWUowcFpKUFF3aitHSkZTQ0pDNzVCQmtHUzZzWllJ?=
 =?utf-8?B?c3hhVlRtYUNPbDVCbDBIVTA5ODFIbXg1dGsrc0xEYVg0MHp4U0g1dGMwNmYv?=
 =?utf-8?B?aDVJWWRaa3VocEJhb1FjemxTNE9uN2R3cVlPdGJ2a0xkeHBaMFdRcllWaW9v?=
 =?utf-8?B?dVdzMjB2R2JXMVpUaVc5a0FqRHRIWWUvc2VadVZ5MjhOQzBZWDlwMVJtTnJS?=
 =?utf-8?B?MHZhVk5UZXU2VlREc0xpRnNSWWdOZlZ2N2VaM0c0a3NNMGY1eCsxdWpjaVA2?=
 =?utf-8?B?aWh1c0ZXakw1N2RwdjhDYXdXd0pteVpzMTBnNFBYSDQxc256ZjVXWEl4dWxp?=
 =?utf-8?B?V3ZGRGR0ZDBtRDUvZlB3RGsrdW82TTAyWXd4aVplQnROY1VxQ2ordDJ1N3k5?=
 =?utf-8?B?cTVtRlBkRlBCVDYwMEpQdUdSRUVuem9BZGtkbFJDVDY0RG05QW45b2F1MU01?=
 =?utf-8?B?QU5Ya09VejMyUXpZUjZ4Z1g1WUhlVU9tOHVWZTVlemNURlR4L0pnc0lPaHYz?=
 =?utf-8?B?end0Sk1OTG5JcnF2UmtQOG5sMURpNUFkYmk4UnVhRHR0djNxTkxoei93UUUw?=
 =?utf-8?B?ZmViYjlxREp2cTd2U2VEWkF4clQzbFYrQjNMRDlZT3JrQVdtdEg3S084VGJq?=
 =?utf-8?B?WkozditsWlo3c2hzaDdYUm5oTWxWL3liSDlpZXlrUzBqbGQzaCtZSmpnd1JI?=
 =?utf-8?B?bjlSVGNTanlKdUxiRTlNdlE4YWJTaWtqUDEyQnpUK0FVUEJUdWYyclFwbFJJ?=
 =?utf-8?B?aFRyRUsxVlI5Z0o1cXJ6UjhZUHg5bDJtUW5LQ0crWTFhSU5NalpVL3BlTk1Z?=
 =?utf-8?B?bkdsay9aU2NUdzJuYmRZSHNRV1J6NnBSUEx3YmZVd2JVallhUnVOSWZSQURW?=
 =?utf-8?B?cTJkMWgxeUJNc3VJWXRaNFlGSVNZTDkwZ2dMTk9hVjJDckdzem9GcHpkWUtC?=
 =?utf-8?B?L1VjbitwTkd4YnA4MTVUVFRBU0ZOZ1gwbXVERVNUbWhTZnlWc0dVYlRyMWVi?=
 =?utf-8?B?K2JLcHVxL0xWaTlaNEFTUEpoZVlyRnJSREMxNVpxYjJ3bUNqN1lpRzNsRlpi?=
 =?utf-8?B?U2lreWNTbE1LSkJtTWhuNWF2bFVXYmdjRnJiR2s3d1NqU1cxbkYrZG5tdEg1?=
 =?utf-8?Q?NKlmTe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDJiV01YeGxwZGtlWVg4QlpVZnZZSFh0OXpkbkNPRXR3K3FIVDVmZ3BxR1pp?=
 =?utf-8?B?MGRKUEd0RWtHQW9LSzQ4MGJidGFzTjhkL1pwWkRDVGpUTEw4eDNDVlpYeTc1?=
 =?utf-8?B?dUhRSEhyS2tBUHpPUFc1TElWWm8wdUF5M0l3clVWbEpDb0lENWx5ZEVFME1i?=
 =?utf-8?B?SjZraTEwWEZIYVM3bFFDek8wZmZVakJwcGQ3eXJwOXhmVnpEdHgwd1JLVFJY?=
 =?utf-8?B?eUI1YlRiRThiKzNQRUszRUFVaytvMlBvWFJrNXFtRHB0SWZqbWRMK3U2VTcy?=
 =?utf-8?B?L1VjbGpPNnVRNjEzVEl4K3VwS0lJTVJTZWtveDd6ejJaNlkzQVBtOXAxS2c3?=
 =?utf-8?B?VGVnK3lNRXlKaitsWmFNYm8xNktnS1VtVHdYZDhsdnZ6cWdMUUQyeklhNmZh?=
 =?utf-8?B?WGMraFhvZXRyVWVTbGs0aG05WkFITzhlekNlWm5ERGVWdFk2cTJDdmVtNnMz?=
 =?utf-8?B?Smw4VFVFVWxDbFRVcFQ5endXbnJHYkZwWTdJRmxrVDV1ckY1MG8xR1NTVjdj?=
 =?utf-8?B?aHQzcFNBdHNZSkFuaGl0VElCaWgzRFpubjUybUxwTkZvSmpzZHFiNnVBenQw?=
 =?utf-8?B?cCtaSXc4eU1YYnVCNStoRUJtdVVCZ05OcTd1Wms1SHRpbkIxUzVHZjJJUDRF?=
 =?utf-8?B?ZXBYa0NNQ1FlSGsyZnhsNldXNllqdXF0RU44TS9EcmxQWDc5VW13ZmJJc0NK?=
 =?utf-8?B?MlgvZzRRbTB6Ykdkcml1RExVTmI2dFJnNmxtYXlucmhGVS82d01NcmlqSXJK?=
 =?utf-8?B?dEpOcHNKKzMrNzZyTi9jcHhZd0ZDVFhTV0h3aFh5UVpIcnRiaUJjREcxdkw3?=
 =?utf-8?B?R0grR2RsSnZiRVMrelloTXRYMUhKVzY1amw2ZHpJaHhXUlVxZEdQSFZIMThj?=
 =?utf-8?B?Skd2SFRFemRmZjA4L3ZEakJ6WDZLYmZBVzNxaTBJczNyNHdaMDJmbDJVdGVh?=
 =?utf-8?B?bHhkNW9jWEJqUEhyWFp2MHZyQ0pUOUNYb3h4U3MxQlQ4aXlMYTRWM0dqSUpj?=
 =?utf-8?B?dXVDZ2YxUU9IdmdSNy9PRGhUZitzSlJGQzdCN0thYlFTKytuMXVMM0czS3dy?=
 =?utf-8?B?VlFhRmw3ak4xNEtVR0liZElsa1I3RFFhZGlid1ZFdDFweFdmOWNQZzNQVUhB?=
 =?utf-8?B?WWpaVFpSdXVuRnhTNWVTMzVVeXhNeFdPcUU5ZXVHQzNKeVlTVFdPek1Zb2Yw?=
 =?utf-8?B?RDFvNFdxU1hKbXp2ZDZ5SVJFR3cxYzZ1amRrblBYYTZtMGpKVDFiM1BTMzBQ?=
 =?utf-8?B?Q1VxN3V5LzZ5dUdIcnNoRDNCMlE2Qnp4QjM4bXo5STZvY1JPUzdrRUpYUHNt?=
 =?utf-8?B?VlVvekFLaVVyeGFZWXNoeVlKY0NoRENlbmRJVUIyYmVKbStlNldUdE5reDkr?=
 =?utf-8?B?Nk4rV3lzTWF3K3ExeG9ad0FuMXF1SUtwUEt6elhHKzlOcFFQbVF2ZWNoN09h?=
 =?utf-8?B?Z0FNelJiL2JiaU5SMkFhb00rem1PVldHYndaVU9GNTg1THQyb21xZmp4VnJJ?=
 =?utf-8?B?aXFvNGFHRkd4enBrczNCZDU4UWc4emgrTUxkVGhXMFkxOThIbFArVGNGRnpY?=
 =?utf-8?B?ZGgrT3Z5KzlBMXBMR2xxdnBySDJ5Zlc5YU5tOERBV1NXcy9MSHdRYVZsc2Vk?=
 =?utf-8?B?SVV4cWJrS1BTMTZUQ2hxK081ZnFFUnhKK3lqQXhFTFNYNURlM3dvUmxLQzZs?=
 =?utf-8?B?dy9KS2s1K2lJMm5uV05jbjhrZCtqRzQvWmdzQlVUVzdFczA2RVBRbzJnS3Zj?=
 =?utf-8?B?WWw4V2d2WEdJck0vYXNUVGVtQjQ3bzE0TTdUaExwbHdYNHJoQ211a0FTNndV?=
 =?utf-8?B?Q1E1b0RMVnFabk5OamIrT0Ftek5pQzdtWkFZM2k4c0JVUHdwTjZrZ3hVa1d6?=
 =?utf-8?B?dCtKMGw0SmdQeWo4eUNvdUpVUjFJM3VVTVJLdHRrQTdBWldicCtLTXR5QjQ0?=
 =?utf-8?B?Q1dEdG1WMmJmdzBmS0ZFU3pualFNckRGd0xBNTdmZW9Mb2o5M1RaWGJ2M2Ru?=
 =?utf-8?B?SjJBbXNqdThWazR4MWpSaUNMc3lqWFluRU5sTG1SWFQycmtsSlFoclhqUnZm?=
 =?utf-8?B?QndRcStJV3hPQURHU3RIYzRrVE1meDZZeTBSSXAvMkprODVOdG9wMjZWbHZs?=
 =?utf-8?B?dEV6MUl5dEYwK2puWlFIb0FETU5XNldpSDZrN0ljNk4yNTVVeGhnanVKZWs4?=
 =?utf-8?B?ME83aTFCYnJVcUs4RlZrdUNQcGxjYUFmRjZZQzNSQmZ6aHlZT3l0T0tzZk8z?=
 =?utf-8?B?VUtEcVZuRHVGVTdDYTlpVzJVQkVFRlc5Um1BNWRGdkkvRU1BejVLL3QyenlZ?=
 =?utf-8?B?Rk9BcW5MeEkwNVEzemJjY0g5VEdTSDRUdXNFdnE0YkIrQmd2dk9ZQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72D393E6BA2D284E976296C1EB428C0E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b64082c-36b0-4541-80cd-08de403e346a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2025 03:08:24.4458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Um5kaJ7gFyS/eIaLK9DHPfcX6p8lPA6sgz/ZQ9FqufxzOW4T7o1t3FteL9Np2FHLe7orUftXVgjs+g5hsAEwow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

T24gU2F0LCAyMDI1LTEyLTIwIGF0IDEzOjA2ICswNTMwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBX
ZSd2ZSBiZWVuIGhpc3RvcmljYWxseSBpZ25vcmluZyBHVCByZXN1bWUgZmFpbHVyZS4gU2luY2Ug
dGhlDQo+IGZ1bmN0aW9uDQo+IGNhbiByZXR1cm4gZXJyb3IsIGhhbmRsZSBpdCBwcm9wZXJseS4N
Cj4gDQo+IHYyOiBCcmluZyB1cCBkaXNwbGF5IGJlZm9yZSBiYWlsaW5nIChNYXR0IFJvcGVyLCBS
b2RyaWdvKQ0KDQpJJ20gYWZyYWlkIHRoaXMgaXMgbm90IGV4YWN0bHkgd2hhdCB3ZSBtZWFudC4N
Cg0KMS4gaXQgaXMgbm90IGp1c3QgYWJvdXQgZGlzcGxheS4NCjIuIGRpc3BsYXkgY2FzZXMgbWln
aHQgZGVwZW5kIG9uIGd0ICh0aGUgY2hpY2tlbiBhbmQgZWdnIGNhc2UgSSBoYWQNCm1lbnRpb25l
ZCkuDQoNCkl0IHdvbid0IGJlIGEgc2ltcGxlIHNvbHV0aW9uLiBZb3UgcHJvYmFibHkgd2lsbCBu
ZWVkIHRvIGV4cGVyaW1lbnQNCndpdGggZXJyb3IgaW5qZWN0aW9uIGNhc2VzIGFuZCBtYW51YWwg
ZXhwZXJpbWVudHMgYmVmb3JlIGRlY2lkaW5nDQp0aGUgcHJvcGVyIGFwcHJvYWNoLi4uDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFJhYWcgSmFkYXYgPHJhYWcuamFkYXZAaW50ZWwuY29tPg0KPiAt
LS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYyB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiBpbmRleCA0MzkwYmE2OTYxMGQuLjU1OWNmNTQ5
MGFjMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtLmMNCj4gQEAgLTI2MCwxMCArMjYwLDE5IEBAIGludCB4
ZV9wbV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+IMKgDQo+IMKgCXhlX2lycV9yZXN1
bWUoeGUpOw0KPiDCoA0KPiAtCWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+IC0JCXhlX2d0X3Jl
c3VtZShndCk7DQo+ICsJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgew0KPiArCQllcnIgPSB4ZV9n
dF9yZXN1bWUoZ3QpOw0KPiArCQlpZiAoZXJyKQ0KPiArCQkJYnJlYWs7DQo+ICsJfQ0KPiDCoA0K
PiArCS8qDQo+ICsJICogVHJ5IHRvIGJyaW5nIHVwIGRpc3BsYXkgYmVmb3JlIGJhaWxpbmcgZnJv
bSBHVCByZXN1bWUNCj4gZmFpbHVyZSwNCj4gKwkgKiBzbyB3ZSBkb24ndCBsZWF2ZSB0aGUgdXNl
ciBjbHVlbGVzcyB3aXRoIGEgYmxhbmsgc2NyZWVuLg0KPiArCSAqLw0KPiDCoAl4ZV9kaXNwbGF5
X3BtX3Jlc3VtZSh4ZSk7DQo+ICsJaWYgKGVycikNCj4gKwkJZ290byBlcnI7DQo+IMKgDQo+IMKg
CWVyciA9IHhlX2JvX3Jlc3RvcmVfbGF0ZSh4ZSk7DQo+IMKgCWlmIChlcnIpDQo+IEBAIC02NTYs
MTAgKzY2NSwxOSBAQCBpbnQgeGVfcG1fcnVudGltZV9yZXN1bWUoc3RydWN0IHhlX2RldmljZSAq
eGUpDQo+IMKgDQo+IMKgCXhlX2lycV9yZXN1bWUoeGUpOw0KPiDCoA0KPiAtCWZvcl9lYWNoX2d0
KGd0LCB4ZSwgaWQpDQo+IC0JCXhlLT5kM2NvbGQuYWxsb3dlZCA/IHhlX2d0X3Jlc3VtZShndCkg
Og0KPiB4ZV9ndF9ydW50aW1lX3Jlc3VtZShndCk7DQo+ICsJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBp
ZCkgew0KPiArCQllcnIgPSB4ZS0+ZDNjb2xkLmFsbG93ZWQgPyB4ZV9ndF9yZXN1bWUoZ3QpIDoN
Cj4geGVfZ3RfcnVudGltZV9yZXN1bWUoZ3QpOw0KPiArCQlpZiAoZXJyKQ0KPiArCQkJYnJlYWs7
DQo+ICsJfQ0KPiDCoA0KPiArCS8qDQo+ICsJICogVHJ5IHRvIGJyaW5nIHVwIGRpc3BsYXkgYmVm
b3JlIGJhaWxpbmcgZnJvbSBHVCByZXN1bWUNCj4gZmFpbHVyZSwNCj4gKwkgKiBzbyB3ZSBkb24n
dCBsZWF2ZSB0aGUgdXNlciBjbHVlbGVzcyB3aXRoIGEgYmxhbmsgc2NyZWVuLg0KPiArCSAqLw0K
PiDCoAl4ZV9kaXNwbGF5X3BtX3J1bnRpbWVfcmVzdW1lKHhlKTsNCj4gKwlpZiAoZXJyKQ0KPiAr
CQlnb3RvIG91dDsNCj4gwqANCj4gwqAJaWYgKHhlLT5kM2NvbGQuYWxsb3dlZCkgew0KPiDCoAkJ
ZXJyID0geGVfYm9fcmVzdG9yZV9sYXRlKHhlKTsNCg==
