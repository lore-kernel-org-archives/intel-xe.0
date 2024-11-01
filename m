Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA8CE6F092
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 21:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B4710E058;
	Fri,  1 Nov 2024 21:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ez15CYrU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02ED10E058
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 21:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730497957; x=1762033957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4ALShU9hwjE+HO041HMfYl5BOdVAGmu/86rIXVg0BNU=;
 b=ez15CYrU5PN9T85r/MkLZjyGjx/kEbsXwnh1ij1ctxbjDe7ses/fHRWX
 URJdmkt/FnLhiV/KU9lUXdo3q6raC9EVmhZkz/+dTDDNmyCOhXJd9SwgJ
 G3iiRKBORqC+c1zsWi5vpfxuHXfmMlZmCx6oz80JYJBkjxNzF6udbSIYX
 V6p9kiFN3y1zgPv9fmMy/kgasEw/8YJnbAMunuRp+JfBaHxt6o8FtUiLm
 dP2rZfrYN31jziLY0SP74Z3zVwjLARuaPaQKfliHW5a1aTQOYpbfbJsTr
 zgijfYWg2n+vNc8MayLHc7PABs8KmUSC2mvKHzoLSMq5i2FwaSNmQjrTj g==;
X-CSE-ConnectionGUID: XxbJobhzRfS7sEe7oCouug==
X-CSE-MsgGUID: Jdlf/lxFRfC/tuDSvgcFcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55669009"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="55669009"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 14:52:36 -0700
X-CSE-ConnectionGUID: 7VeofNgxTzmtaqFA6ke3Hg==
X-CSE-MsgGUID: ARYDWSIaSD+W6FbMcS5T7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="113908208"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 14:52:36 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 14:52:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 14:52:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 14:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2EQVxl0YCcR1H2ZGiO/rRILSFAB1YyJZGCZNoPE8PN4jkijrFxtBL8760X3J71Q2BdV6kQhnRPSI0+w+8MhCNZnEM8pTWpmXInNxgeEW+HNgTP6f4nCI3bbTij9thJamn9sosoSJVx1eFwxmGU5mEihXQgCY5oyJn5YQSuZVRSUZz661ThSq4dX3Gsul28/llC70VWeYaTEiQH7l3RrNsK9XY+102mmGSEeW3XjIiyEH+7LyjthMh8Nkv/TYPNOcqJJ803MECEvgP2PWFHjGUfYCmgu6z//SwbI059BVb6viXAsAebvn2EjuW9NDa1+9dYdBExgvUczFimy427rGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc327ZAvkbpa6tXXSQCqvAxI9xTgD5hK4DYGE9e5Hwo=;
 b=rM62OY1qjD8nyNLYOP9TiLZ8SU2yvoJ+ZRDoxz2HZKB/C8F0Q/C3WupeKKOS3sdH0icQjesUs9cZm/1rbOwIZRd6eIQNAQekX5slgv+p8Zm7NRsbPWZaM8aEdRWV+/DmmjeKNzGqmFPL2GCDvJ+BsxTFVwKF5YoQ8s7qwR76fPkW0nBJxxuTvLSbO+Fk/pmEejF6BFydD9XnzyeKmxHCZINBWSbBq82JgPAcQHi582u1ge7WJj0tTVaADXAh87uRS/v+zlaIJDASZjNXzn3OhkKSflzjauT2ZmJyLJA+jtYiFMA9cuOt6D+FqSXZ/z2bREtNQPPyYktFPiGeGFjnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Fri, 1 Nov
 2024 21:52:33 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 21:52:32 +0000
