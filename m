Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA25E81A48
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 16:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA1010E3D9;
	Mon, 16 Feb 2026 16:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atQz3V1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B9D10E3D9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 16:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771261187; x=1802797187;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=s/F3qSI7kwZVmXdMAiRuttWKn+0Yg1kB60GczqlAww8=;
 b=atQz3V1cw8nc1W6i7uMe6ROAI4GGV0ETmyZdJv5y/DYKueyThcMXwYb1
 ls5RQ9lIk5i4eSykJZnJbblHb+CvPGMK0IBR4rMgE8mKx89Ru7sxZFoy+
 yByegT75gQZfrOkeM8x33/z1vsQ8EFKw8VgJg8OBbHFpodyUOISa0ZTSP
 yfUucD+xn8rmo11plHLr4U18c7dfv5XCyIvINzLi1TzaeqLpVgv6d6fqh
 guXqLxpMzLm0XKTbOWz6yVbhEFLLIxgG/xhQeW5I5GVVEkngHlDCG+v6o
 Uw5pZ3jB0kXp1r8Wx/b00MCF4uZnvjgubMKsu9MCYdjpRXfPna0Aj/8Ts A==;
X-CSE-ConnectionGUID: hG6hZ9nRT6GjLcOGVY/FqQ==
X-CSE-MsgGUID: xvgIgUuuQgazuMUoFmU8pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82973684"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="82973684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:59:47 -0800
X-CSE-ConnectionGUID: I/uXsLb+SDCq3uFb3J7eLg==
X-CSE-MsgGUID: XNg+LchkTUS2cxQtazFzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218643149"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 08:59:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:59:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 08:59:46 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 08:59:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niTnzV9M8rsoZdzXhoMO09hWIvoOxB8PM0FMOyS/W7WcdAjzIStqTIi6O/8qWGfapDqUw19J5PKTRbusnvKJaHLE2wIzbJx8IeYSW4VydxgmHAbhfHVXqoxATIp3K8CdcoL6VwVXpm2A5uc5IroSCbHT/jQhkJG+fqWENdKmcPrdf1qpVVVmowOMUHiqv5dgrTZRBPQ0kNrCoOR7fFtgy082DPDwrjXODlOA1EddScy33/rN8VHdAXisNb+0vCoNxvgA2RBWwQcLa4yIifRPfPnUCodQ96AProUVscKQIM2v7EcyRAc6AAGXVzx8vVRMy3cN77Whq15C5zv53EaqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZq9NPTLbi1eiVi5QW2FJ4EefVmZuZ8fad8ykk4c8gQ=;
 b=ZRGvHaAN6VXntFJ1u8Lr3JxGp5t4XHqyDQvWHUis32y5Xr+6HTcPe9o563FcFD4fntMCm6rbGGXLRQhOCOLlUuoFp0oKSZGjQu1uRp/hqhbPjU1yMdO7PbccOrNi+Fzh/kL7vm2LOsg371Ofp1YgrxOQuE4AHH+ehJ+fNHE7uE2NG6NF2ntpGAxUELzMx863WZukSkhDJek2V/WU4zcU5rBTKZoAeUq8khGChnqXizV7/F92NVrpJKdyvl0JD+K+vZGq/HMB8BVaFGqhnzhiCJI5O0sNWrY5+/Sxzls/VtFU7S5VAj+f864e+plnXrTWvt7rm7EPm9X9F7dn5FYKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 16 Feb
 2026 16:59:43 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:59:41 +0000
Date: Mon, 16 Feb 2026 17:59:38 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/xe/pf: Skip VRAM auto-provisioning if already
 provisioned
