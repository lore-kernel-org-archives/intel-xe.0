Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA928C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 16:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A24310E19E;
	Wed,  6 Aug 2025 16:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrNFCWig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26A710E19E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754498769; x=1786034769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/KuK23i0R11JirR+ovbygCGkOBgYvD9cgLJpBqCP6XY=;
 b=UrNFCWigclaUqH3QS9zQ3Dlx3Ve1QVzYE1Wjw24zsxKDXKfHieAB/SSl
 slM17w2CR53zBw099eO7rBS2mMxBFGPDSfH61hnRefYdeWNVcAUr8vx3M
 rUSi2N9PnOZv5YiyViThjFQy7yl6jQ30MM/zn1NpdcAv1WFxsq5ErgwlZ
 nvVBrmU34jtvSaDAOwVmfI03/R2n8lS64qx8y+U5AhN8HlNY0zqmGELzW
 WIMzpwmehrOZJPA5KMKhL2KtroQJidGdu+/UVcjcg1G/O9S5kOIxQSsDN
 UDYmG2rFhle4UesYVrAmu6pskNZxM5UH28SVmQ80+YoCUy5G3KsxdtqYe w==;
X-CSE-ConnectionGUID: uBrnLLWSR6aKfCaNxy6aLw==
X-CSE-MsgGUID: KLrIXYulS9+dJ/sV9K6QfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67519630"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="67519630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:46:08 -0700
X-CSE-ConnectionGUID: Jel6I9UPT1uGkdZqzH2ytQ==
X-CSE-MsgGUID: UnTPAM9+RMCR8IVORTQmvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164064852"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 09:46:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 09:46:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 09:46:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.60)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 09:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwMHVI/WatYA+TKaJI1XMvMUJ4xG6t+6E/OCYdmO6/vKTz0km+q4LX0WoG4PneE6KPFZkD7AVckdA3qxUsIGCMc0BIBUtxkv4gkI61t6tLfqFfQ8E/TqN0fuSTZnlYfH1tviIscX1Z/nU62v4/Dy+lESpYP0a6bYP1Is9fVNO8lbzp3eRn602pEIwX5Neo7iHnLGw5uKhla1TXUzc3/5E3vzJY7uJzsr/09LDSMpEip/hkJlAg5LmSt/u376y75/xQD74oRwVOWlIGOeyng+T6ZP2Le+nasIR13WM5fa6VmBzgE2dJ3oAjV/QjDs1p9pmdeleRWMnQxV78o+9DGoUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KuK23i0R11JirR+ovbygCGkOBgYvD9cgLJpBqCP6XY=;
 b=TuzbMeoTTgzLRQFbW2/D/ufo90qZ4lZtkf1BuCPY+fIdX/FnV8M8L6zBg4yZj87YFtIog1eLLfN9mGTrM5auWBBhLU0Td6e0OOE2j/5s5oq1fot1Q7f7AZZrRFZw40I51lgGAxRdj375+nPXJ8fGZF+yu+QftDwJ2dEqbnkVj5qjiesEycXmD75Z3lLOq+tVx4/Jt/nJSO/6c1GcHAhRpuvESpS56v1EjzA/5l0GmHZUYKAhHrRJS3T32YlLdF3PemCLQ+RYU1Js+nV4WfRsguKSzFOCT1Mu8ncanaj8h/fmdIoLCln4NTImkDJjnsPnyjN24sNQBgsLMv+vz6UrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 16:46:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 16:46:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't expose mailbox attributes for skip_pcode
 cases
Thread-Topic: [PATCH v2] drm/xe: Don't expose mailbox attributes for
 skip_pcode cases
Thread-Index: AQHcBuYfSZHmP3HhbEO+UUXJZEc5rbRVxyKAgAAMNwCAAAIMAA==
Date: Wed, 6 Aug 2025 16:46:05 +0000
Message-ID: <784543b394ee63647181463d56b45bb5a2dbd876.camel@intel.com>
References: <20250806152256.748057-1-raag.jadav@intel.com>
 <157ffa826b02292dc383ab444e1cb11b5b77093f.camel@intel.com>
 <aJOFFFXIx8ysMun2@black.igk.intel.com>
