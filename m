Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F8CD4F35
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509AA10E7C0;
	Wed,  5 Nov 2025 23:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOIWcH6g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C941E10E7C0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 23:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762384612; x=1793920612;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=8utSD8K6Ad5dw/I8wH7VUtmSq1KXLQ4BDrUR5Llsxfw=;
 b=nOIWcH6gJsfv+ePl8tlG+YNFr27YJhQ58TbK4voIFujaYcuPi2UDdfQP
 9PMncLJvMM4elPS/qsiXPzeDezGPEy+OYOn2Or8wnEwG4a4RjyJ3s/rC7
 GYPmYasXi71V7X4lM8yEyHQlc1Dd6vvKgtd713xxDFAavZzc44bn5P46/
 5W7oHWBzKoFssMd1hbbY3zcD3zJDKFlSaKfJmgHMSUNAolwnMD+AM/aQw
 66hNN7QpPGvHn/7ENr3MvEP0YjsWd0HPcTUEfcyNNexkj1m6hhBwtkE7m
 I9TnRZxUBLoy8IpqC54WHQnUmII4Gm5MRL1Bv19Xp5HS2hjYqVVAYi63s A==;
X-CSE-ConnectionGUID: GNtxoSnoSlCiesF03152XA==
X-CSE-MsgGUID: 4T1bYO9TSWC2pYrkC7hYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64663023"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="64663023"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:16:37 -0800
X-CSE-ConnectionGUID: Gac23XSYTG6hdKSJs5MG3A==
X-CSE-MsgGUID: ezDBitStSiqTIbUsB7a7QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="191692771"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 15:16:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 15:16:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 15:16:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 15:16:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tooRAwcK2XgJ5eOD2gGzUXsx6DTZBc0zmxLgGAl4ymgbSIWnTCGmi8mAO/MD4nWBdNQ95GOH88hJO80tXlPQgf3gyH7lJ4CAyjjzqaw4ADX4RgLE6FksTS6/zdeMG4ouMYxbS5ZkC1DFtOerve3NNQDs5CFX1z9V/MW/k4/r6Wb+MPIDxT4t8UEFCsbcR+HEiTozgVXacFIl5ARndknu9wukoW5r9lg408e5Q6VX7BPKDxcNDz8yYk8iejlxSRgZQay7JNbazEG/3B9qxcJwMeg9xN46TD9N9PoCYuKJpW/b42iXY57sprCpZpTIlRi5inkbcCxiZ24H7uCEFqriyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8utSD8K6Ad5dw/I8wH7VUtmSq1KXLQ4BDrUR5Llsxfw=;
 b=GKUce6Fjiu/9NS76kYSW8hiKH3sWop+BSSLSKB1m/rEls67s/kE5ryV78/bcrY3IrfDRbGaZ6SSqlVZu2oRRw496cdMKoEUbl9iDxdSkg5bbC/6AUDIE/w2jyNOr1N2rfw78Zsq7lRK6MFsuxnYj0yTi/WgRggmv4vqjwu1+phJvucPnZ4d6D+SS57OuKLg+15QyPcNRd0Iw2mKcP/PBqfKzFw08pbNYGVSLtWG1QAkbghEDhIylnH7EDxD497EL6IgcuLQP7S6r5ho3RM0a8bHRiW5N6nTWVS932GJX5ijS0/1/P2IviMhs21fKry+hpYunDC5KO45gefyRGETMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB6825.namprd11.prod.outlook.com (2603:10b6:806:2a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 5 Nov
 2025 23:16:34 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 23:16:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v1] drm/xe: Move VRAM MM debugfs creation to tile level
