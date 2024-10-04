Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8068CF8854
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 17:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804CA10EA51;
	Fri,  4 Oct 2024 17:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URJ8rQ3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750210EA51
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728063808; x=1759599808;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=R5vGclqU8rhs20s02Yv0yFylgTka+6FR2kzptDVWNiI=;
 b=URJ8rQ3QmYBOdR0kUxT7xqzzX5ERGC6OCtXHTtSDibYvf59XcVN4KtC9
 M6oNOKFPHBA33GOelk2VIteTYdGyIQVZQwjXs3kqonm6BRA4NVc9D4QTt
 S2Tl+I2uCN773Uzy34Bz9LhnXfeR0EQKcx2ZBqGNg9te+RXSjAk1OExZr
 jF6Q12Iy2NDH66Pao0ZUEf55KpODRuHilplUYi3L9Lfr/FxGWjbjCqhPG
 mWYUuEWjw74mI7MmE01YH4E3SE6WFpjaUWkwBZiOhx4i8qv6Ik2BBBqsa
 KEYSzh4ZCFaOLOvkk6JjFqXO6f4TXhLYIgH110NZ4MuOTP4dOH9jKQFPc Q==;
X-CSE-ConnectionGUID: zTQQTiEdTh6Y/Ip+8OoFzQ==
X-CSE-MsgGUID: bxp1fisdRGm7029rt6c01Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38662204"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="38662204"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 10:42:36 -0700
X-CSE-ConnectionGUID: 0VagPvPYTbmtuj294mXOhQ==
X-CSE-MsgGUID: dN94SskoRqGbHO6oDwx6bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="105627992"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 10:42:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 10:42:36 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 10:42:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 10:42:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 10:42:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peRAJCJC28b4eNsoNsuaYW5NnFqjyTkRHJjiSSIdpIKOlFvwHgbaUzQ1BWgs9Gba2UI7K6b3l0OfSDFzZYw9zw35qZNF5rFJVq2A//nb5WOKQ/VP3YrMrPVh0yQsihqLvUCNvS/FaM59wNt62t2lcT2v9p46yA6IIgY/Ytqt03T8/6ebRJ5UdG/c5bvHk1hSUMCCjTzaxI4qS0nXPNTtdzukk3r2O+5bNx6hDOrTLMalK0Rk3v6LSj6+PzI9iND1PHSj4buKhI4LiLW4HTQEpJ+PphzjAJNWB0nqOfMLfOlOXMxfMkLcopvy337JhxyKfQbmGU2tSb3HArGaKqcu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5vGclqU8rhs20s02Yv0yFylgTka+6FR2kzptDVWNiI=;
 b=Y5W1RLfagbHuyHn1fzuGvUpwOUF83xyvToEOvOLRcEvmIgLrs890ePYbMGk743hTr4bRFK4RHoiPwhBWx8kRNWb1S96fRY0/VwFfwN03SUfHeEUFT1zSa6/hviUiLQk9QTu0KJU3IiCPdu2BMToGUUNI9gjMWQNFr19+QfZQQtLC2N4Zb16YexfNYnzpbpaRHSJme/9RwozOcIowxNTd/u76/5GstTJbgHvV+gBU2iXCiZDaZs/kyEc+j7JuIuinTdzK80lRJRR5zrTNdp7KVtB4rbemI4N/opfs6hedhWFAxgA3yi5xvU98jvajFHDzYJP9MLRa3Gf4f+451jX3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 17:42:33 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8026.019; Fri, 4 Oct 2024
 17:42:33 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v27 6/6] drm/xe/guc: Save manual engine capture into
 capture list
Thread-Topic: [PATCH v27 6/6] drm/xe/guc: Save manual engine capture into
 capture list
