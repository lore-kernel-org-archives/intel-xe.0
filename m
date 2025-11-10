Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92626CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 15:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CBC10E3F8;
	Mon, 10 Nov 2025 15:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2uqA6TO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B8E10E3F8
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762788627; x=1794324627;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9CNTF6s8o68/aJDYZ0jQEvdCQsBGKc6lAbnHK2mik40=;
 b=I2uqA6TOyZwYfsYGsPJAN5TCSXYsK2RSa7zHJM8sboi0faRzkc+OxUNO
 NqmmegZSkW/DmeaCoiH1KVkDkaZ/Z8E5nBSkfXeVzLUfFzXkZ8w6iqrGS
 vPhZ0YiPMPPTZE3qUxiae1LzQKSgGnJicTMX7LPG8UjZzkC2kVYjWp1O6
 ErzMkBxPtDnfQ16iN/nJU0ZxrImgSVH4o6o2BsEyhpMhZzX+B1aq5rtDH
 RicdIKAuG1yLNtAR6yj5GZwQTEq+xC3UtdbzdckU7uti/5tbC/Exjk1XZ
 PYpfj6fzoYIQ0UMbrf9gF1s5zdmjmQZYs7JrIfrzUgjja0/tcYnZODHLV Q==;
X-CSE-ConnectionGUID: Wz8629DeREi6l+GFQkdYBg==
X-CSE-MsgGUID: JrDI86NlTl2EtCK4gBsE3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64927547"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64927547"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 07:30:27 -0800
X-CSE-ConnectionGUID: xnEQcxq+TTSYrDYkV3I7tQ==
X-CSE-MsgGUID: tt+EkNulTkuezhxBFwTgrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188653760"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 07:30:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 07:30:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 07:30:26 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 07:30:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifvKiX/7nRARwOlOBRPf2W11pnAT+GheqbxE1nNx3kuI846dA1QZbkaxYV42JQdEKQI7FllfW0YzElfFSauRnnX04FHN1QkWYAqPOJmF1hGzJWtVBAd/vSC7c87l7D0hDyUDkkUS77Cdx5fq/6z7kqg2vtgcsJAaRhJm7gyXzUuIzYEIe3Zyaclj//BTFzFnaOBnZos4f0bKQOy+2pftVcZah6Ulhb7S55KydFY738YudSnw7sIsw/05M9pTmHC5Tw/vo5Kn2T+CtE6JLGEWVqaip0maaWP4zWyzqoi9qp+zvalfkYEyrm9+I3nfSWBjCPTRXbTkuDoWS0otq1u4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CNTF6s8o68/aJDYZ0jQEvdCQsBGKc6lAbnHK2mik40=;
 b=ZW89WbCk+6jnFjjxgnleZsrgkU7r3iaGGW5AKLlWvXOIF6ExaRG4q5CkcffywdAL6pgE2w8cJ26rAEDJ6GJqdr+mbJvCKAzs6o/go05Aywb5kQwFpF5TG9Nul4i6kPAhnSelYDc3jEzM6vtJyueh04ow/50X5sFi/UYHYtWqruzUHeNe88c1XCiqJpb35CrRydyS/wzuXDKnUxEqcCloDesC6R3SlBNqOLSJt9YepkHPvIZJ0AB+UD9fvbJKYbf3hPYaNDPy2kXYfQK0RLXUyvqOPQ0oOb2Ba0o4G54v0UQDIMkD52CZ2iV1emOTEI5l+6yJrhJP7d9fB9Hyha3bcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB7072.namprd11.prod.outlook.com (2603:10b6:510:214::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:30:16 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:30:16 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3] drm/xe/pm: Enable WAKE# support
Thread-Topic: [PATCH v3] drm/xe/pm: Enable WAKE# support
Thread-Index: AQHcTmONdDTcEtqDe0iMM0D+lHo8obToJE8AgAChzoCAA0rtAA==
Date: Mon, 10 Nov 2025 15:30:16 +0000
Message-ID: <fd0ea4df02555f95f82cc54e575f87b6d8164b6b.camel@intel.com>
References: <20251105145010.428268-1-raag.jadav@intel.com>
 <aQ66MkE7o8hwNGKK@intel.com> <aQ9B7RvEhxzLGE-a@black.igk.intel.com>
