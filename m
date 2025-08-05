Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1884AC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 18:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB0A10E6F7;
	Tue,  5 Aug 2025 18:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcS25dE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7169410E6E5
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754417577; x=1785953577;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GbI65PeggaOWjlgHXVxZiZ52krKQmhXDC0olOJXorzM=;
 b=LcS25dE5ebTV2HgKAalH9S9jWxzPxrcPHjwamiDunbplN3PVwG0dmtm9
 MnmH9cSMb0cngechVT9iv4SHsZNON9sfVCoDxCuVimICLX6EPx366Im6x
 LXoqvQ6cWV85Yo+4LQnVnkWGIZp4hxkJzjF/NvXkmPnyLwoPxiuYMpSmn
 D1+OYVvRhuZ99Awm2f1QcnYTbXBGxM/2/PM4f6+xouHP8VXJSXdDlHdhb
 734K1QZkdLbVZ3xiuzjhPMzoWBPL9qGZzW+tw6bK06A0Sq2chFhXaMZoD
 rJE7MzedI1dfvv0p50vnOhKuLKqurBuMjgHlruRfIfINkDp8ZuqBhGpGC g==;
X-CSE-ConnectionGUID: zi+9rua6Rzayv8l/mfMqHA==
X-CSE-MsgGUID: Och1FCoERBCvZSqISD17Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67317034"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67317034"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 11:12:56 -0700
X-CSE-ConnectionGUID: 4W5FoX4tQR2OGoo4WJyrhg==
X-CSE-MsgGUID: NMScpRlVQkGJ2Dhf2nEmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="188238040"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 11:12:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 11:12:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 11:12:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.47)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 5 Aug 2025 11:12:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSxf93hrcO3lcQFz5k5ch5VJixnxUKEsa/eaGDUg3K0f+Poh5lv/ccOhVXSRIgndvce9ExFRRHhRScyMfgZb0xy5XJb3yVeY9u8/Yq8KamN0dGdhTpr80O+UtJfI9EpWBHjQSWqGHxslOCBxbFcOg1AHyzjB1VyGFPqjXGzifE4b/Zp1aMqN9MekeZiRBGRDX2Aj43iXkjpl8odOQ0wxgqXlh9MYsWnrtRZ7S9we6FZD5RvXqiDb4i+T4o2CppkIaW9wZsnJcDz+ywDOIwkuTtkf/ZiVPmdSrsHMKnPTjXg0M43Fy8NaivtS6CDY8X/VUxYHU6vcmOXq2djbTYRI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbI65PeggaOWjlgHXVxZiZ52krKQmhXDC0olOJXorzM=;
 b=w99L1YiiMuLGKyrSqQKG8ikHikFnsZK9OH07hz8j5QHaHWX/IJU+qRoC49p699DJMnEZvaQfqJMZF2Q+agduTuvfYf/IMYyI+/HKLYuEjjsF/G+H7HAdcIPzD0M2yCWTxDdwEUQgChtNhg2gW7hITZXFiLLA/j4m3h7wcQquUcM5Bjx1geuvD5pax2RxuNBCb+y+yPx7jFySKJDV+NP+rC01WeqIBPzNAf6xv2f6ZEnm8iZK2Lz/QdGu1wKuWBf/Xspnzlhsj7gk6AWnrK6IU4tmTQLBvKLYO68KOAqFkf6G5F/aS8X9bQTxbVzvTx7iKLYlZxw19QI4vDa5GdOygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.21; Tue, 5 Aug 2025 18:12:53 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.013; Tue, 5 Aug 2025
 18:12:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Program LMTT directory pointer on all GTs
 within a tile
Thread-Topic: [PATCH] drm/xe/pf: Program LMTT directory pointer on all GTs
 within a tile
