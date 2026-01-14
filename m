Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D23D39011
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 20:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B981E10E688;
	Wed, 14 Jan 2026 20:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gh434z66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9228510E686
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 20:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768422360; x=1799958360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Jga5v+IcFjNuzbxGhYzGcETpW+hR90B4gJ66WI1z4C0=;
 b=Gh434z66W7im1loUdHAe4AYOR4hB/leCxdEfzrMLk/KLotyhuUlOjFES
 58dS713lmMcyiCI72RqREO1Z5O7ae0jFfyHI/nKXuFgC3EgzUIq408sP+
 Pg/bK5FarDYB7bP9jQRxnfD/SDfDmvP10Ste42NSVy+l/EjCybZj9P/Oj
 HxGDdAJEX5dTpjbHpUzaxvOnEiQHUDOfaYQ/wBLN7fUFhYVwm6P4yHjtq
 e2ku6ksEJhnQFqfdH7YRtXlg1AmLfqRwxB3Q4fx1UjC/XzSb2GpWUZo/x
 mvITwoJqocWU2ae6E9CUc80ruHagUEHMKqQ5p+po2NsDWx8AoOm/yyZe2 g==;
X-CSE-ConnectionGUID: CfunQSSSQWa122OKzvjSEA==
X-CSE-MsgGUID: QJK1LjulQbWRHDcIA3tSyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81175989"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="81175989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 12:26:00 -0800
X-CSE-ConnectionGUID: yy9yNCqzR9GJkzaLn7k+wQ==
X-CSE-MsgGUID: TCF3pSoVQtOs3wx00WCGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="209237945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 12:25:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 12:25:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 12:25:58 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 12:25:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaObYTfZnlop+L+0gO4jvwm5sslYqi0hx8cZJKGkb7gK0efJuhBkRnuBrDjnb2r4i7PSpwl8pL30V1mFl3ZKjGlf7usenGPY/2bOjjkRyqXZeXhvXxqWbexmMnMfr3M5ae2pgce8GvZZBan6adMAe4C1lLPBUULj0U8nrp40wB4JmdyVl+nh3MEPkAh+Bcq9V6pTztR+dHAosyCAz7CQuIvlIX2Vv33zyhKAZ5D6bvUv/g2Av/joZmCKHBBbUXUY4i43++mwIuPIvOIgoEtq/BNZHCAqgTBMY58aGEYOGsZfQEnxB5F0VKREhdL4nG0/zfbifvjtnIAWeYHLznN1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jga5v+IcFjNuzbxGhYzGcETpW+hR90B4gJ66WI1z4C0=;
 b=HB4zQ24+o3YT3Y0IYOS6Nfuu/t184G4d61jcLTeC6twDx5Bl7YkxuH3AEjq8pdsrCq9kRFTAl82kTZjuNglt4czCcZcWztvkC0B8/B/pLGFJmF/jNwUxcD06iUq92CgwXJeGBIod36haDXaSBWJFQ4maio+KyxUVasDc5kqTvVQ0npLXrPBlPQfbh1jnAEIbWfHrQZbOi83ItyF9V++eCeOZZ7lNODtN+m7MJdXoK0QMOs97V6UNLqHb6KSXBr6/QRUs/mMeinUxlrZ/PGke8kB3i9HsjORMf03BX9j3OWVj5nH52PTHGBqycbfhsNOP5RkoakKVxOOba56cziuHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB5158.namprd11.prod.outlook.com (2603:10b6:510:3b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Wed, 14 Jan 2026 20:25:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 20:25:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Thread-Topic: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Thread-Index: AQHchYaDrxfUY7xpfUmEiw6yUbS/OLVSHOkA
Date: Wed, 14 Jan 2026 20:25:55 +0000
Message-ID: <cf8ccdcfa6e3e22b0979d88f6eeea5f2cf4e4a2b.camel@intel.com>
References: <20260114184905.4189026-1-matthew.brost@intel.com>
In-Reply-To: <20260114184905.4189026-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB5158:EE_
x-ms-office365-filtering-correlation-id: e1125332-0d2d-41af-6626-08de53ab1f25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T0wvcjB4SFpGbmhkQjhnTGN0R0QwSmNNaUdiaVVNV21NOHV0N0l0dTBhZVhs?=
 =?utf-8?B?bjRlN0NiUHJoaGZ4R1huZDJpWWNOUHJwcVp2SEhoUHhGS1hzVUYzUUdraHp4?=
 =?utf-8?B?NFdTNXI2QnJULzlETFVSR0RCZTdUbTJDbEJLYVVkUW9saWNUb1dvd2FscnhK?=
 =?utf-8?B?QU5mTWU2c0ovMm9PeU90WVBuWVNmbXJLYjhnTVZ1ZERIQko0MW80WmpvWFhJ?=
 =?utf-8?B?OEQyWHVwK2dZUUtKZjZyMGY0Y1BSSnVzT2IvTVJIWFovOVI3ck00bHJuN1lR?=
 =?utf-8?B?d1l0ZVlJZ0tiRGdsODNhZXFmZUVVZzlmL3IvaFEvY0JhbXFOSnN1QXpOQ2Na?=
 =?utf-8?B?bTE5eWh1SWZ2dFJ3M2ZRNVBCRnc4eFpiV21MVkt4S1dLY1ZRUzBlUENtQzJm?=
 =?utf-8?B?U2VRS2lMbFhTV0d1MDBzd1RKRytrcGhTRC9pMERXdmdiVU5kaVFxV200NlBy?=
 =?utf-8?B?Ym5ZSElPYVVQRkNBd0VrZW0xUEhFQVZhOFZCRCswcHVYamV2VGx6UzJic0t6?=
 =?utf-8?B?TUowT0tXNmZIUFVpcUJidmdhV2ljUTZacys4eEcvSVEzcjdZdDJGbW1EU2g4?=
 =?utf-8?B?enJINVFFS3IreEhGRmNEOERsandJbkhYQ0g3cCsycHNadTZhZFYzUHJxOHoy?=
 =?utf-8?B?S3UzMlZFRXpCNzBLWEhTbGZUcUZxZmRTRmZwUjc1cm9KQ3dtTUJVQ0o0UzZx?=
 =?utf-8?B?dU8vRFBWK0hRWkxMN2xId0poUm00ZFI5dVNWU0Ezbzl3djlHK0ljZ0J2b0E0?=
 =?utf-8?B?M2ZadHd2cVVoK3Njb1hBNmVaQkFqWjB6UWcyQysrUXF6MFJQbEVqdG4rMFVj?=
 =?utf-8?B?N3kvQ2tqQzlFMDMza1hMNHdLdnhVSWVaeDRUSUZ6dXBDVDFTNndyWVdIeFNL?=
 =?utf-8?B?T1paOUdBYXZBUG4xVzBsa2trMlRvY2VYd3dwZCtqeUszTWtFVkRMUXJkREF5?=
 =?utf-8?B?eUkzc0NuYVpzMW5PR3V6UUIrVEluZUhvVURaZytrZnJvQmlJMSthVGZ5cTNI?=
 =?utf-8?B?RDZTRyt3M290cUVMZUxPbUZvaTZPRHQvVFUrUkR0NC9uQmdadEdpRlM2WXRN?=
 =?utf-8?B?REIrMHBBZjNkd3VOMGRMZ29GNHcxTlYzQ2VPcVNBSzFMZ2ZrS0JKS0pmVWxi?=
 =?utf-8?B?NU5iVnd5OHE4SXVZOHlXZldjNnNXUHBjR2xLS0taNEdOYXROOVp2RkNIc1Vm?=
 =?utf-8?B?dVpsaFlGQzZRZnQrQW4zMEdEV3lmNDNIRWd5a3cwZy9GOGNFT2NVN2JNNkho?=
 =?utf-8?B?d1I3THhUazFFaEc2NlpRYW00N1poRUgxQWhzcEFNZE9iQS80M0FkeGMxZWx1?=
 =?utf-8?B?VkhVNk02Y21RVnZtbVp5OW92blpZSmUwZDlWOTVVMk9YQTVjZmJ3K25WWkJq?=
 =?utf-8?B?T3FqZTgrbHpwVjcvVGdwd0lqR253QWl1RzByZTdVcmlQTzYva2RYa1pMNFBI?=
 =?utf-8?B?VVlZRTNsdU9LaHNkRVNsVVg4L3FSWU5kYnNZUFBaS2o0aVQ0SFh5Ry9zbElj?=
 =?utf-8?B?NXFVUUlrYUpLVnBqZER0WndqMzhZaUdYRElKZUpHSUZqQlJMVHBxR3hRditB?=
 =?utf-8?B?bTEzUFJQY3dQWmRVM1Y2eHprTzI1MXlVaDJPM1NFN0ppWjQzZ3h4MjlXWEpB?=
 =?utf-8?B?NGt6QW5hOENnUStHaXlEMWpuUHV0cDREK0NnWWU0em1kcHYrbHZrVFFNd0Rs?=
 =?utf-8?B?dzF6VFQrNFN1d3RSeDNLNXhvSjdnNXBUYVJhblBiV05FMUxPb1p6L3FBcFl0?=
 =?utf-8?B?U2hycUxCM3hnejJGemN0ZFJGRlRyczNpUHZsbUR6TjMrUkRXMDVVVWRBMkJX?=
 =?utf-8?B?UWd0SWxaVjNndjJkdzV6L0RnRThuSHBTRVVLM1hkc2NvQ3MzVWxDeHcrbWtT?=
 =?utf-8?B?TUhLOHhUdk5YYjlJSGU2M05wSmdxVmhERSs3TS94cDYyRFZFY3NINmU5d0Zp?=
 =?utf-8?B?aW1hT2xjUWFtZXBUYVNEbVd6UEFXZ2k2ZDhsRkE5V1creUp1c3hVeldWeU5k?=
 =?utf-8?B?Vnp5NUt2blVDVHI1bnRrSUNNV25vSWtiUkpSTnpXN2lsOHkxS21oWEtubEJD?=
 =?utf-8?B?eW5OY05jTEd4SGxKVUFaWmZmV2pEM3NOVkJ1M3lkZHNzZGFzY3N1ZG1YSXVR?=
 =?utf-8?Q?HDkSaYw7+FHzDGARlzpsPnKKW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1lGREdrTjkzL1BEWDdhQjNMeDhZOVh5YVdMTzYvTnVqZzlrNDZyUlB5eWR1?=
 =?utf-8?B?dVJhTHhZN25MeXVna0JNQ0VpcURzTDQydkhlS1kwangrb3FPS0ZEeHkvTWRD?=
 =?utf-8?B?ZTdXZXBqd3R0ZHZkdWxXa0gzUHdWK2RjV0RQblBvNHdOeDVEeEVtTVBIdTAx?=
 =?utf-8?B?THJIWEMrQVNSdytzeGVHQmQxZFBsMk1ueEFmTXZaSDBNOVA0cFp0NmlMYkhv?=
 =?utf-8?B?Q21nMnZtSy94ZEQvS3FZRngzcWhYb2ZBTXZnZEcyd0JvblRPODA1RkE3OVJl?=
 =?utf-8?B?WlFvV0lkeHBVWExzcU1uVm9BdG9VMUpRZG10dWZBMkVuMFdrd21lbUQ2bStr?=
 =?utf-8?B?VmpzamhKbUg1WjczQmQwdnRpelNZZjBrOGg0bEN5bzJtQXN5RVA1cmRRTTls?=
 =?utf-8?B?OHh6c0xNQWErNnFjZVY4N0x4MmI5UkdKQWlOem1nbGl5QXBPb2d0aVc4d2ZL?=
 =?utf-8?B?WENBNVpsdlZja29heDBHYXdHc0FNdENRSDJ6TkVXNkJDcy9XT2dnVktGckpu?=
 =?utf-8?B?SW94Sy9pd3gwbURWQzNrYkJOS3dza3lucC9rR3llcHgrWCtpUmpJSDJ1amZv?=
 =?utf-8?B?WW90d3l3QjlkSG9CQ2dqbDF2OUZ4ZTJZZVFPdFBoRU1nN28xRE1mdm1JbjRn?=
 =?utf-8?B?akRha2luL1pnTmtxeGpBSUNZWDBDVnIxZGpqNFE2UmJrSUYwSlpsYnl5OTZD?=
 =?utf-8?B?SEo3a0dWZDk2ZklEN3VveVZqYmFES3plakFTSERNbFNyb0d3NXh3bzRCVFdk?=
 =?utf-8?B?VVduM3ZpdnIycmZtdEJ4dFlaNWsyV2VhOEk1Y0x1enRLOXhOdCtGb0cya05p?=
 =?utf-8?B?S1FpSFdPY2tVMmZubFEvVlJVSFJUa0tpL0ZhQlFxK3NXVjh5U3VSSWQyNzVt?=
 =?utf-8?B?YUxuS0RxRjRsd2l2UEFuaUE5QUUyTjBlK1VnVzdwdDdRQmhvQ09JMFlvYk96?=
 =?utf-8?B?RlVEaGpCemFtNjJvUWh4TW5QeEhaWjNocHpWMS9mcEtHNi9HQVQ5K3R1RTVP?=
 =?utf-8?B?WnowUjJjbkcwYXUyZVFBVGNUOXR6bUVrQkMwRUl5SjFyMVNrN05vUmkvRXQ1?=
 =?utf-8?B?NFNlUkxjMklhYWx1dnRZR1dIdHM1TmtRZE4xd3EwbE5XRHpTZ0dnZFZDWXE1?=
 =?utf-8?B?WFlJZ3ZuYWw3MDNiVVljaHMralI5Slo3Sk95bEo3NmEvazIyLzBxaW9RSnBr?=
 =?utf-8?B?bi95YTBrNUVSRFZDQWJjVkozK3BMb2JSS1NLa0o3K2NOZDRJV1d4TlVLVzcz?=
 =?utf-8?B?Ylp3NW9MREx4QUdoMk00SmZ6QzZ5OUx6VzVCa3lHZmorRGN2Si9rcVVJdFo0?=
 =?utf-8?B?MWNRREduU3VtZ2luNzFiQmVNQ2hEaktKc1hDNmdMdXJ3YWhrZ1dCbkhSWUZr?=
 =?utf-8?B?TWNEM2xSQm9HRHYvVkhUei8wQTFTOXZpcy9MVWJWOVJFWlZwdTkzYnMrT3Mr?=
 =?utf-8?B?RDYyS3psWHB3UjNteWxRNXZFRWNIaTVUcVVVNXhsY3NDdjBQRC9vdnlrdldR?=
 =?utf-8?B?ZFQ0OEloc1NpeTJzV1RMd2N3eXRFdWRjWVV0alhPYTVpWXdSU1p1OHdvVTVk?=
 =?utf-8?B?ZGJzdjhsVFJqeThJUnQwNlhxNFRxRFluOVgxQVFaYUJLSDA1YVJzdDNHTHQy?=
 =?utf-8?B?MkZ0MlYrdkRNR0JmeEJzemJhakFxUXFvVEgybVhPbENNNG94OE40dnlvQXFq?=
 =?utf-8?B?bjhMa0hzRGVhN2d4Nm5sZlEzdGhTQTZuVWxGS043dWtocXA3OTNXaEsxTHJr?=
 =?utf-8?B?VWI4UVgzcnhrbFV5andNZGF0NUN5Yy9hUWhtQ1pKRXg0eHF4c2ZMd3pSSzVO?=
 =?utf-8?B?YUFWdGE0ZjFHWWwrYjN0OVVPckhJZGdMcXVHblNEc0laeTVxUG55TEFCTzZZ?=
 =?utf-8?B?V2M2b1JwQUkwZmJ2K2dLenp4NXJURk5icjV4ZHpxUFhVVXN1aFFDOGt5Nzcy?=
 =?utf-8?B?YUIyVHFYT0VScE5FeTdWbTBsNldMSTIyYi8xb3NZNWM1YmdyVXVxNUQyY3ZT?=
 =?utf-8?B?TkdoT29xTktXTHlwbHZ6c3JsWjRhYmtwejIyMDdkQm53OXkyWUNtT0VyRVdF?=
 =?utf-8?B?SEFRMmlJODVsclFsbGNEMVBPNDZFaXhIaHlhUTJZYlBkc2pEVVViL1oxTnZQ?=
 =?utf-8?B?SFJISmtnOEF6aUMrN1kwZU1OVDd2TXV2c0FGS2grYi9kSmJ3Z2JYOEdQYWJk?=
 =?utf-8?B?Tm8rekhibXkrRVRvK09wa09TbHVyNlJVaWFucnNlbDJJSWVSazYxaFFuYk5s?=
 =?utf-8?B?c1hIOHFkM292YitlazJEYXlPWHN1UnBsNHRJWWI3K0lJUzBNdEZlSXUrN0Fj?=
 =?utf-8?B?dERyUDR1ZWdKaXAxTTZWOURDQU5oOENEcmdzNnJQYWViZ3IzVUxFUUYvaHNB?=
 =?utf-8?Q?VtfBcmmuHJgvsKZk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEB3992351B1A74C933CADE2A6A23BF8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1125332-0d2d-41af-6626-08de53ab1f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 20:25:55.9698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgaveR6XUxxXjckPUb3tP42RwuqeRlm0XgK87SIlcnQOhuTRig955YqdijGQD/85QFQcoDYkIgdpVA0oRKgsVv08YX7+hXi8t2bxJ3PNErU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5158
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

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDEwOjQ5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEFuIExSQyB0aW1lc3RhbXAgZ2V0dGluZyBzdHVjayBpcyBhIHNvbWV3aGF0IG5vcm1hbCBvY2N1
cnJlbmNlLiBJZiBhCj4gc2luZ2xlIFZGIHN1Ym1pdHMgYSBqb2IgdGhhdCBkb2VzIG5vdCBnZXQg
dGltZXNsaWNlZCwgdGhlIExSQwo+IHRpbWVzdGFtcAo+IHdpbGwgbm90IGluY3JlbWVudC4gUmVk
dWNlIHRoZSBMUkMgdGltZXN0YW1wIHN0dWNrIG1lc3NhZ2Ugb24gVkZzIHRvCj4gbm90aWNlIChz
YW1lIGxvZyBsZXZlbCBhcyBqb2IgdGltZW91dCkgdG8gYXZvaWQgZmFsc2UgQ0kgYnVncyBpbgo+
IHRlc3RzCj4gd2hlcmUgYSBWRiBzdWJtaXRzIGEgam9iIHRoYXQgZG9lcyBub3QgZ2V0IHRpbWVz
bGljZWQuCgpPayBhbmQgaWYgdGhpcyBoYXBwZW5zIGFuZCB0aGVyZSBpcyBhbiBhY3R1YWwgcHJv
YmxlbSwgdGhlIHF1ZXVlIHdpbGwKYmUgYmFubmVkIGl0IGxvb2tzIGxpa2UgZnJvbSB0aGUgZWFy
bGllciBwYXRjaCwgc28gc2hvdWxkIHN0aWxsIGJlIG9rLiAKCk15IG9ubHkgcXVlc3Rpb24gaXMg
d2h5IG5vdCBtb3ZlIGJvdGggY2FzZXMgKFZGIGFuZCBub24tVkYpIHRvIG5vdGljZT8KSXMgdGhl
IGlkZWEgdGhhdCBpbiB0aGUgbm9uLVZGIGNhc2UsIHRoZSByZXNldCBpcyBhbHJlYWR5IGFuIGVy
cm9yIGFuZApzbyB0aGUgZXh0cmEgd2FybiBpcyBvaz8gQnV0IGluIHRoYXQgY2FzZSBJJ2QgYWxy
ZWFkeSBleHBlY3Qgc29tZSBvdGhlcgplcnJvciBtZXNzYWdlIHRvIHRyaWdnZXIgQ0kgKGxpa2Ug
dGhlIGVuZ2luZSByZXNldCBub3RpZmljYXRpb24gZnJvbQpHdUMpLiBTbyB0aGUgZXh0cmEgaW5m
b3JtYXRpb24gaGVyZSByZWFsbHkgaXNuJ3QgZG9pbmcgYSB3aG9sZSBsb3QgbW9yZQpmcm9tIGEg
d2FybmluZyBsZXZlbCAoQ0kgdHJpZ2dlcmluZykgcGVyc3BlY3RpdmUuCgpUaGFua3MsClN0dWFy
dAoKPiAKPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2Vy
bmVsLy0vaXNzdWVzLzcwMzIKPiBGaXhlczogYmI2M2U3MjU3ZTYzICgiZHJtL3hlOiBBdm9pZCB0
b2dnbGluZyBzY2hlZHVsZSBzdGF0ZSB0byBjaGVjawo+IExSQyB0aW1lc3RhbXAgaW4gVERSIikK
PiBTdWdnZXN0ZWQtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8KPiA8ZGFuaWVsZS5jZXJhb2xv
c3B1cmlvQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3Vi
bWl0LmMgfCAxMSArKysrKysrKy0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19zdWJtaXQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+IGlu
ZGV4IGJlOGZhNzZiYWYxZC4uMDMxMWM4OTEwN2Y5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3N1Ym1pdC5jCj4gQEAgLTEzMTksOSArMTMxOSwxNCBAQCBzdGF0aWMgYm9vbCBjaGVja190aW1l
b3V0KHN0cnVjdCB4ZV9leGVjX3F1ZXVlCj4gKnEsIHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYikK
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBjdHhfdGltZXN0YW1wID0gbG93ZXJfMzJfYml0cyh4ZV9s
cmNfdGltZXN0YW1wKHEtPmxyY1swXSkpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoY3R4X3RpbWVz
dGFtcCA9PSBqb2ItPnNhbXBsZV90aW1lc3RhbXApIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3Rfd2FybihndCwgIkNoZWNrIGpvYiB0aW1lb3V0OiBzZXFubz0ldSwKPiBs
cmNfc2Vxbm89JXUsIGd1Y19pZD0lZCwgdGltZXN0YW1wIHN0dWNrIiwKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfam9iX3NlcW5v
KGpvYiksCj4geGVfc2NoZWRfam9iX2xyY19zZXFubyhqb2IpLAo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxLT5ndWMtPmlkKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX1NSSU9WX1ZGKGd0X3RvX3hlKGd0KSkpCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9ub3Rp
Y2UoZ3QsICJDaGVjayBqb2IgdGltZW91dDoKPiBzZXFubz0ldSwgbHJjX3NlcW5vPSV1LCBndWNf
aWQ9JWQsIHRpbWVzdGFtcCBzdHVjayIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfam9iX3Nl
cW5vKGpvYiksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfam9iX2xyY19zZXFubyhqb2IpLCBx
LQo+ID5ndWMtPmlkKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWxzZQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3Rfd2Fybihn
dCwgIkNoZWNrIGpvYiB0aW1lb3V0OiBzZXFubz0ldSwKPiBscmNfc2Vxbm89JXUsIGd1Y19pZD0l
ZCwgdGltZXN0YW1wIHN0dWNrIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX3NjaGVkX2pvYl9zZXFubyhqb2Ip
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVfc2NoZWRfam9iX2xyY19zZXFubyhqb2IpLCBxLQo+ID5ndWMtPmlk
KTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHhlX3NjaGVk
X2ludmFsaWRhdGVfam9iKGpvYiwgMCk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KCg==
