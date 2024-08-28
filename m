Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E7AC54744
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 00:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3076B10E22A;
	Wed, 28 Aug 2024 00:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHT+St4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CC010E22A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724804566; x=1756340566;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LxGK94p7l93SGYTlni4g4FVBU5u3b16Tao7bPm6ewJA=;
 b=IHT+St4grlS/PbIBnEOVg4u7mYCqLsP3J9busP02VWqNQjL9bpUC3gdY
 9ZFJraC5Il+PXZWrgQc/kujDN0R4VA6rIy1Arfv71v8IOriE7Kxu3oqjQ
 51mLHs4hPrJGywWV4hlNVN6e7v9n2zWkvd9OgVIz1nhSgV4v3UBTXJZEa
 1lwMyDdkQbxRsxQqxvkEIjheMEXz+eM2acZeIweAGDPr3SZMmMs624dYC
 ONHEoJRTSFi5uj1lA92saxVtTiNctQzl+/05giiutb5vdF+TgCnFGcIXE
 vBzyp4RLU8d1iS5Zni8UN0m2kiEr596NLMaY1JuOvZM9LAf8fHIUss3VU Q==;
X-CSE-ConnectionGUID: d6xTbuJMS6O1oJkGNd6o8g==
X-CSE-MsgGUID: RhRhkvRAQYaDS0BzKjHMrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27080847"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="27080847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 17:22:46 -0700
X-CSE-ConnectionGUID: gxVKEnuiQGWW0FSpdYnpQA==
X-CSE-MsgGUID: W41a0k04TJa9UUhFBzyEgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62706431"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 17:22:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 17:22:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 17:22:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 17:22:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 17:22:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMwx7toFnjzFbX7QyYtwGeos6mCamsnErrnPFApaEv7CpWiBLXguk/fokeFuRT8idN2EDHBsayy7wfDyLPMSObjbYyPvlBP/KSFVeA/54yWL3EQR+WBvmXDD1MgdM+GfDqjXj7g2Y7Od7sz5MMDdX2cH95Q8kYdTbhalDlGya7ylraraIKlCyQJ4eiGoE6G8NeRr8sqWMCc26PwRkBSe2P0uNhu6g0oyVSqGFTKaO8IRrbFWEd8D3+V3CHDlzTGSk85msLc8GCn6ohuAgg1Ycpo9y4FdbMoeaHPv2suS0329qY3uRnJz6DoSJ5PpwDexJo1ImEgWilTuxa6MB8b69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxGK94p7l93SGYTlni4g4FVBU5u3b16Tao7bPm6ewJA=;
 b=eYUSAxv7OjCn7VNO8wgGPX+6sFM2il0ElxxR/Y1jE3y9TyuExf0Z8dRXwkDvbFylZo3jopPDQLDwnUc1q+VXlMiQxOPS9pdikukqWxhSA7EozE5gdZ4n/L18NdaH0ahCoGqte3B5uDZ18dvhq6T1Con1Lmm5kQB3/8KuEZWtkxFEmFMTRwW3wuGPKOTahqiRYzxA6w3T46Mn2lJ6H1g6W/JrC+2FhYeM5RISD/6k+lkKUxgPxT4N5+Us/XaoPpKmQ0R4scA0OuM3oIBIocdQeFGhgHbYeEcpi9Vp/ykVZtweePUSxFG8+eOpnuShK4smL6UenyZ8+71vtyUVfrLAzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Wed, 28 Aug 2024 00:22:42 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7875.019; Wed, 28 Aug 2024
 00:22:42 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v17 4/7] drm/xe/guc: Extract GuC error capture lists
Thread-Topic: [PATCH v17 4/7] drm/xe/guc: Extract GuC error capture lists
Thread-Index: AQHa+Mq9QW2LDLtPDk+HC3VR2ZJHRrI7zzMA
Date: Wed, 28 Aug 2024 00:22:42 +0000
Message-ID: <944f763e83ddd5d464711c73d9174dab59d93bdd.camel@intel.com>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
 <20240827214726.1183935-5-zhanjun.dong@intel.com>
