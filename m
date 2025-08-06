Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F223C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 15:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CADF10E7A3;
	Wed,  6 Aug 2025 15:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYhtUfu8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0385810E7A3
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 15:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754495707; x=1786031707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m4FU17k/pHJBGs6JEjSDwR2C0wOChZD1JV0kAJlH4MI=;
 b=gYhtUfu8wnMDUb1UPGjVflFVXbjxAx2vK0Uuu4UaqMqsTkfBqKLBu84c
 wA5nltMwMWotOC4a/0IGJy0XRe602Lv6osub4LfyEostLWMIu+wzNLt7M
 xka309KwvOw2mWixHSYXV2qcitixfzqHiqYpJDW8tVDDOdg1BvFAlZ9ZX
 NXSF7emM9fRPHaCbVP4QaRFpRa+HBCVW6HiilphRlPYHsJ7BoNSYqWW6l
 yNmlLKoQK+kRuU2+1yOyruk3coIHl6lOHvRpyGbF4Mk6cHBqe50oCSf6p
 QV2ezXKUZbJbYuWdWfvivOxil6jQtGANLvVgc4yem3/+hLQP8J2gJlepI A==;
X-CSE-ConnectionGUID: sAWrRclET+WkhcxW0sSk1A==
X-CSE-MsgGUID: fj//YcSvQWCRmG/ZmVH5sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79366511"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79366511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 08:55:06 -0700
X-CSE-ConnectionGUID: kXREK5UKSlm6Eb5i8Fqcow==
X-CSE-MsgGUID: qep0E6OcTLm4TI+sGb42kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168929507"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 08:55:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 08:55:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 08:55:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.66)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 08:55:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isgOIbAUJkLON9uL8z4L2eUdmL3cbAzYzb5vqd1P72fSfTxrtbH7JmAq+GR5PcHXDtfPS9MvyuSaPUt8imHR4o5az5/TKALQxyBcvVhSiAsgDWNIKFzx8WJwXk8aTLTIdma6h6n0eB9MUuXa3/VIwD0iMbiqqybIFCaUvg1Z+/Yn1iXSkW4hyJAN04TJIjrOVx7km77FUGveR3Kh9S/dE/+HzssGKMZ7Jo6WDxxd/L9JGmzO6OFYvxr21frOZdmUTt+aIixLj3+rHCGbEaJpDCvCNWmWQ4GsLFHFY1lzbKrpLi5YuxoQCliwpe5qnwXo8hI8yYeR2u3uOoeAP1uP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4FU17k/pHJBGs6JEjSDwR2C0wOChZD1JV0kAJlH4MI=;
 b=Q0tFggsEpfjJNc1QA4wMWPpM9BMfCrNzhvf2aus0O8VlYTG8lo3HSUpVaFZyGl2unHFzDmuNNwZRPXO2Mmlps7oLhT/KCVX9FW5BJ6FDSFaaPFee9Qv7G7dlrsEPLDyzgUKUp7mO9V0VzJaJLGOHENzhqxCalrpElo2sE9zRWGilDF2xCFLuiIFp2QFW2mruMyKIzqkFNa3WMaUCfIlg1TBaHWBd+Dbr5B55KCYVB3Rdttd4FKw82mjkxqQ4cDSrGeWCU6xBLae1L0KR4rItjgwGNlmP3rDqNHxpdCKxW1JAnVQsmr8AQcFutepq6s+1cWk4Wzejhx1f/9Cn7SDHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.13; Wed, 6 Aug 2025 15:55:03 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:55:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't expose mailbox attributes for skip_pcode
 cases
Thread-Topic: [PATCH v2] drm/xe: Don't expose mailbox attributes for
 skip_pcode cases
