Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95BBCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 17:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53C910E31A;
	Thu, 30 Oct 2025 17:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7Dk+YEs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6D10E31A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761845856; x=1793381856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZGdq3+3eecSnRxa22X2Tj8B8p1sqIG0jPkGX8ZlNDQU=;
 b=B7Dk+YEs0tAhNYEL7XIF+b4OjBYQjg1ygBoXEODBbQcL/XZ9G9Hl0NRL
 dYD4SLtPEVdRh93SqvTyjsP+7oIcD4KlvUpfuUtJ9c1sZhi71ye5lJRh8
 Ye72XgHS6l7KdjkSlHkcrO+TzHZePFUEZ7RVXXw4uMSB6fHvWt3MgEVl9
 KkPev5+y4xs10iduhw+bvT3dW7CKPU0lPKxlAZ5u0g/KpPw7KfjNTwGWz
 yYT5cUE449KRAz56dFEsaszDqmaTblKVa3wWjVE1RCd9h3/cy/YzOptZH
 OENBs8idrlQrY4UAtBQL9wmVlCjVLj60fYqxmNod8KZuTwuq6XPXyPS2W Q==;
X-CSE-ConnectionGUID: K5p5K1o2TASeYTqeYobtvQ==
X-CSE-MsgGUID: SeKgpl6fRKC9U0YmkG0M9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74674185"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74674185"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 10:37:36 -0700
X-CSE-ConnectionGUID: jGNKO7d5TiWGvNFqcA562Q==
X-CSE-MsgGUID: KxAfOyBfSrq4nfqeUDr2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190372871"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 10:37:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 10:37:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 10:37:31 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 10:37:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypZ1W2zUAsek2qhDO+VPZr5Ck8hjpc257E+q4KEvr7nIbfprnwXe2iAVqXM4fXrpdE6fq1XRjTUvA9qpAIqECnJPJSZ0+gz3e6Bt4ML5xybZE+YxIC4F7xvBCU+fv/EYy9hJ/3gF/G8kfLXGTCXl+w+XICyEgxGIUOalHuTVq2l5tjlDhpBrKj+S/LpQ8rmq1NeAtTCEwcUhLA5zYhToyioqBvgm0Zdau3W92S2xz417kzk/TbYQhU/kzA2xlbogrfR9LOh4rhkwf6g/tm/9nPjTF39GBMO6r0hBy4zLrsTor8xNsTYFEGfkXBmLyT/V8TZLH7ACkbTJG+sXVU36fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGdq3+3eecSnRxa22X2Tj8B8p1sqIG0jPkGX8ZlNDQU=;
 b=eYvHKUMLwDvPxYgjYrGgh4TS3gCQj+qb11FSlGhl8sZAhliDJoj7UU4F1YUHEfybfU4dJ3bZsPX3Ve1g6hJ0iflAykla4bWyWu0d1zPQw+sVEsA7Q6sutid1otH8MDzSIzJ4Ts18B+57oucUToVm2se0goAC9Crro4IKvYUAtZD1zg2LJs/sZzIVT1S56+0WoDqtgT0C9rn9h8mPZglObtYK98uG2ZjgUvgaTiR9PPXJcS41iCtSztTamRvG9H/Q2Ee8xC/HZ6iRxcFTivdPCHMAX+YG1rcvoHu5osT8qmv635HFX1Zcyf25/3ExLJYwWLbhWbTUk7d9jhELaXUdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 17:37:29 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 17:37:29 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Thread-Topic: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Thread-Index: AQHcSa97mAQMgVo+LUS4wPWhlMW5ELTa9FiA