In-Reply-To: <20240827214726.1183935-5-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB4998:EE_
x-ms-office365-filtering-correlation-id: b01bbe33-a00f-436b-297f-08dcc6f7881b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDhkTENLMXRydC9MaGdyWUtiRnZNU2t3cllDekRyVHJXYnByRndFUUVaeGY2?=
 =?utf-8?B?ZUhDb3BOanlpZjlxSE4rUS94SGczOXNjQitYWmc5Z3dZd3pxUHZyZ0RZUzNV?=
 =?utf-8?B?Uy9oR21idmc5dndVRVhIYUFCa3pybjhiNDBxaFFQa2NyQWdRaGlsUnVJR0ZP?=
 =?utf-8?B?bHlvckxVTUVMSXV0Q0phTlkrTUxkTHBqMmVTVlFIbGxKVTNXTkNHdzJuVVhJ?=
 =?utf-8?B?MmNlMkhhKy9UTUwxMkE1QVl0T0VlQUxyU3FHVTFOd291V2hyNU9EUnFqZWpO?=
 =?utf-8?B?ckhYN0FUcE44TEl5Yzc0a1M3UmJBL2xyT0NDczdENHQxRk9icVZlT3JPd0t2?=
 =?utf-8?B?U3Y1M2dQM29RV3dtY0Y5aUw2T3ZVb2UvYVJDblZ1bjVReEoycUVpM2Rlc0NM?=
 =?utf-8?B?T3k3TlR1MWxHb1NrM1FUcVVpV1h4R2lZeEsxYm1IK2VaYk1ZZDNabUwzZXl3?=
 =?utf-8?B?Q1ZUY0huRUFPdTBGN1J1RVZvRE1HQXZmdTIyL3pFUXpMRTdsWjQyWXdBUnZX?=
 =?utf-8?B?Ky8rT0JSM0QzRHBGRk5nTlJMYWt6MEd4L1A2N1hjQjRxWTRLUXZ4dlNqWXha?=
 =?utf-8?B?RnltMzVXUFZuVVdNckdrQ0RaVjFwa3dmRFBLZ043bUlnYWZVSVlWczYvRlVo?=
 =?utf-8?B?MjVHcU1rV2U5ckxIRUFWaXpYdjh2Z2wzWGFrS2grMWk3VjJNcjBBUzl2b1h1?=
 =?utf-8?B?ekk1ZHd6SHVWTy85MWF3dXlLdW1xQk4wUyt3MC9CcXpQYlAyWEp0aVR4MjFz?=
 =?utf-8?B?OC96WEkrY05HTU5pSkRrdTRRR2ptN3JrVFJBaHVBL3cyemN3QWsyU0srUDlD?=
 =?utf-8?B?Vzc3dnh0dzhqY2ZMVXRwTjlxZXdhUzNzYk5NOFFubEVaenhUajliNkF2d3Fi?=
 =?utf-8?B?ODlBR1RPbzRLRHN3blRXc3NQemoxOUlrSmRSRVA1TnJibmYzdTFkNGdieVdP?=
 =?utf-8?B?UGloOE5MTFFINmk5TzEvVEtDdGNkUGVyWVBndTF1UUIxOUZCMjVzNXJrZzhv?=
 =?utf-8?B?L3lBTnZiM3YxLzJwcjdmc3JCajJocldPekpSVWdPQWwrenJraUZrZlIyWW91?=
 =?utf-8?B?RFZJb0E4V3BzN2RCS3lxYXVUcGhPTjFNNCt4aWJrbDB6ODc2Umw2V0pvWXlE?=
 =?utf-8?B?UmFYMzlJNm5Sc1BYc25NeWpxVXFSdmQ5MkNYMlpnMDdmYXJEU1JVUml1MW1i?=
 =?utf-8?B?SUdrbXdmUVpRUzRsSTRDOEJFdTZoTmZYZEl3VGliSDhOZ2hjVWR3anBwcXky?=
 =?utf-8?B?d0tqZWNvZUQ3aDRGOU1zbzdpcUJpMVpCTE9XTGFzWjV3ek5Ha2J4NCs4UUZ6?=
 =?utf-8?B?WFNsKzFvenVHV3plTEVpSEpvbVFoUG9LRStueWNLRmVuVXdlYXNoRVpHZmFu?=
 =?utf-8?B?M053K2toK3IwRWtzUmppQ1pGZk5NZ0hkZWVyMWdjWXRGckxjUWV0am1xMDQ2?=
 =?utf-8?B?TGhad2RYeUlyYUZkSHBjNjUzTzZZNlJ6Vk9XUlgwVUk0QjBkbHVMRWw4QmJn?=
 =?utf-8?B?c3dzcFRKVU1oV1ZzKzFEd21TRG5VbzFwRStseDNZdVdDOExTcndzd3BzZXl2?=
 =?utf-8?B?aTgyUnJUSENtY1l5cHovU2RQV1Yya2tzWjF4clNreFluaHJZcWtKZmh6TEx6?=
 =?utf-8?B?ODdwQUZ5a2FtTHRwN0F3aW9xbXlMOWc5dDk2azMxSmJUMHNKbk9NZ1ljK0x4?=
 =?utf-8?B?akhYTlBiK1FDVFBPb1lGMVlsTVFkWkRheCtEaldpTTZWMnBBUHVqTmlHTFZi?=
 =?utf-8?B?eWJCdGcxWTdTbnhZaTlyM05aVTNPWU95ekRZcXg0cHU1VzJ4VXlFaHNlUGtG?=
 =?utf-8?B?b2ZORU1nUlNwZzRrRm5BTW9XbHpzQWJiQi8wWGNGdXpZTEs2dTdhMWN3dTl5?=
 =?utf-8?B?bmJjSGhtM0dhSVVZY0tya3ZCUDJid3FnZEV2bGthNDUybkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHZoZHVQM2J6WUZQQmp0dDhlTDdMWjc5NkdsU1R0NThCbEI5VWM2eDFzRnhq?=
 =?utf-8?B?eVdycEhKZ1ZSOU10Mmg5UUYzOUFyVkRkbFpPOGdBL3lITDNqeGRBQlNqMTZE?=
 =?utf-8?B?YTNUb05HNGl0K1lEUzZnZVlwRmJlTlBQMFpMV1FqTmViaEcyeUZhZUdIcU82?=
 =?utf-8?B?cGk2K1JWa0paQWlCbmFkOTB3TFNqQjlSK0FkcHdZS0xNZFNiQ0UwQ3BQZS9Q?=
 =?utf-8?B?S09uWW9oakdQSkpWMWhxa2o5alFZbWVDeUhQT1g0TlNrd3NaWGI2RzJWQjA2?=
 =?utf-8?B?M1JlRG85SGRTcGd1SStpd3RvcnUyakU5bjE4NGdYVTJYYURtMThIUjFLclk0?=
 =?utf-8?B?b3l5aEZNeG52OHFZcHg3SHptSk1VUk84eTFINXhEU1JXbE5mem5kRWlhc3oy?=
 =?utf-8?B?TjZkQnNpbGQ1RU1UemRIVE5sV2htWkZuL3NrQzQ4RHdZcndoSGk0Z1ZkdE8x?=
 =?utf-8?B?clVrYXh1M2Joc3lZZXJUaEpBMld5NWhIOGE2NUc5VUVTVHBXZVEwdW1jamZk?=
 =?utf-8?B?RGVieUdsVUxlR1ZQL3V4Vys2ZWRRWWJzKzFHLzF1TmVmVk9wdzBCUHFyUGFm?=
 =?utf-8?B?VkFPank2MG5FSUZNSEk2bE14dGx1ZmZGNWNZUG1ycXFHeStRenRWMThFUVJF?=
 =?utf-8?B?QzhndGhFaHV5UjJidTFHZktXMWF1RUJLT3VtNHRVY0RCSzJPRGlHeWtGQ0N6?=
 =?utf-8?B?WmRnbk9lTmJaa29wcURRdS9EdGN4RG51Um5VYUZiSHI1UzcrVkxWdWNBVGRK?=
 =?utf-8?B?R01PdGt6OTRIVzZ6OExJdDVTUmRxdkNuUGVMQWJHc0RSSG1FV1NMZm4wSUh0?=
 =?utf-8?B?VVVFb2Zsc1JCSUEzcnFnYVM3ZHI0d0E2ZktoWHdhZ3RnT2hucTFKQTRWQnV4?=
 =?utf-8?B?UkxHK002U3dWbUR0ZnQ1Vm54eGFMNHVwUXdSWnF3KzZkWExTTUwxYnV5czkz?=
 =?utf-8?B?aXFNRkJWQzZxZzg0QlF1NlRTemlsTHdQSGtKOTBOcjV0ZUo2L1RXRVVFYlN6?=
 =?utf-8?B?WU1FSThrRVgvcDlmWjFHZ05STXFhSnhwNWlhYjNybWpKS2ZSOEFRdHRwaHpB?=
 =?utf-8?B?ZXc2K3FWb0hwRkk3V2xKWC92ODBjUWxXNDZ3QnNBRlZYZjBrMjB0OGMzOEdK?=
 =?utf-8?B?MG9BdlZkV0MxRC9leW9PWkU0OUhSWjlGYk1NdVljWkNCOVVlTEt3WVVQVWtm?=
 =?utf-8?B?eE1rbk9tZjBjMzRjU0F2MWVObmZFdnBXcWxnL3lobVRYaHJHTWJDZUhRdGFk?=
 =?utf-8?B?N2t6TmJ4Q0hTSkIxRHhwZWtlV1Viby9VcXB4QzJibit4VFJSVUlJY3N6Kzc1?=
 =?utf-8?B?YU5hZDZnQ3dlclBSQ3hWWkdGUFRsaFJmcEJ3bUNISzltQ1lXc09ZNTF6cHgr?=
 =?utf-8?B?TU5nQ2pnZ1JTd3J6QkpzRHhySzlBbGNUN1BGMS9lcTE5NUdTNnBsbHVtZnpB?=
 =?utf-8?B?NXRiTE5KVGM4Nm93b3QxTjNLckJ3K1VTOUVEaXQ1UU9OYlRBb1dPVDB0aUlz?=
 =?utf-8?B?NUNTZ0tjSWo5T0tDTVBzZmMzaVA4YzA1UHNSR2huV1A5b2I2NW1KblN4VlBh?=
 =?utf-8?B?dVB0eW8rZ0lpdTQ5SURGYzAwZW1pL3FaYVZCdmhvbmdWMmZvK09VemtqRmhP?=
 =?utf-8?B?UzBtc0lPSWRkL0h1cHo4MzdydDZIdHBaeHJnR2xSS01CRWlTVzN6T2JiOHAr?=
 =?utf-8?B?WlhTTFlhYUdZQ1VwZEpYZDZyd1cydGRwUVdHQnN0c1lHY2ZXM2o5WCtMNDV2?=
 =?utf-8?B?VVAyMGtaTWJ6SGZlejgrTmNzWktJYVBmV3RncFpvcm9IRzhkNnRCYi9EZ1lK?=
 =?utf-8?B?czZydDE0ZWdhdjNhOEZISStLeU5mMjB3eFdxajYyeVlvUlczMm55c2s2dnU5?=
 =?utf-8?B?TzczZkNQOTk1WXI1ZzZyMVZEM3ByNU9iWlJOeUlqL0dZWnJVUzNvRjU2MU5Z?=
 =?utf-8?B?cklabW9LUVd4VTdWc1F5RkdlYVJnSVZNcldzOWZHVlhkNE5KNnZkajZBaUNy?=
 =?utf-8?B?Q29zYjFlcmx4RlRVNlNRUjhCVWxBY04yU01zcDYzTnRwRE4yajgyUmF0K0hO?=
 =?utf-8?B?Yk81VXM0MmFMQUtuS2xndFoxTGNXN2tQTmEwekd1aSswcjFpdFdCdUE4R1Vk?=
 =?utf-8?B?Njh3U2xzVG5QVFczZm5yUTM1UDRGdUF3YjVlUjZwSWpwdFRnRXB4THZMVkhM?=
 =?utf-8?Q?RGRxj6dhzpiEjBFaIMdT1O4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <245C8C080BF86A40B8B0DA683EC77427@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01bbe33-a00f-436b-297f-08dcc6f7881b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 00:22:42.1974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pt8aMErbajQ8rDb8Q2sFYcrxLvGrtC95bdshj2I82C8GtHAJRY3WHKgN7j6IeuEW+K1vQU/n5JvlJRdR4euQUlNEL5ahHR9/5NSyi8C9kMxUSkERVEY3DqKRd+eRe2BH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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

