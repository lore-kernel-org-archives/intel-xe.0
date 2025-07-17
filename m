Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBE0C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13F110E893;
	Thu, 17 Jul 2025 19:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4jo6ff+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9610E893
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752782157; x=1784318157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=W8L7/IorEfOgQ9UkL8GOZozHWr2xxSKv4wJULuhjKNw=;
 b=U4jo6ff+um3GdJ39t469HrLmYL/TVKW80tXkKfcK98gfcxnOdLDRq34/
 6d61fkL2v1+MrF1AylIP/LGRjUV/9VF12OcOP8f8/XsPGYym0ZgDnLD7t
 osTt0XszwLEQTEZ3lrYEJmrGlUparokaUNPf7lH5JFjgpuO+SeXEkE2qv
 73eFp75t7ZMV5055VHBDHkbUPk7QrCe0LQ2GLpmLrgS4vBrisfx+jI8pw
 +PrJQZSR3ynpMIcFl45hi2mveGR/FS+VwRvNeNQS2v2jlhByoyNJDTKNK
 K8oYG1kZw4fX/xEEmP2YUdV0ky1pi/nu/jwG5Ke3rQTj4dI4fEirW3Hvi g==;
X-CSE-ConnectionGUID: ds7cKdhgRfyesRI24nEmmQ==
X-CSE-MsgGUID: MIeGvTkfSVyJKnJuvYodiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54175798"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54175798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:55:56 -0700
X-CSE-ConnectionGUID: Okr23Tp7Qi2knkoF6tqarA==
X-CSE-MsgGUID: G/6CyomsQgK+C25GtJfmYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="157558587"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:55:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:55:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:55:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:55:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGJo7f0+lpyhEYLs8lHZ1HYelgcS1C3wl6D5bgeEMwR8MksXQzbdONZD7aBGhVW/XdEjE7R8Y1LBSFrc3kJEU4ymsNkHUIZCKtYhUthnlpnkir/I7CK2IarDcroAb/CxJm3giCC19bXW9pJpJOsJ6NRBu0vw2Nc3lyda8gm1ur/9c7+Gitjc9EW9YrIzAUH9pXz/lAkLbcKLsEgzZtJYdJY+nTe5wkZ9HuRoJIFuS/eTG7Zc8wmjY5t00VwWfmssQZNDVjzcX/UVAgBThGyrTd23gfHNnYsIKN3ooSAX5z5UzKGyk4dSNYSDz0q01pdnW8p+4Gf5oJwRUx9dyp50+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8L7/IorEfOgQ9UkL8GOZozHWr2xxSKv4wJULuhjKNw=;
 b=u0unujWUSpN9ShLilQManM0zjTxtfTSp++9LKharHK7cogCP6r2GbWi61XSSDndmqXA21plBGiK2VL+8P085dr3Dk4E19QjQFhgvK2lL0TO3f7yC3+Sn/eNqqCO4by+w0bfnmDy0TYBFrajG14pIJSLvpUyW8ZE17AaeYj5rpu99vkM0Urq2iAeKYhgNON8iWIyRGQ+CH8RqRsA+T+WV3avMg9ucExN14p0MFfBUCZQHlAH0tZvJL11szbqE5+bzhomjzAozeniB53gmG2UhF7MhG5KSiXEZPumSuVXvrz8KUcbwunqublVOJGK5Qijdc1CeCdEuBpBFr5q4VQmZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 17 Jul
 2025 19:55:21 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:55:21 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 4/9] drm/xe: Create ordered workqueue for GT TLB
 invalidation jobs
Thread-Topic: [PATCH v2 4/9] drm/xe: Create ordered workqueue for GT TLB
 invalidation jobs
