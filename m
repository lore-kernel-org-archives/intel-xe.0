Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE6EC021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 17:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055F710E932;
	Wed, 12 Feb 2025 17:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHsM9fvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E0010E090;
 Wed, 12 Feb 2025 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739380921; x=1770916921;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=wzqfFUYoTroDPE5N2ht94byDDVG7A3XLz3+WQH93cho=;
 b=eHsM9fvudXhN8wLVBgt8Kr1rpyNFbWMgeVrfeEZEdymv6ZdaCOdW+MWO
 fokDGjAO9expKgAcdYhfufTzgTS6CrxEkmwLcPlW68+BGxxHhvKmvWgNR
 Qtgf8XBU48TNXmWi0FSsFi91hWqrjy/tTefRngdqA8xZt33OwuNLuRBp5
 2CMrxP1YnLXc2Bc+EF2X2VQsSuGy9+jaTwf4dTxz/felWzbpLvVL3BWrF
 bzlbSWewyXJd7B3XXvmrV7HMEE1icGjjpt0r83Hpe2RJQIas+jpsfEAH3
 k34LzW1KnKfgx5e87R6zYZeyl4sRSRoG+ciyvVDJXbbskU9+TKyIj9BNX A==;
X-CSE-ConnectionGUID: U5NarmQpTeiwXu1XRVfLcw==
X-CSE-MsgGUID: jUgNt+tSQryVB2X3SgG3Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43985452"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="43985452"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 09:22:00 -0800
X-CSE-ConnectionGUID: OpnD+6TnSzOumJOOkAEPBA==
X-CSE-MsgGUID: 4cuJKgGjSqWYL1KXUGpuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118056302"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 09:22:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 09:22:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 09:22:00 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 09:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UftioECFfrk01RFkEh1eb8euuoKs0qZEWPaUb9lu5C9opHeo23zVvNV5LlQYfThcgiRoLMjLemkLFvcUte94kEKbWlzCzSS8MEfU1sivi+nZhemB20zTsBTpBCK8ukn83u7dhJXnwBroYZAo42IAvqZxSy8ISImfJmSxvkEMGjQuF3CnhLLBeU4+tA+FjbAQ67IGQhDOUK39uf3zKBG9lJn+TWb8ciAaAyefuaGwC6leSkjBMEhOY5olpPaCYpTgpb5+tZ6ONVAmSeMfs6B2BAQhTouw3IZrgGXo2rp4li9a3DYzeSJVjmMUzWXHK7u2MaNzXLQIjn7aXftvKgbEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nj8GL4OKml8mMoU4MUlpRF6w34OpjPBXwKlmsNAmBxc=;
 b=XJ0YXLtZyta76ZzzBPIScIMNWLhGshpBPPnD5ta4a7+xnb07zCBGQXryzvqQb0dtjIr67Orl0PdAEm8jmdQM8343bKbUqGMK3aTikYU6c15/MwrX6p5uKLhfV1AotxFbOf5NQJlNQFzHZiDIg77owg/bUTTBcQAqFHNcfPjlnTvNlEbHP1vmcxHUMueEqS1o9u51ExrZk2aN5aXtZgsZ9nzJB9GA9IOaOxAzldqlb7K2UgYAEynbzhQvOjx9kKqZ6qhq7Rp0pNViLR9RZ1tXIhH6qb2zX+2hMupAl8xmAzVCQVED+nGsSKWMNm/Dz3yjUC+r+BK3kXwlkdcTn3+76Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 17:21:35 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 17:21:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <877c5vytme.fsf@intel.com>
