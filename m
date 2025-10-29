Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF9ECCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 19:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB5510E82C;
	Wed, 29 Oct 2025 19:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Agxpycud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB6410E82C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761767936; x=1793303936;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T4EGk0SxAQ01Klx/xgqLyjxF4cSYMXcDh0YeOgJfXNQ=;
 b=Agxpycud295pyKszQzLCTJbnKNjwDb+wdO9meBNRTe8JKH6iPJ/904jX
 0NrQwcFYwIBW2gJY/gwSJgHk9BZt0DeSn7sKBfKHECWgQhyfr+DnxRw7Q
 MuriQ0VsgvikwPpaZi/qyCROlX5RZs6i6kU3G5KHAtnzviFcgLvT4IVVc
 6lqbORFXxVuvkpa/SnBf28GEPZU/r0mq8e5CKippFAhZ/80DYlOoV23b6
 F2XnOdAbp3F4CqcRrTTnKIzwUe4WEdzx1T73/sw5RygkdEcccIDmxaN+H
 3+ZUE3oAUedqIquowZ+g6wQhZnRdqS4MOzu3U6TZZ1BNO3JROiaSYkd7r g==;
X-CSE-ConnectionGUID: mdwEtt0QTNmsAV0PujthfA==
X-CSE-MsgGUID: njaHj6WsRrC1ogC4HIrtUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64050107"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="64050107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:58:55 -0700
X-CSE-ConnectionGUID: Mfy9dLu3TISnGvRIDagaOQ==
X-CSE-MsgGUID: Nd5RFiFtRRujBhWhT8sZYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190118270"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:58:55 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 12:58:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 12:58:54 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 12:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+pnhdAbTfiPyh54aNb/EFHbN8P2JmCz1GpN96v+IbAAeJFNrOu2GSZcM/0Oz0eR2vJAaKavn9rc2UnAbuJtGNk2WaA3XX8W1LRFamtXWuIJCAjSEBW8wexghbkyDUhK/LQX7vU0V6aCXOu1xTaruyzwSryuCKNzen7mp8UmIiyxKVTB1kXFBQxyp8wTThr5xDjS2LaPBlz3G5M4rv4VR6+qogCRHyynYXzlOIUuvbRWmEfKEF/CMM0v2j/rvvjqcEYhKJwyatPHonoScE9jjcZbxvXDBbh/cGdzne6IAD16ROUH/GxDd0McDCi6H9sXP4R1gF8aFO940DYBoK7ZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4EGk0SxAQ01Klx/xgqLyjxF4cSYMXcDh0YeOgJfXNQ=;
 b=JJZejP3SCGl34PJeHIiZUBst5qtAX9OCA1vgjgNKNQDME3iDT/jMHrv/NI+/pF3x5cgYUca/IQdJyBPlzD+Btzwmsn4yyyXWZdpmit9XyjwzJa26wwnTjoCxLRPqattGoff9C8RkmHZqNxPHA3JPUC6NQ4+9R73NcYrvrl0wJjm8tpNevVBR0Y+4ZNRNa8538rk6HJZ7DNBv2oX7x+sHgamWB36E6q73t39bY9rHVaLDK/feR+LBjgoC13EIZadYBn9mQiFbdcxB7vL9TQuorN6kk4U74vpAegAaPgBK8lyBvyTL7Q5+1hrNkce3S9OjLygdzZy4WnRlq64X2Kl7rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 19:58:52 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 19:58:51 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