Thread-Index: AQHb66rGJ/Awjb6nt0etumwZl/WB5bQ20hyA
Date: Thu, 17 Jul 2025 19:55:21 +0000
Message-ID: <87aa32cb0f684bddec35bd1d33e4765fe0bca173.camel@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-5-matthew.brost@intel.com>
In-Reply-To: <20250702234222.3278264-5-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS4PPFABF58482A:EE_
x-ms-office365-filtering-correlation-id: d924ed34-5d2a-46e2-bf2f-08ddc56bdcb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SW9qWFc1WXpWcVFvUmpDMEp3VDJRdlNYaGgvOHdnd0J5UExFSElQZW9GOGVQ?=
 =?utf-8?B?Z3RBMjhlWGVhbFhGNXpENHhubThXemtSSENDN0IycnBaWlpDQkVKUXN4VTh3?=
 =?utf-8?B?N0xMWUY3VHoycGdZczlpK2ZHY1lNZUtjYzhNMkU4eEd3WDh1a0JEd2dWUDdC?=
 =?utf-8?B?K1JQS2orZU1JZ2hFbjg2Rlc2UzhicWIzUExBY0NYNHBpY0s1VmxubDlneXRD?=
 =?utf-8?B?Y3hmV3MvNTZ0M2NxYVNQN2FPQ2JjOG9qYXF2ZEp6ejNJeGIxWmNVbFhpcU9B?=
 =?utf-8?B?RnQyQ0M4bjNvWWxYRHNldUFPcFFEUEZpYmtLS3lZOThhQU9LWXJWS3lZc3I3?=
 =?utf-8?B?RVM1b1FWZjlQTWV2RWU1bkpVOWhjRFRYVGVtV1ZlU2pBM3JvL2UyNk01OGNm?=
 =?utf-8?B?R1UzY2xxWmJrUURJK0p5U05MOXpoSGd4ZjVMYnNxODArWFJxK3E0WnBNQWdR?=
 =?utf-8?B?RXFxcGpBaVN5TXZyd01Hd3QxenpJeVJtcE9UUXBzdWNGQktycy85RGdFdEp1?=
 =?utf-8?B?UXFLZ2ZxRm01WDNqTmw1eFdKbklCT1gwamgycXExc0dlZmhZR2xBVC8wUGpI?=
 =?utf-8?B?ZTBHclpSRG40dVJHRUVEbHVVVCtFOWd4UURKOVowakNLVVJTbjZEeXZaV1Nv?=
 =?utf-8?B?MTk5cmQvZ0ZoUWsycExBZU9WcThxMTBKY0xVOUFEY0VJSm5YZmRLTVRYOElE?=
 =?utf-8?B?dDJCLzE3VWFTd0V1eFNvV3ZPUk9jeGV3NWZIcUMrTzMwWEZ6eEMwZ2IxejRa?=
 =?utf-8?B?NjVxcGdYVzc4K0Q5S3Y0U0lJb2xEWTdLSktVeGpkSGdsVlk5bmdyOURjdU8v?=
 =?utf-8?B?OWgxT0RxaXVzTDl2aFdLM1ZJK3NTTXFQNmlmMW1zRVZwTjNzWTZqRFhET1Vy?=
 =?utf-8?B?OXRWM0JJRmxydVUzdXZtZ1Vsc1pJUW5mNGYweG8vSmVDSkFaMVRBNHZXVk4w?=
 =?utf-8?B?Y3lxeld2aGZuVjFldFpPYVBFcVZCeWFxdnFSOENoWFFjOTV5cnlkVWYzSHh5?=
 =?utf-8?B?L1N1a3RJVHVDYlp6Y1R4elRpZUpwbTNMVWJhWXlsbW5YaWRXdzVYQStJZC9K?=
 =?utf-8?B?dmlHZnhXeW1HdE9jelorWXpuUnRMQVpNek1SUmFBSUxmK2dHWDdYSG9VYldm?=
 =?utf-8?B?eDFhd0ZmdHpzbHNBSVlGeW12Q1V4S0lYR2FkTXl1aVNFTnVLNW56cjRscldn?=
 =?utf-8?B?MzVEdERZbTFSOUxEaEt1SldXanZ1aTNIcTBCUlFqSnFITDBCZTVjVTJtMVpY?=
 =?utf-8?B?eTRtR0NOc2ZkVGsvcVNudDYyUUtVWHk3VjlFK3doWWZUbW5PM2tiV3pHbyty?=
 =?utf-8?B?N3ZwZVVkak1obUM4bmZvL0dickdzTTdGNHJtMDBic01rZmZuZjRsYlRuempr?=
 =?utf-8?B?VklHMWNDQ0R3Y2ZUditKcmUrUWNXWFpPbjFULzF2Ti9MdC9TaUJya0Z4VXpw?=
 =?utf-8?B?UzRzOTFTMjdDWFhKVXp0UStBS0JKVFA4azZKU0FSbTJ5OHVUdnU0d0FZdGt4?=
 =?utf-8?B?VnIwRzg0bENwcWhyZ0ZrTnNOd2hFbFQwRE9RbHJJWDRkTE5QQmZvTyswb3dr?=
 =?utf-8?B?ZVBNK25lcDk1bU1kK0V0YmdQUkpqSUczTHM3dXdPVm9LL0lpNHVIMmFyRzNo?=
 =?utf-8?B?allQeWFRaXI0V3RBY0tnR1FoaEI5UDk0VVQvTzBwM21NenNLR3BjR2d1TjRQ?=
 =?utf-8?B?aE96OE1QcUZQNEM4dHBwWkJNaTlRSDhmM0hycnB4b0FmWWU4VjhwNUM4RCti?=
 =?utf-8?B?by9zQWdrK2xjZUdzV3lGREprZnFQWFV1QVk2RHJhTlBlZ1o5S0VMMXM0cTJl?=
 =?utf-8?B?NjRQdnlpOFVKL1NMZXh5ZnpyNXo4QlBnZVlQMStkSExHeHpxYXp6OEZJYUR2?=
 =?utf-8?B?QXZRUzlDTk9jeklVTDEyQTBienRETGVnb3YyamtZQ1JrUlZpTlJrRFhJOGJE?=
 =?utf-8?B?Z1hyMU44QkJLWXlEQlowc05Ua3pSaXJaQWNOVmtGeHlZUGFJamNzRXZTRGQ5?=
 =?utf-8?B?aW0xL1FHR1lRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q243WkJIR0R1QWplbTdyL0hCZFVuUlVBeWpWS2lkNmxZUTcyMU9YMmRPQ3Q1?=
 =?utf-8?B?eTk2Y2NyVUlmRDBXc29qRE1rRzdoazkwM2NMKy9pOGQ5T3ZBa25xdlNpNG5X?=
 =?utf-8?B?dnVPQzBtL1lxdjN5UVNKNVJNeTRrZ2FBK2YyK3dGODFHM3FwVmRHbytCTU4z?=
 =?utf-8?B?R0dxc0JpMFJBVXJFcUMveGJQc3A3aGdXVlFRUWdHZDUyc1BpaW5NZ3hSMElI?=
 =?utf-8?B?L055RmFVYTdDZGMxVml0WUN0QlVuSDZZaWxKUUVkcFpUTnEvYUR6SEtYUEpX?=
 =?utf-8?B?V083YnI2UFh4THlqbmNsOHdzSDltMlY2dk9JbFc2RHJia1ByUHg5RGVHb0VG?=
 =?utf-8?B?VVZqYXVndWJNc0dkY1V2emkyVk1NZzVrSDVRV3BmM0d5amoxdG56bHJtK0dp?=
 =?utf-8?B?azhCOHFScFRJaFpnKzhkQ2RuN0xiVEx0VUNZVE85SmZsWWM0RFEvSXVmOU0y?=
 =?utf-8?B?VExvVktBRFlSMjZ2TStOeHNVOGUzUWNMSE1pMkhoUXpVdXNrbjI2Ynd3bnAv?=
 =?utf-8?B?VCtPRzZGOGVmQUZwWTdtN2lEUWY0ejVQNVk4aXhrQ01zOU1PMmM5T3Vtb0F0?=
 =?utf-8?B?bFd5SUVIV2ZGTC9jYndqWnNjenRrUjFRN25JQjJXYkR3TDJlSWJVLzVYQUxR?=
 =?utf-8?B?ckVrZ045VU5vRU5haFRvb1BEMjgrTjB3cExrakZhZk1sZnpWek5CekR5TW9U?=
 =?utf-8?B?UkUvY1hldEtTdVYxcDBPeGdLQU0wbmx2dXJBVlcwelJiQUo2clNONDlKalNm?=
 =?utf-8?B?QzQ0dzlXdE9aa3JBa0dPUk5aRTc5OTJyMWdlMElzUmV3bVk1b1ZyYmZvTmxw?=
 =?utf-8?B?dDlNQW51Ty82NmRFdnBzbGV4NHg4WHJIWUxuMG04US93bXBTNkJXSUEra2s0?=
 =?utf-8?B?YUFKMGxOMldmNnBNK1hyYnloRU9kYkMvdXd0ZSthcFZYbXY4cSs2R1ZQU1Qr?=
 =?utf-8?B?cUVFNW5NM0VaTFdCVmpMQVA3bWZZbURCcHcwbGFZbjE3N1NpemdUMHVCWnU1?=
 =?utf-8?B?UUdGcFBncGxhVXlZSERkQW1jQ0RMVDBCOWpNZU9aWVp5dmg5L25hcmpNMkpI?=
 =?utf-8?B?VC94RlZiSWNGOFhSTkx5R0FTWktUY0lZbDQ5eU4wQjEvSm1uYVNucDNFUDRZ?=
 =?utf-8?B?dDV1NVF2aFgwUGp0RzEyZjZxRkprK3JONUhhTE9ZckFUWnhLWkxwdVBsY3l6?=
 =?utf-8?B?Qm14eXlJRnFoV2lIcFYzQ2pnL2c2djBlZTArVFpJK3I0T1NrOEhzaVVpaWhH?=
 =?utf-8?B?ektNTHZhM010cFRBN2RRaVBLYlB1M2dQL3M4QkN4ejNsOGYzUjk4SmRyQk5H?=
 =?utf-8?B?M3FnUHEwZDVpLzRGdUo2bWt4Q3R3NjVIelUzQzdxMlFqc1lKQWE0MU5Lejhm?=
 =?utf-8?B?Q1pPdW11cVY1bTBDNnQ5UGtzako4VlhaMUZIT1FJMUJSZlJ1T0xxbTJySHhj?=
 =?utf-8?B?RmlGdjlpdWlPRlpJRFNpK3JqVHdCa056VFNnM2tTZkdCRTZsYWY4UitCSUN4?=
 =?utf-8?B?UWQ4dWh1RElYY0EzcEpzZUJhV2Z1a3hUY1EwRFN0WXZCZnFpSmN5YjI4UGIv?=
 =?utf-8?B?L1Irc01NRU45dVFOYVhWUzhkRDFRUjRUSEVxdkl5MW81U2EwME1XUnoybWU0?=
 =?utf-8?B?QWc4S0VsbjJjMXNuUW5CKzRCZERjMEQveThxaGx2ZzUxNFNWb0JJbTNhUm84?=
 =?utf-8?B?dHlhUE1vMFY0YitQV05FRy8zVXNOckRHdXlPb1B3UzgvYkpqQXMyMytvZ3Ni?=
 =?utf-8?B?ZndwZkxVRUNjbmZYdU5ldktoTXJ4N0dYMEI2cldOSFQ5aEwvdFYvVk8zdTVW?=
 =?utf-8?B?dzZ5RngvcXZzNnlreDVHNlNKQ3B4czRkYTZ1U0UwN3JYSVFPajE5TkFtSHpO?=
 =?utf-8?B?NjJBTjZZVFU5YWwxTzJ5aWlKNXpXT3htelBZd0tOMy9RU0dkY2R4bVdzQWl5?=
 =?utf-8?B?M2Z3bVlWejRkN3Q4RlVQSVp0UXFpa1pzdmdYNkNQZkQ1K3VCMDB3M2wwV0pt?=
 =?utf-8?B?UFJpMldReUpVTjQ2bFRSNWdoTFU0akMvWVNBV1VyYXQ3NGcvbklsdjNPQVdr?=
 =?utf-8?B?b3RwSUszRExkVkR2ZEwydGNmakZWZ3NON1Z3eEtlVStrUG5mYmNyZ3c3SDky?=
 =?utf-8?B?YS95SC83ZkVxNmEwQ1hURGhad213eXh3SThYa21pL2ZuSUxldWlOeTdLYVBK?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A49FBA302310BC4889E0B5BBD9B4EFFE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d924ed34-5d2a-46e2-bf2f-08ddc56bdcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 19:55:21.1279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WTnN7Y4udVL+vplcLgQnBiHRcIPZ04v7BOOMPURzJSgapBOVVn+O9MRCALdqLoWqfZXiP7cMnYWSiLnlYgCSSPdkAi+X4TeQeCaVvQJOw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
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

