Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9493DD3C928
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F7110E763;
	Wed, 10 Dec 2025 17:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxMYemTr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1831710E763
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765387254; x=1796923254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZfEfOIXkZlmIOQK54ACIrUVpEeow5aWdYjS9w4tYeDo=;
 b=hxMYemTrxu/cFL0WOxgUJS0TGFDSFJoNQyFRw29/U3zPSS5GXa6Gg19W
 KMiPz9ftsvt+nlOgQ+Elvgk1hou15GvXbyMmxjtPdTQYchY9C5CgL7tLS
 q2zwwM22HUDsh1xliQLSt/p2b0MJZKMsa36iDStqBUQXNvpNoes/ld2eJ
 3qn994YbfZW78K/3by2ND+pBIwnJYsJ2YnA2truSOEKQmX2D6BoCXZJ58
 3A9UZVzt9Ha9Dr0IfGlnpf5xidHP0lt6X9tltx5jfmT4sk6XSE0gKdgs6
 Jb16NVrceTMDX1K7iEvuB9QMT/4ivgQ5kIh+KhovfJ7lCA7gQVm6MyFMc w==;
X-CSE-ConnectionGUID: Mx2VHArORRmRNQx9nEr6/Q==
X-CSE-MsgGUID: QDjZwdZoR1+1jXr1iG/CsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66545481"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="66545481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:20:54 -0800
X-CSE-ConnectionGUID: ezXaMdOGQAKlZFdp+ZC5nQ==
X-CSE-MsgGUID: gJsg9G4yRs+Wc+uykpkiMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="227213169"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:20:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:20:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 09:20:53 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.13)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:20:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LywU2WLn0rYawySdVBU/oXEVNye/XJHH5eeSdghuy8m6ezd6Y8TzpNZsluy25c9ZnqQAnl/amx8CKQBdD+JHcOrgUA14KACEhVIRP72CrELBHP4cJ5YOgFpDm3nYnKgOdreqAt1yS5N5/AZCXW9snGL94aFJAjUP27YilXoRSwXENa8cvZ2M5Lri3jkXdVmnU+C+A0tXRpGIaO1GFu6Z/izEg7MEzngFCrP3/WwxGyWknaPzwVNuUruVk0X0brqfh18DajbWFg8ZdKgRtsWlVkUhjwliVtI66c5JlIQGRzUC0cIHI4wiAxQtJSkPitYJW1w+Ka/wddgkIVJfkrH87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfEfOIXkZlmIOQK54ACIrUVpEeow5aWdYjS9w4tYeDo=;
 b=n4twD7CeDrqJNm1X8n0wnkAqLFrGazxhq649GylzznDMxrQceOLo0DQksBpDbIRGR3/pVgOOEZdns8pvMIxye5+TRFrSSVZBhiudc0k07Wm651hRF9fyIjYbrjqewQnvrmJMTLg0Zx9lKpZoZtv0pCTwMQ1ICZOeH4mCp+K3Vy4kpGyfMgylb+dRvX5/cdX80/qJo7bYgQtwORLrnfDea2GBH5wgepV1euOITtV4mSUazmiN+8riXvUd6zm3YRo/8H8a6zNlkQARm/3qledJGnUC2cyB80Huzcu5ieDBgtnT6tEjzaQyY96dxT/nUSapzOpgkL9wO/L9sSoTw92axA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.8; Wed, 10 Dec 2025 17:20:50 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%3]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:20:50 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Thread-Topic: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Thread-Index: AQHcaHd5VbkCKnpsCEiu8/BuhqMfCbUZEqGAgABHdoCAAARegIABSkgAgAATGbCAADwbgIAAKC/g
Date: Wed, 10 Dec 2025 17:20:50 +0000
Message-ID: <DM8PR11MB565512596D0BCD421D4F532EE0A0A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-7-tursulin@igalia.com> <aTfxySrZ-O1Bplcm@intel.com>
 <2b912c41-a03a-40cc-8bf0-f70558ffdafc@igalia.com>
 <aTgxZTjU398-jnf3@intel.com>
 <9450ca34-033c-4217-80cb-6f87924f372c@igalia.com>
 <DM8PR11MB56550D69C15FBE13288B2224E0A0A@DM8PR11MB5655.namprd11.prod.outlook.com>
 <e1f23c82-a4e7-4e18-a1e7-692b31982e4e@igalia.com>