Thread-Index: AQHcBeou9mNLxPpPTEiS2UcS1+eR8bRUXUiA
Date: Tue, 5 Aug 2025 18:12:53 +0000
Message-ID: <3e91120f664a598a24ce83d164135fd2cb7d610f.camel@intel.com>
References: <20250805091850.1508240-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250805091850.1508240-1-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW3PR11MB4585:EE_
x-ms-office365-filtering-correlation-id: 4e4ea291-ca09-460d-ea8b-08ddd44bb23f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?akR4QXdRS0RPdVpxTU8za0F4SzBZUTF1VVFqVnZVT2t5cWk3ZSsrSGtCc0Rk?=
 =?utf-8?B?U200QXY3TDVoZkZsSGVFSVJWUFJBZEUzWUlUVWFLQWh3ZmpUUFV1OFQycW0r?=
 =?utf-8?B?TEw0WHNvTFNvV1B5Sm9QR1JPWkdYL0tlbUlaaEY5QzIyVi9CSTFlcm42WDJE?=
 =?utf-8?B?SWF0TVlCc1FDR0U0VldkRnJWZWZCd1AxQnA1dTQyVkh5REY2dUVQY1R0eENx?=
 =?utf-8?B?enozcTZYVFk2SXZzVk9iUTlzQlVMV1ZkS0MwYlhEby9FQllqTHg0d01iaiti?=
 =?utf-8?B?MDBiODFJbHhnNVI1d2MwVEc1UllNejhYQUtaSkUzTEVyNmphdldpUFpaOE85?=
 =?utf-8?B?WmlPYnF5Sm1VWG15Mms5Qmdkd00xWC9pMXNzSmRtcElWR1kxcHh0SEwrWGk4?=
 =?utf-8?B?dVB0MjhYVXZZRVNNMlhkV0ZxMmo3MFZabFZXU0hjdWJPcHp6Z2VlcDlLRFc1?=
 =?utf-8?B?V0ZLZUVZSFFab2hhdm0vSEVYZTNsZ0JFUzRST2swWDN0V1RJalk1UnhnQ2Zt?=
 =?utf-8?B?YjR4U2M2R0xVMitXVnlkOXZZbjFpWDJKRi9vc09LNmFKSzJHWTNpNHhrSlVQ?=
 =?utf-8?B?bE5mb1drbm5sN0pRd0ZpZ0hiNFhZQ3BjOThiaFYyUnFacURCOGwvZnNnemxD?=
 =?utf-8?B?anR3Skk1emFRODBoRnZHVHpjalBWalUxYzZablhnUFU3VGpxRmRnc3RLZm82?=
 =?utf-8?B?dUJXS2xmY0dnVEhnc3BDWVZ1LzBuaHdlcDN5cThhb0tHYUErV2grbnQ3RFdG?=
 =?utf-8?B?ZkxhQUFHY2hQU0o3aGEwNzI0a1UzTXhLbjdwSFErUnFzSnRWZmFOaUhNZUEz?=
 =?utf-8?B?NytERzgxWFVoUVM3R2pDaEowa2VkaXZnbThiMEFDN2JqdFdNNEZDMDE3enFv?=
 =?utf-8?B?WWxST2V1MTNVUDAxSWFPMERDNDBYdDg2VVViMG9ULy9TN3N3UzhWeUlsVHFp?=
 =?utf-8?B?MEdPM3hQYkp4MXJwZW14MXpqUjlJR010bmdRR2VrZ0dDVUtXUGllOW05dzht?=
 =?utf-8?B?RWVWTWxhQmczUi9UbGFWaFMvcGlQcS9WVzRFUjNZd2V3QTJKaXFVazk2L2Zx?=
 =?utf-8?B?dGc5cmphdVZDRVhqNVFIWStRTDBxb1lSeHRxbTlSWUNWOTYzcWFvN0VTR3dQ?=
 =?utf-8?B?M1dHZWdmNEhUSXBKcWM5dTZMSFBOUm5kc0lvSGE0NHB3Lzl6cWcrZFFzWmN3?=
 =?utf-8?B?V2V3Tk9aRFFWR3JTb0FSMG5wUzVNYy9tUXR6ams1TTZ1aS9aQmRVeWNyM0Ev?=
 =?utf-8?B?NWxoMC9KTzJDYnAwZDNmaEZDSmcwRWhxZWlOdHZnTmxaY2VpYWFhYS8vRXZI?=
 =?utf-8?B?dXI2Q2kyYXNFZEo0M1dycVlxNEZCL0o3MVdsL1JLWHJtckdmS2lwOUNhM2o0?=
 =?utf-8?B?RDNwY2RITnBqRVhOOGR2OTI0Skp2UG1tYzZHczNqQW9ONm9OcGxSdU1EMDFk?=
 =?utf-8?B?ZCtZR0ZrY1BaUkpjak9CNi8ySEx5N1l6NVQ2U3ozWVIxa1k1dnVxQ1NlKzJ1?=
 =?utf-8?B?UXhXZGszeG5XU05jVU1JZDN1cVowdE5mbmJ2REhtT2grcTNuYkpmVzBpSmQx?=
 =?utf-8?B?T1cxWWx6OEdUekYvTlpaandTVFZGR3FXR0krWnFVV1N0UExYMW1vTThnait4?=
 =?utf-8?B?ODIyUVBia2o0TU0vTm50KzRZMk5GUmhYakg2cTRkMTREY040MnU2RE5CR1pp?=
 =?utf-8?B?K3QzNCtHY2FMNEtYdkVRUThSdk1XT3FGRzdmN3J0TXAvcVA4QlRIbVdpUFJw?=
 =?utf-8?B?ZUxlQVowMnh1YkN4UHB6eFFPRmFlT1hoa2ptcUZvb3FOV2hDVEV1SG1nSWYy?=
 =?utf-8?B?Mm5jRjBxNjFGVCtKMDVGTTJCdjhtRXpramJYbnhENmpPOUxrZDI2UHFjV3dt?=
 =?utf-8?B?bFVIWlJWVmtkZ2lnN05Yem90VVEvczE4Q1BPdnM3TU5DcEt0V0NQb1ZuRTF6?=
 =?utf-8?B?VEZCMkFDa0ZRWW5VcW5BNWZMY0gwNDBtcE9mQU5lRGpKWHFUUFpXSDZnT0Nt?=
 =?utf-8?Q?plXDSq/EMYW7WWS28OhsJJqjx7GXOY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wlh6ekxCTWdDcE54VWhzaVZyd004SEY3cTQyK2lLOXJrLyt3TGdzUndtWTZo?=
 =?utf-8?B?dWtsZHNadUlWUHRGaTBoZHUvUnQ2ZWhhaSt2VHE1NVdXdGNWblF3c0dRbHdQ?=
 =?utf-8?B?V2pscmlKbUk5N2p1dVZGeFBFbWJ6WFd1TDlhUEprakdmV1MxbTFpdk90VFdq?=
 =?utf-8?B?d3h1T0pHWGkzcXlYdWdyVUZwejdZa2tGR1llSjFhM3hqVXhlR24yemEwYlh5?=
 =?utf-8?B?QkVSYi9YdUwwYktmOVppSG9objl2SFRPdStKbFo4d1BwN2M3TkJqUGxZY3FT?=
 =?utf-8?B?V0NqSUFqOEZYb1hJRS8raVJmcURZRnp5by8rbHdiUlJDNTRJZDZnSzZVTjVR?=
 =?utf-8?B?aWZjbFJ5cnJkdXNnNm4wcmFwOG1pRGdMckdJUHFLQ2lZQ05ZQzc2aXl4azFN?=
 =?utf-8?B?d1E2UXcxNWJodXg2ZCtaVmtQb2NYMWVUZ2lPdTFSS0VkQVJQM0JudWFUNDFZ?=
 =?utf-8?B?MmpqRWNlY1N0czZ6UUwwSjZyMVdmdm44VmEzRHpVWFhFSEVnL1hvK3RWMG5U?=
 =?utf-8?B?SGVGZ2VCRTdtc3pqek1vdXlzU003Uk9qRWZOaHpzVWhtR21WS0twejZRcS9y?=
 =?utf-8?B?K05KSDVLK2g0MmwwbVZyNFNGNnhQUVlLN3ZtWjFYTGc3Q1pkYVNCQXNxQ1Zl?=
 =?utf-8?B?djdsZ0I1UzhEK1A0SFN3eVRrRGV6K0NTcUZIcllYczUwRWRVeGNvaS9KQmUy?=
 =?utf-8?B?b2RRaGtmYjZ0NGNhMHhqUnZUd3FDV0tsVjVoV05iQTJJUTNWa084NFpZVW1t?=
 =?utf-8?B?dHFEYUluNEVZWEpremtpb29aRXpSRExsRkFKVWYwNi9nS0JlZ1NtM2VPLzdk?=
 =?utf-8?B?cHpudTZpdzBJaG55U2wyU3YyWlhOM0V1STBiVElPOHplZTBYM3MxaHJCRkY1?=
 =?utf-8?B?T01aWG8wLzNKbnBibWs1Wm5UVGlHMjVqVHF0VjBabm5Na1UxK2lZSy93T1lD?=
 =?utf-8?B?UndjWEQ5VzkzRUlMVWVSM1lRUVVyVm90TG9FZVlqMEJhelcyb283a0JvVnI1?=
 =?utf-8?B?UDFqTmp6UmZyMGdWaXZma1IwR096aEdQQUZRY25FNGVaSzhKY3d2YUk4YWVG?=
 =?utf-8?B?Si9ON2JqbVlLTm5BV1FQQXlLUTNHZXpKcEg4a0kzM3ZocE9pRjZiUEdyT1lr?=
 =?utf-8?B?cDZBOW11RWZmbUdZN3Z1Nk1sS1h2Q21qZVc0Q0FiZ0dwckQ1N1BoeWx4N0g2?=
 =?utf-8?B?MVluQnFEYzI5a2h5R2pOV3Nrd2xKcndQSHFaSWZ0RGVyQ1dIRWt3QzRmTGJL?=
 =?utf-8?B?bjVlNTZQeW44NStqSkN0cU1oY0dJN2t2S3ZCeXlaNlJwSWh3aENnRjBBOFB3?=
 =?utf-8?B?S3kwZlo4bjJRd3VuMEVMeDdERFBkNUFZeCt2QzZ4bXo2ak5XQVpjQTdTMG1k?=
 =?utf-8?B?OHJuVGNHVUFRNHkxMmNFbWZJb3g1SVpJNzNsMXhPSFp1cHJQaFlOSW5nNmVr?=
 =?utf-8?B?TnU4am0xd3RGZVRFMmRMalhYLzhpU1l1WS9OeVlqdURhR0ZTaGhqQVNVc3Ir?=
 =?utf-8?B?bmViNEZNcWpONkRyb1Vla3RCQm1halJJNmpQT2oxMlJUWURnMnBEMUNjQjVY?=
 =?utf-8?B?VVl6b3FiVXpRZFU4b2p0MjRVMkdrTTVoclRjdmpzblh3eFZMbkNiTlV2U2lG?=
 =?utf-8?B?ZnNqSmh4Z2VnUmhkOEpoMTBYN2JJcFd5cWpGTFBoRmdEcFVvSVYxUmlST0sw?=
 =?utf-8?B?L0ptazZGemVPem5kZnB3RUgyc09TWmk3dGZFOWhYU2ZHSWhiRmNoMGN0ZDZP?=
 =?utf-8?B?TnNDQm5NdDJrdmdGNWNmTTRqU21KcUFUSnM5b1NuZVgwNFlhaTJ1bVRaMmM4?=
 =?utf-8?B?VFh1WXBuWXBDbCthTjdtUU1BYUV1NHRiS1BSVHo1emoyamoxTllSNjNGZHpE?=
 =?utf-8?B?SjBXamNyWm5kWFNlcHhvV3U2WjRIU0VCdzMwamFreFo3V3lFcTBjc2dCY2tm?=
 =?utf-8?B?bjEvOStTbjBqWnJHV2dPcy9iV21hMXNtT2k2MDhTZmx2ZkJVbzZXY0FaK3Ux?=
 =?utf-8?B?dUV2ZDQvNEIrVE5oRXY4TjM0NVkwK3A4TWw5MXZRMTB6TmpHdE5lZ0U1OVgx?=
 =?utf-8?B?N0hMc1hTSkkwQVNpcFNwcGYxeVM4c3dWTTgxeGR2cjRVbUw1dWZtMER0Z3h0?=
 =?utf-8?B?R3ZhdE9YRlVWUnIvSzlPclE1SFRpMjI2L3NUc2dVL3piL0RLTjNaTDkwbHh4?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13213D7A35029F4FB567D4F18884A42B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4ea291-ca09-460d-ea8b-08ddd44bb23f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 18:12:53.4041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8cp1azG55Ck3vOSWBpo4YSB0w1CzmXhqnwl0ggz0Ljl1zbJuSgWZF838oRJfP3mx7UQbrryRSqKIvfICwLJfWX6Zn5mqoDj4ZlT0ihumPak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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