Thread-Index: AQHbFgzoH5MD6/VDmkmymXMmVn3GqrJ23GUAgAABFIA=
Date: Fri, 4 Oct 2024 17:42:33 +0000
Message-ID: <2a0ef63683a1c662c92e7f3413fd90245e0a47a5.camel@intel.com>
References: <20241004032400.3146208-1-zhanjun.dong@intel.com>
 <20241004032400.3146208-7-zhanjun.dong@intel.com>
 <ec4f06dabf239413e8d57b0a16e8303083853811.camel@intel.com>
In-Reply-To: <ec4f06dabf239413e8d57b0a16e8303083853811.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB6574:EE_
x-ms-office365-filtering-correlation-id: 7fb6d6bf-db35-466d-2bec-08dce49bed49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y3puMCtqVXFmRjZaOGtQcnExLzY4V2xOVVhxQ0tEY08wYWhGeFVKU2tIMnNC?=
 =?utf-8?B?Q3ZmWVpHSHFFZUlFMkN2dldCcGdDdWdzajVaOHZsRUN0TzNzZk96QklsQ0FP?=
 =?utf-8?B?NGNNU1k5b1h5OE1BSFlHbDQ1UkgxNDRkanoxZVBwVVNheGh3VjNhRndyc2cy?=
 =?utf-8?B?RTd6OE5DWngwckNmYlpyWlVqbnFiSnhPNkVXZFNLdmFnNWhFNFB5QlgzamJz?=
 =?utf-8?B?V3NHMTY2bGpCV2VBS2NjZEd6eWl0UVIzbkZVTzVzQzNJdGhSYmlkZldxNUMy?=
 =?utf-8?B?VjMvTXl6Y052VWJ4UG0yWXppS0ZEUWFRditOZHpQYm1VUVY2UG1jOHpzRVAw?=
 =?utf-8?B?eHNIT1hLNlNRL3k0aVphWmFLMEh6V3RxZEZJL2h1ckhuYlFhbVNlUWF4OFVh?=
 =?utf-8?B?RFluallHcGZuYUJPa2NWQ2psekFmRkZDanBwaWNZWTdoV24zS08wTEJuQzhJ?=
 =?utf-8?B?YkdMdldUdFUxNVU5NlU0RTVlQVJkUTRXRWlFdVY2bTBjVzZ5ak5wK1RPSm1E?=
 =?utf-8?B?a2ZqRm4wVElIK0RGWU9EUUVRb2dmcXcxaGZkS1I3Sjh1a1hSSXJSK2lKSlBR?=
 =?utf-8?B?NXVxVDJjL2d1N2JCM1ZnbTA2bUM1R3J0RjFRbXUrY2xydllVSmRTUFhlSWFE?=
 =?utf-8?B?QndlTGRpZ1phM3hEUG9TeWo5S0tiRnNQU0hZZHZuelFWMm53R0tvZjBoTEti?=
 =?utf-8?B?Q0VTcEYvUGpVSzhHeUdIUWlIR0Q2anBoZ09TQnI2Rk9SK3pYNy9namdkTGE3?=
 =?utf-8?B?clpYOERBMDh5VjdLTlFOaW9ZQjdtVCtZUjNiTmgvdWFJdUZOa0VIWGlPSEJG?=
 =?utf-8?B?WTA5MWJHV1FuVlpaV1VHZzVQNjY1dU1lVEdNYmxrSTI5cnFwTTlwczg2RUFo?=
 =?utf-8?B?SlhTbTg0NnpMajdVR0c3SFJsUE81UVZNcUhoeXlQWm1vTGpzSmhYSTFua1U5?=
 =?utf-8?B?Ymp0WXBVRlpqa0FCbkwrNWI4eHYzVGJKYU95SzFBd2E5TFRLeURHT1B5TG5K?=
 =?utf-8?B?bUFwQVhxQTYzUk9aVzFQZGV3WFRNbDBwT2gwUWs4NCtZT1B5WDdkWmpnbXps?=
 =?utf-8?B?SEd4S29VUEF4YWxOM3FjZHF4NXlDa1RrMy8yRzhUWGJxclYvWTZWNUdjcUZB?=
 =?utf-8?B?MzRabENoNnBjTFVpbkZwSHdtdjlycjVDVENVTlBsOG40bU5uUUZtQjZZZU1w?=
 =?utf-8?B?OFkrNHcwcGM5aEtkZ0EvTjFrb1ZnYnhzcFlKZXF4OVVNYU4xTzN6OERZT283?=
 =?utf-8?B?a2hrQW1NODZHWFlqRVB0dTNUUGFCeGNtZ3oxVmlOODNyaTlYV1g5dzlsVldN?=
 =?utf-8?B?aUFKRkttakpNR3UzV21sb0YyR2dJcktaUzU3dnZ5S0RLamNNTVNrL2hxQ1V6?=
 =?utf-8?B?OElhYnExTUFHV0RmUVRlQkNJMkxwR2w3TXFLUzNVVmM2dFNsZEszVXNwUk90?=
 =?utf-8?B?c2psaTRIWE5BaTJjVXFJVHh0eFhUQTU5ZmhwMllPSzBYNldUNUYwcEM1NmF6?=
 =?utf-8?B?MTI2bWorNDlHdlRlZFBXVkdsclEwNTlkcWlEcElyS3Z0b2R4dXZ2QU1nWVRC?=
 =?utf-8?B?K2p2SXJ3ankyUDYzYVNvZDNGTzQ4MG9Qc1RIMXg0SCs5aDBpZUhiRC85RnBD?=
 =?utf-8?B?Y3JJY1d5c1B5MkkyclJyUzgvNmp0d2pGR1JXZnVmZzcvZkdXbWxPN3gyU2xT?=
 =?utf-8?B?c2JaVmlsTXBDWWhtOUhwUTEvVmN5dFhIUzBXdnZyT1hnZ0d0eFo3Qi9CN2JF?=
 =?utf-8?B?RGpYTmI4MzZRaTFpSE5tWGhEUXBnVklUWm1BL3NEWFBNSGIvK25UcG80STlx?=
 =?utf-8?B?bU5DbFZkUjIzd1BsSDlkQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFJ2RjNJSmlpSVdBYm1FM0VXdVE5cGl2azBDWS9wblBTUG1RNHF2T2p3elpU?=
 =?utf-8?B?RVV4YVdpR212U0h4dk5Vd3o1d2JxOFpNUS9jbDd2RkVoU1BzaWlZb3Njd2tG?=
 =?utf-8?B?Q1cyeG1obHZJbHVzQ0YwejJvWVZoRXBXY3JFTHVaZDhlRHdBNk1rQ245NXp5?=
 =?utf-8?B?WXFaUjVpOVFWTWZocW5DbzVSb29pUUEyczFrMnV3Ly9rSE5FL01kS3RtODY2?=
 =?utf-8?B?eHQ5dUJSV3EvMTJZWmp4Ui9tMjlHNnd5UDQ2NDlrVCtBcDNvUTVGV3ZsdFlq?=
 =?utf-8?B?Mlo1cCt0b3BmZTBrRTY2TmdKR0xPUGwraFplQWVuTXkxaGFLbms1M1ZsVnBG?=
 =?utf-8?B?aC9WZWNMUmV0NGdnNkhRdWcvY0J0djgrMEpxTjlQNHJNdWg0OXJzN1hReUFB?=
 =?utf-8?B?cVZ3eTBrb2QzcnlzS2NiUVJrVkMrYmhHTlFMYzFrNFJvQ0sveTg3QUxDT3dI?=
 =?utf-8?B?ekhpRnR4WU1ES3lxMGdoUVB0Y0l3RENHL0FJbXRrUUtyOFpkczFVUnpTRitw?=
 =?utf-8?B?VjJvQU1kUjdNUVUxaHA4Nm8wVEF2SlczQW9QSVVtRm9WdjZTb0U5RmYzRndl?=
 =?utf-8?B?RDFCeXZFb0pNSmg3VkJHMlZKejcyZ2FrRkIycjhoc05RckVqbmQxdjZVRlpM?=
 =?utf-8?B?MTdLaFRjUXFLTWZaSUFIdFVhQTdDMEpSbGRDQnUyTy8vdUtTdkFaOExETDZx?=
 =?utf-8?B?R3U0d1ZucEpVNHdLTDhSRDV0QzFFckozVEtadTdQL25hdkVrb1VyTlc2N3BO?=
 =?utf-8?B?bHhTbGxnUTFWZTZZUk1xZHhNZ05ZcmpyNUZocEVpNGcrUkYybWdld1lmSnpz?=
 =?utf-8?B?WkhnK0IweEw1VmxQemNxVThmbFBQbVl5RGVyaWpwLy9nb3R3eCtYWUw5T0Z4?=
 =?utf-8?B?L0RKMGliMDVZZldMS1BSSWpuNlA0cXY0ekkrTmVhM3FhNEpObFRiTEFpMVFz?=
 =?utf-8?B?MzJtWmxqVTVQSkRuaGhrVmdCMWk3WWZqOWVZbWtGRmxTbnI1V2NXM09VSFVq?=
 =?utf-8?B?R3RsbUUyK2RUclFLQjNtWUlQeFl0RHNLVTNXUzV0Z2RJLy9zV3hMV0pFVktP?=
 =?utf-8?B?czNpRWIyUm9wUUVHRUYwZE0zL2dqNzNURXRGK1VPMDVhbzl6SWx6VWxoTDR0?=
 =?utf-8?B?ZGZUaUZtRjhvMjI4dGU5RkNnTnVRN0dxOE9FWGdqTFZ1bzUveFJjRm1EMGxp?=
 =?utf-8?B?RzREeWU2cEtwTmJaQUc5cXdDaVVSZGZ2b3NYdVpRRFBxYkM0UlVyejk4anJJ?=
 =?utf-8?B?TlcxVkRyQUVpZFJBR1ZEWit4cThPR2Z5TUlVbDBCWXlTd0FCYmErZjJ1Q0V5?=
 =?utf-8?B?YVpoWWQ0Nk5yUnRhaHB4MVoyY1V5N0MyKzYzcUJyL1hWcUg4NjBuWVNXVkRw?=
 =?utf-8?B?TjNzSlZOOUZCWnYxeC9XOW9Pc3RnMWlqM3owR3g1QlkxcW5TaEdXRUdacFFm?=
 =?utf-8?B?N1pSbE5aNWJBMDNBZXJtbU11cW1WZEYyOE5LSjZmRGgvSE9rMlovVW03Y0Mw?=
 =?utf-8?B?TS92L1dmZEdmZGMzaGpFVDZiRndTSE8xQ3J6MEdoYWtjQWNFY05tcHI1bTNV?=
 =?utf-8?B?eVFZbE5rWlI3RXMrWWJlQzBhakdxUkpidXZxUVJPeUFnaGZKUUtVWXovM0tF?=
 =?utf-8?B?bFYreTNLQmFCNUc5bVRZR0N3SitlZi8yVlBsMWx0Vyt0ME1lS0g5VXkrenY5?=
 =?utf-8?B?UGI1NUM2L25mdk5sUFg3aFVtb3lWQ2ZvRjBMYmZtY1d4a25MRmM4QnNsZmE1?=
 =?utf-8?B?bVcxcjgzVFZ6M2ZmUDkzYkg5SUtkeGNrdEtXVkZ6K1pvdmZJTGVWVU5IZ0l0?=
 =?utf-8?B?YVlKZFFSUnExeW5lbFVENFkyUE5vWmFVYmhFa2RYbm1YVmVNQjV5ZE9FZkdD?=
 =?utf-8?B?NW5XSjlJbkljcFNnMTdneDcvQkpHdWwya1FCN1JXTW5vZnBUa3lOVXYxQnV0?=
 =?utf-8?B?eis3bGtnb2ZkZXpWbXkzd1FFamlsblh0NTJUZ2k4enYySThYSEJuZTBqL0Fa?=
 =?utf-8?B?T0lMZ0Y5aWR6VitBMzdCRHlKOTJvdm1WV2dHb0gxQVcydWUzTnZoYTJXNTFT?=
 =?utf-8?B?a0lvZUV4REFZUTB3MkR6bVphZm1IMUVXMStoSG5sR2dDZ3VDS0Z0S0FhNWFO?=
 =?utf-8?B?cGpWZWRJR3hOaGduNDNwV0FCZk1COURqL0NpTzJ2WnRzVUhxNVV1aUhQSysw?=
 =?utf-8?Q?Cl62P7tmNpRAfEPZfp2kh0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B19B4CB6BE0B4E4DB772A6C66BD39D88@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb6d6bf-db35-466d-2bec-08dce49bed49
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 17:42:33.1546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F6LVu182BrAxbfcqEbbS2NIpdhbel23by8LlxQLQzXDsFnjOskgkfjIBWKp1RVxa1FDy7Pz9PHrQxIw2Vytfjcn9o7bIkPpfHc07yd+avIvbzudPrfJfB4TAqyjoDVhe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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

