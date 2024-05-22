Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDA7C25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 16:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A44610E1A7;
	Wed, 22 May 2024 16:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI6Qjczb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9022710E1A7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 16:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394433; x=1747930433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BobB2DqsKarfnC/8eYgd1urhF3+YA/a0ppnJtilKG2s=;
 b=gI6Qjczb+C4TyLAWDURSuyGTrKXAczrCyDjoBR3ooUDcd+cAnlloY9MI
 uEBGM7I57rJgOjoMl9nvwR+kwnbsPEDHUAOJaDwyPRSSZc14G/mRLA9ns
 IxBQby4pIwF42y9Wz6ErTR3r2QyDxEaWAwzGSUoUhlatYDIKV3p3q46t5
 +mg2ULHhxdFj6LmeXGVeAaISqxsee75XH45tq6agVNWrft8gKhBscn+y3
 vRwOrrcokTg8PssX9gIGfoE9cbbQwfwv7GA6H6mWCjKdXTOJ8BzcHDdu1
 zpBDHbH5ZPgLWuccYzuqGccTQLFQcqs0/wR/+2Onegwcgt5LktlbnAK5V w==;
X-CSE-ConnectionGUID: D6FAx8kAQsS2j8ylcaNJpg==
X-CSE-MsgGUID: Q02hx3pOSSGY2D/LaNwNWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24063912"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="24063912"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:13:52 -0700
X-CSE-ConnectionGUID: KcmArep0Rl+2YMSwWlJ2Dg==
X-CSE-MsgGUID: FcXgVC1jQAKvng33yOUScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33335749"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:13:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:13:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:13:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+6mgu2a4zjukdaEHTUEqZ6NuLmIcdMT6ZHl2wpgB1/tPrSnoLs/IVE3q5QGDbidDkOtFe/crMo8GuE4iEwa+NQqCt3tnEfIl0Bl8f1uU05L1fKnWIUvlDbgPBhGfPe+7GSA5CDIlIJ3O0TvXcZsY0Wg0mRaMu5x35PxuaUJv6v64RWLmuaAO9JVJKE+uuYoFf/lE4Fgn97HoQIlYkhJfa7wC6D2R0eKEqVEVWjC3OsOn7vKH1BrfveAij+H4RbOAHMJTyZtCYrhIIimiO+eJSUuc7TlXnzwnf0lDswuLm7F45j8LxrAOc2FwK4vLsqtnPvPFzsHZjcOTZ6bKzAHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BobB2DqsKarfnC/8eYgd1urhF3+YA/a0ppnJtilKG2s=;
 b=jBPW8R/WoelHN+EvlJcbQAjY3m9DPR7qkPONXuhk/Q3k3HrOYvCeKlrOOQzm4+RDRNUUS2Bf/+CPy8gMzEyvUu+4YcCE7ss8lz8YVbxmp7/K9RDlNjgjhZkSpJV14A+MaQ34uzO8bjDx/Io4twDoHYNxyh7SVmyY6bQHJ4+kRZKgYEYM5LO2UIS6DqXf7K+0D/ZmyDJ0wg8/xVels6y4lucGS8UBKs3RfwLY50aCWZp12FhTaL/rQGN9P7/hPuf+3MlJYxix7vrZAL/m1h4+zL8RAWcTo4/f9icL+ZMWOY59tQMv1JD9kc6ZmDboPCL3uA/D9f421oI6vjUnQ4RvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 16:13:48 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Wed, 22 May 2024
 16:13:48 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AIAAAUuAgAAW/ICAAAV7AIAAzM2AgADBDIA=
Date: Wed, 22 May 2024 16:13:48 +0000
Message-ID: <9657eea004738e979978e4790c310bb1489b793a.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
 <438b276a653bf56fe1e0e131709d615dec86ae3e.camel@intel.com>
 <87frufuc96.wl-ashutosh.dixit@intel.com>
 <96d03111d07e8182e7ecb3c0ca1942c7fef22e6f.camel@intel.com>
 <595ea35d63cd92777b36f6ab87cd1f6483a4b38f.camel@intel.com>
 <851q5v2ljw.wl-ashutosh.dixit@intel.com>
 <8f86d8ea1d555e8261aab25bda0011ff96698522.camel@intel.com>
 <85v8361mpi.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85v8361mpi.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB5873:EE_
