Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F62CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 18:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FC110EC1E;
	Fri,  5 Sep 2025 18:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXjcDzef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520A810EC1E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 18:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757096550; x=1788632550;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=pLsR0kwOw1yVLX2LASTImYmotP/OhQDZoQzz2dS/suQ=;
 b=kXjcDzef8MgLgesPSGPwpk3yiqrdxgzJN2ie2NqLmRoYDIY45xt98Um6
 i3LmJ49QdBuDR4pdvRzeACnGKhRD37C+qmNVfaB79u+gSMe1Ug8Uh+54J
 0VYrlvosADwor3IgdKiYvIJR7yfUFsTs0Jh8JHFhjH1jLupdSSfus5OIz
 IYWB75OTxFvm6nJtrJ3jXTrVIkJI1cIEZeAj25srAs25+UaMdca7Uu6tz
 HtVOSizkToTCSKhPhXjEh/RGT2FwPZG5/omQsLMVo8jvc7el+gRA2erU3
 N6m8mvUezDuHEtAe+EfEBGdzsLjTp7nk0HWC2dp8GN0+8fD9xL7mDvooc g==;
X-CSE-ConnectionGUID: zgCrf7vnRZe2KdX9xeV2XQ==
X-CSE-MsgGUID: QH+S4asZTeCKCxt5cCGSEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70882210"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="70882210"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:22:29 -0700
X-CSE-ConnectionGUID: tnaydXUFRdSRfhd06D7fgQ==
X-CSE-MsgGUID: 2flrhqmtSRSwLdQZ6LOtvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="176564632"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:22:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 11:22:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 11:22:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 11:22:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6Oqc1PKyuYZQjzNM97ymGWNTCBFw5u+rvvXeZBe7DcP92Qez2xMErEPdeB6+/9pKYZjThNPjSBrI95CZHglyO6LQZU5ksjc/UyPY482HdidyYYlwdibdveeF3htRi9SpSn9PeJgVyijlzlwf2bGkMbovWA0dFZLGJ7MymYBELl0tEE+DBWEDcfHHK+P89p72tVZiv8q/rwYV6YTj33+1Q75yEaA3ZM7LoKSi0a/qXNhRTuxbjOe4eSQXl32TEsDSfMd+n2MzBJ4bAITjrTBcLEQd7tJrlK5tFj4dCFUQW77nOOfNlGPOhABjP45SN3/Yza/2OxzoqC0awpvklK3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMOhmO/LuFFTPJpFmANpbGRZEbLCnzd1FNT6tn5LjCY=;
 b=QbCQKfBJ2PRprbpS5XDsTVhg1E+vs5vBzdoLMzYEXHZmfWulmlsSTG+iOlx47yYdFCPtZlRAHRs2olaqvWQa5JDf4ScpCK961KTTEKsfra09LvkhTsFxbQWmAEoagasZZWDIMYTHZwLEH9XFsSoo1t1ZtQuxDOdhNi1efItsIlFhSX972qMJiqlv4CvNQWDubKCM2ED5N7K5pPIJ4JqgZ2vKwPuOUgeZ7t+kvoU2GTKP9j6la73+6XFFQh2jVZNqwgUv9/+GYEdo6EPJrsHToHRfPOoBeHMFW6QVRCBn59wPtGcw6zjuNFpIDJD/1MskYd29b+37xd9+HH9lSd2siw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA0PR11MB4589.namprd11.prod.outlook.com (2603:10b6:806:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 18:22:26 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 18:22:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250905173625.8398-1-michal.wajdeczko@intel.com>
References: <20250905173625.8398-1-michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Don't expose dgfx residencies attributes
 on VF
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Soham Purkait
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 5 Sep 2025 15:22:22 -0300
Message-ID: <175709654211.5916.895894170330275840@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA0PR11MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a533e4c-e76f-40d1-3fd8-08ddeca92a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjZEYVpLNmVZNGlVZHRVTkN0bFRDQVRIZkQzZW9xRHRCbFNXYXNiUXB2dTJj?=
 =?utf-8?B?SHJnbmp3NHpjWWFVS1F4azM5alZ6SXQzbk5jSHFoQTZDOUM0Z2hKaVFFVWM1?=
 =?utf-8?B?dDQ4TjFlRytCRUdhampqMUhNQmZ6UW5ieWk2VVVIUVBRU3krbWVydmgrSzJl?=
 =?utf-8?B?V3FBc2ptV25CaWZvVGN4VU8rb2M2cVdKS1d6RS9BMUNHSG8wbmxmSk1LMVlv?=
 =?utf-8?B?UUJkb2xQK2hSMUpGeVE1SjBWVkdOeGkxZkpMNzh5WHZQMzY5SUFNYTRJejB3?=
 =?utf-8?B?NVdJUUY4SXI5aWtRSnZXSk5DZEFxTlZyL3A2YWt1b3o5TXhlMDZwdnNYSTJa?=
 =?utf-8?B?SEJSdUhHWENUeTlkNU9pWXk3RCs0WTFpaXR0NUhMK3dPOTRhREpxOXpRYVdp?=
 =?utf-8?B?dERVWFRBTlNjNllSaHh0UGlvTkl5T1hKQ0RpTTZucW9BOTBKYTRkSU5CNU5Y?=
 =?utf-8?B?Q3c4UUxCVnM3K3NkVGdjaU5YLzRLQy9yK2h0VWJyOXVySVMrVXdMeEVqcDJJ?=
 =?utf-8?B?dGFJUzFERkNYMTgzTml3QWl2amcvSjY1bVFiblRoaUQzRkhpZ2JDUnlzakYz?=
 =?utf-8?B?czIxeG1LSGE3WWgydlFob21YK3JpV3pFOXVOYW1ySHlHaTZSSm01Nk1lTlFy?=
 =?utf-8?B?aktQUExvSjZlK1dJbGd2OCt1N3o0NktuWUUrZW9QQmNQNENTQ3dNS1laTjk3?=
 =?utf-8?B?UFgxamhKZXZRZ1UrS2NCZE15ZlVGTXh0dS9IRmlqZi9HUnpYK1A5cUVJNDd1?=
 =?utf-8?B?L2Z4N3EvU3pHcWkwcXhpQTdjWVZGYTI2M0tBUlA4WFBlUS93cmM1TDliR0N1?=
 =?utf-8?B?TDk1YTBGWlcrMUk1Z2ZSTDdkVHFmWVVTNnp4cWkxeDNyYkI2QVlDTTNwSUZS?=
 =?utf-8?B?WXRuby9xRTN0cFpVZHlWeDNtVU5BQVJvaGh0OGM0NE0zYkpxNVhXZFRITnVB?=
 =?utf-8?B?ajhFUDJzd2owYm1HZDJ2c2lnREcvd05jWDMzalNPVjdTNUlpZmNaZVZFUWk3?=
 =?utf-8?B?T01ORGdYQW9SUVlYekRzdlAwWlBxVW1xNGpsNmVzWlQ3Nnh1WFZTdXdjY3NI?=
 =?utf-8?B?SVlaWGxQVDhwMjlmaGwvajIrbnZUckJRaitQRXpwN0hwamZPUXBRZkNlcy96?=
 =?utf-8?B?a0ZYTDVFNm9rMlpxRnFEaFhqak1neHprOWEzd0cvZ0F4ZmU3NTZYbjhqZFFY?=
 =?utf-8?B?ME1WSHllbnhPS3p3NFhzY1BDdXp3dHllMU1JVFRhM2tReWFHZzVITHlPSVNk?=
 =?utf-8?B?NWUvQU56MTByU0VxV0E5cGNwdmZFbEEzWDQzT3U5YWRWa2l3eE9IN2hweENT?=
 =?utf-8?B?YW91T2UwR1p2cnN3ZlZLa2U4OXhtQ3k2U25Ka0E4UG1jZ0pqalIwUEpHaWt5?=
 =?utf-8?B?VFZibUJjTFkreVdSckRranJnNDJmd0VQYXBTOHY4V3FMaC9pOHFYcGU2M2Ny?=
 =?utf-8?B?eXdCcGZQWkYvdkhXajlLcVZJd3d2WU13MVRoSU51UGxWY3B2bW1qZHhRdEpJ?=
 =?utf-8?B?S25uaXpva09WK1V0dCtDT01ENWdxSEhVcEFTWm5ieWEweXVLWmgySWZJREtK?=
 =?utf-8?B?RDNNVmcwY25KSUdnMmZmV1VVSllIdWg0VzFtdjZZaVRkc2tzc3RYbUFLTGQ3?=
 =?utf-8?B?T0RaVmlFY1dwTkFGWUR1TG1PLysyb09aSis3bytxb1NLOTdQVXMyUGVBenp5?=
 =?utf-8?B?YWtEOTJhWGFqRk5HK0p4TjRtOHN1NFUvMVZpYTdaTFVDRHpxMnQwS05ZT1Iw?=
 =?utf-8?B?THc3NllQVnFPUDZnOU1zM2RaOWNPdFdGNmloSFNic1I2b01Cd2E5V3p3aVRm?=
 =?utf-8?B?VE9uTGcrTXBENTlhL2VRdUM5SkY3WUg4c0x4aFdlclRWT2lJdi8rOFZVd1Ev?=
 =?utf-8?B?cnpsbVpyQWNBVEZVSWZucXBtV3hYWU5KdmlPY3pUUVBCOGlNTlVITXl3bzNo?=
 =?utf-8?Q?qvbkQusKY2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExrdVJvU09ibjVHQ1NsellJRWEwWk1EUVh1S25RVm5naWFKV24zbW5XNmFL?=
 =?utf-8?B?OTRCaFJ5dExIb0VwbGNZTEFwcm1IanJXVmtDNmlaME43cFJFbjQyY2tleGJO?=
 =?utf-8?B?OUhCaXdleG93aFk3VkM2bHZRYlFPRzZxYzE1dUpteUREbUt0QTVyUlNrQnNQ?=
 =?utf-8?B?ZFM0Ui9reWVKRFpCamc0bXJodmRMSlA4RitYZHU2Y2MzQVhlMkpIZStoL0Vm?=
 =?utf-8?B?eGlxb3d4R1I2blBJUllacnFEOFFtTGNpeHZ5bXEzVko3NXRORlJjdmJvQlhw?=
 =?utf-8?B?RUFQQWd4UW1jSmdFSVR6c0kwaEVBWXlYNmQveS8xMVNYS0s4UGpXYWhkVE1a?=
 =?utf-8?B?ZW5pOG5lN0xYc2xBSU5rZlVLK05xSjR1MnExTFhFaVF0Zi9YdkxjOHJkL2Fx?=
 =?utf-8?B?WnMzOGJibGtLbk4xUUxqdnBIbUlrY2o0Z1BlekphTkRKNXBTSU84UUc4cTFy?=
 =?utf-8?B?dXZBWmJjaE4vaDBjcXNUSDNreVZZWUsvcDd5K1Flb0VDVEtqVVRMVFBYZTRM?=
 =?utf-8?B?aFd2K29WTU0rMzJPdHBiL1Azd2xKYjVQVGdFR2dYWnlUVk9LT296TlJWWkhw?=
 =?utf-8?B?dmY5QURFd1NCU1c0bzc3U2RyR2dneWRYTG5IcjY3T29aUGFxc3d4T3VuWThV?=
 =?utf-8?B?eEhlZlVFdi80bTNQSStmYjVlaU5PZU1OOEUrckFxbXp6bTJiRWtmRWYxOG5L?=
 =?utf-8?B?S2IwYUZENXN0RmpRVWNYaytISlZwYlhnd2h6ZkgrSlJ0dExSS2ZCVjBEUGhR?=
 =?utf-8?B?RXpLSm9IN0NPRm1LeU9jem5LRm1JVkhkeS9KcEwvRGhRQUVNTXJCYWRnV1p0?=
 =?utf-8?B?OXI5dkN4VytWeUh3Y09VVkF5b1FtR1g3TzBLVHpCNnhyR1NhYXFnUUU4bjZ6?=
 =?utf-8?B?bkh0UGpkRkVPaHFhUUlMakxLWU56MEpVN05RekJsRHdSV2Fpc1VFV242Lzl3?=
 =?utf-8?B?OTJjdHJ0OW5JSFRxNzh2ekl1QlVveDlISmd3K25FZzlBY0pLbjZwL2VIQmo4?=
 =?utf-8?B?QzNLelNLZDY0bmxDcCtZUHNBU2ludmhXaHNsbzFLbWJQVlFpUXh0K3AvWE1G?=
 =?utf-8?B?bUNjcGtMQUsvaGNia1Fud2NMWGtDSXNJSFNpMkhhbFdhRnh4YmE4TDZYY0Zo?=
 =?utf-8?B?SjNLVmlpbXlQbENZS1RBVnc1clhrN2krbzl4T2ZxUk9HQmYwdGN4RWRJUjJJ?=
 =?utf-8?B?dlV4NzAyeUREeDkwT3hvSnkyV3BOWE9xZDhMVlgrcGhXaklCUnY4dG80bEM1?=
 =?utf-8?B?ZlBVREhhZGdWa253UmdUQ05RcHFyUlNNWHZUTlhRZmtGUmhIL2c1MUxxYTBF?=
 =?utf-8?B?K2VCa3F2a0NxT0o5cVErNFVyakoya0tHQmFKbnFoNTBqWlpzazU0MG50STdZ?=
 =?utf-8?B?NVNxUjA0QURUYkFnb3pTNUZrYzQ2aFFIaGU5WDllNWozN3FlRk9iVlZmYm1U?=
 =?utf-8?B?b003TXM1d1pYOHpMbW1ObmY1WitZU292WnoxY2dKTDM4SEUwUkZaNzJKSk1H?=
 =?utf-8?B?b2FnZ0NJc0NHQ0xCQm9odnlqazFveVpVcWJtRlBmays3UC8rSyt4bklRSTg2?=
 =?utf-8?B?M0JNeUlQNXJySnNvU3dhaUdGYzljMjczM3Jhc0J5SDlDMDJJdXZjM0dGRU9C?=
 =?utf-8?B?Z1p4SGZsYWdaVjZiVTE3a0I3WWlhNm4zaURvcVl5QkJFWU1ENEJEamIwRkcz?=
 =?utf-8?B?eU5neXlVakdkNDhkNDBzQndxNkc4c0dKRDFiaWFJWEFUcWNDWVd1N1RzdEta?=
 =?utf-8?B?MXJlODZ1MVk1SWxIOVRKbXpKeHlGK0IrK0xCTlV3L2dFUXU5NzJyM2VGZkN6?=
 =?utf-8?B?QXRuelVwUEw4d3VGZElDc1ZKRTFrSk5lOTFKRkdKVVA1eGVzTXBzaUFWN1lx?=
 =?utf-8?B?endITFdPNVBEU3lEMm13L05ReE0rWTc2ai9yay9pT2ZpeWQ1UVBwVElkTEti?=
 =?utf-8?B?SXpnOUd5QzFuUUJwNE80blpqT2V0QlJWQkFuRy92Q3VTdDdPcEdmcnpDWC8z?=
 =?utf-8?B?dGhiQnQyTlNLNEtJN2YzbnlseXJqYjJONVMxbm1Nc3dhZDBkdlUzQ0RHV2NE?=
 =?utf-8?B?U0VzU1dVZmYzOVd6LzBuMWZ6cHZVTGNVditRUWhwZXdadkRIQUwxb0Jlbm8v?=
 =?utf-8?B?cEpwaVFUWk5KVUZOanZGNjZXNlMydnUxTHZ6NzkzeXgzUTF4a2xzSkdXVTU3?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a533e4c-e76f-40d1-3fd8-08ddeca92a5b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 18:22:26.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAEcxPkzBd11pfcZS3+1YHHoYu9yavUk/D1uXgV2xZIAUqr8uC0bJ7Kg28/5jcEgMZBY2oL07zJNZko4+1dfdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4589
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

Quoting Michal Wajdeczko (2025-09-05 14:36:25-03:00)
>In addition of checking if we are running on the BATTLEMAGE,
>we should also check for not being a VF driver, as VFs can't
>access necessary registers, and doing so leads to:
>
> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x=
0
> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
> | Call Trace:
> |  xe_mmio_read32+0x110/0x280 [xe]
> |  read_residency_counter+0x42/0xd0 [xe]
> |  dgfx_pkg_residencies_show+0x115/0x190 [xe]
> | .. [drm] Package G2 counter failed to read, ret -19
>
>or
>
> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x=
0
> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
> | Call Trace:
> |  xe_mmio_read32+0x110/0x280 [xe]
> |  read_residency_counter+0x42/0xd0 [xe]
> |  dgfx_pcie_link_residencies_show+0xe7/0x160 [xe]
> | .. [drm] PCIE LINK L0 RESIDENCY counter failed to read, ret -19
>
>Similarly, there is no point to expose inject_csc_hw_error on VFs,
>as HW errors support is already disabled for VFs.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Soham Purkait <soham.purkait@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Riana Tauro <riana.tauro@intel.com>

I posted a very similar patch[1] ~1 month ago.

There was a spec-related question from Rodrigo, for which I could not
find the answer.

[1] https://lore.kernel.org/all/20250729-skip-residency-debugfs-for-vfs-v1-=
1-3c5edec08c8b@intel.com/

--
Gustavo Sousa

>---
> drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debug=
fs.c
>index 4b71570529a6..8be8304cb05c 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -346,7 +346,7 @@ void xe_debugfs_register(struct xe_device *xe)
>                                  ARRAY_SIZE(debugfs_list),
>                                  root, minor);
>=20
>-        if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
>+        if (xe->info.platform =3D=3D XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
>                 drm_debugfs_create_files(debugfs_residencies,
>                                          ARRAY_SIZE(debugfs_residencies),
>                                          root, minor);
>--=20
>2.47.1
>