In-Reply-To: <aQ9B7RvEhxzLGE-a@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|PH8PR11MB7072:EE_
x-ms-office365-filtering-correlation-id: 4ead6acf-1f94-4427-6db0-08de206e0ca1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NEJydFJyWm84ZHM5dFhQaXdteWxCY2lrbVNleU1LS3M3ZUlLV2srdTB6eExX?=
 =?utf-8?B?eGM1aEtzQUJHQUJTNks5RkNKMUNud1l3aWtOaFlTcWNOMmFzQlBvSkd6am9l?=
 =?utf-8?B?d1JXcko0Ky9BOUFDUkV4enlLWHVDL0p4a01QMHZ5K0p0VU9QcHREdnhYOE9s?=
 =?utf-8?B?V2hQZnhRa1I0aDg1ZlFIZUxyZE1aaGRBNnhmRFpveHp1TTJydHpHMjBEbHRp?=
 =?utf-8?B?Vk1aQ2NMNmo5WGpuU0FsTDFqaVN0a21EMmZvYk1HQTNPc0cxYWc5WEFLek00?=
 =?utf-8?B?dlBYSER0QjVJcHVQK0tLZGREeHc0V1kyUnMraXBLKytXRG1Xd3c0L1ZRZDJG?=
 =?utf-8?B?U2hrNGZ0OUZjcFNhM3V4aStpVW5JelhUWXB5Y2pxUlFzZzV0WHJ6amE5TWhl?=
 =?utf-8?B?UlJ5TTNxYmphd0g2K2ViMk84QWN3VkJCSDI1OXpudldTQnVsd1Z2MzZyUUVk?=
 =?utf-8?B?OUN1eExib0NDQXFZZjhvMEx5ZlNjaHBGSXhSdURUbndFSmVtVTI0MUYvL2RJ?=
 =?utf-8?B?UThzMXpGTnJFSUJ0VE9FMXBFZFhtV0swdFJhZHZ3WG5lMmRKQ2pEODAxNnlE?=
 =?utf-8?B?VTJwNCtTOXJiQzJuWXB3Vno5VlpreXNtQVRCdDNBeEVnUHJWczJ1dGt4QlJ0?=
 =?utf-8?B?M2tDNEg3VENUbXNqQ2xtM21ocU9kVjlicXBHekFpS2xjYVhZNXBKdGllRVdw?=
 =?utf-8?B?T0xad25YVFhHQUlTMmRPd09UUjdJODllcEpzNk1TaWpySUc0ZzdZM2lxaDI5?=
 =?utf-8?B?TkUvSTdBTVphaHBobHJKSkNEMjQ1OHJ0T1l1RkJaWWJxN1RpUUJEeHpqWGc2?=
 =?utf-8?B?UFprcEZPZnFqby9TN1FMa0Iwdkt2akR2SGd6d3NXRTJNOUJZZnhTbGtObWMx?=
 =?utf-8?B?RGdsUXhZYXdid0tsWFRlMTEvQ29MVE9GMzZkU240L2M3aHhCNEh0ZEtIWHhZ?=
 =?utf-8?B?UytpYnF1cG9GRzZuQ2NPUll4VERQYzE1V3pHNHhJaUc0ZVNXVTlmbHhGc2dC?=
 =?utf-8?B?cSt4TVlPUHNKMnlMNUlhdHRISEhtck04QzB3dUJoeEI4dnZjc3VyeHNDR3ZS?=
 =?utf-8?B?UmR1cEVOTHphQXQ3K096Zy81Y0VJZGM1cm5URXpmdWxXM1c2V2NxUGJSSjBp?=
 =?utf-8?B?c3RzSEIwVER5WW50SjE3YVh4bmdGZm5sU1A0ak9CQzBCMDF5eitXYWZPUjk3?=
 =?utf-8?B?dXBhTmJBUDNKcWp1S3NzWWFiRmEySE8rdWhyTWU4eis1RlJlRHJ4S0FxNThV?=
 =?utf-8?B?Zy9lelVEMVdOU1BldnVQZWtIZjhLcFFEbzltUHIySXBFU3JBVmVZY0NYWExM?=
 =?utf-8?B?QUE4emRkSEhWWU5DR0ZKeVg0SkhpRmZ4RWhHZGR2cGRqUmY0c2RjbU95SnJK?=
 =?utf-8?B?MERDVXRoVFlPSmpiaU5DZUlYSXBmYmtyYU14UmNnVytrMVhCTlJrSjcrSHdq?=
 =?utf-8?B?UTQwSFd5cFV5eHEwcFRYdWEzNmVoenlDVWl4ZHVLd0h5K0tWemNLZU04SHR2?=
 =?utf-8?B?YXh4NlZVZERiYjRLcG1WZnBveG1mcS9uQTVEUitvSnFIcENZcmwvbGxOcUtG?=
 =?utf-8?B?aHZDVGwvMGdXT1BDNnVWQ3pnSEQ3OWNZMVQwUUxHUjFXT1FiQndDb0hwQkFy?=
 =?utf-8?B?bTBlR0I0ZEUvaTd0bFZEOU4rRCsyWDFoeThXK25ScDlpaTVvWkVOeldmRE5B?=
 =?utf-8?B?OW9qN2NRcGlIMDFyaUp0TWpZMUlzbzFQaEdXQVdXNW52WWpGZlgwMVdrSVhy?=
 =?utf-8?B?OXJQMFpkdXREQmlQb2tIZHB2eS9VUGZuNlYrU3BmcHNWNk1KdlhwYkNRdm9J?=
 =?utf-8?B?RWVlUkFmVmMwWHFISGNtZFJqYmYyVHZBV3NwNE55RzVaelNNdC9kS25nNHMw?=
 =?utf-8?B?R2Zha3ZsWWdKSkFxV1E0QU15N01nNE1mK1RvSUdnYzZTME1vekg0U3VNeEdv?=
 =?utf-8?B?ZXJMMC9XbG11YXdWYlA5S29Zelc3SnNyTTBRUVhQajNDZDRlYXdvS2tTcklO?=
 =?utf-8?B?cDhHUW11N1NaNFlOS0VEa3R1Y2pMbk1VNmU5ZXJEWFdEc2xmK3BOWVdpTlVn?=
 =?utf-8?Q?UdLonY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUQrQXlRY3IrMWIrOFRqcGdJMmFoWDEvSVpHRDNhc1E1Y1BUTW5JSklMcHhr?=
 =?utf-8?B?WFBJTlM2RGZQUjRiSnEzYjV3U1FCUmRBUGt0dXBJK1ZvVExyYXNNVXZLMTVu?=
 =?utf-8?B?RG5mUERudWlEL1BmZnJ2MTc5OHJvSXgrYUIxMEVzTlVXeTNzTnpxSzZIUFJY?=
 =?utf-8?B?YlplQmZVR3hBeHlvN2ovdGxYaFNVVGw2akE0VmkrNXA4Tm82U0xnYnVVbjNi?=
 =?utf-8?B?V1l6ZGtIdUlpR3NQSEM4S2hEcmRyYzJIeFFVQm5nOEJtZTlUSHJCK2Z6Nno0?=
 =?utf-8?B?VnJtV3lNOEdkMHBCOElwLzFlYytrMWlIZCtSaFBGTWtVMmlMSTlmRUZxWU94?=
 =?utf-8?B?Vjkra3ZUaCtoMmQvaWR5YTZPczRpaS96MkpMZlArMFF2cEpmVTFHRkNLWlF6?=
 =?utf-8?B?eExiM254anZNSFFXYVg4ZzNIaXdvVFNGdmo0Z3VRc3VFMWl6TW9uN3N3WEor?=
 =?utf-8?B?VVRpbnZEblZ3c0R4eVhsVlZNU3hxdDdtRUs0cGZKQTdMUGZpQUpOM3V5SGJG?=
 =?utf-8?B?cElpd3RzY1JacHVsZHJKNXBOQityZnFoOXJPZW9qUHRYQnd4TWhwbk9FMGgw?=
 =?utf-8?B?TDJobllFWmJqUTRlRUNtakRNLzJXWXEzU2pVUDYzZnB1ZGlhclVoeVNpVHJa?=
 =?utf-8?B?dDg0R296UE1mTmtUMVo5Y2RQNUUwcVpBenNxdG9zNEh6UzkrMGlkZ1dpclFW?=
 =?utf-8?B?bzl0enVvalZDbUZ0NDYyR3lMMGUrNUNrTlh6dWkrREdNV1dITGFheVFxK0VV?=
 =?utf-8?B?b0NkT1dKNm9tZGdOMkd4a2VzZ0RlNFVmeWhxZWJNSHR5L2VKaVRjTU5GOHhN?=
 =?utf-8?B?RVBQNlJxdkxLYlJxajJkdUp1dU1GVjRlY1JQV2JtbE5Lend2S295UWxocjZ2?=
 =?utf-8?B?dEM2UjFheE4wQ29ybUZmdFFORTZib3RrMWw1dDgwNnh3aDM0ZTIrUGZ3cmtq?=
 =?utf-8?B?TlhGK05UcklJbTZoNFZTUDU4SmltRWEzZktBL2RqbjhLemlLTS84eTFtU1lS?=
 =?utf-8?B?ZFFtSC9INko5anBBeE5UWlp4QUh4S2hKcVladlFBVFcrcmxNSzNXRVdNWjU1?=
 =?utf-8?B?dWs4U3ZvUGJqQ0txVUpKdzhoSmp3YnJyNzdGeWNVZjRnMEpzN2J0cmtmazZZ?=
 =?utf-8?B?SHRRQTBzUnB6Zkh3cnZORWVhckordDZSV1FQSEF6NlU5bjY4bVJUMVV2UVVq?=
 =?utf-8?B?QUZ3eXRZakI0VTcvenRDUVR6R1o1TzVLRFpYZWRhVG02MzRZTHM2VXVvT0F1?=
 =?utf-8?B?SjhJcWRWTmFsWUFmVk1MQXY4RHorU015eGZkZ1RPSEpuQmt6eG5nbVJodjJ3?=
 =?utf-8?B?Uytvd1dxWEVDQWx3a1BsQW93K1VOdWVaYjFYby91U0wzT210ZklhK1ZHdEVm?=
 =?utf-8?B?dDNlUW5lU09EQSt5eG9HTWVkTTE4UW5odWhkcGNXWnl2bTVkYmhLeURjVFdw?=
 =?utf-8?B?Wlp6MERpbDlPTllpZ1AwZk9BR1RVdTRPdEVMS0pna1lKaG5vRVNta3g2Ulgv?=
 =?utf-8?B?WWcvVldJT01JZ3ZGVnBmeGwxbFlZbUhxdDRva1kvRW56MmxMSDk2aVVVam1S?=
 =?utf-8?B?SGFuSWFoMGZMMnUwd2N2S2J3NHVOUmduQ2hZMTJTaDVGNWtVUFp4RDNYRkNk?=
 =?utf-8?B?dERBYTRFWkYwQzU3bkZwcDhoWXNPN2pBNmxJelF5S1hmc2U1MVducVdLZjVr?=
 =?utf-8?B?MHAwWW5LWjc2clh1R0ZwMWpBc0xBd1FVOExKbGxWMVc3ZEw3cHRZbUMyWUJF?=
 =?utf-8?B?VGdsZS9zTXkrLzVrUi8xVFA5MnloS29VTi9nN21EWVFLbGhPMVhRUjBES3lS?=
 =?utf-8?B?bWliOEsrVU5ROVlaMzN1Rm96RzhBNnA5MnI3TEFpSTNmWHdpMDNnN0xPeDlH?=
 =?utf-8?B?bDhabXNnWlcrVnN2bGVnd0cwaTVtb2ZSWnZ1OVFYM2V5YjdlSWlJMmllT0ww?=
 =?utf-8?B?V1cvQkRlV3FKVkFWNm43V0ZRZmdpR1gzMVdLZW9Pc3VIMFI5cVJ6L2M1Z2I5?=
 =?utf-8?B?TTh2NDU2eXNPN2JYWUZlam9UNWJzc0UyMklXQXZTM2pjVzh5WW1mbHI4WGor?=
 =?utf-8?B?bjlhd3NOWlhjSzlka1cxOFBBT2IxUzhScmwyNEwyZ0FHUVQ5aHoraHNrek5S?=
 =?utf-8?B?NWJPYnYxMm1hUHVwU3paVmNuZDhEU3prYW1lT2hBc0hzeHJicDN6blpjckN4?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DAD62C7EB88BD46896BFB4B30343B1B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ead6acf-1f94-4427-6db0-08de206e0ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 15:30:16.3100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6DVHvbjtSFrF9W25WBaugAMJlE6evAz3+0qEKm0FBdotu6STZHyfMb5scBp4jZ5Fug0JRi1j7uaeG/Qc4csQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7072
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

