Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09819D3ABD0
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 02:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C0610EAC5;
	Sat,  6 Dec 2025 02:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krUJc1F/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6143F10EAC5
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 02:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764986629; x=1796522629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LQSdEfRl8hxevVpXtKlLtoWrOuVTd7fzGUrRaX/QQXI=;
 b=krUJc1F/8e6ky1Ft8sjRZv5M5APc/2oaRjyzvDt6BZtXeOVhyn9asLvS
 7gO4D/8WgYi53QiZl7oBPFiDQLZsw/pE6PWU+tpNEi9FuN9wyGlzyrkKa
 TmaH5Ze4JHUGq3+todN5PrzUateCMusLvXU+YbadWjitSaIITM71qff5P
 SN4HLgiLmGNO2eukbJ2nUmmd8qACQQkgieW3oy/xVfwX96oAPFzqzIYYc
 Ya0/3w869rUU91EEU2Uol0T8quY0a6fkqVq87dkYwzxSWuARHFmD3XpUY
 ufqH3MkNcxO2hpzA2GXsZuvnu7fM98W/4Xrb5tUhAmw+0xx/m1++EeyHC g==;
X-CSE-ConnectionGUID: EOn2HoxrSwuo2YwNNz1uSg==
X-CSE-MsgGUID: yKzCyoukREOzU8ujYdBiPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66210845"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="66210845"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 18:03:49 -0800
X-CSE-ConnectionGUID: ly7b+IDxQd28L1yjMlLYpw==
X-CSE-MsgGUID: 2m6F6A4TRYu8oR1RsJ7rgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="195460352"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 18:03:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 18:03:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 18:03:48 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 18:03:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvNgDZ42mJfR50OLzhdh5cxH1wXsfhtdBvQeMdxyyIr348OYL5XTy/089mWQWiSgqGec/cD7UEGkVvGKEmW7SpuxKUaLeVTKJex91BCJwIOtKf89Fi4LBKOsRuCTV8j8445SmK4phl9OXMK1UQhGE05lzzJFqcs5chFrinmfEywDRIft3lQJxvEVNQ0TXgqk6ilC73/iu3k0nta1d53Bvl2SuoG9lyzk/mMlaidbT6gjQ3MI+Tj1awqQgHj9CC9vkeJ8FHyL0KiUYv9ikJjIXVs/4rQmi/TiAKQTTosNmaOYMUPlN2pDg4FvPKRgId0j0lS8dY+DcMRT0pwf9yixJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5ewrBifK3muBWAeLY8YPAQ9wh62R0n5eEO8IASd43U=;
 b=XWhr8LO3MU50XKqku4I/h8KbVKa3Nosq2LKrlOr2iLSg1Rayf2Ene9ujULDA/a3nEG9TS/BNylY5aSk/PDzSZSX+AQjtEqySqQAKj/apzv5sKsY+PXVIVS6i1Q/IsrWJJs6LUYwIyFbd7YJ10eqINAC8gsUCw+eyeVb7EMNf0+VF9kb9gLpF6o0SUx04QWwcbeM8y2GUsk2Jiltofl83Ze8M6Mt7GgwHXk2H1sFeGxsNVtb10y0384I05mirTCLTOmjKv4pFoO6MXxunjQSpS37yb8TUlWO2JuKk4iEH+KWRjRJIYbCBZTwEjPG7OBsF97pudWjfLTucZFub9qreIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Sat, 6 Dec
 2025 02:03:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 02:03:46 +0000
Message-ID: <e987af92-2320-45c7-afba-b724ea23058f@intel.com>
Date: Fri, 5 Dec 2025 18:03:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] drm/xe/eudebug: Mark guc contexts as debuggable
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <simona.vetter@ffwll.ch>, <matthew.brost@intel.com>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Jan
 Sokolowski" <jan.sokolowski@intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
