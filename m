Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E057C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 14:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3277B10E5E5;
	Tue, 23 Jul 2024 14:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI6OlMMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28FA10E5E5
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 14:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721744031; x=1753280031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+xXd2A08ER/y+rhwUPVXsKg5UBb3gYM9YaMVWGGJwoc=;
 b=oI6OlMMU1b5tZodjKgB93MovM41KTjhjAEswDo3qUdEst5BgAtXsEqJ5
 eWxI+3Y9jQGf14ugJ2a7Q13xeAwjqr266Gufl90YFjSwaUUsz3zrj8Ojr
 bxhQkYXQqo6nDcOdERieh29yNNQZJWl5EpsBz5uQlJ8OYXndE3kyLiKH2
 bimQIsPcujxCxUg/QcKvWI936yMLwfsf8PCdf2/Am2znMhPS+yw3xgTQM
 M5cqPMy9JouijXofYNQwMs34P3hiZ3ISAe6u15YppaBTff6czRNxYOQKO
 HqNIaECSMLtApEcDt33WdzSXSUXosshV/NwLrSzzJTa0xj8B3AQfzBn1j Q==;
X-CSE-ConnectionGUID: hm70mxufTROfOVsoDvGk8Q==
X-CSE-MsgGUID: AW8h/cuISK+9OQNlKfZPTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19520190"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="19520190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 07:13:51 -0700
X-CSE-ConnectionGUID: KLVYL77dSpyC1fY3aGOZFA==
X-CSE-MsgGUID: k4Rcw4kKSR6LNwku++0GMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52311638"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 07:13:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 07:13:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 07:13:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 07:13:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 07:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrWafK+vkM3wLqzKm6139U8XnR6XIzk8bjs2HOW9WTIguFRtmx8RtMZnbp/I7PCKdGcE6/CcC3farjfeIoOhPFDna6ImAK32FGp41du5n9PIf2MUBoi2lrb0HArZorXS7iHL+cGAmWdlnQyWxIota9hp81ItHvRfWF5I//hnurYOt3rUxIW1XRp1ihSgkxeVNSuPJbwzqUvWbGQb9eO2gneOLijCK5Q2mT7qFp38cfEAlrJrKDdYqyEYUyfLZXtSk7+DbyUPMgQJixHze3dCZjlEeMMxwZ9iIuPo2UhMV7oe+S+O/nYK96OT52Zp7/+TXLtrTWRYulIp4+dq4mGcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xXd2A08ER/y+rhwUPVXsKg5UBb3gYM9YaMVWGGJwoc=;
 b=AhvLAHprtUQLFmzEZcU8TRl3/URNlVfds4HStQvFGQyH7FZu3APNuGxzeVEqvMire2yq0vtmAuUhhUYv1BaPzlVod7EbnIZ8NnLSn8InOO3tK9jkEih5DYRHmOWwL3Y8H+dB7kiT4qzrC4gJrGz2XvG9URrWF+/S2BMnuUBO2SCHK4t2Nc7vqLA2y9DOLMm2IOjgrBz0Z7c3qduKzcCxkdDOvYXBbcJC8rj7zpdfseQxk7qaTBlyrZcmOFu4od4MTBauCmvPw0D4dlH0KlrE7G65sq87hA+IgCbmwVkDMgsZdC5hSOMsg8eMoYQzk6lTIGqFtkW2nz3wZwX/Xvz59Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Tue, 23 Jul
 2024 14:13:45 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 14:13:45 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for
 page faults
Thread-Topic: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for
 page faults
