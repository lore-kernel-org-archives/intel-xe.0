Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C91CF6BE3
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 00:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8F010E41A;
	Wed,  7 Jan 2026 00:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2aYFDGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291D810E41A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 00:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767746959; x=1799282959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YirZLOZJRNwkzNyY65wTX/FLGtP+e8ayezzCabXZz/o=;
 b=N2aYFDGDYawik2moYtduipawvkyEftQ0Ov+qQhxbW8wLwVKbwPJU6Gh3
 IH7GCj4KiinYEB49t3XrK9PyfjRdO03xemEAEM8mhkH2S/ZUBLYF0Rbxm
 esTsSephv6e09h7zwYoBGFiXCLY3k6uRt3xWcgb2IJG22dTVFf3kMpLug
 CvXrUHTx3k5sBkH6Tw3mgs8NNwQZhxTj2mZXfBfNjtRukr/JDv6MqYpYq
 tXSyplsvcgf26MfOFJ1ftWWZaKS1drUCW6wramYlxTHg4j3Ej0hllYqe2
 JVmqswqzeXn+ncNZG9zh+6GLSfa/zOQxDPLo9Otqb/63svv53IRLGt5WH A==;
X-CSE-ConnectionGUID: BhJJzyYoS/Kq2c91GR2BQw==
X-CSE-MsgGUID: UWkXEKYTQkixdZ4oA6OAbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69192542"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69192542"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:49:19 -0800
X-CSE-ConnectionGUID: xl8N7hlzSqCqvqHq9KCJgQ==
X-CSE-MsgGUID: 8ul768ykQ02K4EA3JNrlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="201922613"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:49:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 16:49:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 16:49:18 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 16:49:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOnkzQyvkh5UIt88bo+7/OQXTC/DqNm3vDEx/4yj3MHzN+SAqmgDvJP5T2i/6v3jw2ealNmNPH7jWOtH6JaH2aHsdbcV17EULWA56/gCu4T6aGiHd20UJvkarL0rt7cq2guPRG0Pz3hZ8uMaGt1VDmT3sLcwYQybzH7F4Y+JGOf9pw7TK+SrEvKiJmlw4Ya1ON7VCfJnvBSL9VqcStO4/YfMpxKfaT5XFjkroW/leDNX3HxwZpt4QccpHTJl4nX1oWPnbeV00IaQ+Cxv3w0PW8ETSwN7INvOmIOibiTVElRG3luxz+snz35fb0w9mXGCgZBjceW2niDuovAvrNzIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YirZLOZJRNwkzNyY65wTX/FLGtP+e8ayezzCabXZz/o=;
 b=B26oQk0CNo8SSpWoaeUNanpEymUlPfVEpMF0CIDJpu36thgxjgWUxgKbgmcRHT0PIsCbzlrAykSmIb+4CXFrZixkg4qyz55ts5AUiosQjVwj+chLr8ntoaHziRgLsygBojezBwOCFKLzTQ0eeAa696mgJ8AFM0oA7xZQaS3+YYD6GWnPsLvvq25sIaNAai8ixO+lzvJkIKaKFrp2i8ncgNKa2+XqfvaZ71axXy6XmvCAlDiDKrXQwL31jCfgOseQ5wTGsWYXRvQlszYkw1DnsFHwfVdsLfhRcJqfLpu1J2Q0O8zYmpzcZGngZtoJB4q6xMROMVIb4dR6N4fBAQ/Vgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ5PPFF330187AB.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::860)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:49:11 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:49:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Saurabhg" <saurabhg.gupta@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>
Subject: Re: [PATCH v3] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Thread-Topic: [PATCH v3] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Thread-Index: AQHcf07Wj84xdLdnPka6tNxok99P1LVFxEWAgAAArICAABeZgIAAA7QA
Date: Wed, 7 Jan 2026 00:49:10 +0000
Message-ID: <774791a14c5501ecbb5f2e9434d208cc1d661c51.camel@intel.com>
References: <20260106205533.60180-2-jonathan.cavitt@intel.com>
 <aV2WDZ0uaMW6TYmE@lstrano-desk.jf.intel.com>
 <9e8fd19f0297426bde379e01a8a9ad3f109de12d.camel@intel.com>
 <aV2qaVmFEaW8IVIs@lstrano-desk.jf.intel.com>
