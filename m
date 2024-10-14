Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA320CFC538
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 10:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D6510E29A;
	Mon, 14 Oct 2024 10:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amlNMkmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA4010E29A
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728901415; x=1760437415;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xsEMWhvZH4m5uWyd1hfMBf79km2MOCKNvSv8K7TqZUE=;
 b=amlNMkmnoDoiC7hFLpkT6fDUoXagFQvyli5GM/gx/FR3u9fjOPv43KaV
 9IsbBl72GniXRyQocnl3jDhLjgjYIcVrDNZe1ZpBl1flkT4of1DUUM0ht
 5pzC7n6gKrXYJPyknNLVZhhIEjOoIHMeD+KnG0bmKJ0NH9E7eNWXbXbCx
 XAaegmpIJo89C9dYhUSyCtmaHiRVr/5Uk51M7bDneJwO3629pcwKV9YwE
 Ua/7QLhGoitCWAdeVNQxJnVF77/OFFlDYoB8DdhBjIV9uB7fpya2z6ux5
 HTg/R/qvszK3U4nQT8FUDfFnUvxD+aN/5hGQiwvsDG0NI3pUkFh3vTrcS Q==;
X-CSE-ConnectionGUID: wHQfzZZKTzyPKRfTbjogqQ==
X-CSE-MsgGUID: qVALkDK3QeCU57A6hBuBpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28125555"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28125555"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 03:23:34 -0700
X-CSE-ConnectionGUID: loC0XFtIRSe2J8wrGvVssg==
X-CSE-MsgGUID: SDPtCSBPRKad9pMIl8aBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="108282086"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 03:23:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 03:23:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 03:23:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 03:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Odar4mDM/bsmyNS3caS1ICF2qjzfItx7LsjHJ4HlrYNwqAIZYFz+H68p8PDsaZN+NT9FmTZdHQx0aBaaUiAqJIKv4+m49txnJfHDxzrTg1CHYkq5ORibIDFlocbJEQJXqmmu3b7jtsYyiPAAN6T9NYUYsobUSYWsIaQM19pQi93pLf0PP7PGTRaf3eZ990Wi0Xfx2xm8F9aDjtNeSmAeyTTgfD1qvpBcPLup+BC1qKLMVcPgGrbbzhsJ43zvgC0sF0OSTRQO74SVM6vWKR8n8etGO2Akt8O0876URTGxm3sRdux+vBebW6meA8SNw/2jitlUmkWU3nM4ZSjR/Cb+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsEMWhvZH4m5uWyd1hfMBf79km2MOCKNvSv8K7TqZUE=;
 b=AFWqVUimM3ezFWY+6dF+cYemn5c3vHrlyBqo6Q3N7vYTaIm8Lah0rQ664cuNBjHmwdoHomFkLIoIM0nexaFS6RvAM0Nzg9pgpzpOpFyXXt2oGRbRTPqC5fHoisF0rcQnUWnICwwBTW6KjB9fvBWwcDOKVTFPgSjxFgJH0FOUPiKHgBg0Dt1DhtssQtHQfgW/3gtKwL2u33glkYefOrndMcGEKa8yYM4b314SaDoJp18Ize5HMzFE0TEgri3Hvh2ZSwxyfuy69xGV+vjN2e0FbWo06UqMlQuUyzWN2+NHcdtK/bH1SRneopn2765rf3RPMz7xRRliF+cwmu03Bap/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:23:25 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:23:24 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Topic: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Index: AQHbGjMg8Jp//ueXMEqEEybxX62qF7J+ccYAgAeabpA=
Date: Mon, 14 Oct 2024 10:23:24 +0000
Message-ID: <SJ1PR11MB6204E78CF08AFA14DA26E2A181442@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241009101004.664216-1-tejas.upadhyay@intel.com>
 <c55c17c9-9882-4124-918b-88b951469185@intel.com>
