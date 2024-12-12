Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A67E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 20:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6A610EE94;
	Thu, 12 Dec 2024 20:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtCB3gFb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B24A10EE94
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734035480; x=1765571480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tBmSBrX/XL0yG/LoTXjiA2rX1hJax5QA/Ht/NQCXl9A=;
 b=VtCB3gFb1fuBPfAM1IinzYqs7Z42k7LBTStGXNTzkp2Q2PehgRQEgShX
 lq7jxE+VEpVvvwR1003fhcQkfkvSRUjQKUlBkhpDE8eN592GyOm8l2SQT
 Lt3QpLMJRGRddHspiKuRehe3Er16enjLgUz95t3dPsJyLnd7YHDCNIs1l
 0bqbJCG7aS9iPEeh4nc05e2rmJZBAXfNNzrRqC0pTGhAIxR6IKLCy3TVE
 VNQQPHTF920d3KZXL4poMXcqi7sbq3CK+4U5Qd6My/IjAXeEH4maBiFIJ
 btmxkqIjONfmb2yKXjwpZsoC7OD1+YhSl8hP8O9F+VPqrlzHG/7CyUJ5Z w==;
X-CSE-ConnectionGUID: kruT1Q3qRAeXg917yl6znA==
X-CSE-MsgGUID: eAU5PSqHRCyVL4xyuE2SOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34202361"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34202361"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 12:31:18 -0800
X-CSE-ConnectionGUID: r9JCKxrmTLiTHmrkg84xlQ==
X-CSE-MsgGUID: N892pUP5SAu1YSyOpEzOfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96181320"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 12:31:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 12:31:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 12:31:18 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 12:31:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riV3lst5Xu5T1KlaLtElm0AZFO+XjaQAnbHgbDB0MmYsGcUdQTZZfaUvpcCaJV+iIreHVdkRdicosL/k73xZjyxYXuA8lBww3WMcNcxzNU+iOz/NW6HOsIICd8JzLstt2mGcH3hSvfuApbiIhYl4u2sTE1U+foJn1Tbs7vO0ZN47R6tx7JYjmhBk/CCo4+oRTOtyPGkdJaJgCpFcJ0wYv29K8tn5uAiOOVix1Gwwq/uce33jZCowJm3Z64skTCIH8j2jpSGPZXF2j6EMKtZIDVbjsFOw6nYwA+R/zlyt8rH7XZ46UQ16hIh+sK73CXTCfMxgk7SUbJoaXqDk1s8UUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBmSBrX/XL0yG/LoTXjiA2rX1hJax5QA/Ht/NQCXl9A=;
 b=QR21WgPHq0NrxvuuMoUHBPEjmkvMwMThe8dbU9tUubW1X//X32FlzUpnlSF3RKkeAEle0mLAi6zlAM3DgVpjWdMGtt2gnFIrupHbWZWWTyD2EE+Nw1aSeoLFCUodvAvJdqmUXZ7FkMWc31922T478wxf9ZLgPKgwfuBOmd4uR+9Fs51unaOWtckyEMp9TTu/JtcX9854OF3Ix4T5IoxQuICTB/Tp/rA+iPqNMZqNwxq98xl+dFuZ1fitP9geeaUQUFlbosg0OCsQTaJZspzC8LunnD50tkX4hj8M9yMrg2ciKSwsOocARaVOGEMLVDvuaN6kQgOVhpg1hspYi6Fb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by BL1PR11MB6003.namprd11.prod.outlook.com (2603:10b6:208:387::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 20:30:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 20:30:59 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings and
 add tile info
Thread-Topic: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings
 and add tile info
Thread-Index: AQHbFS22wULV4kwY+0uYXcAdod4eerLjWfGAgAALqYCAAAj2gIAACbuAgAAG1wA=
Date: Thu, 12 Dec 2024 20:30:59 +0000
Message-ID: <2e25469bbaab8d1ee3d70b1bbbf295faa6220dd8.camel@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-4-John.C.Harrison@Intel.com>
 <ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com>
 <1cd79769-73cc-4b4b-bac6-c03e6aec0d69@intel.com>
 <0825f33b47eaddf533bb378325b89202a43e34f3.camel@intel.com>
 <ea46ec11-b7a5-4103-8fdb-493e2489a688@intel.com>