Thread-Topic: [PATCH v1] drm/xe: Move VRAM MM debugfs creation to tile level
Thread-Index: AQHcTnWedFyTcaQW6UmWCiWI85jVj7Tkt4eA
Date: Wed, 5 Nov 2025 23:16:33 +0000
Message-ID: <280d1a68c928607f9c045ae7042f157c728622ec.camel@intel.com>
References: <20251105165905.3509314-1-piotr.piorkowski@intel.com>
In-Reply-To: <20251105165905.3509314-1-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB6825:EE_
x-ms-office365-filtering-correlation-id: eb91e934-dac9-4056-3acc-08de1cc15c77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OVFhWHkrK2g4S2JUWHArNUcrVzRGd1NYMGgwUGJZZE1ObmNsRFlXRXlSTFdK?=
 =?utf-8?B?c1cvOVlENDdCeUJtVlZkVWxWSmw2cGI0ek5JK0ppWjVkYXdvVkhLcTBGdi9x?=
 =?utf-8?B?dCt3VW1MRDd0TkxuOE9ibndVdENRdlVySzVOcTVYbTBnYVN0L2tWTi81dm53?=
 =?utf-8?B?OCtIQUg0RHNKRmVrWTdISzB2VUkyVE9ZRGk1ZzNtMVh2N2U1WE5yT0lDcVFt?=
 =?utf-8?B?TlViRmxPNUtZemplNTRtYTU1ZWRzQk1SazZpOFBXUU5uZmZGZnBzL3lScGwx?=
 =?utf-8?B?anIzS3ZrWTNpci9hMlpqbXRGV05FWDNJVStZQmE3Y1c3Sk03QldwQTJtUjdP?=
 =?utf-8?B?bU1MTUxqZGxWczE0RVVRVEVsNVQ3d2gxeVU5K29DQjl3UWdlMm5hbjBMTHp1?=
 =?utf-8?B?bXhraklOeGlLRk0wMDBydjgwL0k3UXJrdHBiTGpuTFdmT2xYcFdteFhYeWxZ?=
 =?utf-8?B?S1ZDS3Vka2lNOVVQeU5wamxEc3M5QU9HYjFBSFZ5UGorMHVQSlNlRGpqR1BS?=
 =?utf-8?B?b0R5QkxCL2pBakNabkRSa0xkY0tYZytqTjMzbTc3TVJsV256MDBCemJ3UXpF?=
 =?utf-8?B?emNRbWRlbElNU3RzTkY3MDN6ZzdGRm4veDJYOTczd1RrTXhiUHpDZ2NxeEt5?=
 =?utf-8?B?eWVlSTArbXpPZnk1OHhQbWpMUXNsSVdzQUdGdWw2bHdsbGR4SjVUV1RkZ2Zv?=
 =?utf-8?B?blBDQ29ZVDF0Yjh5Tnd1RXFobnplYXVVa2dnZTE3RjQ5QkRKUTJPQXZXbDB2?=
 =?utf-8?B?emdjMGJTZG9ySnZNK3BsTGNvMTZNQ1EyOXJsbEk5WnZLZVkvbHh3THFoWnhw?=
 =?utf-8?B?dkdKcFczQ2FtUk9EMFl3WjMrNndEQ0tQaVJGRHl2T1BURThITmIyT3hGcXpN?=
 =?utf-8?B?aTlIcER2YmkwcDlnVENZRzJxZDVaS2g5bzhjNFNJSUxxaWlNN3EwS2ZnWkRV?=
 =?utf-8?B?by92RVhoYUgzYU9BVE5HLzJvdzcyK3Axc0p4WnpSMnk5N0RlekVFczV5NmJQ?=
 =?utf-8?B?R1hnQ01OS09nc3lBUC9pTDJtYWlNZHZLMVBac1NxdHhFVDBueGxoNlpkeTFO?=
 =?utf-8?B?c1gyaFB2WXFMWjRUUUVweGd1d2pEeGtmcEpwSVdvOTZNd1dMcENmWmRIdWJz?=
 =?utf-8?B?emNFaXhKMHEvMXNadUhZc3FSNTIwcGJYTGlwMFNrenU4OEtsTWlhYkVjSFR0?=
 =?utf-8?B?QkR6NitYeTBXQWdnRXJaWkVRZU5zZ2hwbnN5R09xcnppZnNhOGo4QkR2TTFm?=
 =?utf-8?B?RmNTeXJzcXJiSGcyK05hVWV5MDZnNlVna2c1NHJIR2JoeXpLdGI4SUw2MVNw?=
 =?utf-8?B?MDcwV0dBUTJ3Nk5JY1haYXVUYmhneDBZTHNIR0dMcU9kaEptVUh0VWxMSVJq?=
 =?utf-8?B?ekNuWmgxZHhQeGNTWUZadWZrS2x5czN5eDBkQmhPbVJSSWxHajl0eWQ2UEk1?=
 =?utf-8?B?NDMwZ0NmRTYzMXhCc0kreFQwMzNMQmdLV2txNmdtdGJpalQ5Y25OZ3hzZ0o1?=
 =?utf-8?B?aW5JamgyUU9nTjY2K1BuaFh6clViR0IvQVZ1UllQM1BZRU1kODZxTE56REhm?=
 =?utf-8?B?QTV0NjRzQzV5ZzdaTytxTllpUTVZUE5qM1BYdWN2cEdyTEhGZTZLRGpyRFh3?=
 =?utf-8?B?TFIyQU9ycjAyazVDNWdxanhwMkpGYnJ6cXY3TWhVTFg0OG9zRDB3aEQvb2dT?=
 =?utf-8?B?dlQyVVF3Y1F4RnA0NU1jb2xJd3Y1YkdUNGk0ZjhnT09LN2M0UExKdVdCdDFN?=
 =?utf-8?B?aDNNNWI4c2dXWXNNUnZGZk1kbUhrNlRxai83UjQ2QXQrOVNpQ0ZEa0FIUHB6?=
 =?utf-8?B?M1RZTnFGbmZrOXRYbkVFNWhZMXJPclVyeG1yc2hLNzgxTGZZQVYrYWlGbUtS?=
 =?utf-8?B?bjR0NmlNSlMvOHgvbHJ3UCtGdWpLQnI3dmkxL3FlK2VPTWFlVDl2bE10M00z?=
 =?utf-8?B?UFpoUWEzTmMyVWFYZm4xbVVGNDkxK25DUjNHa1hpTkFxV0RpSXhwQWp6a0No?=
 =?utf-8?B?dU1mUlhmNjVSMFk0dDVQS3hYd0VKVkYvaWR0L2VOdVRVSHV4cjF5cTgyRy9s?=
 =?utf-8?Q?hdep+o?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjMzck5DWXo0eDdpeDh6aC94d3BaMzJTc3VWVTRHYTlDMkorcnhuZUZWMmE4?=
 =?utf-8?B?TTZhRXhieWwvS1U5RFM3eVlUZmtHNW9qMXBIVitVWWc4cW42Y20raVVRd0o5?=
 =?utf-8?B?WUEyRTQrV0NXTnk1TVZBWU55TnFicmNQdHd0eTJubktnZFNuWG02VWNxWUNy?=
 =?utf-8?B?VkYwSEhOb21BU0hzLzBWcmIvZDd3NHRCT2M2cERWcDc1bVdFeTRCWVNZNUZU?=
 =?utf-8?B?UW0wdUtzTTBxMXEyNDhSMHRIZXphc0c3NGhxZ3N5dzFuWWdTakMycHpRY0Nq?=
 =?utf-8?B?WUl3bnBseFJraEo0NHV0RmlKZGM2N1dpVmtLYktoWFdHWEFWVldibllxRGVV?=
 =?utf-8?B?UWJsOUxHYUNtM2pidGttbHdHSy94dGxmRU1ldEU3TjRFMG9scU1mOFA1L2Vp?=
 =?utf-8?B?YnBqTVZnL3UvMi9RRlVLQm5HanNpeVJaOUtTZVZqREdqclg4blo0NXdTZjE3?=
 =?utf-8?B?RWRjVWUzVkMzcUVsY1IzWG9LU0tiTTdyRW9hTFBFL3ZIMzI5TThxdnRuOGlF?=
 =?utf-8?B?eDZKYlhBUnh0bzZCRXBkM1lKdVp5RlE1UHlXOXNFV3FIc0NSMlgzSk1mdy93?=
 =?utf-8?B?dHpwazhXajhmWnMrYmpDQVlnS2NFdi9hR0RZSVRESEJyQjVlT00zTWlldXk4?=
 =?utf-8?B?Y0t5N2hnWjhPeW5nbWMzdGdGbGVpTEJTTmgzTUhFenJyUDhWMEJOakFzOWhx?=
 =?utf-8?B?RnMvaTBWbHdYdUMyN1pJZDA3TlpGVnFuTjJzbHZxQTd4Qk1BVW5nUERRSStW?=
 =?utf-8?B?Z09OM0l2RDBtcExabUY3ank3Nk5sTWhnbmpKSDJxaWdWSTRoYTFOUUNJdSsv?=
 =?utf-8?B?UUp2U2FLWHh0VXFiMlQxU0d3czByRGUrNmM3b0VVVDYvRHR5cTAzc2RkZy9n?=
 =?utf-8?B?bmNTT3Bza0tuK2NONE1jN2pkUXlqSGxseCtOeGtkWlkvREYwUWxaTnZTVnZy?=
 =?utf-8?B?WFhocFdyS0hmbDNFZEt6ZytjazdqeDBGaUZGZTRQRXAyTUJ1Ny9Fa05ITFZN?=
 =?utf-8?B?dGIxNVFLejFDWlBra3dCVmMvSzFoQ1NmVjZYOSs5UVl3R1pvaWZnOThxKzR6?=
 =?utf-8?B?elRGNHhkSnZTWEJ5RUgycEc1YWxCbHROSWp5SlNBRndOMzMwbU01OXlVZmQz?=
 =?utf-8?B?OU9HU0FKdjJUN1R2MkJqQlFTNnJJZlc5RFdRaitGTjJjQ2xtZkFzQm4wdkln?=
 =?utf-8?B?eHRodmV4Q2wrZ0VHVWR2VTZCTURWdnU3aHJnY29aZXgvTTY0WFA4dng2dWI2?=
 =?utf-8?B?cFYvVkVXL251OWMvWDFDM1Nlb1JwY3gzVnBJdmhFMGM1VSsyU0JpK2QvcVM1?=
 =?utf-8?B?ZDYxYzZsbVFwdGlEbmFwQkdjNFZ6WHVXZG1XdGRBdTNPYmxlOFJ6VHZpQ0ow?=
 =?utf-8?B?Z01yenl4V1pybmRvbWJkVlhvRkdaTk5yQXdXZGg3ZmJONDQxWHJvNzFyMWdP?=
 =?utf-8?B?UjBBQ3IzQndkKzJ0azBsbVdqeW9TMWpzZExIK0xUUSszTW9HeHFOTnY0N3Bi?=
 =?utf-8?B?VUYrUFlkTGFBL0t4STRCeHdJQVA3dDkvSG14TWdldSs0TWZUVnZjMGx3T0Jz?=
 =?utf-8?B?aFQ1MEZ0a2JMcjdRTUluMzcwQUQzNng5UUVBQk8weWxBTm80VU9CdFJkclpW?=
 =?utf-8?B?SVdKZG9uVVQ2Ymh1MGR3Y2E5WTRzVHY5dTc2VnlGVmVWMkIwUzNVSnRnaStp?=
 =?utf-8?B?Zy9QdzhlWXFpMmNiL1dBSG43ZVVpQWpsKzdxa2xRWXRTbEZWamZQeHlTb2U2?=
 =?utf-8?B?djJoa0Y4NnlOVWNkQWpZZFR4Tm5DcmFkc1BKZHVFOWFrM3cxK0VPQWJ1UFkr?=
 =?utf-8?B?Mm9NUTVwY1MxWDBKZWpiRWtpeXVZanQ0azJob2EvVnl1bWhxelJDbkpQNWVO?=
 =?utf-8?B?MlEzbUJZVkpiOWdFVUJhYTRzc1doY1pkdXRkNmUzRFdGUTV3aURMa3M4TmZZ?=
 =?utf-8?B?MnRyZStnK2M4WXBtbCtjZ1cyWUR3Qk9Xc05IaExpdGZYdlE4dzc0d1YxTnYv?=
 =?utf-8?B?YitxWDJKL0ZBSE9nSldZSFoyaldSc2FhZEppQW96UkpTMkdYMXh3NnNZSVMy?=
 =?utf-8?B?TE5IcnpKUkJwU3lxUThZQ3pwT1BDMWVjZU1qakZ6SXlOL0gyUFZSZHBzRmFZ?=
 =?utf-8?B?dFhXaHJaNVRIQk1BcFo4V0JpWTRtendldVFIM2xOeFRrMXJIdW5YNlFyMUFU?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA246CD607825549AF795F987AC3C2D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb91e934-dac9-4056-3acc-08de1cc15c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2025 23:16:33.8618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXXXg18W4js0rRXPTdb0v37EWlgzBnr09g746tSIUI3iWFVJLBpR2TTfldfEivHXD3rKZLgBE1KyYyfdAb9MNOcPICt2mnisWaFws0LT12s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6825
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