References: <20250212132658.323640-1-gustavo.sousa@intel.com>
 <173937676007.1347988.12791820742293922574@b555e5b46a47>
 <173937954545.145254.15387044598135714895@intel.com>
 <877c5vytme.fsf@intel.com>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.BAT: failure for Improve type-safety on
 POWER_DOMAIN_*() macros
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
Date: Wed, 12 Feb 2025 14:21:30 -0300
Message-ID: <173938089095.145254.2697060853560058461@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 09688ceb-dfdf-4c14-6d95-08dd4b89b389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkQ1NDFLM1JFV2RiaXRmK2lqNVNsVTVhTktEZmZucXNjZFFqM0FlaEpZMU9o?=
 =?utf-8?B?cGlJbHpnZHh0L1J2WEdTUnFDRSt1MjZLaTJsM2tnb2diVEtmbTdaT3JGQ3dU?=
 =?utf-8?B?WmJDVEx6alFHUHB5YVUxWXlQZGdOcHE2M2x1TmRPN0dqNVA0WU5qdEVmMnBK?=
 =?utf-8?B?aUZCaTZaa0ZYYWRTSS9nWmNBdndDS2hhN1o0aGY2RUFrL1Nnb3BnU0cvb3ZF?=
 =?utf-8?B?TGMwTEVJYVplYllsdFpRRTIzSXY5Uk4rLzVpbmpWWXhwYkZWdHhyRnQ3L1d1?=
 =?utf-8?B?R0NFaGZUbDZlVXZzRDhjOWptZHRkblE4NHdMSHZ3ZlBkOWNSR0JHUDZPbnNC?=
 =?utf-8?B?b3dUeTdOd25tcUNZUmJyYWh3Z1J5U09jSHQ0Y3JyY0NqMVZDcTZTNWZHbk1s?=
 =?utf-8?B?a3haNkl5OXVXU0VhaW5sMVlvbWlKZ0lWVVd0N2pBdWlBMkJIa0YvV2w2M0xa?=
 =?utf-8?B?NGxHVnZjeHlQV1pqa1NmVjVaNlllLzhTdnpNK1poSm5Bd1JGV0l3M1FFK3hs?=
 =?utf-8?B?M1IzaWdxR2UrU1NEU1RPd3luZ2dUcTlVajl0bUpIbXFkVnNEWjJiNHh6WTBw?=
 =?utf-8?B?K3FWbTN6M2ZLeWxRM2tjQ2YvZVlyblZuaS9qNFlIem9aWlZWYk5JWlFDODhB?=
 =?utf-8?B?d25xZmFDekNBTUhFSWVRUm9jT1ovSi9YZXU5eTFRVUV1SDB5Tm1wQUQ4ZU5K?=
 =?utf-8?B?ZlF5QTdUSmdUZFhja0hwemdSdE1SSm9FOGJOOGJDUHlQd2ZOY1crSksyRThu?=
 =?utf-8?B?TTVLWjNZWWpzYS9tMTlCNHdCVHR1RFcrZ1psdHl6dTNYbWlibk93dXhzK1o2?=
 =?utf-8?B?bFdrUTZHUEd1WjN0OVBrQ3FLK1FBblU1VHVWMzFoY2hTRTY5Q2J0VVNlTisr?=
 =?utf-8?B?a2MwZ28vRTZVd1lQTm5Ua1JnQ0lUQXpTaVVGcmk2NG9PYnBuZWZMZUxDRXdJ?=
 =?utf-8?B?a2ZtVkwwWTdNM2dQcUtFRm4waWtIL0I3TDhZZXFRbzJOOXlCcC9QWm9tV1ZQ?=
 =?utf-8?B?YXR3NW1pampMUE5ZWm5uN2E2WEU4RU8rRjlhcjRpUzl5USs3MncwN0g4em9u?=
 =?utf-8?B?Vy9pUEREMTdSdEhaMDJXTU80NHVsc2NwTmFWTVJDMmo1Z2d1bVVlYXNjMHpF?=
 =?utf-8?B?VHdGdHFXYUE2K1l1RExBR0JXKzA4dFFCV1Nsb0pjTTB1LzNHWlc0NUFncWNB?=
 =?utf-8?B?UjVGUEpjOCs1Zjd6TVA5YzJRRlZocEIycmZTMHgveEsySENzZTJXanVSYk9E?=
 =?utf-8?B?Vy9oL0xLaGw3U1ovY3RLOUIySTRuV25WUUV4M2J6V25NbXYxbTdQQkZqK0NS?=
 =?utf-8?B?QkZVNGtvbExQSHVBSCtMUlRIOE5kOFZObGdkdzNrS0xuYzhzK3dnV2Z4VXB2?=
 =?utf-8?B?TnJVMFM0dUF4OTZLNFhZbU1PUCtsQ2hQdm9ralFkNW83SDQxZGZXNk1EMEl0?=
 =?utf-8?B?RDhlV1pXTGJ3Q0w0bHVEbXd6V2IvaS9LSDhOZE13TUt0N3pRL1RlYlJSUnhy?=
 =?utf-8?B?WnJvYkVydDFFa0RnVVEwLzMvaTlrVUVnYUFyV3d1UmY3ZEc0bXlUaDJWaHRw?=
 =?utf-8?B?V3puOUhWVFZKV3MzenZHMzZGdlNMY29Qb09uWVJEcEE4QVNyamQwS3pGTEJN?=
 =?utf-8?B?RWhpTDVRZk4vbU1sVEpLdzBLdjl3NTN0RVlLUk1xUTFSV0EydVVBNDZXaXBq?=
 =?utf-8?B?bkJoYUlxOHlucGQwdU9saTQ0dTg5dmpSeDcyRzRuc3d3TDVPejFQRm9qWlUr?=
 =?utf-8?B?amtHc3pEQWtnc2E0V280YkY1T1Q4UStWZVV6cjVvbG5NcGVmYUFyZUtlNGxK?=
 =?utf-8?B?b0FuTGhPTTRxci81Z1ZSZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2RsQ1RIZ3NPVnFIa2RuMDczdkhvb29kemtoVlltMHQ4V0dwQkZpa2RSMksw?=
 =?utf-8?B?QkU0ZnZrUXYzVTg2UmNwNWovL0xSa0VMbW10OUcwMEJCdUVUSjNyaW5qY1pN?=
 =?utf-8?B?Q1Iwc2JKay9oanFhZUNxQ1ZMc1dVLzVOcVNzTmJUZ1hneVE1anB2VFFHTTJ4?=
 =?utf-8?B?UHptcTUxK1ZBcjRTSUFFem5GK3BsK2xFMEtqemJUZU16aTlxY25rVG9VWXJT?=
 =?utf-8?B?L0dvcGhrQURTZHMvUXI2a1BQbkgrREVGNURnOTJLcGFEalJqUlFvczMxNlY3?=
 =?utf-8?B?U2FsczJjVlk4RTBPUmZZa2dSZHozK0paWXY5MzZOKzcvZExNU0pmWmxPNTI3?=
 =?utf-8?B?aDlWbTJ1RmgwejY5aGllSjQzd2dURDF5VTN2Z3kxc3lSbytLTG1tUnFzanJu?=
 =?utf-8?B?OW9UU0RvREFtUGd5VWdublFCbm9yRVpWK3NNR1RxSXkwZWREZTZLMFQvdEEv?=
 =?utf-8?B?WW5CWlkvUitadm9IRWgxT3FYbitNU2F2ZFZxbFFqVXlLdzh2UlUxQ0p2Yk1s?=
 =?utf-8?B?ZE5SVjZlQnZpNldYWmNQSzJqQ0hYOUd4TWhjNDYvd3ByODE5eTZ1Um1pZ0JG?=
 =?utf-8?B?ZFVsTk9rQ0lkZnYwZEg4THVqOGZidC8yWVBJOHZaQkkvSDBDU3BEWWpRNG8x?=
 =?utf-8?B?TTgxMk1hSFlVU1FkeFFpVkp1WVlFcEJxTTY2UTAwRnZKdUJGQUlMWk5COG9a?=
 =?utf-8?B?SDA0cHBTKzJRejVFd3lxNm1IM1BzNVI0dkpkSGRuZzVJOHQreHVndzBPNTIv?=
 =?utf-8?B?THFlVzZvMUFObjlFR1laNXpZSWFvU2xrQms0T1dqbWFQV3RoZk93d3Zhcmlr?=
 =?utf-8?B?UXNXaGFqN1pyV0JsbnJPY3pCNzRyR3VDV2cwdzN5cUkyWmZiSkJVSHZjZnNZ?=
 =?utf-8?B?MjkwbC9WMTh1bkc3REIrWktLVjhaUlBWM1ZvaFQrMks5N2dJa0NVV3MyNVgv?=
 =?utf-8?B?cEpONnVBT0w5Tys4OHlVUzJGbm1vV0hrMWR0V2Z2T215VGhFNHNpdHVIV29m?=
 =?utf-8?B?c0N6VXZudW1zd0psd1JQTXlaalBFMlhhOERQOWUxSkt2L0duUUxMMzhIWDh4?=
 =?utf-8?B?UjhKQU1CcytUZjZMckxlQkhtRHNmQnZmeDlZcXh4V1k3bGd5YVhmeVJNNWVt?=
 =?utf-8?B?TWRTNE9LdXorclZiQlUvMEdDbG9EQ21hTXMxMzNXemYrNlJZeTVJeGtzQkdp?=
 =?utf-8?B?M0FzUmtaZUxoQ0E2empWMllEVHA4N1ltTUZXVHBJTjltaVhSTmVmYmJuckJ3?=
 =?utf-8?B?L0ZBRnhPbTZHOHpYTFhtMUMzeUVKRDNSVVhvWVdXbVlTcVNaUjhlU2ZuTy9S?=
 =?utf-8?B?Q0FrSXpHbkxtUEorM2NjUlZJTTF1b1ZSbjZCWTdkKzNhS2E0aG5FZEtXQzJl?=
 =?utf-8?B?Q2ZTNUFTWlNqY1F3bjF2OThXRm5teFN5Wmhxb1FDVVlYKzgyRHJUamdRa21Y?=
 =?utf-8?B?aTZvaDdCRi9kazBBejdFN2lZaFQ1MmNUbkhzemJicm5UMU9zYzJsMGdJbTF2?=
 =?utf-8?B?MjNlOEdFek1lczVYNUZiS0VCVC9GdllndU16ODJWdHlhREIxT1ZGRjJ3d1Ra?=
 =?utf-8?B?UE51akNCOHd0M0MzdWZ0a3VxeURWN1FNQURheTZ0b3RiSXI3RVBIb0FzNU52?=
 =?utf-8?B?N3RxT21KNHRVcVUxZTNsdEtHZDRsSmFhL0xBeGxnWDVqUEdHUlAyLzNIY1Nv?=
 =?utf-8?B?bTROeXpJa2FUTkpmWmNWZnAvazNicno4UTRpeUxiWXE4TFBBVWM3akNTNFZs?=
 =?utf-8?B?eU44bFNmcCtlK2dBMEhsalhEV0xzM1FUM0JqQ3cvU29HcXNBVGNycVIrM05z?=
 =?utf-8?B?dnFVbXNPSWJnRXpQU1dVR1BnWStwZjlNU2lLNGdSZWlLUlFzNFI3Q2pKNXlX?=
 =?utf-8?B?c0hQM1JMSUg0SkFybTFUNm1uYzRiUGcxbFJ5SlQxQ0FnZmdITEg4R0w2R0xS?=
 =?utf-8?B?eGJSS2twYXRPUHJUQzRRd3hKUGhmQnI0LzIxR1I1dk1KNzBLWXJXeDVvZFJi?=
 =?utf-8?B?RVQzNzdxazB2M3Q3dzU5T005L2w0OEFqT0FoOFpQNlpFTDhFaGVYZzdZdHl5?=
 =?utf-8?B?VWZ2ajQwbkFLYjE5cDdTRlZ3MU1PWXlJSm1mUDY3UzFocTNSb1FDdVZ5eHhV?=
 =?utf-8?B?ajlxM0xWdjNQekZJbW5rRW1XaUwyU3Q0N01lNnRsMDNxdlB0a3BKWTlWOWZJ?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09688ceb-dfdf-4c14-6d95-08dd4b89b389
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 17:21:35.2294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKLRAauea9YuMAOEkr9Lnb/yaLB52ASIUczdG+PWU6KMdksgVx1pj7vHZKe0M1afYY3r3Butj+L/VwBrOIRwCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
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