In-Reply-To: <e1f23c82-a4e7-4e18-a1e7-692b31982e4e@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|CH3PR11MB7391:EE_
x-ms-office365-filtering-correlation-id: 71a72dc4-26e2-452c-84bb-08de3810771c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OFQ0YTkxRUhoaExjUGNhajE2dVUrUUEwa01uKzF4d2NGZEUyakRFNTVIQWs2?=
 =?utf-8?B?MFV2dEJQMWZkZjVJRHBjak9sazFLSDIzd1VvMVhQeVNLNEYzWlZVVi81RTE4?=
 =?utf-8?B?Ylo4bXZ6YTZzdGF6dFZweTZKUnF4Y3BSNTVkQTBRWVE4ankzdFFPb0cwTUhY?=
 =?utf-8?B?eTh2VEJpcHVCL2xHaGlsOEc0T2EvTG1uakdKNGlmcG8xR1lqbDJoSzdaUmRS?=
 =?utf-8?B?UVR4VFNsakRDT2k3dWw2N3cxQW85WVVQczkyN2Z6cmI0NG8xM2F0M2ptSHcr?=
 =?utf-8?B?U0lTalFUc2lVRytYVk4vRlZVTmdZbEdhTVd5cjAwUTFzOUtGQndQWVF2TXJo?=
 =?utf-8?B?aklXL1F3eHVxSHdNa1Z6QkZmblBJcHV5RkVvY1JxaHJLelBZbnZEd0Q0dDEx?=
 =?utf-8?B?bzJsRm03aFhkWEwxQWo1ekdXSWw4MWF2UGdmbTZuVE1FZXNDbUU0Rk10MnJ5?=
 =?utf-8?B?amQ1TXhua2p2SDJGZHVndXRkMVVXNkE5dXpyOHJ2cVptdHZhRWVFOVNyamxN?=
 =?utf-8?B?Y1Jhb0xITUxvcXpqVEtBNDF3TmlYay9WWGV3a0tSRGxFV24yUGYzUk44REh1?=
 =?utf-8?B?SE5SbjV5VTBiUTRyNnBuZitIR29OQjhOcGZYUmpKQlVTZWI0V3JGS09rWGJp?=
 =?utf-8?B?c243UWhFNXBHSUp1M2dhT0NYOVUzSnFVWCtoTVhWZDNXM3lKV2swSzdXSFdC?=
 =?utf-8?B?aUhIUzNZdUJRWGlvcWhOZy9GVzMxZUpmTWV1MS82OFkzMHVsMytSSkVFb3hm?=
 =?utf-8?B?YktKT1AyVWk5Wmh6RjVublpuTHBhTURadE5FYzlqZ0xuZFRHUVYyWVlHT0ND?=
 =?utf-8?B?T2JmZVN4L1Q5MVh2TEw3NzJCN09hV1k5TUIwa2dvYnZ6S3MwS2xZS2V3WDhH?=
 =?utf-8?B?dWlEcmxDR3JzK3hqYzR5MXFvQlpMODRTMnBiWE1ueW4wNFh4UlkrckUxUGw4?=
 =?utf-8?B?bFZmTEZCR283dDBFdkZwalFiT0w2aWxzVXZHNlAxNTVXWFNtL3VucExkMVVh?=
 =?utf-8?B?YXpGTVpIVlhwcW85aWVONm1mS3l6WGJoeThaM0pEc0JsL280QU1IV1VYaVJV?=
 =?utf-8?B?VW92elcza0tOanVMbjVlVzFhR2ljQXl5TVhBTG40QjE5OXE1R1NYQ2gzYzZi?=
 =?utf-8?B?RVJTTVVnaXpNamMraW1uT041dlpCM0RUeEZHOENDMGpZQmNKM1ZSb2Y4RHgw?=
 =?utf-8?B?YXB6STYvZ2tpZ3RnV2gxRXkyaHhkaDQrZTltMTNxZ1VLZW5GRzFTOTRGRlVq?=
 =?utf-8?B?eDRlNGNxV3QvdS9qSWltWU03b2dhUThrL3pwRkI4ZDRxRTM4QWxYdTZTZkg1?=
 =?utf-8?B?ZXEwVzNiZXpyOS9paWNIOVVnOThCVzlsMHhmellyZGRJcjRDUnhoN2VQR25y?=
 =?utf-8?B?VUVOU0liRmEyTjR0NzV1OC9hWjUvdHlEZ3RhMU0yZzA2ZUZoa0Y1ZEdXUEsy?=
 =?utf-8?B?YjJWd3Znb1BGbTg3Tnh4WjZnUkIrSDM2a3FxaWFtWTdpbXFVTEJIMWUxRjk3?=
 =?utf-8?B?RlFUSzJoS1ZUOXc2ZWFNVWpodksycVZTVXJqR2VLK0YrTkxLRGxSODNyVFhk?=
 =?utf-8?B?VFhlN0ROWFIyWWw4VW1rTDRiRmllbFZOelk4bzgvMHNxQjMyblFCS21BZGRG?=
 =?utf-8?B?STRxL0NURFJIREtieU9sTFZqb3g4MXlLMTNMRVk3L0pzNW9SRWNYa3ZrYWJD?=
 =?utf-8?B?YnVQeCt1cGtYeXFINXJZRVgrNVh0ZkVNYkxEUHcxRlZsTDJEMGxPRXlRYita?=
 =?utf-8?B?ZFllcCtxQkJPQ05qczdKdmFBeDZTMTV0cXhCWVRET2RqWS9VWGp2SGhSaHRl?=
 =?utf-8?B?VlN5THlXOVAvcXpOUlVPdExrT01Jb25WVXhQOXdlZklPcGxEcFZHU0pBaUd1?=
 =?utf-8?B?c3Q1RkNXdnRWbWtIc3cvU2pqQUdxM0pUd2JYNm0zNWZselhRbnpGMmhPQjYw?=
 =?utf-8?B?MU5WbzZkUEVZUXJqWjU0YzhYYlZSVCt2b2ZtMXhoQnltamxvN1VnZmc3Ui9v?=
 =?utf-8?B?anduRFdwTWRWK2h2N3RHSVk3cmdzYWVQbHNjMCtyWTNMMXBuKzUvdHRjYmpS?=
 =?utf-8?B?S2R3UTlQZHk2dVkxcHlLOS82aG1hZ0JtSnR5UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDh0M2Q5WStYN0k1ZkcwVHJ2b1VGMjhuOXRxREJqbHU2a3pLYUZOdThSa0Nz?=
 =?utf-8?B?MlNGNklKRjIvdVlGU2I4VGk4M2xpcmZpdzY5Q2YxampiazFtRnpUY29vK2tY?=
 =?utf-8?B?OWdvemFVYTR1M3djdlFmOGNIL2FuWUF3dWpnS0ZrWld1WXZRUEY4VU1veStn?=
 =?utf-8?B?ek9JSG9pNVlhUW5xV1BHMVMwVXcvYWNsblB4QjhWS0hzUkZKZDZqUzMzaVdu?=
 =?utf-8?B?TVVUU3Z4dHp5aXkwR3kray9CNHBjSVhRM0lIRXZkSkRGTWQrcEtYMmxkVU1Q?=
 =?utf-8?B?bGlOS0xjbGw3N3M5MFRnUGVOWXdXWlVvRmxXZW5rN0ExaThlbDlZYWVTNkhu?=
 =?utf-8?B?bWI1eFB2ZDJYdDh0OEdaZ2gyNlJzamFDaXA0dU0rVkNrT2pSR0RDRkpmTzFK?=
 =?utf-8?B?RXVQT24vSXRhSHdqTVliNTF1ZUIvYTg4aVhiV2tXNDYvMDRHeVFNQ0R6Vkdt?=
 =?utf-8?B?aVY4aDJkakgwWTBrTCtiSDFEZW9PczN2NzNOZTdXL3RaRUNQMS95SDV2VWFr?=
 =?utf-8?B?ODJqejg4UE05S3hOVFlwcHovZGhhNE9CRHF0U3VlVDNKMnlvZlZGNWJSOVRn?=
 =?utf-8?B?cnhhaENwY2ExNUtiOEdwNDN3emJ5cHpnT08wYk9ucFAxV3ZOVmhrMG4xUkt3?=
 =?utf-8?B?Vm5JSkpld3pGVDNVVWdlRWhFell5QmFKRjBVbEU4akVyQUpGbVRGME1TclpR?=
 =?utf-8?B?MHpKSWVqZlF2UXRRdUJoeXJQY25VMkpDY0hTYXpJbTlrSllYMnZBeE5kQkp6?=
 =?utf-8?B?UGw1YlFKQWNZUWt6elgxbXNtdjB5NjY0NkkzWHBtbXRJZGFucmNVK0NUV2tl?=
 =?utf-8?B?RWRockxoL0VmUTk5SVpqNWFOVE1RZkxNQnJNOU1GTFU1TVpqbTdPWTJGZmtC?=
 =?utf-8?B?dG50eG9LS1lxa2RrTndET1l3c1hCMlIzTTBienVOK21VcUxVMHM4cUVoOW8w?=
 =?utf-8?B?ZDFoZ2Zab3hEd2J0YmN4bTV2aVJTOXU1UUIwZDhIRktFSjlNVW1YTFZTeTFq?=
 =?utf-8?B?cjFlM3NjL3daNFAxQTIySjZvWUtsWkw2L0hQbFdkSVpabkVTTjhHTWJuU1Bh?=
 =?utf-8?B?MVVHL0JlL0ErTW1QNnk3TGJ4MXZ0S1JxOXRBSDFIUkc2N0cya0xRQlFEYmg0?=
 =?utf-8?B?YWoramk0OEJCSStNNHpFVFBRVnI4NDZSL0N0c1pGVHFLZHV6ekNoRTd6RTNp?=
 =?utf-8?B?Vm0zYUJ4SVNzd01MeVBwcUR1RkNhZGxCSFozdjFXbEd0bTE3RXhGanAyaHlM?=
 =?utf-8?B?cUZSck1ZNXNhcHNSYlIxaHhVZHkzSUNFeTBWclNacDdHZlVUVW9pUWdSZEpv?=
 =?utf-8?B?ZXJBcDY3Q1RqZHZnVmk2SEdvZlZyZEh6ZGdDcHJUSkIzNGFVdW1hZkVkbGFo?=
 =?utf-8?B?RWtuOUZLbGtndkJUN0lQdmJjdG1heVN5MVBPTkhsQ0F3dkd6L1U1aHVZVURo?=
 =?utf-8?B?MlM4ajFwL2dNbzBpSG9JelFWNm12Yi9oQ3QvSUo3YUswdEtZOG5wdkpqN05Z?=
 =?utf-8?B?WCtQTjFzTC80UTUvUWtzQ3RYQW9kTk5yc2F4VzUxM3lnYy9YWENjTDFKRlE1?=
 =?utf-8?B?TjRSc1RNa3dpRnB0VmR3bVdDQ3MyRlZORVVHbXdqS0NMOG5qK20zUGM4YnQ0?=
 =?utf-8?B?eDFSSEVPTXdVaXdpZjUvZWdsa082RE9SUWltMlB6a3ZESSttVUoySm5kQnYr?=
 =?utf-8?B?TTl3YzAxdWZLNHJBTTl3M1hQc3lKdTcyZ1IwZUN3Y1BZNmxlRmtwMXl1L3dW?=
 =?utf-8?B?czFKYWRaeWhoWUx4NGhYYnhhZExDYVozYURXLzNDYWNZeWloMmU4MnZ5c2xz?=
 =?utf-8?B?aVhoTEZ2OGh0N2ZRTHliU2hsVEpEZlFhUUFCanNOaFp3YmdTTVZCeENlV2Jp?=
 =?utf-8?B?K21JcEY5UERXVnVockVWVmhXMGJqTWRFbGx6R2RLcXBrbUM4T2NvNTZHalcr?=
 =?utf-8?B?UnZ2eHZvVjVjck5nUndSbmtjNDcweEtabUZkOGFudWhqcGhGdXN3ZzBUQjk2?=
 =?utf-8?B?bXRjeURjNDRPT0IrbEZ1WUZhOFh2cWVYQ3RpRlZmZGNZNXNVVGJMOW45N3ho?=
 =?utf-8?B?QVhHN0VHQWpZdUZNMzgrMlJFcEh0SWpFZVFwRGVuRXlSVTgwUCs3aWtLTFFp?=
 =?utf-8?Q?x1zXG06bulCmocZtey/XDsTu1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a72dc4-26e2-452c-84bb-08de3810771c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 17:20:50.1727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XeXk8t0++tAr5mEE5wk1FOgCvFCh+KPDoOJB5gipwzV9TOLCFAdzPKN8qxQmrqD4wzP3KQH1y6TQlpbW4z0gJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUdnJ0a28gVXJzdWxp
