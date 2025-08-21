Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AC7CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 22:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C865010EA29;
	Thu, 21 Aug 2025 22:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbWEUB4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7707C10EA29
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 22:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755815224; x=1787351224;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=idnSwSNUREFzstCKGw/IB46GPVxu/Uim1Zs4zRBreJA=;
 b=KbWEUB4aLoKehmKNESg84ZQBDrZqBTvDk29+mB1082auVYfmsovUTBfq
 00DYSRHZ6KNmFGHAddz/Z4KbBG+v3/EuG298AFW+M6VNP9pzI83edpkOZ
 sgr/GdrYDY/zqsHLqFVLSbBL7+BRPvORNgZ/zunzFXL22wkX+4dcwG/k4
 QF0hlg/CCQ6iI4hcNeZTSFmuROhavrOqv/kKnuumHbQTOoZaQIHF9oP99
 RQK6LrL2mPrJUUlt/Pei7VL/LwbV8Iy1qRsFnmIovZHbt90Abd9uoUwF3
 WJR90MGUAIdqAxX9syI0Z/l2hLAeUTqEB2ukIgIw1ijMCY2Kt3FJVsh4v Q==;
X-CSE-ConnectionGUID: 0ay7dTTAQk2oo4Ha7KiyCA==
X-CSE-MsgGUID: pS1ZpgBvSPqa4QifC5zarg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="60745671"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="60745671"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:27:03 -0700
X-CSE-ConnectionGUID: 4N9ly1ziQkyCqB1Mpk5Bug==
X-CSE-MsgGUID: vJkTzyD0QEibR9ME6HYrqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="167768219"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 15:27:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:27:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 15:27:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.84)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 15:27:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC8tn/+zzbKs7E9WUTNeTdpwJL4FPTBQZCwcXW4dnGC2sx5vEAfc/z4iuQhGkYU3ZSAGDkgHeA+hw3Q70rRP8eTEIEfame6ilsJWW4+MhjK/QzPpZ+mT7zm+DWX1SWI+vt/eCaZqhRMK81r0LBqRHCVJY77PnTRSo+rMTdt8qMPtGkjyrekhj1xAWHIfDi8pLP+5o+l0L7sK73IvhWVbg6Ry4M3LzNY21HZ9pcVV7UGxpFe39QgxdH0o/Gn4GDMsFOQCTUrWxQnrbx07L4z10ubszbgSPqcq45AP1WMCkn/ES6QSpzNZPmY198dlwYsY50cBzPCq2sIsS1lDLzUj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DS2HmPSFq/MzIb83ilnpMoIR/xI3GCJNuzWqKxGBklk=;
 b=oxyq61I/FKZN+tFJljhtieSBgaxkgzfKPaa4utPrnIqOb1xQgN+3elsNDngyG5PTF9VPMNxjMFjWt1DZJ/0Xg/KA7a32TNjHH5jsn0CgEDpwGEl41a8CufaYrhw5F4dXYehypHKir5gnLYZMZt6ZfdRavc5Gm0F8QJHE166+fqP3MM3oEia2ij/zCYjtQaUXdygzwmwU9ZlGFOIFhODEDJLj00a3DvfhNf4KV/4X3i2SXBsYhs9Qv1wZVfFn+0IBNPc3rplavCBa4MuFBVlsHuJA2+Dklifu5QEFOxNeBPj7+n+TftGxx80X8kxSKDnGl6S7AWaECyWWBpN5J8mXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 22:26:53 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 22:26:53 +0000
Message-ID: <a753e5f8-17e0-4d1b-b9ea-c46d8074f4f2@intel.com>
Date: Thu, 21 Aug 2025 18:26:50 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 6/6] drm/xe/guc: Only add GuC crash dump if available
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-7-zhanjun.dong@intel.com>
 <b4662514-7a7f-420d-9d80-6b52d84e2e27@intel.com>
 <606df984-4a0c-4987-b3f8-3fc4d9850213@intel.com>