In-Reply-To: <aJOFFFXIx8ysMun2@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN6PR11MB8243:EE_
x-ms-office365-filtering-correlation-id: 35ad80ce-199f-44fb-7c03-08ddd508bc66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WlRVa0IzbFBUTUxnMERqYnY5R1dCSktCOE5NcklsRzZEeDg1M1kzd2tRUGhB?=
 =?utf-8?B?TU84Vyt6eUNrNnpkRHhFMjFScjZUMmlzczl1bWdDczlvZFJWWk9iR25WWlhV?=
 =?utf-8?B?NmlaRkppYzJXODFzekYyWTdiUmZJalNmV0ZseFFVQ2ZBY0hmTnZvc29neEw3?=
 =?utf-8?B?YWx6TTg2dWtKSXEvd0swRU0wTnRJYW52QmdnZU5DUlB1cGdXN2pkcWx5L25L?=
 =?utf-8?B?UXFlMnM0WTNCWm5UZnhnWUt4cVpMM0R4QnlnK0d5OEo0bGU5QjJGWUtmZ1BZ?=
 =?utf-8?B?WS81S3RuZ2FjYm5wd0JUeGNZSkkxdEJUMENIYzZ1TkNhclpPK3FUK0p6VW1B?=
 =?utf-8?B?TTlpTmFicmIrcUlIK1k2TzZXMWloOFAvUjFxeDNiNTlRZmh4WEg0d0QzQzZJ?=
 =?utf-8?B?Y0svcy9KTXZmR2xVUWY2Tjg1WTlURExJUzNORHozUUNsemZwUWdXa0FmTHhV?=
 =?utf-8?B?NS9xTGw0SU1KN3gwUm5lUmtCSmNJbmhPaUpwZE1GYTdYK1VuTFcrTTVLTHVW?=
 =?utf-8?B?WnVLQzNzbVAvcSt5Qm9xbXpaT01jRElyK1dZNUM5L2tyZkxhT0s3V09RbmJ5?=
 =?utf-8?B?RHN5RGtWUHQ1dnVCcWk5SGpBNEZZdmR6MzBMdkJBYTNUNG9GSVc2VWpEemxi?=
 =?utf-8?B?dGlqZXp3NkkrLzlQM0ZENnNpa1JwZmplYXN6cGkvMHorS2E5QVVtVHZxMTFk?=
 =?utf-8?B?OXFacXZjaVlXUGVjUmx3V0paQnFkdVZxdjJIWHVYZzJjckJWb2x0UGg2QUdF?=
 =?utf-8?B?NWsyeFhjVUVzNzVLU0lvQXlkMTRUbU00aWNybW42c2h3S1JiUDJPNzF0enBF?=
 =?utf-8?B?NEJuUU5mUHB5dUF2ZFFvNTZtT0R2c0ZHcExOdXpFL1pVMlRoUE56ekRVbW5L?=
 =?utf-8?B?SGkyWWhGMytaVlhMdjUwbjkrbUZFNllKUXhtTithMEJNeEloSFQwQTlvN3ln?=
 =?utf-8?B?UFZGYTRDZFdlMGF2bEp5TFIvbStlZzlxK2V1cEFxQ2krb1orUmZzYkhZWmxK?=
 =?utf-8?B?MFZqSndTRngvN3VCSDJDUGJjT2tCc2lQNUNBazMyZE9YZXdZUklMYUphUkJv?=
 =?utf-8?B?WU1SaG9LMnpHR3pBZHlkTmlDbTRpQmp4VFl0b3hLSE5maXRMdjlvOE1ZTWNZ?=
 =?utf-8?B?UEE0MEJUQ0MvUEp2MUZhbmFjY1I2MnhlN0Z0NEM5VE9FRHpZaG82STgrOUN5?=
 =?utf-8?B?alVwVG5DcFFSb3VRbEhkVndTemJsTytiQzl4VEh6cjkxMWx4bW4xVFRKYzV5?=
 =?utf-8?B?UCtQTTVKNjlXMG80L01peExuODBWamF4a2gxRWJKMEFCZWpMT0ZFWldJNkR2?=
 =?utf-8?B?TFlzSHZxOGpmYlpFalA1cHN4OXA0R2FVanNGTFNhNnd0OTA4eTJ1dkpZV0xL?=
 =?utf-8?B?aW5UaytWSWRDMHdTTnBjZ2tGV0tEY3pMNDA3TElKWC9VR1ZSZzZoZmdIcTQ3?=
 =?utf-8?B?Tkt1T0hYUlg1dXdZOGxZWGNtU2xSd1pMc0k5S04wZHNaZXBxTml3dERjWkQv?=
 =?utf-8?B?SlNQTkx2bVBPMVlpUjR6cytTSlkrVW11M3NQaUZNNzNFSlFOOUw3WXR2WmE5?=
 =?utf-8?B?S2lqaVN6TDhpS1A2TmtxQkJ4NGI5eEQxWVZqNmxlQmg3Y1ZBeU9aTU1kVXN3?=
 =?utf-8?B?VGpwdXFSdEJabVVKb0d4UWU1T1dBbHNsWEo0Y3cyaEdCUXZtMy96THFmQVVV?=
 =?utf-8?B?bTBnbVpVTXVUQ0NMWkxra0UxbHdGK1M4K3BhTUdBYkFSa040M3QvMTFTU3Aw?=
 =?utf-8?B?RjNKWVhpNmNnT2taWVI1Qy9SVW5ybi9qQUsxc3NXR3htYjVoS01yQk0rbUVw?=
 =?utf-8?B?YktIYnpSd0VsL09ZYjVwZHFZMEZ4bURvYWhoYVp6NDN5aEFSbzJKeGlJZ0Ja?=
 =?utf-8?B?RnpmZ2IxTzJQdHVpSWpuNDFhWDVnRVRzUlBVa09DTSs5Unp0cUIvTnZxV04v?=
 =?utf-8?B?MFBURjNZdnJ1U0ZQMWdpaXVKRkplUDR5SVpIYTIyNFE4VHgxNjFiMEdrQWxt?=
 =?utf-8?Q?yYroyhr0qmniP2Bg3sYgIZ0wCKDx4o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGQ3Zzh5RW5GUUF3WS9Gc0h2bTAzTGp3RHhKT0xYc3FxbmVsaXFVQ2YrSDhy?=
 =?utf-8?B?WXBKZ2dnWURkN1JZbFZoTmRubGsxWGoyRUJTVnh0NmNqc3lmektnMS9TYk9m?=
 =?utf-8?B?cDd5Vy9QVFRwK2NWR0dLUzM5ekcyNnYxdnVYYkpiRURlSzl5c0QrcE9VVzZq?=
 =?utf-8?B?V0NSTkNTM3psa3JvczRzWFJ6Tkx3N3pZd3pQRFRGWWxPMkcvcDlwZUR1YXJk?=
 =?utf-8?B?WHFHSHJ5MnRBeTJNa0VYa0lGRVdKRS9jbjFML3JqU0doSmh2d0JNWHduazZp?=
 =?utf-8?B?RjgrZVBFR0hMVG8xK0t0eEk1OHc2NG1MYldVazY1SkNmZGh1Wi9iWTZGU29w?=
 =?utf-8?B?VFp4dms1QTlJTUN3ODlCTGhzZVpTQkJvcXhnV1NHemsrWm5SVEkvcm1EWHdq?=
 =?utf-8?B?aVo4MDRiM0lQSDk2bmhEbnkrQ3pncEZudmt5TzNqZVIvalBQN09ETklkOXdr?=
 =?utf-8?B?Rk1hcXhQVXUrajhYVk0wbjUrbC9YQmZoSy9IU1JmeG1LWjRGQ2NvVWZJT01k?=
 =?utf-8?B?VERMUmxkMUNYMkxRc29rRGs1NVovOFY2NXNad1haNERCQTNCR2VkcnpIbU9n?=
 =?utf-8?B?Vjk1RkR4bjVFU1F1bk44M08vTHNEL01UdytWTjMyakI0MVErWVgycUZ4WWFm?=
 =?utf-8?B?anh0ZFZKRjVxTGEzQWN5RHA1VzhWMThuZ1ZXVXo5a0haTzczU21vRjM3Uldh?=
 =?utf-8?B?R09BNDRHdElLRUxmamVNdUVWWEg3WlhGbnJ1RGtlY1MvUDJDSWpOcnZURFRx?=
 =?utf-8?B?NWNVUGZJMXlxQU5sV1VLS2M2UTR6a0QxM2haQnk1MzlTR3piSGUyYWZwR0t6?=
 =?utf-8?B?dUUwdTlUekpSNlh0NHRrdGpZSGhnd0paaWs2RTZtT1F5OTI5NDFMai93NGRI?=
 =?utf-8?B?S0Rpa2xkSmJ5QmVwSFpudVo5dVd6TGV6WHExSmpOY3htWU9OOWpTcGdGYVVj?=
 =?utf-8?B?dkhuZmgwTmo2alpYM09uVU5IWjhGZ2wxR1Q2WGdsdTBUZTJZMzlLdHZXNHoy?=
 =?utf-8?B?U0ZldnZXSXVxQXBFUVZSNjRWR2pRU2pFMDZ4MzduQis4d0lqa2xxak5aQTZx?=
 =?utf-8?B?VnIyRzltVElpSFAwQ3JjVFVxaWcwTjMrY3ZhajBsb1p5QVRjT0hOU2Yyd01F?=
 =?utf-8?B?OTY3K3FrZWlFNHNXaVArbVNvdVdzb0R5NlNVYkpNK1cxMEpYaE9vUnI3TVgy?=
 =?utf-8?B?d0RUd01lNGdEcVFQajRsZGQ1T2lEWTUraVRZNXNaNThDeHBuUnJldjVBOS9Y?=
 =?utf-8?B?ZGNDWkVCaTkrWUxoRG9FOE13YTB2aWlDdkVUb3NXOENpRzV3d1hmQ1U0eEFo?=
 =?utf-8?B?RXBna0tRcE1rVE1wZlZFVnpIYVhzYTdjNjMxU0xDRFdBTlpjbXFRcXpkYjJH?=
 =?utf-8?B?cTNFSndYQ3RNUlBJdTBESTFIWHVzUGF6aDJMc3pjeXNUcllUem5MU2g4UkRJ?=
 =?utf-8?B?S2hrUTNiTmF4cllKNzg0TS83bS82SUM5NmFGTWtYamJNVFFFT2VzUko4aXZL?=
 =?utf-8?B?NDdkaXU1L0pRcnJ3Zk5QYzhLQ2JGVHF2WnJPVEtkNXZYOXFJcUpYY3lYYmh0?=
 =?utf-8?B?SUlpSlZwRjN2UHB1RS9BdVI5MGFVaXMwRFhzU3FNelJSV3VyS0pzNHFuMERJ?=
 =?utf-8?B?U2g1aTc1UlV0cGdsdkhHZC9CR0xNRkNCNkFwRnV6MEZiM01WY3JHTndvbVhK?=
 =?utf-8?B?ckFGUU9lWVk2bndlU3lDanRITWNKbUNuTTF1N3VhTjB5b3Nob2swNEhwbjJR?=
 =?utf-8?B?dXVxT3hUSGwrSGRVSkRzOUduRTVLUExuUFJ5ZDVHSlkrc3hoMU9wdDhqejRD?=
 =?utf-8?B?b0tsWlhkZDNXVEtFNXpUZXlOTFlZMndVY0VBL2x0TWJKa2t5dEtlWVJ4ZEdF?=
 =?utf-8?B?MGJtaVVLbXY1Tkw4WDFZY0FJUU5uMlVIVHJjclZSSlFpZFRTL1dPY2swVWNp?=
 =?utf-8?B?M0RybEdPMFhPdnJONndtcllKRURhQ08zcXZRakhxOUZBRDlQNFM2dGU0RWpH?=
 =?utf-8?B?Q1h6Q1J1bTUrVmJ0OE5BUExCTTdIaWxRT1FIM29RK3o5NjFDNmI0aDMweWo1?=
 =?utf-8?B?NlQ0Rld0eFg2TVowYTVyY2tIbjRUNlZ4cWZSUDRJZG5uRkZFUTBIRTVzSlZI?=
 =?utf-8?B?R2ladFdHZ0NBd2xsWkZSTWhDdTZQMDYvNTZXcDhSaFBGOW4vR21lVzl5NFV4?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10CACA7788C5454CA07D674C4BC8F30E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ad80ce-199f-44fb-7c03-08ddd508bc66
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 16:46:05.3426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATX7COefZYd6RRDJoNUqq33yaZUtZ6VpStxh2B94Vz2HR5uM/lI29b8o/ZMn9qvqHtjCvi3X2RQZHABwKyaFzUl7+1p6b+xI156nSvdm02I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
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

