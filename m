Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C163C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 20:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C818D10EAAE;
	Fri, 11 Jul 2025 20:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWnoGHjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BA410EAAE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 20:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752267000; x=1783803000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xBskDZSaVzSUq+kk+m5dI7X+LG8Fn51lk5s7zSD8Ur4=;
 b=dWnoGHjQENiBHGytkQQZXmxva4KoDdm41L2LUEentikeWAbJ/QrQNmRa
 DRa74ALkorZzGEFwc5aabXfmj92AIY7SpiuymsrvvQMhy/lm6FPe1irWR
 uI1waRsP2GXByQtqhZjYCSDWyaZX+J6ifLUWbQgwCLZMt+H22fcLUtJhr
 IUaxTdmyzXfG6IuoVD3wqsQ6pwDyasGMNfiIj/pip4pSHoFbOkXUNvERB
 qbNmkk4zKh1qAqR2zuHNDF5a/DC0nuWytzYi/Hcng5gFpJoh2gwB7HibR
 jSqgxXDXp1QLY7UpzvYd3cqpsSQXWmPWWK99m2Vh8EacIkNMW2vRtDo2N g==;
X-CSE-ConnectionGUID: 1raK6+WVTiWZpQKaGT1H7w==
X-CSE-MsgGUID: DMpgB3gAQBytt0ktixduEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57185616"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="57185616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 13:49:59 -0700
X-CSE-ConnectionGUID: x5YTcoETRE6UNaBM8/+kSg==
X-CSE-MsgGUID: 8TGkrUaRRva7FU3uCF2jCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="156543533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 13:49:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 13:49:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 13:49:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 13:49:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOFCM+8RZlYWk/T+XiAXvSoVXTXrvABofXVC6guKGtwPAmwsbk+vxYBzn4cPUP3/fBB0dUmgNnxt5oflqTbvyPsOp2v/ryYaAVn6cBnL/NOqcw8Q6g6kJpGMfj4A142D/ZzWTk9tgt23vveHqlI2fUXHJSGUFE7btstGjDPm5BK4aZK+9Jh6SLMGq+vU2siweg5DE/TeYpXN1xfU7odVFThu9oAaXfaT6ktXA1wRJCeIOUk/XugdMtUODuJGrzwvOSAdJgt8+M92p9U4e2P6HSenJeit/2BBBV2WU7SGXMfyaeLSbmggOFaR0iwHwXhBOmn5KtNlexJeDTih+tl9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBskDZSaVzSUq+kk+m5dI7X+LG8Fn51lk5s7zSD8Ur4=;
 b=XZ5wCBhHaCCdDfi30AKc2N3sID2Mg6Ud9PLk5t9cfESs+lNVxngefFtk+zLF/xseZmRYj0hc1RecR4mf0juWbLFhnH40TF24t/SeHgzSKUQkOZl6ShJVZKr5fyoksePhD9vuaY1Fn6IzMy7iRQRrp/xSi+p5jEgd6nwzLLCDO4BUqV04w5J1gwMD8Tci8P+hOz/q1RUDPENX9x9ji7tDvgTazAQ9NX98s3wI5D9jtqqJCrd2KkNBeni8LjykFAl76CcULatwqQW5trM18cJphHSLegQqS8IhSY+WMw5z1WereahP2tieY1Heuk6HaCl66ypTrZ1v9C5/ulU9GScHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 20:49:51 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 20:49:51 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v1] drm/xe: Don't expose device attributes for VFs