T24gRnJpLCAyMDI0LTEwLTA0IGF0IDEwOjM4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBcyBwZXIgb2ZmbGluZSBjb252ZXJzYXRpb24ganVzdCBub3csIHNpbmNl
IG91ciBsYXN0IHRob3JvdWdoIHJldmlldyBpbiByZXYxOCwNCj4gd2Ugbm90aWNlIG1hbnkgdHJp
dmlhbCBjaGFuZ2VzIHRoYXQgYXJlIG5vdCByZXF1aXJlZCBhdCBhbGwgdGhhdCBnb3QgYWNjaWRl
bnRhbGx5DQo+IGluY2x1ZGVkIGFzIGEgcmVzdWx0IG9mIG9uZ29pbmcgb2ZmbGluZSBkZWJ1Z2dp
bmcgd29yayB0aGF0IHlvdSBmb3Jnb3QgdG8gcmVtb3ZlLg0KPiBJJ2xsIGhpZ2hsaWdodCB0aGVt
IGJlbG93IGFzIHBhcnQgb2YgdGhpcyByZXZpZXcuIExvb2tpbmcgZm9yd2FyZCBmb3IgbmV4dCBy
ZXYuDQo+IA0KPiANCj4gDQo+IE9uIFRodSwgMjAyNC0xMC0wMyBhdCAyMDoyNCAtMDcwMCwgWmhh
bmp1biBEb25nIHdyb3RlOg0KPiA+IFNhdmUgbWFudWFsIGVuZ2luZSBjYXB0dXJlIGludG8gY2Fw
dHVyZSBsaXN0Lg0KPiA+IFRoaXMgcmVtb3ZlcyBkdXBsaWNhdGUgcmVnaXN0ZXIgZGVmaW5pdGlv
bnMgYWNyb3NzIG1hbnVhbC1jYXB0dXJlIHZzDQo+ID4gZ3VjLWVyci1jYXB0dXJlLg0KPiA+IA0K
PiA+IA0KPiA+IC12b2lkIHhlX2d1Y19jYXB0dXJlX2ZyZWUoc3RydWN0IHhlX2d1YyAqZ3VjKQ0K
PiA+ICt2b2lkIHhlX2d1Y19jYXB0dXJlX3B1dF9tYXRjaGVkX25vZGVzKHN0cnVjdCB4ZV9ndWMg
Kmd1YykNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUg
PSBndWNfdG9feGUoZ3VjKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmNvcmVk
dW1wICpkZXZjb3JlZHVtcCA9ICZ4ZS0+ZGV2Y29yZWR1bXA7DQo+ID4gLcKgwqDCoMKgwqDCoMKg
c3RydWN0IF9fZ3VjX2NhcHR1cmVfcGFyc2VkX291dHB1dCAqbiA9IGRldmNvcmVkdW1wLT5zbmFw
c2hvdC5tYXRjaGVkX25vZGU7DQo+IGFsYW46IGFsbCB0aGUgY2hhbmdlcyBpbiB0aGlzIGZ1bmN0
aW9uIGRvZXNudCBjaGFuZ2UgdGhlIGltcGxlbWVudGF0aW9uLCB1c2FnZSBvciBiZWhhdmlvcg0K
PiBzaW5jZSBQYXRjaCAjNSAtIHNvIHdlIGNhbiBqdXN0IG1vdmUgdGhlc2UgY2hhbmdlcyBkaXJl
Y3RseSBpbnRvIHBhdGNoICM1LiBUaGUgbmFtZSBjaGFuZ2UgaXMNCj4gdGhlIG9uZSB0aGluZyBp
IGRpZCB3YW50IHRvIHNlZSBzaW5jZSAiZnJlZSIgaXMgdGhlIG9wcG9zaXRlIG9mICJhbGxvYyIg
YnV0IHdlIGFyZSBub3QNCj4gZnJlZWluZyBjb250ZW50LCB3ZSBhcmUgcmV0dXJuaW5nIGEgbm9k
ZSB3ZSBoYWQgImdldCIgcHJldmlvdXNseS4NCj4gPiDCoA0KPiA+IC3CoMKgwqDCoMKgwqDCoGlm
IChuKSB7DQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd1Y19jYXB0dXJlX3Jl
bW92ZV9zdGFsZV9tYXRjaGVzX2Zyb21fbGlzdChndWMtPmNhcHR1cmUsIG4pOw0KPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBndWNfY2FwdHVyZV9mcmVlX291dGxpc3Rfbm9kZShn
dWMtPmNhcHR1cmUsIG4pOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChkZXZjb3JlZHVtcC0+c25h
cHNob3QubWF0Y2hlZF9ub2RlKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGd1Y19jYXB0dXJlX3JlbW92ZV9zdGFsZV9tYXRjaGVzX2Zyb21fbGlzdChndWMtPmNhcHR1cmUs
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXZjb3JlZHVtcC0+c25hcHNob3QubWF0Y2hlZF9ub2RlKTsNCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3VjX2NhcHR1cmVfZnJlZV9vdXRsaXN0X25vZGUoZ3Vj
LT5jYXB0dXJlLCBkZXZjb3JlZHVtcC0+c25hcHNob3QubWF0Y2hlZF9ub2RlKTsNCj4gPiArDQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldmNvcmVkdW1wLT5zbmFwc2hvdC5t
YXRjaGVkX25vZGUgPSBOVUxMOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gLcKgwqDCoMKg
wqDCoMKgZGV2Y29yZWR1bXAtPnNuYXBzaG90Lm1hdGNoZWRfbm9kZSA9IE5VTEw7DQphbGFuOiBX
UlQgdG8gYnJpbmdpbmcgdGhpcyBodW5rIGludG8gUGFjaCAjNSwgaSBhbSBva2F5IHdpdGggeW91
IHJldGFpbmluZyB0aGUgUkIgaW4gUGF0Y2ggIzUgaWYgbm90IG90aGVyIGNoYW5nZXMuDQooc2Ft
ZSBhcyB0aGUgZWFybGllciBjb21tZW50IGluIG15IGxhc3QgcmVwbHkgb2YgdGhpcyBwYXRjaCkN
Cj4gPiDCoH0NCj4gPiDCoA0KPiA+IMKgLyoNCj4gYWxhbjpzbmlwDQoNCg==