T24gV2VkLCAyMDI1LTExLTA1IGF0IDE3OjU5ICswMTAwLCBQacOzcmtvd3NraSwgUGlvdHIgd3Jv
dGU6Cj4gPiA+ID4gRnJvbTogUGlvdHIgUGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lAaW50
ZWwuY29tPgo+ID4gPiA+IAo+ID4gPiA+IFByZXZpb3VzbHksIFZSQU0gVFRNIHJlc291cmNlIG1h
bmFnZXIgZGVidWdmcyBlbnRyaWVzICh2cmFtMF9tbQo+ID4gPiA+IC8gPiA+ID4gdnJhbTFfbW0p
Cj4gPiA+ID4gd2VyZSBjcmVhdGVkIGdsb2JhbGx5IGluIHRoZSBYRSBkZWJ1Z2ZzIHJvb3QgZGly
ZWN0b3J5LiBCdXQgPiA+Cj4gPiA+ID4gPiB0ZWNobmljYWxseSwKPiA+ID4gPiBlYWNoIHRpbGUg
aGFzIGFuIGFzc29jaWF0ZWQgVlJBTSBUVE0gbWFuYWdlciwgd2hpY2ggaXQgY2FuIG93bi4KPiA+
ID4gPiBMZXQncyBjcmVhdGUgVlJBTSBtZW1vcnkgbWFuYWdlciBkZWJ1Z2ZzIGVudHJpZXMgZGly
ZWN0bHkgdW5kZXIKPiA+ID4gPiA+ID4gZWFjaCA+IHRpbGUncwo+ID4gPiA+IGRlYnVnZnMgZGly
ZWN0b3J5IGZvciBiZXR0ZXIgYWxpZ25tZW50IHdpdGggdGhlIHBlci10aWxlIG1lbW9yeQo+ID4g
PiA+ID4gPiA+IGxheW91dC4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciBQ
acOzcmtvd3NraSA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+CgpJIGFncmVlIHRoaXMgbWFr
ZXMgbW9yZSBzZW5zZS4KCkkgZG8gc2VlIHRoZSBkZWJ1Z2ZzIElHVCBzZWVtcyB0byBiZSBoYXJk
IGNvZGVkIHRob3VnaCB3aGljaCBpcyBjYXVzaW5nCkJBVCB0byBmYWlsLgoKV2l0aCB0aGF0IGZp
eGVkOgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNv
bT4KCj4gPiA+ID4gLS0tCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5j
wqDCoMKgwqDCoCB8IDEyIC0tLS0tLS0tLS0tLQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RpbGVfZGVidWdmcy5jIHzCoCA5ICsrKysrKysrKwo+ID4gPiA+IMKgMiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jID4gPiA+Cj4gPiA+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdmcy5jCj4gPiA+ID4gaW5kZXggZTkxZGE5NTg5
YzVmLi44YWM3OGU1NjBkMjggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RlYnVnZnMuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2Zz
LmMKPiA+ID4gPiBAQCAtMzc1LDcgKzM3NSw2IEBAIHZvaWQgeGVfZGVidWdmc19yZWdpc3Rlcihz
dHJ1Y3QgeGVfZGV2aWNlCj4gPiA+ID4gKnhlKQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbjsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX3RpbGUgKnRpbGU7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAq
Z3Q7Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgdTMyIG1lbV90eXBlOwo+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqB1OCB0aWxlX2lkOwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB1OCBpZDsKPiA+ID4g
PiDCoAo+ID4gPiA+IEBAIC00MDMsMTcgKzQwMiw2IEBAIHZvaWQgeGVfZGVidWdmc19yZWdpc3Rl
cihzdHJ1Y3QgeGVfZGV2aWNlCj4gPiA+ID4gKnhlKQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBk
ZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJkaXNhYmxlX2xhdGVfYmluZGluZyIsIDA2MDAsIHJvb3QsCj4g
PiA+ID4geGUsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICZkaXNhYmxlX2xhdGVfYmluZGluZ19mb3BzKTsKPiA+ID4gPiDCoAo+
ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGZvciAobWVtX3R5cGUgPSBYRV9QTF9WUkFNMDsgbWVtX3R5
cGUgPD0gWEVfUExfVlJBTTE7ID4KPiA+ID4gPiA+ID4gKyttZW1fdHlwZSkgewo+ID4gPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtYW4gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYs
IG1lbV90eXBlKTsKPiA+ID4gPiAtCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmIChtYW4pIHsKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGNoYXIgbmFtZVsxNl07Cj4gPiA+ID4gLQo+ID4gPiA+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc25wcmludGYobmFtZSwgc2l6ZW9m
KG5hbWUpLAo+ID4gPiA+ICJ2cmFtJWRfbW0iLCA+ID4gPiBtZW1fdHlwZSAtIFhFX1BMX1ZSQU0w
KTsKPiA+ID4gPiAtCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2NyZWF0ZV9kZWJ1Z2ZzKG1hbiwKPiA+ID4g
PiA+ID4gPiByb290LCBuYW1lKTsKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgfQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoH0KPiA+ID4gPiAtCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoG1hbiA9IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgWEVfUExfVFQpOwo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqB0dG1fcmVzb3VyY2VfbWFuYWdlcl9jcmVhdGVfZGVidWdmcyhtYW4sIHJv
b3QsCj4gPiA+ID4gImd0dF9tbSIpOwo+ID4gPiA+IMKgCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX2RlYnVnZnMuYyA+ID4gPgo+ID4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3RpbGVfZGVidWdmcy5jCj4gPiA+ID4gaW5kZXggZmZmMjQyYTVhZTU2
Li5iNGExOTI5NTM1ZGEgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3RpbGVfZGVidWdmcy5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RpbGVf
ZGVidWdmcy5jCj4gPiA+ID4gQEAgLTExMCw2ICsxMTAsMTMgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1faW5mb19saXN0ID4gPiA+Cj4gPiA+ID4gdmZfc2FmZV9kZWJ1Z2ZzX2xpc3RbXSA9IHsK
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeyAic2FfaW5mbyIsIC5zaG93ID0geGVfdGlsZV9kZWJ1
Z2ZzX3Nob3dfd2l0aF9ycG0sCj4gPiA+ID4gLmRhdGEgPSA+ID4gPiBzYV9pbmZvIH0sCj4gPiA+
ID4gwqB9Owo+ID4gPiA+IMKgCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHRpbGVfZGVidWdmc19jcmVh
dGVfdnJhbV9tbShzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkKPiA+ID4gPiArewo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoGlmICh0aWxlLT5tZW0udnJhbSkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgdHRtX3Jlc291cmNlX21hbmFnZXJfY3JlYXRlX2RlYnVnZnMoJnRpbGUtCj4g
PiA+ID4gPm1lbS52cmFtPiA+IC0+PiB0dG0ubWFuYWdlciwgdGlsZS0+ZGVidWdmcywKPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidnJhbV9tbSIp
Owo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+IMKgLyoqCj4gPiA+ID4gwqAgKiB4ZV90aWxl
X2RlYnVnZnNfcmVnaXN0ZXIgLSBSZWdpc3RlciB0aWxlJ3MgZGVidWdmcwo+ID4gPiA+IGF0dHJp
YnV0ZXMKPiA+ID4gPiDCoCAqIEB0aWxlOiB0aGUgJnhlX3RpbGUgdG8gcmVnaXN0ZXIKPiA+ID4g
PiBAQCAtMTM5LDQgKzE0Niw2IEBAIHZvaWQgeGVfdGlsZV9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVj
dAo+ID4gPiA+IHhlX3RpbGUgPiA+ID4gKnRpbGUpCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGRy
bV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyh2Zl9zYWZlX2RlYnVnZnNfbGlzdCwKPiA+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgCj4gPiA+ID4gQVJSQVlfU0laRSh2Zl9zYWZlX2RlYnVnZnNfbGlzdCksCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB0aWxlLT5kZWJ1Z2ZzLCBtaW5vcik7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoHRpbGVfZGVidWdmc19jcmVhdGVfdnJhbV9tbSh0aWxlKTsKPiA+ID4gPiDCoH0KCg==