U28gSSBjb21wYXJlZCB0aGUgdjE1IHZzIHYxNyBhbmQgbG9va2VkIGF0IHRoZSBkaWZmZXJlbmNl
Li4KSSBhbHJlYWR5IGRpZCBhIGZ1bGwgcmV2aWV3IGluIHYxNCBhbmQgdjE1IGFkZHJlc3NlZCB2
MTQuClRoYXQgc2FpZCwgZXZlcnl0aGluZyBsb29rcyBnb29kIGhlcmUgZXhjZXB0IGEgY291cGxl
IG9mIG1pbm9yIG5pdHMuCgpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRl
cmVzLmFsZXhpc0BpbnRlbC5jb20+CgoKT24gVHVlLCAyMDI0LTA4LTI3IGF0IDE0OjQ3IC0wNzAw
LCBaaGFuanVuIERvbmcgd3JvdGU6Cj4gVXBvbiB0aGUgRzJIIE5vdGlmeS1FcnItQ2FwdHVyZSBl
dmVudCwgcGFyc2UgdGhyb3VnaCB0aGUKPiBHdUMgTG9nIEJ1ZmZlciAoZXJyb3ItY2FwdHVyZS1z
dWJyZWdpb24pIGFuZCBnZW5lcmF0ZSBvbmUgb3IKPiBtb3JlIGNhcHR1cmUtbm9kZXMuIEEgc2lu
Z2xlIG5vZGUgcmVwcmVzZW50cyBhIHNpbmdsZSAiZW5naW5lLQo+IGluc3RhbmNlLWNhcHR1cmUt
ZHVtcCIgYW5kIGNvbnRhaW5zIGF0IGxlYXN0IDMgcmVnaXN0ZXIgbGlzdHM6Cj4gZ2xvYmFsLCBl
bmdpbmUtY2xhc3MgYW5kIGVuZ2luZS1pbnN0YW5jZS4gQW4gaW50ZXJuYWwgbGluawo+IGxpc3Qg
aXMgbWFpbnRhaW5lZCB0byBzdG9yZSBvbmUgb3IgbW9yZSBub2Rlcy4KPiAKPiAKYWxhbjpzbmlw
Cgo+ICtzdGF0aWMgdm9pZAo+ICtndWNfY2FwdHVyZV9pbml0X25vZGUoc3RydWN0IHhlX2d1YyAq
Z3VjLCBzdHJ1Y3QgX19ndWNfY2FwdHVyZV9wYXJzZWRfb3V0cHV0ICpub2RlKQo+ICt7Cj4gK8Kg
wqDCoMKgwqDCoMKgc3RydWN0IGd1Y19tbWlvX3JlZyAqdG1wW0dVQ19TVEFURV9DQVBUVVJFX1RZ
UEVfTUFYXTsKPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZm9y
IChpID0gMDsgaSA8IEdVQ19TVEFURV9DQVBUVVJFX1RZUEVfTUFYOyArK2kpIHsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdG1wW2ldID0gbm9kZS0+cmVnaW5mb1tpXS5yZWdzOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW1zZXQodG1wW2ldLCAwLCBzaXplb2Yo
c3RydWN0IGd1Y19tbWlvX3JlZykgKgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ3VjLT5jYXB0dXJlLT5tYXhfbW1pb19wZXJfbm9kZSk7Cj4gK8KgwqDCoMKg
wqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoG1lbXNldChub2RlLCAwLCBzaXplb2YoKm5vZGUpKTsK
PiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgR1VDX1NUQVRFX0NBUFRVUkVfVFlQRV9N
QVg7ICsraSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbm9kZS0+cmVnaW5mb1tp
XS5yZWdzID0gdG1wW2ldOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBJTklUX0xJU1RfSEVBRCgmbm9k
ZS0+bGluayk7Cj4gK30KPiArCj4gKy8qKgo+ICsgKiBET0M6IEluaXQsIEcySC1ldmVudCBhbmQg
cmVwb3J0aW5nIGZsb3dzIGZvciBHdUMtZXJyb3ItY2FwdHVyZQo+ICsgKgo+ICsgKiBLTUQgSW5p
dCB0aW1lIGZsb3dzOgo+ICsgKiAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsgKsKgwqDCoMKgIC0t
PiBhbGxvYyBBOiBHdUMgaW5wdXQgY2FwdHVyZSByZWdzIGxpc3RzIChyZWdpc3RlcmVkIHRvIEd1
QyB2aWEgQURTKS4KPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2d1
Y19hZHMgYWNxdWlyZXMgdGhlIHJlZ2lzdGVyIGxpc3RzIGJ5IGNhbGxpbmcKPiArICrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2d1Y19jYXB0dXJlX2xpc3Rfc2l6ZSBhbmQg
eGVfZ3VjX2NhcHR1cmVfbGlzdF9nZXQgJ24nIHRpbWVzLAphbGFuOiBsb29rcyBsaWtlIHdlJ3Zl
IGJlZW4gdXBkYXRpbmcgdGhlIGNvZGVzIGJ1dCBub3QgdGhpcyBkb2N1bWVudGF0aW9uOgo6JXMv
eGVfZ3VjX2NhcHR1cmVfbGlzdF9zaXplL3hlX2d1Y19jYXB0dXJlX2dldGxpc3RzaXplCjolcy94
ZV9ndWNfY2FwdHVyZV9saXN0X2dldC94ZV9ndWNfY2FwdHVyZV9nZXRsaXN0Cj4gKyAqwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3aGVyZSBuID0gMSBmb3IgZ2xvYmFsLXJlZy1s
aXN0ICsKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbnVtX2VuZ2luZV9jbGFzc2VzIGZvciBjbGFzcy1yZWctbGlzdCArCj4gKyAqwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG51bV9l
bmdpbmVfY2xhc3NlcyBmb3IgaW5zdGFuY2UtcmVnLWxpc3QKPiArICrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHNpbmNlIGFsbCBp
bnN0YW5jZXMgb2YgdGhlIHNhbWUgZW5naW5lLWNsYXNzIHR5cGUKPiArICrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoYXZlIGFu
IGlkZW50aWNhbCBlbmdpbmUtaW5zdGFuY2UgcmVnaXN0ZXItbGlzdCkuCj4gKyAqwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBRFMgbW9kdWxlIGFsc28gY2FsbHMgc2VwYXJhdGVs
eSBmb3IgUEYgdnMgVkYuCj4gKyAqCj4gKyAqwqDCoMKgwqAgLS0+IGFsbG9jIEI6IEd1QyBvdXRw
dXQgY2FwdHVyZSBidWYgKHJlZ2lzdGVyZWQgdmlhIGd1Y19pbml0X3BhcmFtcyhsb2dfcGFyYW0p
KQo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU2l6ZSA9ICNkZWZpbmUg
Q0FQVFVSRV9CVUZGRVJfU0laRSAod2FybnMgaWYgb24gdG9vLXNtYWxsKQo+ICsgKsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm90ZTI6ICd4IDMnIHRvIGhvbGQgbXVsdGlwbGUg
Y2FwdHVyZSBncm91cHMKPiArICoKPiArICogR1VDIFJ1bnRpbWUgbm90aWZ5IGNhcHR1cmU6Cj4g
KyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKyAqwqDCoMKgwqAgLS0+IEcySCBTVEFU
RV9DQVBUVVJFX05PVElGSUNBVElPTgo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBMLS0+IHhlX2d1Y19jYXB0dXJlX3Byb2Nlc3MKPiArICrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEwtLT4gTG9vcCB0aHJvdWdoIEIg
KGhlYWQuLnRhaWwpIGFuZCBmb3IgZWFjaCBlbmdpbmUgaW5zdGFuY2Uncwo+ICsgKsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVy
ci1zdGF0ZS1jYXB0dXJlZCByZWdpc3Rlci1saXN0IHdlIGZpbmQsIHdlIGFsbG9jICdDJzoKPiAr
ICrCoMKgwqDCoMKgIC0tPiBhbGxvYyBDOiBBIGNhcHR1cmUtb3V0cHV0LW5vZGUgc3RydWN0dXJl
IHRoYXQgaW5jbHVkZXMgbWlzYyBjYXB0dXJlIGluZm8gYWxvbmcKPiArICrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2l0aCAzIHJlZ2lzdGVyIGxpc3QgZHVtcHMgKGdsb2Jh
bCwgZW5naW5lLWNsYXNzIGFuZCBlbmdpbmUtaW5zdGFuY2UpCj4gKyAqwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRoaXMgbm9kZSBpcyBjcmVhdGVkIGZyb20gYSBwcmUtYWxs
b2NhdGVkIGxpc3Qgb2YgYmxhbmsgbm9kZXMgaW4KPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ3VjLT5jYXB0dXJlLT5jYWNoZWxpc3QgYW5kIHBvcHVsYXRlZCB3aXRo
IHRoZSBlcnJvci1jYXB0dXJlCj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRhdGEgZnJvbSBHdUMgYW5kIHRoZW4gaXQncyBhZGRlZCBpbnRvIGd1Yy0+Y2FwdHVyZS0+
b3V0bGlzdCBsaW5rZWQKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bGlzdC4gVGhpcyBsaXN0IGlzIHVzZWQgZm9yIG1hdGNodXAgYW5kIHByaW50b3V0IGJ5IHhlX2Rl
dmNvcmVkdW1wX3JlYWQKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YW5kIHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9wcmludCwgKHdoZW4gdXNlciBpbnZva2VzIHRoZSBk
ZXZjb3JlZHVtcCBzeXNmcykuCj4gKyAqCj4gKyAqIEdVQyAtLT4gbm90aWZ5IGNvbnRleHQgcmVz
ZXQ6Cj4gKyAqIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKyAqwqDCoMKgwqAgLS0+
IGd1Y19leGVjX3F1ZXVlX3RpbWVkb3V0X2pvYgo+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBMLS0+IHhlX2RldmNvcmVkdW1wCj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTC0tPiBkZXZjb3JlZHVtcF9zbmFwc2hv
dCguLklTX0dVQ19DQVBUVVJFKQphbGFuOiBuaXQ6IGNhbiB3ZSByZW1vdmUgdGhlICJJU19HVUNf
Q0FQVFVSRSIKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLS0+IHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9jYXB0dXJlKC4uSVNf
R1VDX0NBUFRVUkUpCmFsYW46IG5pdDogc2FtZSBoZXJlLi4gcmVtb3ZlIHRoZSAiSVNfR1VDX0NB
UFRVUkUiCj4gKyAqCj4gKyAqIFVzZXIgU3lzZnMgLyBEZWJ1Z2ZzCj4gKyAqIC0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gKyAqwqDCoMKgwqDCoCAtLT4geGVfZGV2Y29yZWR1bXBfcmVhZC0+Cj4gKyAq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEwtLT4geHh4X3NuYXBzaG90X3ByaW50Cj4gKyAqwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTC0tPiB4ZV9od19lbmdpbmVfc25h
cHNob3RfcHJpbnQKPiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgUHJpbnQgcmVnaXN0ZXIgbGlzdHMgdmFsdWVzIHNhdmVkIGF0Cj4gKyAqwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGd1Yy0+Y2FwdHVyZS0+
b3V0bGlzdAo+ICsgKgo+ICsgKi8KPiArCmFsYW46c25pcAo=
