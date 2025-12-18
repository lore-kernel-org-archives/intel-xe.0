Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A4D711C8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 23:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDDA10EC13;
	Thu, 18 Dec 2025 23:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAdN2Gu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6119810EC13
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 23:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766101508; x=1797637508;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+orgtJXT7r9kTJ0W/KZPDSYg6Nq244qZ+RYL3o2ru2c=;
 b=VAdN2Gu+X18On0YzYIiBDWrDJzqt+Op/FRZDK0fMTtSfvCghyw8IyFR3
 5VW0JvWd0PDvz+AHWcyvAlI+94WmOVOj9cP0sRRC87Lhdj3EEt28cobfm
 leXTaToWWoMP8OUhwbWagWClYdLPzHcOzU2C2wrT8cb7W45w0nJAOMXQ1
 t1UBL+/cqBWIevccaiXQU9+rdECVnAly6zSs6nbEOrscjQHU2dkGOq0bx
 N9HiCC5T5JZr/QIDBi4H6N0KxzKGvBchEWwqlWf5NjFXrcRsCsmc6L2Gv
 cS0tQBm01NgLjDXswztTZ2W3tUph+NwlpjRebDq6FKp4iv3jEn00zRWsI g==;
X-CSE-ConnectionGUID: 8W8wyzv+TJaopNuSqYyjIA==
X-CSE-MsgGUID: Wq0rE7LvTcC4QvsQY240Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90722265"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="90722265"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:45:07 -0800
X-CSE-ConnectionGUID: PXv7rnpwTkmMPyMCwUmCfA==
X-CSE-MsgGUID: 0/y9WLmcQ/aqErRRRCE5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222131658"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:45:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:45:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 15:45:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:45:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg1zq7oXRdCIksJ8P3fThb3gbZHU/QXBRd9eL6/3Le9tM2N4/6QG8w0rxkji4FMECIfDx/f4GTc2+kuJj03lbnNx0SyPI5c41/4ysjBKXAm8vcWXQZlqJDgGg7ZjyXKj8vMx0ks6eoQVrD/fU3aOrCs4WHuy36sfNiArREAt+S2VI9vgKVCP0hAkH2qZQlZ7Ia9OSJ70NTRUwNVnew0e5U63kRY7nbA31LiEDWckImrYbduAugQgLa2pEN76ss18zFIXlAKa3GsWdBTXTifXUGtg4oZj908tj/dguKFBAegbL5RuTIdWJaJIIcQ3e/HLIjEoVGNC4JmLxlw6uk6xJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+orgtJXT7r9kTJ0W/KZPDSYg6Nq244qZ+RYL3o2ru2c=;
 b=hGO+MVkr2tulqiHZQ4Of00ayj+nZ84jMWA0gWzoGcAAD3eWf/NRPkpHEMgB+5gem+0Vz6A4Jd1hSPcN3F6h+H5ShrUbYlFeCd4CzEqlb0h63Px7AEp3LoXzwR5OCh8FRYSS1Sumt8Xiv5uy99RHvzBlO70+dlux1ec+U56gZi60CW9/bIB2WElsebtnFCKlRgLts3QhnNh+0YL5rmPVUInDPsg4dg9ueY870eekiptBrCq6RUbMAarbCFGsgBiu1R6SvyCCEsDkrg7ofYWePK+km9/tz60tNouPP6EYnSvm/HZERpTnTe5FulfPKxIOPuEXIERkyJ3nezRbFvb+rIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 23:45:02 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 23:45:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Trigger queue cleanup if not in wedged
 mode 2
Thread-Topic: [PATCH v2 3/3] drm/xe: Trigger queue cleanup if not in wedged
 mode 2
