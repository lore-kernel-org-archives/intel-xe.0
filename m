Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A5BCCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5550010E159;
	Tue, 14 Oct 2025 17:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKdo8dtD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06DE10E159
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760463298; x=1791999298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=98TNjhBRnaLpl0CBk3E3UmTcQDkQb01YAzNlwBkJ5B4=;
 b=jKdo8dtDYsd7PiGKmqBIXg98M0KjJ8IkOJEilBdj5nFLI3ZQQHIJsyO9
 9Sa5NM4BGxWbvua4+br5pjZkXpC6A1Xs0e7WjCRvAdrAJUtrdp0c+PN/U
 Cn02/8Psfz8fIGIkDqM7qUiyKQfLKpMqSGZSVSYZN6qQM/y6wGXWDkZMI
 ArMlU0GIQgvhKO0rxunzUBuPB2oHi6YK8J6+UW4XWvX4oIDgDilZXXmht
 dUtMWCtjqwdwLhmGnEEZEC/N2X2CkD4jpX4qxnHhK4Ecyc4ar9K5ClCfD
 u/7PUls6IkSuh2vA9fIoDj/a1gUjOPzjByolhL4CzA/0WHI+F1/zoHGFa Q==;
X-CSE-ConnectionGUID: yeBT2pfESMGAQACi97cNDg==
X-CSE-MsgGUID: gUjZFVLISfeHkNRQ91TWYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62540162"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62540162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:34:58 -0700
X-CSE-ConnectionGUID: uFWwLARSTvWfXRET9oteog==
X-CSE-MsgGUID: SP80eg7dTOqevSY7eSrG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181627042"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:34:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:34:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:34:57 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUbaV7onB3ecEASELPQQEM+mKb2ce36obs6H/34H3Otm/2HfHjrKrm+uIOIj4/SeEIQgzVHYTbHF3tFr5z5XkBWdc1HHB6RxQpg4f6UPtCDo7D2N/lKfHtwnYH7sUxGKd9bHPASfJ6nz5LikJn7GogXg76B6SOWKtnCMWcY3FPScseBoKo7vnkpH4XNfzXD5dbGOEbr6hvgm2vw0vN6agAs00/nxB/icon9Dg8ntVn2El+FQTQJXFbaFNu/9CtJ7MCMq8zV6D+xNDJZb6shbrfK6tpeFYKUirwv+dHvMqu5mvQuaiwpoIpS6aBpoI74uSG28TlFbFqjcUUPIsZsfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98TNjhBRnaLpl0CBk3E3UmTcQDkQb01YAzNlwBkJ5B4=;
 b=JpQEXByvF2gNvSNL2w9hovN+I31gOdZ+1ZXFrOj+KmhkcZ/nlkzvZFyZjsjG8l/TfnZiare+qfN5ls6I/kz4B/3ZDXRhV0rNAWl49kjtKedGGQABgEXwh3ro+zssulW4fnT8hInwj2xS6Yw81jx9rf37B+CqcZ1LflojjTffnENkRSwBDvQB63GE1snKcvsS5AKO0Y9GGXCuBFatAirqGQ9PTUpaulWMicyH+5fFaY7WZy4ukON265HD7G0mMMPCyiFSjljEpA+mX1/9pDX7OU6/q80/0Ny93FikwvOt8F0IifYw4FTxVEdsj+kqZjIi4k+nEzVwMhWpDsovafrm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 17:34:52 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 17:34:52 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 4/7] drm/xe: Guard against NULL GT in xe_sriov_vf.c
Thread-Topic: [PATCH v3 4/7] drm/xe: Guard against NULL GT in xe_sriov_vf.c
Thread-Index: AQHcPSpULpnpcH6YeUm2Wp1fRt7/wbTB5tOAgAAAOXA=
Date: Tue, 14 Oct 2025 17:34:52 +0000
Message-ID: <CH0PR11MB544462D8C1EC6BC8DB004A9DE5EBA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
 <20251014164758.125598-13-jonathan.cavitt@intel.com>
 <fb5a44f0-8e3e-4463-8bad-9d50293e2f92@intel.com>