Date: Thu, 30 Oct 2025 17:37:29 +0000
Message-ID: <b3d8c801d84a807fab0e53d1e6134e3234024b44.camel@intel.com>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6401:EE_
x-ms-office365-filtering-correlation-id: b01f136e-c7d7-4f8f-5d88-08de17daff92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?clg3ZTlEMUtWZnlTWVd4SGZSN09XZFRBdFc3RjNDb0VaQ1diVDhnLzFJVXVD?=
 =?utf-8?B?TnB3K3hqM0Q4NkprQ1hiejNCdEo5RlIxMUxsNEYrSWxTcnhxZWRsVFlRUnB6?=
 =?utf-8?B?VldXVDF6QVRTYkRIeVFhTlord1ZoQ0g1Vk10a1Q1L1hvM1hwczV5ZndKTE9M?=
 =?utf-8?B?VGVTSzNRdmVGREs0NVVIdkM4NTQ3NHNBenJXcUJoQ0x0bWdKNVZzRmEzRlB4?=
 =?utf-8?B?SWQ1cGNMekJablFrVzRqZGQzcFJmZm5PRCtTYzB3cjZaVjdmeTY3TTdycXRT?=
 =?utf-8?B?QjdXcEVNcUxyamdIZlAySGVqUzlhU0RzQ1ZZd0Q2cGxKb1JnanBnZjhqelMw?=
 =?utf-8?B?UVhRVzU4aG1DdlcwR1JIZ1pLaGtOdTZvdWw5TjNhM2NRVTJzTHNQam15NzFu?=
 =?utf-8?B?bnVFbU8wY240TFdQOEIrOXJHMzNic0xqM0g4YVRDUjA4KzAvMWFwU2wzMUJP?=
 =?utf-8?B?d0luZHIxODR4R25QTlJqcXdwZ09xa2lqTVM5cktTNEErVmlzSFU1VUUzRXkw?=
 =?utf-8?B?NUJFWjVuRmpMMkE0N0gzeDcrajV5UzdhL085NFpvZ3pqZmNMdVBCOTkyMWxy?=
 =?utf-8?B?T0FmNUlLclVtMkpXV1kxN3UxVDJTTUNodGFuS0ZZd2tpQ1d5WHcrSnJTOVVN?=
 =?utf-8?B?RHA3bXdiWjN4N2h5ckkvQkN0OHdqdlZOYUdwSVhmSzZFMzZKR1dsbkMya3Bh?=
 =?utf-8?B?b2FwUWU5MnJ3c0NHbSsxcm9XRWJ3WStqZFZDQWFianZDdWppbktEZUp4NTNJ?=
 =?utf-8?B?eXVuNnNWVTd1OE5wTEs5Nm5tR3hkRHhWZ0VwQ3B0Q3I0UDU5TUhmRVNnR3du?=
 =?utf-8?B?QndOMHF2cnprRk1tdEQ3V0MvZnc2ZGpFd2dOUGErUExUaWxESVJxRCtXMWJn?=
 =?utf-8?B?YStkVERjTkZISjRsaDZnZVVHME5qWTB4bmtaUE1TeWVUN1NkS0dHMTNHSDhp?=
 =?utf-8?B?R241cC9qQ1dxNCtleFVYWUQ4dmFieWg2SWZpL2hObm0veGhHYlhqTjAwdW1h?=
 =?utf-8?B?WVFYM3VuTWJnME1ZMHhqR2YrZ29sRytTVlViSUlKRm03M3d5YmV0VHJNWGhm?=
 =?utf-8?B?NEN4VE9uUVEra0xpMlNHeURCUXYzMFVZRXJtUW0yUUNVeFozYmpmS3dUanFK?=
 =?utf-8?B?SWlWOE11TW1saFdKODZPNm1LcTZ2YWdQa1JqT1hsVEFKVlpRU1pBUHhhWm1O?=
 =?utf-8?B?NCtWMkUrc2c0c3lPVXVtQ1FwTEg2dXZCVU9MaXhhQ21pazJoWm93Y3RKNjd2?=
 =?utf-8?B?d29rSHdjS01IWVJKYzlmNjRmeVo0TjdYMitYZXpJcGJhbFcyc1ZHZ0Y2YzFV?=
 =?utf-8?B?Q2lpdU1ZdjdpR1BsbW15M1RZUnRYWmd0UHNPM2JiTFprcjhQNDZMblNES3o1?=
 =?utf-8?B?QnkrSGxKUW50UVhqbnRJOVU4dGtXa0xRRWtQSGliUUlsa1BJaDMxYVVsbWxy?=
 =?utf-8?B?bmpUVjZJU0d4TzNCd0RyVWhQS21zRi9OL1k4ZGdoM1lzV25kemF0SEZXVEo4?=
 =?utf-8?B?eVV2eWVqdThQT29xQUxSTk5XNHpwenhsbzR3OEdUQXJJd1l0UjBpTWZLc0FC?=
 =?utf-8?B?T3ROek5rTkQ5ZEtUc21KMENWVExUYXZMb2pFa29FYTFtREhhNlZ0akcrblg3?=
 =?utf-8?B?UUVaSzdDazdXV3hlWkg3MXRmZjRINlJlQTV4Zk5hZWhudU02QVo0OFdpU3pn?=
 =?utf-8?B?VjFQVVVOUGQ5Q1B5Y0o0YmtUWVI0czRtNkp4dFhRRmtSMWpsL2M4b2FvbTFN?=
 =?utf-8?B?eG5aYjV4OTZoYTY0TUIyNXBqN3N3ai9Bek5hRG5kT2UrR1ZQNDdPdUtjd0lU?=
 =?utf-8?B?YkFuYUZZcTFxdE9oV2Yrd3pXTUxUelcwMm8vRjNWVjUxYk5tb012YWtsOVZv?=
 =?utf-8?B?TUVCT3RlL01wRmRuUmRvWUhQMENFbXZkMFdKTjNmQ3U3YUdKQUlxUi9ObWUw?=
 =?utf-8?B?aE5nSFlINXdhWVJuRDFQUkw0b2FIeDlDNUMxM3p3L0ZkT1RmRHYvc3VwTmRE?=
 =?utf-8?B?Z0U5RDdUWFM5bjh3NjdNLzUzUDNBd2V3QWJ1K2V6SHBETnpIdk85UG1iR3lK?=
 =?utf-8?Q?qWscda?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkRoRzNtUFFvcldockZjeDk1V051ZWRxdjJCWGptdFR1U3Y2UGUyV0lKWDN4?=
 =?utf-8?B?RU1LamVDZ3YyN2daN1U2ZllpN1RqZ013YjV4TUc5MnJYcWVjWEVDMFZWQkpq?=
 =?utf-8?B?c0VoenRjVDczTjZHUkltUDFjRFlNZU5IaEhOMWlObmpmUkZNeUJrQVk3TXR0?=
 =?utf-8?B?bTc1cnZyTFNIRTlCakUzcXBUOThrRHZ2WkhNbXZIUWFtNFBwMjJWWEdOOVpK?=
 =?utf-8?B?RWNSQU9ZTExKZjlnN3MzVXV1em0rRTN1VWxVWURFbGg1S2NIZy9Jd08rdjJC?=
 =?utf-8?B?c0s1R2tSUmJyaEZkOVE1SzdEY2M5T29GditzZmJSSDNKdUpjNnprdUN1dmZj?=
 =?utf-8?B?QVdaZDgwSlhBL2YyRFhTeVRwTlRjNlNiYkdKcUJINzRrTXB5R3hqOWg5VFda?=
 =?utf-8?B?VWw1L1NMMk9KZ0FoakxBSVQrZW00Uk1YUG5RclVEWk13Qndvc2dNMW52QmUr?=
 =?utf-8?B?L0E2N3NwamdqMGlkV1JUVWo5M3VZdjJWZFdZc1JvNE9Ramh2RFhvbUJROEx4?=
 =?utf-8?B?SDNrdldJbEdBRmpvZHlYMVVHdEQwUlFtWGpseUxvbmMrVWZzd3ZLR1NSWVBw?=
 =?utf-8?B?Rm9PWHR5US9YSlRuWXY3MU9ZMVlWWUJtZklzeFFOellwbXBZbWFoVThQaWxS?=
 =?utf-8?B?Sk81cnJBTjVMN0lIR3h3WlFyUGQxaERpR2hXbHM4WlBiT2FSMEZtSnRGeXZP?=
 =?utf-8?B?WkJxVDJkdXJ1emdib3VXSmphV3FtVGtiVGcvb0pEVHlsY2VEQ1MyY3JTK3pq?=
 =?utf-8?B?L05YNG54R0g4MEtLREhneXd1YlhhK2xSaitvWkNpMXc4Si9KQ254ZEp3bFlm?=
 =?utf-8?B?N3h4U1FsUU0xRVNoOHBlL0xBUGF0NFpERlJYOXorU3c0NmZOQkRNV3J2dE8v?=
 =?utf-8?B?UEZxOUY3SzR6YXFKRjR6S3ErTkVDd0ZSbmlHVFRQeFBmbEpvOFNlV1FNQzNt?=
 =?utf-8?B?dUlYYnluQVFpS0ZTN2gzbUJ2YVdRSW1UTUJuNjQraC9hZFpBV1ZHbG1aaHVn?=
 =?utf-8?B?K1lvNmR2NmdpN1RobTNQZktUaWQwRnltNjFORDAwdko1RGZTVXQzQkgzYk1O?=
 =?utf-8?B?RHlFZkZLalV1cnVjbE9ieHp2V2xTTTFVZXFCREpLVTd0RTVORGdKYlcxNC9F?=
 =?utf-8?B?bWdFbDVBYmgvdWhhalN6RWxVaVZESGUrR3BZVi9pc3dnN3hrNytqeDZMSCtJ?=
 =?utf-8?B?QmQ0cGVacXdNTnN2dGZGMnRVRFEwUjZhOW9FcHc4RWJ0TjRPWFQvZE9Za1ZG?=
 =?utf-8?B?STNIblhWTk83cVlhWlV2Ly9UMGdiYnp5VEdnYXhNSW5JelVMYlE2YnFBVHBo?=
 =?utf-8?B?a2ZiaDc3SnpVc0xIaDZTNWlzU3lHK1AyenQ4b0pRZm9JbnBKem5Zc0VqQnV6?=
 =?utf-8?B?QXRLN0dEcVBOZWJXUzl1SVp0RHp5a2JZOUJjdkIrNmpiOEVRTFREUVFzaDg3?=
 =?utf-8?B?dCtEMmpvU2QyV25NNEdPQ1dHeTlWZzNObEZLV2UwcnZnZGVaZnNScHl4SmJZ?=
 =?utf-8?B?bXg1Q1lCdlFaQVQvY21TODJMY1ZpTXlLTFljbEZybjZaMUl2Q201TXg2ZEk0?=
 =?utf-8?B?eFFiZ3RDRGdvb3dObmxmNXcxdUtYcFpOVHRvSk9Rek1aMEhOeWNyZEcyR0h4?=
 =?utf-8?B?VEJkUFRHaFZwbEtyQkc2bldONVdFQW1OYzBjanFnTmlYMnk5OUh6WjNDM05r?=
 =?utf-8?B?Q1cvaXpPMVFLM1ArUTQwb1pqTjREbG9IZ3hBTlFIUVRpRUtWdXJiZGhxYWY4?=
 =?utf-8?B?VENQSUEweUpMNTI3L1F6R3JrL3JaMFhscVNXVkloVlFUT1hCVWxvWkx4b2Uv?=
 =?utf-8?B?Z1FKMGwzS3NTNGNSNjBBMU0wUk8wQjJKQXFMSVRRUGFLNzNnY0tuT2tpalE2?=
 =?utf-8?B?ZkgxTnhtY2NCejRMMU1NbWVzVjdXVXVtMW52OHh3NFQ1bzBUUDFFZjVtazcr?=
 =?utf-8?B?VzAvR1hxaWx2RzZyVHd0UVhKUWtTUXFKYmluMHFYYS9QVnBib1orY2t4bzVU?=
 =?utf-8?B?bzVWUVNFaFdpVmJZWWpKM1FENUowaXhnZi9NRUo2SUlnaEo5WGlBSTVUOW1T?=
 =?utf-8?B?bUUrbTFmLzhhdDR5RFE4NFRkU1V4cGVxcDI2TVBXYld4NFV4NUdOeU5hT2hT?=
 =?utf-8?B?LzJzVFFhZldFdHhWZlZzckJOSy9oYUNEWTRHbzdsYXVKakgwbXd4SjNEUFMr?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2693E2CAFA9E354DA825B4FC4ADFED15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01f136e-c7d7-4f8f-5d88-08de17daff92
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 17:37:29.0927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1kNRyUuAR+MYptRZRYMkjkpA1HotGCsN/XENITQ5xwJh5xxozK39GU1U29A2/FKfP6JceVxx0smEiaRjw1hPj0RKgCyXR8Ce32spPEFBks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDIwOjQxICswNTMwLCBCYWxhc3VicmFtYW5pIFZpdmVrYW5h
bmRhbiB3cm90ZToNCj4gV2hlbiB1bmJpbmRpbmcgd2FpdCBmb3IgYW55IEdUIHJlc2V0IGluIHBy
b2dyZXNzIHRvIGNvbXBsZXRlLg0KPiBVbmJpbmRpbmcNCj4gd2lsbCByZWxlYXNlIHRoZSBtbWlv
IG1hcHBpbmcgYnV0IG1taW8gb3BlcmF0aW9ucyBhcmUgcGVyZm9ybWVkDQo+IGR1cmluZw0KPiBH
VCByZXNldCBjYXVzaW5nIEtlcm5lbCBwYW5pYy4NCg0KRG8geW91IGhhdmUgYW4gZXhhbXBsZSBr
ZXJuZWwgcGFuaWMgeW91IGNhbiBwcm92aWRlIGluIHRoZSBjb21taXQgaGVyZT8NCkkndmUgc2Vl
biBzaW1pbGFyLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gQ2M6IEx1Y2FzIERlIE1hcmNo
aSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBCYWxhc3VicmFt
YW5pIFZpdmVrYW5hbmRhbg0KPiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29t
Pg0KPiAtLS0NCj4gdjI6DQo+IMKgLSBVc2UgdGhlIG1hbmFnZWQgcmVzb3VyY2UgcmVsZWFzZSBm
dW5jdGlvbiB0byB3YWl0IGZvciBHVCByZXNldA0KPiBkdXJpbmcNCj4gwqDCoCB1bmJpbmQgKEx1
Y2FzKQ0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyB8IDIgKysNCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiBpbmRl
eCA4OTgwOGIzM2QwYTguLmQwZjhjNDBiYzUxZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMNCj4gQEAg
LTYwNyw2ICs2MDcsOCBAQCBzdGF0aWMgdm9pZCB4ZV9ndF9maW5pKHZvaWQgKmFyZykNCj4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSBhcmc7DQo+IMKgwqDCoMKgwqDCoMKgwqBp
bnQgaTsNCj4gwqANCj4gK8KgwqDCoMKgwqDCoMKgZGlzYWJsZV93b3JrX3N5bmMoJmd0LT5yZXNl
dC53b3JrZXIpOw0KPiArDQo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgWEVfRU5H
SU5FX0NMQVNTX01BWDsgKytpKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X2h3X2ZlbmNlX2lycV9maW5pc2goJmd0LT5mZW5jZV9pcnFbaV0pOw0KPiDCoA0KDQo=