References: <20251202135241.880267-1-mika.kuoppala@linux.intel.com>
 <20251202135241.880267-6-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251202135241.880267-6-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:217::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM3PPF0644BB20C:EE_
X-MS-Office365-Filtering-Correlation-Id: 4158b7dc-bc6b-42b2-ad4b-08de346bb061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emxvUkhWdnZ3SjNqdzRsd3lub0RtY2pxL1RLN1dFMHpQR0NNUmhnTlF1N1BZ?=
 =?utf-8?B?eHVaMk93bEF2a1V1bURWSjdQQ0U4YUZxTFdraFB4amxraXdYZ08xZlN6eG5p?=
 =?utf-8?B?R1oyVk9mVVlQbFE4aVpYRkJHaldlTzJsVDlBQ293dnViQ09QaGY2ZkM4dDNu?=
 =?utf-8?B?bjJleVprbnpKSWxaSi9naWJZSU9CZEkrM1pTM2JVRzFOaWxhREIwTkRuZXgy?=
 =?utf-8?B?SnY4VzdJZTBYMitkazY0WnZ1WUdvYTd4aXM3RDkwWlQxNDVrZEVRUnZETzc5?=
 =?utf-8?B?NmY2ZnRHT29TbTVjWU0vUzdtaDIzZkhicmh5Qml3S1o2Ymp3UGdheXZzb25Q?=
 =?utf-8?B?ajZCSDhKK0VteFRDTmpCMVRRMVRqWlRhV0hsOGJXdmFtSEVmQUpxb3p5by9q?=
 =?utf-8?B?NjY3bjcrUzdPNGRtZUNHMks5VGFKb0hlTGtWNTRlL01DTEJyallmOEdLbnJN?=
 =?utf-8?B?S3FlSnlYTjRRMUdWdHhycVIxVm1yL0FSU3RMWmZDN0VIaHVnZHZrdDNZZ2JL?=
 =?utf-8?B?T0RvMjZJTkpXSlcvUWNTaksxdXdNTzhpdnVXWkFjc2cyeG1NVHVYbHVWbjJC?=
 =?utf-8?B?UkZnd2p3MCtmY3RFcWY1SzZBNmpYRDZDMHNoMjYvMDlNMzc2S2dyaUZRWEkr?=
 =?utf-8?B?S2wvUHVFTTViNmFSMVlUNVFadjBDd0xVRnE0RHpqanNMQ2QvZkZwS3FCZ1JS?=
 =?utf-8?B?NFlTQWliR3p1WGRhbkZUUXFuSkx1Rm1KOVM1SlhTMlAyV081ZndjYWRkc05M?=
 =?utf-8?B?VzB5M0ZKSU16OFdjM0tZRXBjRUVhbjNzTEZxdk9pcGMzSFBHVjlTamttamw3?=
 =?utf-8?B?d2t2ZGVhOUt1YkdkSDFqY1lpd203TnJPL2ZhV292NVYyazBRNEtWUmJBcE13?=
 =?utf-8?B?dlowSHU3RnBSQWw4YXNpUlZJa2IyZ2lDbEtxWURuSUMwSHFScldOcE9SZ1B3?=
 =?utf-8?B?OWJjazlHd1AxVEdTVDY5WFA3c0UwdzhVM1VScmk0akZiRGd6NGhnR2RSTFNa?=
 =?utf-8?B?R3dRcFlCNThJU3BVVGZDU05HUDNIZ1NyNVR1RHRucmNLdEEwd1NYVU1XMzhl?=
 =?utf-8?B?QnVhMEEwWE5wRDQ4dmJJMUtwT0F0eFFZYTFUR3N5cnQxakZ3RWZuQnFJZTFT?=
 =?utf-8?B?OGRra01kMnkyVWkwRkcwWHRaUXBkYVZqZDhnQmZRa0RVSXc0K1lDN1piWUtN?=
 =?utf-8?B?WVM2Smc0TkFaTUs5MldSVmtPMWFUcVliZVdMN3FoR3h6UGdJeFVFSGw4WGhv?=
 =?utf-8?B?QnRrT2Mzd0ZaZ05QQ0JqVXVId01tL0FOZnZlSVlQS0RJNHlmOWhRamhiTnlv?=
 =?utf-8?B?dWJ6MnV1MCt6UC9zQW1xaVprbyttY1VVZVZVdEY5ZUVEd2w1MjY5YU1meVpY?=
 =?utf-8?B?V0JCYU9DYmloQllJQUx3bHdQbGI4Z1k4RHo4ZzFtNUQ4aFJzcTcrU3pRWU8x?=
 =?utf-8?B?VlZ6dWg1TUhOL2VTbS9teWl6YkFPMldQdnExM1NDVXlETUw2aG1MY3ZVWldo?=
 =?utf-8?B?Q0ZncmhkdkY4ZFZuandhZHFic0ozK1VYOXhxNmxFZjk0SCtyTERuMlVEQUJG?=
 =?utf-8?B?ZmJrcS9vZ2x2QXMzbHByazFVN3ZjdHN2Q1dobHlFN25YcnJXcFhmdy9YRm5u?=
 =?utf-8?B?WjhnUzNDU3oyY0dnRWYwOXdXTElCN1ZWTGJvYWgyK1I0TzlNSGJuV0Vxd0xi?=
 =?utf-8?B?QmVaN1Y3ZncrMmpmQnV0SnFyd3FtZXlkQ2ZzV3lHK2E0N2R5ZytOYlZYaFRC?=
 =?utf-8?B?QjUrMyswSWJ4WTRzWEk0alhMTFo2WDB6bXFqTkNmTzk4VTUrQTRtMzZwcTkx?=
 =?utf-8?B?Tm9qdFJ5R0NOeEtBZldzUFlhWWwrY2pnQ0Y4VCtiWkp3MGtpaDYvTUtUbUQ3?=
 =?utf-8?B?dkQ1MVJPVDFWcEdndjkxTWU4c0NsRmgxUldNbUE4ak4zWlhZTm1vbStDemY3?=
 =?utf-8?Q?fZkplE5PXGRfOeP3rCwiwlvK6Gn8WdnU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M09zUlhvV0xjVHVYL0w4RHlQNDNib2xpWFpNQmtONDZaUXBqdERleS8veFZO?=
 =?utf-8?B?UHp0dHNDdlNUVTNxOGI2THBXcmxOWDVZcW1NWkI1dml6ajZCMHdCcnlLUTBn?=
 =?utf-8?B?clF1NXREREFjNTkrYzU5Y2hDRlk1dE1yT0Q5VWk1dWZUd3FHdU5HTlI5OTJ0?=
 =?utf-8?B?M0dXWUNVa25MaWY0TGRJSzBBMndyeFo0RWZLVzQ5d1U0VnJ2TjFQSVBXMUJq?=
 =?utf-8?B?eCtRQWdybFZJUjZZQXUrbmlsQ3EvbnZqRHlPNVk1VHprT1lwY3pBR3h6Q21N?=
 =?utf-8?B?ckJmUnJWWEZwaEV4QUhYbVNFNFI2a3lHd2tqdzJMVTRmYlYrR2pTeGZ0bkJO?=
 =?utf-8?B?MGptWUlwVW1jMzhIdWxzeDVMVVVETWJsODdkOGZ5SloybFdwVXlVaHRMWmpB?=
 =?utf-8?B?OXYrbjJ6ZzlDekdyVjBkZFVCOXl3WHRINFEyMUpJL242OFNHZm5ScVpJZlBO?=
 =?utf-8?B?ZDQrM2VjSGFXRWlPM1Njenh4ZUhFUk8yVjBJZGlRN09nQ1Y1STFiQjVNQytn?=
 =?utf-8?B?aVNFRDk2Ry9hakpRMFdLSVB6VHBnNTJWVkhWZHYvV0txOGNESGVibERKWlRX?=
 =?utf-8?B?b1JjTS9GcTYzaGJYUWJIN1N5SitIOXgvaW5hZkErTE1vQWhUKzU3UUZxWFZn?=
 =?utf-8?B?N0I2ekhmVjNHdnBpY3VhOU9CSXJNcyt0eDVEai9YSzJaRlZXVXR2VVB4YnFk?=
 =?utf-8?B?cUtUU24vUXFYTlBUYnZMZDkwdHVleFBSb3YwWHpRUnVxTU9sSkExajhLeVhB?=
 =?utf-8?B?Y3V5U3ZYZWtWRWVpbXhwSFpCd3FwOUhYNElncU1ubzBSclE2S2tvNmxwNTQ1?=
 =?utf-8?B?N0l5VGRDWUhWTWNPTThQYnkrRXZ3ZzRyZE95MkwyZVdKMklNcEtHYjhYN3lY?=
 =?utf-8?B?OVNWcWZVYW5mNHpHZlRpQ24vVm5vM1JaSHFXbWZQWXcwOE9tSnliTFZVM1Iy?=
 =?utf-8?B?UytMT1pPYkZPZ2ZYWjdjUElvQW8wb0FiUEt4eXNycE0xK1NocllDYnBlaE1F?=
 =?utf-8?B?MDl2UndSOG1EeXdQQ016eHRRYTNaSTVZUi8wd3BxM050cWdVQktId2l4OUtp?=
 =?utf-8?B?Z1JBa3dTL1VtTFFMRDZyM0V4WHhjYTlqOFhaMU50VnE1ODJHdkZSbkNhWGY2?=
 =?utf-8?B?OS8yVW1Tend4b2FhTmxCTEJFL0ozRVlnMHRjZ0Q4TzN0L1U0dENjdmlURTNH?=
 =?utf-8?B?dk8xNlh0QjdQZjRGaWRPUmZUYVp4TlJWcTBUZEVVZEQ4Y0cwY2dtWTBFVk9u?=
 =?utf-8?B?dzhRNFhhWWhHZkEyV3JWa2haVkN0cUdWT2NQeHdBeVpGcUpyVXdKSkFwaTZW?=
 =?utf-8?B?NnVmUjlHSllHd0tieUoraG9MZGZJaEtoL3Q1WE51UjFHYkJLcStjbUREOTAz?=
 =?utf-8?B?QmNxYVpGSGRZY0hiRTRFZEJRdGM4L0R1eS9GMzdVczlRQUs3Yy8vUUtFQnY4?=
 =?utf-8?B?WTBuVDB4UEtmaEpBb1dZbWQvWEFMbTBwNGxVc3BONW95RC9HZ1dSRGpCa1ZU?=
 =?utf-8?B?RTRMWVZpSDUxeDJjSGlQWVBSNGxSR2kxSG8yUGoycS82R0t2QjFCTlBCVnZl?=
 =?utf-8?B?N0RGQmRlMWdvLzhFU3pGUlk0UFF5K0J0SUZhTzRqMC81VU5IY00wU1hmSEZX?=
 =?utf-8?B?WGVxYlNZclZwNTl4VFlnNXloQmZObjdpSlEyRzd2WW9lSWNEVWtjTkRhaGE4?=
 =?utf-8?B?cTkwZS9UVDFGVlFpU3ZJQjQ1SzZtOWZ6UWVQSCtZSDdDemh1RUZPTXVLeG8v?=
 =?utf-8?B?VG5GdDZnUGhaZU9oeTkyM2YzSnlKa0h5K2FvcWlRaG9mblVUa2IvL3Y0d3J4?=
 =?utf-8?B?RlJmY2RZUk9IQTRhbFlENldkQVN5ZUVncFhHaGgraWZiU2s1VUVJVmw0MjRx?=
 =?utf-8?B?L0lrbWttbUxLUU5jTVUrZEROVnh3dTA5emgrM3lQdDRQTjd0NHlHV1c3WUhz?=
 =?utf-8?B?QzVSckVWT1BIcjcrVWR6YVVCcWlsT0I5ODhGZldvaEZ0MVVhb2xKQXpLSzlO?=
 =?utf-8?B?VGRSTGJTRVBpSXFHQ2twQ2V5M25SK3FlYW9PaXk2dFMzRkIvck91UEdKc3R2?=
 =?utf-8?B?S2FzQmpYYnFDN053Q2ZFb2c2V1VlWTRSNE9kWkxTS05uOFUvNG5RZjd1bHZM?=
 =?utf-8?B?SXgxZlROeVZDY084UTdxMVBiZzQ0d2diRm1ZeUhHOTRzQ2JoMWR5SG9YaFJ0?=
 =?utf-8?Q?kIUq6NbwHe5exgTHMj1ypsY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4158b7dc-bc6b-42b2-ad4b-08de346bb061
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 02:03:46.0436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGx5d2wCdgclxwEFBYvKtWT4If0mngYbIzdfcW6CmJbNHO2Zb1Tog29YMxj2gchFgXZm2qz4tWNvTc2bURZ44nRd2GnpnjgzcXOvl5LmlcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
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



