Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E50BD39008
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 19:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F208889FA7;
	Wed, 14 Jan 2026 19:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cV/0WCwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AC589FA7
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 19:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768418571; x=1799954571;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LnKwLRFEKxkLErfY0+NDL0jtGiukklOpDo3hSloROMs=;
 b=cV/0WCwEnhpgzsXsHzX62DXhIaR3soC5eDnNVUoNR+5eabt4DxlLdsWG
 f/h4IbnrsQlFqlK5T5FyftkvD/7vTl/SqWPwwXtIDm6GSETeqnfnSMHbc
 hWTWNDmH7APCmumN/db5YNhVTjjbwKfWHGwc4ZBLDmwVaoEHWuHz6HOzo
 hpe6RfJdwkoxgl3lBhsNZu5A6BYSCVqiCaRzVaiOmq+RelYyxtbVzEf4/
 DX9ZkQFiq1iQpiv8F/lbYpWwZr+RuESd2U1SYJCozOHyBE/y3pvbDv1gE
 bCCF02/WGWMx/5d7rfO0O+Csl90/DIlsHWTRf4BhX2EZu/MPRv0Sbjo+Y A==;
X-CSE-ConnectionGUID: WP/vZXWeSpScF+0EzNlUHg==
X-CSE-MsgGUID: 4vVF0CypS1WayX1Ln3as2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73578187"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="73578187"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 11:22:51 -0800
X-CSE-ConnectionGUID: KUHCXS/rRW+pHMn9YzUuKA==
X-CSE-MsgGUID: BA+c6KyYRCiddlWeaIA+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204791365"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 11:22:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 11:22:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 11:22:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 11:22:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fW/hAh8kTn9QXyfvJ5jB4cQD4zpUZ47ORHiyP2CMWO0Q4a1tC59X6mKUwmWd6uK9g2BSsix/ioShtVz71kTsE6b0G2JZa2UZOfAchWlq86oekI3Ntw+NZzNBJYYVNa6yE2fEXyJnVRujdKXpwCHkCOkBF8w8uEryLYvtI+/OHGcihbSJPsWwmfji2IGEYokM+XahqNXsezD9V6WEguUPR2rRTCnLdH2v9nj7lfaZRYUGFp30/i4Xh9cpWems8wORYe42kkKO8HlUeeH/dMkLzyV+Heaa1+1hjecXUmvEmHfcwmhd3Asyv+nFj73xnFfMJuOU5EXhyTb/6HemuxsWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnKwLRFEKxkLErfY0+NDL0jtGiukklOpDo3hSloROMs=;
 b=Q+NIYBtzZhKDpR8a/tPfP9IiUJFncKZ78v1CethxzsPd9umN7gTvNMP9a5Mw6wJa1oqYQqY7a9HZGbwBFEkG7jkhnsOgqIudeyM9qzRbiPFhoEDSKKn/lokQAnHxJZiQjceLvBDyA6i+sl5tTQw4eYuCAyrzxT19bYCYgCT5MCprK5RtUqLQ/lVYg8pOM4m0X4fcmOvRUalBliDkG++yqTk8D17T5jlVLbO7lnspwi/9s8OwczEjocEExQ/dkuBryIE2pte+hCDF35cne8DxFa93lOGjF18PDJVSZBpnqQzIFr8ZM2tiydtTiiPEnOLzoIzUMG1gZwPxC/msKSUc+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH3PPFD80FA6330.namprd11.prod.outlook.com (2603:10b6:518:1::d52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 19:22:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 19:22:46 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "akshata.jahagirdar@intel.com" <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add feature to force ring-based TLB
 invalidations
Thread-Topic: [PATCH 1/2] drm/xe: Add feature to force ring-based TLB
 invalidations
Thread-Index: AQHchOlmdfSzX70QJU6H3BrwbsTFm7VRAW0AgAAD3QCAAQc1gA==
Date: Wed, 14 Jan 2026 19:22:46 +0000
Message-ID: <ee273674df85ccd5435c9f03d1043212718df8cb.camel@intel.com>
References: <20260114000421.331082-1-stuart.summers@intel.com>
 <20260114000421.331082-2-stuart.summers@intel.com>
 <aWcM/ODpvs403f0z@lstrano-desk.jf.intel.com>
 <aWcQOi7D0j4t2BDS@lstrano-desk.jf.intel.com>
In-Reply-To: <aWcQOi7D0j4t2BDS@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH3PPFD80FA6330:EE_
x-ms-office365-filtering-correlation-id: c09d56ae-533c-4ccc-b637-08de53a24c3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZCtIL1dlSHptSXVRaGNiTlhETVZWUDhoVWJoL2JFaWY0YVBuaWFhMHRVWmcx?=
 =?utf-8?B?dXA2dWJXL3RFc2l6UER2VW1Fa1JhL1h6dzBZNlJzd1JuV2lwNWVGY1pNcDNU?=
 =?utf-8?B?TU5Sdm83Y1Q3Z0xCWEx1VVNWK2F4N002a2Z3NUlSdkFmV3dLSENrbEhXdUlR?=
 =?utf-8?B?S3NIWEcrenV6b29xbStUMWxoUTBERmt1WEZqZW9VYmVsTDBBRGwzcS81TDY3?=
 =?utf-8?B?SGZnOGw3VFMwN1FzNWltRmhZQklaRENHTTdSVi95YjA4QTZsSDZjRHdScDg1?=
 =?utf-8?B?cHRCMTlhc0ZvRmxad3c2WXJoUzh6TFJUeG1pcTVmRDV5OUNQb1BWZnVxR2lt?=
 =?utf-8?B?c0JyaTNiR1JNR3B3Z2xKMUJQcGFrQmQrTkg0OVh1S3dMZisvUnYyQ2tRUG02?=
 =?utf-8?B?R2lmYjVMZGNQckVtd2s1eUROTEdPL0x1OTMzV1hySzU5TGVpdzYxeWZBbUND?=
 =?utf-8?B?RnNpeHdEcGd4L3NtbTZvSW5ReHJtaHA3Skl4Rm91ajB3ZFFhUmV6c2RsM0Jx?=
 =?utf-8?B?a3ZYTlBMR3lSazk1TDM1SjdJcUxPQkptOTNIMHhkeTFGYzlkU1lsdDlTN01h?=
 =?utf-8?B?OWVQS3lmRExqUDBtWGM1b0ovdldQaEpJL3gvRUxIaWZLRlFzTXR2ZDg1WTFu?=
 =?utf-8?B?NkFoYjJGcFE3UFNvRUJLVHUrdWlEK3JFaXkyUXBRaXBBZTRSanBSQTQrci9Z?=
 =?utf-8?B?UVI4LzJoaWRHOW5XSVJ1TzFHR3pFRGZzb2hMNUJYTHF0VEJIeEFrOVV5WU1l?=
 =?utf-8?B?bEtvMmc2QkZtcTJJa2JaUHU3eXVvNGJ4ZTR3UWVteE56cDlFek12b3VCcnA4?=
 =?utf-8?B?VDI1WElKT1pGOHhaTGNLbEVqRUdJZjM5SHFhemtwOGZXSG5ZWW5vQ1pGUFMr?=
 =?utf-8?B?Y2pFTk9oV1B6bk1qQWx4d3hQaWFlZkJXamVRa2dQamx2eUdXNUtXRmg3VlZY?=
 =?utf-8?B?bHdVZTJzWWFhR2dLV1Fmbk50VFA5R2k4VTh5R3lqeDB5ZTBIZEtKZ1Nxbnps?=
 =?utf-8?B?akpJREw0Y1IvR1BDcitnLzFMWGRYalEyV3BIb3l6eFM5SnJYYm1ySHRndkRk?=
 =?utf-8?B?RVJYWWdsMnR3QmEyWGJmeXo4eGt2aWZNRVdtNVFwWmlEaGEyK0NVekt6aFRR?=
 =?utf-8?B?WWQrZXRnZW1mYjFwaHlBVkxoSjdsL3NwNlVhc2tQNGN4alZpTTgvSlowMDE4?=
 =?utf-8?B?OXdwUTduc1Z4WVIxOVRaYTJZTDJWUkkyZ1FVWWZnSlJIRmRJYWxrTWdkaEZW?=
 =?utf-8?B?MHVuUEx6WlhqQXFpSkl2V0N6cSs0UTB5dDFIRjZwUitIT011MndLc05EZG8y?=
 =?utf-8?B?SGhTZDZUaXRNZkxyMi8xUXJCaDMrY2pWcjdhMDVLeGFDSHdZd2hjSEpkWE1y?=
 =?utf-8?B?dVJ5Nm1FUjJ0T0JkeU8vZStkWmNJZHJCZU1nMUpGcHRXU1VoZk0vdW1GcHN0?=
 =?utf-8?B?MVlSc2phdkZoNkQzOUhWeVJiL2ZlWStsV0FtMitTaTQzcHZjRlZCL3RxVmFF?=
 =?utf-8?B?UlFBTGZUWUc3enhEb0dla1Z2YUZwbGRORmlDYmZjZU1MVWtZQVFNU3RicXdS?=
 =?utf-8?B?dFFzYU9HMkJBbElReFRoMlFTWmk3RUNVV0Z4d01sa0xaMTV5U2JIVUF2VWNa?=
 =?utf-8?B?SlFSc1AvcXJKM1haNW00OWxOb0pBTDFqVWlvRVlHQ3dibVdBc01sVElsU0VM?=
 =?utf-8?B?OTRDR05Ka1pWU0JvR1JiRktUVFNLdjhlUEs3M3ZYWnhHWXdFbUFoRFB4U05G?=
 =?utf-8?B?eFhvZ3haUFdWcDhJYzVsL2h3Z29BM0E1MEZKMDBpN2VOTVB5SDFFTWJ6WEVx?=
 =?utf-8?B?T0w0ZDRqR1QvWDR0TmVjcEQxa1VMcjhCLzdrZCtNcFJpcThyTnRQWTI2dzMx?=
 =?utf-8?B?VllwV3pmQkJXTTUzUTJMTG9iTXZCNG5JNG5RNzVXZ3N3K2NxY0d1ei9tZ3d6?=
 =?utf-8?B?b25HNlV4UGlZa0k3UEVwaDJpN3lVNUZJcnZsRkVQNkduMHliZGNZQVJRNG5B?=
 =?utf-8?B?ai9vdE04VTM2YVZvMXZxOFFmaDJ5TmRLdy9nLzg0dU0vSWdBWVh0TnNXTDYr?=
 =?utf-8?B?NkFIQVNabVIzRlhkZ2tBUjhkQTdNbGI0bWZkTGRKQWtlejNQWXdEenNzdCtH?=
 =?utf-8?B?V2VwZFpVdjNiNW53bWtYTWxTek95MVVMc3J0WXdGeGMwYjF5UzhpUTl0WitN?=
 =?utf-8?Q?vROCA3vDUPpzi57iJqeFrC0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWtOTmplYzZXOTVyYjZJOExiVTlXUjF4emE5dUhPK2tzZnZmY1htVG5TcWV1?=
 =?utf-8?B?MWNhczVhSE8rd00vUFMvZ01XZGpwRnYrVHc0T0lRanpUejM0V2puWTFPcmhp?=
 =?utf-8?B?TjN0RjN6SldQUFlxdmErMUlhN0Rvd3JxQWo3cnUxU1REZ1c0bHFJLzc0eFF3?=
 =?utf-8?B?QTZycGhTallnVmh1WU9DZ1EyWkE5Q25VYTRYcThRVFI5cFFBR0duQmx3Y2Qz?=
 =?utf-8?B?cUZZSk9BKzYwMXN4OHZmVG50TENiTXZWdVp1elc4TnJEMWMxMi9wRHg1RCtz?=
 =?utf-8?B?bGxhNDNENjFyWFJDMk1Pc1B1QndlaDBoOGFjV0llaTVVdi9xVjFwQk9oRkNL?=
 =?utf-8?B?T0NXUjlsSmNRY25Wb3pGbFRydjJwaGdHWjVZUWpGV3BETFk5NDNwS1NQSFph?=
 =?utf-8?B?NHpiVk5udDJRd0tPdXQrVEU4c3VsQVc5Q0dGY2pNY0QzeWN4bjVBZGwwcWJP?=
 =?utf-8?B?ZS80cmxQdDFhK2F6dEtubFdIcEJRaWx0dFpKN25HYUFML0hZZVJ5Y3pvc1hR?=
 =?utf-8?B?ZUpub0MxaExIZVRxZFBLM1ZnS1Q3Rmc0UjAwM3RVa3JNWmZSUWtZdWQ4Y0Vv?=
 =?utf-8?B?M0JWZC9vam5GSFZEdEt3UGk1TUFYdXBmemVXTFJvQ01SOXFGUlU5NjYzMDJJ?=
 =?utf-8?B?WUhvVmZUd2NSRjRIU3dZRGVFQXI3OUxxWjhHd1dKTk1XVXV6Z2I3UEhPbm9m?=
 =?utf-8?B?WWMyWGNjVkFhMUZMOGtuMHErTytqM0tlSzJ1RHlDSnh1MGx2SEVCSkdEUEdv?=
 =?utf-8?B?ZVIxZ3AxcE5hZVcrUjBob0xNRlF1aytWcGxSWXdiUWsxcHRsV0Z1bXRLZy80?=
 =?utf-8?B?UWtNU2JLQzlqbmZDcmVONy9WeWlBMDFDS1NuWHpkMUk2VFRXbWVFYXM1Z2c2?=
 =?utf-8?B?akhYMk91WTJSQTh1T2E1SXlwbEpCNEM4RnI1dzdjRHZFbG1aUTdNdUZJNDRW?=
 =?utf-8?B?dFRSTEI1STVJNTNHbGFrVWZINENtNTAxTlVYNUFWbFZuS2l6Nk5ldHFJejJ4?=
 =?utf-8?B?NDJjRE9ySC9teVAyeGdvMkdsWGtDc2lOQWRnWnN6ZHJlYVVwSWVmT3FFU3RU?=
 =?utf-8?B?dlNqY0dvSHBsQmc4aTlkZFdDZHpZR1ZSbTQ3MlpFbnRhaERHeVBFYkdMZnJE?=
 =?utf-8?B?N1BwM1VXMmNaTEU5YzRCV3Y1ZlFha0lyb2wrZmNVSHIrWVVCZHg1cUR3Ty9u?=
 =?utf-8?B?bmRBWVUyK3lvUk8zTVRVS0szNlBhYkVNa1ZpazZCMU1peVJiWXNkWlVzZU9X?=
 =?utf-8?B?ODk2SXl5UWU4b0hzQnZuSzVYUmViT2FabXZDbmxpQ2RHWTFFTUtPMHNoTUJQ?=
 =?utf-8?B?cmQ3MkF2a0ZaWHV5SUF4V0hWY3pEVStjM0k1OUlqTVJzKzFqdkdKQW9XSHJU?=
 =?utf-8?B?REFUd01JZmwvN0tmM21tVi85MWUzUzBLeHgxUUJOWmtjSjBBTjZ2TGhyOVlo?=
 =?utf-8?B?c2VmejZ1c2owMGtSVnFaZitoaDNkUkhTL0F1M0MxZ2xudStEekFSNERqcUY5?=
 =?utf-8?B?dHpYZUZPYlJmQ2VFMGJnd0lrVW1HTy9CVVFVWVczRWMxanhlMkludHhmanNz?=
 =?utf-8?B?VXhzNnMwWTU5MDZSYVlpU0dHZ2FyZTFjN0drdnVKV1VGbHVCTHFQdU9lMFov?=
 =?utf-8?B?YTM0dDVERjJLM2tUSVQya2llQ2VGQ3hjT1FhTGhJa1ZpVEYwL1ZhdXA4Qmtw?=
 =?utf-8?B?dmtzQkdhWlN1Q0FLdTM3RnZ1bGl5aGV1QUgzL1pEeGtobXlxVjQzMTlhTUFJ?=
 =?utf-8?B?eGJJSUNFNDdZMnZrNXBENVVoa3ZRTU5GYjlnb01MVk9LRDRVVXpyR2FsbU9Z?=
 =?utf-8?B?UjhsMnpnUVk2b3hOaDlIa00ybUJWYVVoZHVjS0NPWEFiOHdrWjdQdmV5YmNp?=
 =?utf-8?B?NFVCM09SeDNYa1lWMllpYmd3Ujl3ZzVIa05BYitNdXlnWFdjZ1FRb0JMaEpD?=
 =?utf-8?B?L1ZjWWhUcnpGWnFza09IRnZBdjNJMFlqWHBNRnljM29ZR1JKZ3Z0enQ2QjFw?=
 =?utf-8?B?V3RjcloyZ2dka0FTWFRhK1JxNHJEWktYOEc1U2xySUF0Yng5LzNMSkx4WVJB?=
 =?utf-8?B?MDVmRTRtWUxnbDYydGVxM1k3WER5NjR6WXRzOFBabktWR3ZXZEwwY2JTbkRh?=
 =?utf-8?B?K1RwaDdDN0UrRzF6UTIwTFE3VHF1NW1aV1BoeVNBWUNURk5sdGRvVHEvaHY0?=
 =?utf-8?B?Vk5waUplRDNEZmVpdENoMkhRZUxBRTlVcmxxN0ZNbkVOVGZUc1VKOVhmQUJW?=
 =?utf-8?B?OU50MHFlSDE1eDYyRExBbldVM2o2dnZScXNUdnBId05lZE5xSEkrV2xaM3Vx?=
 =?utf-8?B?YTlxR2VoYU5tL1BWcnVRSUJINjRYQlF2d0orbTI0bU5qZFpMYkF4RDNUYVJj?=
 =?utf-8?Q?g3HojWtYD1yChbTI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C50B7324B329DA42A1C5DA5E4CF23952@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09d56ae-533c-4ccc-b637-08de53a24c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 19:22:46.1397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0N6xgnnBMjGbVotHSmdKQdC6hOZLRqv3aYll8Mot8X6uAzXaxE1LKy/HuFa1+5hjPeU7jjD9N3xpd8g4kj6dNpjui1mtULDq7q2OmcfVVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD80FA6330
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

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDE5OjQwIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFR1ZSwgSmFuIDEzLCAyMDI2IGF0IDA3OjI2OjUyUE0gLTA4MDAsIE1hdHRoZXcgQnJvc3Qg
d3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCAxMjowNDoyMEFNICswMDAwLCBTdHVh
cnQgU3VtbWVycyB3cm90ZToKPiA+ID4gQ3VycmVudCBoYXJkd2FyZSBkb2VzIGFuIGltcGxpY2l0
IFRMQiBpbnZhbGlkYXRpb24gb24KPiA+ID4gY29udGV4dCBzd2l0Y2guIFRoaXMgaXMgcmVxdWly
ZWQgZm9yIHZhcmlvdXMgdXNlIGNhc2VzIGxpa2UKPiA+ID4gcHJlZW1wdCBmZW5jZXMgd2hlcmUg
YSBjb250ZXh0IHN3aXRjaCB3aWxsIGhhcHBlbiB3aXRob3V0Cj4gPiA+IGFueSBleHBsaWNpdCBU
TEIgaW52YWxpZGF0aW9uIGZyb20gdGhlIEtNRC4KPiA+ID4gCj4gPiA+IEFkZCBhIGhvb2sgdG8g
bWFrZSB0aGlzIGV4cGxpY2l0IGFzIHBhcnQgb2YgdGhlIHJpbmcKPiA+ID4gcHJpb3IgdG8gYmF0
Y2ggZXhlY3V0aW9uIHRvIGFsbG93IGZvciBtb3JlIGV4cGxpY2l0IHRlc3RpbmcKPiA+ID4gYW5k
IHNlcXVlbmNpbmcgb2YgdXNlciBiYXRjaCBleGVjdXRpb24uCj4gPiA+IAo+ID4gCj4gPiBJIGRv
bid0IHRoaXMgcGF0Y2ggaXMgbmVlZGVkIHJhdGhlciB0aGlzIGFuIGV4aXN0aW5nIGJ1ZyBpbgo+
ID4geGVfcHQuYy4uLgo+ID4gCj4gPiAxOTc0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKCghcHRfb3AtPnJlYmluZCAmJiB4ZV92bV9oYXNfc2NyYXRjaCh2bSkKPiA+ICYmCj4g
PiAxOTc1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX3ZtX2lu
X2xyX21vZGUodm0pKSkKPiA+IDE5NzbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHRfdXBkYXRlX29wcy0+bmVlZHNfaW52YWxpZGF0aW9uID0KPiA+IHRy
dWU7Cj4gPiAxOTc3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAocHRf
b3AtPnJlYmluZCAmJgo+ID4gIXhlX3ZtX2luX2xyX21vZGUodm0pKQo+ID4gMTk3OMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBXZSBidW1wIGFsc28g
aWYKPiA+IGJhdGNoX2ludmFsaWRhdGVfdGxiIGlzIHRydWUgKi8KPiA+IDE5NznCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm0tPnRsYl9mbHVzaF9zZXFu
bysrOwo+ID4gCj4gPiBJIGJlbGlldmUgd2UgYWxzbyBuZWVkIHRoaXMgYXQgdGhlIGVuZDoKPiA+
IAo+ID4gZWxzZSBpZiAocHRfb3AtPnJlYmluZCkKPiA+IMKgwqDCoMKgwqDCoMKgwqBwdF91cGRh
dGVfb3BzLT5uZWVkc19pbnZhbGlkYXRpb24gPSB0cnVlOwo+ID4gCj4gCj4gVWdoLCBhY3R1YWxs
eSB0aGlzIGlzbid0IHJpZ2h0IGVpdGhlciB0aGlzIHdpbGwgaXNzdWUgYSBUTEIKPiBpbnZhbGlk
YXRpb24KPiBvbiBwYWdlIGZhdWx0IGZpeCBvciBWRiByZXN1bWUgd2hpY2ggaXNudCByaWdodCBl
aXRoZXIuCj4gCj4gSSB0aGluayBpdCBpcyB0aGUgcmlnaHQgYmVoYXZpb3IgZm9yIFZNIGJpbmQg
SU9DVExzLCBidXQgbm93IHRoYXQgSQo+IHRoaW5rIGFib3V0IGl0IHdlJ2QgZ2V0IGEgVU5NQVAg
b3AgdGhlcmUgd2hpY2ggd291bGQgc2V0Cj4gbmVlZHNfaW52YWxpZGF0aW9uIC0gb25seSBvbiBw
YWdlIGZhdWx0IGZpeCBvciBWRiByZXN1bWUgb3IgZXhlYwo+IElPQ1RMCj4gcGFnZSBmaXh1cCB3
ZSBvbmx5IGlzc3VlIGEgTUFQIG9wIC0gdGhlIGxhdHRlciBjb3JyZWN0bHkgaW5jcmVtZW50cwo+
IHRsYl9mbHVzaF9zZXFuby4gVGhlIHByaW9yIGNhc2VzIHdlIGFzc3VtZSBubyBpbnZhbGlkYXRp
b24gaXMgbmVlZGVkCj4gYnV0Cj4gYSBpbnZhbGlkYXRpb24gYXQgc3RhcnQgb2YgYmF0Y2ggd291
bGRuJ3QgaGVscCBpbiBhbGwgY2FzZXMgdGhlcmUKPiBlaXRoZXIuCj4gCj4gPiBNeSBxdWVzdGlv
biBpczogZG9lcyB0aGlzIHBhdGNoIGludGVybmFsbHkgY2hhbmdlIGZhaWx1cmUgcmF0ZXM/IElm
Cj4gPiBzbywKPiA+IEkgYmVsaWV2ZSBpbXBsaWNpdCBUTEIgaW52YWxpZGF0aW9uIGlzIGhpZGlu
ZyBhIGJ1ZyBpbiB0aGUgY3VycmVudAo+ID4gSUdUIHN1aXRlL0tNRC9oYXJkd2FyZSB0aGF0IGp1
c3QgaGFzbuKAmXQgYmVlbiBjYXVnaHQgeWV0Lgo+ID4gCj4gCj4gU28gbGV0J3Mgc3RhcnQgaGVy
ZS4KCk9rIHNvIGp1c3QgdG8gYmUgY2xlYXIsIGlzIHRoZSBleHBlY3RhdGlvbiBoZXJlIHRoYXQg
d2UgYXJlbid0IGRvaW5nCmFueSBpbXBsaWNpdCBUTEIgaW52YWxpZGF0aW9ucyBnZW5lcmFsbHk/
IE9yIGFyZSB0aGVyZSBzcGVjaWZpYyBjYXNlcwp3aGVyZSB3ZSB3YW50IHRvIHJlbHkgb24gdGhl
c2UgKGxpa2UgcHJlZW1wdCBmZW5jZXMpIGFuZCBhbnkgb3RoZXIKY2FzZXMgd2hlcmUgd2UgYXJl
bid0IGRvaW5nIHRoaXMgZXhwbGljaXRseSBpcyBjb25zaWRlcmVkIGEgYnVnPwoKVGhhbmtzLApT
dHVhcnQKCj4gCj4gPiBNYXR0Cj4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQWtzaGF0YSBKYWhh
Z2lyZGFyIDxha3NoYXRhLmphaGFnaXJkYXJAaW50ZWwuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfCAyICsrCj4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4gPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5owqDCoMKgIHwgMSArCj4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jwqDCoMKgIHwgNyArKysrKy0tCj4gPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKysr
Cj4gPiA+IMKgNSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vf
dHlwZXMuaAo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaAo+ID4g
PiBpbmRleCBmNjg5NzY2YWRjYjEuLmZhMTkzZTBiOTA2ZCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaAo+ID4gPiBAQCAtMzU1LDYgKzM1NSw4IEBAIHN0cnVj
dCB4ZV9kZXZpY2Ugewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhh
c19weHA6MTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQGluZm8u
aGFzX3JhbmdlX3RsYl9pbnZhbDogSGFzIHJhbmdlIGJhc2VkCj4gPiA+IFRMQiBpbnZhbGlkYXRp
b25zICovCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggaGFzX3Jhbmdl
X3RsYl9pbnZhbDoxOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBp
bmZvLmhhc19yaW5nX3RsYl9pbnZhbDogUGVyZm9ybXMgVExCCj4gPiA+IGludmFsaWRhdGlvbnMg
b24gY29udGV4dCBzd2l0Y2ggKi8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHU4IGhhc19yaW5nX3RsYl9pbnZhbDoxOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qKiBAaW5mby5oYXNfc29jX3JlbWFwcGVyX3N5c2N0cmw6IEhhcyBTb0MKPiA+ID4g
cmVtYXBwZXIgc3lzdGVtIGNvbnRyb2xsZXIgKi8KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB1OCBoYXNfc29jX3JlbWFwcGVyX3N5c2N0cmw6MTsKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQGluZm8uaGFzX3NvY19yZW1hcHBlcl90ZWxlbTog
SGFzIFNvQwo+ID4gPiByZW1hcHBlciB0ZWxlbWV0cnkgc3VwcG9ydCAqLwo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaS5jCj4gPiA+IGluZGV4IDVjNzA1MTI0MjcwZS4uYTJjZTlkYTJlM2NiIDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMKPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jCj4gPiA+IEBAIC04OTMsNiArODkzLDcgQEAgc3RhdGlj
IGludCB4ZV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUsCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzX2RldmljZV9hdG9taWNzX29uX3NtZW0g
PSAxOwo+ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzX3JhbmdlX3Rs
Yl9pbnZhbCA9IGdyYXBoaWNzX2Rlc2MtCj4gPiA+ID5oYXNfcmFuZ2VfdGxiX2ludmFsOwo+ID4g
PiArwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5oYXNfcmluZ190bGJfaW52YWwgPSBncmFwaGljc19k
ZXNjLQo+ID4gPiA+aGFzX3JpbmdfdGxiX2ludmFsOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGUt
PmluZm8uaGFzX3VzbSA9IGdyYXBoaWNzX2Rlc2MtPmhhc191c207Cj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqB4ZS0+aW5mby5oYXNfNjRiaXRfdGltZXN0YW1wID0gZ3JhcGhpY3NfZGVzYy0KPiA+ID4g
Pmhhc182NGJpdF90aW1lc3RhbXA7Cj4gPiA+IMKgCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmgKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cGNpX3R5cGVzLmgKPiA+ID4gaW5kZXggMjBhY2M1MzQ5ZWU2Li43ODNlYmRhNmVhZTEgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMuaAo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmgKPiA+ID4gQEAgLTcyLDYgKzcyLDcg
QEAgc3RydWN0IHhlX2dyYXBoaWNzX2Rlc2Mgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTggaGFz
X2F0b21pY19lbmFibGVfcHRlX2JpdDoxOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTggaGFzX2lu
ZGlyZWN0X3Jpbmdfc3RhdGU6MTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19yYW5nZV90
bGJfaW52YWw6MTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdTggaGFzX3JpbmdfdGxiX2ludmFsOjE7
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfdXNtOjE7Cj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqB1OCBoYXNfNjRiaXRfdGltZXN0YW1wOjE7Cj4gPiA+IMKgfTsKPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zY2hlZF9qb2IuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9zY2hlZF9qb2IuYwo+ID4gPiBpbmRleCAzOWFlYzdmNmQ4NmQuLmMzYjNkOWM1NmRi
YiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zY2hlZF9qb2IuYwo+ID4gPiBAQCAtMjQ2
LDYgKzI0Niw3IEBAIGJvb2wgeGVfc2NoZWRfam9iX2NvbXBsZXRlZChzdHJ1Y3QKPiA+ID4geGVf
c2NoZWRfam9iICpqb2IpCj4gPiA+IMKgdm9pZCB4ZV9zY2hlZF9qb2JfYXJtKHN0cnVjdCB4ZV9z
Y2hlZF9qb2IgKmpvYikKPiA+ID4gwqB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVf
ZXhlY19xdWV1ZSAqcSA9IGpvYi0+cTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2Rl
dmljZSAqeGUgPSBndF90b194ZShxLT5ndCk7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSwgKnByZXY7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVf
dm0gKnZtID0gcS0+dm07Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1NjQgc2Vxbm8gPSAwOwo+ID4g
PiBAQCAtMjU5LDkgKzI2MCwxMSBAQCB2b2lkIHhlX3NjaGVkX2pvYl9hcm0oc3RydWN0IHhlX3Nj
aGVkX2pvYgo+ID4gPiAqam9iKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB4ZV92bV9hc3NlcnRfaGVsZChxLT52bSk7Cj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqB9Cj4gPiA+IMKgCj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICh2bSAmJiAheGVfc2No
ZWRfam9iX2lzX21pZ3JhdGlvbihxKSAmJgo+ID4gPiAheGVfdm1faW5fbHJfbW9kZSh2bSkgJiYK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHZtICYmICF4ZV9zY2hlZF9qb2JfaXNfbWlncmF0aW9u
KHEpICYmCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAoeGUtPmluZm8uaGFzX3JpbmdfdGxi
X2ludmFsIHx8Cj4gPiA+ICF4ZV92bV9pbl9scl9tb2RlKHZtKSkgJiYKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAodm0tPmJhdGNoX2ludmFsaWRhdGVfdGxiIHx8IHZtLT50bGJfZmx1c2hf
c2Vxbm8gIT0KPiA+ID4gcS0+dGxiX2ZsdXNoX3NlcW5vKSkgewo+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgeGVfdm1fYXNzZXJ0X2hlbGQodm0pOwo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5oYXNfcmluZ190bGJfaW52YWwpCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdm1f
YXNzZXJ0X2hlbGQodm0pOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHEt
PnRsYl9mbHVzaF9zZXFubyA9IHZtLT50bGJfZmx1c2hfc2Vxbm87Cj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgam9iLT5yaW5nX29wc19mbHVzaF90bGIgPSB0cnVlOwo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYwo+ID4gPiBpbmRleCA2
OTRmNTkyYTBmMDEuLjhlMGJhMmViYTIxZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiA+
ID4gQEAgLTE2MTksNiArMTYxOSw5IEBAIHN0cnVjdCB4ZV92bSAqeGVfdm1fY3JlYXRlKHN0cnVj
dCB4ZV9kZXZpY2UKPiA+ID4gKnhlLCB1MzIgZmxhZ3MsIHN0cnVjdCB4ZV9maWxlICp4ZWYpCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZtLT5i
YXRjaF9pbnZhbGlkYXRlX3RsYiA9IGZhbHNlOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoH0KPiA+ID4gwqAKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlmICh4ZS0+aW5mby5oYXNfcmluZ190bGJfaW52YWwpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdm0tPmJhdGNoX2ludmFsaWRhdGVfdGxiID0g
dHJ1ZTsKPiAKPiBUaGlzIGRlZmluaXRlbHkgaXNu4oCZdCByaWdodCBvciBkZXNpcmVkLgo+IAo+
IE1hdHQKPiAKPiA+ID4gKwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8q
IEZpbGwgcHRfcm9vdCBhZnRlciBhbGxvY2F0aW5nIHNjcmF0Y2ggdGFibGVzCj4gPiA+ICovCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yX2VhY2hfdGlsZSh0aWxlLCB4
ZSwgaWQpIHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKCF2bS0+cHRfcm9vdFtpZF0pCj4gPiA+IC0tIAo+ID4gPiAyLjM0LjEKPiA+ID4g
Cgo=