Message-ID: <b32a1ea8-3a2a-4ba8-a195-4babca8e5c8c@intel.com>
Date: Fri, 1 Nov 2024 14:52:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
 <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
 <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <80cb07e4-8049-4320-814f-7535b20e1145@intel.com>
 <CH0PR11MB5444240B935D3ABF926E2156E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB5444240B935D3ABF926E2156E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:303:85::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: a414e3ec-f8cd-4918-096c-08dcfabf7d35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZndTeFlEVGFXb1IxZk5hcFd2TURhUjBKNUk2b0dsanJKa1pzRHpCcWVHRFpx?=
 =?utf-8?B?ZkMzZ3BVUlh6d3FRQzREUWtFWWpnR3lKOElVUHRIUzM5aldVZFZkZG12cG9v?=
 =?utf-8?B?d1hQQmtoSkVlQlE2aGlSaXdjcTV0MlJMcXJUb3R6c2tRS29Lc211Y091UXZH?=
 =?utf-8?B?TUQ3ZHpFUk8rc3NsK3F4OXVJQnlSODNscU1sM0dZNGRha29pRms5ZEFWdXkx?=
 =?utf-8?B?VVEwMW5EZ0VqdlgxUSt5cms2VkVFS0RET0xaLytnZS9QdDBreEltdnJJUDF3?=
 =?utf-8?B?SU5BcGZRc3FxUWlqYlNNYTdZVUVFUjdRb2ExVlpKSGNkaEo1QlI1bW02MEJa?=
 =?utf-8?B?WWtwajA3NWVERDc5ZG9CUTEySGVFWmRBclBGYkk3V1JnbXI4LzB4a05DRlR0?=
 =?utf-8?B?R3hxRXh0TUYwRzhSbmYzUHNMZWh2cGlhcm5od0lxNi9JU0kwNm9RcytmYlBv?=
 =?utf-8?B?R2RsbjlycDhyOEp0NzRCNmI2MURaMkdDVElzOTFQUlhWa2l5eU9SbVZkMTU0?=
 =?utf-8?B?U0I4dmk3b3FCSXRwME96V0p1MXBqOFJlL2Q1WG5Qa2E2WnpyN0lRMjlkU1hW?=
 =?utf-8?B?OTlGbmdVQkp5VFZZVFUwVHd3MDdsRW5Xbjk1RmpKNDZKNlRCRENSRHFIMVZT?=
 =?utf-8?B?KzhmVzNZUGM4eE84S3h4NHVRNDJ0Q0J2VGVaMlJhK3hUenpHTzZ3WmFpR2ho?=
 =?utf-8?B?U0M1SzJaTkg2QUVKSVFSRFcwRFZKVlkvQmpUSVZCN1RtZEM2VVBDM2xwd0Jp?=
 =?utf-8?B?NnBBSk04WGdtOHRHSERScWFwbGhtMG9wSCt3QUx6WXVzWWViMitSUXpqa1o0?=
 =?utf-8?B?VGdoYjA3YWZxaDF5RjRuNERIUkZEYXdHNUwxZzVZckFlMlRjL281SGtiRVhJ?=
 =?utf-8?B?Uzl1cWRPeWhwczF4bEx0cldkSjlibmNqL2Fld3daRk5VeVZIZDROQmtnNTBy?=
 =?utf-8?B?eW9yUWdJSzhoSExmYndtSitrQ09RNWxpRzIwckRaRDVoRlA5ZWVTK21mRlI4?=
 =?utf-8?B?cklnVldra0d2a3ZRUGVjeVhVUEVsMjllcC9ndlN5Q1VIYkIwOXVWMGRpamV1?=
 =?utf-8?B?TjRoVzNYY3ZnbVNCcmtRSEVGQzZZcFFWNklRaEhsZVZvUlJLMGk5TzJ4bDhO?=
 =?utf-8?B?YzhwQzN3WUM2WVBuSlkxZTYwVXJuL1VWWFNNODZYYm9HTFFKenVpRWNiR0lY?=
 =?utf-8?B?eVVORnNoTjRxQjZNN0NRKytWUmRaeGFwSGV5WnJqMU5sTGtqMzhVTC81Wk50?=
 =?utf-8?B?UlM1c1ZnVTlVUUtKQjROUmgwSTYxalYvbVlabGZWcU5zSkUrY3JIMmM4ZTVW?=
 =?utf-8?B?OGl6cktCTXE0SmJqbWNLMzhHK3FPNTZTcDBMMC9wcEdTc05VWlluQzd0ZnhY?=
 =?utf-8?B?bGxvcHkwRWN0TmFjOWM4N3dEVC8vaEFSNXVOTU1LWFV0RDRhcGRJL0JGbzdu?=
 =?utf-8?B?TEVOaVoxRXZCR1ZiVXdaMitxZzQwUWlTOGRJL3BTQUpoVkhacnBWNHZVd0pU?=
 =?utf-8?B?ZkFVeXM3UHZhUXRzR2tuK2RBbVhCanNMeUpETG5sQjFiSzh6VmdPTkwrNFNC?=
 =?utf-8?B?ek9PM0FoV2RLbFZab0FaWEcvUXRxZEh2WStHR2k3cFNMbTFjNEltdFNhblpy?=
 =?utf-8?B?VHg1RUhYY2EwRG9uUk1GekFRU3BFMzd6U0FJSHhtVHF4NUpxdFQ0bFc1bDR1?=
 =?utf-8?Q?uW7zt/MDFIu1dNw1CgPa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDZzTTZDWWZCUlNSS1pqVGowOXNUYTM1cVpjQlB4dnQ1b3EvZzZZcXJHbDVY?=
 =?utf-8?B?NE9abEU5QWVuOSs3ajNKWTVVYUoyMmNSSXYrRG5sbndiTktKWlBHWTk0Y0d3?=
 =?utf-8?B?b0pJWkU4MlFSbk5LSEQyMlAxWlY2WWpDb0hVQ1RBUktGMFZWZWd0eWRCeE9I?=
 =?utf-8?B?ZDBkcS9CY0p2TWZSK1Brck1aajJFSGVBb3ozV25WaUZXVmtmSlJnSi9EYm5Y?=
 =?utf-8?B?RXNBb1lKdlh5RXFTQU5WZUxUV2pBWEFRcnBRbnVGTUtnWVI4a1ZOcnBpbUIw?=
 =?utf-8?B?TmZSWFBENlpYckVRZzRUVmFSMWZ6UjZZUUR3NFBxeWVLVkZPU3hYNExIVnE1?=
 =?utf-8?B?bzBuQ2FSM3E5a3dGbU9wd1J3Y25TTGV1NU40YTJvd0NJbi9FNjlrcE5mNS9F?=
 =?utf-8?B?OGNTREJjRHB4U0dQSWZJaFczYjNJaDA0Q2NpbXdpKzdQNXZnb2MwVzVCQy8z?=
 =?utf-8?B?T1ViM1V1Vkk1dEEwdmJEbXZWL29JUkVlL3Q5b2RwSG4zNXh5cDh4S3lMWm8z?=
 =?utf-8?B?aHJzbGt4a2d1TDEwaTFDblVucWpDbEhPT3IyeXAvMVFoOEZlSlV2cE14TUhx?=
 =?utf-8?B?aURzQk4zRmh1VEpNQ2hoVFoxOHh6NlZoUXpNZ0pTYk5YcXpiR0dTcVU5SnlF?=
 =?utf-8?B?cjV4RzN4c256cFhFWUtqUk1TSE9mci9FNjhSRFZGaTdITHZvcmt6U3NGMkp1?=
 =?utf-8?B?cDlQeklXRzZGVG52SjQ2UUx3UEFoSzRha0tJcCtURmRaT2NMVnlLS3FCV3dQ?=
 =?utf-8?B?RFJJSHIzOFZ5SFl5dEcwSlYvR3RwTVZFdmNFa0YyS0U4NjdIRWVBYTJJQ2dk?=
 =?utf-8?B?aFhCR2ltWWR4b0lseGdJVHIyMmM3c3NhY01SbHpHalE3VWNzWW0rZ1lQRmhY?=
 =?utf-8?B?S2NyVTVlZ0kvQ2xRWnpZOHU5M003YjE1RXhodUV6WTB0Smx3VG1iNlVWY29K?=
 =?utf-8?B?RFU3a3ZZM29sNFJSRUwyb3JIR3NNcFVVNmU0Mk5WWnJIMGhaRTh4YzhXN1Vx?=
 =?utf-8?B?Rzc5TExUamFOd0pnS1ZPem5TR21ML1dKbUJYWXhRdW00blR4aGo4dlJBT0JB?=
 =?utf-8?B?djduVTB6d09VZTVKMG9RTlhDTktueC9EY2NubVNhTmh2RU9zZ050cmVYQXY5?=
 =?utf-8?B?SmdCWVJqLzIxTFJQTGI4ejFubWFQbWdMYTlrRWhUWU15NmxKaEZncm5YTHRw?=
 =?utf-8?B?KzNGc0QwWTFpNHVxRVhEckRRQjFiODhrTjIxUElKQWh0Nlc4NzdsUkdVV0Z0?=
 =?utf-8?B?eVJFY1JWZnRvaHRhRE1CR3JtUGlwNHhXd2lOZ0I2L29DcVZmNllXdENnUWtY?=
 =?utf-8?B?M3M5c0o1bnBQdGo0Uk1FQ3lYckpjVkFkQmZsM24weW1kSEgwWTNSUEJWMHNa?=
 =?utf-8?B?TWhwK2VGYTF1WGhvYkx2c2J5MU5mbHllUjlSblR3VElKakpBYXhWWnVWMlFP?=
 =?utf-8?B?VmR5azE2WnV6K1NGeXd4QnZkYnA2R2ZrNGdYN3hod3hCY3E0VGI4TGludi9a?=
 =?utf-8?B?alBwM2hMaHJVUDMzN041RnFWb1dtWHNzNi92RlZUMGZac2pjVTFRbFZXeTgx?=
 =?utf-8?B?RFN2QXkxMlZkZlZxWnEzaGZkcjFyd043Z1FUcXlCN1BzS0IzT0l0WlBFVmEx?=
 =?utf-8?B?Q0pjMnFlRkRjbThZa2tzSHAvK3d0U044c3VYUGkwY2tPVWYyRzRLV0pud2hy?=
 =?utf-8?B?UWh4RU5sRWRQNkRNVmx0U3JQOTVmUTM2NEtmaDlNZEI0aUgrZmk4M0F3TXp6?=
 =?utf-8?B?elVMalZEV2tUdS9QVUVKVEJVMnpuMnhXT0VYUnFLem0wb0c0TXNleGEwaGY0?=
 =?utf-8?B?cE9Jak96cnBxcG80dHRzdlpKWG9XeWZzOVJjWFNBV0oyOXFKV0Y2ZGhIWG9h?=
 =?utf-8?B?MlVsSGlPYkR6V3FmSHhKWFRKYkxURzlSdmxrVUlubkhTdEduSlEvNUJnMWU5?=
 =?utf-8?B?dzUvMzdhc1ZBdXMrS21sdGFjRlE1eUNTRzd5V1JMbHZNenUxSHk0STFkSSsr?=
 =?utf-8?B?MmFWODlJWmd6Y2hITGc5T3ljd3plR0xyaDIvaXBBYXdialRyY3dVbE04Tlp5?=
 =?utf-8?B?RklqU1d2cHN1a3h3Sm1KNENscHB1bXNjRlpkMGUrMGF0UnJFNDZ6SWxmUXJ4?=
 =?utf-8?B?a0FEZDhsdElIbEY5eHFGU2l3TllZaGFFd1V0M0liVXlrdG8zNFNramlEK0pZ?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a414e3ec-f8cd-4918-096c-08dcfabf7d35
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 21:52:32.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3AuOEngIjgKs1urqa6V9CEokM0YUIQzXmB3blIyaAK1Rksy8jaSV9p5FbVRkHfHctZfpPeJqFPX/ZT9WbeUcFw5cE/h6+jFkT8cgEvGlfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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

