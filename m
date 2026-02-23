Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C435EEC2A2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E27410E457;
	Mon, 23 Feb 2026 22:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIaq96Jm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7D310E457
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771885552; x=1803421552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ijSk1Wn6hUChXtisZWikbNTKWG4IX9YhHeXEcLaqkvE=;
 b=FIaq96JmWDyDJvmrv6Jq+NXCWD6r/+MhQnTA6HmoQNSxvPS7PjgUtof1
 wGD+yWebpjJJnSIm6fd4J0PiKJ4Cwd+sIf8oFLV0vc5RwrYvkWSbc41l7
 TukmC6P6JtB7Cq4wPRQz8WX21/KBcCAx1iok2A5So8v8kYiZ18xfsuAXL
 VF4xM2xjRwHdKLdxke/dvnP0iH6Olr9+yX3rtplydsD6qFLRLr10HxrWJ
 8ikbsBQuY4P30+tEtzkOuS2Ue2hAH+hC6vBUD3njnWCk4NwYnOlrhKYSf
 aAD5o4QFX3d7Sy4RWSAP1xvSl9Q4FrT36Qt/s8x747VRSeMdGAZYzd/YE Q==;
X-CSE-ConnectionGUID: n1b/f2IPRc+ty/rEu3NWwg==
X-CSE-MsgGUID: drir/u3jRnmzKR97+4a3Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71921387"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="71921387"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:25:51 -0800
X-CSE-ConnectionGUID: cVCh9osXS4GrcNWRJMI+/A==
X-CSE-MsgGUID: wpeRbEwgRIiCW0L6ikafLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215720331"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:25:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:25:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:25:50 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:25:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKAPahcDOyIFoVwLygNNswZSrDTYgPb50Ey+/7eUL4UHc/vpK/XTW5V1BdoMHNfwemhWXeVKsvnS8XfPI2NggIMqK/jbb1OzNk/oOLMR8XD0IGf27pVJZ7g/AG2AhjdiA5fcpiaqqajXndb7avcA7wuH7602wybb8+nnkpInN8JF3pwZNPNbY6GryBu7m/KoYccMbWhQ6saF7iam0x0TKVcFyztTuaPAEpsHuNyv2N926Op2b/yhXuXAMwadogTTfJQ8tHw/jZUdqEHAyduYOr16WR4gTJ2rNCZ1+SGNt7FP4ZZsckBdN07kHacFyFW4LBxsH1lz3TONgBw/6vYl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijSk1Wn6hUChXtisZWikbNTKWG4IX9YhHeXEcLaqkvE=;
 b=AD+aRDi792/4MgmC/OXjLpBHLW+BvD7Efy0f+H1QxRrSqnxvUhtCgMFSq6rk96rOcHJ8sIJ3fr346ceK86V4evxyYO/L5CRJh8qWhTG5t4H/8R+gmjmitW+9bel/TKb6Yvn3eOdLPzjMLx6yAEWIU3CEeMxrhzJpLl3Ezfr3xRe1DJyrGDjeoSVf1Mns5By0tI0dvCtfFqO8+kQ4b+OYM/Q/V73eB9VtLXn+VR/GU3LWXsKbJbHjjbUk3BxsSIxSEluA5qUkw7c+Khgkcsy3QeCA3Ye2YLNXfhHRL5rNi0DwP+lhXM9rpRWEQNFguWPXrA9aT2I5TCn0ZQMMizdcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:25:48 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:25:48 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 13/23] drm/xe: Consolidate workaround entries for
 Wa_14021402888
Thread-Topic: [PATCH v2 13/23] drm/xe: Consolidate workaround entries for
 Wa_14021402888