Quoting Jani Nikula (2025-02-12 14:12:41-03:00)
>On Wed, 12 Feb 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Quoting Patchwork (2025-02-12 13:12:40-03:00)
>>>=3D=3D Series Details =3D=3D
>>>
>>>Series: Improve type-safety on POWER_DOMAIN_*() macros
>>>URL   : https://patchwork.freedesktop.org/series/144727/
>>>State : failure
>>>
>>>=3D=3D Summary =3D=3D
>>>
>>>CI Bug Log - changes from xe-2647-a05c910166dda7fc8b510e5c9771c3bed3fbb9=
06_BAT -> xe-pw-144727v1_BAT
>>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>>
>>>Summary
>>>-------
>>>
>>>  **FAILURE**
>>>
>>>  Serious unknown changes coming with xe-pw-144727v1_BAT absolutely need=
 to be
>>>  verified manually.
>>> =20
>>>  If you think the reported changes have nothing to do with the changes
>>>  introduced in xe-pw-144727v1_BAT, please notify your bug team (I915-ci=
-infra@lists.freedesktop.org) to allow them
>>>  to document this new failure mode, which will reduce false positives i=
n CI.
>>>
>>> =20
>>>
>>>Participating hosts (9 -> 8)
>>>------------------------------
>>>
>>>  Missing    (1): bat-adlp-vm=20
>>>
>>>Possible new issues
>>>-------------------
>>>
>>>  Here are the unknown changes that may have been introduced in xe-pw-14=
4727v1_BAT:
>>>
>>>### IGT changes ###
>>>
>>>#### Possible regressions ####
>>>
>>>  * igt@fbdev@info:
>>>    - bat-bmg-1:          [PASS][1] -> [TIMEOUT][2]
>>>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2647-a05c910166dda7=
fc8b510e5c9771c3bed3fbb906/bat-bmg-1/igt@fbdev@info.html
>>>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v1/bat-bmg=
-1/igt@fbdev@info.html
>>
>>
>> Hi CI Team,
>>
>> The changes in this series are non-functional. This failure should not
>> be related to this series.
>>
>> Could you re-report, please?
>
>There's a non-functional change, and the report might be spot on!

Yeah... I need to go and have some coffee...

--
Gustavo Sousa