Thread-Index: AQHcBuYfSZHmP3HhbEO+UUXJZEc5rbRVxyKA
Date: Wed, 6 Aug 2025 15:55:03 +0000
Message-ID: <157ffa826b02292dc383ab444e1cb11b5b77093f.camel@intel.com>
References: <20250806152256.748057-1-raag.jadav@intel.com>
In-Reply-To: <20250806152256.748057-1-raag.jadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB8227:EE_
x-ms-office365-filtering-correlation-id: 4c4968b0-33cb-4093-2a65-08ddd5019b58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L0FBQXJiMVZEQ0lQaDlqWGJiTkgyT2djaWxVd2RrcnRWb3dJekwzeE5mMWsx?=
 =?utf-8?B?QmZnL3RFTm5MSko1T0xycHdrZTVKc2ZGRUdKeDh6dEFmcXA0RXdJdy9ZeWlP?=
 =?utf-8?B?WDExSzlOQWY1b1BBYnlibzNJOHVMS3VnUEdZUWJxUXJvT2FuUnMxV3BDRHQy?=
 =?utf-8?B?N1d1dEdteXEzb1lZTmZxT1A1d1BWeWVlVUN3dThrdVQwMGZJQ0wvUVpsQ0xT?=
 =?utf-8?B?QXV5Z2tPTzJXMkRHY21FdjF1eE9jR1NBSy90K2N3dmJ1MitOZVcrcC9VL3pj?=
 =?utf-8?B?VVlmYWFnQ2xYYXI2dEtWMFMvRHV3SHJWVjFBdTNQdU8zQmZ3UzVKYkFsNVNS?=
 =?utf-8?B?cWNYTU5HVzlVTm81aUo0SGU1SWloOXZ6U3dQY1JzWHhOTTVHUVZhZ256WkEx?=
 =?utf-8?B?WmdKUys5ck9vTVV5MkE4WExjS0xuQU5tQmVmU2Y0TDNNSFJ0WjE0N05CTllj?=
 =?utf-8?B?ZGNJTUJGTnhZSWl2cUExWnpoS1QrRC9EMVM2TGZGaW9CemlmTDdxZkdGaWhj?=
 =?utf-8?B?bmcrbWhHL0wrWWt5T2FuSjNBc1hUQVloanVMdGtRYmpYclcxTlQyaFZRMFNp?=
 =?utf-8?B?cmJ2SVdLSGNhQVV1dDVHaWhoL2hIcEsrMGhmRVJZaHc4Z2MxNHorVXRON29R?=
 =?utf-8?B?MDJzSkRQN0x4L1oyZERQc0xjOCtJNFVUaFgzU0JQOG5yUjNueHdSclc3R0Q0?=
 =?utf-8?B?U3NmRWw1ekcxK3RLcTVYM1FnMDBBclBZUUlmd0JMMzRJZ1k3S0ZlSG5Jb3Bz?=
 =?utf-8?B?bHNwcTBXTUtYMHRJOVZpMllZRGg5N0NhaGprZmw3MkV3bngvbVM1Qkw0ck1n?=
 =?utf-8?B?VVJjc2dkRVVVS0pQZXlOY3doYnViTk9mcHVndjE2T3JGelUyb1c0MkJRVytp?=
 =?utf-8?B?Rnl1eUI5YWxvNnJkKzdlZUpXejRxdzlUTWtIQTB3OFFmVFhDeGNkemVmWjFT?=
 =?utf-8?B?RGVRRTB1cHh3VU0yL2EvaWVjRC9OMUMrdDJsWldQUWhKaTZtZEVOU1hIZysx?=
 =?utf-8?B?VkZGcmgvYy9WdVA2bURDMWdaYzd2emxyaXR4cWM0LzZOZzJOYlQycTFXS3d6?=
 =?utf-8?B?WUpra1dvSHNHSm5yeStpM05xUTIwVlFWLzZSbGJXcEZ4OU1JYUU0RHJLT2xp?=
 =?utf-8?B?VWpqV01JZTFhdCtqYlF6bWxUNW9mVlZqdjdOM2JlcmpHODBmaDhVL0NpZ1JM?=
 =?utf-8?B?UHFRN0tZdEFpYlM3SnZWL2F6NFVNRFRiTmg0WE1uVUJkUFY2OGczOFNaMWow?=
 =?utf-8?B?RW0vWmEzWmxxckxNYTEwUEJXbkdvdDdoTUVFekVlQjcvbi9MM1dPaTNjZ281?=
 =?utf-8?B?bUZOMGEvU1ZvcEZTSTl4UHAxM1A5SFU2Ym1kYjRRdjlYeGRnTUxvL1orc0ln?=
 =?utf-8?B?M295VXl3TlFERjZEUDNkK3hVOUFHTGlvVTlEbW1LSkNTMG5TMWNUYUVjZ2k2?=
 =?utf-8?B?QWpGdy9HbldRMFg4NVJoTVZhOVZrdlR5RnIrdTcyd3pqVVRiOHdQNXBzSlZP?=
 =?utf-8?B?QzY3ZVA3OEZpelFDeGc4T1A5YVhKYXR4ak1LckRCSHVPbk5XcVVVVC8xVHF1?=
 =?utf-8?B?WUNjTzJ0blh4eXlWc1BQNGxldVEzT0R6bDQ1NHNDa1VNVy9tMm8xV0Q3b1dU?=
 =?utf-8?B?SXRhQ1FKd0cvT00yYk5udHB5STMxZUk4SDgybWx4YllqTzErSHc0a0dmdEpi?=
 =?utf-8?B?SUJkNGVOOHArUmlIMDh3Qm5RQTdINnhkWWVDWG5vZW9DQnRZYWY2ZloxNVo1?=
 =?utf-8?B?T3dUNVFQalRvVDVVZ25DTDJqak10djhLSUhySnNLMUl5d29zdWFJQnlLbmVY?=
 =?utf-8?B?cHNHR1pxTUhONXI5TjI3VExMWkhYQW0zRzhneEtXVXkxTmtYV2E3d1hnUHVw?=
 =?utf-8?B?WXdlT0t4OCtGNTF1d1ZIdlA3b0Y2QlR0OS9yQ25CTUJlbXVkSkgwSVMyZUh2?=
 =?utf-8?B?Ylo3Z0xqQVI2bHhzNmZnQ1haMnRqVlp4S2NqclBLZVhyTWdkWkMxRFYrWGpQ?=
 =?utf-8?Q?Jlgr9GeaLwuZ6BzMtTc+oBkHpE0jss=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmV1K0RJS1lUQmw1NW1qeFh3WlRXbUkvdUgzUGFaOGQ1aHFhUkg4SXhzbVFM?=
 =?utf-8?B?b3ZWWm9BZUxoMWhhTllxMWNIcEdabDQwVFd0TlVQOEJySklJOG0yTVJGdFdQ?=
 =?utf-8?B?S2F2QlpxZG44K2JBS3N3UDFzSSsrVGxiSDlmUkVPWThlV3VkTnU2cWNzdDdU?=
 =?utf-8?B?dmxmVjdoVzBnQjd5OGgySEVaVkFwdEloMGdRUThSWXRtc1pBb3hyNFVzNGtM?=
 =?utf-8?B?L2N4UzRxczhQcWxRN1dsN09UUnVVVW9sa0FrenpKTHhnaEVnYTB4MGdTMDJD?=
 =?utf-8?B?cTdXV3lLRzFsVjlEekQ3eFN6WnZ0WG44RHNGc09rVXkrNkVQMXBnLzJNZnVD?=
 =?utf-8?B?NTdVZ0o2SVNWdS9pRlFlVHpwRG9mcVh3enNOZjhEODlhOFBjSVB5UVB1U1V1?=
 =?utf-8?B?TFZ0QkRkSlpBODVXUmN5YWlxVGRUb2VxYlRKb2pZaVgvaXRmZG93RU1VWDJX?=
 =?utf-8?B?YzBWYmg3R25pL1AxTWZpMS9EZDc3dml3Wm03Y2tnZ29Uc2Q1dFBLdS9UQ2dX?=
 =?utf-8?B?b3pUZGoxemdVWFU2aURWWFNZNHlqdkI4K2lkZW5yRThhakZvZ2sxSGYzQy9T?=
 =?utf-8?B?UmtXU1hsNGFBTkZYd3RGZittWmkyNnU0UG5OSE5UZWoxTkk5Ly9hdHBpREVx?=
 =?utf-8?B?YmpWcVZSc3lVZVo1QUEwVUhKZm1FRkt1Q3haT1Q3bjJucHF4azRURWhlS1lB?=
 =?utf-8?B?TStPa1BvdmEyRi85dzhvdndoWDVhbUNYbXRzYU5iOXYxblFxWlU3TlZGcTZl?=
 =?utf-8?B?cHQvZHJTUE05UnpCQzZLZ2RRNGN0aGhsOE54Y1pBbU12YllRb0pTN0xDWnNt?=
 =?utf-8?B?UWhjckJaZ3hmQ0tTOXpDbCs2TGdBV2dFcG11N0FYL25RS0FxZXhyVDkrV3hJ?=
 =?utf-8?B?eVFsVU9kWFhhMWp4OW44ZmxWRkxMSjRyZDJRSUg5VjZGREFCZlQrVG03dXhG?=
 =?utf-8?B?NHNPTGpHWjlvTXhHbDdndWtUMjErQ2w3TTF6Wi8zbUZTaysrZmVSZDVVZFZI?=
 =?utf-8?B?cUFETzlsaUl4NFNuQlJKV3FUdEJJbW1pa2tyN0xjN0dwQnpIQktMRUpsZHRw?=
 =?utf-8?B?VEhoNkVaTWkwQmZyRU5sZVZxOEF1aVVkVHRYdndYcldRRkNTYjR5aUVIam9v?=
 =?utf-8?B?U0J0Q1JoOEx6bVlVQjlFMDIvN1NWU0E5UmNSb09NQXBKek1rb3BkSGVMdFVM?=
 =?utf-8?B?akM1UHJqdjFES3JVMUtvcUd4MVAwMmR3VHBuRzVOd3FTanFTam5qZ0p0S0ha?=
 =?utf-8?B?Y0lJc0Y2MEFRNWVBKy9kVUdMY0p6YnpVWklxU2tnQXF1dlpEQ1F1aVFaVVBu?=
 =?utf-8?B?SDNqM1JXK0Y4d3JTNkFYQjdPLzVjb2RBbW9QQ2tkOHpXMExpTEVMTUsvZUxy?=
 =?utf-8?B?TnRzVjkxUnpYcFVKVUlIZERGRDAxNys2R2w4a0VKQWVNUFV2bHhDMUsxOFpa?=
 =?utf-8?B?TjhDRFBQOXVMUmFVMkxiaW5QUVZUQkUzTUR2OExxanQrbGYzbi9HYTZhZXc4?=
 =?utf-8?B?UE0zNXZWdFcxdHlOK2RyeTVkamduUjBYdE93K3g0azNhMkcxYnhiTjJSS1da?=
 =?utf-8?B?cDlFZmloS3ZFQ1ozTERRNGZGTUVnSjdsa0JvOGV2ZlNVSSt5Q2NsZnVuUVdt?=
 =?utf-8?B?MURuK0JXMmF1SHp3OVlZTTR4ZEtHMXJRaXNnZndCOVlPbWxIOWRZNHJmd0Yr?=
 =?utf-8?B?VUZMQ1JFeWRzeEZ1M2pGL1ZVejZhbkdxVlI5YWlJM3VDRm1oVnRsVXdqZXY1?=
 =?utf-8?B?MXdMYUFjQzZ6aTlwZ0VDK21nMjA5QWErWXh1MjNJT2Vsbk9RRDFFVUNzMHBW?=
 =?utf-8?B?NWwyRGhYNGdneFFPS0themQ2b3R5N2lSZTZ2T2N5YU8wZG8wSkNSZlBkRGE2?=
 =?utf-8?B?NjM5QnFvcDI0WE80aWpLU1AraXg1NzdmOVdxYUl1NERxaU9OaWtBYTV5OVFl?=
 =?utf-8?B?ek5YOWZxbTZ1Sm5nejFBbDI0TXZoT0pZelVvbFNJZSszQ09RYnNQNllIL0hr?=
 =?utf-8?B?QTkxTDVtdlkrbjJDNkxreXlyRkRzdmV1UEdQcW1rY2IrQXlEZHhNRGt4c1l2?=
 =?utf-8?B?TWdhTVdsZzE2Zk9LczhwMVhLVnAxY3VnNzB3ZGN2NVU5Z1VSb2FHaE9tLzRn?=
 =?utf-8?B?UVBZM1ZHdUNVSTg3QjFleGxsWFJ6VXMxR2p2Mjl3R3BZSXQ3ajJ2cnQrbVly?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6DE5497E918344AA9242DB0BBB9366F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4968b0-33cb-4093-2a65-08ddd5019b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 15:55:03.4053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /a8GDwfJfD6/wOqQzxFHiJNvJpTHqUOCchfEkPVUDZgHLUqln9O9XpzQ6rbjGDJQYlnGmd014V0rFM/m0xooiKK6MIaN591Bi++ZdbhiCgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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