Thread-Index: AQHcoo5hkwv2WsikvEuRa/oiDX3PvbWQ33lA
Date: Mon, 23 Feb 2026 22:25:48 +0000
Message-ID: <DM4PR11MB5456F5267169394EA0EAE121EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-13-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-13-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS7PR11MB7805:EE_
x-ms-office365-filtering-correlation-id: 53b7170f-832a-424a-8b76-08de732a7e95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cmN3dGQ0ZXVRUVhkK0w2dWY1cGVIcnE2aklnN0FvN0dTVzNkY1B6L0Jwc2Rx?=
 =?utf-8?B?WlVrekRxVkpSNDgwcVhyOUloQWNVazZKdi83RmtoM2xJOVJRQ0p5Rm1DdHZD?=
 =?utf-8?B?SWZXZmNYc0hHNmVDNHJRdThEdkw0WkJjdDZMcUlnN2daTjhBUml2Y05lRm5Y?=
 =?utf-8?B?cm1sNTkxNEVtTHlGbU5GQ0VPaS9jK2w4c2lrUXpjZDhwYk5MT2dkOThNb3hL?=
 =?utf-8?B?SnhOeGpOTldtQzBSSlVJNVMrU0UxV1ZtR2lJenRIekVXcTYzSHNsUVRBYkxH?=
 =?utf-8?B?U2NqSWQ5Y2RZYmxtRFlkR1FKdWZHT1UwT1NDZStJKzZKVDhmY3ZOYjVzVGkx?=
 =?utf-8?B?QmpWejkwTHZUSU9CTk5wMDljREhXTng2M0hiZGJPazl4NTRFeFh6S3Y5K0Vz?=
 =?utf-8?B?ZUpNSjVqRmo3RHFTNUpMeW5mZis5cTVacFF1ZDg5T3ltMzdTSmU5RHYyV04x?=
 =?utf-8?B?RldHbnlvV2pJaklGRkF4R09vQ3U4ak9oc0FObVBBY2RjcWhlNmRuSFZVUEM1?=
 =?utf-8?B?OWdhRVBHUGxocmRVTUNYZHY1cDY3eGkzaUIzQkFjSTYrVGZHa3I5UExEODlF?=
 =?utf-8?B?Mm0rWC8raTlIQ1hRZTNtMVNCOGl2ZGh3TWNHVlhVdEt0UnRDRmhzTmc1VGNt?=
 =?utf-8?B?N2RoODhDSTZxM2hjTm5uNC9QV0hJd1JVeW5qWDl0RlMrL0dRYXA3bGVhVzJk?=
 =?utf-8?B?T3g5OVpCMEk1NS82QmNTYmtzeTNsc1J0a1pNK3l6YzQ1ZlE3QjZjLzY1dTRK?=
 =?utf-8?B?WWtVRkRZTFNMOHBtWkdkYjJLWm44NXpEenYxQWp0K2Y3akxybElhTUw1S1ky?=
 =?utf-8?B?WHFXdFovMnhNR1FXRzhpTDV5dXBwU21wZUtmSXkxZGJOUnMxRC9Sb0lqMmp2?=
 =?utf-8?B?eGFHRjdwZEdFUlZrVS9YaTU3bFNHYnhZR2pKeWZQbU9vaWlhbzZqWmNDK1Az?=
 =?utf-8?B?Q09aODVkU3dhVGxFdmVtZk05T3FEMHRwUDZ1WTRRUGFTZWZMcHFYaEZvS2Rk?=
 =?utf-8?B?aUVVcEM2Y1FMUlU4VDdpNlFlM2M2cUlRYVFicWhrWmhyVVZQRXZWUTBrWmx2?=
 =?utf-8?B?enE4cHBEM1hKZkNZUFZQZ1lHWFJJQU9ZMHNSa1hCbDliYnJxUFhQam80eVo4?=
 =?utf-8?B?MDcwLzFBWnVQR2dMbTMrUE9HNGN2ZlM3a29wZnYwRE9yY09QUWg0dGV0dzBT?=
 =?utf-8?B?c2xjbUFObTdZc2o0L3QwVjNCR3VPaHB6cVh6VUE2QzZLNFZMQmVjMTViRWw5?=
 =?utf-8?B?Ri9BSXR4M3FSNXkyaVRNeDdTYWxWUG5XWC9ST3MyUGVHSk55NmtKaFNXN3ly?=
 =?utf-8?B?QmZOTloycy9uREs5bnlXeWp5ckpNVXNUUHkyMG1TT2lXbHV3c0NQQ3RqTHJo?=
 =?utf-8?B?VFNDeWNJQVRMcDh5WTBDcGlJd3llZjEwRFFJdmRmN3F0QUFMMGtCTzA0NndW?=
 =?utf-8?B?UUtvNE1sRDBwYUVsM041SmpmZWl5MlBneVJDbWhCWWNDNHNkZXZHbXV3Z3hr?=
 =?utf-8?B?RXJ3N2NSdW95b1NhRS9USERWVnV1UHJLdnRlVHZvd1FxMGt2YUlkQmdqblR6?=
 =?utf-8?B?enVFdUR2TEV4ZVVFMCtqRnc3SHdSNkFtZnNrTVN3OXBZL1lpb3RxbFJQNXgz?=
 =?utf-8?B?dmc0MEdZYkRCZkxyYWQ1MWxHS09zOVFndTJqeVp4K25MME5MaHBJeDZKOW03?=
 =?utf-8?B?Y1kzSDFBVXhZQlRqK2VSQ3pEQnl0ZHNKdUYxbjJEams4NEVCcVpXR09PTEhx?=
 =?utf-8?B?N21iQWlTWEY3dnhrRTlza0x5a3VsTVI0M1ZXNnl1ZkhGdzV5UWM2eDBOczJ5?=
 =?utf-8?B?R0hjRDJ5NGNOSVJHcER3ZGRZS3lDaWMyQmtyQTdjSDUwMHVndE0rTUZVVnhw?=
 =?utf-8?B?bmF0NnZRU0RHRE0wUWZGREpxcVMwZzl1Rmd4cTBkMVVPREJXR0RncWVxNTRL?=
 =?utf-8?B?dkFrUGwzRlJHd2lvUUNNUlR3WkZJN1Q2SU8yK3RyN0VNUi8wQkE3TlZXd1Np?=
 =?utf-8?B?aURzVEtlalJDTFpmMndrZVZ1aW1UL0lYQ2hacmdlTUdacytkQ25Ga3FHYjVy?=
 =?utf-8?B?V0tkU0FTc0d4bUFkNVE2N0hlNlQxSVppQVlEdzVnWnA3bnkrZ0d4YTBMUzgv?=
 =?utf-8?B?bUpncURJUTYzaXprTzlZbktKc0huZGlCYlFTZUsrenhmY0Fvd05ITkRsaGVw?=
 =?utf-8?Q?Kav5zvlzcXIbLZGh0+WUyms=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nml1dU9ISSt4cTFCZGJQdkViL0RqZEJNaFBoTndEL2ZMdGJZdTFPVVVaTGRY?=
 =?utf-8?B?N2Y0anNOemIzTVNhLzBKTmRidjZlbnUyVzZxbTVhaWl1MXdWTDlGUno3L1RO?=
 =?utf-8?B?aU9aUGpNOGUzVENCZzJab2pIaEFBS0dlWThjQllUNVorRTliblVlb1hkaDUw?=
 =?utf-8?B?THpOTWF0ZG1keW1pdVIrNGc5MjBNcFR3V2dqRnA0b09WNFMvOVppa2EzZ0JG?=
 =?utf-8?B?QTdKMUlQRzVQUE1KUVZMcEV6WWlhSjB6T2x1UHk4YVhocktTQmY4K1ptQTBn?=
 =?utf-8?B?OWNjSFIxM1Rwa1U2YXRuM0Nnd0NKbzM3akVBZytwaUZja1ltR0liUTgzalY1?=
 =?utf-8?B?RkVuTnlEWUpPTTg0a1BFMzZSWmRTbWFFLzgyeFl6aisweFBLZEZvUXdqOHNp?=
 =?utf-8?B?L2xlNThmbHNON05XeWczbXlyUEdGalgzTzlMYUFsM0tIaWlNMmtFVTYza0J4?=
 =?utf-8?B?UlRmV2dwZnVub3Q3TXNqVUQ1TWlvRGVPUHIybzZyTlFhWHFSVkl0U0cxVDN6?=
 =?utf-8?B?RjhpdlhjSHFOTzViTnNGTFhxTTltVXQ5TC9RVjV2VUVVV2xXR1hpdEtHeE5R?=
 =?utf-8?B?MFBjdzFaWlRxQVZVSFlRL1RNS3p4MHduRmpjRjBueE1pSlpJRTlsMGd6djV2?=
 =?utf-8?B?ckFmdUNZNlZJN3RvZFAwS0tza1doaEkrQjRMQ3pubWtUNzFpdVc2STJDaUxo?=
 =?utf-8?B?dmNLNjdoUEVFc0JKWm1vbG9sQmVyNWFJUVJ3Q0x4TnpHWXI2ZnE2MFZiM3dI?=
 =?utf-8?B?elVZQ2lPYTBNQ2lpL3dWQmRkUHhWSTdzMjUwTG9oem4rNzBEaENPUXkzczdZ?=
 =?utf-8?B?UjBqd3k0WXdpbnozZHhrMGc0cDdYRHAvQW1UYXgvclJ3MmVoR1JyeXRKU0xh?=
 =?utf-8?B?NUFuYm5IeUZwbHR0c3o2MlhrOTA4dXlCTWdCeWI2M3JuRy8vYUNsU1UvdXR3?=
 =?utf-8?B?ZEk5NUV4cUVXNFlvemVNd1NzaEU5L3lxUkpFYXNWaS9JanVoTGxMSE0xWSs2?=
 =?utf-8?B?UWdLTHZvMlloYmE2Y2NDbCtONi9NZkl4Z1RKYjVZaVNqNVdvUFBmRjdELzRU?=
 =?utf-8?B?Vy95SzRmOVJWUnBYc1RXSTU3N3BYczUxTHhIQmxyYjVHMXM1bVlRSlhOZkVC?=
 =?utf-8?B?ZDErd3I0QS9zV01vbTVxelJVSHhZQlpVdGhmdkdTMWwzdEM2b3FObnpKQzhs?=
 =?utf-8?B?UHUxMHVNOHJTWVZvREk5RCtpVWQ0QVcxdjJaaWxrODJidnJPSDFKaFVReDhy?=
 =?utf-8?B?UHZscjRRNXFnMWdha1VKQ2xGYS9QSFRiU2M1Q1VaRmJ6emYvUUlVdTVnQXEz?=
 =?utf-8?B?c1JNUHNqbXlRZEp4R3dyYzdhc0hqSUtRSCtraWpHeEJnNWo1V0JJRzhKTTVt?=
 =?utf-8?B?UVFxdi9OZ0c1YWJubUV1eXhHanBkU3U5b0ZEMXRrSWRyM2RRa0hhQXN6UEUx?=
 =?utf-8?B?dnIydkJ3KzlTL2dVdEpGcm91RWxmYkRrbnNRSnljMHJzMXgwTzVROUVKMjM2?=
 =?utf-8?B?dk00d2NsUXBZYkwyWGhKM0tMMC9wb1ptL3Q5QWR3MlUzUzRqdkQyakhQaldq?=
 =?utf-8?B?dVhGSDFLbDJ3MGVWRCtQL3FiQ3FJd09LM0dTR29FV0NGYXJWeWpxMXgrYU1B?=
 =?utf-8?B?RVk0Y2FIaFpZMFBRT0lGM0lDdHJzeEpNNUl4N2RtZmIyS1RhVHdxRUxocVJP?=
 =?utf-8?B?WXhLWVNIR2diQjhpRjJXN3BMcER4WWxUNUxHN1k1eWpuZm4xY3U3RVl5bEVq?=
 =?utf-8?B?MUNnd2V0NVFhaEltU1laT2NjRWJyVXBKNDVPN1h5QjU3c3hsSUFINHQ3aGNV?=
 =?utf-8?B?cjhBd0M4enRjRGtRQnJ1N3drSWVwNkJLUnV4QUZQREhuWVdkSUNLSUF3RkR6?=
 =?utf-8?B?aUdMMlpwMmVsOEZVaFduRHZESXUzdGsxeEhETUkvOHA5Nmw0bEIrOGxkYTJp?=
 =?utf-8?B?alpDcXdFK0NmMXpnTmtlb3c1ZTVyMFFyZ2JyUnlYL0dQQ2ZaYm1nSmJYY3hm?=
 =?utf-8?B?ZnJpRXJ3NkIxdFlYckk0VkpDaHUrZGdFbkJiRXJ2dVhyTXhuaVJNejgvbGVD?=
 =?utf-8?B?QitLUVFqVHVuSlZ2OFBCcnpBcXlJWUtpd0cwVElaT0lwVitvSkRXWWtkUENT?=
 =?utf-8?B?dGh4cjB5Zm5JZGZFOUUrZVVBaXpQUkh1L2UrSTFYbUFFb3g3VUpMektkUTNi?=
 =?utf-8?B?dmlVdnhYdkZ1WGFlQlZGQTdGajhnZEJEOUgvK2RWbm8wWDN2d0hRcC94NGh5?=
 =?utf-8?B?MjFYSmU0cWRLVHNGb3daL1ZFN0lQaW82K3V5RnJKRzgrVUJlaXZxSXFjdElD?=
 =?utf-8?B?S2NEekJidnhVYkEyTFhha01VTERlWXlEdGNBdDNTRlhaaUxtbVdzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b7170f-832a-424a-8b76-08de732a7e95
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 22:25:48.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/3VlRI0BuMMRgf0VU+6tHl0edUyBOLgPstJWFnqFc4F+XbyDXK0Nt9IiLkqCv55COyIwDeOjBT0VkelfJUvLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xNDAy
MTQwMjg4OCBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMzAuMDUNCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Um9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3dhLmMgfCAyMSArKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMg
aW5kZXgNCj4gZjBjNDJiZTA2MjE0NjgzN2U2YmE0MDYyMWFmNTRmY2FmYTM0ZjhlOC4uNWQ3MWNi
OWRjYTUxMzgwMzI3NGVjMQ0KPiBkNWI3NjZjMmNiYjBjMzE5ODcgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93
YS5jDQo+IEBAIC0zNzYsNiArMzc2LDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2Vu
dHJ5X3NyIGVuZ2luZV93YXNbXSA9IHsNCj4gIAkJCSAgICAgUFBIV1NQX0NTQl9BTkRfVElNRVNU
QU1QX1JFUE9SVF9ESVMsDQo+ICAJCQkgICAgIFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFT
RSkpKQ0KPiAgCX0sDQo+ICsJeyBYRV9SVFBfTkFNRSgiMTQwMjE0MDI4ODgiKSwNCj4gKwkgIFhF
X1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDMwMDUpLA0KPiBFTkdJTkVf
Q0xBU1MoUkVOREVSKSksDQoNClRoZSBydWxlIGlzIGNoYW5nZWQgZnJvbSAiIHhlX3J0cF9tYXRj
aF9maXJzdF9yZW5kZXJfb3JfY29tcHV0ZSIgdG8gIiBFTkdJTkVfQ0xBU1MoUkVOREVSKSIgZm9y
IA0KZ3JhcGhpY3MgdmVyc2lvbiAzMDAwIHRvIDMwMDUuDQpJdCBzaG91bGQgaGF2ZSB0aGUgc2Ft
ZSByZXN1bHQsIGFzIHRoZXNlIGdyYXBoaWNzIHZlcnNpb24gYWxsIGhhdmUgUkNTMC4NCg0KTEdU
TS4NClJldmlld2VkLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4g
DQoNCj4gKwkgIFhFX1JUUF9BQ1RJT05TKFNFVChIQUxGX1NMSUNFX0NISUNLRU43LA0KPiBDTEVB
Ul9PUFRJTUlaQVRJT05fRElTQUJMRSkpDQo+ICsJfSwNCj4gDQo+ICAJLyogVEdMICovDQo+IA0K
PiBAQCAtNTIyLDEwICs1MjYsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9z
ciBlbmdpbmVfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTigy
MDA0KSwNCj4gRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVuZGVyX29yX2NvbXB1dGUpKSwNCj4g
IAkgIFhFX1JUUF9BQ1RJT05TKFNFVChURExfVFNMX0NISUNLRU4sIFNMTV9XTVRQX1JFU1RPUkUp
KQ0KPiAgCX0sDQo+IC0JeyBYRV9SVFBfTkFNRSgiMTQwMjE0MDI4ODgiKSwNCj4gLQkgIFhFX1JU
UF9SVUxFUyhHUkFQSElDU19WRVJTSU9OKDIwMDQpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVSKSks
DQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQoSEFMRl9TTElDRV9DSElDS0VONywNCj4gQ0xFQVJf
T1BUSU1JWkFUSU9OX0RJU0FCTEUpKQ0KPiAtCX0sDQo+ICAJeyBYRV9SVFBfTkFNRSgiMTMwMTI2
MTU4NjQiKSwNCj4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OKDIwMDQpLA0KPiAg
CQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVuZGVyX29yX2NvbXB1dGUpKSwNCj4g
QEAgLTU1MCwxMCArNTUwLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBfZW50cnlfc3Ig
ZW5naW5lX3dhc1tdID0gew0KPiAgCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVu
ZGVyX29yX2NvbXB1dGUpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChMU0NfQ0hJQ0tFTl9C
SVRfMCwNCj4gV1JfUkVRX0NIQUlOSU5HX0RJUykpDQo+ICAJfSwNCj4gLQl7IFhFX1JUUF9OQU1F
KCIxNDAyMTQwMjg4OCIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFO
R0UoMjAwMSwgMjAwMiksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gLQkgIFhFX1JUUF9B
Q1RJT05TKFNFVChIQUxGX1NMSUNFX0NISUNLRU43LA0KPiBDTEVBUl9PUFRJTUlaQVRJT05fRElT
QUJMRSkpDQo+IC0JfSwNCj4gIAl7IFhFX1JUUF9OQU1FKCIxNDAyMTgyMTg3NCwgMTQwMjI5NTQy
NTAiKSwNCj4gIAkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDIw
MDIpLA0KPiAgCQkgICAgICAgRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVuZGVyX29yX2NvbXB1
dGUpKSwNCj4gQEAgLTU3MywxMSArNTY5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9ydHBf
ZW50cnlfc3IgZW5naW5lX3dhc1tdID0gew0KPiANCj4gIAkvKiBYZTNfTFBHICovDQo+IA0KPiAt
CXsgWEVfUlRQX05BTUUoIjE0MDIxNDAyODg4IiksDQo+IC0JICBYRV9SVFBfUlVMRVMoR1JBUEhJ
Q1NfVkVSU0lPTl9SQU5HRSgzMDAwLCAzMDAxKSwNCj4gLQkJICAgICAgIEZVTkMoeGVfcnRwX21h
dGNoX2ZpcnN0X3JlbmRlcl9vcl9jb21wdXRlKSksDQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQo
SEFMRl9TTElDRV9DSElDS0VONywNCj4gQ0xFQVJfT1BUSU1JWkFUSU9OX0RJU0FCTEUpKQ0KPiAt
CX0sDQo+ICAJeyBYRV9SVFBfTkFNRSgiMTgwMzQ4OTY1MzUiKSwNCj4gIAkgIFhFX1JUUF9SVUxF
UyhHUkFQSElDU19WRVJTSU9OKDMwMDApLCBHUkFQSElDU19TVEVQKEEwLA0KPiBCMCksDQo+ICAJ
CSAgICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29tcHV0ZSkpLA0KPiBA
QCAtNjA4LDEwICs1OTksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRyeV9zciBl
bmdpbmVfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfQUNUSU9OUyhTRVQoUklOR19QU01JX0NUTCgw
KSwNCj4gUkNfU0VNQV9JRExFX01TR19ESVNBQkxFLA0KPiAgCQkJICAgICBYRV9SVFBfQUNUSU9O
X0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4gIAl9LA0KPiAtCXsgWEVfUlRQX05BTUUoIjE0MDIxNDAy
ODg4IiksDQo+IC0JICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgzMDAzLCAz
MDA1KSwNCj4gRlVOQyh4ZV9ydHBfbWF0Y2hfZmlyc3RfcmVuZGVyX29yX2NvbXB1dGUpKSwNCj4g
LQkgIFhFX1JUUF9BQ1RJT05TKFNFVChIQUxGX1NMSUNFX0NISUNLRU43LA0KPiBDTEVBUl9PUFRJ
TUlaQVRJT05fRElTQUJMRSkpDQo+IC0JfSwNCj4gIAl7IFhFX1JUUF9OQU1FKCIxODA0MTM0NDIy
MiIpLA0KPiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT04oMzAwMCksDQo+ICAJCSAg
ICAgICBGVU5DKHhlX3J0cF9tYXRjaF9maXJzdF9yZW5kZXJfb3JfY29tcHV0ZSksDQo+IA0KPiAt
LQ0KPiAyLjUzLjANCg0K