On 12/2/2025 5:52 AM, Mika Kuoppala wrote:
> We need to inform to guc which contexts are debuggable
> as their handling is different from ordinary contexts.
>
> v2: void return, use xe_gt_dbg, no need for lrc (Matt)
> v3: add the workaround enabling (Daniele)
> v4: version needed to 70.49.4
> v5: bail out early before registering eq (Daniele)
> v6: export the guc action for future (Mika)
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Jan Sokolowski <jan.sokolowski@intel.com>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 ++++
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  1 +
>   drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++
>   drivers/gpu/drm/xe/xe_guc.c              | 17 ++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h              |  3 +++
>   drivers/gpu/drm/xe/xe_guc_ads.c          | 17 ++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 34 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
>   drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>   9 files changed, 85 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..32a5f680a6d2 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -155,6 +155,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
>   	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
>   	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
> +	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
>   	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
>   	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
>   	XE_GUC_ACTION_LIMIT
> @@ -278,4 +279,8 @@ enum xe_guc_g2g_type {
>   /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
>   #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
>   
> +enum  xe_guc_eu_kernel_debug_request_type {
> +	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 265a135e7061..fba190d4f84b 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -423,6 +423,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
> +	GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH				= 0x900d,
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index ddaef00b56ff..e5590c6e3148 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -17,6 +17,7 @@
>   #include "xe_device.h"
>   #include "xe_gt.h"
>   #include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>   #include "xe_hw_engine_class_sysfs.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
> @@ -593,6 +594,7 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
>   				  u64 value)
>   {
>   	const u64 known_flags = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
> +	struct xe_guc *guc = &q->gt->uc.guc;
>   
>   	if (XE_IOCTL_DBG(xe, (q->class != XE_ENGINE_CLASS_RENDER &&
>   			      q->class != XE_ENGINE_CLASS_COMPUTE)))
> @@ -604,6 +606,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
>   	if (XE_IOCTL_DBG(xe, !IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)))
>   		return -EOPNOTSUPP;
>   
> +	if (XE_IOCTL_DBG(xe, !xe_guc_has_debug_contexts(guc)))
> +		return -EOPNOTSUPP;
> +
>   	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_lr(q)))
>   		return -EINVAL;
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 88376bc2a483..ec0d6b5e0693 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1744,6 +1744,23 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
>   	return GT_VER(gt) >= 35;
>   }
>   
> +bool xe_guc_has_debug_contexts(struct xe_guc *guc)
> +{
> +	const struct xe_uc_fw_version required = XE_UC_FW_VERSION_DEBUG_CONTEXTS;
> +	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (MAKE_GUC_VER_STRUCT(*version) < MAKE_GUC_VER_STRUCT(required)) {
> +		xe_gt_info(gt,
> +			   "debug context unsupported in GuC interface v%u.%u.%u, need v%u.%u.%u or higher\n",
> +			   version->major, version->minor, version->patch, required.major,
> +			   required.minor, required.patch);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_guc_g2g_test.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index fdb08658d05a..10e387c72861 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -23,6 +23,8 @@
>   #define GUC_FIRMWARE_VER(guc) \
>   	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
>   
> +#define XE_UC_FW_VERSION_DEBUG_CONTEXTS { .major = 70, .minor = 49, .patch = 4 }
> +
>   struct drm_printer;
>   
>   void xe_guc_comm_init_early(struct xe_guc *guc);
> @@ -55,6 +57,7 @@ void xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
>   void xe_guc_declare_wedged(struct xe_guc *guc);
>   bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc);
> +bool xe_guc_has_debug_contexts(struct xe_guc *guc);
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *payload, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index bcb85a1bf26d..f4d1470229f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -363,6 +363,23 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
> +	if (XE_GT_WA(gt, 14022766366)) {
> +		if (xe_guc_has_debug_contexts(&gt->uc.guc)) {
> +			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +					 GUC_WA_KLV_RESET_DEP_ENGINES_ON_DEBUG_CTX_SWITCH);
> +		} else  {
> +			const struct xe_uc_fw_version required =
> +				XE_UC_FW_VERSION_DEBUG_CONTEXTS;
> +
> +			xe_gt_info(gt, "eudebug needs GuC version %u.%u.%u or greater\n",
> +				   required.major,
> +				   required.minor,
> +				   required.patch);
> +		}
> +	}
> +#endif
> +
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3ca2558c8c96..dd9d567f0a7b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -651,6 +651,37 @@ static void __register_exec_queue(struct xe_guc *guc,
>   	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>   }
>   
> +int xe_guc_action_eu_kernel_debug(struct xe_guc *guc, u32 id, u32 cmd)
> +{
> +	const u32 action[] = {
> +		XE_GUC_ACTION_EU_KERNEL_DEBUG,
> +		id,
> +		cmd,
> +		0, /* reserved */
> +	};
> +
> +	return xe_guc_ct_send(&guc->ct, action,
> +			      ARRAY_SIZE(action), 0, 0);
> +}
> +
> +static void set_eu_kernel_debug(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	int ret;
> +
> +	ret = xe_guc_action_eu_kernel_debug(guc, q->guc->id,
> +					    XE_GUC_EU_KERNEL_DEBUG_ENABLE);
> +
> +	if (ret)
> +		xe_gt_warn(gt,
> +			   "GuC ctx=%d debug enabling failed with %d",
> +			   q->guc->id, ret);
> +	else
> +		xe_gt_dbg(gt,
> +			  "GuC ctx=%d enabled for debug", q->guc->id);

nit: q->guc->id is unsigned, so maybe use %u?

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +}
> +
>   static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -705,6 +736,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>   	else
>   		__register_exec_queue(guc, &info);
>   	init_policies(guc, q);
> +
> +	if (xe_exec_queue_is_debuggable(q))
> +		set_eu_kernel_debug(q);
>   }
>   
>   static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 100a7891b918..b25bd8f32abf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -50,5 +50,6 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>   void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>   
>   int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
> +int xe_guc_action_eu_kernel_debug(struct xe_guc *guc, u32 id, u32 cmd);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 7ca7258eb5d8..ae6daa50eaf1 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -77,3 +77,5 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> +14022766366	GRAPHICS_VERSION_RANGE(2001, 2004)
> +		GRAPHICS_VERSION_RANGE(3000, 3005)