T24gV2VkLCAyMDI1LTA4LTA2IGF0IDE4OjM4ICswMjAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBXZWQsIEF1ZyAwNiwgMjAyNSBhdCAwOToyNTowM1BNICswNTMwLCBTdW1tZXJzLCBTdHVhcnQg
d3JvdGU6DQo+ID4gT24gV2VkLCAyMDI1LTA4LTA2IGF0IDIwOjUyICswNTMwLCBSYWFnIEphZGF2
IHdyb3RlOg0KPiA+ID4gQ29tbWl0IGE3Zjg3ZGVhYzIyOSAoImRybS94ZTogRGVmYXVsdCBhdXRv
X2xpbmtfZG93bmdyYWRlIHN0YXR1cw0KPiA+ID4gdG8NCj4gPiA+IGZhbHNlIikNCj4gPiA+IHRy
aWVkIHRvIGZpeCB0aGUgc2lkZSBlZmZlY3Qgb2YgeGVfcGNvZGVfcmVhZCgpIHJldHVybmluZw0K
PiA+ID4gc3VjY2Vzc2Z1bGx5DQo+ID4gPiB3aXRob3V0IHZhbGlkIGRhdGEtb3V0IHZhbHVlLiBT
aW5jZSB0aGlzIGlzIHRydWUgZm9yIGNhc2VzIHdoZXJlDQo+ID4gPiBza2lwX3Bjb2RlDQo+ID4g
PiBmbGFnIGlzIHNldCwgYSBtdWNoIHJvYnVzdCBmaXggd291bGQgYmUgdG8gbm90IGV4cG9zZSBt
YWlsYm94DQo+ID4gPiBhdHRyaWJ1dGVzDQo+ID4gPiBhdCBhbGwgZm9yIHN1Y2ggY2FzZXMuDQo+
ID4gPiANCj4gPiA+IHYyOiBDaGVjayBhZ2FpbnN0IHNraXBfcGNvZGUgKFN0dWFydCkNCj4gPiA+
IA0KPiA+ID4gRml4ZXM6IGE3Zjg3ZGVhYzIyOSAoImRybS94ZTogRGVmYXVsdCBhdXRvX2xpbmtf
ZG93bmdyYWRlIHN0YXR1cw0KPiA+ID4gdG8NCj4gPiA+IGZhbHNlIikNCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFJhYWcgSmFkYXYgPHJhYWcuamFkYXZAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYyB8IDcgKysrLS0tLQ0KPiA+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+
ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNm
cy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+ID4g
aW5kZXggYmQ5MDE1NzYxYWEwLi43NWI2Y2Q4MTZmYTggMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+ID4gQEAgLTI2NCw4ICsyNjQsNyBAQCBhdXRv
X2xpbmtfZG93bmdyYWRlX3N0YXR1c19zaG93KHN0cnVjdCBkZXZpY2UNCj4gPiA+ICpkZXYsIHN0
cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHQNCj4gPiA+IMKgew0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gcGRldl90b194ZV9kZXZpY2UocGRldik7
DQo+ID4gPiAtwqDCoMKgwqDCoMKgwqAvKiBkZWZhdWx0IHRoZSBhdXRvX2xpbmtfZG93bmdyYWRl
IHN0YXR1cyB0byAwICovDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqB1MzIgdmFsID0gMDsNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoHUzMiB2YWw7DQo+ID4gDQo+ID4gV2h5IGFyZSB3ZSBtYWtpbmcgdGhp
cyBjaGFuZ2UgYWdhaW4/IExvb2tpbmcgYXQgeGVfcGNvZGVfcmVhZCwNCj4gPiB3aGljaA0KPiA+
IGNhbGxzIHBjb2RlX21haWxib3hfcncgd2l0aCB0aGlzIHZhbHVlLCB0aGUgZmlyc3QgdGhpbmcg
d2UncmUgZG9pbmcNCj4gPiB3aXRoIHRoaXMgaXMgYSB3cml0ZToNCj4gPiB4ZV9tbWlvX3dyaXRl
MzIobW1pbywgUENPREVfREFUQTAsICpkYXRhMCk7DQo+ID4gDQo+ID4gVGhlcmUncyBubyBOVUxM
IGNoZWNrIGhlcmUgbGlrZSB3ZSBoYXZlIGZvciB0aGUgc2Vjb25kIHBhcmFtZXRlciBpbg0KPiA+
IHhlX3Bjb2RlX3JlYWQuIFNvIHdlIG5lZWQgc29tZSBpbml0aWFsIHZhbHVlIGhlcmUgc28gd2Ug
ZG9uJ3Qgd3JpdGUNCj4gPiBnYXJiYWdlLg0KPiANCj4gRGF0YS1pbiB2YWx1ZSBpcyBvbmx5IHJl
bGV2YW50IGZvciBtYWlsYm94ZXMgdGhhdCB1c2UgaXQuIFNvIHdpdGgNCj4gdGhlIGludHJvZHVj
dGlvbiBvZiBza2lwX3Bjb2RlIGZpeCBoZXJlLCBub3QgbXVjaCB1c2Ugb2YgcmVkdW5kYW50DQo+
IGluaXRpYWxpemF0aW9uLg0KDQpJIGFncmVlIHRoaXMgaXNuJ3QgdXNlZCB3aGVuIHdlIGhhdmUg
c2tpcF9wY29kZT10cnVlLCBidXQgaW4gdGhlDQpza2lwX3Bjb2RlPWZhbHNlIGNhc2UsIHdlIGFy
ZSBzdGlsbCBpbnN0YW50aWF0aW5nIHRoaXMgc3lzZnMgZW50cnkgYW5kDQphY2Nlc3NpbmcgdGhh
dCB3aWxsIGNhdXNlIHRoZSB3cml0ZSB0byBwY29kZSB3aXRoIHVuZGVmaW5lZCB2YWwgaGVyZS4N
Cg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IFJhYWcNCj4gDQo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgaW50IHJldDsNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfcG1fcnVudGlt
ZV9nZXQoeGUpOw0KPiA+ID4gQEAgLTI5MSw3ICsyOTAsNyBAQCBzdGF0aWMgdm9pZCB4ZV9kZXZp
Y2Vfc3lzZnNfZmluaSh2b2lkICphcmcpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlLT5k
M2NvbGQuY2FwYWJsZSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lz
ZnNfcmVtb3ZlX2ZpbGUoJnhlLT5kcm0uZGV2LT5rb2JqLA0KPiA+ID4gJmRldl9hdHRyX3ZyYW1f
ZDNjb2xkX3RocmVzaG9sZC5hdHRyKTsNCj4gPiA+IMKgDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBp
ZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSkgew0KPiA+ID4gK8KgwqDCoMKg
wqDCoMKgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UgJiYgIXhlLQ0KPiA+
ID4gPiBpbmZvLnNraXBfcGNvZGUpIHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgc3lzZnNfcmVtb3ZlX2ZpbGVzKCZ4ZS0+ZHJtLmRldi0+a29iaiwNCj4gPiA+IGF1dG9f
bGlua19kb3duZ3JhZGVfYXR0cnMpOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBsYXRlX2JpbmRfcmVtb3ZlX2ZpbGVzKHhlLT5kcm0uZGV2KTsNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqB9DQo+ID4gPiBAQCAtMzA4LDcgKzMwNyw3IEBAIGludCB4ZV9kZXZpY2Vfc3lzZnNf
aW5pdChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gPiAqeGUpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoH0NCj4gPiA+IMKgDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmluZm8u
cGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSkgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHhl
LT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UgJiYgIXhlLQ0KPiA+ID4gPiBpbmZvLnNr
aXBfcGNvZGUpIHsNCj4gPiANCj4gPiBUaGlzIHBhcnQgbG9va3MgZ29vZC4gV2UgaGF2ZSBza2lw
X3Bjb2RlIGluIHRoZSBwY29kZV9tYWlsYm94X3J3DQo+ID4gcm91dGluZSwgYnV0IHRoZXNlIGZp
bGVzIGFyZSBjaGVja2luZyB2YWx1ZXMgaGVyZSB0aGF0IGRvbid0IG1ha2UNCj4gPiBzZW5zZQ0K
PiA+IGlmIHdlIGFyZW4ndCByZWFkaW5nIHRoZW0uDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0
dWFydA0KPiA+IA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBz
eXNmc19jcmVhdGVfZmlsZXMoJmRldi0+a29iaiwNCj4gPiA+IGF1dG9fbGlua19kb3duZ3JhZGVf
YXR0cnMpOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQ0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIHJldDsNCj4gPiANCg0K