Thread-Topic: [PATCH v5 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
Thread-Index: AQHcSMarIZl50FHCSE2FtEBacP+ow7TZa1eAgAAIuwCAABdCgA==
Date: Wed, 29 Oct 2025 19:58:51 +0000
Message-ID: <984175e33b6669dd3db02cc306465c51f196f314.camel@intel.com>
References: <20251029112014.3747915-4-sk.anirban@intel.com>
 <20251029112014.3747915-5-sk.anirban@intel.com>
 <aQJXIw7zBBy38Dhi@intel.com>
 <ba940a51-9d20-47d4-8b33-6f8241f8edd7@intel.com>
In-Reply-To: <ba940a51-9d20-47d4-8b33-6f8241f8edd7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|SN7PR11MB6797:EE_
x-ms-office365-filtering-correlation-id: ccc72201-4f78-4051-85fd-08de1725953a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cTNlTmlNdHhVVmUvUzJZUXZXYkRJTDRab2M4MUx6YmIrVzJPWWhjRHVwNi9t?=
 =?utf-8?B?U1hQYW9UY1lFRVlMNHo3YXhGL3BWaTl5V2k0WkhPK1N5WjRYcTVnSWpJSFdS?=
 =?utf-8?B?M2t0di9JZXdhanhwSEY0SlVzNXZGaVlVUVh3NzJpaFo3VU4vcWJyWVBCTDVU?=
 =?utf-8?B?S3ZmM3FZTEVnZTdPSko5a2ZWcXBBb0N2N05DUGhNK04xZ080WkhYQ0RBNFNG?=
 =?utf-8?B?WmZTbUhvS2MxWDUrWUl6SUs1bGpVUEVYZjRCRW00N0NlelFZQkJ2eFlzL0hh?=
 =?utf-8?B?L0p4NnRSZStkSTcwMGVVTCtvUWVOSE9ZUEFvcmRnekQ2bm9MbGtwOFhCbHd5?=
 =?utf-8?B?aCtjbldQd3FuVnVPenlRaEVUbFJxZWtoZWhzVGpNemhlZGY0dUkwQTlmSngw?=
 =?utf-8?B?SmlGdy9rNkFjeWVyRm9ZRXhad1NKWDlsWCt1U0hMZG45QitFQ1BlSzkzY045?=
 =?utf-8?B?d29jbDFDeVpUazZaK0VPaDR5ZWptY0xxSFlSdk5LRUphWllqNE1rUUxoOFpB?=
 =?utf-8?B?UVVLTXJoZjZHaXhhdjhlMldkdlBOazFqb1pLZ3ZMM2RSNGVMNXhmbFJwTlA5?=
 =?utf-8?B?V0ZEQkROb1JmaWJzNjVLOUNDOXo3RFBZUVpZeGZmdmRQQTl3bE12NnJmeHFw?=
 =?utf-8?B?WVVBZ01tZUJIdzFZbU10a0MvSGg3OE9mMDlPYmdsTm1lWm1GUlFwdW9Ca1dt?=
 =?utf-8?B?ZkcwNjhjaExDMWZRUDJKeEg4S1JTOGd6ZGpCQmFTOHVTdm5CdXhDQ0hZZ3lZ?=
 =?utf-8?B?QmF3cjRBNHZFU3JYK3hGSmViZjRNQ1lTMFVCbFlWeWx2L3h2dVNVeUZiK1Zx?=
 =?utf-8?B?YTJ0QjBnT0Q1dUNlTFNsNzlQZWk5Sk9FTjU0aVdIQmFUOW9WY3k1aE9GZzdJ?=
 =?utf-8?B?WkIwQmg3ek9Pd3ZDVVpWcUk3WHVKM3ZvY091cUs3ZldKWm1MK1RsQVVUaFBM?=
 =?utf-8?B?NWQ0N1lLalUzL3RRdTRaRlJxSXRtUjZSOFp4aVczM3JTQkhORFJ2bUdVRTRO?=
 =?utf-8?B?VkJqcWxHYkFxcFdaZkZyTUFBTFpueUZJVmNJS0VNcWZ0aHF0NHB3Uk56dy91?=
 =?utf-8?B?K2VIbDczemFyeDhsaWRxcGhEbTdxWXFHTGhibmtpM0N4OVMrYWhtazJGM0du?=
 =?utf-8?B?Yk5SeC9DVGd6STR4OFNwdXBPaDJlaHBPbExndDV3SzVUcExVQmRBMmdKY0FO?=
 =?utf-8?B?SFlsWmY0ZERTZFQybmFDZ20xZVNZRjJDWUExdkZGNk5CTnBid0RWLzhmUG5F?=
 =?utf-8?B?aWdxVFdyRzFCMTR2Z3g5VTNvWU50YVBhL1htMUJLWVpMZnM4YUFuY0dPSDZD?=
 =?utf-8?B?WGpSU1Y5TjJKQWVQWUt1WkxhTVFCeTdZMm9xNUxqcFI2aHNNT1pJSnltRVVL?=
 =?utf-8?B?NEphRW9idkJxU1VFYzBvZnRFN2NNQjJwN3BUYVl6UHFYaTYyRGk3clBESjJj?=
 =?utf-8?B?SkNNSExFd0J5MXphL3Q1c3Awa2NqbmRLekhWaE0rbjVXWENmbHJMRkdqZ25G?=
 =?utf-8?B?M0N1N0NDcFpTYVlISHVqd2pBbmN2cXNQdERKMzlvM3QwWVdBWGtDVFpXOWFP?=
 =?utf-8?B?TDZQbmtHTCsvczJsSEUzNEkzZjRFcSthY2JhNmhKbUdtWWJQcUZ6c0oycjVu?=
 =?utf-8?B?QzBlRy9reEp1d1kwbzZncTZtU2h0RGR3dmpyYjREakhoci85ZXl2SkJvN3hQ?=
 =?utf-8?B?b1gza3paYmxHR0VwakFMdmlXdUtNNE5vQlRLT1JTTVJyczd1R1dtSVo2dWxM?=
 =?utf-8?B?N3RKSG5SQ1kyM2Z1WjRnRklnNzhLcmRSUDFFNWR3cndWSURwWmU3OFkzK3d4?=
 =?utf-8?B?OHV6d3dUQ0xEQWFSQ0haWnNvK01UYmhHNkZvQkhBWDIwdEdacVNvZTVRanNR?=
 =?utf-8?B?OEFDWmJsNVNVeHFSUkE4VTZHbHF6eDhlbVRZbmVIUHBJLzNyZ280UXVhUmJr?=
 =?utf-8?B?cHRremJYZGM2aHBsZWJDWnFQSzFDcXQyMVlDK2ljbnpCTGtRdDZEaWVWWjh2?=
 =?utf-8?B?Zk9hVUJ6UHNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2NHY1lKV3IvYUdxKytCcUN6SXV2bndrOEkvRmg4OU9YTUNiazJWV1VMMXNR?=
 =?utf-8?B?MnFKL3RYcHBYVGo1MlE3ZkF4RFpuSTdJQjhZYlorZ3Foc25tUlpmOHVQcEVO?=
 =?utf-8?B?Q1lMcEYvcUxOcmt6ei9uY3hjSXFDanZod25Sd0ltZjU0RHQxeXJuSVhNcVFT?=
 =?utf-8?B?bldmUXlaVzlnNkJnd0tHQ3BBU3c2aGwyQWt2THB2c3ZuZzRxeHFNZ1FoR3M1?=
 =?utf-8?B?TDhYSXJ6MDJjNXk4ZlA3WnMyL3VTQnhkUnpPWGIxNzhGWGxMWTIwRFZmekIz?=
 =?utf-8?B?SHlXOXdMM0YwOWJLNFZVQzUvLzI1V1dreHhUandPbG9FMHhsNzJpTm5RODRp?=
 =?utf-8?B?QWp0QWI5U2thbHE0VmFPM0pxNitwdjlYV3BEb3Z4TkZPZjg1VFBaZEpSaS9M?=
 =?utf-8?B?VDdRSFhzaGZkbk10VmVpajBqK0FlS09CbjN5MWRPekJYVEtwQ0wyZTRkMXRX?=
 =?utf-8?B?Rk5XaXF4Y3QxU0NzYVgvMzAzVVltbEFvVXdkaGtVbnVDTnhzZ2VmZjNrODQ3?=
 =?utf-8?B?T0V0RlgrOHdoMFB5RnRWbjFCdVRZNTFCRXl3UCtIeE1VSFUzVDNyZE1FMkZQ?=
 =?utf-8?B?aVVUdFl3QkVEbnFYN0RmdTVpOFk2WnV4VkhzU1pIRmtIQTV2YlV5Zm94ZC84?=
 =?utf-8?B?bzFuNXd5bWVFZ3IrYzJKV2lUZEFCYUpEdVBlNGRWNlAzTWgySVN2SnJWVnRB?=
 =?utf-8?B?eGxxUkFKbGk3dW42K0p5VXBsUzRqTlNRSm01Q3UxVnpnNGw2bGkvUUNOSGti?=
 =?utf-8?B?R3oyYjNTemV3QWQ0UGQ3M053WCtScngzTW0weHVpUkdJc0cyTE9IL3kremJL?=
 =?utf-8?B?ZVA4RkpvWW1uT1B4MFJYTmg4YWFhUXkxK0REK3R4S0RDSGg1OW1hYUFPaSs5?=
 =?utf-8?B?YUNZVkhDZnpxSTBjdkpTcGJSOUVyZjhoWlhNTzM1KytoSDM4K01EMGNiMHhq?=
 =?utf-8?B?OUR4UUtTS2xtWlUyTjBRbEZBU1hKdVNyQ0Mza3E1MTcwaFU1czY2WlNiOEhJ?=
 =?utf-8?B?QTRBZ1RuNHNQL01GV0FBaDhoeDl0Q3p2Mjl6REZzVTBYRUZZeVY4WjNjbUdH?=
 =?utf-8?B?WHk5Rkk4blhta0MrbXZNNXpVclFXNjBUaGVJNXIvZWl1RUVvWVRvc0NTOXN6?=
 =?utf-8?B?MjRDczM3R1BjOW85Sm1XK0VzMVZEbGJicTg1QVBZVEVYbGhEcW5iSEJjYThs?=
 =?utf-8?B?RTdEUldJaVVOTkxvWklTRnd3MTU5NzFoZzZPaDZtVkFHWWtUZDZFQUwvT095?=
 =?utf-8?B?Qlo3ckloSTFYZUFTZ2x6dTFZYVhJMy9OTURUd2lvamU3WTU1ek8xdEs1UlF2?=
 =?utf-8?B?WnBka0FITlBIWTVZd3ZhalNVSzRmOGF1MGNMLzhNREtITUY2Tm9QZHJPSkMr?=
 =?utf-8?B?djVScjk2T0lqUUdJL29YQWNTTlpMZ1VTOFBGNzMyU1NmaVM0bDVLMnVOMHJ3?=
 =?utf-8?B?a0F3dlI5YmV4dXZtQkg3bERXbjNwM3JMNUJ2TTN3YVBmNVpjUkFsaUJpVVBN?=
 =?utf-8?B?UGQ2VFZkYm1aRjNFMGdKb1dBRHlhd1pHN09KRXYweEl4ZEo0QjErbW95bUF6?=
 =?utf-8?B?T2ZtN29EWHlDNVplQm53cFJMT3pTZ0hpRkE5bnB2bFNkTXMrSG5lNThJbmtj?=
 =?utf-8?B?THYzRFkwNHE5WVhaT0VQMjNubGdCQnUvVCtSUTQvb0p1VWxxSkdJVThBUkc1?=
 =?utf-8?B?NlFTeDhxWkhsK0F1emdwMnJMaXV2b0NrdlgxUXNwYTk4ejFnbnROcGpld2cx?=
 =?utf-8?B?cGdTbzZ5RGlOSDR3bjFMK1B4ZkpqVjc2ckc3YlRzZFRxTUdlcXFCSm1QdW1o?=
 =?utf-8?B?KzBHUWY1RitaZlk3cFVpcW1WQmV0cEpMRlRVUWRyclArc3VpeDZJb3ZpQkxr?=
 =?utf-8?B?NXdDQkpHdEtyYytGMGJiWjU2K1NwQjcrM1M1OUlKRXZLd3lBTWpxVDJuUFo5?=
 =?utf-8?B?VGhmY0s5WTR3eEp5elpaa0RjWklXekRUalRIQitMQW1TWVFDeUtvVzl6OU1m?=
 =?utf-8?B?SXNkYzhQR29MZ3ZVZ2RuYTdOc1ZrYm96ejhPK2F3dEdnWGVPSHhaN0tOK25t?=
 =?utf-8?B?NERod2UxMTNYYTArZ09DSWVwWmszUnJ1YjhiNmlQK0hLRE9USitDT0hvVHlM?=
 =?utf-8?B?eEN3TzRSUkpRWVJsN0NhTEFKOW1TNUN6UFo2Uno3c3ZhNUNtUktXV24zdW11?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <527F5DE4E07AB446B615C60CB4A1838B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc72201-4f78-4051-85fd-08de1725953a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 19:58:51.7991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjP/4YsUhbdGQt9Wr6M8BV+mJV2Q0ozox9Oh9Hu8BCjUcy6YuMlDHg2uTm/iEcuDr79MPIKNM0wMy6dak7R/aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
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

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDAwOjA1ICswNTMwLCBBbmlyYmFuLCBTayB3cm90ZToNCj4g
SGksDQo+IA0KPiBPbiAyOS0xMC0yMDI1IDIzOjM0LCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4g
T24gV2VkLCBPY3QgMjksIDIwMjUgYXQgMDQ6NTA6MTZQTSArMDUzMCwgU2sgQW5pcmJhbiB3cm90
ZToNCj4gPiA+IFJQZSBpcyBydW50aW1lLWRldGVybWluZWQgYnkgUENPREUgYW5kIGNhY2hpbmcg
aXQgY2F1c2VkIHN0YWxlDQo+ID4gPiB2YWx1ZXMsDQo+ID4gPiBsZWFkaW5nIHRvIGluY29ycmVj
dCBHdUMgU0xQQyBwYXJhbWV0ZXIgc2V0dGluZ3MuDQo+ID4gPiBEcm9wIHRoZSBjYWNoZWQgcnBl
X2ZyZXEgZmllbGQgYW5kIHF1ZXJ5IGZyZXNoIHZhbHVlcyBmcm9tDQo+ID4gPiBoYXJkd2FyZQ0K
PiA+ID4gb24gZWFjaCB1c2UgdG8gZW5zdXJlIEd1QyBTTFBDIHBhcmFtZXRlcnMgcmVmbGVjdCBj
dXJyZW50IFJQZS4NCj4gPiA+IA0KPiA+ID4gdjI6IFJlbW92ZSBjYWNoZWQgUlBlIGZyZXF1ZW5j
eSBmaWVsZCAoUm9kcmlnbykNCj4gPiA+IHYzOiBSZW1vdmUgZXh0cmEgdmFyaWFibGUgKFZpbmF5
KQ0KPiA+ID4gwqDCoMKgwqAgTW9kaWZ5IGZ1bmN0aW9uIG5hbWUgKFZpbmF5KQ0KPiA+ID4gdjQ6
IE1haW50YWluIGEgc2VwYXJhdGUgZnVuY3Rpb24gZm9yIFBWQyAoUm9kcmlnbykNCj4gPiA+IHY1
OiBVcGRhdGUgUlBuIHdoaWxlIGZldGNoaW5nIFJQZSBmcmVxdWVuY3kNCj4gPiA+IA0KPiA+ID4g
Q2xvc2VzOg0KPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJu
ZWwvLS9pc3N1ZXMvNTE2Ng0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2sgQW5pcmJhbiA8c2suYW5p
cmJhbkBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfcGMuY8KgwqDCoMKgwqDCoCB8IDc1ICsrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4g
LS0tLS0tLQ0KPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wY190eXBlcy5oIHzC
oCAyIC0NCj4gPiA+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMzUgZGVs
ZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3BjLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+ID4g
PiBpbmRleCAzYzBmZWI1MGExZTIuLjA4ZGVhYTY0YWE4NSAxMDA2NDQNCj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19wYy5jDQo+ID4gPiBAQCAtMzMwLDcgKzMzMCw3IEBAIHN0YXRpYyBpbnQgcGNf
c2V0X21pbl9mcmVxKHN0cnVjdCB4ZV9ndWNfcGMNCj4gPiA+ICpwYywgdTMyIGZyZXEpDQo+ID4g
PiDCoMKgCSAqIE91ciBnb2FsIGlzIHRvIGhhdmUgdGhlIGFkbWluIGNob2ljZXMgcmVzcGVjdGVk
Lg0KPiA+ID4gwqDCoAkgKi8NCj4gPiA+IMKgwqAJcGNfYWN0aW9uX3NldF9wYXJhbShwYywNCj4g
PiA+IFNMUENfUEFSQU1fSUdOT1JFX0VGRklDSUVOVF9GUkVRVUVOQ1ksDQo+ID4gPiAtCQkJwqDC
oMKgIGZyZXEgPCBwYy0+cnBlX2ZyZXEpOw0KPiA+ID4gKwkJCcKgwqDCoCBmcmVxIDwgeGVfZ3Vj
X3BjX2dldF9ycGVfZnJlcShwYykpOw0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgCXJldHVybiBwY19h
Y3Rpb25fc2V0X3BhcmFtKHBjLA0KPiA+ID4gwqDCoAkJCQnCoMKgDQo+ID4gPiBTTFBDX1BBUkFN
X0dMT0JBTF9NSU5fR1RfVU5TTElDRV9GUkVRX01IWiwNCj4gPiA+IEBAIC0zNzUsNyArMzc1LDcg
QEAgc3RhdGljIHZvaWQgbXRsX3VwZGF0ZV9ycGFfdmFsdWUoc3RydWN0DQo+ID4gPiB4ZV9ndWNf
cGMgKnBjKQ0KPiA+ID4gwqDCoAlwYy0+cnBhX2ZyZXEgPSBkZWNvZGVfZnJlcShSRUdfRklFTERf
R0VUKE1UTF9SUEFfTUFTSywNCj4gPiA+IHJlZykpOw0KPiA+ID4gwqAgfQ0KPiA+ID4gwqAgDQo+
ID4gPiAtc3RhdGljIHZvaWQgbXRsX3VwZGF0ZV9ycGVfdmFsdWUoc3RydWN0IHhlX2d1Y19wYyAq
cGMpDQo+ID4gPiArc3RhdGljIHUzMiBtdGxfZ2V0X3JwZV9mcmVxKHN0cnVjdCB4ZV9ndWNfcGMg
KnBjKQ0KPiA+ID4gwqAgew0KPiA+ID4gwqDCoAlzdHJ1Y3QgeGVfZ3QgKmd0ID0gcGNfdG9fZ3Qo
cGMpOw0KPiA+ID4gwqDCoAl1MzIgcmVnOw0KPiA+ID4gQEAgLTM4NSw3ICszODUsNyBAQCBzdGF0
aWMgdm9pZCBtdGxfdXBkYXRlX3JwZV92YWx1ZShzdHJ1Y3QNCj4gPiA+IHhlX2d1Y19wYyAqcGMp
DQo+ID4gPiDCoMKgCWVsc2UNCj4gPiA+IMKgwqAJCXJlZyA9IHhlX21taW9fcmVhZDMyKCZndC0+
bW1pbywNCj4gPiA+IE1UTF9HVF9SUEVfRlJFUVVFTkNZKTsNCj4gPiA+IMKgIA0KPiA+ID4gLQlw
Yy0+cnBlX2ZyZXEgPSBkZWNvZGVfZnJlcShSRUdfRklFTERfR0VUKE1UTF9SUEVfTUFTSywNCj4g
PiA+IHJlZykpOw0KPiA+ID4gKwlyZXR1cm4gZGVjb2RlX2ZyZXEoUkVHX0ZJRUxEX0dFVChNVExf
UlBFX01BU0ssIHJlZykpOw0KPiA+ID4gwqAgfQ0KPiA+ID4gwqAgDQo+ID4gPiDCoCBzdGF0aWMg
dm9pZCB0Z2xfdXBkYXRlX3JwYV92YWx1ZShzdHJ1Y3QgeGVfZ3VjX3BjICpwYykNCj4gPiA+IEBA
IC00MDgsMjQgKzQwOCwyMiBAQCBzdGF0aWMgdm9pZCB0Z2xfdXBkYXRlX3JwYV92YWx1ZShzdHJ1
Y3QNCj4gPiA+IHhlX2d1Y19wYyAqcGMpDQo+ID4gPiDCoMKgCX0NCj4gPiA+IMKgIH0NCj4gPiA+
IMKgIA0KPiA+ID4gLXN0YXRpYyB2b2lkIHRnbF91cGRhdGVfcnBlX3ZhbHVlKHN0cnVjdCB4ZV9n
dWNfcGMgKnBjKQ0KPiA+ID4gK3N0YXRpYyB1MzIgcHZjX2dldF9ycGVfZnJlcShzdHJ1Y3QgeGVf
Z3VjX3BjICpwYykNCj4gPiA+IMKgIHsNCj4gPiA+IMKgwqAJc3RydWN0IHhlX2d0ICpndCA9IHBj
X3RvX2d0KHBjKTsNCj4gPiA+IC0Jc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7
DQo+ID4gPiDCoMKgCXUzMiByZWc7DQo+ID4gPiDCoCANCj4gPiA+IC0JLyoNCj4gPiA+IC0JICog
Rm9yIFBWQyB3ZSBzdGlsbCBuZWVkIHRvIHVzZSBmdXNlZCBSUDEgYXMgdGhlDQo+ID4gPiBhcHBy
b3hpbWF0aW9uIGZvciBSUGUNCj4gPiA+IC0JICogRm9yIG90aGVyIHBsYXRmb3JtcyB0aGFuIFBW
QyB3ZSBnZXQgdGhlIHJlc29sdmVkIFJQZQ0KPiA+ID4gZGlyZWN0bHkgZnJvbQ0KPiA+ID4gLQkg
KiBQQ09ERSBhdCBhIGRpZmZlcmVudCByZWdpc3Rlcg0KPiA+ID4gLQkgKi8NCj4gPiA+IC0JaWYg
KHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX1BWQykgew0KPiA+ID4gLQkJcmVnID0geGVfbW1pb19y
ZWFkMzIoJmd0LT5tbWlvLA0KPiA+ID4gUFZDX1JQX1NUQVRFX0NBUCk7DQo+ID4gPiAtCQlwYy0+
cnBlX2ZyZXEgPSBSRUdfRklFTERfR0VUKFJQMV9NQVNLLCByZWcpICoNCj4gPiA+IEdUX0ZSRVFV
RU5DWV9NVUxUSVBMSUVSOw0KPiA+ID4gLQl9IGVsc2Ugew0KPiA+ID4gLQkJcmVnID0geGVfbW1p
b19yZWFkMzIoJmd0LT5tbWlvLCBGUkVRX0lORk9fUkVDKTsNCj4gPiA+IC0JCXBjLT5ycGVfZnJl
cSA9IFJFR19GSUVMRF9HRVQoUlBFX01BU0ssIHJlZykgKg0KPiA+ID4gR1RfRlJFUVVFTkNZX01V
TFRJUExJRVI7DQo+ID4gPiAtCX0NCj4gPiA+ICsJcmVnID0geGVfbW1pb19yZWFkMzIoJmd0LT5t
bWlvLCBQVkNfUlBfU1RBVEVfQ0FQKTsNCj4gPiA+ICsJcmV0dXJuIFJFR19GSUVMRF9HRVQoUlAx
X01BU0ssIHJlZykgKg0KPiA+ID4gR1RfRlJFUVVFTkNZX01VTFRJUExJRVI7DQo+ID4gPiArfQ0K
PiA+ID4gKw0KPiA+ID4gK3N0YXRpYyB1MzIgdGdsX2dldF9ycGVfZnJlcShzdHJ1Y3QgeGVfZ3Vj
X3BjICpwYykNCj4gPiA+ICt7DQo+ID4gPiArCXN0cnVjdCB4ZV9ndCAqZ3QgPSBwY190b19ndChw
Yyk7DQo+ID4gPiArCXUzMiByZWc7DQo+ID4gPiArDQo+ID4gPiArCXJlZyA9IHhlX21taW9fcmVh
ZDMyKCZndC0+bW1pbywgRlJFUV9JTkZPX1JFQyk7DQo+ID4gPiArCXJldHVybiBSRUdfRklFTERf
R0VUKFJQRV9NQVNLLCByZWcpICoNCj4gPiA+IEdUX0ZSRVFVRU5DWV9NVUxUSVBMSUVSOw0KPiA+
ID4gwqAgfQ0KPiA+ID4gwqAgDQo+ID4gPiDCoCBzdGF0aWMgdm9pZCBwY191cGRhdGVfcnBfdmFs
dWVzKHN0cnVjdCB4ZV9ndWNfcGMgKnBjKQ0KPiA+ID4gQEAgLTQzMywyMCArNDMxLDEwIEBAIHN0
YXRpYyB2b2lkIHBjX3VwZGF0ZV9ycF92YWx1ZXMoc3RydWN0DQo+ID4gPiB4ZV9ndWNfcGMgKnBj
KQ0KPiA+ID4gwqDCoAlzdHJ1Y3QgeGVfZ3QgKmd0ID0gcGNfdG9fZ3QocGMpOw0KPiA+ID4gwqDC
oAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsNCj4gPiA+IMKgIA0KPiA+ID4g
LQlpZiAoR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPj0gMTI3MCkgew0KPiA+ID4gKwlpZiAoR1JBUEhJ
Q1NfVkVSeDEwMCh4ZSkgPj0gMTI3MCkNCj4gPiA+IMKgwqAJCW10bF91cGRhdGVfcnBhX3ZhbHVl
KHBjKTsNCj4gPiA+IC0JCW10bF91cGRhdGVfcnBlX3ZhbHVlKHBjKTsNCj4gPiA+IC0JfSBlbHNl
IHsNCj4gPiA+ICsJZWxzZQ0KPiA+ID4gwqDCoAkJdGdsX3VwZGF0ZV9ycGFfdmFsdWUocGMpOw0K
PiA+ID4gLQkJdGdsX3VwZGF0ZV9ycGVfdmFsdWUocGMpOw0KPiA+ID4gLQl9DQo+ID4gPiAtDQo+
ID4gPiAtCS8qDQo+ID4gPiAtCSAqIFJQZSBpcyBkZWNpZGVkIGF0IHJ1bnRpbWUgYnkgUENPREUu
IEluIHRoZSByYXJlIGNhc2UNCj4gPiA+IHdoZXJlIHRoYXQncw0KPiA+ID4gLQkgKiBzbWFsbGVy
IHRoYW4gdGhlIGZ1c2VkIG1pbiwgd2Ugd2lsbCB0cnVzdCB0aGUgUENPREUNCj4gPiA+IGFuZCB1
c2UgdGhhdA0KPiA+ID4gLQkgKiBhcyBvdXIgbWluaW11bSBvbmUuDQo+ID4gPiAtCSAqLw0KPiA+
ID4gLQlwYy0+cnBuX2ZyZXEgPSBtaW4ocGMtPnJwbl9mcmVxLCBwYy0+cnBlX2ZyZXEpOw0KPiA+
ID4gwqAgfQ0KPiA+ID4gwqAgDQo+ID4gPiDCoCAvKioNCj4gPiA+IEBAIC01NjAsOSArNTQ4LDMw
IEBAIHUzMiB4ZV9ndWNfcGNfZ2V0X3JwYV9mcmVxKHN0cnVjdCB4ZV9ndWNfcGMNCj4gPiA+ICpw
YykNCj4gPiA+IMKgwqAgKi8NCj4gPiA+IMKgIHUzMiB4ZV9ndWNfcGNfZ2V0X3JwZV9mcmVxKHN0
cnVjdCB4ZV9ndWNfcGMgKnBjKQ0KPiA+ID4gwqAgew0KPiA+ID4gLQlwY191cGRhdGVfcnBfdmFs
dWVzKHBjKTsNCj4gPiA+ICsJc3RydWN0IHhlX2d0ICpndCA9IHBjX3RvX2d0KHBjKTsNCj4gPiA+
ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7DQo+ID4gPiArCXUzMiBmcmVx
Ow0KPiA+ID4gwqAgDQo+ID4gPiAtCXJldHVybiBwYy0+cnBlX2ZyZXE7DQo+ID4gPiArCS8qDQo+
ID4gPiArCSAqIEZvciBQVkMgd2Ugc3RpbGwgbmVlZCB0byB1c2UgZnVzZWQgUlAxIGFzIHRoZQ0K
PiA+ID4gYXBwcm94aW1hdGlvbiBmb3IgUlBlDQo+ID4gPiArCSAqIEZvciBvdGhlciBwbGF0Zm9y
bXMgdGhhbiBQVkMgd2UgZ2V0IHRoZSByZXNvbHZlZCBSUGUNCj4gPiA+IGRpcmVjdGx5IGZyb20N
Cj4gPiA+ICsJICogUENPREUgYXQgYSBkaWZmZXJlbnQgcmVnaXN0ZXINCj4gPiA+ICsJICovDQo+
ID4gPiArCWlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9QVkMpDQo+ID4gSSBiZWxpZXZlIGl0
IHdvdWxkIGJlIGJldHRlciB0byBjb252ZXJ0IHRoaXMgdG8gdGhlIGdyYXBoaWNzDQo+ID4gdmVy
c2lvbiBoZXJlDQo+ID4gaW5zdGVhZCBvZiB0aGUgcGxhdGZvcm0gbmFtZS4gQnV0IG5vIGJsb2Nr
IHNpbmNlIGl0IHdhcyBhbHJlYWR5IGENCj4gPiBwbGF0Zm9ybSBjaGVjaw0KPiA+IGFib3ZlLg0K
PiBzdXJlLCBJIHdpbGwgbG9vayBpbnRvIHRoaXMuDQo+ID4gPiArCQlmcmVxID0gcHZjX2dldF9y
cGVfZnJlcShwYyk7DQo+ID4gPiArCWVsc2UgaWYgKEdSQVBISUNTX1ZFUngxMDAoeGUpID49IDEy
NzApDQo+ID4gPiArCQlmcmVxID0gbXRsX2dldF9ycGVfZnJlcShwYyk7DQo+ID4gPiArCWVsc2UN
Cj4gPiA+ICsJCWZyZXEgPSB0Z2xfZ2V0X3JwZV9mcmVxKHBjKTsNCj4gPiA+ICsNCj4gPiA+ICsJ
LyoNCj4gPiA+ICsJICogUlBlIGlzIGRlY2lkZWQgYXQgcnVudGltZSBieSBQQ09ERS4gSW4gdGhl
IHJhcmUgY2FzZQ0KPiA+ID4gd2hlcmUgdGhhdCdzDQo+ID4gPiArCSAqIHNtYWxsZXIgdGhhbiB0
aGUgZnVzZWQgbWluLCB3ZSB3aWxsIHRydXN0IHRoZSBQQ09ERQ0KPiA+ID4gYW5kIHVzZSB0aGF0
DQo+ID4gPiArCSAqIGFzIG91ciBtaW5pbXVtIG9uZS4NCj4gPiA+ICsJICovDQo+ID4gPiArCXBj
LT5ycG5fZnJlcSA9IG1pbihwYy0+cnBuX2ZyZXEsIGZyZXEpOw0KPiA+IHNldHRpbmcgcnBuX2Zy
ZXEgaW5zaWRlIHRoaXMgZ2V0X3JwZSBmdW5jdGlvbiBtYWtlcyBubyBzZW5zZS4NCj4gPiANCj4g
PiBJJ20gc29ycnkgSSBmb3Jnb3QgYWJvdXQgdGhpcyB3aGVuIEkgdG9sZCB5b3UgdG8ga2lsbCB0
aGUgb3RoZXINCj4gPiBmdW5jdGlvbi4NCj4gPiBJdCBzaG91bGQgc3RheSB0aGVyZSwgYnV0IGJl
IGNhbGxlZCB1cGRhdGVfcnBuIGluc3RlYWQuLi4NCj4gU2luY2UgUlBuIHVwZGF0ZXMgZGVwZW5k
IG9uIFJQZSwgbXkgaW50ZW50aW9uIHdhcyB0byB1cGRhdGUgUlBuDQo+IHdoZW5ldmVyIA0KPiBS
UGUgaXMgZmV0Y2hlZC4NCj4gQWx0ZXJuYXRpdmVseSwgSSBjYW4gbWFpbnRhaW4gYSBzZXBhcmF0
ZSB1cGRhdGVfcnBuKCkgZnVuY3Rpb24sIGJ1dA0KPiBpbiANCj4gZWl0aGVyIGNhc2UsIGl0IHdp
bGwgYmUgaW52b2tlZCBkdXJpbmcgaW5pdGlhbGl6YXRpb24gYW5kIHdoaWxlIA0KPiByZXRyaWV2
aW5nIFJQZSBmcmVxdWVuY2llcy4NCj4gQW5vdGhlciBvcHRpb24gY291bGQgYmUgdG8gc2ltcGx5
IHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gDQo+IHhlX2d1Y19wY19nZXRfcnBlX3Jwbl9mcmVxKCkg
dG8gcmVmbGVjdCBpdHMgZHVhbCBwdXJwb3NlLg0KPiBXaGF0IGFyZSB5b3VyIHRob3VnaHRzIG9u
IHRoaXMgYXBwcm9hY2g/DQoNCkkgdGhpbmsgeW91IG5lZWQgdG8gZ2V0IHRvIHRoZSBkcmF3aW5n
IGJvYXJkIGFuZCB0aGluayBvbiBhbm90aGVyDQpwcm9wb3NhbC4gVGhpcyBpcyBiZWNvbWluZyB0
byBnZXQgcmVhbGx5IG1lc3NpZXIuDQoNCnVwZGF0ZV9ycCBzaW1wbHkgdXBkYXRlIHRoZW0gYWxs
IGJlZm9yZSB0aGUgYWN0dWFsIGdldC4NCg0KeW91IGRvbid0IHVwZGF0ZSBhbm90aGVyIHRoaW5n
IGluc2lkZSBhIGdldCBvZiBhIHNwZWNpZmljIHRoaW5nDQpvZiBpbnRlcmVzdC4NCg0KdGhpbmsg
b2Ygd2hhdCBhcmUgdGhlIGNhc2VzIHdoZXJlIHRoZSBycG4gdXBkYXRlIGlzIHJlYWxseSBuZWVk
ZWQuDQp0aGluayBpZiB3ZSBzaG91bGQgaGF2ZSBhIGNvbnN0YW50IHdvcmtxdWV1ZSByZWZyZXNo
aW5nIGl0IGlmIG5vdA0KaWRsZS9zdXNwZW5kZWQuIFRoaW5rIGFib3V0IGFsbCB0aGUgY29uc2Vx
dWVuY2VzIG9mIHRoZSB1cGRhdGVzDQphbmQgcmVtb3ZhbCB0aGF0IHlvdSBhcmUgcHJvcG9zaW5n
LiBBbmQgYWx3YXlzIG1ha2luZyBzdXJlIHRoYXQNCnRoYXQgdGhhdCBpZ3QgZnJlcSB0ZXN0IGlz
IHJlbGlhYmx5IHBhc3NpbmcuDQoNCkJ1dCBzb21ldGhpbmcgaXMgc3RyYW5nZSBpbiB0aGUgY3Vy
cmVudCBwcm9wb3NhbC4NCg0KPiANCj4gVGhhbmtzLA0KPiBBbmlyYmFuDQo+ID4gPiArDQo+ID4g
PiArCXJldHVybiBmcmVxOw0KPiA+ID4gwqAgfQ0KPiA+ID4gwqAgDQo+ID4gPiDCoCAvKioNCj4g
PiA+IEBAIC0xMDIxLDcgKzEwMzAsNyBAQCBzdGF0aWMgaW50IHBjX3NldF9tZXJ0X2ZyZXFfY2Fw
KHN0cnVjdA0KPiA+ID4geGVfZ3VjX3BjICpwYykNCj4gPiA+IMKgwqAJLyoNCj4gPiA+IMKgwqAJ
ICogRW5zdXJlIG1pbiBhbmQgbWF4IGFyZSBib3VuZCBieSBNRVJUX0ZSRVFfQ0FQIHVudGlsDQo+
ID4gPiBkcml2ZXIgbG9hZHMuDQo+ID4gPiDCoMKgCSAqLw0KPiA+ID4gLQlyZXQgPSBwY19zZXRf
bWluX2ZyZXEocGMsIG1pbihwYy0+cnBlX2ZyZXEsDQo+ID4gPiBwY19tYXhfZnJlcV9jYXAocGMp
KSk7DQo+ID4gPiArCXJldCA9IHBjX3NldF9taW5fZnJlcShwYywNCj4gPiA+IG1pbih4ZV9ndWNf
cGNfZ2V0X3JwZV9mcmVxKHBjKSwgcGNfbWF4X2ZyZXFfY2FwKHBjKSkpOw0KPiA+ID4gwqDCoAlp
ZiAoIXJldCkNCj4gPiA+IMKgwqAJCXJldCA9IHBjX3NldF9tYXhfZnJlcShwYywgbWluKHBjLT5y
cDBfZnJlcSwNCj4gPiA+IHBjX21heF9mcmVxX2NhcChwYykpKTsNCj4gPiA+IMKgIA0KPiA+ID4g
QEAgLTEzMzksNyArMTM0OCw3IEBAIHN0YXRpYyB2b2lkIHhlX2d1Y19wY19maW5pX2h3KHZvaWQg
KmFyZykNCj4gPiA+IMKgwqAJWEVfV0FSTl9PTih4ZV9ndWNfcGNfc3RvcChwYykpOw0KPiA+ID4g
wqAgDQo+ID4gPiDCoMKgCS8qIEJpbmQgcmVxdWVzdGVkIGZyZXEgdG8gbWVydF9mcmVxX2NhcCBi
ZWZvcmUgdW5sb2FkICovDQo+ID4gPiAtCXBjX3NldF9jdXJfZnJlcShwYywgbWluKHBjX21heF9m
cmVxX2NhcChwYyksIHBjLQ0KPiA+ID4gPnJwZV9mcmVxKSk7DQo+ID4gPiArCXBjX3NldF9jdXJf
ZnJlcShwYywgbWluKHBjX21heF9mcmVxX2NhcChwYyksDQo+ID4gPiB4ZV9ndWNfcGNfZ2V0X3Jw
ZV9mcmVxKHBjKSkpOw0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgCXhlX2ZvcmNlX3dha2VfcHV0KGd0
X3RvX2Z3KHBjX3RvX2d0KHBjKSksIGZ3X3JlZik7DQo+ID4gPiDCoCB9DQo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wY190eXBlcy5oDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfcGNfdHlwZXMuaA0KPiA+ID4gaW5kZXggNWU0ZWE1M2ZiZWU2
Li5mMjdjMDVkODE3MDYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3BjX3R5cGVzLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGNf
dHlwZXMuaA0KPiA+ID4gQEAgLTIxLDggKzIxLDYgQEAgc3RydWN0IHhlX2d1Y19wYyB7DQo+ID4g
PiDCoMKgCXUzMiBycDBfZnJlcTsNCj4gPiA+IMKgwqAJLyoqIEBycGFfZnJlcTogSFcgUlBhIGZy
ZXF1ZW5jeSAtIFRoZSBBY2hpZXZhYmxlIG9uZSAqLw0KPiA+ID4gwqDCoAl1MzIgcnBhX2ZyZXE7
DQo+ID4gPiAtCS8qKiBAcnBlX2ZyZXE6IEhXIFJQZSBmcmVxdWVuY3kgLSBUaGUgRWZmaWNpZW50
IG9uZSAqLw0KPiA+ID4gLQl1MzIgcnBlX2ZyZXE7DQo+ID4gPiDCoMKgCS8qKiBAcnBuX2ZyZXE6
IEhXIFJQTiBmcmVxdWVuY3kgLSBUaGUgTWluaW11bSBvbmUgKi8NCj4gPiA+IMKgwqAJdTMyIHJw
bl9mcmVxOw0KPiA+ID4gwqDCoAkvKiogQHVzZXJfcmVxdWVzdGVkX21pbjogU3Rhc2ggdGhlIG1p
bmltdW0gcmVxdWVzdGVkDQo+ID4gPiBmcmVxIGJ5IHVzZXIgKi8NCj4gPiA+IC0tIA0KPiA+ID4g
Mi40My4wDQo+ID4gPiANCg==
