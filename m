Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D21CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 21:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897FE10E0DE;
	Thu, 16 Oct 2025 21:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1Ap8UgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24B10E0DE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760651729; x=1792187729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ky/jduHqJnTwz7wwdyhjhzkqy1KdOHRHPb7Ffku3mLE=;
 b=B1Ap8UgU/Q+2Fca5jhH++BZzAjsBg6+UUhg8AIvjGt/oF+MMpGxZ68cX
 v6+ILmmhmonLXfHVKYyf+rtBg7s/Nr1zjtQc5Sod1nV3fkj7zAo3f+Ap/
 k5nIVEFsDmMCZzTeYq8luKSV1GpU2Hg/GN3fegj9P83i0Ad1kzvy6OzBN
 /qV1Nzv3SrxUn2Wy5tIIqngVYA1pAA5/jeoWvRyyGX/b7ixqW5YY+2wbC
 k8hnmlpbCNcfg3oF9n/iJCdi609LAcq2QtNq0YWNm7EoIV484ZK/u5J+z
 1TsYQue7jltRitDpXfB6q+NSBC9cY7/SiMJ740qjX/xgYm6sjYQ+7Bjlo Q==;
X-CSE-ConnectionGUID: BfM1pLi6R6aIwzbAewGn4g==
X-CSE-MsgGUID: o//vPsHqQMOHCKjk5/IJ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66692412"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66692412"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:55:29 -0700
X-CSE-ConnectionGUID: pxAXUxfoTzSqDdBg18sJ4Q==
X-CSE-MsgGUID: 5NWlnyDpTMGEZjwE6q/4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187848060"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:55:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:55:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 14:55:27 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.29)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:55:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+wFDtexal31zf97+qGUJibrDeBUZyDoGivMfokegCAzAIVfVqwP5XrtPbipyVHWS8mPiq19+BjRP+GaUzQduZfVaN5DAo2AZPU4uRpHdTqJRWrP6wkWST8l1dGH2Vt2uf8P0gMY1FoklJvTshtCJM37/7Aks0PDdqWlYKauMxwmBCNuUjNKdUTgnXf3sYTge0XAurbgiriNC3zlxAcycoR0Yhky1AbJ3VUm1Ps/65uSLacKwDeoxsuFeN7bHQkQQZqe6Pbk0IvesBSetXVpm0R+7XfTyxLe9jSv0V4kfe6pOMJ9/CEmHty+eVyWgyZAbiG7WDBhqrRNr4sVI9BwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYPAa6fXVn1qjSMsfqrLVyoBNu5y2D9hUCHwkH/rntI=;
 b=so/UF78+tQWhrBToqg8x17ISxvodfv+cRCNJZLvKIKjFaKKh7+klKFNP1ovcyoZqnmPDjbgYq1ePrmfMPUnTnaUhaAS5BOQfxJsfMNRQyKJJL4nXVnFj6YiIFJ1d6l3D8g144467/wURtBHwwq/KbJdMQ5tz6sOMv0lMsKPej47BNEDc460BBz4RSkUln39YKgq6lyamYJYsJGwmsXUHQb5eMY35RrqnDgC2fjlnxp8oaSCxtT7qDifY7H9oUjC4WOxIGBxGUY9L71A7pHmPJ8XYIGKBZmbpzHieTyqu9g+DDZHcdyCQB9m0+RjDImd9mVHdufspqeJHslGTklU3CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB9488.namprd11.prod.outlook.com (2603:10b6:806:465::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 21:55:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 21:55:19 +0000
Message-ID: <ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com>
Date: Thu, 16 Oct 2025 23:55:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251016120511.856792-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac818a1-6a3f-422f-00f5-08de0cfeb2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVBobFNjWG1icmVQeG8xR0lyVFYyaWduZTFzSmxLeUZBaHFzaXRoUWRMSEJE?=
 =?utf-8?B?cjY4RGtDSTQ3dDZFOUhCcDBZanY3RnM5eWtROWNkTHUyVnRhYjJQYms0eXVY?=
 =?utf-8?B?MW90enAxTFFSTi8xdzVzbENpYzVWN28yNmhqWm1LWE5uN1dlRmpibkhyaGhL?=
 =?utf-8?B?WkFORDgvR2gyc2h1ZmxuVS9rSWZGQUZLc1BxRnYxVFNsaS9KS2x6dVA4clox?=
 =?utf-8?B?MVlEd05Bb3p0aktJR3hodlJRdlYyaTNibExTdnFFUHE0OHFEZGR1Y2FPNGov?=
 =?utf-8?B?R2hUVmRtRmY5NFZwMVpKTTJmK2lvb2ZmRXE0dUNJaEVleDI2Ni9BNDN0TThN?=
 =?utf-8?B?RTR3d21tYUxjZWsxdzdDbXdOcGdjNVBzS3pLK2NOaUNUR1c2Z294eU5ZZG1Q?=
 =?utf-8?B?MzdzZzhnNlI5bUdUSU5YL0E2VEtrTy9wWTNzZFhhU0U3U3ZLeGhGYUUwZ3F3?=
 =?utf-8?B?WGU5RVU5REFFUDYwUUZYaHFDb3FES2hBNTcxb2MzRTZmQ3hNL0tGZVlFTkMr?=
 =?utf-8?B?cndtRGJqdkU4NllZTk1JeVNvU21MWHZXNDlhU290L0ZGYnpoN0tid1hGV2VT?=
 =?utf-8?B?c0ZhenJYY0dUaXF2V1VwSE1SR0ZOaFdHaXRNQlU2MTBxMTNSekVZVE5mQU9s?=
 =?utf-8?B?R1J0ZlBJL0hrb2hTbjR4UkU5T05qOWYvWmdWS0Y1YjBGcHBwRHFOUUdwT0xK?=
 =?utf-8?B?OWhrSVBpek91V3FmYVEyZnJQeDl5MzM1VXFmdFhHS3lhSSsyQklBSGpGa2h5?=
 =?utf-8?B?YlNEcnAzUnQ5aDVPWGs0N2JTQit1UUlNSUE2bnRCa2NIb3N3Mkpxb25KelJX?=
 =?utf-8?B?azZNaGlkaStiK255ZkR6a0ZBRHE4akphR2dwLzRwMUNHSnRsN29PVklaai96?=
 =?utf-8?B?WHZ4Q0RsQmVZd3prVW4wWTcwT1BPanVVT0EvWnMramtuTkIzNVZMZEJTeUhS?=
 =?utf-8?B?RjJLRmU0N0crSTlNWDRsaHhjRzhrblRuZGFicDdWVWNxUGNtcnAxdWEwTjNy?=
 =?utf-8?B?YTBSZ3ViblBnbm5kYXJweTlyblc5OStXMjRyRXZYQ3lvWCtxRDRSZmtQQVV0?=
 =?utf-8?B?WUtiT3BjWFdYZWZlS0lJelVZckdsYzY2MkszMVFIQVYrdzR3R0JudW45cDgv?=
 =?utf-8?B?azdVRjFKMVIvSzRUYWcyU09yUWl2VGl4NFNESy92QzRPWU8zL0U2OTFGTHNC?=
 =?utf-8?B?M2xPZ1lVM3BlbUpGRUxTdlNHeFpVWVg4RWUwNDdNVE12c2lHelBqZGdZL1ZB?=
 =?utf-8?B?elBFRU1udzdMcHRPZDJUOGtuRCtaaVpWK1c3QUhUYXE1WmF0Q1dZK04zeDNU?=
 =?utf-8?B?MmpmYTI4dk5xNGhJRkFuYVNjK0pDaGpIRTI5T0hZeElCM1Rvd3JOVWJ0SlBI?=
 =?utf-8?B?bmkrRE0weERJaWhOcjBhSCsyL2NxSG1rSGZONldoOVl6T0xML1BGMHAzREtK?=
 =?utf-8?B?ZHNvQ2xwZ3I2azlvZy95aGxCQVk1RWsvSkpKSExlR3IwQnhWY3FtWXljVi9a?=
 =?utf-8?B?UURWRGlyL3dvLzFPWVQwbjFxdHlWNU1nYnJmN0RKTHpqSTgwUjIyVHcvaFlM?=
 =?utf-8?B?ZFFXbWxsUmVzSzdkeVNqNmxIdHlHWHhXSHoyd0hnL0c3OEVQc1ZLRnVhUnFh?=
 =?utf-8?B?ZWJvNWhMS1dBK0t5NGFCOHoxNkJLRnhOQU84eHRuY1haTW00ajBqWXpYTUlB?=
 =?utf-8?B?VUFvUklYYTA4ZWZCa0dPT2Q3VU1CNEV0RjU0REtWUXJYbHRCWk0valhoVXNh?=
 =?utf-8?B?NjZTdC9qQ1NGbTJhQXVXMkZiUmY4K21PUEtBVURCdDZkMk0zY0Erb2JzaG9m?=
 =?utf-8?B?L0U2SHJ2Y2pPcWZaVk9kWk5nT0YrZmpFaDY3QXBJS0RqNm5hRUJjcGlCS2Vk?=
 =?utf-8?B?WlJpSmQ3ekxlUnRucGVSQVlvSzdQWEhSdmFiQjhQVHhueEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdiRloyWkVscmw4STl3NldWdlJWUDNBWVJKdXd2NnBLa0JLVUh3amd2MVNO?=
 =?utf-8?B?akNnOVZ2TXhwZVBXYzF1ZmJjanRrZ3NJRTc5dlVZUHlBbzNqOU9jNE9PVnJo?=
 =?utf-8?B?SmRwN0ViZndTSlIwb2M3ckpVRjZ4RlVEZFJMOUMvRDZNQi9iclBMdERqQzdM?=
 =?utf-8?B?a2hsem5aeVM5SWZhbW9pNnJlT2wrK0UvYjFaTU5ZUVBOWlJvdS9JVC9WaDRL?=
 =?utf-8?B?akcwQXF0akJUNnJ3Z25ZcnBIOTN6VHFhbjAvQklua3RxUFR0T0N2NWczeXYw?=
 =?utf-8?B?ZDYrcWdEbmtzVDBmUThRV3FFSFQ5SVl5VEkrb0hYWm5zUzRxcEg0TUg3a3ND?=
 =?utf-8?B?S1ZXdTAzWjErZ25BQlZQaHo1b002dC8yTGsrbmpCcjNZVlRtMER6WUQxUWJR?=
 =?utf-8?B?elZ1ZWt6MFpFeUY4Tjl4enhONEdyYkNvNUErUWVuNVZxL1RZdTBYdGNrQTQ1?=
 =?utf-8?B?OXRlYjB2enZzWFUyZE1tS0sxVmZOZFQzSVdQL21NNDk3Y2Z5elJqS1Y0R0h0?=
 =?utf-8?B?WDEyZlFrYUdwZjhCcWFuRERXNEVNRFVOdE02c1A5UlZOR0Fna1Y4RlIwOWZ4?=
 =?utf-8?B?R2NQeUk0TXRMR0FTRy9XdlZxbUJTVjBsWEQ3cFdzNHJmWmd3ZUVSRnBTZFk2?=
 =?utf-8?B?VkZkS1cvOUN5TTcxVTBwYk1KVHNBYTgwR0NrY3JYRlEyMG02UE0zV2FGWmsv?=
 =?utf-8?B?ajFDL2dSOGlxMUJVY0NTS0ZpRGdEY3BGUlZLNDJ0OWhzbWJYZE5mQ2RNQ1ZG?=
 =?utf-8?B?Tm5KL3E3ZVRJdEl6UDJuTGpDTGx4dXc0NlB6UUc1d1pqeUJJTkg1dndIa3lw?=
 =?utf-8?B?ZTVvV2pwalVHWE1qTUFUREEzTzlWUEZkNW8xNDRkS0RJcFVDZnNvVHVMc25L?=
 =?utf-8?B?eVBCUXp0bnRkMElQUWZTK2pFUWU3cEZkWWROaDI0QTF2S0RYUG15QlZNaVRD?=
 =?utf-8?B?Q0FFYlpKb29PQXZkenFZNkRRQjZOdXJKVFYvT28xQXZHc2N3bkdKOUdPVWts?=
 =?utf-8?B?dFJOeU9HMWdyY2ZaZTJYQjQ0V0lEelFsbERFQmsxSVJFeU9kWmtKVGVNakor?=
 =?utf-8?B?SW9KZmZQSnY0aVZMSURVQ0g2dkQreUNiMkhOeU9YZ0hvK2UxVkQwUW9IWlNp?=
 =?utf-8?B?VDNPd0JoRXNQOVcxYkVhaG5xL2JmNjhBVHJKOGRtSUZ5b0RTeDFOTFhsbzM5?=
 =?utf-8?B?MkhZR0RSMHpTcjcwd25QNVlpYmlRQitDQnBPTGppL0piN0FEc0dMR3F5RkVV?=
 =?utf-8?B?ZEVSeVhIc1BWakJJeG8yUjVHY2FXOVRIMHMxeWhjNENOVXk0ZjY2cnJUWFZv?=
 =?utf-8?B?ZjZlMnhlUkJLNjh2bG82aXBHd1pmc2lVOTh1VmM0SXZIeEFLQXJYZTBXbFJm?=
 =?utf-8?B?UDRYd2c3UTVsUDhpdHpMZW0veTdWenFmUW1XbHBjenMwTkdhRmZCUmNJeXZp?=
 =?utf-8?B?K1hjTFlJdjFycUwxZ0x0WlhvNFIzZ1NVZUU2OXJIMFdTdUh0dHBtUHZ5bDJ0?=
 =?utf-8?B?dSt5QTh2elpwWWJLNTNoeW5Kdm9qSmZVNThzV3ZHcmFMdXdkdUExN2VUUzNq?=
 =?utf-8?B?Vm9hRUlScC9XdG5JelRFcVphdFNNc2czU1l4Q2VvYk1iSDF3K1h1Q1FTOWlO?=
 =?utf-8?B?WW1rVlFreWw5dU1vT0xPaWVUdGMxdWxSQkpmZEdsL25TbU1ZRk1iMWUyTDBm?=
 =?utf-8?B?TkMwVld4VStZVEN1a2dTZzVUb3grNndoa1doenozWmV6T0Y3aHhqbUh5Q2F4?=
 =?utf-8?B?bVdiL21zaU1nVFNOb3gzVWxIU0VsWUdPNDJ2U2NjLzRUUW1waFdZbXc1TUlZ?=
 =?utf-8?B?MFowN3ZNSDFod0RYNXQvR0VaYVhHWXN4dTBjaDJKcHptc2pGNS85amg4TFZq?=
 =?utf-8?B?TDBZemhTQmoxVEdoMnhIbHBpTm56UFUyMjBxSENFVDNUa2dqZ3dvSHdZT1Rn?=
 =?utf-8?B?YTJsK0pmcDhjM3phQ3U0c2FzSFlvemo1SXlTSnhwNHpPZ0VNZnVST2dKSjNo?=
 =?utf-8?B?bkRud1Z2VEd1UTZqeCtFS1BDYjhWNE9HTFlJQkg1MllYVmZXeFhzQ2M0a3po?=
 =?utf-8?B?T0tGaGlnVjRubFA4L242d0ZGS0ROMWFjejVtQnM1dGJKR2x2eW8yZWx5UnZs?=
 =?utf-8?B?TVQrRE8xR2YrTmNWVHAwby9wMmk0eFlxeTVQME04OS9pd1g2NmdZOWlBUnd5?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac818a1-6a3f-422f-00f5-08de0cfeb2b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 21:55:19.4688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Q2mGHFRHI/2F/Cha9mzHCqWTbeKOslHE/lZ/fmPhfzM17q1AJKF9a8g0Xxo4SRFdqaRFkRyYupK9kp7yAzf1t1IMckBPkRu+w6aRbQd/B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9488
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



On 10/16/2025 2:05 PM, Tomasz Lis wrote:
> The check was done before GuC ABI version could be acquired.
> Comparing only to zeros provides very stable results, though
> not the ones expected.

instead of above sentence, better say that this was triggering:

<4> [174.830604] xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
...


> 
> This change dislodged part of the VF migration support check
> and moved it to after GuC handshake.

and describe your changes in imperative mood

[1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> v2: Use xe_sriov_vf_ccs_migration_bb_needed()

you can keep change log under ---

> 
> Tested-by: Matthew Brost <matthew.brost@intel.com>

I guess above was true for # rev1

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
> Fixes: be5590c384f3 ("drm/xe/vf: Enable CCS save/restore only on supported GUC versions")
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 41 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_guc.c         |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 10 -------
>  4 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba3..34c68de6e2f3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -314,6 +314,47 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> +static void vf_disable_migration(struct xe_gt *gt, const char *fmt, ...)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct va_format vaf;
> +	va_list va_args;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +
> +	va_start(va_args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va  = &va_args;
> +	xe_gt_sriov_notice(gt, "migration disabled: %pV\n", &vaf);
> +	va_end(va_args);
> +
> +	xe->sriov.vf.migration.enabled = false;

this looks like a layer violation

and we already have a function that wraps that at the device level

maybe just promote device-level vf_disable_migration(xe,...) from xe_sriov_vf.c
and call it from this gt-level place ?

hmm, but see below [2]

> +}
> +
> +/**
> + * xe_gt_sriov_vf_guc_check_migration_support - Check for disable migration due to GuC.
> + * @gt: the &xe_gt struct instance linked to target GuC
> + *
> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
> + */
> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe_sriov_vf_migration_supported(xe))
> +		return;
> +
> +	if (xe_sriov_vf_ccs_migration_bb_needed(xe)) {
> +		struct xe_uc_fw_version guc_version;
> +
> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> +			return vf_disable_migration(gt,
> +				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +				guc_version.major, guc_version.minor);

since we split migration checks from one place,
this CCS GuC ABI condition shall be placed in sriov_vf_ccs.c subcomponent

> +	}
> +}
> +
>  /**
>   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>   * @gt: the &xe_gt struct instance linked to target GuC
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..60a3b9b05b20 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -26,6 +26,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>  int xe_gt_sriov_vf_init(struct xe_gt *gt);
>  bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d94490979adc..3c4e64233b3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -713,6 +713,8 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> +	xe_gt_sriov_vf_guc_check_migration_support(gt);
> +

[2] so this is now going through these layers:

guc_vf    vf_guc_init_noalloc
gt_vf       xe_gt_sriov_vf_guc_check_migration_support
xe_vf         xe_sriov_vf_migration_supported
xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
gt_vf         xe_gt_sriov_vf_guc_versions
gt_vf         vf_disable_migration
xe_vf           xe->sriov.vf.migration.enabled

so maybe better leave this VF GuC init as-is and just make "late" checks
in xe_device_probe either in xe_sriov_init_late

xe        xe_sriov_init_late
xe_vf       xe_sriov_vf_init_late
xe_vf         xe_sriov_vf_migration_supported
xe_vf_ccs     xe_sriov_vf_ccs_init_late
xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
gt_vf           xe_gt_sriov_vf_guc_versions
xe_vf         vf_disable_migration

or after for_each_gt/xe_gt_init_early loop

xe        xe_device_probe
xe_vf       xe_sriov_vf_check_migration
xe_vf         xe_sriov_vf_migration_supported
xe_vf_ccs     xe_sriov_vf_ccs_init_late
xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
gt_vf           xe_gt_sriov_vf_guc_versions
xe_vf         vf_disable_migration

or just make it as part of the xe_sriov_vf_ccs_init()
since before that point CCS migration is not working either

>  	err = xe_gt_sriov_vf_query_config(gt);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 911d5720917b..5fb042c05112 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -163,16 +163,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>  		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
>  					    GRAPHICS_VER(xe));
>  
> -	if (!IS_DGFX(xe)) {
> -		struct xe_uc_fw_version guc_version;
> -
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> -			return vf_disable_migration(xe,
> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> -						    guc_version.major, guc_version.minor);
> -	}
> -
>  	xe->sriov.vf.migration.enabled = true;
>  	xe_sriov_dbg(xe, "migration support enabled\n");

this would be non-reliable, as we might still disable migration later on

so we should either remove it completely (assuming its "enabled" until explicitly disabled)
or reverse the logic and use this flag instead:

	xe->sriov.vf.migration.disabled

>  }

