Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADFBD0E6E3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 13:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15510E3FE;
	Tue, 25 Nov 2025 13:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8RabpqY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372EC10E3FE
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764077987; x=1795613987;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=cDmMqJnEC/RbQeTR4aycEeSzL2nvMwdvKsli5wpWZWM=;
 b=T8RabpqY+0AA+hfWUaiwWTRyq/CbU5qzJd2BHS0tEFqsa77WGPBwMwfw
 uZCrwEM8Nfytv7+2QWQFx8blMhS33jrV9jcsl/nCzUEOtVCajapmLn+OE
 AOKr7pJJwEGXaYGLoClJbPX1n3/meVJHvolatL/8i5I89Bpk/qnn6zx9m
 Mhm/YlTAo3rng03lsQkk8ZgYIpHb4Rx3AdjkeuXH8ARlmRNOXe1TKCrtc
 fWrk2YOVS14QDqj4JcAkuzMMAJgDqyAqU/dR+nffJ2ebOZPfEVDsDWGfE
 URd0/9UHQJOUs/PIDyCbq3OsJEXokWdTmq38t6yFGMhvkkpuLxhQ26DCz Q==;
X-CSE-ConnectionGUID: 3ApqXqYYSMOVdmFT7UShuQ==
X-CSE-MsgGUID: rbVqGl6hTlCei3pMRmlrcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68684462"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="68684462"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:39:46 -0800
X-CSE-ConnectionGUID: 147SFyqnTXy7IPNtnRI2Wg==
X-CSE-MsgGUID: ZILEPBy5TD23r8/oZfJdAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="191780841"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:39:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 05:39:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 05:39:46 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 05:39:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGnp3UxFovwh9SFVU/B9r9CVX7z/Sy/kWNg+JsLmb8Q16xpdfbE5CI+fuUzNkdPHe4tpc+quSFiZtxqPdJEhNlhpVFNPMIw6CxjwEpLho0dLBNqRzOIyNki6xS7rEaId9Uc2Bv3qgtLoWan6Ib/bXnLbhhxwtWsyML6vZf6Dk22CLD4uLobYsphdAao5Rdd0ib72HwvBfX7vy8z3WOv+hXjtCnbY9Ky1JxSWxZAAdaBX/LBkz/4YYT0iRcmqCPZZfRVu3Z08IIcQTFp6pnkUVEuEbh76RAFlVfXhlFI4/rLFxV+8z3ZHbhHB7sat3QHLPeHVoyzbg/InXto5R1Wx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDmMqJnEC/RbQeTR4aycEeSzL2nvMwdvKsli5wpWZWM=;
 b=xtM4aRZl3manjXuClROgDF242xTmQOfrg8BjDxjCud7dgjpPa/EecrOFF8l56oNLGPzBnrXjCpSixQWDHw+gWCpTNX2ouuUBXOk4TtbxVmaBWeb7Xs81ZPaTOmJaCKXtm8RP+YHRXxbhJNXk50tApdAEQsZMVDfSzloN8M3isyPgaqGeWsgEG1zRSJeFmQqQ7nYaHNQiL95U4CM0ZGMgZ/PeHVKWXA2kyFThxi7GWmZyJihVufQyUtnD9bzBwHAKQOpLpQ/lc9oPVE7AcCuDu0N2itlHXSwDDNIenb2MQ3z+6dulN9NZcR7+PtUZ49G1mcIJixHbCK+Ew/Y6Kvg0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS4PPF706C623D2.namprd11.prod.outlook.com (2603:10b6:f:fc02::2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 13:39:43 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 13:39:43 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo cachelines
 manually
Thread-Topic: [PATCH 1/3] drm/xe/xe3p_lpg: flush userptr/shrinker bo
 cachelines manually
Thread-Index: AQHcXfAY8GNFxd144EOLjfo1yT6/rrUDLZGAgAA4K4A=
Date: Tue, 25 Nov 2025 13:39:43 +0000
Message-ID: <b886715bd1212d567b01bd5b97241f444861956b.camel@intel.com>
References: <20251125094335.12028-1-tejas.upadhyay@intel.com>
 <20251125094335.12028-2-tejas.upadhyay@intel.com>
 <59c3e7ea-f79f-49b9-834b-766c2f394b14@intel.com>
In-Reply-To: <59c3e7ea-f79f-49b9-834b-766c2f394b14@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS4PPF706C623D2:EE_
x-ms-office365-filtering-correlation-id: 50a05bf5-37e2-4556-ec8e-08de2c28176b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UUtVWFJCcWFSZzM5RzZUb2I2U2VVUno2RzZlVnZ6V2JWNVhiV3l5dm50UFRL?=
 =?utf-8?B?eWtoTHBOQWYvQUJiQ1V6akFXVmNwdmVma3VSVzVkbmp3NVcvL2FNSTZxeG9z?=
 =?utf-8?B?NlJ1c05wUmMwQUpSSk5qRWNUTVB3dEwzRitiN3EvZ0l0dGJYZ3doOHVrQ3dQ?=
 =?utf-8?B?Tk8rVTFvMjhkK1JsbmM3UWJmZk5VYUE3cGNUblhrN3l0WFpHcnVrR2Q5eDcv?=
 =?utf-8?B?aXJTNVVsNWs1WFNYT3FCanY3V3A5RDBOSWRKVGltRmtpcVZQTVMyTGVBc0FT?=
 =?utf-8?B?REUvdDV1RVNmSUxudW1MODVibHFxRXBldnBheHdEWDFNUG5FWjZjRXl6Wk8w?=
 =?utf-8?B?YlhlZi9TSkw0UW1YcG81Z2hWeXczNW1RN05sekRtbTJlMkEwTDdydU1Bb2gx?=
 =?utf-8?B?czhiTytIYXNjUnROYUdZYnkxenJleDkwcUpUQ2ZsZWtHUGd0ZytvVGRUSGVa?=
 =?utf-8?B?L3RFQW1CNUROS1BaZGVFOWdaQVJiK0xHdzk3bU9WbXdmNVhJcXhUbFBnUUdo?=
 =?utf-8?B?N2ZNRk5wL05YK0d1QjA2YmFwWmhsanA0c0xDM005U3lBWlJZM1cvczVBanQw?=
 =?utf-8?B?andVaXVFMDdsRDM4V0JucG1xOFNWNEc0SlFyWFBROWd1WlQ4RkVkaWlPVFF0?=
 =?utf-8?B?aENFaUV6ZG1SZENQNDkxYlVEU2g4VEFJYk9aaEFadGxidGlWUERqWUtTd3dj?=
 =?utf-8?B?RGZqRm0zck5tSFFDYStOT1BBSWJnaUVmcWV6dHVsMU5iaXlHaXl6cDZuZnVI?=
 =?utf-8?B?KzNVSjVody9vSWZsL3E1U1p6RnRXMXZIRkcwQXNrZnJzdjhaWHZRcHlqZFZu?=
 =?utf-8?B?VWhLdUFnRnh3aVVFZU9yNHpBelZzdXEwMlRiUE1udFNwUWJ0N05ieEMrcFN5?=
 =?utf-8?B?NHZtRjBRUFVCMlE5Uk9zYTd1UDZqVFJ0cnhMejBpbFhyd2pzbVViTkNLSlRW?=
 =?utf-8?B?Rm5mZ1puYWRad3lTMUIveUdVVmJUR3Nock5kclhOVVp5Rm9kUDBXcjRXNGRz?=
 =?utf-8?B?eVVrNDNmMXdaVkJWMW5XVjQ3UWtBbXpxbmVOVXJuVVdiemZ2K2tRVjQyOGN6?=
 =?utf-8?B?TVl0TnVJMUJUNE5sb1o0eHVYL0IrZ3RxV29RdnlleWVLMnl0RE5BREZLaTNX?=
 =?utf-8?B?ZitucTRRM0RBYXhHdEwvcWJrR2o3b1dDa0xiQVRrVndid0FKVVA3YWRZcnNJ?=
 =?utf-8?B?TkhNTmM0YnR3ZGJkV2ZZZFkrOEhkc2hySi9kT2UxTkl2YTcydytCbkNsc1Jt?=
 =?utf-8?B?M3k4N2wya3NXTm5kUUREQWIxWkhaamZ0YU9yakJmdTBnaXBRWjhtYWRzQ2lW?=
 =?utf-8?B?UkxLRGdUbElGMzNhVHBLVTdFcHhtc1RVKy8veUJYelpJbXhDRXlScDlycmlm?=
 =?utf-8?B?SStySUpqWWVVRGZUMTJ5cG42WDdrMDdEZzlQcFkrRXd6WitITGhNd1dNTHJS?=
 =?utf-8?B?TDkwMlFpVEhYc1dSNUMrbWxZWlpXVXZFMm00SUROWTBMcm9FMmcrTFBLTXhs?=
 =?utf-8?B?dXRTZHFwZXIrL3I3MVhhRHZwNFV5U0dkc1JtQk9SM0hsR3Q4UGpaR0hWcnVs?=
 =?utf-8?B?clFQUG81RWNhLzUwQ2xUUUdSRk9YaWJCRURneDg5eVJtcGZsMFB3NGkxbnN0?=
 =?utf-8?B?TnJFTDIrbmY5ZHJKUTArNUVJQnpOd0FKcFM4ejMvQ0p0LzI4akJlTmFETjRo?=
 =?utf-8?B?MmdwdmZ1T2lEWXVlaS96ckZqRk5XYjZBYUhTcG44alpZZEVzcFFSZHNlUjl1?=
 =?utf-8?B?SWdjNU5hWnBZa1NGRGRWYVRwMStLVkxoWDIyYVQwdEEycitteTdSZkZCODBU?=
 =?utf-8?B?a09TT241dmZpZUlnVUFROHlJWmJUWW83Ty8vRnZMVTNqVGVHK1NnZVFzcHVR?=
 =?utf-8?B?MnpvUFJkSUdlVkJOUFN0eE8zSWFuRG41UGt5WlpvTFRIU3YvNFZrYzVOSFdw?=
 =?utf-8?B?RURrZk5wZ2kvNU1ieHNjeXVDUHQ0VFZvbUVEK1Fna1VDZEhrVmlaYzJQSm1n?=
 =?utf-8?B?UW1LZUxCV1ZOZXROVU43cWRMYitmeUFFbHIzKzRTSWRwK2xhT3MzbGdkT3pa?=
 =?utf-8?Q?fb13uk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0hVTzNnMWxwL3ovNzJYTE4waDdlTkNJT2RONjkxTHlGdGpLZDNEOWZQWHZI?=
 =?utf-8?B?eHJYUEFZb2RNVTJhOTRidFY5eGdNZEJnY0Q3eVVNMHlkeXlZdWNyTTZCekdB?=
 =?utf-8?B?ZnJsWWlZQzNwcDQrUGR4Ti90YU10S0FiSUp2T3JwZ0REYzRoREV5VVZMckNv?=
 =?utf-8?B?bU40aVRheFhkSjQ3aTRiaXBSL1RDYWdLWEt4V0FKNU45TDh6eGY4bm9qQkgv?=
 =?utf-8?B?amJvWStWM2V4aVdVdkJCU2htdEZBQkJDcTFFL0ZCWWhWZmhmUk5rYmtnY1dJ?=
 =?utf-8?B?OG02YThhVXdDa2dUOC9mTTNRNDNKYTRmYVpPY0pnYnF0ck95WHUvQXVOdlN3?=
 =?utf-8?B?dEN6ZlBIOVJBZmdMcVRvR2NERWhUYjJQSHZjR25FT0phV1NQa0VWckdhVGxw?=
 =?utf-8?B?eE9RZDdxQVNwNnMvY0MveVlWblBmU0dCTmdPbTBmSDBRL0Vzby9oZmdOMHNv?=
 =?utf-8?B?bXRZQzJTMFFwWUlqME9ra25tNTlieXErNmUrZVpJZlVZalVCc1ByM2hmNEVV?=
 =?utf-8?B?dTFHSlZIakxtTFRMZThpRVREUDZVelRobzNMTnZqMGxGUUEzeGo1M0NaYnZZ?=
 =?utf-8?B?U1RkU1hNeUdRclNTdm9aK1JJNEl0Sjh0WGNyU0ppUGQvcURwbllsdTdGSkF0?=
 =?utf-8?B?NytVeDFzZDVPTytGa2FxT2tHb0J0TE1NdHRaYUNoMmRqNnlMaXIvOC9sVk5B?=
 =?utf-8?B?TWhJTnhrakhzNjBwUThNZ1RWZENsL08xUGlPa0F2TVZTVmVSMFM4WXRVci8x?=
 =?utf-8?B?NEUrbGtSK096cFVVbTZEVFBDTlF6ZmZuZzFSRE91QmdpWFkvQVI0OVFDZEtq?=
 =?utf-8?B?cTNDeWcweVlpL3pCd3pyY3BVOU1vNVcxV1NiTEk1UkxzOE1rcE9wT2FZRWR2?=
 =?utf-8?B?QXAvUjdwSndBV09sbEhsNkVaMXloOFA0R1pNWlBZdGN3N2dwc2N2NE1TeE9k?=
 =?utf-8?B?aXdORkd6c2VtN29pT3ZKVHNMaGdCa0hFeFp1TGRwNGU5dmVDbE8za29HSjVs?=
 =?utf-8?B?Lzd2SUhzTmxNUWR5M2lEK2QzQU1DajcvS1lNVDlWNk5HbGYvdHdWRXo5SWpE?=
 =?utf-8?B?aWptS1B3Y2FpNExRRk9CbUtNUnFnUTMyZU5xUzdINUV5VHorZ1FBZndDWEYz?=
 =?utf-8?B?Y2pVT0tGVFl2dnpNbjBBTEkyZ1IwQmFpdGxFcElOU0wvWEdnSDhnUlNjcUJn?=
 =?utf-8?B?bm5YRHFvby91SmpwbmovdDZqRGp5VkRLSHQzelJQWk04N085c2pwM2ozNTRV?=
 =?utf-8?B?V2N2bFlYVi90U2owTEQramlhalVsNXViK21ocFhLU1o2RC8yRjZPcWNqc21V?=
 =?utf-8?B?MGZYamdRS3ZBeU5zTmpYd0t0QnV5Vjduano2cWRwQ0drTHhoMEViTHEzTGdw?=
 =?utf-8?B?dmRxN2pRMWZpQjZpYUVHbDZjOHh1YkRObm5qT2FmVHNsMTd5Ri9OS0VaU1Av?=
 =?utf-8?B?MHlmdkJ1aWRGaWt2SDlrbGNoTTNYVmtFdDlwcnBNUUpxSit2MytaS0RZVzRR?=
 =?utf-8?B?N0pUcmEra0t6T3F1anJVbkVwVmw0dHcrdThJK1BOeGJ3V0FRSFNLSHp6YkFy?=
 =?utf-8?B?WkRxaHdobVlmQUFab3pqc1dkZmlTNVJpL3FSazlCNmxramJWVEUySGlQTys3?=
 =?utf-8?B?eGN5cDNiYXpZL2lOc2I2R2tQaHhBRm9HeWZ0S2lmenUweVgzRmIrRS9OQXkw?=
 =?utf-8?B?bzJLR0tjbVZldWVjTDZySGNBeXB0UGJLVG9mMGsranlMRUlVNklhWVg4S093?=
 =?utf-8?B?eXBnSW1KcDVDaFFRWWZBQWcwU2o4N3NyYVBqbFF2Tyt0blA1VzJTaWY4NHVI?=
 =?utf-8?B?T1RZaVYrUE14S1c2Z0VidW9OMy9PZ3BTeE55RjFkb1g1dE05bDQ3UlRrKzI2?=
 =?utf-8?B?bnVVSUFQQ1Irdy9JSEVLUHZqaDFnbHZkaGtuWThyOWF5eVltTXlmeHpHaEFo?=
 =?utf-8?B?UU1ocElYSk9xdk9aL2NLVHZwVU1iR2pXc0ZCb2RQZEVnVERWV25hVUVBY0Rl?=
 =?utf-8?B?ME9WeXZUZlF0WkNHTWM4bVdKN1BWQkZBS3RqNlJBc0svSUdqQWMwOWcyL2ZF?=
 =?utf-8?B?Z203ZXJqMFpoRHRLWFV1V0RrbGQxd1JIb2ZINUp1L0pmTm1RNGVncjBUbnkz?=
 =?utf-8?Q?XdfNILaUdoOWUOXknqjBlK1wD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C1C72EF1D7449428DBEB6902DE50C6C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a05bf5-37e2-4556-ec8e-08de2c28176b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 13:39:43.5449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gDduxAhZXnFPbYvVEK/o1zmOMTX8u7Pba19CQkwqhdQa3qL3DF1MQusQBWzCdT9dfpO78uT6rYXUaS9KAq+18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF706C623D2
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

T24gVHVlLCAyMDI1LTExLTI1IGF0IDEwOjE3ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IE9uIDI1LzExLzIwMjUgMDk6NDMsIFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+IFN0YXJ0aW5n
IE5WTCwgSFcgd2lsbCBmbHVzaCBjYWNoZWxpbmVzIG1hcmtlZCB3aXRoIFhBIG9ubHkNCj4gDQo+
IEkgdGhpbmsgd291bGQgYmUgZ29vZCB0byBnaXZlIGJhc2ljIG92ZXJ2aWV3IG9mIHdoYXQgWEEg
aXM/DQo+IA0KPiA+IHdoZW4gbWVkaWEgaXMgb2ZmLiBXZSBoYXZlIGZldyBjYXNlcyB3aGVyZSBr
ZXJuZWwgd2lsbCBoYXZlDQo+ID4gbm9uLVhBIGNhY2hlbGluZXMgd2hpY2ggbmVlZHMgbWFudWFs
IGZsdXNoIGFzIHdlIHBvc3Rwb25lDQo+ID4gdGhlIGludmFsaWRhdGlvbi4gRmx1c2ggYXNhcCBm
cm9tIGNvcnJlY3RuZXNzIFBPViB0byBlbnN1cmUNCj4gPiBub24gYWNjZWxlcmF0ZWQgQ1BVIGNv
cHkgdG8gc3dhcC9zaG1lbSBmaWxlIHdpbGwgc2VlIGNvaGVyZW50DQo+ID4gdmlldyBvZiBtZW1v
cnksIGJ1dCBhbHNvIGZyb20gc2VjdXJpdHkgUE9WIHdoZXJlIGxhdGVyIGZsdXNoDQo+ID4gY2Fu
J3QgY29ycnVwdCB0aGUgbmV4dCB1c2VyIG9mIHRob3NlIHBhZ2VzLg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmPCoMKgwqDCoMKgIHzCoCAzICsr
LQ0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuY8KgIHwgMjAgKysrKysrKysr
KysrKysrKysrKysNCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmjCoCB8wqAg
MSArDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYyB8wqAgMyArKy0NCj4g
PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiA+IGluZGV4IDQ2NWNmOWZjN2NlOS4uOTdlMWU5
ZDQwZTk2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gPiBAQCAtNjg5LDcgKzY4OSw4IEBA
IHN0YXRpYyBpbnQgeGVfYm9fdHJpZ2dlcl9yZWJpbmQoc3RydWN0DQo+ID4geGVfZGV2aWNlICp4
ZSwgc3RydWN0IHhlX2JvICpibywNCj4gPiDCoCANCj4gPiDCoMKgCQlpZiAoIXhlX3ZtX2luX2Zh
dWx0X21vZGUodm0pKSB7DQo+ID4gwqDCoAkJCWRybV9ncHV2bV9ib19ldmljdCh2bV9ibywgdHJ1
ZSk7DQo+ID4gLQkJCWNvbnRpbnVlOw0KPiA+ICsJCQlpZiAoIXhlX2RldmljZV9uZWVkc19jYWNo
ZV9mbHVzaCh4ZSkpDQo+ID4gKwkJCQljb250aW51ZTsNCj4gPiDCoMKgCQl9DQo+ID4gwqAgDQo+
ID4gwqDCoAkJaWYgKCFpZGxlKSB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4g
aW5kZXggOTJmODgzZGQ4ODc3Li42ZTgzMzViNDkzZTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5jDQo+ID4gQEAgLTEwNzksNiArMTA3OSwyNiBAQCB2b2lkIHhlX2RldmljZV9sMl9m
bHVzaChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gKnhlKQ0KPiA+IMKgwqAJc3Bpbl91bmxvY2soJmd0
LT5nbG9iYWxfaW52bF9sb2NrKTsNCj4gPiDCoCB9DQo+ID4gwqAgDQo+ID4gKy8qKg0KPiA+ICsg
KiB4ZV9kZXZpY2VfbmVlZHNfY2FjaGVfZmx1c2ggLSBXaGV0aGVyIHRoZSBjYWNoZSBuZWVkcyB0
byBiZQ0KPiA+IGZsdXNoZWQNCj4gPiArICogQHhlOiBUaGUgZGV2aWNlIHRvIGNoZWNrLg0KPiA+
ICsgKg0KPiA+ICsgKiBSZXR1cm46IHRydWUgaWYgdGhlIGRldmljZSBuZWVkcyBjYWNoZSBmbHVz
aCwgZmFsc2Ugb3RoZXJ3aXNlLg0KPiA+ICsgKi8NCj4gPiArYm9vbCB4ZV9kZXZpY2VfbmVlZHNf
Y2FjaGVfZmx1c2goc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gK3sNCj4gPiArCS8qDQo+ID4g
KwkgKiBTdGFydGluZyBOVkwsIEhXIHdpbGwgZmx1c2ggY2FjaGVsaW5lcyBtYXJrZWQgd2l0aCBY
QQ0KPiA+IG9ubHkgd2hlbiBtZWRpYSBpcyBvZmYuIFdlIGhhdmUNCj4gDQo+IEkgdGhpbmsgdGhl
IHdvcmRpbmcgY291bGQgYmUgaW1wcm92ZWQgaGVyZSAoc2FtZSBmb3IgY29tbWl0IG1lc3NhZ2Up
Lg0KPiBYQSANCj4gaXMgKmFsd2F5cyogZmx1c2hlZCwgbGlrZSBhdCB0aGUgZW5kLW9mLXN1Ym1z
c2lvbiAoYW5kIG1heWJlIG90aGVyIA0KPiBwbGFjZXMpLCBqdXN0IHRoYXQgaW50ZXJuYWxseSBh
cyBhbiBvcHRpbWlzYXRpb24gaHcgZG9lc24ndCBuZWVkIHRvDQo+IG1ha2UgDQo+IHRoYXQgYSBm
dWxsIGZsdXNoICh3aGljaCB3aWxsIGFsc28gaW5jbHVkZSBYQSkgd2hlbiBNZWRpYSBpcyANCj4g
b2ZmL3Bvd2VyZ2F0ZWQsIHNpbmNlIGl0IGRvZXNuJ3QgbmVlZCB0byB3b3JyeSBhYm91dCBHVCBj
YWNoZXMgdnMNCj4gTWVkaWEgDQo+IGNvaGVyZW5jeSwgYW5kIG9ubHkgQ1BVIHZzIEdQVSBjb2hl
cmVuY3ksIHNvIGNhbiBtYWtlIHRoYXQgZmx1c2ggYSANCj4gdGFyZ2V0ZWQgWEEgZmx1c2gsIHNp
bmNlIHN0dWZmIHRhZ2dlZCB3aXRoIFhBIG5vdyBtZWFucyBpdCdzIHNoYXJlZA0KPiB3aXRoIA0K
PiB0aGUgQ1BVLg0KPiANCj4gPiArCSAqIGZldyBjYXNlcyB3aGVyZSBrZXJuZWwgd2lsbCBoYXZl
IG5vbi1YQSBjYWNoZWxpbmVzDQo+ID4gd2hpY2ggbmVlZHMgbWFudWFsIGZsdXNoIGFuZCB0aGlz
IGlzDQo+ID4gKwkgKiBvbmUgb2YgdGhlbSBhcyB3ZSBwb3N0cG9uZSB0aGUgaW52YWxpZGF0aW9u
LiBGbHVzaCBhc2FwDQo+ID4gZnJvbSBjb3JyZWN0bmVzcyBQT1YgdG8gZW5zdXJlDQo+ID4gKwkg
KiBub24gYWNjZWxlcmF0ZWQgQ1BVIGNvcHkgdG8gc3dhcC9zaG1lbSBmaWxlIHdpbGwgc2VlDQo+
ID4gY29oZXJlbnQgdmlldyBvZiBtZW1vcnksIGJ1dCBhbHNvDQo+ID4gKwkgKiBmcm9tIHNlY3Vy
aXR5IFBPViB3aGVyZSBsYXRlciBmbHVzaCBjYW4ndCBjb3JydXB0IHRoZQ0KPiA+IG5leHQgdXNl
ciBvZiB0aG9zZSBwYWdlcy4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKEdSQVBISUNTX1ZFUih4ZSkg
Pj0gMzUgJiYgIUlTX0RHRlgoeGUpKQ0KPiA+ICsJCXJldHVybiB0cnVlOw0KPiA+ICsJcmV0dXJu
IGZhbHNlOw0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgIC8qKg0KPiA+IMKgwqAgKiB4ZV9kZXZpY2Vf
dGRfZmx1c2goKSAtIEZsdXNoIHRyYW5zaWVudCBMMyBjYWNoZSBlbnRyaWVzDQo+ID4gwqDCoCAq
IEB4ZTogVGhlIGRldmljZQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+IGluZGV4
IDMyY2M2MzIzYjdmNi4uMTVlNjdkYjQ0YjU2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZp
Y2UuaA0KPiA+IEBAIC0xNzksNiArMTc5LDcgQEAgdm9pZCB4ZV9kZXZpY2Vfc25hcHNob3RfcHJp
bnQoc3RydWN0IHhlX2RldmljZQ0KPiA+ICp4ZSwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4g
PiDCoCB1NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
LCB1NjQNCj4gPiBhZGRyZXNzKTsNCj4gPiDCoCB1NjQgeGVfZGV2aWNlX3VuY2Fub25pY2FsaXpl
X2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NA0KPiA+IGFkZHJlc3MpOw0KPiA+IMKgIA0K
PiA+ICtib29sIHhlX2RldmljZV9uZWVkc19jYWNoZV9mbHVzaChzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSk7DQo+ID4gwqAgdm9pZCB4ZV9kZXZpY2VfdGRfZmx1c2goc3RydWN0IHhlX2RldmljZSAqeGUp
Ow0KPiA+IMKgIHZvaWQgeGVfZGV2aWNlX2wyX2ZsdXNoKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsN
Cj4gPiDCoCANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYw0KPiA+IGluZGV4IDBkOTEz
MGIxOTU4YS4uYTkzYzdlODg3Y2NhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV91c2VycHRyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdXNlcnB0ci5j
DQo+ID4gQEAgLTExNCw3ICsxMTQsOCBAQCBzdGF0aWMgdm9pZCBfX3ZtYV91c2VycHRyX2ludmFs
aWRhdGUoc3RydWN0DQo+ID4geGVfdm0gKnZtLCBzdHJ1Y3QgeGVfdXNlcnB0cl92bWEgKnV2DQo+
ID4gwqDCoAkJCQnCoMKgwqAgZmFsc2UsIE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCj4gPiDCoMKg
CVhFX1dBUk5fT04oZXJyIDw9IDApOw0KPiA+IMKgIA0KPiA+IC0JaWYgKHhlX3ZtX2luX2ZhdWx0
X21vZGUodm0pICYmIHVzZXJwdHItPmluaXRpYWxfYmluZCkgew0KPiA+ICsJaWYgKCh4ZV92bV9p
bl9mYXVsdF9tb2RlKHZtKSB8fA0KPiA+IHhlX2RldmljZV9uZWVkc19jYWNoZV9mbHVzaCh2bS0+
eGUpKSAmJg0KPiANCj4gT3RoZXIgb3B0aW9uIGlzIHRvIGJhbiBub24tWEEgb3Igbm9uLTJXQVkg
YXQgdGhlIHVBUEkgbGV2ZWwgb24gc3VjaCANCj4gcGxhdGZvcm1zLCBidXQgSSBndWVzcyBhbHNv
IGRlcGVuZHMgb24gd2hhdCBVTUQgd2FudHMgaGVyZT8NCj4gDQo+IEpvc2UsIEkgYXNzdW1lIE1l
c2EgaXMganVzdCBnb2luZyB0byB1c2UgWEEgb3IgMldBWSBmb3IgdXNlcnB0ciBvbg0KPiBzdWNo
IA0KPiBodz8gT3IgZG8geW91IHNlZSBhIHVzZWNhc2UgZm9yIGJlaW5nIG1vcmUgZmxleGlibGU/
DQoNCkZvciB1c2VycHRyIHdlIHdpbGwgY29udGludWUgdG8gdXNlIDJ3YXksIG5vIHBsYW5zIHRv
IGNoYW5nZSB0byBYQSBmb3INCm5vdy4NCg0KPiANCj4gPiArCcKgwqDCoCB1c2VycHRyLT5pbml0
aWFsX2JpbmQpIHsNCj4gPiDCoMKgCQllcnIgPSB4ZV92bV9pbnZhbGlkYXRlX3ZtYSh2bWEpOw0K
PiA+IMKgwqAJCVhFX1dBUk5fT04oZXJyKTsNCj4gPiDCoMKgCX0NCg==