Thread-Index: AQHccGeHqfgRle35pUiZ6EQBqmfGcLUoD9YA
Date: Thu, 18 Dec 2025 23:45:02 +0000
Message-ID: <24018a6e534cba02a43e7036eed4bf8965b30f4f.camel@intel.com>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-4-matthew.brost@intel.com>
In-Reply-To: <20251218214418.4037401-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN0PR11MB6303:EE_
x-ms-office365-filtering-correlation-id: 91663bc9-5201-41cc-6476-08de3e8f76d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M1d4N3lMV2lHZUpPS21FMUY4T2R1QWEvSUdlejVlMHMwRTJHeVl1blFnS3Q2?=
 =?utf-8?B?bE1PN1JqcnFOSmZXaE5KUkc1d21mNFp5NjROR2oxbDhsS2ErSWl3Z2MyZzhw?=
 =?utf-8?B?clBlY0dFRXJ6OVJPMmhiZDl5enZYMStaM1EvQjFadTRhMG1reXpDZHZFV1BI?=
 =?utf-8?B?bktoMWtCTWtWL3M5SnB3YlU2UG0ydHJjM2hSZEhPdDMxRGlsOUVwQW8xSHJy?=
 =?utf-8?B?TnFUaDhOSnEvblJGcFdoZUdJTDk3bTRMV2RYZVZXYXBORlpUdjVMcHFPSkQ1?=
 =?utf-8?B?UjFHUFQvai9BQi9UTmVDRXcxMlFjb3BBbCtSRm5uUHJXakFSdHA3djJuSWs4?=
 =?utf-8?B?eHBhbkkwTzd0eVRyREYwYVlkWFZWbU94akJwT0g5U0J6TWNtTlhaaG5qVUJM?=
 =?utf-8?B?ZUVmZ2l3QlBIRzVrKzBFdkNyQ0w3N05wUlgyRmo1bVRxVXlTckNyUFNhZTB6?=
 =?utf-8?B?MDN0WnZCUzNQZE81MjRYZXZiMG9rLzQvaDRNOUhHVUxWaWhQZmRhZUpZYU5D?=
 =?utf-8?B?TXNKeWdzQnRRVWtodXVjc3c2dlZISTRBQ3lEWFQxVi9GKzVLakVlT1VKd3Zu?=
 =?utf-8?B?dUhnYWV2T1FFRDdUbUVTUjlMdVZQUVRYN2h1R0x0MXB4RVNzbFhoTUFMZkpq?=
 =?utf-8?B?Wlk5cFBiQWxqR3FzL2VUV0NmUWRTb2NFZDJkdzdOMWduT3ZqYVhwWVNkMmk4?=
 =?utf-8?B?YVhZSkNrYXA5aE0reUVycDZ4NW5Mb09abkNiL3RLU0g5bUZsd0N1bkxLTzRL?=
 =?utf-8?B?K3Z0UFdGcnlEbG5hQXpHOXg5Q3NCMGNlenBYcC9Kd1ZHRzBHY1dYS0JTOEdF?=
 =?utf-8?B?U1RYczJXRGlJeFhmeDJUaVRmM0tHTjN0V1MvQkdKZG4wN3o0RGUvRlhjTVpr?=
 =?utf-8?B?VFZ3UURWa1R3R2tTUmpDaFA3Nkl3OWtPKzNZM2VOZ0tKNWtZazFNbC94QlV6?=
 =?utf-8?B?RVJYWGQvc08weWUzUmFBTWIvVmJZcmxxNERxNVcwbVpNV3p4d0xQZGZEY2lR?=
 =?utf-8?B?NmE0ZGlNNFBHUzJ6NVJ6Nm10YzdYWE8vaWFGbEN0SXV5RUFRN0VDQXpSZ0lj?=
 =?utf-8?B?WXNlUWFaNjMrSnpCN1hHVjhBcG9pTkw3enUwWU16VzI1NXUxbGhkWjBRUzNS?=
 =?utf-8?B?NGFUbG9yRDlrRVdDMERvTDd6QjkvemczZkRmNE1uU3NtM3kwNjdOc2tCOERu?=
 =?utf-8?B?UmxaVmNweDBiRHJxTUFiN3M4YWJKNXFIQ05rK1R4VmFEQm5IYk9VZkpQMExu?=
 =?utf-8?B?di95SDJZZ05CMHZQSFZQdjFIUWp3NlRZSHpVdjM0L2w5bGg0WWs1OGpxMVNt?=
 =?utf-8?B?V29CYnNvclhHZHdZN01xTlliR29XdXJmZmdTajFQQ1h0RU93WTRGYnBGUVdI?=
 =?utf-8?B?d3k1WGJDM25YcGg5NlYyWDc2ZVRzVHB5cytmOTA0ek11NEdPU3dRYVRJWVln?=
 =?utf-8?B?dFJkTy81N0s4SzRWdGVhWEhGTnUyeitDR0RkaGFWbmR5YmlTQmZjK2V6YjJ5?=
 =?utf-8?B?bWNmQlM4TCtVT3JWMDFwUG8vc3NEM1VUNXFtWklXNjN3em9nWnpXTTNqdE1U?=
 =?utf-8?B?NDd0azBiV2dhNk9WK1JUdzJIWWluSStuc1Z3Mk1iTTkrQXpHY21TT2dnMXBK?=
 =?utf-8?B?TVFnYzZhSVJPcC9qV2dXQU5neTU3UHJkMEdyZVJicFdrOUZTRDJrV3pDdEtY?=
 =?utf-8?B?cEFkTzhmRWF1QkdHaVhTNjVBVFFHQXRaZEhMTlJTeXpUSFRvNTFIaU9yWDli?=
 =?utf-8?B?N1ZwTlc5cGVSdGQ1bnQ0NVoxVjdyY0xwb2puL1M3TVhyazdPN1l4VWJzZzNO?=
 =?utf-8?B?R0Ewc3NmN2JzbzRnY0tPcTI3U3lCZ1NPSk1oSmIvRW5EUDdHTFVLVDE4QjFi?=
 =?utf-8?B?eUZaN0RaQ2svRkQ5b2ZKRS9nSHArbVJWZlJBSHd4RGJQTndkREVTTEN2NTl6?=
 =?utf-8?B?eVZSaVhieWIvM2ZpZmRwWlZPSFdpV2V2bjNDUDhHTTFpZ2dCNXZkQTdIVHZR?=
 =?utf-8?B?NkRVOVJNTTRxUE15cHNPK25OUjBTcFZmbENvL0I4QlZTTzVCMklaQ3UvQ1NZ?=
 =?utf-8?Q?7FitXu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1hkYjg2T2U4VXBxYlc4UEI3b0hEMGtKdm1xOHpheEhhSXoxRU1UMDZVN0Y5?=
 =?utf-8?B?MVNiTGpmY1N2UFR6eDNvZ0MzYzlNMGpOTUhlaE1KdGIyWHJHVXlvZmx4b0Q4?=
 =?utf-8?B?bUZqOTZSc3MyYlJ5SlF1U0tOMWpuV2R6cVd1bksxTVFzSThqazhnSS96Y2FV?=
 =?utf-8?B?RisrWlVSVlJMSmFlalhsVWRPNlpvNVdkTUZ5MWhXYjdxU3Vtb2FjKzBTVHRx?=
 =?utf-8?B?dE80bzRkRTBiQmdiYnhUbDIzQXA4RFY3RnFFZG1tdXVMaG1DeDZBVzJ4RENq?=
 =?utf-8?B?VW4zR0ovRkNOZUNXdk8reHQxM3NXWW02NGpTeUxFcUxpbExGUTJnNEkrV3c5?=
 =?utf-8?B?TGI0QmZVRllLTkFDTWNmVVA2SHAvbXV4STdFYlU0ZUJleHJLRWd6OGZZaWUy?=
 =?utf-8?B?U1hKcWRvbnZ5TkdHckFFVENBNGZ6cTA0ODdlZ00rdDNMZHhvQkkzNzNrTDV4?=
 =?utf-8?B?cmx2bWQxaGt0Y0ZnQmZqVnI4bG5lMnRucVp0Vkk0SCt2M0R4NWNFVTg1c0xs?=
 =?utf-8?B?SEt4TzdQbmlPSFNZUGxCNHI4M1pWcUdhMDdpVklJS1NaYWswWlBoU1NSZkpI?=
 =?utf-8?B?dUFXZlBOKzdSc0wxMlcrdUpEbXN5ZjZSaUxCY2JIYVRGakx6THBNays0Z1RK?=
 =?utf-8?B?WmxaeUV5WVVUU2piUG03dHI5ZmdIT3R5WHIxaVRNbTE3QS9peXlMbTYyUS9P?=
 =?utf-8?B?YWljYXB3djU4Rk05aVZHdVJoV2hEbDl0NFA2SzgwV3c5bGZ3ZXBTckhka2VB?=
 =?utf-8?B?SUxzWTNGaEUwTnNvTGVOVGI5cS9EMG1xdC9POU0zcWdHWmhXSG9xR1NNNi9a?=
 =?utf-8?B?MVg5NGU5MWw0UjZGd2lVYU5TT3p1d1BMb2ZMVncxblJaalh6ZlZ0Q3FVUk85?=
 =?utf-8?B?dkRTVWJFeHZaYzAyUU9SZDlpbnMwZUcvTjg5Q2JiUEp3UFF4WE5SNmJScm1h?=
 =?utf-8?B?aEthRjFsRThXcmp6QXByZ3JZUUYxRURCWUtLTnlCOUNrR2MyVGNVb1ZXdDgy?=
 =?utf-8?B?aFp3blMzakIrN3c0OUJPVWtJdzRCd1RYd0c1V0NWN25iRUI5TFlJMlA5WmV1?=
 =?utf-8?B?M1dCNk5ZYzlaVERWY3R3OFJUa1BnZStyVFNVS1lLR0VHdklkbDFsWC9oRytP?=
 =?utf-8?B?WFVjd04ra2U0eVBjZDVwa0k4aUs0alEydFhmTElJWjg3RC9tK3ZVTHFPbFhv?=
 =?utf-8?B?RzhyOXVmNFFIVXBkL0M5TnMzQUx5bXZsR3l4NExaZHFBeUduNjVhbU1PYUJP?=
 =?utf-8?B?K0Jqc0U0d0lBNlprTklFUUErNlA4UjJCSFJDUk1OQnpGRldRMXFlZDdWUDcx?=
 =?utf-8?B?anJJNm9EUEg3bTVobWpiMUFKbDE4NHNXWVZWVFZCa3RLMlhqNHpmTlpybVo2?=
 =?utf-8?B?cVhqQ3plMzl2aTA4NnRNa1dVUkNhSXZ0ZlV3cHV0SXdkUFNMS2s5TjFDQTE3?=
 =?utf-8?B?UVdySTRxWTY2MEc0TnhrdVh2RFJ3MGs2TlJqc2VsWTM5N2dqQ1h3YytENEpk?=
 =?utf-8?B?L01mUGdvcW13dktQWENlQnE2cnFsL0tqUWdTMVVyOERJNlRzL29sRU96RjN3?=
 =?utf-8?B?VUFOSVdIUituRkpuSUlxSDg5R2crc1J3UllJTU1JdGZTYnE1VkJkS0YrQjE1?=
 =?utf-8?B?MFNic3E0TDdsaDZpOUtTTTR0Zkdyb3BjNitBZUJlNHZWZzB2M05uU2JnMElH?=
 =?utf-8?B?ckl5eDMyc1Zza1FUbVZ6TGdTV1Q3N0Eybk5kQ2VuN215aEV0SGw1WjI0QTRz?=
 =?utf-8?B?WlNOSFdTNGMzL2FDZkszcUhsSU5hTSsxd1p2dVNPMFFzaVZQQ3VmYWxMbVZP?=
 =?utf-8?B?enAvcThURE5LNUhBanFBL2Q3cmp5Z2JwYUZEVkhubGlRcTBjZURRbXE5aVc2?=
 =?utf-8?B?NW40c2dwYTdGQmU5Qy9SSDhqL0QrbDBGb3A4NVN5UlV2MjNxU3FkYnVraytx?=
 =?utf-8?B?b0VnRjZBT3lvYnJ3Mkt3anY3MnF5N2t0ZWJsYnFkT2N5dnMzK1BpRnVaWmI1?=
 =?utf-8?B?L2lqclVVSWtEcHdZUjlDZGh1aVRISFRYaGNyTFJJd3VnTDBEb1piYjdoQnJC?=
 =?utf-8?B?OFJpd1QwVTViUXV2UURKUC9TR0JMamJwR2gxaFkwOVYvSXlQVVhKMzdqUDA3?=
 =?utf-8?B?RDl1OUZTT0ZFK21rcWlyd1g5MlJ0YUdhaWZyeFFMcWlXWG43Nm1lK3poUm9z?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC5483E825D3754A951D46BA82B11F82@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91663bc9-5201-41cc-6476-08de3e8f76d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 23:45:02.7280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dhc094ox9OszllSlq68iI7YBlbcL12Xs1GJ1DBieUKTBqfX0NbYFOLbc0XrJAP2EB94C6kfn6zKEHTbpgyBIf1/mfTqTNmNMMZWzEG6zhJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDEzOjQ0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFRoZSBpbnRlbnQgb2Ygd2VkZ2luZyBhIGRldmljZSBpcyB0byBhbGxvdyBxdWV1ZXMgdG8gY29u