On 11/1/2024 13:47, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Harrison, John C <john.c.harrison@intel.com>
> Sent: Friday, November 1, 2024 1:14 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
>> On 11/1/2024 12:40, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>> From: Harrison, John C <john.c.harrison@intel.com>
>>> Sent: Friday, November 1, 2024 11:46 AM
>>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
>>> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
>>> Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
>>>> On 11/1/2024 11:04, Jonathan Cavitt wrote:
>>>>> When performing a guc_mmio_regset_write, we add all the registers in the
>>>>> reg_sr list to the save/restore list, but do not do the same for the
>>>>> whitelist registers.  Add them in.
>>>>>
>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>>>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>>> CC: Lucas de Marchi <lucas.demarchi@intel.com>
>>>>> CC: Matt Roper <matthew.d.roper@intel.com>
>>>>> CC: John Harrison <john.c.harrison@intel.com>
>>>>> CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>> CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++++++-
>>>>>     1 file changed, 10 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> index 943146e5b460..2fc6b1ccc8fc 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>>> @@ -239,9 +239,12 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>>>>>     	enum xe_hw_engine_id id;
>>>>>     	unsigned int count = 0;
>>>>>     
>>>>> -	for_each_hw_engine(hwe, gt, id)
>>>>> +	for_each_hw_engine(hwe, gt, id) {
>>>>>     		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>>>>>     			count++;
>>>>> +		xa_for_each(&hwe->reg_whitelist.xa, sr_idx, sr_entry)
>>>>> +			count++;
>>>>> +	}
>>>>>     
>>>>>     	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>>>>>     
>>>>> @@ -727,6 +730,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>>>>     	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>>>>>     		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>>>>>     
>>>>> +	i = 0;
>>>>> +	xa_for_each(&hwe->reg_whitelist.xa, idx, entry)
>>>>> +		guc_mmio_regset_write_one(ads, regset_map,
>>>>> +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i++),
>>>>> +					  count++);
>>>>> +
>>>> The code that actually writes to the NONPRIV registers
>>>> (xe_reg_sr_apply_whitelist() in xe_reg_src.c) explicitly clears all the
>>>> unused registers with a comment of "clear the rest in case of garbage".
>>> The code in xe_reg_sr_apply_whitelist calls xe_mmio_write32 to write the
>>> registers, whereas the code in guc_mmio_regset_write uses xe_map_memcpy_to
>>> internally.  While the former seems to be writing to the
>>> xe_mmio_adjusted_addr(mmio, reg.addr) + mmio->regs, the latter appears to be
>>> writing to IOSYS_MAP_INIT_OFFSET(ads_to_map(ads), guc_ads_regset_offset(ads).
>>>
>>> I'm not particularly well-versed in these functions, but it looks to me that these
>>> two functions write to different locations and thus would not impact each other.
>>> Or, in other words, I don't think the garbage we're clearing in xe_reg_sr_apply_whitelist
>>> is the same as the data we're writing in guc_mmio_regset_write.
>> No.
>>
>> The apply function is writing the list of whitelisted registers into the
>> whitelist registers themselves. The GuC ADS code is adding lists of
>> registers to the save/restore list for an engine reset.
>>
>> Specifically with regards to the NONPRIV registers, these are a set of
>> registers which hold the addresses of other registers. When set, they
>> allow untrusted users to access those 'other' registers which otherwise
>> would be off limits. The whitelist code is setting up that list. E.g.
>> adding the OA registers to the whitelist to allow applications to use
>> the OA mechanisms. So it does "NONPRIV_REG(x) = OA_REG". It also does
>> "NONPRIV(x+1 .. max) = NO_OP". That is to ensure all the NONPRIV
>> registers are set to something valid and not uninitialised. Otherwise we
>> potentially have unintended registers being whitelisted and users are
>> able to access things they shouldn't. Whereas, setting them all to NO_OP
>> means we are granting all users access to the NO_OP register which they
>> already had access to anyway.
>>
>> Completely separate to that, the GuC ADS code is creating a list of
>> registers which GuC will save and restore across an engine reset. These
>> are all the registers which get trashed by the reset but which are not
>> saved and restored as part of a running context. The NONPRIV registers
>> apparently fall into this category. So we need to tell GuC to preserve
>> their content across a reset. Otherwise, after the reset, the whitelist
>> will be lost. But, the reset state of those registers is 'undefined' as
>> opposed to 'NO-OP' as suggested by the whitelist code. That means that
>> any NONPRIV register which is not part of the reset save/restore list
>> will be no longer be set to NO-OP after a reset. Instead, it will be
>> giving users access to some random register again. And we do not want to
>> do that.
>>
> Okay.  It sounds to me that we aren't performing xe_reg_sr_apply_whitelist
> during an engine reset, because that function should be setting the registers
> to a defined reset state, rather than "undefined".  Should we be calling that
> function during guc_mmio_regset_write?
>
> I tested it and it didn't work on my end, but I might be missing something.
> -Jonathan Cavitt
No. The KMD does not execute any code on an engine reset. The reset is 
handled by the GuC. The KMD merely gets notified that it has happened 
after the fact. That is the point of giving a save/restore register list 
to GuC. GuC will save the values of all the registers in the list before 
it does a reset and restore them again after the reset is complete. 
Therefore, any register whose value we want to be manually preserved 
across an engine reset must be added to the GuC's save/restore list.

John.

>
>> John.
>>
>>
>>> -Jonathan Cavitt
>>>
>>>> If we don't trust the reset state to be valid then we need to ensure all
>>>> of them are saved/restored across a reset. Otherwise, that garbage can
>>>> come back and cause problems.
>>>>
>>>> John.
>>>>
>>>>
>>>>>     	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>>>>>     		if (e->skip)
>>>>>     			continue;
>>

