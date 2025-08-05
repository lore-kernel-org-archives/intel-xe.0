Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99926C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 15:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A79010E6AB;
	Tue,  5 Aug 2025 15:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neA+vNqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C870110E6AB
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754406602; x=1785942602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HZAXPJPk3HQaILTXVIsj6gdaej3Jaa55O7dXH6DaExk=;
 b=neA+vNqeDvjtlzylEi6/t6xv8n3aML3HLmGWHR8EgaY9flWV/NjIClG3
 NkpZO3DRCVzORWBHoxcDAW/rYntRUDOWf5hXZNy8nm7brGFRbVYQQwq0K
 0BHlwKFZGpjsbA+EJImATjgW2sejrrLyyG803Q3iLTd9w4xkq3KoFwND2
 G1lW9AkcbqBk+tZqioMHyTQ8/iJDvjNNDkv8TUzBFsvevc7KqIFWwVTl1
 LIH+veTfddpuL7TpjuFtcSK2ojSWftC+zSRm12XdShgr1xO/VZCCmlOym
 jHUQ/KdDVePLf+/edpTIPHSD/wK7OXU7ZK9Hm5Pkryp353lvJPMfO/mkr Q==;
X-CSE-ConnectionGUID: B9NHSYEsQcaA+K/xq2QFHQ==
X-CSE-MsgGUID: 4o15rVzmQsSSWT1QWzRhIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60535769"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="60535769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 08:10:02 -0700
X-CSE-ConnectionGUID: S8THn9unRxKJzIS6jt37kw==
X-CSE-MsgGUID: ft5XdpBETB6qSLhd67dqtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164038958"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 08:10:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 08:10:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 08:10:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 5 Aug 2025 08:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMu7x0AXtkJZkWT6APrUDp+J6DJ1lLYBJcJTNuzRXEK5Lc5X+cce076Zf1rRFLjISY7PciY5hxpJMHqIzsNrdNxOcNdSKlSL3CG0ppHHznq75HvJTsuYN31+TLbKk1iEpHpWH6uK4UXEwghZouDyuEMr/KSmYSdY94ItDjUQQTbtvXzhmL47jSh+7yoRHwLi3ZaZgFKSwCC4yOhXX7IUOVOk0rUaBNbqXTemmsvZm3sqX2bfCHJ45vRmoeV3UVtmGlBhZ68oOZYuAEyqUD3FQeuw2nlOt/tM02RsRADPDROjTnxhoTvR8/4boiVBvgTzErwR07Qe3a4qy8OtmxCW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcK4IsAHlffZUaINmGw4nSZe2mNBOPOLTtjG4bzXFrI=;
 b=FyoMas73CojaFTkhlwqtHw6IAKQYEnJTmNUHIPReiD/k8HKsS4dqYB/brDpOwQST66ZKPSbq3G/R0tgiQ/EpcFeBcZ3MCBIeKDbPsVMUkPaTG2y15LuKDrfLpeYND/ylukQxVqWbOOdfKCQcDzwh1qQ0X1Zy5WEAheo3JRPG8JseZTw4kVsj2NrEnTbLJJYsxprFMme3JewrNSQ93AyEJ3vuSKh7uiQcjc8tNTnv74ZlEWBq5S820eyAz3inBsa+jUMsegtot5dqg+6fyTO8uYfQ/MjGOmyoqhWcR17g2ACiO3ZD8VazRDpPhZc8zrmqobr1mz4eGz1YkJ8rHHdoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PPF99D0888FA.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 15:09:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 15:09:55 +0000
