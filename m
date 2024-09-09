Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27BAECE585
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 18:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778B910E634;
	Mon,  9 Sep 2024 18:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTG/FWeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4101010E635
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725906449; x=1757442449;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HxRU9FyVxG1Rd3rRVAtrxWweYdbV7/C4+OLSnSUxzHY=;
 b=OTG/FWeJNFBbp1wmqA5P17uOcSlVDfskDmthZPr5hmJlf/Nq6EbqmW8R
 Q5BYtG14RgHZw0BVMTl2gi1oB7tjXKJC4xvZX1VCvuRNzcWZ+03wxwh2t
 AVwqxYAzZlDGWAI0JmsybhQxFK2AMU+iVh1MTIrElGYN1W28e7KtpDWSL
 Pun8o6KVz3IpFlvEToIuOXWDnEEtAMpcGsXgXsSYdeiZdAYFMLNkfqJJC
 RT2zYG2RrluwsdLHiK08duXWEaSSC+B9E0iAfI/zJDo9Gkx1zUyQ/jSLq
 /T1QROySf58sH+K8HAbjTQiXy26bR+zcWFuBBzIjuwUMzl8hrWpmDhfcx A==;
X-CSE-ConnectionGUID: 83U6qf/oQNeWK68ra9C1pw==
X-CSE-MsgGUID: AUTJlboKSOqSg11BH2PV5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24813008"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24813008"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 11:27:29 -0700
X-CSE-ConnectionGUID: bOATm2B+SgiYFKiu/dRVwA==
X-CSE-MsgGUID: 43uEan8HS72r14gKJpgMfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="71356603"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 11:27:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 11:27:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 11:27:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 11:27:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 11:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja4OQbM0n49YT46YwVo6UbiddT3uqUXgoedoqd1QEEStygwJAoKw+52b9C4iRqC4mB05kEQfrxlwbxvX96m13mLVrq/mh31PQfJXX6czeRe8cKLiSquqLmYSMgQBLKtJRfu1cGFk+MvsCe7P28wUrPiMEU8mocqdYUoVzyrGAMOwNdEBO9dU/mHGboSPaVVcg2xsYqe7sHrBEpDlFUwMtyJP2VYGjMNJdrUJaDEeYqaQowENhINuZ2fNn3DqmWYgu0cP0NSiyqQr5G/KrV8oMdKAn9cPCt0QKYjQWfx8/Y1Dg5r/Gb/v4jinq53u+btIeX/KXw19VU0bCgzTvrVndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxRU9FyVxG1Rd3rRVAtrxWweYdbV7/C4+OLSnSUxzHY=;
 b=cgVsswQOrrQEaLsSTjs5Y4n7f8/U0eqa/QOUyDOoxY0lsQwwBaBHfg5249UYFbYylF42jX6SsacI8pq5/3m033xFh7DH3MwsreyS4UFK1A4OpoOLcrqcI7Vs+l4Wdz7MRREMbSTFT6aumnHvXYjhm+pzJFhZDDZBnsSAQM3w96TfDkhwUgmY3exFts+bx01tSmZlOO+BTaMolL24sz/c/RP93wxEe+DVefdJq5y4DqRie6b9kEIzVAsiQo1l7Mi1sDjr6X2qrgiHNaRMQQyY9C63KlPKu4eEmRjMEmjW+DthzeHMHdktBrqqJReY6dVnhMhBdeIWa81YgM0+xGBSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.17; Mon, 9 Sep 2024 18:27:25 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 18:27:25 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v18 2/6] drm/xe/guc: Add XE_LP steered register lists
Thread-Topic: [PATCH v18 2/6] drm/xe/guc: Add XE_LP steered register lists
Thread-Index: AQHbAKr6FfHWQuayr0i9tn30iIiSNLJPyn2A
Date: Mon, 9 Sep 2024 18:27:25 +0000
Message-ID: <9cb6e044dc4ed7ed779e3bcc0d836ca4446b49c5.camel@intel.com>
References: <20240906222006.279581-1-zhanjun.dong@intel.com>
 <20240906222006.279581-3-zhanjun.dong@intel.com>