T24gU2F0LCAyMDI1LTExLTA4IGF0IDE0OjEzICswMTAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBGcmksIE5vdiAwNywgMjAyNSBhdCAxMDozNDoxMFBNIC0wNTAwLCBSb2RyaWdvIFZpdmkgd3Jv
dGU6DQo+ID4gT24gV2VkLCBOb3YgMDUsIDIwMjUgYXQgMDg6MjA6MTBQTSArMDUzMCwgUmFhZyBK
YWRhdiB3cm90ZToNCj4gPiA+IENSSSBzdXBwb3J0cyBzaWduYWxsaW5nIHRoZSBob3N0IHRocm91
Z2ggV0FLRSMgcGluIG9uIHNtYnVzDQo+ID4gPiBhbGVydHMNCj4gPiA+IHdoaWxlIGluIEQzY29s
ZC4gRW5hYmxlL2Rpc2FibGUgdGhpcyBmZWF0dXJlIGJhc2VkIG9uIGRldmljZS9ob3N0DQo+ID4g
PiBjb25maWd1cmF0aW9uLiBXZSBhbHNvIHRha2UgdXNlciBpbnB1dCBpbnRvIGFjY291bnQgaW4g
Y2FzZSB0aGUNCj4gPiA+IHVzZXINCj4gPiA+IHdhbnRzIHRvIGVuYWJsZS9kaXNhYmxlIGl0IGZy
b20gdXNlcnNwYWNlLg0KPiA+IA0KPiA+IEknbSBzb3JyeSwgYnV0IHRoaXMgd2hvbGUgcGF0Y2gg
c3RpbGwgbWFrZXMgbm8gc2Vuc2UgdG8gbWUuDQo+ID4gDQo+ID4gTGV0IG1lIHN1bW1hcml6ZSB3
aGF0IEkgYW0gc2VlaW5nIHNvIHlvdSBoYXZlIHRoZSBjaGFuZ2UgdG8gY29ycmVjdA0KPiA+IG1l
IG9yIHByb3ZpZGUgbW9yZSBpbmZvIHRvIHNob3cgbWUgd2hlcmUgSSdtIG5vdCBnZXR0aW5nIGl0
Og0KPiA+IA0KPiA+IFdlIGFyZSByZWFkaW5nIGEgY2FwYWJpbGl0eSBiaXQgZnJvbSBwY29kZSBh
dCBpbml0Lg0KPiA+IHdlIHN0YXNoIHRoaXMgYml0IGluIHRoZSBkM2NvbGQud2FrZQ0KPiA+IGF0
ICoqZXZlcnkqKiBzdXNwZW5kIHdlIHNldCB0aGlzIGJpdC4NCj4gPiB3ZSBuZXZlciBldmVyIGNs
ZWFyIHRoaXMgYml0LCBidXQgd2UgY29udGludWUgc2V0dGluZyBpdA0KPiA+IG9uIGV2ZXJ5IHN1
c3BlbmQuDQo+ID4gDQo+ID4gV2h5Pw0KPiA+IA0KPiA+IFdoeSBkbyB3ZSBuZWVkIHRvIGtlZXAg
c2V0dGluZyBpZiB3ZSBhcmUgbm90IGNsZWFyaW5nIGl0Pw0KPiA+IFdoeSBjYW4ndCB3ZSBzaW1w
bHkgc2V0IHRoaXMgb25jZSBhdCBpbml0IGlmIHdlIGtub3cgd2UgbmVlZCBpdD8NCj4gPiANCj4g
PiBsaWtlLCByZWFkIHRoZSBjYXBhYmlsaXR5LCBjaGVjayBvdXIgaTJjIHByZXNlbmNlIGFuZCBz
ZXQgdGhlIGJpdA0KPiA+IGFuZCBtb3ZlIG9uLi4uDQo+ID4gDQo+ID4gd2hlcmUgYW0gSSBnZXR0
aW5nIHRoaXMgd3Jvbmc/DQo+IA0KPiBDYW4geW91IGd1YXJhbnRlZSB0aGF0IHBjb2RlIGNvbmZp
Z3VyYXRpb25zIHBlcnNpc3QgdGhyb3VnaCBkM2NvbGQNCj4gY3ljbGU/DQoNCkNhbiB5b3UgZ3Vh
cmFudGVlIHRoYXQgaXQgZG9lc24ndD8NCg0KVW5sZXNzIGl0IGlzIGRvY3VtZW50ZWQgb3IgdmVy
aWZpZWQgZW1waXJpY2FsbHkgdGhhdCB3ZSBuZWVkIHRoYXQsIHdlDQpkb24ndCENCg0KPiANCj4g
UmFhZw0KPiANCj4gPiA+IHYyOiBNYWtlIHdha2V1cCBoZWxwZXIgc3RhdGljLCBkcm9wIGQzY29s
ZCBhcmd1bWVudCAoUm9kcmlnbykNCj4gPiA+IHYzOiBFeHBhbmQgY29tbWl0IG1lc3NhZ2UsIGRy
b3AgZGVmZWF0dXJlIG9uIGluaXQgKFJvZHJpZ28pDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFJhYWcgSmFkYXYgPHJhYWcuamFkYXZAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8wqAgNCArKysNCj4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlX2FwaS5owqDCoMKgIHzCoCA1ICsrKw0KPiA+ID4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTMNCj4g
PiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+IMKgMyBmaWxlcyBjaGFuZ2Vk
LCA2MiBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZV90eXBlcy5oDQo+ID4gPiBpbmRleCBhMDNjYzgzYWEyNmYuLjYwMjg0OWZjZDNhYSAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0K
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gPiBA
QCAtNTI4LDYgKzUyOCwxMCBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gPiA+IMKgCQkgKiBEZWZh
dWx0IHRocmVzaG9sZCB2YWx1ZSBpcyAzMDBtYi4NCj4gPiA+IMKgCQkgKi8NCj4gPiA+IMKgCQl1
MzIgdnJhbV90aHJlc2hvbGQ7DQo+ID4gPiArDQo+ID4gPiArCQkvKiogQGQzY29sZC53YWtlOiBJ
bmRpY2F0ZXMgV0FLRSMgY2FwYWJpbGl0eSBvZg0KPiA+ID4gZGV2aWNlICovDQo+ID4gPiArCQl1
MzIgd2FrZTsNCj4gPiA+ICsNCj4gPiA+IMKgCQkvKiogQGQzY29sZC5sb2NrOiBwcm90ZWN0IHZy
YW1fdGhyZXNob2xkICovDQo+ID4gPiDCoAkJc3RydWN0IG11dGV4IGxvY2s7DQo+ID4gPiDCoAl9
IGQzY29sZDsNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNvZGVf
YXBpLmgNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Bjb2RlX2FwaS5oDQo+ID4gPiBp
bmRleCA5MmJmY2JhNTFlMTkuLjNmOGQ0M2MxYjRmZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wY29kZV9hcGkuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3Bjb2RlX2FwaS5oDQo+ID4gPiBAQCAtNTAsNiArNTAsMTEgQEANCj4gPiA+IMKgI2Rl
ZmluZQlSRUFEX1BMX0ZST01fRlcJCQkJMA0KPiA+ID4geDENCj4gPiA+IMKgI2RlZmluZQlSRUFE
X1BMX0ZST01fUENPREUJCQkweDANCj4gPiA+IMKgDQo+ID4gPiArI2RlZmluZcKgwqAgUENPREVf
RDNDT0xEX1dBS0UJCQkweDVBDQo+ID4gPiArI2RlZmluZcKgwqDCoMKgIFJFQURfTU9ERQkJCQkw
eDANCj4gPiA+ICsjZGVmaW5lwqDCoMKgwqAgV1JJVEVfTU9ERQkJCQkweDENCj4gPiA+ICsjZGVm
aW5lwqDCoMKgwqDCoMKgIEkyQ19XQUtFX0VOQUJMRQkJCVJFR19CSVQoMSkNCj4gPiA+ICsNCj4g
PiA+IMKgI2RlZmluZcKgwqAgUENPREVfTEFURV9CSU5ESU5HCQkJMHg1Qw0KPiA+ID4gwqAjZGVm
aW5lwqDCoMKgwqAgR0VUX0NBUEFCSUxJVFlfU1RBVFVTCQkweDANCj4gPiA+IMKgI2RlZmluZcKg
wqDCoMKgwqDCoCBWMV9GQU5fU1VQUE9SVEVECQkJUkVHX0JJVCgwKQ0KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wbS5jDQo+ID4gPiBpbmRleCA3YjA4OWU2ZmI2M2YuLjk0YTBiMWM5YWNjNiAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiA+ID4gQEAgLTcsNiArNyw4IEBADQo+ID4gPiDCoA0K
PiA+ID4gwqAjaW5jbHVkZSA8bGludXgvZmF1bHQtaW5qZWN0Lmg+DQo+ID4gPiDCoCNpbmNsdWRl
IDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3BtX3dha2V1cC5o
Pg0KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmdfY2hvaWNlcy5oPg0KPiA+ID4gwqAjaW5j
bHVkZSA8bGludXgvc3VzcGVuZC5oPg0KPiA+ID4gwqANCj4gPiA+IMKgI2luY2x1ZGUgPGRybS9k
cm1fbWFuYWdlZC5oPg0KPiA+ID4gQEAgLTIyLDYgKzI0LDcgQEANCj4gPiA+IMKgI2luY2x1ZGUg
InhlX2kyYy5oIg0KPiA+ID4gwqAjaW5jbHVkZSAieGVfaXJxLmgiDQo+ID4gPiDCoCNpbmNsdWRl
ICJ4ZV9sYXRlX2JpbmRfZncuaCINCj4gPiA+ICsjaW5jbHVkZSAieGVfcGNvZGVfYXBpLmgiDQo+
ID4gPiDCoCNpbmNsdWRlICJ4ZV9wY29kZS5oIg0KPiA+ID4gwqAjaW5jbHVkZSAieGVfcHhwLmgi
DQo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9zcmlvdl92Zl9jY3MuaCINCj4gPiA+IEBAIC0xNjEsNiAr
MTY0LDI5IEBAIHN0YXRpYyB2b2lkIHhlX3JwbV9sb2NrbWFwX3JlbGVhc2UoY29uc3QNCj4gPiA+
IHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4gwqAJCQkgJnhlX3BtX3J1bnRpbWVfZDNjb2xk
X21hcCk7DQo+ID4gPiDCoH0NCj4gPiA+IMKgDQo+ID4gPiArc3RhdGljIHZvaWQgeGVfcG1fc2V0
X3dha2V1cChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiA+ICt7DQo+ID4gPiArCXN0cnVjdCB4
ZV90aWxlICpyb290X3RpbGUgPSB4ZV9kZXZpY2VfZ2V0X3Jvb3RfdGlsZSh4ZSk7DQo+ID4gPiAr
CXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldih4ZS0+ZHJtLmRldik7DQo+ID4gPiAr
CXN0cnVjdCBwY2lfZGV2ICpyb290X3BkZXY7DQo+ID4gPiArCWJvb2wgd2FrZXVwOw0KPiA+ID4g
KwlpbnQgcmV0Ow0KPiA+ID4gKw0KPiA+ID4gKwkvKiBDdXJyZW50bHkgV0FLRSMgaXMgc3VwcG9y
dGVkIGZvciBJMkMgb25seSAqLw0KPiA+ID4gKwlpZiAoIVJFR19GSUVMRF9HRVQoSTJDX1dBS0Vf
RU5BQkxFLCB4ZS0+ZDNjb2xkLndha2UpKQ0KPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4gKw0KPiA+
ID4gKwlyb290X3BkZXYgPSBwY2llX2ZpbmRfcm9vdF9wb3J0KHBkZXYpOw0KPiA+ID4gKwl3YWtl
dXAgPSByb290X3BkZXYgJiYgZGV2aWNlX21heV93YWtldXAoJnJvb3RfcGRldi0NCj4gPiA+ID5k
ZXYpOw0KPiA+ID4gKw0KPiA+ID4gKwlyZXQgPSB4ZV9wY29kZV93cml0ZShyb290X3RpbGUsDQo+
ID4gPiBQQ09ERV9NQk9YKFBDT0RFX0QzQ09MRF9XQUtFLCBXUklURV9NT0RFLCAwKSwNCj4gPiA+
ICsJCQnCoMKgwqDCoCB3YWtldXAgPyB4ZS0+ZDNjb2xkLndha2UgOiAwKTsNCj4gPiA+ICsJaWYg
KHJldCkNCj4gPiA+ICsJCXJldHVybjsNCj4gPiA+ICsNCj4gPiA+ICsJZHJtX2RiZygmeGUtPmRy
bSwgIldBS0UjICVzXG4iLA0KPiA+ID4gc3RyX2VuYWJsZWRfZGlzYWJsZWQod2FrZXVwKSk7DQo+
ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gwqAvKioNCj4gPiA+IMKgICogeGVfcG1fc3VzcGVuZCAt
IEhlbHBlciBmb3IgU3lzdGVtIHN1c3BlbmQsIGkuZS4gUzAtPlMzIC8gUzAtDQo+ID4gPiA+UzJp
ZGxlDQo+ID4gPiDCoCAqIEB4ZTogeGUgZGV2aWNlIGluc3RhbmNlDQo+ID4gPiBAQCAtMjA1LDYg
KzIzMSw4IEBAIGludCB4ZV9wbV9zdXNwZW5kKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+ID4g
wqANCj4gPiA+IMKgCXhlX2kyY19wbV9zdXNwZW5kKHhlKTsNCj4gPiA+IMKgDQo+ID4gPiArCXhl
X3BtX3NldF93YWtldXAoeGUpOw0KPiA+ID4gKw0KPiA+ID4gwqAJZHJtX2RiZygmeGUtPmRybSwg
IkRldmljZSBzdXNwZW5kZWRcbiIpOw0KPiA+ID4gwqAJeGVfcG1fYmxvY2tfZW5kX3NpZ25hbGxp
bmcoKTsNCj4gPiA+IMKgDQo+ID4gPiBAQCAtNDIyLDYgKzQ1MCwyNyBAQCBzdGF0aWMgaW50IHhl
X3BtX25vdGlmaWVyX2NhbGxiYWNrKHN0cnVjdA0KPiA+ID4gbm90aWZpZXJfYmxvY2sgKm5iLA0K
PiA+ID4gwqAJcmV0dXJuIE5PVElGWV9ET05FOw0KPiA+ID4gwqB9DQo+ID4gPiDCoA0KPiA+ID4g
K3N0YXRpYyB2b2lkIHhlX3BtX3dha2V1cF9pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiA+
ID4gK3sNCj4gPiA+ICsJc3RydWN0IHhlX3RpbGUgKnJvb3RfdGlsZSA9IHhlX2RldmljZV9nZXRf
cm9vdF90aWxlKHhlKTsNCj4gPiA+ICsJaW50IGVycjsNCj4gPiA+ICsNCj4gPiA+ICsJaWYgKHhl
LT5pbmZvLnBsYXRmb3JtICE9IFhFX0NSRVNDRU5USVNMQU5EKQ0KPiA+ID4gKwkJcmV0dXJuOw0K
PiA+ID4gKw0KPiA+ID4gKwllcnIgPSB4ZV9wY29kZV9yZWFkKHJvb3RfdGlsZSwNCj4gPiA+IFBD
T0RFX01CT1goUENPREVfRDNDT0xEX1dBS0UsIFJFQURfTU9ERSwgMCksDQo+ID4gPiArCQkJwqDC
oMKgICZ4ZS0+ZDNjb2xkLndha2UsIE5VTEwpOw0KPiA+ID4gKwlpZiAoZXJyIHx8ICF4ZS0+ZDNj
b2xkLndha2UpIHsNCj4gPiA+ICsJCWRybV9kYmcoJnhlLT5kcm0sICJXQUtFIyBub3Qgc3VwcG9y
dGVkXG4iKTsNCj4gPiA+ICsJCXJldHVybjsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlp
ZiAoIXhlX2kyY19wcmVzZW50KHhlKSkNCj4gPiA+ICsJCXhlLT5kM2NvbGQud2FrZSAmPSB+STJD
X1dBS0VfRU5BQkxFOw0KPiA+ID4gKw0KPiA+ID4gKwlkcm1fZGJnKCZ4ZS0+ZHJtLCAiV0FLRSMg
Y29uZmlndXJhdGlvbiAweCUwOHhcbiIsIHhlLQ0KPiA+ID4gPmQzY29sZC53YWtlKTsNCj4gPiA+
ICt9DQo+ID4gPiArDQo+ID4gPiDCoC8qKg0KPiA+ID4gwqAgKiB4ZV9wbV9pbml0IC0gSW5pdGlh
bGl6ZSBYZSBQb3dlciBNYW5hZ2VtZW50DQo+ID4gPiDCoCAqIEB4ZTogeGUgZGV2aWNlIGluc3Rh
bmNlDQo+ID4gPiBAQCAtNDU5LDYgKzUwOCw3IEBAIGludCB4ZV9wbV9pbml0KHN0cnVjdCB4ZV9k
ZXZpY2UgKnhlKQ0KPiA+ID4gwqAJCQlnb3RvIGVycl91bnJlZ2lzdGVyOw0KPiA+ID4gwqAJfQ0K
PiA+ID4gwqANCj4gPiA+ICsJeGVfcG1fd2FrZXVwX2luaXQoeGUpOw0KPiA+ID4gwqAJeGVfcG1f
cnVudGltZV9pbml0KHhlKTsNCj4gPiA+IMKgCXJldHVybiAwOw0KPiA+ID4gwqANCj4gPiA+IEBA
IC02MDIsNiArNjUyLDkgQEAgaW50IHhlX3BtX3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgeGVfZGV2
aWNlDQo+ID4gPiAqeGUpDQo+ID4gPiDCoA0KPiA+ID4gwqAJeGVfaTJjX3BtX3N1c3BlbmQoeGUp
Ow0KPiA+ID4gwqANCj4gPiA+ICsJaWYgKHhlLT5kM2NvbGQuYWxsb3dlZCkNCj4gPiA+ICsJCXhl
X3BtX3NldF93YWtldXAoeGUpOw0KPiA+ID4gKw0KPiA+ID4gwqAJeGVfcnBtX2xvY2ttYXBfcmVs
ZWFzZSh4ZSk7DQo+ID4gPiDCoAl4ZV9wbV93cml0ZV9jYWxsYmFja190YXNrKHhlLCBOVUxMKTsN
Cj4gPiA+IMKgCXJldHVybiAwOw0KPiA+ID4gLS0gDQo+ID4gPiAyLjM0LjENCj4gPiA+IA0K