T24gV2VkLCAyMDI1LTA4LTA2IGF0IDIwOjUyICswNTMwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBD
b21taXQgYTdmODdkZWFjMjI5ICgiZHJtL3hlOiBEZWZhdWx0IGF1dG9fbGlua19kb3duZ3JhZGUg
c3RhdHVzIHRvDQo+IGZhbHNlIikNCj4gdHJpZWQgdG8gZml4IHRoZSBzaWRlIGVmZmVjdCBvZiB4
ZV9wY29kZV9yZWFkKCkgcmV0dXJuaW5nDQo+IHN1Y2Nlc3NmdWxseQ0KPiB3aXRob3V0IHZhbGlk
IGRhdGEtb3V0IHZhbHVlLiBTaW5jZSB0aGlzIGlzIHRydWUgZm9yIGNhc2VzIHdoZXJlDQo+IHNr
aXBfcGNvZGUNCj4gZmxhZyBpcyBzZXQsIGEgbXVjaCByb2J1c3QgZml4IHdvdWxkIGJlIHRvIG5v
dCBleHBvc2UgbWFpbGJveA0KPiBhdHRyaWJ1dGVzDQo+IGF0IGFsbCBmb3Igc3VjaCBjYXNlcy4N
Cj4gDQo+IHYyOiBDaGVjayBhZ2FpbnN0IHNraXBfcGNvZGUgKFN0dWFydCkNCj4gDQo+IEZpeGVz
OiBhN2Y4N2RlYWMyMjkgKCJkcm0veGU6IERlZmF1bHQgYXV0b19saW5rX2Rvd25ncmFkZSBzdGF0
dXMgdG8NCj4gZmFsc2UiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSYWFnIEphZGF2IDxyYWFnLmphZGF2
QGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNm
cy5jIHwgNyArKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlX3N5c2ZzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4g
aW5kZXggYmQ5MDE1NzYxYWEwLi43NWI2Y2Q4MTZmYTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3N5c2ZzLmMNCj4gQEAgLTI2NCw4ICsyNjQsNyBAQCBhdXRvX2xpbmtfZG93bmdy
YWRlX3N0YXR1c19zaG93KHN0cnVjdCBkZXZpY2UNCj4gKmRldiwgc3RydWN0IGRldmljZV9hdHRy
aWJ1dGUgKmF0dA0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gdG9fcGNpX2RldihkZXYpOw0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAq
eGUgPSBwZGV2X3RvX3hlX2RldmljZShwZGV2KTsNCj4gLcKgwqDCoMKgwqDCoMKgLyogZGVmYXVs
dCB0aGUgYXV0b19saW5rX2Rvd25ncmFkZSBzdGF0dXMgdG8gMCAqLw0KPiAtwqDCoMKgwqDCoMKg
wqB1MzIgdmFsID0gMDsNCj4gK8KgwqDCoMKgwqDCoMKgdTMyIHZhbDsNCg0KV2h5IGFyZSB3ZSBt
YWtpbmcgdGhpcyBjaGFuZ2UgYWdhaW4/IExvb2tpbmcgYXQgeGVfcGNvZGVfcmVhZCwgd2hpY2gN
CmNhbGxzIHBjb2RlX21haWxib3hfcncgd2l0aCB0aGlzIHZhbHVlLCB0aGUgZmlyc3QgdGhpbmcg
d2UncmUgZG9pbmcNCndpdGggdGhpcyBpcyBhIHdyaXRlOg0KeGVfbW1pb193cml0ZTMyKG1taW8s
IFBDT0RFX0RBVEEwLCAqZGF0YTApOw0KDQpUaGVyZSdzIG5vIE5VTEwgY2hlY2sgaGVyZSBsaWtl
IHdlIGhhdmUgZm9yIHRoZSBzZWNvbmQgcGFyYW1ldGVyIGluDQp4ZV9wY29kZV9yZWFkLiBTbyB3
ZSBuZWVkIHNvbWUgaW5pdGlhbCB2YWx1ZSBoZXJlIHNvIHdlIGRvbid0IHdyaXRlDQpnYXJiYWdl
Lg0KDQo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKg
eGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPiBAQCAtMjkxLDcgKzI5MCw3IEBAIHN0YXRpYyB2b2lk
IHhlX2RldmljZV9zeXNmc19maW5pKHZvaWQgKmFyZykNCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh4
ZS0+ZDNjb2xkLmNhcGFibGUpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lz
ZnNfcmVtb3ZlX2ZpbGUoJnhlLT5kcm0uZGV2LT5rb2JqLA0KPiAmZGV2X2F0dHJfdnJhbV9kM2Nv
bGRfdGhyZXNob2xkLmF0dHIpOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmluZm8u
cGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSkgew0KPiArwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmlu
Zm8ucGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSAmJiAheGUtDQo+ID5pbmZvLnNraXBfcGNvZGUp
IHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzeXNmc19yZW1vdmVfZmlsZXMo
JnhlLT5kcm0uZGV2LT5rb2JqLA0KPiBhdXRvX2xpbmtfZG93bmdyYWRlX2F0dHJzKTsNCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsYXRlX2JpbmRfcmVtb3ZlX2ZpbGVzKHhlLT5k
cm0uZGV2KTsNCj4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gQEAgLTMwOCw3ICszMDcsNyBAQCBpbnQg
eGVfZGV2aWNlX3N5c2ZzX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+IMKgwqDC
oMKgwqDCoMKgwqB9DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoGlmICh4ZS0+aW5mby5wbGF0Zm9y
bSA9PSBYRV9CQVRUTEVNQUdFKSB7DQo+ICvCoMKgwqDCoMKgwqDCoGlmICh4ZS0+aW5mby5wbGF0
Zm9ybSA9PSBYRV9CQVRUTEVNQUdFICYmICF4ZS0NCj4gPmluZm8uc2tpcF9wY29kZSkgew0KDQpU
aGlzIHBhcnQgbG9va3MgZ29vZC4gV2UgaGF2ZSBza2lwX3Bjb2RlIGluIHRoZSBwY29kZV9tYWls
Ym94X3J3DQpyb3V0aW5lLCBidXQgdGhlc2UgZmlsZXMgYXJlIGNoZWNraW5nIHZhbHVlcyBoZXJl
IHRoYXQgZG9uJ3QgbWFrZSBzZW5zZQ0KaWYgd2UgYXJlbid0IHJlYWRpbmcgdGhlbS4NCg0KVGhh
bmtzLA0KU3R1YXJ0DQoNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBz
eXNmc19jcmVhdGVfZmlsZXMoJmRldi0+a29iaiwNCj4gYXV0b19saW5rX2Rvd25ncmFkZV9hdHRy
cyk7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCg0K