In-Reply-To: <20240906222006.279581-3-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4820:EE_
x-ms-office365-filtering-correlation-id: 6fcd6fb8-125c-4aa2-ea53-08dcd0fd0db9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Tk9Od016ejFBNVF0dU9DVTZVUUNDSFYyaGl5aEpXR0luTXF0UzA2MFE3VzR0?=
 =?utf-8?B?dEk1c2llV2tKWjBHRlJKajVZN0hYVU4yenQ1b2lpOXhwUmZJNzdINVlwNS9p?=
 =?utf-8?B?ZThaSFdndUhhTDRsWFBRdUdhUUxZN3ZGNzcxc1BtdklXMCttR1JTeXBkRkpr?=
 =?utf-8?B?bGY2UGFLZUg5SW9LaERNV2RVK2tFREtYcWNKU0hqZXBlN0wyQzVJaWtvR1lJ?=
 =?utf-8?B?M2VQK0swSFhFeHB0V0Z3Uis2OUMvOVBWRTg0NWRkcy9zSU5FbmRXdzRUYmdo?=
 =?utf-8?B?UDFpZkJmanJIU3JySTdFV3M1K1FncUhBMEVIVmdLYWRlZHJjb0ZBUzRBTWV1?=
 =?utf-8?B?dmwvczVoako2VlhpdWxEZnNMRGxnYnFZa0VNTlpMaWlYck9OQWhIemNzSHZv?=
 =?utf-8?B?TjlzUmRkSDB5NVAvTGNvVFBWU1drNkFZOHNuZEQrQXJNY3NDSlovdVQ5ckU3?=
 =?utf-8?B?bFY3SWt0TDRhUmdVNDJXekR6V1FrYlIxcGwxYmlJeTdlU2NjZkdBbmlud1U5?=
 =?utf-8?B?VElKWUtQSlgxZy9xdG01NGZGSXNmby9qNW1WNEZGL2NqSUN3bDM3clJ6YWZW?=
 =?utf-8?B?WUc3SzR2dW1YZFIxMFd5NDBjVWxqOGQvSWV3aFNvODJuZXJYUE1ydXVMY1Bz?=
 =?utf-8?B?V29ZM3lkK25weEtRazNUc0R0Snd0L0xEZ1M0NE1DRmptVExFMzlJYUJYdDZS?=
 =?utf-8?B?alBDTER0QjVjY2VmUVBXaE9vVlBQK1A1bE4vdFlDOGloUEN2MGVtamFwd1By?=
 =?utf-8?B?OGQ3dW9wa0JBMFZvcWhOY1dTaDVkTDlJOCtDQWdGRm9HTk9sYUFGQnlkTHdT?=
 =?utf-8?B?QnBxUHFkeWx5RmVsK3MvMXIxQnpVdGM3N2xYNWc1WWRFdlZob3RtTzNrYjV3?=
 =?utf-8?B?S1dJRWE5d2dnVHdaSzI5TGdLeHFUelN4ZlF2OWJzbHg1QkQ0ejU3dE91cEhU?=
 =?utf-8?B?bi91UnZWeTBQZUVGeTlUQjkyME10dmE5U3lKbHRkdVlEZnhkajV3SHFjbzZt?=
 =?utf-8?B?NXdBalkvakVKVjJzUmxWTjVWK2RwY1pFeWZyQitLTTF0MkNoejU3OGh3Q0pU?=
 =?utf-8?B?dnA1aDdMbm5uOEJVNnNTWWNrUDRPUDVhdDBTVkVCcklsV1NlZ1V3THRDSkpB?=
 =?utf-8?B?WEpWaTMraUdnZHRHRVpWU2d4YWpXM1RTRStacEwzN2l3MncxNmdvdEhMTzB0?=
 =?utf-8?B?VEJuVERLZlBybG5VSXMwR25WUkowbit3b0h5bVF4WUlNTlNrdkNGT3hqV2tw?=
 =?utf-8?B?S2JldXZPWVYxakl3WWhaR3pHUm52M2lIVTFXTzhUMS9mNmhpV2pmWDY5enFG?=
 =?utf-8?B?d2p3T1loT0hHUzlYZlo2bWJlRThia1FKcWNQUVhTWWdYc1BOWlZ2cVRSZ2lk?=
 =?utf-8?B?S0d6VGhwcE1VSStwS3VEY2ozZFNrL3YyWVFUSHVxVkJWY2M1UjlKTzJQaVdQ?=
 =?utf-8?B?dWltUVVmVnVTTEJ6TVYrU1Z2THNrQzBySGlBSjhWV3Z1NHVGZXoyblpQZ2ZP?=
 =?utf-8?B?dXRJSFd6U29lc0ZqOFBZWXdJZVZ3QUNaQXE3Q3haclJsZkttV3ZDcnBOc25z?=
 =?utf-8?B?akIvN0dwc1BxZmVOcHIvNnh3VDlvbEpkYWF2UkltVkMwb2QrekJMMDVibE14?=
 =?utf-8?B?R2JiOEdVY054Y2liZnBVK0pScHQzN04zMitCWCt3aGFJYUtHT1VKVVMwMHFh?=
 =?utf-8?B?Und4MmJsRE5sMHFnUjlSSWNrcVVHS3h5aDllbGx5SGh0UitKSi9XUmI4YTRL?=
 =?utf-8?B?eXdYSXhOTlI3UWxNTE1UOGI4bysvVkt5TFZqVUovbnJVVkx3TkdDNWFWeWtW?=
 =?utf-8?B?TjkxemtFVFZhbExWZTV4MGhBbVNiOFJQMWFia0hpT3ViL0pvU0tVdHJMc3JH?=
 =?utf-8?B?Z3MyQjhxVzlpVWhUdGd2Qnd1dU4yKy9JMytpTTdDSDNvTkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFFXNEhEREFWOERqY3lvaEoxT24yUDBTUTFyaXVGMHBWZ3VDSUVJWEFnSXJw?=
 =?utf-8?B?MWFVMXdxcmtEZllqbE92VE9JdXhYNldFRkxySFlhLzB3Q09zOGtncnoydkxp?=
 =?utf-8?B?TmIwcjZSMXN1SGFvbjhvbFFwbFVXRHY5Nm4yZlB3a1YrcE4vK2RSNnFESmNG?=
 =?utf-8?B?cVhSZlpXMkYvamtKNTFCUjJMT0RzYTA3UC8ySnJNcUVkVGpjUU9ubXVvbmlK?=
 =?utf-8?B?SEs4cjdMS0FHS2xrOEFPeXFON2ZwVEJlcktZanMyN1FCcU1LZnZMaVFwSEtv?=
 =?utf-8?B?S1ZkMDRlbklOR1czSFBpNERTUDc2dWNBMWlIN28vODNyR0wzWk5heC9ad2Vx?=
 =?utf-8?B?NGtXT1BLamdpcWkvWk5ISlFmL0M0UXgrczN2TWFYOUk5UTlyMWVweUJac0Fl?=
 =?utf-8?B?WmdoREEyd0RtSWlOSXRCRmNrdGs0b011NStoOEhZNTNYSDdRd29qd1E4QkxF?=
 =?utf-8?B?bkZDalREMlBEclBMZHQyRExBTmIyL2FPWmRjdVZGMWRobXluS2RYOE1qM3Rp?=
 =?utf-8?B?ekw5MkhZdi9oNlN1Vmg3bGVMY3VLOVl4ZWUwU0VxZzJRcmptVkY3Mm5POUpz?=
 =?utf-8?B?QU5sb2ZrQmpPSGw5SWhOb1hHR0RWNjAzOTN3U2dVRFUyTnd5RjdLenNsM2pk?=
 =?utf-8?B?TVU3KzBsbEF1RGNIOFkyc1VBRlR2REJFUHg2RkxEV1pUSmJzUm9vSlBzOS95?=
 =?utf-8?B?cEJwM0hDeUxCVitCQ3JKTzdPRGttaUVucWYzeUszZGNYS0N4aG9mVGh0Zlo3?=
 =?utf-8?B?NnBZcXF1VU9JVm5LSzFhb2tZT3Y0NVpXZjJkdVBsakgyVmJtelRteVJxOS9s?=
 =?utf-8?B?ZlNYMUFlYXZreHVZa3k3NmRENFYzSXNVWjNhZWZwSmlOaElkTkM4S2s5blBr?=
 =?utf-8?B?bHNNTWdwRk55OWxyWFVMeEtXTVRqUEFScHlkS1pRVUpybWNPVjdvT2tkbUpS?=
 =?utf-8?B?WDhIM0dtMEljTHRiWU4yVGMyNzVFblBhU1VnSDZzTUF2TTBDN3Z6T2FENkJq?=
 =?utf-8?B?eUJNc1BNSEN3a3J6UUdIdk1uYi9ORUd4YVhDUmRXZzFTdTJWcWVINkJYOWVt?=
 =?utf-8?B?Z24yNUpqWlVqNkZiem11cVFLV2FNWCtFNDk2aEJ2ME91NEZhb0R6bEVLVHJP?=
 =?utf-8?B?ckRnWDdJRGEwbnVURURzcURGMTc1NTBweFNnZ1VPb1dIUm1LelRVMzk2cXJD?=
 =?utf-8?B?RHQwVVFsWUJjZGh2RGtCbUFlaDV3TWRzZ2ZacmFrcEZscjArdHB1R2ROb0VJ?=
 =?utf-8?B?blJ2a3Yyb1lNY2R2Y2NkRXNrK2doT29kQ1pFQk52RUVHb2kyeVZnNkF5RTNo?=
 =?utf-8?B?b2NGR3VkVEJqMXNmZENHT0FKL1JDMEFHbXNoUjU1U2hYZ3V4ZnNBdGdTSUxk?=
 =?utf-8?B?RVZrOWFyOHJmOXYrUXlvTXFxNUplcnRHVDBRVEtla0wwTzlJSUZDU0hreG81?=
 =?utf-8?B?NXBCQVdQUEZYYk5GQzFqOWkwQXE4OThkT2JoeGpUUFBMd0NYazlTaHoxdnIw?=
 =?utf-8?B?OUNzRmxwWkVVOTJMWFBzd1lLRXpZSEozdS96SWlLUmRBdC9DdXFtbFlaTERH?=
 =?utf-8?B?eitncFBUdTN5N0ZPSU8vZUpFNURWWTMxZUluanVDdDV6YzdhV21ObGR1NjVK?=
 =?utf-8?B?UDROa002WEhsTGtXcEVVTG9XWUhhVlpjWVdrTHl3bjQrWWdkNHY1NmExZmpi?=
 =?utf-8?B?R2JpQmJSNnAvRG9hVU9EbW9mN1d0TkJoTDZTM3NNZVR0ZGt5bVR6R0tSSUtY?=
 =?utf-8?B?dHhYSkFNSVJ3Z1M1S2J5L0V1Vkt1bXUvQlFjVlg4TzNHSzV1T1IwUU9CRklz?=
 =?utf-8?B?c3ZzRGhna1pINWxvRDlHZHV0TXpjK2JvdXBCcVYrUDBtb2lEY0x6enlkRTEx?=
 =?utf-8?B?S2Fpcmh4THByLzB1VjN4WHNqVWxYUGZLaHc0cUtFSHZEdkZ6b09UNklmUjEv?=
 =?utf-8?B?UDBOZ0dEL0NNZlNrMFBtZjcvdFZHZ0N2OGl6UTA1Vm9tRTFpN090K1NzYkhm?=
 =?utf-8?B?dzZwRTFZOE54RmI1bWxXc1F4ZFFDdzNWSGpDZXN3NEJXTXkyRVpOMjEzWjdo?=
 =?utf-8?B?OXRHaThUajF2VmdVYmhUTytqcUd6c2g0eDNwSU1veG5BcHhaZlJVeG9zRWtz?=
 =?utf-8?B?Unc0LytkSjdicFlxTHVCS1VRVXJpc0VtV2gxeE4vNHJidENpeXo1c01oWlF3?=
 =?utf-8?Q?tZiPreKZQtzp+edqPfQieWY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <451F6E3638D2CC4BA3CE103F2446C601@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcd6fb8-125c-4aa2-ea53-08dcd0fd0db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 18:27:25.5079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W50wi8TPnDDhC/k96S1iw1Lj0vEXhk4hVjkThMgIbenpdNB5LDJRtvyswK6lybiW296FC+TNy6Dc9vkejVSWY65B18Rw/YorrxAvk9zCkWo7L/yW2yMTkE3XHvkpG4UV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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

T24gRnJpLCAyMDI0LTA5LTA2IGF0IDE1OjIwIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEFkZCB0aGUgYWJpbGl0eSBmb3IgcnVudGltZSBhbGxvY2F0aW9uIGFuZCBmcmVlaW5nIG9mDQo+
IHN0ZWVyZWQgcmVnaXN0ZXIgbGlzdCBleHRlbnRpb25zIHRoYXQgZGVwZW5kIG9uIHRoZQ0KPiBk
ZXRlY3RlZCBIVyBjb25maWcgZnVzZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERv
bmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfYWRzLmPCoMKgwqDCoCB8wqDCoCA2ICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2NhcHR1cmUuYyB8IDIxMiArKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jYXB0dXJlLmggfMKgwqAgMSArDQo+IMKgMyBmaWxl
cyBjaGFuZ2VkLCAyMDYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQoNClJldmlld2Vk
LWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg==