T24gVHVlLCAyMDI1LTA4LTA1IGF0IDExOjE4ICswMjAwLCBQacOzcmtvd3NraSwgUGlvdHIgd3Jv
dGU6Cj4gRnJvbTogUGlvdHIgUGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29t
Pgo+IAo+IFByZXZpb3VzbHksIHRoZSBMTVRUIGRpcmVjdG9yeSBwb2ludGVyIHdhcyBvbmx5IHBy
b2dyYW1tZWQgZm9yCj4gcHJpbWFyeSBHVAo+IHdpdGhpbiBhIHRpbGUuIEhvd2V2ZXIsIHRvIGVu
c3VyZSBjb3JyZWN0IExvY2FsIE1lbW9yeSBhY2Nlc3MgYnkgVkZzLAo+IHRoZSBMTVRUIGNvbmZp
Z3VyYXRpb24gbXVzdCBiZSBwcm9ncmFtbWVkIG9uIGFsbCBHVHMgd2l0aGluIHRoZSB0aWxlLgo+
IExldHMgcHJvZ3JhbSB0aGUgTE1UVCBkaXJlY3RvcnkgcG9pbnRlciBvbiBldmVyeSBHVCBvZiB0
aGUgdGlsZQo+IHRvIGd1YXJhbnRlZSBwcm9wZXIgTE1FTSBhY2Nlc3MgYWNyb3NzIGFsbCBHVHMg
b24gVkZzLgo+IAo+IGJzcGVjOiA2NzQ2OAo+IGhzZGVzOiAxODA0Mjc5NzY0Ngo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBpb3RyIFBpw7Nya293c2tpIDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT4K
PiBDYzogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+Cj4gQ2M6
IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KCkFoIHRoaXMg
bWFrZXMgc2Vuc2Ugbm93LiBJIGNhbiBzZWUgaW4gYnNwZWMgYWxzbyB3ZSBoYXZlIGEgZGlzdGlu
Y3QKb2Zmc2V0IGZvciB0aGUgbWVkaWEgTE1FTV9DRkcgcmVnaXN0ZXIgdGhhdCB5b3UgYXJlIHBy
b2dyYW1taW5nIGhlcmUsCnNvIGlmIHdlIHdlcmVuJ3QgcHJvZ3JhbW1pbmcgdGhhdCBiZWZvcmUg
aXQgbWFrZXMgc2Vuc2UgdGhvc2UgYWNjZXNzZXMKd291bGRuJ3Qgd29yay4KClJldmlld2VkLWJ5
OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9sbXR0LmMgfCA5ICsrKysrKy0tLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2xtdHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xtdHQu
Ywo+IGluZGV4IGEyMDAwMzA3ZDViZi4uYTc4YzlkNDc0YTZlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9sbXR0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbG10
dC5jCj4gQEAgLTE5NSwxNCArMTk1LDE3IEBAIHN0YXRpYyB2b2lkIGxtdHRfc2V0dXBfZGlyX3B0
cihzdHJ1Y3QgeGVfbG10dAo+ICpsbXR0KQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdGls
ZSAqdGlsZSA9IGxtdHRfdG9fdGlsZShsbXR0KTsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X2RldmljZSAqeGUgPSB0aWxlX3RvX3hlKHRpbGUpOwo+IMKgwqDCoMKgwqDCoMKgwqBkbWFfYWRk
cl90IG9mZnNldCA9IHhlX2JvX21haW5fYWRkcihsbXR0LT5wZC0+Ym8sCj4gWEVfUEFHRV9TSVpF
KTsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0Owo+ICvCoMKgwqDCoMKgwqDCoHU4
IGlkOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGxtdHRfZGVidWcobG10dCwgIkRJUiBvZmZzZXQg
JXBhZFxuIiwgJm9mZnNldCk7Cj4gwqDCoMKgwqDCoMKgwqDCoGxtdHRfYXNzZXJ0KGxtdHQsIHhl
X2JvX2lzX3ZyYW0obG10dC0+cGQtPmJvKSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGxtdHRfYXNzZXJ0
KGxtdHQsIElTX0FMSUdORUQob2Zmc2V0LCBTWl82NEspKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDC
oHhlX21taW9fd3JpdGUzMigmdGlsZS0+bW1pbywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoEdSQVBISUNTX1ZFUih4ZSkgPj0gMjAgPyBYRTJfTE1FTV9D
RkcgOgo+IExNRU1fQ0ZHLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgTE1FTV9FTiB8IFJFR19GSUVMRF9QUkVQKExNVFRfRElSX1BUUiwgb2Zmc2V0Cj4g
LyBTWl82NEspKTsKPiArwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9ndF9vbl90aWxlKGd0LCB0aWxl
LCBpZCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfbW1pb193cml0ZTMyKCZn
dC0+bW1pbywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBHUkFQSElDU19WRVIoeGUpID49IDIwID8gWEUyX0xNRU1fQ0ZHCj4g
OiBMTUVNX0NGRywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBMTUVNX0VOIHwKPiBSRUdfRklFTERfUFJFUChMTVRUX0RJUl9Q
VFIsIG9mZnNldCAvIFNaXzY0SykpOwo+IMKgfQo+IMKgCj4gwqAvKioKCg==