Content-Language: en-US
In-Reply-To: <606df984-4a0c-4987-b3f8-3fc4d9850213@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0205.namprd04.prod.outlook.com
 (2603:10b6:303:86::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9c3d21-1c52-41db-1f07-08dde101d4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVFLUkZ5T2M5UnQ0aFhyK1VIUXE3OEZqcUVQZFJGTVBWZVZ3aTFBNlRYazhQ?=
 =?utf-8?B?YS9DRW9KNUx1MHg3ZkRINWp5L1ZPcXIwVXpLNDZtNWdRNUJnaFFvaTF5b1p3?=
 =?utf-8?B?L0hEN2dpaHl0THdteitZMCtWK05McnRSM0dhK3BnTGsyV1JoVDJDY2ZOTmND?=
 =?utf-8?B?cXkzblhtdGlnOGFyL3JJWU5YNGU2YnFuUG9Ydnd1WlpkOWp1SzMzckhwSkNp?=
 =?utf-8?B?Ni9ORGp6blI5K1ZDRWtpSFBzMmc3eU1sK2luQis4RzFyOXlLUjFkMWR2Q1RS?=
 =?utf-8?B?ajZwNlhjbmZaL3IvU0JnU2VKMFVJaVNqcmI5bCtZWUNnWDdPU2g0TkNKakVK?=
 =?utf-8?B?SS9TUDlxM0pYRjVRdk5mZXBxWmR0MFg3VDZVNXBld3JOQnpUVnl0OTJsVDhE?=
 =?utf-8?B?YWVnQ2xubVFNV0tVaC93RCtHNFJwN1pJY3NGWDNlKzhtNGZoaVBaRkgxRUdw?=
 =?utf-8?B?MEJNWGNWdSthQnF0bVBqaUMwdTVIWWt1WThIS01hNGF3ZGdJcHZ3WUxhNGRL?=
 =?utf-8?B?S2RaRFc4aG4zdzM1dXZ4ZnovNWRpMTB6K1ZQTEkzbVk3WTNqdWticEpPbXBW?=
 =?utf-8?B?bklYM0F4ZHhhLzFOWnBQSDNYdUZqR2xlV1ROY0ZhdCtBdllyNy9XNHNicXR4?=
 =?utf-8?B?VW9TTWdvbjRNcWlZcE5ML0JuVHhYcnlRa1YrWXRaL3hBQ0dIMU1yekU3Vi95?=
 =?utf-8?B?MlgxNHpvQ0F3djZhNTA1WFVqTGxEMXZMTnFnNUpHRUwvcjJaNTdqZkZTZGJH?=
 =?utf-8?B?QWd0bDBlUWFQaCtzdzBzbFRmeDVmeHNrSTlOOG5NZTF4NU5sZHkxU3lvb1NP?=
 =?utf-8?B?NEt3cmNrQWpqTEVmV1d2WHZsWkdnejJEVVJvekNZV1ZRS2JWam9uZ0gvY1lk?=
 =?utf-8?B?U21sMDNOVHpsb29yaWZRcmdMdTNOdXVKZXM4dFo4NmRyTjViVzhMRDNCZnFB?=
 =?utf-8?B?YTdiWHNhYXprMHJjbkRObEViNmhKdUk0ekdNdkhXUEtIQXRZOHpqRjVvUUxG?=
 =?utf-8?B?c3l4eVplYmFxaTM3MFlwbFN4SlkwbE5VZHJFVjRlWXRhbDQ0WW1JMFFabUlJ?=
 =?utf-8?B?eHUxSTR1cWhYOERwcW1sczRMSEIvZ212R3psYW1PTGFadktWRDRiNGZMNStp?=
 =?utf-8?B?dzBHQXNtbDUxM0JMVDlWYWJmcWo5dXdpTys1RXk4WWFJc3N2dGpVZ29qMjVU?=
 =?utf-8?B?dlZiaXo0Z0IvL3JxUEpxNU1wbmpyY1pnNTd1RzZEZzJSKy9YWEpHcWlkY0Na?=
 =?utf-8?B?YlFITERVZzUvZ21Ib2tNRHhrUkRsYjl2dGJlT2hnT0t0LzlqQlNoYldzeTJm?=
 =?utf-8?B?aWpHeXZSdkg1RXg0TzFPTlZJdG5HQmJOSXQzNU9IdmNTbTF5RGVrZG15ckty?=
 =?utf-8?B?M0ZtYXZPRzdHRHJmU0pnQVpEWlVvcVVFVzcvaC8xMUlYYXJONjVEZ3N2VHdE?=
 =?utf-8?B?MkxiTmJWT3YvNXRNVHdrbWY0YU5JRFlEYmRmNDN2eXBvR2hpeWtaeFdZbjFq?=
 =?utf-8?B?UHcxNnpYZVh5UnNITkVhd2FMOW43aE1wVDlSQzBYeGlNRmY4aURHT2txWTlS?=
 =?utf-8?B?SG1GUXY5T0hSV0I3NzkwYUpHcmw1blhWTnZUWU9zU1gwMCs0UkkzZzFqWVhN?=
 =?utf-8?B?U2tmaXNjNFQwRWZwaHd3U29HL2JySmRhSW9HQUlINzFTRHlScitYNkR3SFF6?=
 =?utf-8?B?TjhOU2wwK29RSWNBeFlJc1dXclkrN2NYS3dIazZ1b1RkYjNBTm1wYzRVaTA3?=
 =?utf-8?B?MkZKZzJ5UmdlK2hic2xxRlhsOGs3T3ppKys1M1J0QjhPZ012cXVKQktuNyt4?=
 =?utf-8?B?WTRsS1BlZXR4SlNTQVNYVmFwT2NPZGdjeTVuNnpvWHI5QWV4c3N6NXd6VitN?=
 =?utf-8?B?eVM1NlNTZzVqbndLZkxlN2hmcjIyNE53ZXBURW9ZOWJLUFhqOTBQL1lrRkd4?=
 =?utf-8?Q?dSVkNr6nVhA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clZyQ0xjMGRQTzVHVGg1T00wbHhMNldTdUdUeGxpcXpPRUUwbEZ3Zis2Qmd3?=
 =?utf-8?B?ZXJqaXY3TUdkWW41d0FzTFlaTmErdmZ2clkrSXNlSUxJK1I5NUt3V3ozVC9R?=
 =?utf-8?B?aGdzU1ZNQ2lPWmN6eDlkZVE1OUlHV3JZc0ZkbmM0OHlNQnlWYTdpTnd0b0Zn?=
 =?utf-8?B?UGk1NS8wSE52dWJsZVpwdjlYdEU5OGs1bE9vdE1rcnhPelFHa1J5YVZMYTBS?=
 =?utf-8?B?MGNpVC9qZGVuVURMdGZuTDlZQWl3Z28wS01ycFJxWGM2OHNrUW9LZnlYcVlp?=
 =?utf-8?B?S3pZYmV6aEdDdjZoK0x3QkpYeUF6QWYybUVJY0VKOElhcUtxOUQrMGxtZjVn?=
 =?utf-8?B?RlFrYTd1UUoyeGMySkZEZmFvOHNmMmJhR1VPc3F0MW9jRHUrUkExRkVpTFZS?=
 =?utf-8?B?cmNmVHQ5cmcrTURZZG4wTzh6a1B3MVQ0cjZWWFZkeFdiWEJzT2pYK0RIeXh5?=
 =?utf-8?B?OGdJc3lvOExVcWx5TXBTSGtZSFlFN0p3NUZZZ0k1RlJrTE9lY3pMR05UWnpU?=
 =?utf-8?B?emg2RVc3Ym5VTitEeTdKaXJzRmRMMjFYNmxGMzVVY25GbGg5aDdZeGRpZGFl?=
 =?utf-8?B?SE9uVWF6aEpHSW45a3djdnlITTU4SG00MzY0aFNtYzh0K0JWdWRjQWl0aGVW?=
 =?utf-8?B?ZG1BWXhHd1EvK2JIdVBOMjhRMlp6ejRldVFsa2RSM0g0V20zMngyd2c5U0NR?=
 =?utf-8?B?ZjdhUjQvblFBd0ZSQzdCVWlYM0FIdXFkSm53bUhLS3d2QUhNVWowNTg2YTlB?=
 =?utf-8?B?V3NnSXpXeDNFSXkyRlRFakJ2T0VJamRDa00xNU5BTVBrOXV0ZE1lRUpZQ3gw?=
 =?utf-8?B?Zk1PVXdobWp0eUxOa3ExdFRSNEJRUVZBUlpraklVWnE5OW41Vk90T016cENz?=
 =?utf-8?B?UFpmQU45SG5xbUI1elE1ZjFBTXF3SitHYy9QTnIrRE9oenZjbVM3aWRvWXRo?=
 =?utf-8?B?RFBkeEtXa2dDM1pJMEVVNnJCOE1oK3A0NFQrd29MNzNFU1p3dHhwRXg5Tzdl?=
 =?utf-8?B?ZkFlYTJLb2FiamowSE41OGFXUkZnRFpjaUNLcXM4VFhuQVVjcVhsSjV2VGkv?=
 =?utf-8?B?SmZxOXlmN2xKSXZGbG5FN24rbG1qUnBLUVpqQnAxelBaUEhOZmFBUS9xdTY1?=
 =?utf-8?B?TlZRb29ZY0dhdGNla0RVM1E1Y2E1N1NsS0tTdVZ5TXh2bVZkRnBGV0ExT1NR?=
 =?utf-8?B?NG8zVCtpMHA5ZGErVlpWQWxMV3NyRTRaQVAvQk1PaG95WEVwNVVsMHVXQkhK?=
 =?utf-8?B?ZnRIM21na1ZxN0g4SEp4TDlaSTJsZnVtYkRjOVZqNCtZbWQ2cWhSbUJNd3FP?=
 =?utf-8?B?U1FENFhGWVFqVXZ4TE9KeWpqTndtU0V6VXpPdE1VMjRLVkg1WlZrcUFpTzBa?=
 =?utf-8?B?U1V4eERtZ3V6THpjYlN3WVdPYThZdFNCdGo3Ym5maFVzQ3RObFhXWHgxTUhr?=
 =?utf-8?B?NFo3N0ZieU9wOG5QRkFiMDRUeDhCcU9RcHVSR1BSRnVVYU1GVGVweXhKb0p3?=
 =?utf-8?B?akpPL2ZqUUhPT1dqTm9iYmxLUmFjV0lXaXdRWGxFdGIvRjl2d3JGTHJITStp?=
 =?utf-8?B?eW5aaUNqSUJzM0ZoRzQ0WjZNcTNYcHdZU2NJWnJXUmlWdnZiU0Z4akcyLzNP?=
 =?utf-8?B?MGsyS0lDVEY3QzJMNUxFcFNQR3VqWHN0WXFUU1F1ZGdkWnZsUTBsUE9iZVZw?=
 =?utf-8?B?Q0tobEVvd2N0UG8wM2crWmx5TC9XbjdIZkMxRGcxTDcxbnhWbSsyb0x5Y0VI?=
 =?utf-8?B?eEsrVStLc3RIMXRBZ0xSdzYvUDdKSG82MFk4cWljZGNRaWpUUUxHdzN1cXNs?=
 =?utf-8?B?ZkhvUm1tbkUxN0h5UVM3R1h5aXBvVlpmSTVBS2NIYUVlMHNyZm1IVGIxMHFR?=
 =?utf-8?B?dFc3SkhrQUg2VWg2K1ZvWWdybC9BZ25NMDkxNlB2SEI1M3hUUC9Wb0dXL3dI?=
 =?utf-8?B?enZaSFk2cFVrcXgwUGVLTkpLK29ZdUhTdVFaRFZ3ZlgyemlUa1lBZkxhQkFF?=
 =?utf-8?B?bUNqRUJURzAySmFDNEJUOXFKb1QxRjNYOE9NUktkRm05UEhXWjQxb0hkQ0hi?=
 =?utf-8?B?UXhIdjQvcmRHOVNERHB1WWtlYzNKQ1VxMGlYNlhNWjNMbEMvNWd1WWxHa2NY?=
 =?utf-8?B?eHFyK3B4S1NwaHl1dC9DYkV2dlQzV3hYVmJSMGJkM25OUTRWY0NPNjVUeWlE?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9c3d21-1c52-41db-1f07-08dde101d4ae
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 22:26:53.7877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0lLiRt5dgqoCg0iwDB7hcSFVpEYoZDdTx9I/3Zv/fO3WPT5JS540JDgvqG7Cb8zIJPVYBp64dlzg/cVhguf3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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



On 2025-08-04 5:21 p.m., John Harrison wrote:
> On 8/4/2025 1:14 PM, John Harrison wrote:
>> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>>> Add GuC crash dump data empty check. LFD will only include crash dump
>>> section when data is not empty.
>>>
>>> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_log.c | 60 +++++++++++++++++++++++++++++++++
>>>   1 file changed, 60 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_log.c
>>> index a8910211c579..f5f31f15e7e3 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -502,6 +502,65 @@ xe_guc_log_add_log_event(struct drm_printer *p, 
>>> struct xe_guc_log_snapshot *snap
>>>       return size;
>>>   }
>>>   +static int
>>> +xe_guc_log_add_crash_dump(struct drm_printer *p, struct 
>>> xe_guc_log_snapshot *snapshot,
>>> +              struct guc_lic_save *config)
>>> +{
>>> +    struct guc_log_buffer_entry_list *entry;
>>> +    int chunk_from, chunk_id, to_chunk_id;
>>> +    int pos, from, to;
>>> +    size_t size = 0;
>>> +    char buf[GUC_LFD_BUFFER_SIZE] = {0};
>>> +
>>> +    entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
>>> +
>>> +    /* Skip zero sized crash dump */
>>> +    if (!entry->buf_size)
>>> +        return 0;
>>> +
>>> +    /* Check if crash dump section are all zero */
>>> +    from = entry->offset;
>>> +    to = entry->offset + entry->buf_size;
>>> +    chunk_from = from % GUC_LOG_CHUNK_SIZE;
>>> +    chunk_id = from / GUC_LOG_CHUNK_SIZE;
>>> +    to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
>>> +    pos = from;
>>> +
>>> +    do {
>>> +        size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : 
>>> to) - chunk_from;
>>> +        u32 *buf32 = snapshot->copy[chunk_id] + chunk_from;
>>> +        int i;
>>> +
>>> +        for (i = 0; i < size / sizeof(u32); i++)
>>> +            if (buf32[i])
>>> +                break;
>>> +        if (i < size / sizeof(u32)) {
>>> +            pos += i * sizeof(u32) - chunk_from;
>>> +            break;
>>> +        }
>>> +        pos += size;
>>> +        chunk_id++;
>>> +        chunk_from = 0;
>>> +    } while (pos < to);
>>> +
>>> +    /* Buffer has non-zero data? */
>>> +    if (pos < to) {
>>> +        struct guc_lfd_data *lfd = (void *)buf;
>>> +
>>> +        size = xe_guc_log_add_lfd_header(buf, GUC_LFD_BUFFER_SIZE);
>>> +        lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, 
>>> GUC_LFD_TYPE_FW_CRASH_DUMP);
>>> +        /* Calculate data length */
>>> +        lfd->dw_size = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
>>> +        /* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
>>> +        xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
>>> +
>>> +        /* rd/wr ptr is not used for crash dump */
>>> +        xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
>>> +                         entry->offset + entry->buf_size);
>>> +    }
>>> +    return size;
>> Can't help but think that this is all way too complicated.
>>
>> The crash dump buffer is never going to be more than 1MB. And that 
>> size is the smallest we can allocate when using large units in order 
>> to get a larger log buffer (because the units are shared). My 
>> understanding is that the actual size used is only a few pages 
>> (currently working on getting a definitive answer from someone who 
>> knows). So it would be far simpler to just save the crash buffer to 
>> its own single, contiguous allocation in the snapshot with no chunking 
>> required.
> Just got an answer back. The size is needed is 12KB currently but will 
> shortly rise to 16KB. So a private allocation in the snapshot will be 
> sufficient and is definitely going to be simpler than going through the 
> chunking stuff.
Nice to hear no need to handle across chunks.
It could be a single buffer print.

> 
> Unfortunately, that also means that our current default of 8KB in non- 
> debug builds is too small! Can you post a patch to bump that up to 16KB?
Sure, I will. As it will be out of LFD scope, that will be a separate patch.

Regard,
Zhanjun Dong>
> Thanks,
> John.
> 
>>
>> Then all the above complication disappears. You get a simple "for(i = 
>> 0; i < size; i++) if(i) break;" to check for empty and a single print 
>> buffer call.
>>
>> John.
>>
>>> +}
>>> +
>>>   static void
>>>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, 
>>> struct drm_printer *p)
>>>   {
>>> @@ -522,6 +581,7 @@ xe_guc_log_snapshot_print_lfd(struct 
>>> xe_guc_log_snapshot *snapshot, struct drm_p
>>>           return;
>>>         xe_guc_log_add_log_event(p, snapshot, &config);
>>> +    xe_guc_log_add_crash_dump(p, snapshot, &config);
>>>   }
>>>     /**
>>
> 