Message-ID: <20260216165938.tndepv3wsjhtwpzi@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR06CA0171.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: e425e7ce-883d-4617-f2c2-08de6d7cc6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek5jSzAyS01mUnY1L0xYL2k3VWVtLzhPa2N6VWxWY2J2NVhVZXozNnorV3NQ?=
 =?utf-8?B?S2VjdVdKdXprT3NCbTZscDZyclJKZXY0LzBGeVVONzdPd1g1NHljSEpMSjBl?=
 =?utf-8?B?M2hMaDJhSzd2K2pJdTRObHRXZHNmNlhxMWFxNlJ2T1cvQjg2V1FOUmJPSGFF?=
 =?utf-8?B?eU50aEJUWEZXTzd3aVFpZGtlUlluVjc0UVM1NG9nT2R5TE9HTHV3TEw0Y0Vu?=
 =?utf-8?B?anZmY0JRaHdlYjh3WENhZC9KcnluNzdJa1JmWUE4aER4d1NuSnRaRmRTVFB2?=
 =?utf-8?B?QzZoY1drMDIzZ1Mxa01wWFZock1JM3dzaGV5aGQ3L1d5R0ZWYXB2QkdCZVJR?=
 =?utf-8?B?ZkVhalNWYTBJUnlpbDJpcGVHMWNrODFXR1QxaUxSdXpQTVpURGtYSk1YaFU4?=
 =?utf-8?B?QW1oYWhXdlV5OGtkVHhKcks3U3FGM085QzdLbUptRW1pdUNhVFNudSs3YTJL?=
 =?utf-8?B?MlQ4WGgrYTFGN3ZoSE93M0grVHdES3ZLWU1IZ3FuY0VzeTN0OVdOQjBjMXB6?=
 =?utf-8?B?Ykg3QmJkajNVZnN5YU9INWxIemhUcWo3V2xmQWJBMm45UGRCTHhTUDNBMGQ2?=
 =?utf-8?B?TDdZcHdLR2VwTlpQWnhOSEtWR2Q0ak9XUTNUekxmaU5IRVNNcXRVbHJMSlky?=
 =?utf-8?B?cEVPdHJxZ1JIdUE2UGNTOFVZZEVsS3RCR3hLNUdyVTU5U2szMThkSzdWRFJx?=
 =?utf-8?B?dG5QZGpFQ2RONTBkQnZqdUlNS2ZabzBSQVd0a20yWU5JTW5VaVI2V0QvOXN1?=
 =?utf-8?B?VFR2MGNhM29xRThDZVBlckpSa2RvUVpLR1NOSmxPamxDWVQxcEx4em0zaDJH?=
 =?utf-8?B?VzlCMi9lMklJTzNRZ1llcGR3a0dzYUdrRklUTFdxRG9XYkE3Tzl0bm5VY1Uz?=
 =?utf-8?B?TGNGcDNWbU1TYVNaRURKdjBoV3g0WTBHKzVjM2xjZVVrZFVROFRmRVhRWXZt?=
 =?utf-8?B?eGQ3K3NPbUYzSlhPRGQ2UDR4UENZd0tEQkpEQjFUdENRSk1EK0Q3UDVjc1RF?=
 =?utf-8?B?dUI2VUpNa290TThOQThHVzVkclErSE5XK1IyRkNxK29tZHBaR0JFSlkvQkpi?=
 =?utf-8?B?Zjc1UnFsenU4VzJvd0VTck9XSHB4UW90UFl4aE9CYnBya0F3aDRmaDNOOGRk?=
 =?utf-8?B?N0p1emNtM3pEOW1lR0VqbU9qMW54SXNTTnU3SVlNSnpzMGhoT05nWEhXMjBp?=
 =?utf-8?B?eG0xcWl2V0hPL3BmRzMvV1FKRzFSQmYraVdTMEZFTXpMakVrc0RrSFVPTG13?=
 =?utf-8?B?VmlxbU5PN3JuTUVpOCtIeUFRaVJuUFFReGhWamM1YjNMTXY4dTE3RGRnWlpB?=
 =?utf-8?B?ZlhVZlo1QVZhSFR3VkZPY1laM1FSTFFvaTVvSHJYV3RSV0tPcWFFTmN3dnFr?=
 =?utf-8?B?blpwRlZ4Qi9hNnp1LzRhM2hpSkFUYkJ0b2RxYTNrelBKNjZUckRDaS9tbjhS?=
 =?utf-8?B?ZUZwS2t3aUxPY0s1OUdteXhIR0puT25KR0F6SU5McWlZQSt3aDNncm8zRG1u?=
 =?utf-8?B?ZlBGZnAyNTV1MVpSZ3Q5MGxnZW42dTM3eGUyK3pCNzBXZUhoRCtLRUFRNWYr?=
 =?utf-8?B?WVc1T1JmWTNlaFMzRVAyRFBNUTVRMWx0SWFTd2Z3YmVyUFlnS1Z5OHhpaUtk?=
 =?utf-8?B?U2NTMlVjZVVsMmIwejBrTlY0MFNNZkFJSERCdFltL2Z4VHZCM3g3ZTZpRmpy?=
 =?utf-8?B?Z2dhUEJCRWErd1hiYUh0bU5CckJyRkF4RTZhMWhBVWRJcGFFTHZtSkgxRWow?=
 =?utf-8?B?eXZ4TG1WMmRQT0xvVStjcDl6YU0xNnFnMjhxTnI2QngwRzlOTDFLOWx1VEl0?=
 =?utf-8?B?TkhNL1RSclBjSlVjTE8xdUlsRi9qNytNWXBGSWZEVG92amNXWXlZdkltMS9v?=
 =?utf-8?B?Z1dETTM0M3V6d1F5cTJUVkxHck96ZDFDbkpsZlY4MmV3M0xQY0RaSnFld29s?=
 =?utf-8?B?cmxsVGpsZWNTQW9rek9BNFlXbWRCNHNuSGN5cjFNaXVBcitNVXl3aTdlZmdY?=
 =?utf-8?B?Wi9wUWErRUswSEZkZXJzTXZuVFBka1hleUh1NmFHemFENThjSm1HYTduNzJI?=
 =?utf-8?B?azRqQkpyVWJaUnFQZ1ZMZ2RkZFkrZjF1TnFhZmQrK1FBNDRoMnlER2w0c3ZD?=
 =?utf-8?Q?rAOE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVdwRy9DekpQaVhueWk1MW5hYjhURkdmK1l0RkF5bzROTXp6K0RWNGFhb2ll?=
 =?utf-8?B?emc3TG9uUDJOQjJ5cm5SWmlFRk9JMVJYS2hzVFg2bE9ZTlpVcTMxKzdlY01W?=
 =?utf-8?B?MWlROGR2Z1NobzgvYzExaDFVVUJudllNNGJheG9PYWc3VGtBblIzczNPMkJV?=
 =?utf-8?B?Q2xYL29CeWE2VldwVklaMHU2aXcxdGozWVBnUzAweHVVMlVsZW50M1paUnZj?=
 =?utf-8?B?WDNPYm54RXk5QUtaeUlQUlFobGducVY1K3JRVG85aUhraUduMmhNRHpvVFVo?=
 =?utf-8?B?a3lNRDNGTFRDNDBhSEdTZnZoYjhpTDNVNjFiVlZJM1dxV2t0VzVOajF6STZm?=
 =?utf-8?B?SUlITnpxYmsvelc5cExaY1FKeWZJL3dFUktvUGhiZWYvS3E2SlVGQStFR3Bh?=
 =?utf-8?B?Ymd0OUNUc2hZVHNEMk9OZktSc29lUG5HaURhWm5FcnpwUkJET0pkSmdocElj?=
 =?utf-8?B?eEJiNXhSQ2UyY25XV09kd1I2N2g4WmJ6NTE2azFCMVA1VWU0K05FdWg0STZO?=
 =?utf-8?B?c2FRRkYzbGhNUGx6UkJQMjAwYXZOSTRISGRzYlBoZ0Vsd1FXcFNrc0VGVksz?=
 =?utf-8?B?UGV4UWFkQmcrc2pDaE1nSURTV0hmQTFiT2lvQTRUZ1hGYmRQaVZrWURIcTRt?=
 =?utf-8?B?LzZXVGppRE55REZPQW95WjdxOWdnTUNkeHljTTU2aHZFdll4SkduK3YwT2tI?=
 =?utf-8?B?WWZDSjJHbGd4WjE4UFErWEp4em9PdDdiQm5nbmNCMTNQYmZtUitPVWEyWFFq?=
 =?utf-8?B?cUs0bTBZV2JCcjgzN2R1QmhWcC9ML04xUW5oY20wYTc0VUpZcVV2VzVWcU1U?=
 =?utf-8?B?WC9VWVpUVkRobUdFR3FyRTlzcm5WTldnQldaTStsbkpLR05NTjhpQXVOVnh3?=
 =?utf-8?B?SXdEZGZNcWFOc3hXQkhHN2ZCY3AxOFhadjZnYjJ4SHZPaTZ6aGNMRjM2OEVl?=
 =?utf-8?B?bVdGOW45dlh0eDVqeE1QZjVyQ1ZHQWJ5SG1LaUQvVzdZYVhqdDR2V3pWUmNI?=
 =?utf-8?B?aUNYRjJLejg5SFR6MWJKNWlYZW8xYitjOHcxMk56WkRaU2UyY3lqRmgwZE0r?=
 =?utf-8?B?SE9wY1I4bzF2NTV4NDVveHBGMnRXcFVTOHhKWDRHalpEbnllNVFUTmkrTkZs?=
 =?utf-8?B?RExrbFRBdjlZYVhWOTlablRQdWE5dnZBeGdiVW80SkNlMFJhTzlZUlVCeDY2?=
 =?utf-8?B?SnE3NzlQTG1xeXBFcStoMHo5dWhrSklUM21INTg1eEVZUnQ3ajlYdnU3UTdJ?=
 =?utf-8?B?TTVLV3lBZ1hlZFhtdVJPK1dSWTd6NC9oTmpkckVOTE1JRFJpdVpQTDJ5blM1?=
 =?utf-8?B?SjY2cGtQSGNUWmNrT0daSjFtNjVzZDZCelJPRndkZHQ1OURlRjQ5RWplN0xK?=
 =?utf-8?B?K29aZFQveXpJbFFuSWR2eVVHR2VuOUxydWxvOGFjZ3VKa2k1YXdZWUxnWVdy?=
 =?utf-8?B?MGwzSXJ2M3VsbkRhdWpydTBNb2dPbFE4YkxlTlFsNVJvZVBzY2RVV3QxelZt?=
 =?utf-8?B?MGJ6WE9ISHpFV1JlbmFtaUlMemZzbm9WdjdoRDJWV2lwN3M4bGo4RCtxeHp4?=
 =?utf-8?B?N0k3L2hOTVRVbFF2TEN1QWpHQWFsV3MwWkFkNno3YjZSMy9HQ0MzQTdMc0Ja?=
 =?utf-8?B?bmNJWFFOZXpESElPZG41S09JTm43bzhjR0FkVjQrK1l2bkp3c21Vc3dVS3dW?=
 =?utf-8?B?ei9sb2xITFJOQklVTnl6RVlQZFlFL3JqeXhRN0c3OHVyR0VGdWZPYmdTOEhq?=
 =?utf-8?B?MEQwSXNtR1JmaW45RkJ5VlkvcUJtODlkb05FKzNhamI2N29Gc3UySUFFbUdW?=
 =?utf-8?B?a2lqMjFhZE1kWEJWalZxM1pjd2Q0eit5SnpkNzl1WHh6QVBveEpCVC96VkU1?=
 =?utf-8?B?a2hxQUozYXVncTlMTzJ0LzNmWEdsT2lNVDR4dXkrcmFOZTZpRUtsRnVNUlBv?=
 =?utf-8?B?NU1FN0ZPbUYzd1pQTGc5YUJqUmF3bVZ4blVmTzA4NlZJckVweTRCZmo2dkxE?=
 =?utf-8?B?ZTVKZnRPdWcvcXBSWjRNSTV6UjlQeUk1WXBVeS9PVnJtVnEycVE4UUVHVXpZ?=
 =?utf-8?B?Yi9BYW1vbDlTWWdVME1ibFA0aDJmRHhqK2NNdXY0VGFkQXZTT3VPb3U5SlAr?=
 =?utf-8?B?b3psWDFod1VYamRVenF6ancwYXlldm4xaTdPYy9Vd1RJNG5YREdQZ1R5TktG?=
 =?utf-8?B?VWlhNndiMGt5T1VPK1ltV0lpRGV0czBRV3VHOGpuaVMyV1dLS05FZENXcUVl?=
 =?utf-8?B?ZUVVSElpaGdyYzg4eURqbUxETFFvKzV1K2Ftd1pZMFphVXcxVkt6aWVrMW45?=
 =?utf-8?B?bncreXo4Nktha1hiWnI5WUxCZFgwVENtRlVUV1Z2YnFQWFB2cCtGT1E4Z3E3?=
 =?utf-8?Q?KkMGNVseLDc5rYg0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e425e7ce-883d-4617-f2c2-08de6d7cc6e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:59:41.4711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B35qkRxI5OGySt65QCjqFgAZZG8EJkAAgrMDSx6qeXrjGoAuSMQGZgO/nFr/bfXGmbBfrluYEeQ126i4/SHpD7ZnxognI145Ve1lRGFVaAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:22 +0100]:
> In case VF's VRAM provisioning using sysfs is done by the admin
> prior to VFs enabling, this provisioning will be lost as PF will
> run VRAM auto-provisioning anyway. To avoid that skip this auto-
> provisioning if any VF has been already provisioned with VRAM.
> 
> To help admin find any mistakes, add diagnostics messages about
> which VFs were provisioned with VRAM and which were missed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 1a9f3b85526c..b1eccd6712f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1939,6 +1939,59 @@ static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
>  	return ALIGN_DOWN(fair, alignment);
>  }
>  
> +static void __pf_show_provisioning_lmem(struct xe_gt *gt, unsigned int first_vf,
> +					unsigned int num_vfs, bool provisioned)
> +{
> +	unsigned int allvfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt); /* PF plus VFs */
> +	unsigned long *bitmap __free(bitmap) = bitmap_zalloc(allvfs, GFP_KERNEL);
> +	unsigned int weight;
> +	unsigned int n;
> +
> +	if (!bitmap)
> +		return;
> +
> +	for (n = first_vf; n < first_vf + num_vfs; n++) {
> +		if (!!pf_get_vf_config_lmem(gt, VFID(n)) == provisioned)
> +			bitmap_set(bitmap, n, 1);
> +	}
> +
> +	weight = bitmap_weight(bitmap, allvfs);
> +	if (!weight)
> +		return;
> +
> +	xe_gt_sriov_info(gt, "VF%s%*pbl %s provisioned with VRAM\n",
> +			 weight > 1 ? "s " : "", allvfs, bitmap,
> +			 provisioned ? "already" : "not");
> +}
> +
> +static void pf_show_all_provisioned_lmem(struct xe_gt *gt)
> +{
> +	__pf_show_provisioning_lmem(gt, 1, xe_gt_sriov_pf_get_totalvfs(gt), true);

NIT: In my opinion, I would give it here VFID(1)
This makes it so we don't have a magic number here.

> +}
> +
> +static void pf_show_unprovisioned_lmem(struct xe_gt *gt, unsigned int first_vf,
> +				       unsigned int num_vfs)
> +{
> +	__pf_show_provisioning_lmem(gt, first_vf, num_vfs, false);
> +}
> +
> +static bool pf_needs_provision_lmem(struct xe_gt *gt, unsigned int first_vf,
> +				    unsigned int num_vfs)
> +{
> +	unsigned int vfid;
> +
> +	for (vfid = first_vf; vfid < first_vf + num_vfs; vfid++) {
> +		if (pf_get_vf_config_lmem(gt, vfid)) {
> +			pf_show_all_provisioned_lmem(gt);
> +			pf_show_unprovisioned_lmem(gt, first_vf, num_vfs);
> +			return false;
> +		}
> +	}
> +
> +	pf_show_all_provisioned_lmem(gt);
> +	return true;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
>   * @gt: the &xe_gt (can't be media)
> @@ -1964,6 +2017,9 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>  
>  	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>  
> +	if (!pf_needs_provision_lmem(gt, vfid, num_vfs))
> +		return 0;
> +
>  	fair = pf_estimate_fair_lmem(gt, num_vfs);
>  	if (!fair)
>  		return -ENOSPC;


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