In-Reply-To: <c55c17c9-9882-4124-918b-88b951469185@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB8020:EE_
x-ms-office365-filtering-correlation-id: a7c17077-13a1-4381-de80-08dcec3a3c60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L1RiLzhlMEVMTmxxRlBENDZDVDdsZG85MUxZTGJZUjd5Z1JsaFNGaEFBYm1m?=
 =?utf-8?B?bi9PMms2cnRibmR4T1pSSUNvY1AyNEZUVmVMMkNIcEtvV1NKczBVaHd3Lyt0?=
 =?utf-8?B?Y1NXMmFPaGZlRDdLWnR0MUgxVjE5Q3EvbDdnWGlFNTlTNXgrUndoaUJmMFo3?=
 =?utf-8?B?VVVCWWRQV3poSUU3Zk9xWmkrbURVNHZNYStzbXFqMnVrU1NLSThmS2lwQjlW?=
 =?utf-8?B?RGNjSUg1Q1R3VVQxZzRTcHhad0R5bk0yTDZYQ3hJQTB4eVZRd3doL25vQVBK?=
 =?utf-8?B?QmZPWm1Odnk4QkxkMnUxcWhOVnk1MTM0aHU3RUlQWGVDQmRYazR2UWREbEti?=
 =?utf-8?B?dllsTzZGRDFTakFKdkMwZmlGclZMaGorRUpBbkY4ZE1DdkFxWHZ6U0ZZcUtL?=
 =?utf-8?B?OUlpQzczd3pVVzQ4N3JOUldiRFIzenIxcFEybnNyTUtuWldNUmJnL3kyaGhu?=
 =?utf-8?B?WEhOUURxRXNNOHBrNHBmbVdWVGdFRkc0aTE0a3VYbmoySVhKY3cwdmpqdHU3?=
 =?utf-8?B?ZG5Kc3FJT3lrbmxIdVExTTBsY1dWa2g3Y3gzOHo0TEpBUFovU3ZCb2ZwTHRh?=
 =?utf-8?B?czNUcld1dDhBOTJOeGN1MDVVU0JIRjU2bnV0dWNtM3RWMzNFQWVPajNhM0Ru?=
 =?utf-8?B?Q1ZFOXQ4NG1zcDBIbzBDRllDZUQzV1B4Y21NdEFUZHlsZkxpNFZreTZHQ3NB?=
 =?utf-8?B?TWczODY5ejY5RnhpYTRnd3pDbmdkZThKbnNnbmptc2xVUk1Cc0NwNGhGOXdM?=
 =?utf-8?B?M2NaU2l2RXUxZzV5OUlNN1U0STVvejFVUjJpRy9QWXdnL1JRMWY4Z2tENWNL?=
 =?utf-8?B?alJTd0g2emp1ZThFOURuaENOVFFyMnZ1ODZEUWhFVHpGQlN4SFZVTGN4QUdi?=
 =?utf-8?B?RG16K0dHQ1YvK2tqemxXazhYdXJIdmpReXk5aEFMNzB1MnVpZCtHUmV1N0Jl?=
 =?utf-8?B?S1BpMkNlWEdaMmVXbysyUEt0NCtCT3UxWG1XMXd5TGJYQnVzZFEzeHhVVkx1?=
 =?utf-8?B?cWlrb1Y2dzYzYmlFSU5ZeW5Gck83Y1lGUnJ0Z3NHcFdwNmU5RkpzVlVvNW8r?=
 =?utf-8?B?T0l6M2g3Yk5kNEpmOFNXblVrOTFDL1NNa1EwcE1FVGkxWEVVR1ZGUUgrVlBl?=
 =?utf-8?B?N1FWaHBTa3hjNVI4TE9QNENZSUM3ekJxM3A4TFhFTSs1eXVoSjh5WTZZRWdK?=
 =?utf-8?B?dWZxaURwTjJwejF5U2ZNdTdkbU1KQWtyNVNlUTRBakhJaVlKRVZDWVg0UzhH?=
 =?utf-8?B?c1dtaHZYZnV6bGkwWENPNFJaWWRTc2dacisvbzVSN3JCMnZ6TVJCODBrUnlZ?=
 =?utf-8?B?c2ZWeVZ1cTBlcUdGWmFTV2R2bFRpdVJEYW9ucU55RVNZWm1nZm1GWjI2Uk14?=
 =?utf-8?B?cEFxeXY4Vko2dFZ4aGhzbnA3cHI0OXZaS3VDVGVtVTlxd29jS0NXdEFXRTVB?=
 =?utf-8?B?VndPVWkxQzN3NTN3WHNGQTF5VmJkV1lKcEtpWW1DQ1pVckxmQkMxRkUwUmds?=
 =?utf-8?B?R3BSOGdKZDJSZUg3S0JyMENBNVdvUzc1WVRiOGJpZUlwS1dEbysrZ2l3WlNv?=
 =?utf-8?B?OXJNd05GMkFjYW5ramV3VmI5K3IvcytWUXlMS3hzTXE5VHZjUUY3cUo4bkpz?=
 =?utf-8?B?YjFYMTNKZHkySXZqaktiRWx1cjllZW9VSTRFRGdaa01hWDJHU0R0ZnFpdGt6?=
 =?utf-8?B?aStJVlJPeEVDNmNhamVmcVJ0aFBuT09mSWY0VmV5NWxGNnQ2Z1N0NkxnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEhmM0E5NkxOMzh3bmpiQUdyc2VJVlltbW5qZldrVXpyV0k5V3dweHZ3bUlh?=
 =?utf-8?B?VTZvb2MvdWJKNjlwaVVpTUNMVVZqR0pWajljVm9xRGtQSnI5U21BQzcvRWF0?=
 =?utf-8?B?b2s1M0U3SlFZdlplZ2NkVlV6U3JrUFdVRTVHZXpuT3ZjNXdJNkw2TU5Wb09U?=
 =?utf-8?B?QUlQZUpzbElSVkZXeWlDTGRsaEhrNGhkaVR1aEhyOThDMDdZTmtJODRkM1Bq?=
 =?utf-8?B?aktVSkkwOUJ2S08rVVA1TFdaL2hGbUVNQ2txOG00dWdzcTVmNHFOWnpKUGZH?=
 =?utf-8?B?NGhRamxka0JHL0VxT29XcTArM0V4M28vc1pBOEd3UFRPV2YxSWdHYnk5RitR?=
 =?utf-8?B?L1V3NUU2aW9hYUo2MWlubXBJR1B5bUxvcHRYRnVLNE1KKzNRM3ZmVnJwYWZy?=
 =?utf-8?B?Uk1sUUtHaWZBeVFiRDBCSHY0b20vNDdxaktFTlpDd1lZYXFkWlc4Wk5ISlVj?=
 =?utf-8?B?NnpoeUV2OElIblp3VGkyd3ExQkJRTmNLSkM2elNvNlpvV2ViZEpSMXdQVjhi?=
 =?utf-8?B?RUlUOFN6QWhpRk1UQXd1Q2U3R1pCeUhna0t6bnNNczM1T2FvSWN6NURYd1R5?=
 =?utf-8?B?OFkvOGd6NUlvL3FTV0ZQNXJ2K3MvV3hOL0I2K1Q3Mjd0VUduZUYxRUtIa0Fj?=
 =?utf-8?B?RU80SDFZNWZXbGM4RDIrOW9TdjlkT2h1Z0oxUmI2Y2ovRlIxNlE2SHF5ZmFP?=
 =?utf-8?B?TW9HOFFoWHY2bFNnQnJRLzJhM0ppeGZlSUxpY2QxUWY5WDFESmY5RnN1aXVt?=
 =?utf-8?B?RnUxU3pHNUMyV1ZMWGY3WG1WQWg4WDUzYVg3M3phNmFtVzk1enp0b0ZFcTky?=
 =?utf-8?B?Y01VWG8xSC9WaGY4bnkyMWRiNjIwQTNxL2hRZzFETUpOeFNROEFDaE5qZlZN?=
 =?utf-8?B?UW0zQndUaW9reFROeHJybnhYOXdMSVF3R0Q4T29zMFdqMUFEb2ZhdjJPdHRX?=
 =?utf-8?B?U1JYS05NemRidWVHTFR4OXJNYWpESFBjOXhPREx0YkoyN3VnWGI4QlhqZVFx?=
 =?utf-8?B?OEJ6ZmRzNXZiZE5FcDJvMEJKUUlpYVlONE1tVllEcGZjenB2bCtIckZ1Y3VG?=
 =?utf-8?B?SlFxcHpFTHZSTUhWV1FzekVNYXNKUTQ4TFdIZkNoR2s3ZEZleldWVDBjUnAy?=
 =?utf-8?B?VjFENWE3RU41NG5BNVpvWWtmS0t6ZWVaMFRJSk1PNjAxdmRPWjJEak5HYUZ6?=
 =?utf-8?B?cmQrQ0N3V0JocUZQYllzVkdJRGplWXBmbGlpa1N3SDJRRzVnZFBybzZpL2RD?=
 =?utf-8?B?MFZBZCtCVnBSak9SZjUycVlYdHBuYitHYmdBanhoVXVHK21NbkZnM2tXa1p0?=
 =?utf-8?B?Qk9UNFlQZFdldGZ1bFd0V1JHV2pwc3hwWWNwMmhGL3VmYnpESlRnRlkvT29Z?=
 =?utf-8?B?dHJLVEU2SVZMRnl6MWQwZWxFTTNLL09od0NEM1RKZzhHNm5CRFZPOXplcGxv?=
 =?utf-8?B?czJNMSt2OEc3Q0l5VDZaNkdLcnhrbFE0aXY5QjFJWXZJQWlhdmpDcGVCc2RX?=
 =?utf-8?B?MmNNbzJudk5kWWdtS3h1WkVzVFdwbXNQaWNjWWZMcEtjdTVYWDdDVVY1U05X?=
 =?utf-8?B?WWw3WkVNL3l3bmtXU3FMS0hYd1lWVlVhbkFnY2ZNWEo2UjhPOG9GRkVDVnd5?=
 =?utf-8?B?bUNtYW5PQmpMZENmL3ZEbkFacStqL2dyRVVyWW9PRisza0FrM29TTXZETFJk?=
 =?utf-8?B?VGVubkVVRWRNMDc5emh3a0Y0NnlrMlhmZDloWGtVN3NyeWNBWTZoK0MwSEdS?=
 =?utf-8?B?WmlxaE53dlVQNFJLcFpyNWZjZEorUE45c3VleWY0TkpjZkJ5WFBmRUdHRU1u?=
 =?utf-8?B?SmxvaExUSEFQd3JOOFVTQ0ZraW5HQXNaTnFnN3AzNkllenhpUnNiWG9pSXJ6?=
 =?utf-8?B?VzJJa0dDSEptdUtnazdDRWVrMmcwOHpVTmRoci9xSy9UdVA0MDc4aTg1QXMz?=
 =?utf-8?B?aFA3am5QQW5OSkdGSnkzbUd5VkZWRlkzWjJ5QW5ySmI5Yi8xS1dwY3ZOVnUr?=
 =?utf-8?B?ZmVQbnNhOVJVd1hxTWFRcFZVTTlzN1BIS1hZOGdsMlpXQWRqNzV4V2o5bWxw?=
 =?utf-8?B?OVlLL21jQWt0RGZMWDJWMVNIakxLZURPdmRPcVZZUm15eXdCR2RhNi9BbmZ2?=
 =?utf-8?Q?pirZciSFZ3aRwrJmd+wPn7A7N?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c17077-13a1-4381-de80-08dcec3a3c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 10:23:24.4608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rEpWmHClZ5IVWWnSXJUUdWC7+mT5H32reJNE4zUR2AeyURrCj3n8cofMp7NVyVAkJUMnCqgxVT0yA0it45/0MM4OvhXyNqcKSwWxpflGn8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDksIDIw
MjQgNzoyNyBQTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5j
b20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGRybS94ZS9tbWFwOiBBZGQgbW1hcCBzdXBwb3J0IGZvciBQQ0kgbWVtb3J5DQo+IGJh
cnJpZXINCj4gDQo+IEhpLA0KPiANCj4gT24gMDkvMTAvMjAyNCAxMToxMCwgVGVqYXMgVXBhZGh5
YXkgd3JvdGU6DQo+ID4gSW4gb3JkZXIgdG8gYXZvaWQgaGF2aW5nIHVzZXJzcGFjZSB0byB1c2Ug
TUlfTUVNX0ZFTkNFLCB3ZSBhcmUgYWRkaW5nDQo+ID4gYSBtZWNoYW5pc20gZm9yIHVzZXJzcGFj
ZSB0byBnZW5lcmF0ZSBhIFBDSSBtZW1vcnkgYmFycmllciB3aXRoIGxvdw0KPiA+IG92ZXJoZWFk
IChhdm9pZGluZyBJT0NUTCBjYWxsKS4NCj4gDQo+IEkgZ3Vlc3MgaXQgZG9lc24ndCB3b3JrIGlm
IHdlIGp1c3QgZG8gVlJBTSB3cml0ZSBmcm9tIHRoZSBob3N0IHNpZGU/DQoNCldyaXRpbmcgdG8g
VlJBTSB3aWxsIGFkZHMgc29tZSBvdmVyaGVhZCB3aGljaCBVTUQgd2FudHMgdG8gYXZvaWQuIFNv
IHRoZSBzdWdnZXN0aW9uIGNhbWUgb3V0IHdhcyB0byB1c2Ugc3BlY2lhbCBNTUlPIHBhZ2UgbWFw
cGVkIGRpcmVjdGx5IHdoaWNoIGlzIG5vdCBhY2Nlc3NpYmxlIGZyb20gdGhlIFBDSSBidXMgc28g
dGhhdCB0aGUgTU1JTyB3cml0ZXMgdGhlbXNlbHZlcyBhcmUgaWdub3JlZCwgYnV0IHRoZSBQQ0kg
bWVtb3J5IGJhcnJpZXIgd2lsbCBzdGlsbCB0YWtlIGFjdGlvbiBhcyB0aGUgTU1JTyBmaWx0ZXJp
bmcgd2lsbCBoYXBwZW4gYWZ0ZXIgdGhlIG1lbW9yeSBiYXJyaWVyIGVmZmVjdC4NCg0KPiANCj4g
Pg0KPiA+IFRoaXMgaXMgaW1wbGVtZW50ZWQgYnkgbWVtb3J5LW1hcHBpbmcgYSBwYWdlIGFzIHVu
Y2FjaGVkIHRoYXQgaXMNCj4gPiBiYWNrZWQgYnkgTU1JTyBvbiB0aGUgZEdQVSBhbmQgdGh1cyBh
bGxvd2luZyB1c2Vyc3BhY2UgdG8gZG8gbWVtb3J5DQo+ID4gd3JpdGUgdG8gdGhlIHBhZ2Ugd2l0
aG91dCBpbnZva2luZyBhbiBJT0NUTC4NCj4gPiBXZSBhcmUgc2VsZWN0aW5nIHRoZSBNTUlPIHNv
IHRoYXQgaXQgaXMgbm90IGFjY2Vzc2libGUgZnJvbSB0aGUgUENJDQo+ID4gYnVzIHNvIHRoYXQg
dGhlIE1NSU8gd3JpdGVzIHRoZW1zZWx2ZXMgYXJlIGlnbm9yZWQsIGJ1dCB0aGUgUENJIG1lbW9y
eQ0KPiA+IGJhcnJpZXIgd2lsbCBzdGlsbCB0YWtlIGFjdGlvbiBhcyB0aGUgTU1JTyBmaWx0ZXJp
bmcgd2lsbCBoYXBwZW4gYWZ0ZXINCj4gPiB0aGUgbWVtb3J5IGJhcnJpZXIgZWZmZWN0Lg0KPiA+
DQo+ID4gV2hlbiB3ZSBkZXRlY3Qgc3BlY2lhbCBkZWZpbmVkIG9mZnNldCBpbiBtbWFwKCksIFdl
IGFyZSBtYXBwaW5nIDRLDQo+ID4gcGFnZSB3aGljaCBjb250YWlucyB0aGUgbGFzdCBvZiBwYWdl
IG9mIGRvb3JiZWxsIE1NSU8gcmFuZ2UgdG8NCj4gPiB1c2Vyc3BhY2UgZm9yIHNhbWUgcHVycG9z
ZS4NCj4gPg0KPiA+IE5vdGU6IFRlc3QgY292ZXJhZ2UgZm9yIHRoaXMgaXMgYWRkZWQgYnkgSUdU
DQo+ID4gICAgICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82MTg5
MzEvICBoZXJlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFz
LnVwYWRoeWF5QGludGVsLmNvbT4NCj4gDQo+IE5lZWRzIHNvbWUgVU1EIENjLiBUaGlzIHdhcyBy
ZXF1ZXN0ZWQgYnkgc29tZSBVTUQ/DQoNClllcywgSSB3aWxsIGFkZCBzb21lb25lIGluIGNjLg0K
DQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIHwgNjgN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDY3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuYyBpbmRleCBjZDI0MWE4ZTE4MzguLmM5N2E0ZDFmMGE5OA0KPiA+IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+IEBAIC0yMzksMTIgKzIzOSw3OCBAQCBz
dGF0aWMgbG9uZyB4ZV9kcm1fY29tcGF0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLA0KPiB1bnNp
Z25lZCBpbnQgY21kLCB1bnNpZ25lZCBsbw0KPiA+ICAgI2RlZmluZSB4ZV9kcm1fY29tcGF0X2lv
Y3RsIE5VTEwNCj4gPiAgICNlbmRpZg0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIGJhcnJpZXJfb3Bl
bihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkgew0KPiA+ICsJZHJtX2Rldl9nZXQodm1hLT52
bV9wcml2YXRlX2RhdGEpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBiYXJyaWVy
X2Nsb3NlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKSB7DQo+ID4gKwlkcm1fZGV2X3B1dCh2
bWEtPnZtX3ByaXZhdGVfZGF0YSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qgdm1fb3BzX2JhcnJpZXIgPSB7DQo+ID4gKwkub3Bl
biA9IGJhcnJpZXJfb3BlbiwNCj4gPiArCS5jbG9zZSA9IGJhcnJpZXJfY2xvc2UsDQo+ID4gK307
DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHhlX3BjaV9iYXJyaWVyX21tYXAoc3RydWN0IGZpbGUg
KmZpbHAsDQo+ID4gKwkJCSAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkgew0KPiA+
ICsJc3RydWN0IGRybV9maWxlICpwcml2ID0gZmlscC0+cHJpdmF0ZV9kYXRhOw0KPiA+ICsJc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiA9IHByaXYtPm1pbm9yLT5kZXY7DQo+ID4gKwl1bnNpZ25lZCBs
b25nIHBmbjsNCj4gPiArCXBncHJvdF90IHByb3Q7DQo+ID4gKw0KPiA+ICsJaWYgKHZtYS0+dm1f
ZW5kIC0gdm1hLT52bV9zdGFydCA+IFBBR0VfU0laRSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPiArDQo+ID4gKwlpZiAoaXNfY293X21hcHBpbmcodm1hLT52bV9mbGFncykpDQo+ID4gKwkJ
cmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJaWYgKHZtYS0+dm1fZmxhZ3MgJiAoVk1fUkVB
RCB8IFZNX0VYRUMpKQ0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArCXZtX2Zs
YWdzX2NsZWFyKHZtYSwgVk1fTUFZUkVBRCB8IFZNX01BWUVYRUMpOw0KPiA+ICsJdm1fZmxhZ3Nf
c2V0KHZtYSwgVk1fUEZOTUFQIHwgVk1fRE9OVEVYUEFORCB8DQo+IFZNX0RPTlREVU1QIHwgVk1f
SU8pOw0KPiA+ICsNCj4gPiArCXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3Mp
OyAjZGVmaW5lDQo+IExBU1RfREJfUEFHRV9PRkZTRVQNCj4gPiArMHg3ZmYwMDENCj4gPiArCXBm
biA9IFBIWVNfUEZOKHBjaV9yZXNvdXJjZV9zdGFydCh0b19wY2lfZGV2KGRldi0+ZGV2KSwgMCkg
Kw0KPiA+ICsJCQlMQVNUX0RCX1BBR0VfT0ZGU0VUKTsNCj4gPiArCWlmICh2bWZfaW5zZXJ0X3Bm
bl9wcm90KHZtYSwgdm1hLT52bV9zdGFydCwgcGZuLA0KPiA+ICsJCQkJcGdwcm90X25vbmNhY2hl
ZChwcm90KSkgIT0NCj4gVk1fRkFVTFRfTk9QQUdFKQ0KPiA+ICsJCXJldHVybiAtRUZBVUxUOw0K
PiA+ICsNCj4gPiArCXZtYS0+dm1fb3BzID0gJnZtX29wc19iYXJyaWVyOw0KPiA+ICsJdm1hLT52
bV9wcml2YXRlX2RhdGEgPSBkZXY7DQo+ID4gKwlkcm1fZGV2X2dldCh2bWEtPnZtX3ByaXZhdGVf
ZGF0YSk7DQo+IA0KPiBXaGF0IGlzIGdvaW5nIG9uIGhlcmUgd2l0aCBwY2kgcG93ZXIgc3RhdGVz
PyBTYXkgZGV2aWNlIGdvZXMgaW50byBkM2hvdCBvcg0KPiBkM2NvbGQgYW5kIHlvdSB0b3VjaCB0
aGlzIG1taW8sIHdoYXQgaGFwcGVucz8gRG8geW91IGdldCBwY2kgZXJyb3JzIGluDQo+IGRtZXNn
PyBEb2VzIHJwbSBuZWVkIHRvIGdldCBpbnZvbHZlZCBoZXJlPyBNaWdodCBiZSBnb29kIHRvIGhh
dmUgYQ0KPiB0ZXN0Y2FzZSBmb3IgdGhpcy4NCg0KSSBhbSBub3Qgc3VyZSBoZXJlLiBCdXQgd2Ug
d2lsbCBoYXZlIGZvbGxvdyB1cCBJR1QgcGF0Y2ggb25jZSBiYXNpYyBJR1QgaXMgbWVyZ2VkLCB3
aGVyZSB3ZSB3aWxsIHRyeSB0byBhZGQgdGVzdCB5b3UgYXJlIHN1Z2dlc3RpbmcgaGVyZS4NCg0K
PiANCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHhlX21t
YXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKSB7DQo+ID4g
KwlzdHJ1Y3QgZHJtX2ZpbGUgKnByaXYgPSBmaWxwLT5wcml2YXRlX2RhdGE7DQo+ID4gKwlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gcHJpdi0+bWlub3ItPmRldjsNCj4gPiArDQo+ID4gKwlpZiAo
ZHJtX2Rldl9pc191bnBsdWdnZWQoZGV2KSkNCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gDQo+
IFdpdGggaG90dW5wbHVnIEkgdGhpbmsgdGhlcmUgaXMgYWxzbyBhIHNwZWNpYWwgZHVtbXkgcGFn
ZSB0aGF0IGdldHMgZmF1bHRlZCBpbg0KPiBpZiB3ZSBkZXRlY3QgdGhhdCB3ZSBhcmUgdW5wbHVn
Z2VkIGluIHRoZSBmYXVsdCBoYW5kbGVyIHRvIGF2b2lkIHNpZ2J1cyBraWxsaW5nDQo+IHN0dWZm
IChzZWUgeGVfZ2VtX2ZhdWx0KCkpLiBBbHNvIEkgZ3Vlc3MgYWxsIG1tYXBzIGFyZSBudWtlZCBv
biB1bnBsdWcgc28NCj4gZXZlcnl0aGluZyBnZXRzIHJlZmF1bHRlZC4gQnV0IHRoaXMgZG9lc24n
dCBsb29rIHRvIHVzZSBmYXVsdCBoYW5kbGVyIGFuZCBqdXN0DQo+IHByZS1wb3B1bGF0ZXMgaXQg
aGVyZSwgc28gd29uZGVyaW5nIHdoYXQgd291bGQgaGFwcGVuIGhlcmU/DQoNCkdvdCB5b3VyIHBv
aW50LiBUaGlzIG1pZ2h0IGhhdmUgcHJvYmxlbSwgRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24g
aGVyZT8NCiANCj4gDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFhFX1BDSV9CQVJSSUVSX01NQVBfT0ZG
U0VUICgweDUwIDw8IFBBR0VfU0hJRlQpDQo+IA0KPiBUaGlzIG5lZWRzIHRvIGdvIGluIHVhcGkg
aGVhZGVyIEkgdGhpbms/DQoNClllcyBJIHdlbnQgdGhvdWdoIHVhcGkgaGVhZGVyLCBkaWQgbm90
IHNlZSBhbnkgb2Zmc2V0IHRoZXJlLCBkaWQgbm90IGZpbmQgc3VpdGFibGUgcGxhY2UuIEFueSBz
dWdnZXN0aW9uIHdoZXJlIHNob3VsZCB0aGlzIGJlIHBvc2l0aW9uZWQgaW4gdWFwaSBoZWFkZXI/
DQoNCj4gDQo+ID4gKwlzd2l0Y2ggKHZtYS0+dm1fcGdvZmYpIHsNCj4gDQo+IEkgdGhpbmsgcGdv
ZmYgaXMgdGhlIGZha2Ugb2Zmc2V0IHRvIGJlIGFibGUgdG8gbG9va3VwIHRoZSBibywgc28gZm9y
IHRoaXMgdG8gd29yayBJDQo+IHRoaW5rIHlvdSB3b3VsZCBuZWVkIHRvIHJlc2VydmUgdGhpcyBw
YWdlIHNvbWVob3cgKGlmIHdlIGdvIHdpdGggdGhpcw0KPiBhcHByb2FjaCksIG90aGVyd2lzZSB1
c2VyIGNhbiBlYXNpbHkgZW5kIHVwIG1tYXBwaW5nIGEgbm9ybWFsIGJvIGFuZCBnZXQNCj4gYmFj
ayBhIGZha2Ugb2Zmc2V0IHRoYXQgaGFwcGVucyB0byBiZSB0aGlzIGV4YWN0IHNwZWNpYWwgYmFy
cmllciBvZmZzZXQgYW5kIHRoZW4NCj4gdGhpbmdzIGdvIGJvb20uDQo+IA0KPiBBbm90aGVyIGlk
ZWEgY291bGQgYmUgdG8gaGF2ZSBtbWFwX29mZnNldCBjYWxsZWQgd2l0aCBzcGVjaWFsIGZsYWcg
dG8NCj4gaW5kaWNhdGUgdGhpcyBCQVJSSUVSIHRoaW5nLCBhbmQgdGhlbiBpdCByZXR1cm5zIHRo
ZSBtYWdpYyByZXNlcnZlZCBvZmZzZXQuDQo+IFRoYXQgd2F5IHdlIGRvbid0IG5lZWQgdG8gaGFy
ZGNvZGUgWEVfUENJX0JBUlJJRVJfTU1BUF9PRkZTRVQgaW4gdGhlDQo+IHVhcGksIGFuZCBiZSBm
b3JldmVyIHN0dWNrIHdpdGggaXQuDQoNCkFyZSB5b3Ugc2F5aW5nIG9uIGRpZmZlcmVudCBwbGF0
Zm9ybXMgdGhpcyB1bnVzZWQgb2Zmc2V0IG1pZ2h0IGNoYW5nZS4gRm9yIGN1cnJlbnQgcHVycG9z
ZSBCTUcgYW5kIFBWQyBib3RoIGhhcyBjb3JyZWN0IHZhbHVlIGZvciB0aGlzIGFzIHVudXNlZCBv
ZmZzZXQuDQoNCkJ1dCBJIGFncmVlIGZvciBmdXR1cmUgY29tcGF0aWJpbGl0eSwgd2UgY2FuIGhh
dmUgdGhpcyBoYW5kbGluZyBpbiBLTUQgaXRzZWxmIHRvIGRldGVjdCBwbGF0Zm9ybSBhbmQgcHJv
dmlkZSBjb3JyZWN0IHVudXNlZCBkZWZpbmVkIG9mZnNldCB0byBVTUQgdG8gbWFwLiBJIHdpbGwg
dGFrZSBjYXJlIG9mIHRoaXMuDQoNClRlamFzDQogDQo+IA0KPiANCj4gPiArCWNhc2UgWEVfUENJ
X0JBUlJJRVJfTU1BUF9PRkZTRVQgPj4gUEFHRV9TSElGVDoNCj4gPiArCQlyZXR1cm4geGVfcGNp
X2JhcnJpZXJfbW1hcChmaWxwLCB2bWEpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVybiBk
cm1fZ2VtX21tYXAoZmlscCwgdm1hKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHhlX2RyaXZlcl9mb3BzID0gew0KPiA+ICAgCS5vd25l
ciA9IFRISVNfTU9EVUxFLA0KPiA+ICAgCS5vcGVuID0gZHJtX29wZW4sDQo+ID4gICAJLnJlbGVh
c2UgPSBkcm1fcmVsZWFzZV9ub2dsb2JhbCwNCj4gPiAgIAkudW5sb2NrZWRfaW9jdGwgPSB4ZV9k
cm1faW9jdGwsDQo+ID4gLQkubW1hcCA9IGRybV9nZW1fbW1hcCwNCj4gPiArCS5tbWFwID0geGVf
bW1hcCwNCj4gPiAgIAkucG9sbCA9IGRybV9wb2xsLA0KPiA+ICAgCS5yZWFkID0gZHJtX3JlYWQs
DQo+ID4gICAJLmNvbXBhdF9pb2N0bCA9IHhlX2RybV9jb21wYXRfaW9jdGwsDQo=