In-Reply-To: <fb5a44f0-8e3e-4463-8bad-9d50293e2f92@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7315:EE_
x-ms-office365-filtering-correlation-id: fa943fc5-bfde-4561-bfed-08de0b47fb6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?SGhiSElyM1Rsd254ZnpGejRBYXY0dFQxc0hDd2FLcUVQMkIyVm4wUitvMnpK?=
 =?utf-8?B?eWw2MGpHS3h1bWh3RE5lblVsM1Y1bE1pZ2NVQTlVL1VHYkhCdUMrTmkwZ25P?=
 =?utf-8?B?YnhiYnRGNUc0dmNqQk0vM3duNC9FbnNLYW13UXBGWkU2NVR2YW5xWEFGa0RZ?=
 =?utf-8?B?RW52M21xNnBkQWRUSHJnRFA2WjdJeWJSTndwZUF1SVdmdU5oc2hIMk00VlY0?=
 =?utf-8?B?a3phZmFxcG5vOGNvNis2SW16bWhuNUYrUGN6Z0hXTTBJQnFhRGlWdmNKeXN6?=
 =?utf-8?B?T1drS0VkOVBXZzB2RTcxYXA4MkUzeVA2MER0Zi9nU1hvV2IxSHBhaVZ0NkN2?=
 =?utf-8?B?UjdoUDhJa0xUM21EMnZEbUVyY2lEMUUyc0gzV244YXJsNDlsQkp4RjNkZmU0?=
 =?utf-8?B?SVhldkdHS1NEbVZMQXBCc0tvVzJWZzZ3ckNjTWN6ZHVFZi9GZmVqdW11UUNB?=
 =?utf-8?B?WjVYU0xyektXSmJ6aXY1aCs1VWZ0aHhqTitxSHJMVFpVUnVJYXJyVnlZSjA2?=
 =?utf-8?B?VDgydzMyWGxOTkNXMnlZWU1ibUZXR3JZb0ZGYkEyenJEN041djBoMk1pS0Z3?=
 =?utf-8?B?bkpOR0RkL0NSWitWUkFGOFdGdXZhdEp5U1NHWEFmSnNnQ0Z4WUIrME44N25H?=
 =?utf-8?B?Ykt2TmhheE92UEdmbDVPMWhTUUtnaGRlTXFUMkM4NGR1VGxmZElUaGUvYVAr?=
 =?utf-8?B?Rktyb1hEYVEveVNleUlrNmZrRm5xRVhzaHkvK1VsdGxBc01hQ3BEb0VqR2dw?=
 =?utf-8?B?T0M4L2FOdnh3bzJHTkVvOFVBcXRyZVVTV0lNeUpaYVAvMUlLYlBIMkJkL0dn?=
 =?utf-8?B?dnlvOUtnNUc2MlQzVVVNRmU0Slc5c2ZGUG9YclZNRFBBN0EyR0E1UzhEMzdQ?=
 =?utf-8?B?NjA4Y2V6ZFRsSk9Hak95Yjh0dmRpQXQ5QjlCWjQ0aFpOQzhESHRvWnhoQkpJ?=
 =?utf-8?B?b29xVjdTOFRZelZ1a2NHbEYyd2ZMSks1UmplS3F2UkFTRzNFK1RuMWxWRzJ2?=
 =?utf-8?B?WDAxWTZzc1NIcmtKZkxQS2M0VXpVUGc0NlllOXE0cERIamU0MFlHUVpNOE13?=
 =?utf-8?B?eVNhT3ZOWWQ4S2U5dy9iZkVFSVBpdGtFZnM1RlhFU2R1bkp1WGdVMUV5akty?=
 =?utf-8?B?dEN4bFpVQ3poczlkL2trVWhxTFRmN05JdzRpZnVJcWFrV0k1Z0kwa2dGQlo5?=
 =?utf-8?B?NmdsTFI1QkYvNmFteThBYVg1TFFaQkdMd2doc2RpY3Z3LzFjakFhQXpWSnVY?=
 =?utf-8?B?Z0RDdTBYZkFWZVp4VG4yMi9Gdy93Y1VickFHaVBqSGRyZkhSbmtoMnVoZ05L?=
 =?utf-8?B?Szh6cG4vNGtEY2JISnYxbEV2WVB3Q2QxbTdaN3JNYmhCWXZCRHFCbS8xUDkr?=
 =?utf-8?B?R1dHRkd2V1VGcVFEVVZRMld5L2NZV2ppelZxRm9mZmpKd21abjZxKzEzaG1l?=
 =?utf-8?B?SUtwa1BUVzVOOUVGOUdldkM1dGs0Y3IzRTVSZWdPZjhKTndabGhpVXYvRDhv?=
 =?utf-8?B?UmVKNzBGUWRHRm5tOFVsdDFRVHMwL3ErZ2Z4Q0lJYXU2MnR2WFV0elpHTTdQ?=
 =?utf-8?B?VEJBdEF3M2JIQk5LRWhoenUxemsyUjluVGpnZHkwdWMxNFNyb0F1YUtvR0dw?=
 =?utf-8?B?RzZwS3dMTXFqbG1rcEJNa1ZwWXJYWmpTRitFL0Q4Tjk5UWtJc3FaVWM3YjM1?=
 =?utf-8?B?RDhOd1RGdFNUUWV1bnAveXFlbVREMEphQ3pvUzFCbjJDOE9ZeXliYmtwRFVr?=
 =?utf-8?B?Sk0zMHQ4RFhvSW9GWkNZNGhxZnJxUHRIdWp0TkF5aG9vV2xka1Fibjl1aEZ3?=
 =?utf-8?B?L0MwQWE5STUvY0w3eVVic2lITDFaN2ErUWpjSUJ3SndMRktoWmZERk5vVGE4?=
 =?utf-8?B?V3A4dnVmNFllV3BHc1BPbm9KVWEvYkZYdVZFWGZPVmhKam80V0ZQOThka0VH?=
 =?utf-8?B?VjFOS1FqUTZOVit5T2pzZnhQTDU4TlI3T0pnYWFLVnBpNk5CdFk5QTJ1KzRo?=
 =?utf-8?B?SnpnUkNkck5yMHUvNCtkR2RKbVgweVZMb093WEhOZnU3TTREaG1ZSmRENjU2?=
 =?utf-8?Q?CLAjEx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFh0OGpkaTkydWJRTTV5dWkzRXR4OTlaZlZlcFc0VVgrbUthcHV1Zy9oUVpY?=
 =?utf-8?B?a2hXVEJIVU5nL3FLK2JDMVp4ci81dGVyTlU2RXBUei9QQm9mSUZQQkY5aVBk?=
 =?utf-8?B?b3BzZU1zaVRkRVB4d3V1aldmcTY3SEtjV2ZRU1hUVDQ2OEhtT013TURRZXhy?=
 =?utf-8?B?NHVEci9YcXlGaTVINFcvVEVNdzFsWEIzeGFzK1NHNEcyTHVubWVYZVFyeTM4?=
 =?utf-8?B?QVptUFRYYWVCemZ6MVNTSTRVeEhYdHUrMUJHeUZpSlhxOXZaenRHYU9iVFM5?=
 =?utf-8?B?ci9OZEZlSXpDM0RndWdCbWZ3L0ovL1RjYmlhdFpMNDI0NHdBVXJ3aWlSQkZL?=
 =?utf-8?B?dTRYUktZWWFtQ05UWmRBRGttZnB5U3ZSWmZMUlRPS3lMTlo2R2ZGU1dKWUow?=
 =?utf-8?B?RTJlc3VyTFJqajFucXEvampoMnMwaENmemFUN0kvQXdaNWlMODNNR2pKNWlu?=
 =?utf-8?B?QnlDUEpPR2pqVFZYSjBjMngrQU1qVlZiVUI2a1UyMnNKcnhrcjVrai9GMVFC?=
 =?utf-8?B?MGoyN2FnY3BXMGJJdVpOcFRoeGJIUDd6SUhVNzh3SmlZbmozMzdZakZKWXpY?=
 =?utf-8?B?MVRpdW8xV0FFbkc5SU5RQnRlcm4xQjMyZnk2VlVtUG9PbHpvYXRiRmZJMjd1?=
 =?utf-8?B?UGUxRjJ0Y0g0TnpQWXJqd1A5ckhjbmhGSE9NTWxlelp3V1M5WUNibFdZZ0ZR?=
 =?utf-8?B?TjFoY0U4WmZvaU9NUGhEQUkrK1A4MWtqYkhuTW9OQUxPSFp3Ky82Ry9LQm5i?=
 =?utf-8?B?SWdFc1pTeEtSUGRib3hhNExuajNjenJTT0F4Y09oa0daL3FnVCtIQ2R2VzQr?=
 =?utf-8?B?dTRaWkxFRHZMMGFkTFB1cnlkME1DRGxmSmZyUTl6VHF3RldOQ0tKNWlVUFRP?=
 =?utf-8?B?bkpneDBENm5rL3dlblE3WkVSNzdMVjN6Z25jL3VvUWdEemtFU1E0cExkcVRP?=
 =?utf-8?B?KzdOb0o5NlIrK25BbmpuSVZKV09FZHFmOWxWZStDekVPUVErY3RrSzFnNHV1?=
 =?utf-8?B?RU8yeXVNaForUHBwdllBRnpoa0N3Y2hyaWZIRzgweXp5TlNWRjFOeVpud2NL?=
 =?utf-8?B?dklwMFpDbUlqVmJhYW16bE9PSjRDa3dwbWVqNkhyMzc0WlBMWHBYeG83cmZw?=
 =?utf-8?B?THE1cC9tUmpSZVpFK1Z5cmdLYlVxUDlKWkI1b1ZIdzRxNTFtN3lnQ1RtcTJz?=
 =?utf-8?B?VWllVXRvM053eW9oazZ5d1RvWXV0ckthZTF4b3VCTDBtblI2VDRtM2hVM01T?=
 =?utf-8?B?eG1HV093bVZwQUZQSnBRcERSSThIaXlZOXNyRE1ERVh3bU5SZDQ4NVRoQjZq?=
 =?utf-8?B?V0hYMW5kZTF2L3BjM0xyR3FDUHA1Q1UwSFM5MUo0aVFlZE5pbXdqRW5qRUNs?=
 =?utf-8?B?TDVIOThsOUVEakFUbHhmRVZMUTQreE9jUk03d0x3czJPTExsV0JDbFdRZ1p0?=
 =?utf-8?B?RldHMXZ0cFZ4clp1dk9TVnV6dktoRmVvWUJjb3U3VDRRT2FxZFAzZXVKRE1x?=
 =?utf-8?B?NjlFMi9GR2owcHA4Q1FJaHhHODgzM2UxZWhyNG12VlRMVmxSM1prSGpBTVU5?=
 =?utf-8?B?Nkd1K3VkWE5jRXBJS3dxOTZXRHVVTjNPcGd5Q2ZZZEVrcTM0ZlpnWkh1dHlR?=
 =?utf-8?B?c1R0eG9pWDZMQnNaY1NuZ1pnckFXU2o2WGhWOHJTWkZKbXl2T0l2aGtuWUFE?=
 =?utf-8?B?TkhNQWR5RWErU0h4bnRwUE00MnlueFBNdDBkMy9UMTVBajJ0WVg4cnpuUmFs?=
 =?utf-8?B?QU1FU20xazQ1T0NrSndsOHVPL1I0eUl1MlVhSVh6Qi9JeW1BUTFHRHhzZ05p?=
 =?utf-8?B?SW4ySWVVaFpLV0RoYUVwc09vQXdGcG0vNURlTklXeUlOUHlDWGkySzYzU3Ft?=
 =?utf-8?B?NUtzUDkrTDY3dnVXcm93bXYzV0FQY1QrUEl5dlEwOWQ0cUpVclZWcWdiMFd6?=
 =?utf-8?B?TzcvOEJGMkZ0RHduN0MxWGZ5MEJQWXNvZEI1MTgrcEF3ekJSV0orQ2JZVVB1?=
 =?utf-8?B?bUtJalU0YVpJbzFOd1RrUWJvbE52dWoyT0tBRkh1akhaeW9GWEZjd0VGcWUx?=
 =?utf-8?B?WHgxRWQ5YVBWVXYyWUx1OEIyQnY1dHBQNmF5NkdFenRWM1dIblVhZjlpSllT?=
 =?utf-8?B?MGxMS1pnYk5FQVhXODFlK09BeWk2VUxmVWRBWEs1Zk9zUTZ6NXdwM3lNQ2RN?=
 =?utf-8?Q?4Ocf0V0JTthf+cgL/e4Vc/6CQstqQ72CcAQMJn13ZTXy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa943fc5-bfde-4561-bfed-08de0b47fb6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 17:34:52.1433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eLUUgr5U/Z6RTOIoUFsX+sxvfz/mxgaCZKah66QqcqKdqVn5DNp7V5/FID/qv6TreFt9Jm9siYie19BBW8CE+4C/aYMURFV9h1PY95cBOyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDE0LCAyMDI1
IDEwOjMzIEFNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEd1cHRhLCBzYXVyYWJoZyA8
c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+
OyBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgVml2aSwgUm9k
cmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBh
ZGh5YXlAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyA0LzddIGRybS94ZTogR3Vh
cmQgYWdhaW5zdCBOVUxMIEdUIGluIHhlX3NyaW92X3ZmLmMNCj4gDQo+IE9uIDEwLzE0LzIwMjUg
Njo0OCBQTSwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+IFN0YXRpYyBhbmFseXNpcyByZXZl
YWxzIHRoZSBmb2xsb3dpbmcgaXNzdWU6DQo+ID4geGVfZGV2aWNlX2xvb2t1cF9ndCBpcyB0aGVv
cmV0aWNhbGx5IGFibGUgdG8gcmV0dXJuIE5VTEwgaW4gc29tZSBjYXNlcywNCj4gPiBidXQgc2V2
ZXJhbCB1c2UgY2FzZXMgZG9uJ3QgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBiZWZvcmUgcGVyZm9y
bWluZyBhDQo+ID4gZGVyZWZlcmVuY2UsIHJlc3VsdGluZyBpbiBhIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZS4NCj4gDQo+IFNSSU9WIFBGL1ZGIGNhbid0IG9wZXJhdGUgd2l0aG91dCBwcmltYXJ5
IEdULCBzbyB3aGF0ZXZlciBoZWxwZXIgd2Ugd2lsbA0KPiB1c2UgdG8gZ2V0IEdUIHdlIGtub3cg
dGhhdCBzdWNoIEdUIG11c3QgYmUgdGhlcmUgKG5vdCBOVUxMKQ0KPiANCj4gaW4gb3RoZXIgd29y
ZHMsIGZpeCB0aGUgdG9vbCAobWFyayB0aGUgYnVnIGFzIGZhbHNlLXBvc2l0aXZlIGluIHRoaXMg
Y2FzZSkNCj4gDQo+ID4gDQo+ID4gVXNlIHhlX2RldmljZV9nZXRfZ3QgaW4gcGxhY2VzIHdoZXJl
IHRoaXMgaXMgYSByZWxldmFudCBpc3N1ZS4NCj4gPiANCj4gPiB2MjoNCj4gPiAgLSBVc2UgeGVf
YXNzZXJ0IGluIHZmX3Bvc3RfbWlncmF0aW9uX3JlY292ZXJ5IChNaWNoYWwpDQo+ID4gdjM6DQo+
ID4gIC0gUmViYXNlDQo+ID4gIC0gVXNlIHhlX2RldmljZV9nZXRfZ3QNCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+
ID4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+
IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9zcmlvdl92Zi5jIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NyaW92X3ZmLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfc3Jpb3ZfdmYuYw0KPiA+IGluZGV4IDE4OWIzMDc5MDFhMy4uOTExZDU3MjA5MTdiIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zcmlvdl92Zi5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NyaW92X3ZmLmMNCj4gPiBAQCAtMTY2LDcgKzE2Niw3IEBA
IHN0YXRpYyB2b2lkIHZmX21pZ3JhdGlvbl9pbml0X2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KQ0KPiA+ICAJaWYgKCFJU19ER0ZYKHhlKSkgew0KPiA+ICAJCXN0cnVjdCB4ZV91Y19md192ZXJz
aW9uIGd1Y192ZXJzaW9uOw0KPiA+ICANCj4gPiAtCQl4ZV9ndF9zcmlvdl92Zl9ndWNfdmVyc2lv
bnMoeGVfZGV2aWNlX2xvb2t1cF9ndCh4ZSwgMCksIE5VTEwsICZndWNfdmVyc2lvbik7DQo+ID4g
KwkJeGVfZ3Rfc3Jpb3ZfdmZfZ3VjX3ZlcnNpb25zKHhlX2RldmljZV9nZXRfZ3QoeGUsIDApLCBO
VUxMLCAmZ3VjX3ZlcnNpb24pOw0KPiANCj4gYnR3LCBjaGFuZ2luZyB0aGUgc2FtZSBsaW5lIHR3
aWNlIGluIG9uZSBzZXJpZXMgbG9va3Mgd2VpcmQNCg0KV291bGQgeW91IHByZWZlciBtZSB0byBz
cXVhc2ggYWxsIHRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGludG8gYSBzaW5nbGUgcGF0Y2g/
DQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+ID4gIAkJaWYgKE1BS0VfR1VDX1ZFUl9TVFJVQ1Qo
Z3VjX3ZlcnNpb24pIDwgTUFLRV9HVUNfVkVSKDEsIDIzLCAwKSkNCj4gPiAgCQkJcmV0dXJuIHZm
X2Rpc2FibGVfbWlncmF0aW9uKHhlLA0KPiA+ICAJCQkJCQkgICAgIkNDUyBtaWdyYXRpb24gcmVx
dWlyZXMgR3VDIEFCSSA+PSAxLjIzIGJ1dCBvbmx5ICV1LiV1IGZvdW5kIiwNCj4gDQo+IA0K