Thread-Topic: [PATCH v1] drm/xe: Don't expose device attributes for VFs
Thread-Index: AQHb8pcyww5EjVawgEu0c6lzUOsr/7QtZX8A
Date: Fri, 11 Jul 2025 20:49:50 +0000
Message-ID: <f81ace5191cc4e7ca1023d69ff88253afaeb6638.camel@intel.com>
References: <20250711190808.2743402-1-raag.jadav@intel.com>
In-Reply-To: <20250711190808.2743402-1-raag.jadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB8401:EE_
x-ms-office365-filtering-correlation-id: ce37d98e-baa9-489b-0bc7-08ddc0bc7b30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXJSMldWTVdHNnB0M1JRa2VVRjhhRHI4MCttRTdkU2FmaVNIMkpTRTNMK1RL?=
 =?utf-8?B?bGU2OFlnM2t5NHZMR1ZYMzk5cjArQmxVVjdJbmZVWm1VSlJyOWMrdlNHWUU4?=
 =?utf-8?B?SHpLTkZnSG9qSGFIb1h2dEV5eDFkWmhYNENPdHFBdkF0eU8ySTBNVmZXMk1B?=
 =?utf-8?B?d1F1TmQzUU9pREhoSkhEbm5nS3dkL2JGNjM0VG41amFrMGpKZ0hJbVVrb3lG?=
 =?utf-8?B?YktjSVpjUGovbkJiamhocC9VY29jRzhHU3BwMTFiV3hkckJXdSsxWGEwSVJi?=
 =?utf-8?B?azY3NnFHYk55NXRmZENQVVZvUEdjeGlGUHg1RUlTSVcwaXhKVHZ4eWp1VTlW?=
 =?utf-8?B?eWJ0cmg0WkgzQVQweVVaWnBpczcvQU9pSjdrd1BpMWpFMUFNZ2pXRFFid0dt?=
 =?utf-8?B?cVpqVVlhZDF0cFJ1M3VZVisyTkpXNWdSMnNPaklJbmJOSUc0a3JXRkUrTGFk?=
 =?utf-8?B?QUVjbnk4UWJlMGg2ZXAzM21NVWxsZmd6VWRQdkkybW5ic29oUWhjUXQvTnJk?=
 =?utf-8?B?S2Vrd0RNNmZtajYzdFZ4VWc5TmJObU93WUN5eXNmVm04a3loa0UzM0JQU2o1?=
 =?utf-8?B?K1dGTFhldTRhVGFJc3ZpMyt4NTVmMEhYSzU0RG1XVHJvbDJoUDBtSFhUUk1v?=
 =?utf-8?B?OFNMd2Z6dTNxN2d2RTZRWTJBdmM0aGlzTi9acEJ0S3plSVpjU0UwMDdFaXR5?=
 =?utf-8?B?ZHF0bGtxOE03eWVUUVd6ZU93c2RqSUlBZE01M01PRzM0WUJuOFJFK0VobytP?=
 =?utf-8?B?cDhmNEY3TC9aeit4clVEYnlYaTRaamxGTnVaTkFVeFVSTWVvWWZ4aGdtdTZI?=
 =?utf-8?B?K21pVGxIaU9ZNkxhSll3Tlk2aU1xd3VINXQyRngvVzVZMmlvNmloNWhRTEww?=
 =?utf-8?B?NTVibGVzR3lwM20vMjhma3plZm1RQkxzN2s0YXFYVnFPdFMyUW1kUXVYRmZs?=
 =?utf-8?B?aEhlMHYreDdaRG9kNnlFQnpZNTJ3S3IzVUhWd2JSUDR6OXZaQXRYWm9ZdU5p?=
 =?utf-8?B?RTY3ZUpiZDNuK2g5Y1gxOWQ5c0t4U2FseTFSU3lKaHhpTUV1NWo5akVuVDIr?=
 =?utf-8?B?K3oranRSMEhqK3dDdkd3Z0s0QlQ5UEhmZSs4VjRnSWNNbnhxNTh3aEcxdkZM?=
 =?utf-8?B?K2N4Tk94b2xkNHhLMTZuZGRyQ2p4UzdDQmxRWVphMDJxZklCQjVJYzlRbklL?=
 =?utf-8?B?QmxzbjJqaGZ3QlVQT3BNdk0vV3pKampudGxXTThBbXBLck5ncTdGNmFwSDRT?=
 =?utf-8?B?WWNMWHk5N29NbEkyazJkSEpvMnVhNE4zVDVpTFdVMzA4N2hDUWJuSEdEUytB?=
 =?utf-8?B?SDJLNzNuYXg4ZmFOWDJXR2JDRmNoRmthaEw3ZFEvU2Y5TDU5eExKaVhWeUR4?=
 =?utf-8?B?NStLQml0WEZlcEJVV2U3dFdIMmpvR1J2R292REFzN2FyaC8rSGl3aXE4cnBI?=
 =?utf-8?B?TnFlaDFsdHRvU0RRS0FqbUZyZUUxZW1YM0xmeXVoRVJjWVdkc0Q3c3B4YmpE?=
 =?utf-8?B?N0lVeWJ2RDJ1cllrVFgvbVFmTU5vb1U0ZGtqejFTQW9peXhKVytBMXhPSEFR?=
 =?utf-8?B?MS9UNlJNemNvaEcvVE9zNEpHbGhnM016MHc5WnVDd3k3WGk5dmFuVlFDK2RX?=
 =?utf-8?B?Q1hCaGltNXNMc0RXbGtha0o5cXRLS3dqY1k0djFUekdXZjFtRU5oVk1HS3Bo?=
 =?utf-8?B?M3p3NEQweTZQbURmYUQxa01XOEIrL2tOcGM3MkJTWk1zbkdYZkx2aGh6ODlP?=
 =?utf-8?B?bmUxbTRYN3NDanVlb0VOUytlMHVoeWw0eGZGbmVTa3o1UnkxQ0hsSVgzVURF?=
 =?utf-8?B?cUZML2FOcG5HcWNDS3VHQXIrWEFhb3REeGlTSXU5RGVMcWo2UEhDdmQvdks5?=
 =?utf-8?B?YmRBN3c4MWJxNGhiN09uVzJ1OU5sY0pYWWh4MUt0Tlh4YXhwbW9YQlhKRERk?=
 =?utf-8?B?TzQ3Q3dUb2dycVduQmhUaDFHaFR5WnBmTjBuY2IvSzRDdy8yV1ljdWlhSXZP?=
 =?utf-8?Q?psvcN5xWVJyCYpJLksKtrKZlqQg2Q4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXdaTTV5aWhJRGg3ZkhlWTVxcGo5cHRhNzNpUnU4SEViRS9mWE5paGZVOXhv?=
 =?utf-8?B?QjhRZVlmc040ZU9sM1gyK0loWDQyVjRmUFhFSGhYYUdVdW5ScytxUGtkY2Y4?=
 =?utf-8?B?c2RBVXNRazdrYVFuREZJZ1pBOURxUCtOUTJhaVhFSWVUV20wb0ludnhkQ01Z?=
 =?utf-8?B?MjJITGc1RktCa0E2OFZoZ2k1MXhoSEQ5VXpjanRJdjdxUlR2WEZnMVo3RHdO?=
 =?utf-8?B?dW9SWjJOZEJpNThXYnRhdFVHUGJYQ2lMRC9UTmE0Y3cwUkxNOHlJeG9Kak1B?=
 =?utf-8?B?ZEJoSlllc3dvVlBrSFM0eGdNNUV3Rm1uK0VSTU5JTkowNnJRS1pEVEt3V0kx?=
 =?utf-8?B?SXp0OFNJQSswS3JtcDFRdXI3S0lxc001OGhsdUlwM1lxSVY3OFZvWmJ2b2Fk?=
 =?utf-8?B?NXlieUxFZ3orVmdBOFRXVW02Qm1McWFXY3hsYis4ZXY0ZDIvUlhkQ01Rdys0?=
 =?utf-8?B?VFBHVHRxQXppTVg5REgwWlFFTTJZL25YcjVUZTVxa05iWEEyemFoZktXREN6?=
 =?utf-8?B?ZjlMeDVsMkI0U0NCT3dDQmZhR2p2cGR4SHEwZW9WU21QM3VCREd4MXc0YStD?=
 =?utf-8?B?cENYK2htVTREOHJpV3Npa0RwcHBDVlVPRWRib2ZSaDZ1eklRU2d6VGEwcUJi?=
 =?utf-8?B?VjBTSFVEQ042bmloS0tocmJhWW84b3RIZDdic25aeFJLRDdOUGFWMVBOZXFN?=
 =?utf-8?B?QU5uN3dEQXAvZUF6bWVUeFEyOEpuUnpCWi9obHFyWjBaZTcxUmx4eG5HaExH?=
 =?utf-8?B?d0JvNW9sTm9iYVllM05qQkVrNlFCWmw3NjY5VUtxMjUrbUhPR1JLUG03MmtD?=
 =?utf-8?B?dnM5aVphVVd5R0RZY1NPem8zV0dvUjhUaFhsNUtnQ05vcDlOU2J0b2tqZTQ5?=
 =?utf-8?B?NGdaSjBRZFF5WDZlNUVQR1NpdVIyV3pDSHdKTUsybG10bUNVMUZPWjVPdXU0?=
 =?utf-8?B?cEFQM1ZEOXVnWWZiTlExRk5xSHB3Mit6ZGNROEoxalQwbi9RR1F1azVGTCt6?=
 =?utf-8?B?QmRIbm5tRDgwMFh5RkdaWml0WTh4aGR5WDEwSWJBazh2UnF1MDNXbjFWOEdI?=
 =?utf-8?B?cHN5QmEvb2ZRWDdseTY4MVYrbTUvNTdBekEwNEVpc2R3d2t2VFBXNVRYMEQy?=
 =?utf-8?B?WklncEVLL1NQM1N0SHJZaFhLMUl1ZHlOcTQxSE5vS3VFbFcwcXp4UGpNY2tF?=
 =?utf-8?B?RmdwNThubkxNRFNuZVVpWUN6NDVaTUVRRE1vYVQ0UUkvOEs3RUZuejJKU0Q4?=
 =?utf-8?B?TVF5eGtBdlVMcXhSNmlDcGhrc1RvaEtOLzRidlVGL3ZDcVVHa0t2YzNpSGN4?=
 =?utf-8?B?NWtJTDdDQSswVVZOcG9vTEQ4T0tYVEhiZGZaQzIyUUUyTXE0b2ZmWEpyUmY4?=
 =?utf-8?B?THdwUGEwWHcydXNPaVhwbmRSVUlqcG92cWhiN0NYSXlnUjNnTWd3ajlsakI1?=
 =?utf-8?B?Z1BoWXZSdHpHZ2xrbWVxZEsxNndEdHdmbDFPdUlPODdyWFcxVlA5VEVUY29E?=
 =?utf-8?B?N1NIZXRTa2taZ2VWOFRsOFlKajBKOFduNHVCMnZuUkJWblVaZkVzY1cvd3R0?=
 =?utf-8?B?dHJ1bTNOV2d3WjR0MDFueUtmLzhWRm45YmNHWWFGUE5sendhcGlvTUUrcXc0?=
 =?utf-8?B?eXNpTkxUcmpOeXhyd1pMNUhyY0hQTEJzTXo1TE9mczNOUDhmQVJVTjVnZnlU?=
 =?utf-8?B?YUU2MjErR2pZQ015TGN4S01kR2hKMGVSeEhhNGNwZ1EzZmhvQlJLelh2djJF?=
 =?utf-8?B?ckdHaFV3c2hsck90OHNQdDVrOHlEZEU5bzJBR3IzOWwzZitnYXVhSzhXRUZ5?=
 =?utf-8?B?ZXhSdkFvaXBBQzN0T2xEd1VrT3Nmclk1WEJ5TEV1RWNlQ085NjFWQWgvTnBB?=
 =?utf-8?B?UnRIYlNZRkVJVURlbE1zQVc5RDdvU0tIWG0yZWZDcWRYUUgrajUvTGFaMkNJ?=
 =?utf-8?B?YWh2MGg4dmcvTGxRcTNtY1preWxBOENLZU1ENi9OcDdIU2pSS2RPUVcwdUlu?=
 =?utf-8?B?U25JaGU0KzlIa05rOWttbWhkRnE5VzdCcTZDSnpxOEU5UkdJWjdtV3drY3Er?=
 =?utf-8?B?VGRSRG5Lb2hTZWhoM282N0VWTlo4djBFbFJSK0E4RFFjUGVQVzBtbUNNcWEv?=
 =?utf-8?B?WGw3aVlOVndiRmVvc1BqdFBSdUpwNXIrWFoyZG9scmovQm1GUHpPSU9CNEtl?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1D3744F36108F47AB6CA28172C7078D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce37d98e-baa9-489b-0bc7-08ddc0bc7b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 20:49:50.9286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XU3HvnEH46YQnjsFTjXLRb6OdhIM0tjO77ckUQHl9uw7OU9wSpSWEWl8sBCq2MaQz6RNrwn309hIyC5tRNyjnpmniZYAZow3QmmGzBW97s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
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