x-ms-office365-filtering-correlation-id: f4f0d571-f1e5-4015-9d7a-08dc7a7a29bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NXhxaXRSKzVzbUNQQ0k0Q1JFK3ZhejRjY0F6c0p5YVNUeHVIbkZvS1d6RUtU?=
 =?utf-8?B?L1cxZGNRY3dZQ1pOSktPbVh4MmsxT244aEU5SkR4OU0xTU1HQnlNNU5HS2tH?=
 =?utf-8?B?Vng5SERBQVBhdnA2Y0Z3NVdRdDl3VzhBWjhsV2FPamh1eU10TWZ0YW1yUHEr?=
 =?utf-8?B?Y0ZmVHhkMUpIYnpJVzZYYnB0akoxUno5NUw0QmdSVzlPSjIzSTllRS8ySnBO?=
 =?utf-8?B?K1NTZnhLWGVjZkpqUmZsMkpwelFrT3VLdFRvZW1XdnZqbm9tV3ZkalRrRUtv?=
 =?utf-8?B?a20yVHk5cU1sMUdFS2NpNWdBVGZ6QVZPQzJQaHVRbjNIUlNSaWVyeXpSQ0FL?=
 =?utf-8?B?aFV1VlNmWGlUMDBoNHd2WngwbWtSckVEbUl1TVpRdEV0ZkJ0K2Y0SzdCWVdu?=
 =?utf-8?B?dHVhbFhNN1dBZmZVakE4L094bHphY0RpOFhEK3pMaFo3a2lCRTlHMjNDUW1r?=
 =?utf-8?B?OWVhMFdkQVN4bk1aN2tPc1U2UVZYNVhoL1p0U1VCQm1RaDY2K0tMaFZZb21N?=
 =?utf-8?B?OGhYbjlFWXY5ZUplM2pYSjZCV1RWcFlDWEY3RzNuSnRWeUgyd2FKL1ZDV3M5?=
 =?utf-8?B?a0hhaGpSUHZiQkJwdEpUbjFjYWJiV21OUlVxcmlFenN0d3RMVG5FZ0hnZ05L?=
 =?utf-8?B?bFBpZ2VwZXhBWmdyM0I0WnhtbGUvUlpoUk1ua3dtMi9KVHJsY0g4OFhLV3Jq?=
 =?utf-8?B?UTY2QkVmRUcva3ZtQlN2STBvVmpycXdNaXpINzMrazVySjlQdHM0T1ZQSWVB?=
 =?utf-8?B?cTd2R0EvZ004aE9qYkZFUnBTRW5GaC9zc0Y2cklmNDBUNHZvN2h5Y2xUVytt?=
 =?utf-8?B?bUtoSHpBeDZjeTlhd0p0UnIxOCt2djlnWS9XRXBVZ05OV1FGYURhTGdWVEhj?=
 =?utf-8?B?dytycUhjb2k0b3pWSlF3TDJaMUppQ005WUI3NlBUUm9rczJvU2xnSi9Qcmp5?=
 =?utf-8?B?M3Ewa1JEamtaSmprSEdYU21tNm8zeS9KOWNYQ0tGUU9QWXJtUVIrbTI1WUc1?=
 =?utf-8?B?bjlhVW9sY0tsUFJhdy9CV05LamFWSEFiT1A5dmZFQTd5VSs4L1dnUWw2VWEv?=
 =?utf-8?B?dndCUVNTNTVjenBJTE5EdEFTMHlESnU5bkpkNWZqcThYemYxbE9IRmk3RFBI?=
 =?utf-8?B?Y1ZFcGwwRkpKaUJWWDhjUVlrY01HTS9NQ3NYVlhYU29ObTE0dXN3TWR4bkk2?=
 =?utf-8?B?ZU1hOHBiNk5PdnlLZENSK2dURGprMjVoMkxhRTdrYnF0MkVFOTNDT0FxcThs?=
 =?utf-8?B?U1JrM0tQS2sxN0VTZ3c2RndqMHp5ODlOMTNLL0FoRWprNVRuMkh3VHhWbDZl?=
 =?utf-8?B?WUNCWlBZUkF2OUFvVCtRNFE2KzU1bWROMFFBSVQ0S09vQTkrNmZWeUZ0K0xZ?=
 =?utf-8?B?NUlJTzlrMk9NdGJ1MGlXcTZ5eTJpdG4vdGdHYXpBNTVLUUZ1SWFoNnhMS3lz?=
 =?utf-8?B?VXNESVdvbHVId2d4MkZwVzdvb1UxSE5GczBsYzhCM2RBSGdpNUo2UUZadWw3?=
 =?utf-8?B?U2owamJwMStlellseWZWZmo0d2tDdmJzZU1OYU9aNmhEWUcyWjVIVGl3TTE1?=
 =?utf-8?B?SWFhdlRYdFRQd0gyVUhJV1Nzei9hUldtcTNWeGJLc3h6dndFdUFDN1RXb24r?=
 =?utf-8?B?aEFOc1FJak9Qc3RiMFBpWmZGTUxVM1NIQ0lpUXFhSVN3Q1ptZE1XdE9VVDJ4?=
 =?utf-8?B?SllzdzM3QkU5RloxRDZ3QTlIMGdncjRHRjZaUC9zOVVyYWowRSs3YkZwWERN?=
 =?utf-8?B?NW9jeFBDSTBRRzNCVEpZVlR1eHJrYXNnQjBtdzZHL2RoNFlCMHRWcmxIaW1Y?=
 =?utf-8?B?eTF2aHMrWUN2UDJJcHl6Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnJpRDdseVlTR215UUNiZDlIdEI3OFNrY1lBQklUTDUzSHB1WUNyT3NQNzMv?=
 =?utf-8?B?ZWE3WUZVRFlKSmVlZ3VVZjlobmR1a01JRGtKVE5UM3UwS20xRVYzRVN3R0FU?=
 =?utf-8?B?VFBCdkYwNndMbk1iQ3FqT1pSZWNuQWErcC8rT2xJZS9MM0NtR3gwRHNTTk9Q?=
 =?utf-8?B?eEdXaUoyVzJKMUJhbDRMUTZ0TFdCb09XS205dHJpbkg3R0dpN2tqbnIrRjA2?=
 =?utf-8?B?WWJRYmRFSGs0cEx0Y2ZzUmM5ZGRzVTVkT2M4WTBqcDB5M1E5TkF3cXlxTjUr?=
 =?utf-8?B?VmtnRzUvdlQrUHBYSitET2pBQTVsZ2ZLMWQ0ZElDTzBuR1hpQlBNMFlXb3NW?=
 =?utf-8?B?bmtCNEtaWFhFQnRJdVAzUmp1b0FqcVlueVJudUd1dE05UE1TYlNWRVZKRHNz?=
 =?utf-8?B?RVI2ek1xVGVrRFYzYWU2RG9JNTZ0cmQ2OFkvZThVVGVBMjByckRDOHZYOGRs?=
 =?utf-8?B?MktDM210c3NjZmc5RHoxek9KMENmanRncFFCazgwYUEyMnJ1MVNzd1l4WVdw?=
 =?utf-8?B?cWhjVlJCT0JvR3hhRmVLSnN5SEZ0WHZrQWVQQXhzSmM2NmkrRHBWOS9nR2Yw?=
 =?utf-8?B?dmUyT1NjeDlkU0ZEYnJzeU5TNkNnWUUyZHhJS0F6aW5zYVBhNjhXT3l6TlR0?=
 =?utf-8?B?aDRaNy9qczlkM0hLUkQ1VDZxRTZkNS9hOTVWUXQ4cTE2MkQ3VlJvZHZGc1Ey?=
 =?utf-8?B?SWs1eVovK1FBSHN5aGliQ0VwUXV2N1dKbnUzMW9jYWVmQmdYN3NYdFVGZita?=
 =?utf-8?B?NUh5bFdaSmRqanBDcDNxMC9kTjJhQ09Jc3VLQ3pIaHltYSs5U1pCVXMzNndr?=
 =?utf-8?B?Vjh6QWQ1M1JOSUFINi9hdG56VDExK1hKWE1BcEhRY3lSQ2VMZGVaR01YaDRh?=
 =?utf-8?B?ZDh3U1h4UTFBMWhvM1hKakluNXgyNlI5dUxSZG5XZFRMSEJGYVNkcW1MVG5w?=
 =?utf-8?B?OHZzekxvNnBmZWl1Z0JyUWF4UmVsQjZTM1ovK2Q5ZENhVzZPQmJ0c3BJbFZ2?=
 =?utf-8?B?LzgxOWFFUDRSay83SzI1NzFRd1JHMlltMlNCR3M3cmhKaGl0TTlCRzJ2YndQ?=
 =?utf-8?B?NEZhNEdpRktlSTY1OTh1MHRCN3ZCa05CQjRySE5MWm81aDJ0anpyQk5UdWVi?=
 =?utf-8?B?Y1hMUGwyQnR4MlFCeFdkeDA3R0VzQkhRRjlrdGdZblNXNUJSYWQvYWIxc3kr?=
 =?utf-8?B?TWxvVm5UTFZJRXd3OCtaOVJDbm1BYXVlQXlhNVNZQ1J0L2pOczBaejJkQXVu?=
 =?utf-8?B?dXk5SG8rTWpqbGpKTFBiMVl2dGU1OUpmNko5RHJ1aVIzTFZqUXVKZHlUekxn?=
 =?utf-8?B?K0tvVGtwdGtXUmZHdFJIaUcwbERMMjFEckl2M01ITysxL2pMeWhKM241ZXRM?=
 =?utf-8?B?Y0tBV2Z1aEZyR1dHT2lkZ2NPRFJ0U1AyYnhkL1VpWlFsdzlIeGdXdEJQeHQr?=
 =?utf-8?B?N01FQ0tJUW9TaGZLQjQ0NmZiQTJCc0F1ck9yNGk5TGlFckEramNCZDVYcXZU?=
 =?utf-8?B?YzZ4R3dycDFta25rNUFQV2JxTFd5QzgxUHBDMkt2dXA3NFFQM09hZ1Fhdjh0?=
 =?utf-8?B?ZnRmM1VQRTJkbS9qY2srWFlxaWpSb2VneG9xcWhUZVVqWEQwTStBTG5IbDN3?=
 =?utf-8?B?L3RIQlNsVHRSMUpnUHlmaXBWVUpaTTRSY29RU0M0TWRUenRMcHlwMUw5RDYz?=
 =?utf-8?B?T2FhSSszRUtKazk3T1lKeG0wQ1FGMTNidW1XOUNQSWJUenVBV0tKdlRka3l1?=
 =?utf-8?B?QWRUeGg1ekVFK3MzRFlYcG5jQ0dROGM0akJGMTJSVnVxd0Y5S081ckp3SG9y?=
 =?utf-8?B?VVRsR3JwVzd4c0hXMU1KanRFL1FhSkdLelhzNnkrd3VVUUNTUGlQTVRXZlNP?=
 =?utf-8?B?YXRia0h5QUFaTk5QQnFHcy9yeUFWQ0wvNUFyRjU5aXVMMm01NG9XakZHc2FF?=
 =?utf-8?B?NUFHSG1TanVKUFNUamFQMXJ0dGdxYWV1eTQwTlBmOHRwdFNtMUNmTkw0a1Zm?=
 =?utf-8?B?UFdqWjdJZzVWdnhxb1czV3NBQlFZVVJXc0ZETUs3Z1lnM2c1bjV2Mys0VnFo?=
 =?utf-8?B?d0dFT092c1FWSnQvcERKcWcrVW16aWRxakFvbnFZcG5lU1lqOXJXNUVuTmwv?=
 =?utf-8?B?NXZ2VFVtTHQ2dWdUS0dqSHJMYVYvQWVEY1hEMVJqY0V1bS8zdjRTclpTem9U?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFDEDC3FA823D14798E2B717AB17A444@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f0d571-f1e5-4015-9d7a-08dc7a7a29bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 16:13:48.4456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYckPzJBeZYW+2xQfgZIpGpImr55wWW2uR8Xfig9RZBlk1W7nqBsl67q4rMK30st2fi0UeMmHZVE3vtK0LcsWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