In-Reply-To: <aV2qaVmFEaW8IVIs@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ5PPFF330187AB:EE_
x-ms-office365-filtering-correlation-id: 0d47ea7f-845c-4d23-f4d9-08de4d869246
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M0VFUnNocWdVMlN0RUw3djkxbjRDelc3clM5UXJ5cFV6SGJpNTBmS0FEM1Fy?=
 =?utf-8?B?aWhXMmZlb21VRUV3MmV4c1NJRzFHQnhKMTluZElpSUdxVERLTEtlbzRkMkFZ?=
 =?utf-8?B?TnU1ZDZLdUJHNXM4TWF6MHoycHFrREZRaU1TeDV1UDZEbkh5dkZISCtZcGJT?=
 =?utf-8?B?MVE3cVhEQW0xNzZVbDBCamkzWjhmTU1xNjZ4L0l0Nzc1aUJKeUdWcEJqVDV6?=
 =?utf-8?B?QmZROW1sMmQ1RUloejB6Q0lGaGhRQ2s5d1Z1NCtjWHYwTy9mNVp2RmVDSlFU?=
 =?utf-8?B?TUsyWE1kK0t2SGMvc1BvdHFtQ3dFVVl5RHFrdTlwcDFaQm9pVTByZ1B0a0JJ?=
 =?utf-8?B?TUxueU93K3ZEbE11b0paTGpwaytsUGpuMjJqT05ZSmdRTGVBRDQ2aEtPZGxj?=
 =?utf-8?B?SVpxV1lOcll5bytoYk9SRzV3KzRYbmVHcVh0TVAzNWdoRERZZTcwWFhCME9w?=
 =?utf-8?B?Y053TTd0dFNUTGd1RmJjcThLeE56SmdwRElpZFp0OGdtQ0lXTHRVTHpWK2Yv?=
 =?utf-8?B?U2RzazFZQUdEcE1tSmRhRUlma3MyWWhIRENoMlJHWU15MEc3b3NtYm52ckVy?=
 =?utf-8?B?V2hhSUlIQ2xvc0l6NDVaZ1NTeDNlSGp2UXFjdGh4NDc4N0FPazlXUXNyWGtS?=
 =?utf-8?B?dy9uSmc1VHl4Y1poLzZsR3lydjE5T2lzNHRhd1dtTkNkMjVNNXIwN2FCWm1J?=
 =?utf-8?B?Tm5pMFczZDZNVVNJdEVYZml1VWhXT3ZXTzlkNXJmTEI1cGordDZyRFMvMXYx?=
 =?utf-8?B?MDljb29oNHJmSXZwaCtrdUVqcTMzNUlhLysvekxWUGJqSFBIWmpnRjBpalZ6?=
 =?utf-8?B?bDRKaGVsQnhCQ1RZR042dkxTM2V2UWFaVTBCcDVNZldJaG5qMm9PM0NTcnda?=
 =?utf-8?B?dUtGMU05c2RKK1ZnbFpscUNObUFmQkVhZGg0NlJkcGExVlM2eExuaHpjNzd2?=
 =?utf-8?B?N3gvS1NvWUZSU21FZWFKQXNwRURHVGFBb0tscDV4SEM2dkQ4UlNPTjhSWFlC?=
 =?utf-8?B?OGtNb3UrSmVXR01mWnExdDNMWUlQMDVFSUk5eEJ6ZVJFbzJKV3k1YzdoSTRu?=
 =?utf-8?B?Njd5aEJKdzR3NzVsSzdrbkhrdVE1ZEllVHBqZ3p1VG5XampidXdHdjJGbmVa?=
 =?utf-8?B?cVpsS2ZraU5XZ21hV285L0ZBZ3c1WHBrOElJNjNvU3d2STJYR25jRXVDTHhZ?=
 =?utf-8?B?clFLbFROWldtNHNhVnBhT1NyU2JDN3g5NXdCKzcwWlZvQm1KbC9UV202akt5?=
 =?utf-8?B?NU5rVG9LSVRJK0o1RWFWd0Q3QUlDSTA4TlM5VC95ZklJTTl3OW9EQVVEbU5C?=
 =?utf-8?B?clB4VVlXN25tcXNhU2czUDhFWmpQL1lWRC9EUmN3TllpdUtEL1hpaCtROTBs?=
 =?utf-8?B?ZUNzbFhNM0dWcVNuWjVBWGdTNFdHNEhIdVQ4aEt4M200UkY4SWFWZGRPeDkv?=
 =?utf-8?B?RWt1d3hkYnR6UkNsZGJDeTlCdFZVSStibGhEcmV3akcvS2RvaEhoZzZoMm9B?=
 =?utf-8?B?K1c4WG85dy9ML2MwMFFqdmkrN3JJTVRaV1hHTnNRak9lZ0RxVHBsOTk3YVBO?=
 =?utf-8?B?ZTZDeHEzcXpzLytZbkFGRzdIVWRsMzR4dG82SXpVMFp3T2x4RGcrMkM0WWNR?=
 =?utf-8?B?bHgxM0cxckQwa0xKekkzRlBvRWdSdklXTU11QTF5YVJDOVFYKzUrOHpPRzlH?=
 =?utf-8?B?ZUJUdTNuVktSUU1VSWR2ZDdBQzk5WXhjUllzM1ZxSlFiNHdId2p1RVNoQVBC?=
 =?utf-8?B?dEhlUU03eEZVYTFJcktTOFNDUWprM1pZdmVONVJHNUVJUTJTREhEQkpibko5?=
 =?utf-8?B?YVhlUUFRVXJST3B6STJpclo3QXM5VWNjcTBJQS9ITDhmSGNTbllnY1ZjSlRF?=
 =?utf-8?B?SVI4YnZmdWJ6VzFRSEFnak5pL0NBTnJIcW5lcWpvZm12aHl5U01sMVA0UWw3?=
 =?utf-8?B?V3dnUXl2WkJvR3Y2WDczQzY2OWxueWlkdmN2Z3JDU3p1Z2x1MDYwSUdwbXF5?=
 =?utf-8?B?NFNrTmFVek44b3dqZWNnelhZVTRKYmZHVndlbFRjMzRnd040Wm1zSHZBdmtE?=
 =?utf-8?Q?79VERG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnVDdzcwQWhtRlZVbi9Vay92VEk3cG55TnVabjc4YmVtclRvY0RyQkFhSElT?=
 =?utf-8?B?azlxNlBXZVdqU3ViLzJNZW4vN0tsengyOHozc0tJTUFOVkJNU2swNWNNZTVx?=
 =?utf-8?B?cnZxaUppVUxwL2V4M0ZzNnJwclRGQzhyazlIQ1lCUklMZDM5UkRxNjMwNjVy?=
 =?utf-8?B?dW05V1M4WjVJWkdieWg1eEd4cVNnR2hSUkR1bW83Rk01RnFob1NmOU1TRjBU?=
 =?utf-8?B?TjFHZ0FwSlF1emxueWRNOVpLMkZCTGRlYUdQcDkweklhSVhXUG5kYWdLZUpZ?=
 =?utf-8?B?b0VJa3hZM1ZsTGhnWHJXLzlsYk9tbFdPTlFVbCtMbFFIZ3JiQzBSTThVUGtu?=
 =?utf-8?B?NjFocy9XLzNMYm9rMnpPL21vcHJlT1ljc2xLWm9EZllkRDZkSnIrOXc3QXFE?=
 =?utf-8?B?ZkRuQ2VrMjByYjV3ZmViZXhBSTBKb2VmdUJ4bnlKcmpvOHlxUzFoZEhwMnlD?=
 =?utf-8?B?b0l0ek10dkJVTTlBY3hZUnlmQzFPZnU5c1d5Qjh2YWJWdmJpVGxOR1kzdExh?=
 =?utf-8?B?TmlTb2t2S1QyMjlPcTRMK2k2VkQyRmd2bjN2N05TNzVRMWdQdXdjenVWYmZH?=
 =?utf-8?B?NHdkR0RCTjg0aVIwb2dNMnZVbHU4Y3I5OUcraFo0SXduZGFNMnNvZ3ZLc3du?=
 =?utf-8?B?aXpmWi82bWVGY09uMnN5M1VqcjFFWWFod1JJRnNscDhNWDNldEhOK0x5NS8w?=
 =?utf-8?B?aWFqNFllb2VadzdWR1JHVDBhbVgyM0Y0a2oybEpoL1BNS3AxR3J1NVJxS2oz?=
 =?utf-8?B?RUNDZE5TTXlQdEtKMVpxY2VCZTZhNitOVFR6NHlPK3NaK3lhd1dzZFJHbXdV?=
 =?utf-8?B?OVg5U3JhSUltUGplaHFBY0NGaHFjZk9vMkJFRVAvUU4xSUdtSE5Bb1RxdzZM?=
 =?utf-8?B?NjBGcVA3UmxnV3A5Ky9qYURtNjQ0dTZqaXkxTDFlbUUvQmtTcTVvME5JalNF?=
 =?utf-8?B?WlNDaVlEczdsNHhOdmN5bDllRVRTTVRpcDNWM2hNYU1VOTFvajVJTEVLL3po?=
 =?utf-8?B?UjZROERnRC92MS9kOGhZWTFkZVJtblZ6b0JpOUFGWk1FcXVFaGpYazEwMDQ0?=
 =?utf-8?B?ZjU3L3M3cnRMTzZhUjhoVFZOaVlHTFcwYktXRjJPU1Z6TVJ4dmJwYmt0K0NC?=
 =?utf-8?B?UlBpYXpqZ2FLL2p4TEkvMnpkYWhJZFJGNEhqN0tiaWgyWnAwTHhkU0Y5dWFG?=
 =?utf-8?B?VmFmWjY4U0V5c1hmMHlJTUdBUVlBQVoxUDRXZWNCM0pDSnZtblhBWmdUamI5?=
 =?utf-8?B?cURzTE53Y1hoaFhBSXVEdTVLUHJQNWtnaXRTWHFmRjRpV0Fyd3VKQ3MwV2Fj?=
 =?utf-8?B?SXd4NGV5RGJqZFU2cFFuMVBadDNYeXN5cFRsYWlteTB5SkMrSHljTGlDcXZz?=
 =?utf-8?B?WitaTUxHVVZvdXZBTXhDc3BadWU1VnIzczY2K3ZrMEZHdlZ0NTBzd1lrOWtJ?=
 =?utf-8?B?UnZxcEFNMzQ2ck5rckNyUXE2YmRsNDNmS3k2VUVTRDFxTGpmcGlpY3pGNEpW?=
 =?utf-8?B?cWZCQmRxSkF5RjBjcUpUQ2poRVl2MTViZ2RhZ2VCRUd3bSsrV3BERDFTTWtv?=
 =?utf-8?B?elYvNXFMRHdIMXNEVnhDRlNhM2I4UnFQV25mWW5wZ2ZUTW5DUXdYY0FubElj?=
 =?utf-8?B?T2haQzF1ZlAvU1FHZEZWY2sydzZyQzBVWlppV0NtWEd0ajJpSG9WN1Y1bkdi?=
 =?utf-8?B?RFUzeXVaS1JReU5HRkkwV0M4bGhKTGJabzA1M2tXVGNDbDl0WDlIdHVFN0Jx?=
 =?utf-8?B?YVpGRTR6U1NPQlJqRXh5S01zc29ZYUJMS1BvTVpNZzhJcEZ4VDl3YXhXbHZl?=
 =?utf-8?B?ZFBvUlVlU1lwS0dxMFB1UTQ5MFZpNVVnK1YvZEF4c0pBWTR5NWJTcUJOSVZG?=
 =?utf-8?B?UU5LOTlKbXpmMjNUblpFK01jR04vUmxFRXpkc0RZRWpFV2pFcmxuVEg2eU5T?=
 =?utf-8?B?eFFhTFhNc0RFeXNNREVkODljcGcxM2c3ekZaV2VXRmhMdmxyQlprWVJJQm0r?=
 =?utf-8?B?R2V1ZnJwazFUNm8zTGk0UFVZRG8vREowWTd2YU03UDl4Um5YSWZ0VU04ZFZh?=
 =?utf-8?B?Z1VPcTlka2JVbHN6VG5nNFFObWZMeUNpd3pXaWN2bHVIUlRNZFVxS3A5WHBO?=
 =?utf-8?B?Q2NsZ2VVMjN5SzZYalBtaERxMFR4UlpzaHlNdVFzUmhQZEVMdGJBTitzWUVL?=
 =?utf-8?B?c25xbmg5R01qYkJOcWR6ZDVkNUtYVjhzaDZnTmlFdDhib2Z2QlNxMC81SmxB?=
 =?utf-8?B?UDJCaWFhNE5HUm9TM2JrQW85NFhsWGJpM1VrS0pKVVd0QmZ2S2R2VXI3OWpa?=
 =?utf-8?B?RmFXU3JTOEVXYzZjNWRmY2pLMkhXZk03YkdMSFBHKzdLb1ZyVnA4WFZFNjBW?=
 =?utf-8?Q?8UJJ6V5jwSd4b5HE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84EE0272F57EBD40B4B247DD89426195@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d47ea7f-845c-4d23-f4d9-08de4d869246
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 00:49:10.8124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UR+L10GRvCPQ4R+KIeAD+l5mqnCnDsi6dXDBxzHtyJlc+SonpRDSiqwO5lV5/YEJinmy0r6KmEBz9bVuCJQlk3w6bys1sUrNMLm5x+RjDsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF330187AB
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