T24gU2F0LCAyMDI1LTA3LTEyIGF0IDAwOjM4ICswNTMwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBD
b21taXQgYTdmODdkZWFjMjI5ICgiZHJtL3hlOiBEZWZhdWx0IGF1dG9fbGlua19kb3duZ3JhZGUg
c3RhdHVzIHRvDQo+IGZhbHNlIikNCj4gdHJpZWQgdG8gZml4IHRoZSBzaWRlIGVmZmVjdCBvZiB4
ZV9wY29kZV9yZWFkKCkgcmV0dXJuaW5nDQo+IHN1Y2Nlc3NmdWxseQ0KPiB3aXRob3V0IHZhbGlk
IGRhdGEtb3V0IHZhbHVlIHdoZW4geGUtPmluZm8uc2tpcF9wY29kZSBpcyBzZXQuIFNpbmNlDQo+
IHRoaXMNCj4gaXMgdHJ1ZSBmb3IgSVNfU1JJT1ZfVkYoKSBjYXNlcywgYSBtdWNoIHJvYnVzdCBm
aXggd291bGQgYmUgdG8gbm90DQo+IGV4cG9zZQ0KPiBkZXZpY2UgYXR0cmlidXRlcyBmb3IgVkZz
LCB3aGljaCBjb3ZlcnMgd2lkZXIgcGNvZGUgbWFpbGJveCB1c2Vycy4NCg0KSSdtIG5vdCBmdWxs
eSB1bmRlcnN0YW5kaW5nIHlvdXIgcmVhc29uaW5nIGhlcmUuIFdoeSBjYW4ndCB3ZSBqdXN0IHVz
ZQ0KYSBjaGVjayBhZ2FpbnN0IHNraXBfcGNvZGUgaW4gdGhhdCBjYXNlPyBWRiBtaWdodCBiZSB0
aGUgbWFpbiB1c2VyDQp0aGVyZSwgYnV0IGl0IGlzbid0IGluY29uY2VpdmFibGUgdGhhdCB3ZSB3
aWxsIHVzZSB0aGF0IGluIG90aGVyDQpzY2VuYXJpb3MgdG9vIGFuZCB0aGVuIGhpdCBhIHNpbWls
YXIgcHJvYmxlbSBvZiBhY2Nlc3NpbmcgYW4NCnVuaW5pdGlhbGl6ZWQgdmFyaWFibGUuDQoNClRo
YW5rcywNClN0dWFydA0KDQo+IA0KPiBGaXhlczogYTdmODdkZWFjMjI5ICgiZHJtL3hlOiBEZWZh
dWx0IGF1dG9fbGlua19kb3duZ3JhZGUgc3RhdHVzIHRvDQo+IGZhbHNlIikNCj4gU2lnbmVkLW9m
Zi1ieTogUmFhZyBKYWRhdiA8cmFhZy5qYWRhdkBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYyB8IDYgKysrKy0tDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gaW5kZXggZTVmZDBjZDUzN2JjLi44MjUwYWE0NjIw
ZWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gQEAgLTI1OSw4
ICsyNTksNyBAQCBhdXRvX2xpbmtfZG93bmdyYWRlX3N0YXR1c19zaG93KHN0cnVjdCBkZXZpY2UN
Cj4gKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dA0KPiDCoHsNCj4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBwZGV2X3RvX3hlX2RldmljZShwZGV2KTsN
Cj4gLcKgwqDCoMKgwqDCoMKgLyogZGVmYXVsdCB0aGUgYXV0b19saW5rX2Rvd25ncmFkZSBzdGF0
dXMgdG8gMCAqLw0KPiAtwqDCoMKgwqDCoMKgwqB1MzIgdmFsID0gMDsNCj4gK8KgwqDCoMKgwqDC
oMKgdTMyIHZhbDsNCj4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+IMKgDQo+IMKgwqDCoMKg
wqDCoMKgwqB4ZV9wbV9ydW50aW1lX2dldCh4ZSk7DQo+IEBAIC0yOTcsNiArMjk2LDkgQEAgaW50
IHhlX2RldmljZV9zeXNmc19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiDCoMKgwqDCoMKg
wqDCoMKgc3RydWN0IGRldmljZSAqZGV2ID0geGUtPmRybS5kZXY7DQo+IMKgwqDCoMKgwqDCoMKg
wqBpbnQgcmV0Ow0KPiDCoA0KPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfU1JJT1ZfVkYoeGUpKQ0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ICsNCj4gwqDCoMKg
wqDCoMKgwqDCoGlmICh4ZS0+ZDNjb2xkLmNhcGFibGUpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXQgPSBzeXNmc19jcmVhdGVfZmlsZSgmZGV2LT5rb2JqLA0KPiAmZGV2
X2F0dHJfdnJhbV9kM2NvbGRfdGhyZXNob2xkLmF0dHIpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChyZXQpDQoNCg==