dGludWUgcnVubmluZwo+IG9ubHkgaW4gd2VkZ2VkIG1vZGUgMi4gSW4gb3RoZXIgbW9kZXMsIHF1
ZXVlcyBzaG91bGQgaW5pdGlhdGUgY2xlYW51cAo+IGFuZCBzaWduYWwgYWxsIHJlbWFpbmluZyBm
ZW5jZXMuIEZpeCB4ZV9ndWNfc3VibWl0X3dlZGdlIHRvIGNvcnJlY3RseQo+IGNsZWFuIHVwIHF1
ZXVlcyB3aGVuIHdlZGdlIG1vZGUgIT0gMi4KClllYWggdGhpcyBtYWtlcyBzZW5zZS4gU2hvdWxk
IHdlIHVzZSB0aGlzIGZvciB0aGUgZml4ZXMgaW5zdGVhZCB0aG91Z2g/Cgpjb21taXQgOGVkOWFh
YWUzOWYzOTEzMGI3YTNlYjI3MjZiZTA1ZDdmNjRiMzQ0YwpBdXRob3I6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4KRGF0ZTogICBUdWUgQXByIDIzIDE4OjE4OjE2IDIwMjQg
LTA0MDAKCiAgICBkcm0veGU6IEZvcmNlIHdlZGdlZCBzdGF0ZSBhbmQgYmxvY2sgR1QgcmVzZXQg
dXBvbiBhbnkgR1BVIGhhbmcKClRoYW5rcywKU3R1YXJ0Cgo+IAo+IEZpeGVzOiA3ZGJlOGFmMTNj
MTggKCJkcm0veGU6IFdlZGdlIHRoZSBlbnRpcmUgZGV2aWNlIikKPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RA
aW50ZWwuY29tPgo+IAo+IC0tLQo+IAo+IFRoaXMgZml4IHdpbGwgbm90IGFwcGx5IG91dHJpZ2h0
IHRvIGFueSBzdGFibGUga2VybmVsIGFzIGl0IGRlcGVuZWRzCj4gb24KPiBmdW5jdGlvbnMgd2hp
Y2ggaGF2ZSBhZGRlZCBpbiB0aGUgS01EIHNpbmNlIHRoZSBvcmlnaW5hbCBjb21taXQuCj4gTGlr
ZWx5Cj4gd2lsbCBoYXZlIHRvIG1hbnVhbGx5IHNlbmQgb3V0IHBhdGNoZXMgdG8gc3RhYmxlIGZv
ciBrZXJuZWwgd2hpY2gKPiB3ZSdkCj4gbGlrZSB0byBmaXguCj4gLS0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jIHwgMzEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LQo+IC0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMK
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiBpbmRleCA1OGVjOTQ0Mzlk
ZjEuLjYzYjk4NGY2ZDc4ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3N1Ym1pdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+IEBA
IC0xMzEzLDYgKzEzMTMsNyBAQCBzdGF0aWMgdm9pZAo+IGRpc2FibGVfc2NoZWR1bGluZ19kZXJl
Z2lzdGVyKHN0cnVjdCB4ZV9ndWMgKmd1YywKPiDCoCAqLwo+IMKgdm9pZCB4ZV9ndWNfc3VibWl0
X3dlZGdlKHN0cnVjdCB4ZV9ndWMgKmd1YykKPiDCoHsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSA9IGd1Y190b194ZShndWMpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9l
eGVjX3F1ZXVlICpxOwo+IMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nIGluZGV4Owo+IEBA
IC0xMzI3LDE5ICsxMzI4LDI1IEBAIHZvaWQgeGVfZ3VjX3N1Ym1pdF93ZWRnZShzdHJ1Y3QgeGVf
Z3VjICpndWMpCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghZ3VjLT5zdWJtaXNzaW9uX3N0YXRlLmlu
aXRpYWxpemVkKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IMKg
Cj4gLcKgwqDCoMKgwqDCoMKgZXJyID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGd1Y190b194
ZShndWMpLT5kcm0uZGV2LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBndWNfc3VibWl0X3dlZGdlZF9m
aW5pLCBndWMpOwo+IC3CoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIGNsZWFuLXVw
IG9uCj4gd2VkZ2VkLm1vZGU9MjsgIgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIkFsdGhvdWdoIGRldmljZSBpcyB3ZWRnZWQuXG4iKTsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+IC3CoMKgwqDCoMKgwqDCoH0KPiAr
wqDCoMKgwqDCoMKgwqBpZiAoeGUtPndlZGdlZC5tb2RlID09IDIpIHsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZXJyID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGd1Y190b194
ZShndWMpLQo+ID5kcm0uZGV2LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAK
PiBndWNfc3VibWl0X3dlZGdlZF9maW5pLCBndWMpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpZiAoZXJyKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB4ZV9ndF9lcnIoZ3QsICJGYWlsZWQgdG8gcmVnaXN0ZXIgY2xlYW4tdXAgb24K
PiB3ZWRnZWQubW9kZT0yOyAiCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkFsdGhvdWdoIGRldmljZSBpcyB3ZWRnZWQu
XG4iKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKg
wqDCoMKgbXV0ZXhfbG9jaygmZ3VjLT5zdWJtaXNzaW9uX3N0YXRlLmxvY2spOwo+IC3CoMKgwqDC
oMKgwqDCoHhhX2Zvcl9lYWNoKCZndWMtPnN1Ym1pc3Npb25fc3RhdGUuZXhlY19xdWV1ZV9sb29r
dXAsIGluZGV4LAo+IHEpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV9l
eGVjX3F1ZXVlX2dldF91bmxlc3NfemVybyhxKSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNldF9leGVjX3F1ZXVlX3dlZGdlZChxKTsKPiAtwqDCoMKg
wqDCoMKgwqBtdXRleF91bmxvY2soJmd1Yy0+c3VibWlzc2lvbl9zdGF0ZS5sb2NrKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmZ3VjLT5zdWJtaXNzaW9uX3N0
YXRlLmxvY2spOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4YV9mb3JfZWFjaCgm
Z3VjLT5zdWJtaXNzaW9uX3N0YXRlLmV4ZWNfcXVldWVfbG9va3VwLAo+IGluZGV4LCBxKQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX2V4ZWNf
cXVldWVfZ2V0X3VubGVzc196ZXJvKHEpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNldF9leGVjX3F1ZXVlX3dlZGdlZChx
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZndWMtPnN1
Ym1pc3Npb25fc3RhdGUubG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogRm9yY2VmdWxseSBraWxsIGFueSByZW1haW5pbmcg
ZXhlYyBxdWV1ZXMsIHNpZ25hbAo+IGZlbmNlcyAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB4ZV9ndWNfc3VibWl0X3N0b3AoZ3VjKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3VjX3N1Ym1pdF9wYXVzZV9hYm9ydChndWMpOwo+ICvCoMKgwqDCoMKgwqDC
oH0KPiDCoH0KPiDCoAo+IMKgc3RhdGljIGJvb2wgZ3VjX3N1Ym1pdF9oaW50X3dlZGdlZChzdHJ1
Y3QgeGVfZ3VjICpndWMpCgo=