T24gV2VkLCAyMDI1LTA3LTAyIGF0IDE2OjQyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE5vIHNlbnNlIHRvIHNjaGVkdWxlIEdUIFRMQiBpbnZhbGlkYXRpb24gam9icyBpbiBwYXJhbGxl
bCB3aGljaAo+IHRhcmdldAo+IHRoZSBzYW1lIGdpdmVuIHRoZXNlIGFsbCBjb250ZW5kIG9uIHRo
ZSBzYW1lIGxvY2ssIGNyZWF0ZSBvcmRlcmVkCgpUaGlzIHdhcyBzdXBwb3NlZCB0byBiZSAiaW4g
cGFyYWxsZWwgd2hpY2ggdGFyZ2V0IHRoZSBzYW1lIGV4ZWMgcXVldWUiPwoKPiB3b3JrcXVldWUg
Zm9yIEdUIFRMQiBpbnZhbGlkYXRpb24gam9icy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3
IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KCkkgc3RpbGwgdGhpbmsgd2Ugc2hvdWxk
IGJlIGluY2x1ZGluZyB0aGVzZSBwYXRjaGVzIHdpdGggcGF0Y2hlcyB0aGF0CmFjdHVhbGx5IHVz
ZSB3aGF0IGlzIGltcGxlbWVudGVkIGhlcmUgZ2VuZXJhbGx5LCBidXQgbm90IGEgaHVnZSBkZWFs
CmhlcmUuIFRoaXMgaXMgcHJldHR5IHN0cmFpZ2h0IGZvcndhcmQgYW5kIGFscmVhZHkgdXNlZCBp
biB0aGUKc3Vic2VxdWVudCBwYXRjaGVzIGluIHRoZSBzZXJpZXMuCgpWZXJpZmllZCBhbHNvIHRo
ZSBkcm1tX2FsbG9jX29yZGVyZWRfd29ya3F1ZXVlIGlzIGF1dG8gZGVzdHJveWVkIG9uIHRoZQpk
cm0gZGV2IHB1dC4KCk90aGVyIHRoYW4gdGhlIG1pbm9yIGNvbW1pdCBtZXNzYWdlIGNvbmZ1c2lv
biBhYm92ZToKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRl
bC5jb20+Cgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRp
b24uYyB8IDggKysrKysrKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5owqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2lu
dmFsaWRhdGlvbi5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlv
bi5jCj4gaW5kZXggNjA4OGRmOGUxNTljLi5mNmYzMjYwMGU4YTUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMKPiBAQCAtMyw2ICszLDggQEAKPiDC
oCAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9uCj4gwqAgKi8KPiDCoAo+ICsj
aW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4gKwo+IMKgI2luY2x1ZGUgInhlX2d0X3RsYl9p
bnZhbGlkYXRpb24uaCIKPiDCoAo+IMKgI2luY2x1ZGUgImFiaS9ndWNfYWN0aW9uc19hYmkuaCIK
PiBAQCAtMTIzLDYgKzEyNSwxMiBAQCBpbnQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9pbml0X2Vh
cmx5KHN0cnVjdAo+IHhlX2d0ICpndCkKPiDCoMKgwqDCoMKgwqDCoMKgSU5JVF9ERUxBWUVEX1dP
UksoJmd0LT50bGJfaW52YWxpZGF0aW9uLmZlbmNlX3RkciwKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9ndF90bGJfZmVuY2VfdGltZW91dCk7
Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBndC0+dGxiX2ludmFsaWRhdGlvbi5qb2Jfd3EgPQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1tX2FsbG9jX29yZGVyZWRfd29ya3F1ZXVl
KCZndF90b194ZShndCktPmRybSwgImd0LQo+IHRibC1pbnZhbC1qb2Itd3EiLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBXUV9NRU1fUkVDTEFJTSk7Cj4gK8KgwqDCoMKgwqDCoMKg
aWYgKElTX0VSUihndC0+dGxiX2ludmFsaWRhdGlvbi5qb2Jfd3EpKQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFRSX0VSUihndC0+dGxiX2ludmFsaWRhdGlvbi5qb2Jf
d3EpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90eXBlcy5oCj4gaW5kZXggOTYzNDRjNjA0NzI2Li5kZmQ0YTE2ZGE1ZjAgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+IEBAIC0yMTAsNiArMjEwLDggQEAgc3RydWN0
IHhlX2d0IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHhlX2d0X3RsYl9m
ZW5jZV90aW1lb3V0IGFmdGVyIHRoZSB0aW1ldXQgaW50ZXJ2YWwKPiBpcyBvdmVyLgo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgZGVsYXllZF93b3JrIGZlbmNlX3RkcjsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLyoqIEB3dGxiX2ludmFsaWRhdGlvbi53cTogc2NoZWR1bGVzIEdUIFRM
Qgo+IGludmFsaWRhdGlvbiBqb2JzICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICpqb2Jfd3E7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAvKiogQHRsYl9pbnZhbGlkYXRpb24ubG9jazogcHJvdGVjdHMgVExCIGludmFs
aWRhdGlvbgo+IGZlbmNlcyAqLwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Bp
bmxvY2tfdCBsb2NrOwo+IMKgwqDCoMKgwqDCoMKgwqB9IHRsYl9pbnZhbGlkYXRpb247Cgo=