In-Reply-To: <ea46ec11-b7a5-4103-8fdb-493e2489a688@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|BL1PR11MB6003:EE_
x-ms-office365-filtering-correlation-id: 84819955-d7b5-4059-a3f5-08dd1aebe395
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SVBoU1NIT2ZBeDZhNDNwNXpJSHpSL0EyeWFNM2Rzb3ozcTBWWUExRVZlMy9N?=
 =?utf-8?B?Ymo1WUpuTjRWYXd6RDJpMFRwN3ArcDVRSWlWVDFiRERaMytSRWRHRzNid0FE?=
 =?utf-8?B?N2lIWVFkb1Yyd2dtbGRLR3czSG1yS1pFemhoOUxITVNjRnI3TUZwRGtGRU5B?=
 =?utf-8?B?djZMeHl5OWVVTGdyQ0g0UWFHRVYvUjcvQ2JIOEdpK3c3UVVzWUV4b0MwTjZj?=
 =?utf-8?B?NVl2RWJBSHdhbFprQUliMlNocU1NM3VkT0hPd2xwTmJlbGJReVJnR3Y4NERw?=
 =?utf-8?B?V3lCMEt0VTZXeUVwdWxGQmZ5UmN2TVJqQi8xeFhaN0RZMWJPRFNOTVhsc3NO?=
 =?utf-8?B?NXl4KzBvdDNlNEw5YXFhczZya3Y3cEZWS3RHM1BJKzF0UVUrcTZJa3B4T0lm?=
 =?utf-8?B?L3VYSFZlOVc0WWo2S2FodG9WazkwbzMvV0Z0RjNIZGlKNDNlL296dXRLYk42?=
 =?utf-8?B?aHltTFpxSkNtZkJnZU9pazJWYVR5SGQ1WnB6RTFXbGZNcDhucnNOdXBNdVB6?=
 =?utf-8?B?bFFlOWpyd0VSSkJsM21nL0RkTERTZ0sxRmoxdTZ1ZDdKWUJFWUlVZCtHbkJP?=
 =?utf-8?B?SlZaT21wWFFsRWQ4T1RWVlB3bGU2Uk02SzN1YUwwenNMUlgzZnkyTnB1eStj?=
 =?utf-8?B?WmZRUUsrV25XdmFDL081dzBHcVE2UU5MSU9rVmVIOHczODF1dlJSVHh5N3c0?=
 =?utf-8?B?UWQ2TmExNkNtU3VnTjRlNTh3cEtLZTdiUVhvUjd2SndaRTJWeU90aGRRRkpL?=
 =?utf-8?B?c1VRZDhRREZ3SjQ1M0xPRExPWTZmZ3V6ZHFqUU84Z3B4ODhIeTk2enBoK21Z?=
 =?utf-8?B?ci9Sc2JTZUZPN3E5Rm1ON2JxZW02aEgrRHNUZ1RQT1A0MDlYVWZWK0tNcGRC?=
 =?utf-8?B?ZkQ4ajdEWEZzbUlZWnIwaHFUbENpWWhnYUVkNUNFQWNxNXR0dlNSc09leEFV?=
 =?utf-8?B?SEVGM0FKMW1DRlBnR0J3ZW96Qmxyd0pUZ3c4L1RzK1N2UFgyWkxWTEhHNm04?=
 =?utf-8?B?ZUorL3dUSWVXTXFVai8zQU44cWxROXMraEVuaFkvN0hpajdvemliNThvU0Zm?=
 =?utf-8?B?STVaOVBPSVg2N3NBV1hWa2w4NTAyaUZXOUlhdGxvRmY0NXdlR0RLa3Z3ekdj?=
 =?utf-8?B?U3B5aHZjb3AyUTB2czBHSW83a1BZWUpkZ05KLzRBRU5wbkl3WXdTSUNoS1Uw?=
 =?utf-8?B?b2oyZUl2eCtEUjI0WjgrWWJiZFlZNXpTTmNCdzhKZHp2MkQ2OEhHYVhOK0VP?=
 =?utf-8?B?YnRiMGk3L002dE5Qd2NuQWdkRDdVUjJSc29zR1gzdjMxOFVvMDhtcmpZRnh0?=
 =?utf-8?B?dTFLNXZJd2pSNEFGbUdRa011aUJtMFJmQ2o0RXhWSWd5NTNXS3VSMDRSUm1U?=
 =?utf-8?B?b1NST1FjUTkyT21vMCtkWEVFZWNZUEsrZG4vMHVmYUlUQVY1RkZSSWdQNU4x?=
 =?utf-8?B?OGJnbjl4TkJuYWpLZTIrT1FLbSsxN1NxSktXc1pyL2JSYStjSlh0MlpHL1FQ?=
 =?utf-8?B?TU5iczdLc0NpTUNtRW9BUWRwc3lhVG9OcTRoS0VTTXM1eFRHeDVENlcvb0ZF?=
 =?utf-8?B?cU42RXZ3UVdjZ2dDZ1JDR01zOTA3U2FCa2JKMkt4RGYrSUVHdHhIUzRtR2V1?=
 =?utf-8?B?dERoNzZCVFh3SmNnaTh5OXllOHJlay9CK05Qa2dVVlpzZ3ZOSjl1RW8vZzVJ?=
 =?utf-8?B?ZFZvNDM0QStiQXpmNmRVcCtHcmhxS1JRNHVPUG9MaGZHM2JqcHBjNXJZY3VG?=
 =?utf-8?B?Z3NFcmF1dlEyYTZXRUc5R21jOE5BdS9HMTE3Qzl2dzU5REhoNFYzT2dBTUlS?=
 =?utf-8?B?Yll6ZUt4VHFVODdpWERYNlBQUWVuV0NZN24rY2VFNzQwNmRZSlRwRG9qaXc5?=
 =?utf-8?B?VUlvdjUyQno1SVpQWDBoOTlQM1FGUDlWMnJONkdCTTl5d1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emIzcDNNWmVsMCtoeS9xa0dzYzJJQnBQaEVYbW1icHFQb1JJdm4yeDFuTnA1?=
 =?utf-8?B?SXdYVnBuNmJ1NjFFbmlKbTRFeGI3eTR2M0NGZ2FSNkpnVHBIQmNUNFVqY3p1?=
 =?utf-8?B?eWpOUGVjMW1GOGJFcWk3NlA3S25zOWw0VEgyOTZLeCtEZkFyK3AveFNWcXJ2?=
 =?utf-8?B?NCtRbUtGSXg5K040ZFlmSjgwelVSM0ZsZHZtUnVGSWsrUGExclA0WXg4RlEw?=
 =?utf-8?B?VDVVVU1BVHM0TnZmbURzS25ZN09DUnBqOVhiUXZCTlF6anFEZnJjdHBFRnlG?=
 =?utf-8?B?WXR6bzRXNUlDVDFiUE45ZlUraldhQURoOG55ZGdJZnRDdGI1bUZ1cXlIdk55?=
 =?utf-8?B?YXhjVW8yQVBwUzdWZ2JpQTd4VmVoelRlci9Kb0crb3NiV3dmVkQ4cFNDamVJ?=
 =?utf-8?B?elVvZ3AweDNlNG1DZSt4K1pBOCtkeFVjZmV0U1MyNlFSRDlJaDNleUJhdU5R?=
 =?utf-8?B?aEZYeUNKRHJRaVpCWGIxamsxS1Q1YktBeTIvQzJwN2w1dFlVNEFiVVVuVnVC?=
 =?utf-8?B?TlYvUjh0RXQ2ZUkvamh4K3BURGFBNmJHTEUzRkFsblVHamV6N2M4dkZPV2pu?=
 =?utf-8?B?ckJkRFUwQ1FxcytSK2pBMmdXNkJHQkE5MlMzMFRhcFR5Y0NIWmdZa0dHeC9m?=
 =?utf-8?B?U3Q3NmYvVFZJbnFoNzVLbkgrWmM3TzM1elA1VEcrU202RytaSy9XZ0RLTXpx?=
 =?utf-8?B?c2R6V0ZrMVBnb2J1cUltS2F0cFFaWU13aDRnMlpXSDRwOFpyRWE2VFBWaEVk?=
 =?utf-8?B?VW5GUDh1cU9YWS81Z1NQRjZFRHQ4TjVIR1hCckVaTEpOU1I4eVVwaHEyVlhO?=
 =?utf-8?B?VWFTNXRXLzk1Vzc1RGpIdFNmY2hxQkcyVEUrVEIxUGd0R1VNN2JabVN6OFNs?=
 =?utf-8?B?SjNPT3Jja0RySlBRSDZyYmR4Q2gzaVlHOUpPVXRwK081YURlT2QxMUJaTW0y?=
 =?utf-8?B?b1dKa0duU05FckpjNmxVdDJsVEFYZnlFbzFveTRkS3ViM1dPaWJOVUNmK1Fp?=
 =?utf-8?B?THhqSnZJMGtLc3JhUU9JNllyY2lDVjZoZjVIWHI3eTNIOWl6eG56YkQ0YUFB?=
 =?utf-8?B?SnpaRkkzY3QvSUZIdWVNMjJ6NUw4aFREVHNUcVdLREZLL25RU051dVZLTDJF?=
 =?utf-8?B?TGVJdXlON0pNNXZ2UGFZZlNsczRaU25GZ2o4SUhiam9ZZXVGWFFVNGY5VUdZ?=
 =?utf-8?B?NTloY2VObUtzUzBnNnpEVVhaWjlZZXM1OCtyUHNIYTQzdnNxN0xUY3E4YnRy?=
 =?utf-8?B?MHp1TFdhRXpoaGQ5MHBDYUpXZElRV0x3VjhyODRkM091TUhtZjFHMHV0QmNm?=
 =?utf-8?B?dmtpWEVvdmpLQ01hYUkxelVCdzFjNkVJV2wxc2svaDNNYktvUERUTmYyUnQ4?=
 =?utf-8?B?YmxOMml5WXFOdEdwYWVsaFFydlhTTTV0Z0d2YVBkSkNGV3NZcXM2eDUrTWtW?=
 =?utf-8?B?ckFBZGtLTDJpdFVLTXNVZjVVMDU1aEZRc1BhcjVicTVWRkxweklnWXU1SU9H?=
 =?utf-8?B?dW4xMWlVajJMSm9pOC8zSWYwOXoyV3hjM2FWbnM1ckIzNWNPSWk0R05QVzMv?=
 =?utf-8?B?T2llalZtUDF0cWhTbllRSTZpWHEwdGwwOHh3SkV2d0k3SXFOSUREZWxVam1O?=
 =?utf-8?B?Z2hlQkRYdGpwdkJSaVNLMVB5ZUVOdFRKc3VCZmlQc2lZd0l2bnpJaGo1NVB1?=
 =?utf-8?B?d2svaURqcXlFM2R6TG40STRZY0JySHRyWlFZRjMxV0JlQUdUM3J2TDJ2L3pu?=
 =?utf-8?B?K0o3cllRcUhwbjFpeEdvTitHajYvSmcvS0lrS0VqMmgxOXl5ZXUycWdmbE9y?=
 =?utf-8?B?Z1pPc0tnTGFpR1ZFa2NWZWZOSVp4UFRSOGlDSGRQYUlZRVBFVmN0eExpWXQx?=
 =?utf-8?B?M3RxYTJtTER2WXZndnZRZml1bDBoOW9KQkdpdVdhbENvdEg0TlZBSHc0K0Qw?=
 =?utf-8?B?L0gzM2xtOVRXdTAyMjFwWlMxelNwY1Q4c3lVc1dVSll3R3pvc0tLamRnSXBK?=
 =?utf-8?B?MStTeUsxL05EdDhkR2x0S0I1ekNvNEptaVJ4Sk45Y3h4enpJcG5UNHBGM1hP?=
 =?utf-8?B?U1BSNmgyTzhJd0FOeGlmTFlPckJxYzkyb0d1YmhLWUl3ZDRRWUM3bzF2S3Vn?=
 =?utf-8?B?NGZoZExBTnMrcDE3VFlYNnAweWlGa1lkNHRYanZ6djRUbDY1ZGRWNk5uNkVp?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B8B4417BE2BDB4EA6464C910E5A8861@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84819955-d7b5-4059-a3f5-08dd1aebe395
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 20:30:59.3992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mvrfodbZRrAHSePDMrA0MFBtqdzFHJvKKOjfRgu+x3vN8PuHcllJCPDiT6j7elEV9M2SzvSAXGVTpSHJH2uM2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6003
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

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDEyOjA2IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxMi8xMi8yMDI0IDExOjMxLCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiBPbiBUaHUsIDIw
MjQtMTItMTIgYXQgMTA6NTkgLTA4MDAsIEpvaG4gSGFycmlzb24gd3JvdGU6DQo+ID4gPiBPbiAx
Mi8xMi8yMDI0IDEwOjE3LCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCAyMDI0
LTEwLTAyIGF0IDE3OjQ2IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwuY29tIHdyb3RlOg0K
PiA+ID4gPiA+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+
DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhlIHhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90IGlz
IG5vdCByZWFsbHkgYSBHdUMgaW50ZXJuYWwgdGhpbmcgYW5kDQo+ID4gPiA+ID4gaXMgZGVmaW5p
dGVseSBub3QgYSBHdUMgQ1QgdGhpbmcuIFNvIGdpdmUgaXQgaXRzIG93biBzZWN0aW9uIGhlYWRp
bmcuDQo+ID4gPiA+ID4gVGhlIHNuYXBzaG90IGl0c2VsZiBpcyByZWFsbHkgYSBjYXB0dXJlIG9m
IHRoZSBzdWJtaXNzaW9uIGJhY2tlbmQncw0KPiA+ID4gPiA+IGludGVybmFsIHN0YXRlLiBBbHRo
b3VnaCBhbGwgaXQgY3VycmVudGx5IHByaW50cyBvdXQgaXMgdGhlIHN1Ym1pc3Npb24NCj4gPiA+
ID4gPiBjb250ZXh0cy4gU28gbGFiZWwgaXQgYXMgJ0NvbnRleHRzJy4gSWYgbW9yZSBnZW5lcmFs
IHN0YXRlIGlzIGFkZGVkDQo+ID4gPiA+ID4gbGF0ZXIgdGhlbiBpdCBjb3VsZCBiZSBjaGFuZ2Ug
dG8gJ1N1Ym1pc3Npb24gYmFja2VuZCcgb3Igc29tZSBzdWNoLg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IEZ1cnRoZXIsIGV2ZXJ5dGhpbmcgZnJvbSB0aGUgR3VDIENUIHNlY3Rpb24gb253YXJkcyBp
cyBHVCBzcGVjaWZpYyBidXQNCj4gPiA+ID4gPiB0aGVyZSB3YXMgbm8gaW5kaWNhdGlvbiBvZiB3
aGljaCBHVCBpdCB3YXMgcmVsYXRlZCB0byAoYW5kIHRoYXQgaXMNCj4gPiA+ID4gPiBpbXBvc3Np
YmxlIHRvIHdvcmsgb3V0IGZyb20gdGhlIG90aGVyIGZpZWxkcyB0aGF0IGFyZSBnaXZlbikuIFNv
IGFkZCBhDQo+ID4gPiA+ID4gR1Qgc2VjdGlvbiBoZWFkaW5nLiBBbHNvIGluY2x1ZGUgdGhlIHRp
bGUgaWQgb2YgdGhlIEdULCBiZWNhdXNlIGFnYWluDQo+ID4gPiA+ID4gc2lnbmlmaWNhbnQgaW5m
b3JtYXRpb24uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gTGFzdGx5LCBkcm9wIGEgY291cGxlIG9m
IHVubmVjZXNzYXJ5IGxpbmUgZmVlZHMgd2l0aGluIHNlY3Rpb25zLg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IHYyOiBBZGQgR1Qgc2VjdGlvbiBoZWFkaW5nLCBhZGQgdGlsZSBpZCB0byBkZXZpY2Ug
c2VjdGlvbi4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJp
c29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBK
dWxpYSBGaWxpcGNodWsgPGp1bGlhLmZpbGlwY2h1a0BpbnRlbC5jb20+DQo+ID4gPiA+ID4gLS0t
DQo+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgICAgICAg
fCA1ICsrKysrDQo+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1w
X3R5cGVzLmggfCAzICsrLQ0KPiA+ID4gPiA+ICAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuYyAgICAgICAgICAgIHwgMSArDQo+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYyAgICAgICAgfCAyICstDQo+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2h3X2VuZ2luZS5jICAgICAgICAgfCAxIC0NCj4gPiA+ID4gPiAgICA1IGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiANCj4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYw0KPiA+ID4gPiA+IGluZGV4IGQyMzcx
OWQ1YzJhMy4uMjY5MGYxZDFjZGU0IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gPiA+ID4gPiBAQCAtOTYsOCArOTYsMTMgQEAgc3RhdGlj
IHNzaXplX3QgX194ZV9kZXZjb3JlZHVtcF9yZWFkKGNoYXIgKmJ1ZmZlciwgc2l6ZV90IGNvdW50
LA0KPiA+ID4gPiA+ICAgIAlkcm1fcHJpbnRmKCZwLCAiUHJvY2VzczogJXNcbiIsIHNzLT5wcm9j
ZXNzX25hbWUpOw0KPiA+ID4gPiA+ICAgIAl4ZV9kZXZpY2Vfc25hcHNob3RfcHJpbnQoeGUsICZw
KTsNCj4gPiA+ID4gPiAgICANCj4gPiA+ID4gPiArCWRybV9wcmludGYoJnAsICJcbioqKiogR1Qg
IyVkICoqKipcbiIsIHNzLT5ndC0+aW5mby5pZCk7DQo+ID4gPiA+ID4gKwlkcm1fcHJpbnRmKCZw
LCAiXHRUaWxlOiAlZFxuIiwgc3MtPmd0LT50aWxlLT5pZCk7DQo+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ICAgIAlkcm1fcHV0cygmcCwgIlxuKioqKiBHdUMgQ1QgKioqKlxuIik7DQo+ID4gPiA+ID4g
ICAgCXhlX2d1Y19jdF9zbmFwc2hvdF9wcmludChzcy0+Y3QsICZwKTsNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gKwlkcm1fcHV0cygmcCwgIlxuKioqKiBDb250ZXh0cyAqKioqXG4iKTsNCj4gPiA+
ID4gPiAgICAJeGVfZ3VjX2V4ZWNfcXVldWVfc25hcHNob3RfcHJpbnQoc3MtPmdlLCAmcCk7DQo+
ID4gPiA+IFRoaXMgYnJva2UgTWVzYSBwYXJzZXIhDQo+ID4gPiA+IEl0IGNhbid0IG5vdyBwYXJz
ZSB0aGUgZXhlY19xdWV1ZSBjb250ZXh0IGJlY2F1c2UgaXQgd2FzIGV4cGVjdGVkIHRvIGJlIG9u
IHRoZSAnKioqKiBHdUMgQ1QgKioqKicgc2VjdGlvbi4NCj4gPiA+IFRoZW4gdGhlIG1lc2EgcGFy
c2UgbmVlZHMgdG8gYmUgdXBkYXRlZC4gVGhhdCB3YXMgY2xlYXJseSBhIGJ1ZyAtIGV4ZWMNCj4g
PiA+IHF1ZXVlIGNvbnRleHRzIGFyZSBhYnNvbHV0ZWx5IG5vdCBHdUMgQ1QgZGF0YSBhbmQgc2hv
dWxkIG5vdCBiZSBpbiB0aGUNCj4gPiA+IEd1QyBDVCBzZWN0aW9uLg0KPiA+IERvbid0IG1hdHRl
ciBpZiBpdCBpcyBhIGJ1ZyBvciBub3QsIGl0IGJyb2tlIHRoZSBwYXJzZXIuDQo+ID4gSWYgdGhp
cyBpcyBub3QgcmV2ZXJ0ZWQgd2Ugd2lsbCBoYXZlIG9sZGVyIEtlcm5lbCB2ZXJzaW9ucyB0aGF0
IGRvbid0IHdvcmsgd2l0aCBuZXdlciBNZXNhIGFuZCBuZXdlciBLZXJuZWwgdmVyc2lvbnMgdGhh
dCBkb24ndCB3aXRoIG9sZCBNZXNhLg0KPiBEZWJ1ZyB0b29scyBjYW5ub3QgY291bnQgYXMgVUFQ
SSB0aGF0IG11c3QgbmV2ZXIgY2hhbmdlLg0KDQpUaGF0IGlzIG5vdCBteSB1bmRlcnN0YXRpbmcg
ZnJvbSBwcmV2aW91cyB0aHJlYWRzLg0KDQpJbWFnaW5lIHRoYXQgYSBiaWcgY29zdHVtZXIgZmls
ZSBhIGJ1ZyB0byB1cyBhbmQgYXR0YWNoIHRoZSBkZXZjb3JlZHVtcCBvZiBhIG9sZGVyIGtlcm5l
bCB2ZXJzaW9uLg0KZGV2Y29yZWR1bXAgcGFyc2VyIHdpbGwgbm90IHdvcmsuIElmIHRoZSBkZXZl
bG9wZXIgaXMgYXdhcmUgb2YgdGhpcyAiY29udHJhY3QiIGJyZWFrIGhlIGNhbiBjaGVja291dCB0
byBhIG9sZGVyIFVNRCB2ZXJzaW9uLCBidWlsZCBpdCBhbmQgdGhlbiBwYXJzZQ0KdGhlIGRldmNv
cmVkdW1wLiBUaGVuIGNoZWNrb3V0IGFnYWluIHRvIG1haW4vbWFzdGVyIGJyYW5jaCBhbmQgd29y
ayBvbiB0aGUgZml4Li4uIE5vdCB2aWFibGUgYXQgYWxsLg0KDQpBdCBsZWFzdCBVTUQgdGVhbXMg
c2hvdWxkIGJlIG5vdGlmaWVkLiBBdCB0aGUgbW9tZW50IE1lc2EgZGVidWdnaW5nIGlzIGJsb2Nr
ZWQgYmVjYXVzZSBvZiB0aGlzIHBhdGNoZXMuDQoNCj4gDQo+IFRoZSBkZXZjb3JlZHVtcCBjb250
YWlucyBtdWNoIGluZm9ybWF0aW9uIHRoYXQgaXMgZXNzZW50aWFsbHkgdGhlIA0KPiBpbnRlcm5h
bHMgb2YgdGhlIGtlcm5lbC4gSXQgaXMgZ29pbmcgdG8gY2hhbmdlLiBUaGF0IGlzIGFib3V0IHRo
ZSBvbmx5IA0KPiBndWFyYW50ZWUgdGhhdCB3ZSBjYW4gbWFrZSBhYm91dCBpdC4gQW5kIHNheWlu
ZyB0aGF0IHdlIG11c3QgDQo+IGludGVudGlvbmFsbHkgYnJlYWsgdGhlIG91dHB1dCBvZiBhIGRl
dmVsb3BlciBvbmx5IGRlYnVnIGZlYXR1cmUgaW4gDQo+IG9yZGVyIHRvIHN1cHBvcnQgb2xkZXIg
bWVzYSBpcyBwbGFpbiB3cm9uZy4gRW5kIHVzZXJzIGRvIG5vdCBjYXJlIGFib3V0IA0KPiBkZWJ1
ZyB0b29scy4gQWxsIHVzZXIgYXBwbGljYXRpb25zIHdpbGwgc3RpbGwgd29yayBqdXN0IHBlcmZl
Y3RseS4NCj4gDQo+IFdlIGNhbiBzdGFydCBhZGRpbmcgdmVyc2lvbiBudW1iZXJzIHRvIHRoZSBk
ZXZjb3JlZHVtcCBmb3JtYXQgaWYgd2UgDQo+IHJlYWxseSBuZWVkIHRvLiBCdXQgdGhhdCB3YXMg
YWxyZWFkeSBzaG90IGRvd24gYXMgYSBiYWQgaWRlYS4gSXQgaXMgDQo+IGRlYnVnIGluZm9ybWF0
aW9uIGFuZCBub3QgVUFQSS4gU28gdmVyc2lvbiBpbmNvbXBhdGliaWxpdGllcyBhcmUgDQo+IGV4
cGVjdGVkIGZyb20gdGltZSB0byB0aW1lLg0KPiANCj4gSm9obi4NCj4gDQo+IA0KPiA+IA0KPiA+
ID4gSm9obi4NCj4gPiA+IA0KPiA+ID4gPiA+ICAgIA0KPiA+ID4gPiA+ICAgIAlkcm1fcHV0cygm
cCwgIlxuKioqKiBKb2IgKioqKlxuIik7DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcF90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmNvcmVkdW1wX3R5cGVzLmgNCj4gPiA+ID4gPiBpbmRleCA0NDBkMDVkNzdhNWEuLjNjYzJm
MDk1ZmRmYiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
Y29yZWR1bXBfdHlwZXMuaA0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZjb3JlZHVtcF90eXBlcy5oDQo+ID4gPiA+ID4gQEAgLTM3LDcgKzM3LDggQEAgc3RydWN0IHhl
X2RldmNvcmVkdW1wX3NuYXBzaG90IHsNCj4gPiA+ID4gPiAgICAJLyogR3VDIHNuYXBzaG90cyAq
Lw0KPiA+ID4gPiA+ICAgIAkvKiogQGN0OiBHdUMgQ1Qgc25hcHNob3QgKi8NCj4gPiA+ID4gPiAg
ICAJc3RydWN0IHhlX2d1Y19jdF9zbmFwc2hvdCAqY3Q7DQo+ID4gPiA+ID4gLQkvKiogQGdlOiBH
dWMgRW5naW5lIHNuYXBzaG90ICovDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJLyoqIEBnZTog
R3VDIFN1Ym1pc3Npb24gRW5naW5lIHNuYXBzaG90ICovDQo+ID4gPiA+ID4gICAgCXN0cnVjdCB4
ZV9ndWNfc3VibWl0X2V4ZWNfcXVldWVfc25hcHNob3QgKmdlOw0KPiA+ID4gPiA+ICAgIA0KPiA+
ID4gPiA+ICAgIAkvKiogQGh3ZTogSFcgRW5naW5lIHNuYXBzaG90IGFycmF5ICovDQo+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+ID4gPiA+IGluZGV4IDA5YTdhZDgzMGU2OS4uMDMw
Y2Y3MDNlOTcwIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0K
PiA+ID4gPiA+IEBAIC05NjEsNiArOTYxLDcgQEAgdm9pZCB4ZV9kZXZpY2Vfc25hcHNob3RfcHJp
bnQoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1fcHJpbnRlciAqcCkNCj4gPiA+ID4g
PiAgICANCj4gPiA+ID4gPiAgICAJZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpZCkgew0KPiA+ID4gPiA+
ICAgIAkJZHJtX3ByaW50ZihwLCAiR1QgaWQ6ICV1XG4iLCBpZCk7DQo+ID4gPiA+ID4gKwkJZHJt
X3ByaW50ZihwLCAiXHRUaWxlOiAldVxuIiwgZ3QtPnRpbGUtPmlkKTsNCj4gPiA+ID4gPiAgICAJ
CWRybV9wcmludGYocCwgIlx0VHlwZTogJXNcbiIsDQo+ID4gPiA+ID4gICAgCQkJICAgZ3QtPmlu
Zm8udHlwZSA9PSBYRV9HVF9UWVBFX01BSU4gPyAibWFpbiIgOiAibWVkaWEiKTsNCj4gPiA+ID4g
PiAgICAJCWRybV9wcmludGYocCwgIlx0SVAgdmVyOiAldS4ldS4ldVxuIiwNCj4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gPiA+ID4gPiBpbmRleCAwYWM0YTE5ZWM5Y2Mu
Ljg2OTBkZjY5OTE3MCAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3N1Ym1pdC5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19zdWJtaXQuYw0KPiA+ID4gPiA+IEBAIC0yMjQwLDcgKzIyNDAsNyBAQCB4ZV9ndWNfZXhlY19x
dWV1ZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZ3VjX3N1Ym1pdF9leGVjX3F1ZXVlX3NuYXBz
aG90ICpzbmFwcw0KPiA+ID4gPiA+ICAgIAlpZiAoIXNuYXBzaG90KQ0KPiA+ID4gPiA+ICAgIAkJ
cmV0dXJuOw0KPiA+ID4gPiA+ICAgIA0KPiA+ID4gPiA+IC0JZHJtX3ByaW50ZihwLCAiXG5HdUMg
SUQ6ICVkXG4iLCBzbmFwc2hvdC0+Z3VjLmlkKTsNCj4gPiA+ID4gPiArCWRybV9wcmludGYocCwg
Ikd1QyBJRDogJWRcbiIsIHNuYXBzaG90LT5ndWMuaWQpOw0KPiA+ID4gPiA+ICAgIAlkcm1fcHJp
bnRmKHAsICJcdE5hbWU6ICVzXG4iLCBzbmFwc2hvdC0+bmFtZSk7DQo+ID4gPiA+ID4gICAgCWRy
bV9wcmludGYocCwgIlx0Q2xhc3M6ICVkXG4iLCBzbmFwc2hvdC0+Y2xhc3MpOw0KPiA+ID4gPiA+
ICAgIAlkcm1fcHJpbnRmKHAsICJcdExvZ2ljYWwgbWFzazogMHgleFxuIiwgc25hcHNob3QtPmxv
Z2ljYWxfbWFzayk7DQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+ID4g
PiA+IGluZGV4IGVhNmQ5ZWY3ZmFiNi4uNmM5YzI3MzA0Y2RjIDEwMDY0NA0KPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+ID4gPiA+IEBAIC0xMDg0LDcgKzEw
ODQsNiBAQCB2b2lkIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfaHdfZW5n
aW5lX3NuYXBzaG90ICpzbmFwc2hvdCwNCj4gPiA+ID4gPiAgICAJaWYgKHNuYXBzaG90LT5od2Ut
PmNsYXNzID09IFhFX0VOR0lORV9DTEFTU19DT01QVVRFKQ0KPiA+ID4gPiA+ICAgIAkJZHJtX3By
aW50ZihwLCAiXHRSQ1VfTU9ERTogMHglMDh4XG4iLA0KPiA+ID4gPiA+ICAgIAkJCSAgIHNuYXBz
aG90LT5yZWcucmN1X21vZGUpOw0KPiA+ID4gPiA+IC0JZHJtX3B1dHMocCwgIlxuIik7DQo+ID4g
PiA+ID4gICAgfQ0KPiA+ID4gPiA+ICAgIA0KPiA+ID4gPiA+ICAgIC8qKg0KPiANCg0K