biA8dHVyc3VsaW5AaWdhbGlhLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCAxMCBEZWNlbWJlciAy
MDI1IDE2LjUxDQo+IFRvOiBTYWFyaW5lbiwgSmFuaSA8amFuaS5zYWFyaW5lbkBpbnRlbC5jb20+
OyBWaWxsZSBTeXJqw6Rsw6QNCj4gPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBD
YzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBrZXJuZWwtZGV2QGlnYWxpYS5jb207
IFR2cnRrbyBVcnN1bGluDQo+IDx0dnJ0a28udXJzdWxpbkBpZ2FsaWEuY29tPjsgVml2aSwgUm9k
cmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTUg
MDYvMTBdIGRybS94ZTogSGFuZGxlIERQVCBpbiBzeXN0ZW0gbWVtb3J5DQo+IA0KPiANCj4gT24g
MTAvMTIvMjAyNSAxMjoxNywgU2FhcmluZW4sIEphbmkgd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4g
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPj4gVHZy
dGtvIFVyc3VsaW4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCAxMCBEZWNlbWJlciAyMDI1IDEyLjA4
DQo+ID4+IFRvOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pg0KPiA+PiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBrZXJuZWwtZGV2QGln
YWxpYS5jb207IFR2cnRrbw0KPiA+PiBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2FsaWEuY29t
PjsgVml2aSwgUm9kcmlnbw0KPiA+PiA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTUgMDYvMTBdIGRybS94ZTogSGFuZGxlIERQVCBpbiBzeXN0ZW0g
bWVtb3J5DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDA5LzEyLzIwMjUgMTU6MjUsIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToNCj4gPj4+IE9uIFR1ZSwgRGVjIDA5LCAyMDI1IGF0IDAzOjEwOjAzUE0gKzAx
MDAsIFR2cnRrbyBVcnN1bGluIHdyb3RlOg0KPiA+Pj4+IE9uIDA5LzEyLzIwMjUgMTA6NTQsIFZp
bGxlIFN5cmrDpGzDpCB3cm90ZToNCj4gPj4+Pj4gT24gTW9uLCBEZWMgMDgsIDIwMjUgYXQgMDg6
MTc6MTdQTSArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6DQo+ID4+Pj4+PiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4gPj4+Pj4+DQo+ID4+Pj4+
PiBJZiBEUFQgaXMgYWxsb2NhdGVkIGZyb20gc3lzdGVtIG1lbW9yeSBpdCB3aWxsIGJlIGNyZWF0
ZWQgaW4gdGhlDQo+ID4+Pj4+PiBkZWZhdWx0IHdyaXRlLWJhY2sgY2FjaGVkIG1vZGUuIFRoaXMg
bWVhbnMgd2UgbmVlZCB0byBmbHVzaCBpdA0KPiA+Pj4+Pj4gYWZ0ZXIgcG9wdWxhdGluZyBvdGhl
cndpc2Ugbm90aGluZyB3b3Jrcy4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4gPj4+Pj4+IENjOiBS
b2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4+Pj4+PiAtLS0NCj4gPj4+
Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDQgKysrKw0K
PiA+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPj4+Pj4+DQo+
ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGlu
LmMNCj4gPj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4g
Pj4+Pj4+IGluZGV4IGEyMmE5MTgyZGFkYi4uODllZTY4YzQwMzI5IDEwMDY0NA0KPiA+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gPj4+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+ID4+Pj4+PiBAQCAt
Myw2ICszLDcgQEANCj4gPj4+Pj4+ICAgICAgKiBDb3B5cmlnaHQgwqkgMjAyMSBJbnRlbCBDb3Jw
b3JhdGlvbg0KPiA+Pj4+Pj4gICAgICAqLw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICsjaW5jbHVkZSA8
ZHJtL2RybV9jYWNoZS5oPg0KPiA+Pj4+Pj4gICAgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9iby5o
Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICAjaW5jbHVkZSAiaTkxNV92bWEuaCINCj4gPj4+Pj4+
IEBAIC0xNjIsNiArMTYzLDkgQEAgc3RhdGljIGludCBfX3hlX3Bpbl9mYl92bWFfZHB0KGNvbnN0
IHN0cnVjdA0KPiA+PiBpbnRlbF9mcmFtZWJ1ZmZlciAqZmIsDQo+ID4+Pj4+PiAgICAgCQkJCQkg
IHJvdF9pbmZvLQ0KPiA+cGxhbmVbaV0uZHN0X3N0cmlkZSk7DQo+ID4+Pj4+PiAgICAgCX0NCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiArCWlmICgheGVfYm9faXNfdnJhbShkcHQpICYmICF4ZV9ib19pc19z
dG9sZW4oZHB0KSkNCj4gPj4+Pj4+ICsJCWRybV9jbGZsdXNoX3ZpcnRfcmFuZ2UoZHB0LT52bWFw
LnZhZGRyLCBkcHRfc2l6ZSk7DQo+ID4+Pj4+IEhvdyBpcyBhbnl0aGluZyB3b3JraW5nIGN1cnJl
bnRseSBpZiB0aGUgRFBUIGlzIGJlaW5nIGNyZWF0ZWQgd2l0aA0KPiA+Pj4+PiB0aGUgd3Jvbmcg
Y2FjaGluZyBtb2RlPw0KPiA+Pj4+IEkgc3VzcGVjdCB0aGUgc3RvbGVuIGFsbG9jYXRpb24gbmV2
ZXIgZmFpbHMgaW4gcHJhY3RpY2UgKG9yIGFsbW9zdA0KPiA+Pj4+IG5ldmVyLCBvciBhdCBsZWFz
dCBub3QgaW4gQ0kpLg0KPiA+Pj4+PiBTb3VuZHMgbGlrZSBzb21lb25lIHNob3VsZCBmaXggdGhl
IERQVCBjcmVhdGlvbiB0byBjb3JyZWN0bHkgYXNrDQo+ID4+Pj4+IGZvciBVQy9XQy4gQnV0IEkg
c3VwcG9zZSBzb21lb25lIHNob3VsZCBtZWFzdXJlIGlmIFdCK2ZsdXNoIGlzDQo+ID4+Pj4+IGFj
dHVhbGx5IGZhc3Rlci4uLg0KPiA+Pj4+IEkgYW0gbm90IHN1cmUgd2hhdCBpcyBkZXNpcmVkIGhl
cmUuIFN5c3RlbSBtZW1vcnkgYnVmZmVycw0KPiA+Pj4+IGRlZmF1bHRpbmcgdG8gY2FjaGVkIGlz
IHRoZSB4ZSBkZWZhdWx0LCBzbyBzaG91bGQgRFBUIGJlIGFuIGV4Y2VwdGlvbiBJDQo+IGRvIG5v
dCBrbm93Lg0KPiA+Pj4gQW55dGhpbmcgbWVhbnQgZm9yIHRoZSBkaXNwbGF5IGVuZ2luZSBpcyBz
dXBwb3NlZCB0byBiZSB1bmNhY2hlZC4NCj4gPj4gSSBjYW4gYWRkIFhFX0JPX0ZMQUdfU0NBTk9V
VCB0byB0aGUgc3lzdGVtIG1lbW9yeSBidWZmZXIgY3JlYXRpb24NCj4gYW5kDQo+ID4+IHRoYXQg
d291bGQgaGFuZGxlIHRoaXMgYXNwZWN0LiBBY2NlcHRhYmxlIHRvIHlvdT8NCj4gPj4NCj4gPj4g
ICDCoEJ1dC4uDQo+ID4+DQo+ID4+Pj4gSW4gYW55IGNhc2UgQXV4Q0NTIHNlZW1zIHRvIG9ubHkg
d29yayB3aXRoIERQVCBpbiBzeXN0ZW0gbWVtb3J5IGFuZA0KPiA+Pj4+IHRoaXMgY2xmbHVzaC4g
RFBUIGluIHN0b2xlbiB3aXRoIEdUVCBhY2Nlc3MgYW5kIEdUVCBmbHVzaGluZyAoYXMNCj4gPj4+
PiBpOTE1IGRvZXMNCj4gPj4+PiBpdCkgZG9lcyBub3Qgc2VlbSB0byB3b3JrIGZvciB4ZS4gSSBn
dWVzcyB0aGUgZW50aXR5IGRvaW5nIHRoZSBEUFQNCj4gPj4+PiByZWFkcyBpcyBzb21laG93IHNw
ZWNpYWwgY29oZXJlbmN5IHdpc2UuDQo+ID4+PiBTb3VuZHMgbGlrZSB0aGVyZSBpcyBzdGlsbCBz
b21ldGhpbmcgYnJva2VuIGluIHhlLg0KPiA+PiAuLi4gSXNzdWUgaXMgd2hlbiB5b3UgZm91bmQg
dGhlIG1hZ2ljIG1vY3MgNjEgdGhlIENJIHN0aWxsIHNhdyBhDQo+ID4+IHNwb3JhZGljIGZhaWx1
cmUuIDMgb3V0IG9mIDQ0IG5ldyB0ZXN0cyBmYWlsZWQuIFRoZXNlIHNwb3JhZGljIENJDQo+ID4+
IGZhaWxzIEkgd2FzIG5ldmVyIGFibGUgdG8gcmVwcm9kdWNlIGxvY2FsbHkuIChJdCB3YXMgYWx3
YXlzIEFETC1QLA0KPiA+PiBhbmQgSSBoYXZlIGFuIEFETC1QIGFzIHdlbGwuKQ0KPiA+Pg0KPiA+
PiBBYm92ZSBjb3VwbGVkIHdpdGggdGhlIGZhY3QgaTkxNSBoYXMgdGhpcyBjbGZsdXNoIG9uIHRo
ZSBmaXJzdCBwaW4sIEkNCj4gPj4gYXNzdW1lZCBDQ1MgaXMganVzdCBzcGVjaWFsIGVub3VnaCB0
aGF0IGl0IGlzIHJlcXVpcmVkLiBGb3IgY2VydGFpbg0KPiA+PiB3aXRoIGl0IHRoZXJlIGFyZSBu
byBzcG9yYWRpYyBDSSBmYWlscy4NCj4gPj4NCj4gPj4gSSBldmVuIHRyaWVkIHJlbW92aW5nIHRo
ZSBjbGZsdXNoIGZyb20gaTkxNSBidXQgSSB3YXNuJ3QgYWJsZSB0bw0KPiA+PiByZXBybyBhbnkg
ZmFpbHVyZXMgdGhlcmUuIFRoaXMgbWF5IG1ha2UgaXQgc291bmQgbGlrZSB0aGUgY2xmbHVzaA0K
PiA+PiBpc24ndCByZXF1aXJlZCwgYnV0IGdpdmVuIEkgYW0gbm90IGFibGUgdG8gcmVwcm8gZmFp
bHVyZXMgd2l0aCB4ZQ0KPiA+PiBlaXRoZXIgSSB0aGluayB3ZSBjYW5ub3QgYXNzdW1lIHRoaXMu
DQo+ID4+DQo+ID4+IE9uIHRoZSBvdmVyYWxsIEFETCBpcyBub3QgYSBzdXBwb3J0ZWQgcGxhdGZv
cm0gd2l0aCB4ZS4gU28gb25lIG9wdGlvbg0KPiA+PiBjb3VsZCBzaW1wbHkgYmUgdG8gbm90IGNv
bXBsaWNhdGUgbXkgc2VyaWVzLCBhbGxvdyBmb3Igc3BvcmFkaWMgQ0kNCj4gPj4gZmFpbHMgKHJl
Y29yZCB0aGVtIGluIENJIGJ1ZyBsb2cgYXMgZXhwZWN0ZWQpLCBhbmQgcmV2aXNpdCB0aGUgdG9w
aWMNCj4gPj4gKmlmKi8qd2hlbiogYSBwcm9ibGVtIG91dHNpZGUgb2YgQ0kgaXMgZm91bmQuDQo+
ID4+DQo+ID4+IEFsc28gYW5ub3lpbmcgaXMgdGhhdCBBREwgbWFjaGluZXMgYXJlIGluIHRoZSB4
ZSBDSSBhbmQgbm90IGk5MTUuIElmDQo+ID4+IHRoZXkgd2VyZSBpbiBpOTE1IEkgd291bGQgYmUg
YWJsZSB0byBkbyBzb21lIENJIHJ1bnMgdG8gc2VlIGlmIGk5MTUNCj4gPj4gY2FuIGJlIG1hZGUg
dG8gZmFpbCBzcG9yYWRpY2FsbHkgd2l0aG91dCB0aGUgaW5pdGlhbCBjbGZsdXNoLg0KPiA+IFRo
ZXJlIGFyZSBzeXN0ZW1zIGluIGk5MTUgQkFUIGJ1dCBub3QgaW4gc2hhcmRzLiBQZXJoYXBzIG1v
ZGlmeSB0ZXN0IGxpc3QNCj4gKEJBVCkgYW5kIHVzZSB0aGF0IElHVCBmb3IgeW91ciBrZXJuZWwg
Y2hhbmdlcz8NCj4gDQo+IE9rYXkgSSB3aWxsIHRyeSwgdGhhbmtzIGZvciB0aGUgZ3JlZW4gbGln
aHQgSmFuaS4gOikNCldlbGwgYW55b25lIGNhbiBzZW5kIENJIHBhdGNoZXMgOiApIA0KDQo+IEFy
ZSB0aGV5IHRoZSBzYW1lIHR5cGUgbWFjaGluZXMvQWxkZXJsYWtlcyBib3RoIGluIHRoZSBpOTE1
IEJBVCBhbmQgeGUNCj4gc2hhcmRzPyBQcm9ibGVtIGNvdWxkIGJlLCBhcyBsb25nIGFzIHNvbWV0
aGluZyBpcyBkaWZmZXJlbnQsIGZhaWx1cmUgdG8gdHJpZ2dlcg0KPiB0aGUgc3BvcmFkaWMgZmFp
bHMgaW4gaTkxNSBCQVQgd2lsbCBub3QgY29uZmlybSBpOTE1IGlzIGltbXVuZSB0byBpdC4NCk5v
dCBzdXJlIGJ1dCBJIHNlZSB0aGlzIA0KSTkxNSBCQVQ6ICBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNzY1Ni9iYXQtYWRscC02L2Jvb3QwLnR4dA0KPDY+
WyAgICAwLjAwMDAwMF0gRE1JOiBJbnRlbCBDb3Jwb3JhdGlvbiBBbGRlciBMYWtlIENsaWVudCBQ
bGF0Zm9ybS9BbGRlckxha2UtUCBERFI0IFJWUCwgQklPUyBSUExQRldJMS5SMDAuNDAzNS5BMDAu
MjMwMTIwMDcyMyAwMS8yMC8yMDIzDQo8Nj5bICAgIDAuMTQ5OTM1XSBzbXBib290OiBDUFUwOiBH
ZW51aW5lIEludGVsKFIpIDAwMDAgKGZhbWlseTogMHg2LCBtb2RlbDogMHg5YSwgc3RlcHBpbmc6
IDB4MykNCg0KWGUgc2hhcmRzOiANCmh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2lu
dGVsLXhlL3hlLTQyMTEtMTIyNzFmNjMyOTE1ZWZlMGM1ZDQxNzFiOWMwZTkwZjU3ZWNkZmUwMS9z
aGFyZC1hZGxwLTYvYm9vdDE0LnR4dA0KPDY+WyAgICAwLjAwMDAwMF0gRE1JOiBJbnRlbCBDb3Jw
b3JhdGlvbiBBbGRlciBMYWtlIENsaWVudCBQbGF0Zm9ybS9BbGRlckxha2UtUCBERFI1IFJWUCwg
QklPUyBSUExQRldJMS5SMDAuNDAzNS5BMDAuMjMwMTIwMDcyMyAwMS8yMC8yMDIzDQo8Nj5bICAg
IDAuMTA1NjgyXSBzbXBib290OiBDUFUwOiBHZW51aW5lIEludGVsKFIpIDAwMDAgKGZhbWlseTog
MHg2LCBtb2RlbDogMHg5YSwgc3RlcHBpbmc6IDB4MykNCkxvb2tzIGJvYXJkcyBhcmUgZGlmZmVy
ZW50IGJ1dC4uIGdvIGFuZCBmaWd1cmUgb3V0LiANCg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IFR2
cnRrbw0KDQpCciwNCkphbmkNCg0K