T24gVHVlLCAyMDI0LTA1LTIxIGF0IDIxOjQyIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMjEgTWF5IDIwMjQgMDk6Mjk6NTEgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyNC0wNS0yMSBhdCAwOToxMCAtMDcwMCwgRGl4aXQsIEFz
aHV0b3NoIHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMSBNYXkgMjAyNCAwNzo0Nzo1OCAtMDcwMCwg
U291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiANCj4gPiA+IEhpIEpvc2UsDQo+ID4gPiANCj4gPiA+
ID4gPiBPdGhlciBhc2ssIGNhbiB5b3UgcmVtb3ZlIHRoaXMgJ0ZhaWxlZCB0byByZW1vdmUgdW5r
bm93biBPQSBjb25maWcnDQo+ID4gPiA+ID4gZGVidWcgbWVzc2FnZSBmcm9tIHhlX29hX3JlbW92
ZV9jb25maWdfaW9jdGwoKT8NCj4gPiA+ID4gDQo+ID4gPiA+IE1pc3NlZCAnSW5zdWZmaWNpZW50
IHByaXZpbGVnZXMgdG8gcmVtb3ZlIHhlIE9BIGNvbmZpZycsIHRoYXQgbmVlZCB0byBiZQ0KPiA+
ID4gPiByZW1vdmVkIHRvbyBmcm9tIHhlX29hX3JlbW92ZV9jb25maWdfaW9jdGwoKS4NCj4gPiA+
ID4gDQo+ID4gPiA+ID4gTWVzYSB3aWxsIGJlIHVzaW5nIERSTV9YRV9QRVJGX09QX1JFTU9WRV9D
T05GSUcgd2l0aCBjb25maWcgaWQgc2V0IHRvDQo+ID4gPiA+ID4gVUlOVDY0X01BWCB0byBkZXRl
Y3QgaWYgWGUgS01EIHN1cHBvcnRzIE9BIGNvdW50ZXJzIGFuZCBpZiBhcHBsaWNhdGlvbg0KPiA+
ID4gPiA+IGhhcyBlbm91Z2ggcGVybWlzc2lvbnMgdG8gdXNlIGl0LiAgU28gaXQgY2F1c2VzIGRt
ZXNnIHRvIGJlIGZsb29kZWQNCj4gPiA+ID4gPiB3aXRoICd4ZSAwMDAwOjAwOjAyLjA6IFtkcm06
eGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCBbeGVdXSBGYWlsZWQgdG8NCj4gPiA+ID4gPiByZW1v
dmUgdW5rbm93biBPQSBjb25maWcnIG1lc3NhZ2VzIHdoZW4gcnVubmluZyB0ZXN0cyBzdWl0ZXMu
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbiBv
ZiB1QVBJIHRoYXQgSSBjYW4gdXNlLg0KPiANCj4gQWxzbywgdG8gcmV0dXJuIHRvIHRoZSBvcmln
aW5hbCBpc3N1ZSwgd2hhdCBleGFjdGx5IGlzIHRoZSBpc3N1ZSBpZiBkbWVzZw0KPiBpcyBnZXR0
aW5nIGZsb29kZWQgd2hlbiBydW5pbmcgdGVzdHM/IE1heWJlIGl0J3Mgb2s/IE9yIGlmIGl0IGlz
IG5vdCwgd2h5DQo+IGRvbid0IHlvdSB0dXJuIG9mZiBwYXJ0aWN1bGFyIGRlYnVnIG1lc3NhZ2Vz
IHVzaW5nDQo+IC9zeXMvbW9kdWxlL2RybS9wYXJhbWV0ZXJzL2RlYnVnPw0KDQpLTUQgbG9ncyBh
cmUgYWxzbyBpbXBvcnRhbnQgZm9yIFVNRCBkZWJ1Zy4NCg0KPiANCj4gU28gYmFzaWNhbGx5IEkg
ZG9uJ3Qgd2FudCB0byB0ZWxsIHlvdSB3aGF0IHRvIGRvIG9yIGhvdyB0byBpbXBsZW1lbnQgeW91
cg0KPiBzdHVmZiAoYXMgbG9uZyBhcyB5b3UgcmVjaXByb2NhbGx5IGRvbid0IGFzayB1cyB0byBt
YWtlIGNoYW5nZXMNCj4gZWl0aGVyKS4gVGhlIFhlIHVhcGkgaXMgZXhwb3NlZCBhbmQgdXNlcnNw
YWNlIGlmIGZyZWUgdG8gdXNlIGl0IGhvd2V2ZXINCj4gdGhleSB3YW50Lg0KPiANCj4gU28gYW55
d2F5LCB0aGUgZGlzY3Vzc2lvbiBpbiB0aGlzIHRocmVhZCBoYXMgY29tZSB1cCB3aXRoIGEgZmV3
IG9wdGlvbnMsDQo+IHdoaWNoIEkgY2FuIHF1aWNrbHkgc3VtbWFyaXplIGhlcmU6DQo+IA0KPiAq
IExpdmUgd2l0aCB0aGUgZGVidWcgbWVzc2FnZXMNCj4gKiBUdXJuIGRlYnVnIG1lc3NhZ2VzIG9m
ZiB3aXRoIC9zeXMvbW9kdWxlL2RybS9wYXJhbWV0ZXJzL2RlYnVnDQo+ICogUXVlcnkgdGhlIE9T
IGZvciBwcm9jZXNzIGNhcGFiaWxpdGllcyBvciBwcml2aWxlZ2VzDQo+ICogUmVmYWN0b3IgdGhl
IGNvZGUgdG8gbm90IG5lZWQgb2FfbWV0cmljc19hdmFpbGFibGUoKQ0KPiAqIEFueXRoaW5nIGVs
c2U/IEFub3RoZXIgaWRlYSBlLmcuIGlzIHRvIGV2ZW50dWFsbHkgY29udmVydCBkZWJ1ZyBtZXNz
YWdlcw0KPiAgIGludG8gZHluYW1pYyBkZWJ1ZyB3aGljaCBjYW4gYmUgY29udHJvbGxlZCBhdCBs
b3dlciBncmFudWxhcml0eSBpaXJjIChzbw0KPiAgIGUuZy4geW91IGNhbiB0dXJuIG9mZiBPQSBk
ZWJ1ZyBtZXNzYWdlcyBvbmx5IGJ1dCB0aGlzIG5lZWRzIHNvbWUgd29yaykuDQoNCkkgZG9uJ3Qg
dGhpbmsgSSdtIGFza2luZyBtdWNoLCBJIGp1c3QgYXNraW5nIHRvIHJlbW92ZSAyIGRlYnVnIG1l
c3NhZ2VzIHRvIGltcGxlbWVudCBpdCBpbiBhIFVuaXggcG9ydGFibGUgd2F5IHRoYXQgc3VwcG9y
dHMgYm90aCBjYXBhYmlsaXRpZXMuDQoNCj4gDQo+IFNvIGxldCdzIHNlZSB3aGVyZSB0aGlzIGdv
ZXMgOikNCj4gDQo+IFRoYW5rcy4NCj4gLS0NCj4gQXNodXRvc2gNCj4gDQo+IA0KPiA+ID4gDQo+
ID4gPiBPSywgc28geW91IGFyZSByZWx5aW5nIG9uIEVOT0RFViBhbmQgRUFDQ0VTIGVycm5vJ3Mg
ZnJvbQ0KPiA+ID4gRFJNX1hFX1BFUkZfT1BfUkVNT1ZFX0NPTkZJRyB0byBmaW5kIG91dCAoYSkg
aWYgT0EgaXMgcHJlc2VudCBhbmQgKGIpIGlmDQo+ID4gPiB5b3UgbmVlZCB0byBiZSByb290IChh
Y3R1YWxseSBDQVBfUEVSRk1PTiBvciBDQVBfU1lTX0FETUlOKS4NCj4gPiANCj4gPiB5ZXANCj4g
PiANCj4gPiA+IA0KPiA+ID4gVGhpcyBsb2dpYyBpbiBYZSBzaG91bGQgYmUgY2xvc2UgdG8gd2hh
dCB3ZSBoYXZlIGluIGk5MTU/IFdoYXQgZG9lcyBNZXNhIGRvDQo+ID4gPiBmb3IgaTkxNSwgb3Ig
d2hhdCBkb2Vzbid0IHdvcmsgaW4gWGU/DQo+ID4gPiANCj4gPiA+IEhlcmUgYXJlIHNvbWUgcG9p
bnRlcnM6DQo+ID4gPiANCj4gPiA+ICogWW91IGNhbiBleGVjdXRlIERSTV9YRV9ERVZJQ0VfUVVF
UllfT0FfVU5JVFMgdG8gc2VlIGlmIE9BIGlzIHByZXNlbnQNCj4gPiA+IA0KPiA+ID4gKiBBZGQv
cmVtb3ZlIE9BIGNvbmZpZ3MgYW5kIHVzaW5nIHRoZSBnbG9iYWwgT0FHIGJ1ZmZlciAodGltZSBi
YXNlZA0KPiA+ID4gICBzYW1wbGluZyBvciBEUk1fWEVfT0FfUFJPUEVSVFlfU0FNUExFX09BIHNl
dCkgYXJlIHByaXZpbGlnZWQgb3BlcmF0aW9ucw0KPiA+ID4gICAobmVlZCByb290KS4gT3BlcmF0
aW9ucyB3aGljaCBvbmx5IG5lZWQgT0FSL09BQyAoT0EgcXVlcmllcywgd2l0aG91dA0KPiA+ID4g
ICBEUk1fWEVfT0FfUFJPUEVSVFlfU0FNUExFX09BKSBjYW4gYmUgZXhlY3V0ZWQgYnkgbm9uLXJv
b3QuDQo+ID4gPiANCj4gPiA+ICogSWYgIi9wcm9jL3N5cy9kZXYveGUvcGVyZl9zdHJlYW1fcGFy
YW5vaWQiIGlzIDAsIGFsbCBvcGVyYXRpb25zIGNhbiBiZQ0KPiA+ID4gICBleGVjdXRlZCBieSBu
b24tcm9vdCB1c2Vycy4gT3RoZXJ3aXNlLCBhcyBJIGRlc2NyaWJlZCBpbiB0aGUgcHJldmlvdXMN
Cj4gPiA+ICAgcG9pbnQuDQo+ID4gDQo+ID4gSXQgaXMgcG9zc2libGUgdGhhdCBwcm9jZXNzIG5v
dCBzdGFydGVkIGJ5IHJvb3QgaGFzIENBUF9QRVJGTU9OOg0KPiA+IA0KPiA+ICJVbnByaXZpbGVn
ZWQgcHJvY2Vzc2VzIHdpdGggZW5hYmxlZCBDQVBfUEVSRk1PTiBjYXBhYmlsaXR5IGFyZSB0cmVh
dGVkDQo+ID4gYXMgcHJpdmlsZWdlZCBwcm9jZXNzZXMgd2l0aCByZXNwZWN0IHRvIHBlcmZfZXZl
bnRzIHBlcmZvcm1hbmNlDQo+ID4gbW9uaXRvcmluZyBhbmQgb2JzZXJ2YWJpbGl0eSBvcGVyYXRp
b25zLC4uLiINCj4gPiANCj4gPiBBbmQgZnJvbSB3aGF0IEkgdW5kZXJzdG9vZCBvbmx5IHJvb3Qg
Y2FuIHdyaXRlIHRvIHBlcmZfc3RyZWFtX3BhcmFub2lkLCBzbyBJIGRvbid0IHNlZSBhIHBvaW50
IGluIGhhdmluZyB0aGlzIGZpbGUuLi4NCj4gPiANCj4gPiA+IA0KPiA+ID4gU28gYmFzaWNhbGx5
IEkgdGhpbmsgeW91IGp1c3QgbmVlZCB0byBjaGVjayBmb3IgdGhlIHBlcmZfc3RyZWFtX3BhcmFu
b2lkDQo+ID4gPiBmaWxlIGFib3ZlLiBJdCB3aWxsIHRlbGwgeW91IGJvdGggKGEpIGlmIE9BIGlz
IHByZXNlbnQgKGJlY2F1c2Ugd2UgYXJlDQo+ID4gPiBnb2luZyB0byBtZXJnZSB0aGUgY29kZSB3
aGljaCBjcmVhdGVzIHRoaXMgZmlsZSB0b2dldGhlciB3aXRoIE9BKSBhbmQgKGIpDQo+ID4gPiBp
ZiB5b3UgbmVlZCB0byBiZSByb290IGZvciBwYXJ0aWN1bGFyIG9wZXJhdGlvbnMuDQo+ID4gPiAN
Cj4gPiA+IFRoYW5rcy4NCj4gPiA+IC0tDQo+ID4gPiBBc2h1dG9zaA0KPiA+IA0KDQo=