T24gVHVlLCAyMDI2LTAxLTA2IGF0IDE2OjM1IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAwNiwgMjAyNiBhdCAwNDoxMToyN1BNIC0wNzAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI2LTAxLTA2IGF0IDE1OjA5IC0wODAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gVHVlLCBKYW4gMDYsIDIwMjYgYXQgMDg6NTU6MzRQTSAr
MDAwMCwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+ID4gPiBJdCdzIHBvc3NpYmxlIGlmIHVu
bGlrZWx5IHRoYXQgdGhlIEd1QyBjb3VsZCBiZSByZXNldCBpbiB0aGUNCj4gPiA+ID4gdGltZQ0K
PiA+ID4gPiBiZXR3ZWVuIHBlcmZvcm1pbmcgYSBndWNfY3Rfc2VuZCBhbmQgdGhlIEcySCBmZW5j
ZSBjb21wbGV0aW5nDQo+ID4gPiA+IGluDQo+ID4gPiA+IGd1Y19jdF9zZW5kX3JlY3YuwqAgRXhp
dCBlYXJseSBpZiB0aGlzIGlzIG9jY3Vycy4NCj4gPiA+ID4gDQo+ID4gPiA+IHYyOiBSZWJhc2UN
Cj4gPiA+ID4gDQo+ID4gPiA+IHYzOiBnb3RvIHJldHJ5X3NhbWVfZmVuY2UgaWYgY3QgaXMgbm90
IGFsaXZlIChTdHVhcnQpDQo+ID4gPiA+IA0KPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IFN0dWFydCBT
dW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiA+ID4gLS0t
DQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jIHwgMTQgKysrKysrKysr
LS0tLS0NCj4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfY3QuYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0K
PiA+ID4gPiBpbmRleCBkZmJmNzYwMzdiMDQuLjBiZGNiZTY1MDNhNyAxMDA2NDQNCj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+ID4gPiBAQCAtMTIzOCw2ICsxMjM4LDEwIEBA
IGludCB4ZV9ndWNfY3Rfc2VuZF9nMmhfaGFuZGxlcihzdHJ1Y3QNCj4gPiA+ID4geGVfZ3VjX2N0
ICpjdCwgY29uc3QgdTMyICphY3Rpb24sIHUzMiBsZW4pDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gcmV0Ow0KPiA+ID4gPiDCoH0NCj4gPiA+ID4gwqANCj4gPiA+ID4gKyNkZWZpbmUg
Y3RfYWxpdmUoY3QpwqDCoMKgIFwNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgKHhlX2d1Y19jdF9l
bmFibGVkKGN0KSAmJiAhY3QtPmN0YnMuaDJnLmluZm8uYnJva2VuICYmDQo+ID4gPiA+IFwNCj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgICFjdC0+Y3Ricy5nMmguaW5mby5icm9rZW4pDQo+ID4gPiA+
ICsNCj4gPiA+ID4gwqAvKg0KPiA+ID4gPiDCoCAqIENoZWNrIGlmIGEgR1QgcmVzZXQgaXMgaW4g
cHJvZ3Jlc3Mgb3Igd2lsbCBvY2N1ciBhbmQgaWYgR1QNCj4gPiA+ID4gcmVzZXQgYnJvdWdodCB0
aGUNCj4gPiA+ID4gwqAgKiBDVCBiYWNrIHVwLiBSYW5kb21seSBwaWNraW5nIDUgc2Vjb25kcyBm
b3IgYW4gdXBwZXIgbGltaXQNCj4gPiA+ID4gdG8gZG8NCj4gPiA+ID4gYSBHVCBhIHJlc2V0Lg0K
PiA+ID4gPiBAQCAtMTI0NywxMiArMTI1MSw4IEBAIHN0YXRpYyBib29sIHJldHJ5X2ZhaWx1cmUo
c3RydWN0DQo+ID4gPiA+IHhlX2d1Y19jdA0KPiA+ID4gPiAqY3QsIGludCByZXQpDQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoIShyZXQgPT0gLUVERUFETEsgfHwgcmV0ID09IC1FUElQRSB8
fCByZXQgPT0gLQ0KPiA+ID4gPiBFTk9ERVYpKQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4gPiA+ID4gwqANCj4gPiA+ID4gLSNkZWZpbmUg
Y3RfYWxpdmUoY3QpwqDCoMKgXA0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAoeGVfZ3VjX2N0X2Vu
YWJsZWQoY3QpICYmICFjdC0+Y3Ricy5oMmcuaW5mby5icm9rZW4gJiYNCj4gPiA+ID4gXA0KPiA+
ID4gPiAtwqDCoMKgwqDCoMKgwqAgIWN0LT5jdGJzLmcyaC5pbmZvLmJyb2tlbikNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoGlmICghd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoY3Qt
PndxLA0KPiA+ID4gPiBjdF9hbGl2ZShjdCksDQo+ID4gPiA+IEhaICogNSkpDQo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiA+ID4gPiAtI3Vu
ZGVmIGN0X2FsaXZlDQo+ID4gPiA+IMKgDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
dHJ1ZTsNCj4gPiA+ID4gwqB9DQo+ID4gPiA+IEBAIC0xMzA0LDcgKzEzMDQsMTEgQEAgc3RhdGlj
IGludCBndWNfY3Rfc2VuZF9yZWN2KHN0cnVjdA0KPiA+ID4gPiB4ZV9ndWNfY3QNCj4gPiA+ID4g
KmN0LCBjb25zdCB1MzIgKmFjdGlvbiwgdTMyIGxlbiwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oC8qIFJFQURfT05DRXMgcGFpcnMgd2l0aCBXUklURV9PTkNFcyBpbg0KPiA+ID4gPiBwYXJzZV9n
MmhfcmVzcG9uc2UNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIGFuZCBnMmhfZmVuY2VfY2Fu
Y2VsLg0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICovDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDC
oHJldCA9IHdhaXRfZXZlbnRfdGltZW91dChjdC0+ZzJoX2ZlbmNlX3dxLA0KPiA+ID4gPiBSRUFE
X09OQ0UoZzJoX2ZlbmNlLmRvbmUpLCBIWik7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldCA9
IHdhaXRfZXZlbnRfdGltZW91dChjdC0+ZzJoX2ZlbmNlX3dxLA0KPiA+ID4gPiAhY3RfYWxpdmUo
Y3QpIHx8DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSRUFEX09OQ0UoZzJoX2ZlbmNlLmRvbmUpLA0KPiA+ID4g
PiBIWik7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghY3RfYWxpdmUoY3QpKQ0KPiA+ID4g
DQo+ID4gPiBJIHRoaW5rIHlvdSBvbmx5IHdhbnQgdG8gZG8gdGhpcyBpZiBub19mYWlsIGlzIHNl
dCwgYnV0IGFnYWluDQo+ID4gPiB0aGF0IGlzDQo+ID4gPiBkZWFkIGNvZGUgYW5kIGxpa2VseSBk
b2Vzbid0IGV2ZW4gd29yayBhcyBpcy4gSSBkb24ndCBoYW5kbGUgdGhlDQo+ID4gPiBkZXZpY2UN
Cj4gPiA+IHdlZGdpbmcgbm9yIGRvZXMgdGhpcyBwYXRjaCwgc28gZWl0aGVyIGNhc2UgY291bGQg
bGl2ZSBsb2NrLg0KPiA+IA0KPiA+IFNvIGlzIHRoZSBzdWdnZXN0aW9uIHRvIGp1c3QgYmFpbCBv
dXQgaWYgd2UncmUgaW4gcmVzZXQgaGVyZT8gV2UNCj4gPiBjb3VsZA0KPiANCj4gV2UgYWxyZWFk
eSBkby4gZ3VjX2N0X2NoYW5nZV9zdGF0ZSB3aWxsIHNldCBnMmhfZmVuY2UuZG9uZS4NCg0KQWgg
b2sgbWFrZXMgc2Vuc2UgSSBzZWUgdGhhdC4gVGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQuDQoN
Cj4gDQo+ID4gYWxzbyB0ZWFyIGV2ZXJ5dGhpbmcgZG93biBsaWtlIHdlIGRvIGluIHRoZSAhcmV0
IGNhbGwgbGF0ZXIuIE9yIHdlDQo+ID4gY291bGQgYWRkIGEgcmV0cnkgY291bnQgaGVyZSBzbyB3
ZSBhdCBsZWFzdCBhcmVuJ3Qgc3R1Y2sgbG9vcGluZw0KPiA+IGhlcmUNCj4gPiBmb3JldmVyLg0K
PiA+IA0KPiANCj4gSSdzIHNheSBsZWF2ZSBpdCBhcyBpcyBvciBmaXggdGhlIG5vIGZhaWwgZnVu
Y3Rpb24gdmVyc2lvbiBhbmQgdXNlIGluDQo+IHBvc3NpYmxlIHBsYWNlcyB3ZSBjYXJlIGFib3V0
IHRoaXMgKGUuZy4gY2hhbmdpbmcgR3VDIFBDIGZyZXEgLSB0aG9zZQ0KPiByZWFsbHkgc2hvdWxk
bid0IGdldCBsb3N0IGFjcm9zcyBhIEdUIHJlc2V0IG9yIFZGIG1pZ3JhdGlvbikuDQoNCkJ1dCBp
dCBkb2Vzbid0IGxvb2sgbGlrZSB3ZSB1c2UgdGhhdCBhbnl3aGVyZSBub3cuLi4NCg0KSm9uYXRo
YW4sIEkgYWdyZWUgd2l0aCB3aGF0IE1hdHQgaGFzIGhlcmUuIFdlIGNhbiBlaXRoZXIganVzdCBk
cm9wIHRoaXMNCm9yIGFkZCBhIG5vX2ZhaWwgY2hlY2sgaGVyZSwgYWx0aG91Z2ggdGhlcmUgd29u
J3QgYmUgYW55IHRlc3Rpbmcgb2YNCnRoYXQgY29kZSB0b2RheSBhcyBtZW50aW9uZWQuDQoNClRo
YW5rcywNClN0dWFydA0KDQo+IA0KPiBNYXR0DQo+IA0KPiA+IFRoYW5rcywNCj4gPiBTdHVhcnQN
Cj4gPiANCj4gPiA+IA0KPiA+ID4gTWF0dA0KPiA+ID4gDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnb3RvIHJldHJ5X3NhbWVfZmVuY2U7DQo+ID4gPiA+ICsNCj4gPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghcmV0KSB7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgTE5MX0ZMVVNIX1dPUksoJmN0LT5nMmhfd29ya2VyKTsNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoUkVBRF9PTkNFKGcyaF9mZW5jZS5k
b25lKSkgew0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi40My4wDQo+ID4gPiA+IA0KPiA+IA0KDQo=