Message-ID: <7eeeafde-329e-4bdd-bf90-f44cec920008@intel.com>
Date: Tue, 5 Aug 2025 17:09:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] drm/xe/configfs: Keep default device config
 settings together
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-9-michal.wajdeczko@intel.com>
 <pk56daxs2snzdqbnaaq3cqysy5rhpeioc5xd2h4cgxbdbrmh46@q6iqxhuifmgw>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <pk56daxs2snzdqbnaaq3cqysy5rhpeioc5xd2h4cgxbdbrmh46@q6iqxhuifmgw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0009.eurprd05.prod.outlook.com
 (2603:10a6:803:1::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PPF99D0888FA:EE_
X-MS-Office365-Filtering-Correlation-Id: c02394ca-9eb4-45e6-0f7b-08ddd43222c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkdOa3JUMFFaRGs5MVZTTGxLL25OQk1iQUZRcXE4aVFlRHVac04yVU1iQ3hV?=
 =?utf-8?B?c045a01RVkNyd1ZwMkJlRUptSlRLQTVORE43UzY4bS8xL202ejNpRnBHVkRk?=
 =?utf-8?B?SWRUYXh3Mkh3MmkxRUx0RVRBWUtNcW83T05sWThURXJaOXlHRnh6OHlyL1FT?=
 =?utf-8?B?MkNJZlU3MGtlVUdzd24vUGFUczUyalExTU9QdDd1L0RYWDNXaW1vRHU3N3lk?=
 =?utf-8?B?NFUzSWJaVVZucnp2NUo1VnZib1M0a25oclZKZzd3L3dac0hGSGwyOEN1a01T?=
 =?utf-8?B?aEpjVllXVlNVWkxBdzFrZktGN3Yva2dEbVZ5M3FGdXBiL2xqU0QrRm5ZTUI5?=
 =?utf-8?B?cHg0c3hERlV3bGp6Zjg3bXZUY2ZrS0xob2pLc2M5Z1d0d3VGdVVlUWdyNzVC?=
 =?utf-8?B?RldicmEwMmM1NW9VTUxFTm5iQlBGK2owMlo2ZUY3MDc2ak5KMG9abXhhNlVE?=
 =?utf-8?B?MThRNEprYjZQeE5NYURtRnZUR1V3aExhOFZ1M0pLWHl4LzBSZVZkRFh0dEht?=
 =?utf-8?B?UDl5ZDkrcFYyQjZjclZ2K2c5WTdNNUxWQ3pkeVlFQWFhN295NmQxNVYyZVhH?=
 =?utf-8?B?cnlndXNsL3d2OVFpd01Jd0sxYmZMVmI1ayt4S0pQMXFSMDAxVC94bzgvUmQ4?=
 =?utf-8?B?akNoYURQdTViVDlyWTJ2SlRqci9Pb0ZhZnhUL25FN1RXcEVvMms4RVlBbkwy?=
 =?utf-8?B?VHdlOXNlbzJWQVI3Wml6M2diNW1GTUcvOWFKeGx5MTlOeGNkOEZIUER1Z1cw?=
 =?utf-8?B?M1o2VHNrRGdweWppeWJkUXh6b08zTVMreEFHR2Q0L3FnVW81UnZYSTQ4YkVG?=
 =?utf-8?B?em85UlhsaDU5c2x3cnE4LzdIOUhsYzU0Tmpvcmd5MVZaV2FVdmRyOTlrWHBO?=
 =?utf-8?B?TGlzelM0SFJnZXljRkNOWGU0dE9BU2N2WWZtNHNWbCs0akg5RnY2UnhEWXVU?=
 =?utf-8?B?Ymk4TTdJWlBCaFdJaDRQQkE0WDl6NkJWSHBQUytBSFZDV3U1TGZ0aTVQeWlX?=
 =?utf-8?B?ZjFhVVUvekVFeE1VYktRUVVvLzBrSHE4ZXJDaXN1Nmo4eFY0eTd5VGdwRkVo?=
 =?utf-8?B?aDRLcEVReHN6cjB1anNSLzhVMjAyZzhyb29FR0VjaFZPMUxRS3pmeTFJRFp4?=
 =?utf-8?B?M3BqczUvODF3VUcwaDBmSC9JZUtaQ1ZuVE1oeXlVc2VsanFTNDBySHpuM0N5?=
 =?utf-8?B?eTJCVTJNcklWYlA2UlAyd1lSajI3NDUrd0R0RngxcEtlUEQzYlFvc2J6N0VR?=
 =?utf-8?B?ZWpyUWR4RFh1a0ovTENEQ3VacWVzZGNnQit2cko3U0FqMTc4TUh0TktwaWhY?=
 =?utf-8?B?ZlZNc2VWcWVGL2Vmd3FVbFdVL0RVYTVrRjJGK1NiL3l0b2lCMWZGR05uYjhu?=
 =?utf-8?B?OU8wU0dMelZicjFpWXhCdFRramFBbXZ1UXRxM1l1Z2hjZzNhVzE2ZXRIWWZJ?=
 =?utf-8?B?MnYxdHBMMjZxV0prZTN6clBrRlRHUk5hMm9vdDVpQjYyRy8yNjFsa1o2cjJ1?=
 =?utf-8?B?YXJlbVNOME1oNUtqZlEvZDJkVGYrbDAzS0FQYSs5NnJuT01DMXBpMFFXRXZG?=
 =?utf-8?B?bXJuSEZ3SXNpSTcrTVlEWjNIRHFPbG5HRlA1dmpvS0x0c0oyczRwMjR0YTVG?=
 =?utf-8?B?T3BCOEd3clpYOU5aZXFoZW4zcnlWbG1nY2J2Ri9paEpvWTZTSmpOUzZZSlpO?=
 =?utf-8?B?Q1pwYkE0V0FkdWJvZHR6dWlDZzB5R1pENy80TmwrSkFJV1NNUVAyQjVUWlZk?=
 =?utf-8?B?T2NReVpxTGloWm1HU2RXSUN0aUJwTjI4OGV5clgwODM3d0V3MzBqR0RJRUZq?=
 =?utf-8?Q?wyE/IPq4bNBIoDG95/LEnscs0wqxmXJvh243c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzNjWjhVYWs4SGczTWhIYTdXMnBOU3l1Y1ZlWUZPWkdDNzkvNDUwcCs5T0ZN?=
 =?utf-8?B?cGZCbmhSU2ZhaTVpeWl3ODRpTGxFeDVCbExocGQ5MTV2dXpjYmNRTHZnSW8w?=
 =?utf-8?B?QUp0MEVlMFZKaDFlVEhDY1RpNzl6Z2ppUXl1ZDM5eUI1MVQ1b3Jra1RPVXZW?=
 =?utf-8?B?M2krSm01dGN2UjM0b3FPQXRLY0E1OWljSHEvUGVWbzZLeUhybUZGYVdhelBN?=
 =?utf-8?B?cSsvTTRtWGRldUUrSEpuRDZiZUU1NWpJOU05eGEvR044SCtUOVZjMi9yZGFo?=
 =?utf-8?B?aTgzSjhaOEJJSlFiM2lPT3BiUkhHeXJPMFRoQk1XVjVLSmhtaVlVK09yb3NV?=
 =?utf-8?B?OXBaalppYkIxazRxZHIwMGxUcU9wbkNsL0YzWU54c0JOMTl6Q1ZERng3ZFZV?=
 =?utf-8?B?NytEVk1FS3dvaWNHcnMybWJsdjVjcytWcGNtMDRNRFFqZUY1Nk03UXFaVHE2?=
 =?utf-8?B?QUJwNzNXSUcraXl2Uyt0S2pJMXgyc08yL1F0dlFUdk9Nem1VVmt3U3RycTVQ?=
 =?utf-8?B?Y0dHVEhzcXVraENzdDZTdVA2aFV6cUZBaFBOZTNXZE9ZRlRmMmFWSDY3cHFE?=
 =?utf-8?B?WngxZUExLzY3UktRK3p4RkhLTWtDOTVhenF3eThSU0VWc1NEa0NpUHFzaUps?=
 =?utf-8?B?MUdMSWNFcGNJY2ZwdXlpcXluRE04OHBuMHZ4M203K0U5dFVtVis1UWREQ3BE?=
 =?utf-8?B?cUgvNDg0MmxTV21pM3ppN04yTXdxWGd2dGpLU0tJQmhIRGdENDN4VEZ1bUJV?=
 =?utf-8?B?WVN1WHhYaTZybkVhQW1ONlZ3OXJhNGlQcjdSaklBNERibnpLendnaThta0Qv?=
 =?utf-8?B?UllIVmpocXJYZzgwd0RreFQ3UFBna1dTaUpBVmhGbWRYMkxtUW9NZi9SNkV1?=
 =?utf-8?B?SldENCs4QWNPY042SHNHZGJoN1dLNExyTDE0T084VU9RbzR5NGVoWTdkOFpl?=
 =?utf-8?B?UzM0d0VMRFkxN0dpeDIvWW5pRzJ4MXl5UkFjbTd0NThNN21hdnZrdWNjU3M5?=
 =?utf-8?B?eXYwN05pYXNxZkJFV040eUlDaGFUc0RVVUQrV3FxRGZJb0RSUmFPMTZqbUhS?=
 =?utf-8?B?a3hoMU9ueHNDSW85R01XUmdIZGpoL3ZNd0pjbUJPVDhxejByOEt3TnI4a1ZV?=
 =?utf-8?B?Z3JHQ2sxTDIvYlIwTVZIT2ZOclhBNDhXUDVheElXdXROeVk2VHBqS3RZaGl5?=
 =?utf-8?B?R1RJNFZ1d2hBUHg3cW9XSWxVUDRaa0wvcEFZc2pkdVR2ZG8xVXlxS2tLemlC?=
 =?utf-8?B?clV1aC9LT3ZlUTJqSWpIOG5DNDZnQmRtOG5leVNNdDhsVkVOaElVbjRCRXBL?=
 =?utf-8?B?ZGlVcVF3Q1VsQkxQZTlTNW93cWJNaWNwRzQ5MXpvY0hreFhOWlVrVDhuQStZ?=
 =?utf-8?B?WjhFMWU2bzdrdVJrNmF0N1d3Z3BCNTFJR2IxODNhTmZNRHpUVDNDWWJPTXUv?=
 =?utf-8?B?Q0w1VXFLdUxEaVNPR0kzeFpDZ2FBWS9vSlZGWEZvaEVBQ1Y4L1RTWVFGLzhk?=
 =?utf-8?B?N3FXVjd4WWVkbnVZWjR6Y3FIWDZ3OXFzUkhXZmd3NDl0a3lMbm13TFJqM0dw?=
 =?utf-8?B?YUdSTHFjVFJZeDh6MUlDSWF5d0FHRG1neXg4Zjg2Tm9ZU2F4QWVTLzhDajE5?=
 =?utf-8?B?elk4Ty81Uk90M2hhdHhqdnBTTzIvWlVsN2d3YWw4d3k1aWxzdkdnMGFuczNE?=
 =?utf-8?B?VzV4ZU5zY21zL09nZkRVNFdiUHhLbWVybmRERVBYQi9EM25wYTV1QWRaa1Er?=
 =?utf-8?B?MXNjSm9hc2MvNjFkTkpwSEM5WHBLaU5SL2M5ZGcrYkk1aGVCbUM3M3ZhVTRr?=
 =?utf-8?B?VElUZVhudldOeUtpU3p6Y1JneExiVTBpSGdickJlZ0FIemQ2TWFHazhCdG5o?=
 =?utf-8?B?SjRuNHNOOEQvNkVHMVIxUkU3Q2I2OG84NkloTjBLc000K1N5OFJueWxEcUNS?=
 =?utf-8?B?M1d6eldHNlgzL2YwdDZROU1mR1FHRzBKZ2NqdFpjUEJNc3ZlZ25oYWVpZUlG?=
 =?utf-8?B?cE1TS0xFeHcrQkN0ZE03THlzYUdyR0pzSGVTUkprSlkxZUdlWFpkMDcrbFdJ?=
 =?utf-8?B?ZU1kaTAweWpDeGZEM1pqTG43amF4dzY1cW5UNFpBdVN0dEJzTGdiRWIrT3Q5?=
 =?utf-8?B?eFRIU3RTeGE1emZBNER6TFZwRGIxOS9iMzNSYjhkeTBwZnp2R21Na1RjZmRW?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c02394ca-9eb4-45e6-0f7b-08ddd43222c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 15:09:55.5888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMvUZmWEnFHeMaNzPq8lbUuhAz5MK+Dr2g2/cS6KB7h+4OgWcFPs+KWtfK1vSxkUTiwo9LskDespPkwS5Ol/C62J6oiGJO7xqfWcwKcpKvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF99D0888FA
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



On 8/5/2025 3:28 PM, Lucas De Marchi wrote:
> On Thu, Jul 31, 2025 at 09:33:36PM +0200, Michal Wajdeczko wrote:
>> For easier maintenance add a placeholder where we can keep all
>> default device configuration settings in one place.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++----
>> 1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 7ad9fc65e21d..150e7f2becc8 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -97,6 +97,16 @@ struct xe_config_group_device {
>>     struct mutex lock;
>> };
>>
>> +static struct xe_config_device device_defaults = {
> 
> any reason why this would not be const?
> 

while today we are extending our configfs support only
with completely new attributes (like survivability mode
or allowed engines) I was assuming that shortly we will
also move to configfs some of our existing modparams,
which are device specific, rather than module specific,
like:
 - GuC/HuC firmwares
 - max VFs
 - ...

so to keep the idea of 'device_defaults' as the only
place where default values are stored, I assumed, maybe
wrong, that we will need this to be non-const (either as
new location of some modparams or cached values of the
modparam attributes)

in [1] I was trying to make first step with max_vfs,
but patch was dropped for a while until this series will
be completed and we will have some better understanding
how to proceed

Michal

[1] https://patchwork.freedesktop.org/patch/664176/?series=151660&rev=1