Thread-Index: AQHa2g7LsMzITUD090aU9yrz+VncqLH+uzOAgAWlvAA=
Date: Tue, 23 Jul 2024 14:13:45 +0000
Message-ID: <06a1ad55a644fb1f0f77b3ec3a4bc7683234521f.camel@intel.com>
References: <cover.1721415811.git.stuart.summers@intel.com>
 <27ccde70eb10ea4ba490b16bdcf1626e7f3e0e7b.1721415811.git.stuart.summers@intel.com>
 <Zpr903XK3nsmzlrM@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zpr903XK3nsmzlrM@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: 11325c57-44d1-4a5f-95d4-08dcab21aa3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RDJKOVNOenRtUHdUWjZLS0hKN1h6SVFlWTNnbWY4UUpUclpWandLcUNOa2Mz?=
 =?utf-8?B?Ym1tcHFHZ2ZaUTBsV2FNUHNTd2pOMDFuOFJ2TURoUy9nMmFVUU85UkRGWEd1?=
 =?utf-8?B?NWJjN3BUdzk3UlBDeW5MYWZZcHZpM3gzSkIzT0FFS2xWM2V2Qnh2dmk1T0k4?=
 =?utf-8?B?NGNqL1VSZTB0YVYvUjdsVzVpZk54N2dXL0h3WHhkODk3eGk3UXUrQlF0Tzdn?=
 =?utf-8?B?am43TEhGQ1hzWmR2OUx1bElRdWFESXNJdmV5b3dZZHp3MStHQnFZYkpQMEZh?=
 =?utf-8?B?Ykw2QjNtTjBhcG0wWmVPYmFCWjh1YWVTUHVTWEp4UXozTnBnNUFGNCtEdWZY?=
 =?utf-8?B?SWJzS2xNUkkxRysxb0xxSGFja1Z4T3BkdFd6UWpJRUtXY1ozc0J2QjBueVUy?=
 =?utf-8?B?citVcXpHRlNyZ2JzY3Yvek1jeGx4VW9hazYxZkJ6MStqU3VHTVRPdUh5VTVB?=
 =?utf-8?B?dUFyQnAxR1VFdEJqSjlHbUUvRFFsL3hsdW5jSnFjQ3gxUDVpR3g1RnlMbTVB?=
 =?utf-8?B?UXlTeWVvUEdrNG5ncHlVbTVPUi80YnBRMDBoZ1ZrU1dKTFhKN0Q1NFdCOTA4?=
 =?utf-8?B?TU9ncHQrc0sxRzdIWXZjc1BsbHd4T2FPRm0wUWcwQWNWTE5LRm9xNzZOR29U?=
 =?utf-8?B?YkFoZEhpeGd4WGFIQ0dPcjAvTXpETnhyejRDbkQ5d1VjT21ieGxlQzJuQWtp?=
 =?utf-8?B?akdLOTh5NkIxdUFBTEtVYzlOWmgzN0x0L3JENW96bUFob3BweENpaWN2L0oy?=
 =?utf-8?B?YzNERnFqcUwya3REVEhjZjdNYW80Tzl4MHgwOURmbWZIZVpOVFV3WjY1Wjc5?=
 =?utf-8?B?bENzcXpBcjd6RUFmM1FWVEVxbGE2enRjYVNDQmMwanJaU0R2dC9kajF2TzRL?=
 =?utf-8?B?RWdYK1hLQnp3VDdPV3czVlc4WXllRHVOTEl1cFA1QklocGhKWS9sVUNkY0tr?=
 =?utf-8?B?NENUN202VWUrNWYwajFjT1ZJclBGT3gzbUppdU9DTVFQdlE0b0JrQzlHV0Z0?=
 =?utf-8?B?akFEbW9ReXpET1ltSXdvRGJMMThUYlhNZllNek1hSnp0NUUvOFpYQmlhOEZI?=
 =?utf-8?B?dXZrOW9QK1crbVdDSS9MUWZkcytra3RFWmNFYUhiL3g3R25JaUNCaVFXN283?=
 =?utf-8?B?MG9hOEl6RHpiRHZQaFR3UG5HYmNFM1p0VFN0bTNpTmhvbko4MTBYbUYwTklJ?=
 =?utf-8?B?cWNLcHdaVFVCWFk2ZzI0QkhmN0xYdnJXUDVxZDZ6bU5UMzB5YWZ5K3VXZWlC?=
 =?utf-8?B?WXU1YWFzbTdpV0RVUGJienc0MXFrN2w1a0dBYk1rOGcwWCs1bjVnSlBrbEFM?=
 =?utf-8?B?WUxNaGJiVHErYnlBRlgwN0UydVpPSXlSNHBrVE9MOXFZYVE4SzdVZjIvcDcz?=
 =?utf-8?B?RDhSb3F6S0NEVEI4YVBpWEJienBKaUpOR05yYXdqNVR4dnJTTW5pNlFYcTJY?=
 =?utf-8?B?dCsvbkNPajhoK1JkcllVc0hYd0k5QW42VkFUSlprUTMvR3lpRlNSQ2VVTUM4?=
 =?utf-8?B?SzNFTktmZytmK2t4aktqTjdhdG0ybEtvN3didHVXMUZpZkdVb1RhZ1E5Z0Ir?=
 =?utf-8?B?OCtFSnZwdlN2V1lTNGpyT2JBUWJxbUFrdGc1QktDakRyamxYbFp6QXNpRktk?=
 =?utf-8?B?bVF6MFNDcUYwM1lxcGJLOU90Nld5MStvU0xSdkoxR1l4bTdhYnkvaWxxT3BU?=
 =?utf-8?B?dVJwbmhOVzFzQVZlTE1od29iZHhVQm1VeHF0ZUwvVGRUV09tbkdBVk15VVBq?=
 =?utf-8?B?ZXhpb2E2VmVqZWFqaU9XVVBuR0d6Y1d6amhoQklVTVRPNjhKMTNiV0tRTWZp?=
 =?utf-8?B?YzFEMWRuSXhFS3FaM3dXNXB1bTI4THVrVkFBajJMZ25KNlorRnEvcjZwQVRX?=
 =?utf-8?B?TC8zTjA5UG5hWHBveUNUR2JlUEZJLzNtODFBdzkybHkvRkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWZ1SlZTRlhPOTU3djFIQkp5ck83Y29KSmlGenNzbEJWaW1vSUpCbytvS0tk?=
 =?utf-8?B?aDBqOHRoZG5NUy94eTYxeFNlU0JzNDVYQ0MrMkVyZnJHQTc4eGdXT081bkZj?=
 =?utf-8?B?aFZpVnI1UER1Z1hRSmJFSm9zMmdDLzRmQmlEUnlvanNlaFBONzk0ZW5DemM5?=
 =?utf-8?B?eFErSGtGZVdJdFovMzRPY2RVVmVZN0crdUN0c0lIZkN2VDNLSDZ5SnBoeTE4?=
 =?utf-8?B?U3B2MTl6R0R1ZFhMWFdqa2g3cTZiMnVaSmFVc1VCSWdVTDlMRlJNM2I2R0tq?=
 =?utf-8?B?NE5uZlJvUzZCUy9wQzUyRzROR21tV2M3dW8xT3pIbGVGQ2pleHcwT2tSSy9t?=
 =?utf-8?B?M2V6eFZrNDZmNTdBMm5XQ0kxUlI0MWJoc2oyQUlyMkNQdnJVRFlMMlhPM1RV?=
 =?utf-8?B?TXJ4VFVZb2lOSitySW9EaEdPTkFBb0FmYWU4MzdTWTJkMXhZUE45QTZoVm4z?=
 =?utf-8?B?MEUzSGRlNWlBVnJqWFN4ckJRRHdzbkxpYk1GYTExVFNKVEhKTzhPVWFzMlJJ?=
 =?utf-8?B?eFhxbmhLWDBmREZUc3RRdFhLUUVkRkZ6Sk9ucytDeGJ4ZmpOWnJqTXFaWjgy?=
 =?utf-8?B?UVVZWU1MVTJiSmk3MGhOTzZ1VmxnbXBBaEYvaEpoZ0VUSGpKTTQ5TlNaVmsw?=
 =?utf-8?B?VkYzdWZxTWEzdHBMQkJ3bjlBdFZjdlhPMFQxbUpsV0g1UnY3SmlSaVh1VlpL?=
 =?utf-8?B?anVWbmFiSUJKeG8vcm5JZGRjd08wYzU5MnNYTTV4ZzVuNjRxWlpHM1VtaEpX?=
 =?utf-8?B?byt5SGhtbHdEQVpCNVRBaUxmemZESmoxQmM3MGxpNVFkWThmNkllbDJoMnVn?=
 =?utf-8?B?cHpQWWJYQUhkb2xWdjdmMzNsejI1UmRlUUhGc2p5bXdTQ1loMkNDeGlMZGhz?=
 =?utf-8?B?RUI0L0NjbGFjMnYyU0JSbVdoK3plaEhLa1VLQXd2SUNFcHVZbXgvNnZjNTdU?=
 =?utf-8?B?YnlEOUlIMG5LalR0dGdiL2JUaGhlb1g3N01lc0puMVhFTzd6azM1UWdVU0U3?=
 =?utf-8?B?RUtZMVFwREVWNjlETFZLVHdJMFBmVHF5YkhNNlMwTVUyUlJIRVQ2RXhDT0Rw?=
 =?utf-8?B?UVRQMVE1S3I4UkVuV2Z5WFJqUW5vK1BsUDAxdGNveTZxQTRYSnY2bnZjRFR5?=
 =?utf-8?B?RG1mVjIvb1ZZZUxISXd2Nnk0dmNDTVBSc21qeFo3OTJ6Q2ZLZkUrNGJ6SGp2?=
 =?utf-8?B?UVVIUUFaWlNhalZxMWcrYUFaaHlhcEYyVUhZN3BOd1YzT2xJcExyVkQ3OVRE?=
 =?utf-8?B?RkljdkZybjdpS0dGOGFESUhCNmhTQmZEaTQwQ3Yra2E3WjBnWEhMOExDaDE4?=
 =?utf-8?B?czdad3Q4SzY4OVd4bzA2dmk4ZFI4Y1NPSjdVcXFqd0srbHpoa003ckwwWTBr?=
 =?utf-8?B?cmd3bDMxTVJPVWtMTVA2d0RveTZJYkxhTXo3OUJTRHV6RzlOanRVUFloYW5C?=
 =?utf-8?B?ZWRVUmVkQkF5bTZtV0M4djk3RlZzL0Y3TWFaeDVydnhWeG1aaVlERURzeDRT?=
 =?utf-8?B?MHJuMlRtSGpZS3NTRUNjOG5rTU91d1hFamxwS21NMU9waDk1MDR0LzFtUk14?=
 =?utf-8?B?MjJSTXNiRGJMb0dhRWhybU9HbXkyc3h4YVRua0sxQTRpOVF1YW0wSTlHb2Fp?=
 =?utf-8?B?SmxWNVhDbkNEUVNkMkVWNU1kc2lKMjNFWE1uMDN5ZkxsdEFEZ1NoNFdzUDgy?=
 =?utf-8?B?MG1QcEU1WDB2cWtudXYxemdma2VqSEdrTzZtemg1Q0VnSDBkS3ZnWWEydDNx?=
 =?utf-8?B?V2dqM0tMSUg2VStVcUJpRkhaQUNBYk1pN3hraFNYS1BxdGdSR3lFWWR4Tmxs?=
 =?utf-8?B?aUZyejU4ekNQMmVTNDBLbEs3bEhVZml2b0ZJZnE5MUpmdlNoQXdkUERFR2wx?=
 =?utf-8?B?REhqdXlPMmtDVFZLQWJ5RVEvRTg0bFl4bzB0QTNkeWJZa0g2NnduM1piOVJN?=
 =?utf-8?B?YmEyK1FwK21Nd2xOck10UjJBalQzMWNZY1QzN2tKdndjbWtGbjhPalN2azI0?=
 =?utf-8?B?SHUzamtGNFFxWEMzc0dLUE1nK01JS25wa0VMV1JvT09pdlUxSkxXZG9zaWVF?=
 =?utf-8?B?b3BEaEJveElJS0xocDlkMytPUFRMSE00bHBBOVJXbnBjVEdBVnhhWHVNd1BS?=
 =?utf-8?B?d2d3YStnRG5BVXlJYVZZcG51NjAzck53a0ROd2I3VktRQWhsQ1VRSnpLN2lk?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF9F4F4EFF4F9D4DB781D4F2664D07F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11325c57-44d1-4a5f-95d4-08dcab21aa3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 14:13:45.7852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gEvXCXsUj4lJoVbFpF2XuTebTE236dV4/zAELTjElf8mpYQF5GeSlwJtUFiGROikxoqpWTNkGIQtlF0GBtmn1cOGVV3QJpR6QteQEmFMuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

T24gRnJpLCAyMDI0LTA3LTE5IGF0IDIzOjU5ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIEp1bCAxOSwgMjAyNCBhdCAwNzowNjoxNFBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBXaXRoIHRoZSBpbmNyZWFzZSBpbiB0aGUgc2l6ZSBvZiB0aGUgcmVjb3Zl
cmFibGUgcGFnZSBmYXVsdA0KPiA+IHF1ZXVlLCB3ZSB3YW50IHRvIGVuc3VyZSB0aGUgaW5pdGlh
bCBtZXNzYWdlcyBmcm9tIEd1QyBpbg0KPiA+IHRoZSBHMkggYnVmZmVyIGhhdmUgc3BhY2Ugd2hp
bGUgd2UgdHJhbnNmZXIgdGhvc2Ugb3V0IHRvIHRoZQ0KPiA+IGFjdHVhbCBwZl9xdWV1ZS4gQnVt
cCB0aGUgRzJIIHF1ZXVlIHNpemUgdG8gYWNjb3VudCBmb3IgdGhpcw0KPiA+IGluY3JlYXNlIGlu
IHRoZSBwZl9xdWV1ZSBzaXplLg0KPiA+IA0KPiANCj4gRm9yIGZ1dHVyZSByZWZlcmVuY2UsIGlu
Y2x1ZGUgY2hhbmdlIGxvZyB0byBoZWxwIHJldmlld2Vycy4NCg0KU3VyZSBtYWtlcyBzZW5zZS4g
SSBoYWQgaW5jbHVkZWQgdGhlIGNoYW5nZSBsb2cgaW4gdGhlIGNvdmVyIGxldHRlciBidXQNCmRl
Y2lkZWQgbm90IHRvIGluY2x1ZGUgaGVyZS4gSSdsbCBkbyB0aGF0IGluIHRoZSBmdXR1cmUuDQoN
Cj4gDQo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3cyBNYXR0IQ0KDQo+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMgfCAxMiArKysrKysrKysrLS0NCj4g
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IGluZGV4IDdkMmU5MzdkYTFkOC4u
YTNlOWRkNzFmOTU3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
Y3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IEBAIC0x
MDUsMTIgKzEwNSwyMCBAQCBjdF90b194ZShzdHJ1Y3QgeGVfZ3VjX2N0ICpjdCkNCj4gPiDCoCAq
IGVub3VnaCBzcGFjZSB0byBhdm9pZCBiYWNrcHJlc3N1cmUgb24gdGhlIGRyaXZlci4gV2UgaW5j
cmVhc2UNCj4gPiB0aGUgc2l6ZQ0KPiA+IMKgICogb2YgdGhlIHJlY2VpdmUgYnVmZmVyIChyZWxh
dGl2ZSB0byB0aGUgc2VuZCkgdG8gZW5zdXJlIGEgRzJIDQo+ID4gcmVzcG9uc2UNCj4gPiDCoCAq
IENUQiBoYXMgYSBsYW5kaW5nIHNwb3QuDQo+ID4gKyAqDQo+ID4gKyAqIEluIGFkZGl0aW9uIHRv
IHN1Ym1pc3Npb25zLCB0aGUgRzJIIGJ1ZmZlciBuZWVkcyB0byBiZSBhYmxlIHRvDQo+ID4gaG9s
ZA0KPiA+ICsgKiBlbm91Z2ggc3BhY2UgZm9yIHJlY292ZXJhYmxlIHBhZ2UgZmF1bHQgbm90aWZp
Y2F0aW9ucy4gVGhlDQo+ID4gbnVtYmVyIG9mDQo+ID4gKyAqIHBhZ2UgZmF1bHRzIGlzIGludGVy
cnVwdCBkcml2ZW4gYW5kIGNhbiBiZSBhcyBtdWNoIGFzIHRoZQ0KPiA+IG51bWJlciBvZg0KPiA+
ICsgKiBjb21wdXRlIHJlc291cmNlcyBhdmFpbGFibGUuIEhvd2V2ZXIsIG1vc3Qgb2YgdGhlIGFj
dHVhbCB3b3JrDQo+ID4gZm9yIHRoZXNlDQo+ID4gKyAqIGlzIGluIGEgc2VwYXJhdGUgcGFnZSBm
YXVsdCB3b3JrZXIgdGhyZWFkLiBUaGVyZWZvcmUgd2Ugb25seQ0KPiA+IG5lZWQgdG8NCj4gPiAr
ICogbWFrZSBzdXJlIHRoZSBxdWV1ZSBoYXMgZW5vdWdoIHNwYWNlIHRvIGhhbmRsZSBhbGwgb2Yg
dGhlDQo+ID4gc3VibWlzc2lvbnMNCj4gPiArICogYW5kIHJlc3BvbnNlcyBhbmQgYW4gZXh0cmEg
YnVmZmVyIGZvciBpbmNvbWluZyBwYWdlIGZhdWx0cy4NCj4gPiDCoCAqLw0KPiA+IMKgDQo+ID4g
wqAjZGVmaW5lIENUQl9ERVNDX1NJWkXCoMKgwqDCoMKgwqDCoMKgwqDCoEFMSUdOKHNpemVvZihz
dHJ1Y3QNCj4gPiBndWNfY3RfYnVmZmVyX2Rlc2MpLCBTWl8ySykNCj4gPiDCoCNkZWZpbmUgQ1RC
X0gyR19CVUZGRVJfU0laRcKgwqDCoMKgKFNaXzRLKQ0KPiA+IC0jZGVmaW5lIENUQl9HMkhfQlVG
RkVSX1NJWkXCoMKgwqDCoCg0ICogQ1RCX0gyR19CVUZGRVJfU0laRSkNCj4gPiAtI2RlZmluZSBH
MkhfUk9PTV9CVUZGRVJfU0laRcKgwqDCoChDVEJfRzJIX0JVRkZFUl9TSVpFIC8gNCkNCj4gPiAr
I2RlZmluZSBDVEJfRzJIX0JVRkZFUl9TSVpFwqDCoMKgwqAoU1pfMTI4SykNCj4gPiArI2RlZmlu
ZSBHMkhfUk9PTV9CVUZGRVJfU0laRcKgwqDCoChDVEJfRzJIX0JVRkZFUl9TSVpFIC8gMikNCj4g
PiDCoA0KPiA+IMKgLyoqDQo+ID4gwqAgKiB4ZV9ndWNfY3RfcXVldWVfcHJvY190aW1lX2ppZmZp
ZXMgLSBSZXR1cm4gbWF4aW11bSB0aW1lIHRvDQo+ID4gcHJvY2VzcyBhIGZ1bGwNCj4gPiAtLSAN
Cj4gPiAyLjM0LjENCj4gPiANCg0K
