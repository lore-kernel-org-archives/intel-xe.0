Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE35606A31B
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SoQ53+Ai
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FE7112410;
	Thu, 22 Oct 2026 08:44:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037D4112410;
 Thu, 22 Oct 2026 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792658641; x=1824194641;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9XdygOAs5FxumhYfDqwwnYKE9gBUIv1gue0s6upyrf0=;
 b=SoQ53+AiD7wiEnUQbkf9JqiSN5FKAXByLXMXF/cByiPzL7WjDAHs8hAK
 RlF2FppG6BBbtjU2SIKykv6sIYphy7DxzfPEsap/OyhGkHzCyjKCPapOh
 oYME++Q5xYQwjkAfeKJq2+ElvqIGsIcu16Q/KtAb3+BHd5hjX2AtZwpsV
 z7/x+8zm10wM6TlNEENHeP3PylF+/LLnqXHt2xwRngdd3B/WfFkfU4NPA
 YT9YOGZfMcuPxipPupVfC0FeWrfJgpX2ZmKQNlwgo2bSjuJkBLsWICXx/
 +JoZVrBGNjuAwh60RO9Ma8lRYH979KazLfHMn948euqlrqC+NQDoQnvHY Q==;
X-CSE-ConnectionGUID: IzKZcQ5KR12HidG9cBhoTg==
X-CSE-MsgGUID: QlvepqBXRHGyTsNf2b64Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1277922"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1277922"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 01:44:00 -0700
X-CSE-ConnectionGUID: NxXVpJqGT0eKWa8YyxGN9A==
X-CSE-MsgGUID: dOFoYXuIQumFWqby7YOe3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5072995"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 01:44:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 01:43:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 01:43:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 01:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESHFozgKa4ibv/0W5jxFc264Xt6De4ucqNlXrwWgnueu47fmMYNJ6pc1nagCou8IlJ8xBL5oRTkxm0OoIFWt5OWuABc1Lhnr43XRWiJin3Qo0h30T7+2PbTdi/Uve5Rpz0Y+M3bHu1cdgxLNvC+OMITBqhbM8WREQR5Tga7vSqkRYcHNyPgphen7B6cPFp5oLYQXjZGmUHZbXgByfuyQpgfd6ngKFKPfJ1zSxwE5P06G9d51Rrx6Mt2w5IRKT83aQ7ese3vWhhLysHXizjnnPNIgzpTKbCFsHMYWYacYHsrNlDgxHCklqv4D2okI8S2/KsOkOqY/fnu4io9rxXFQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XdygOAs5FxumhYfDqwwnYKE9gBUIv1gue0s6upyrf0=;
 b=e5kaYhXOaMN3tndxKuG2g8qkUelyIZOpvz6JWqie1mjunsUfe69Y4TCD7ASnvOwHATql2sDHVmY3PRz0iKuvisEwPy/zb5ELzIUlqlCEczoP1OoxUCkpOQdv8OXZ5rCTEwu7//sAQiiryCGQ6lGM9EeXbiP0NqB4H3dsXqTvPevWrcywCItv3o6ui6HpzYnoArJXanIzib1zVMp8+04+Dz5o4uiErJjeVyjSSuFaH3r7B/ZayBNlYnnA31Y10v5KIg5dV3RUM+4rAJps27x/8OA6ZPESIvOHDKwAF5ATADqUpY8MASlxhSaIif0a14WMmqHP0jE3zKCyE8JREiR/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS6PR11MB595933.namprd11.prod.outlook.com (2603:10b6:8:4c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:43:58 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 08:43:58 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 8/8] drm/i915/psr: Don't clip plane state destination
 rectangle
Thread-Topic: [PATCH 8/8] drm/i915/psr: Don't clip plane state destination
 rectangle
Thread-Index: AQHdT/c8ZEO+teqSkkaf469eQuQhULcIG9SAgAFHLoA=
Date: Thu, 22 Oct 2026 08:43:58 +0000
Message-ID: <56dc80b9e5a3c93b2eb872b06b5ab4ffb74c7bac.camel@intel.com>
References: <20260929094434.77129-1-jouni.hogander@intel.com>
 <20260929094434.77129-9-jouni.hogander@intel.com>
 <DS4PPF69154114F80BF31B75710934CC43FEF662@DS4PPF69154114F.namprd11.prod.outlook.com>
In-Reply-To: <DS4PPF69154114F80BF31B75710934CC43FEF662@DS4PPF69154114F.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS6PR11MB595933:EE_
x-ms-office365-filtering-correlation-id: d61c49e5-08d1-46a2-8507-08df30189d26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|10067099003|261021121427099003|22082099003|261021123027099003|4143699003|11063799006|56012099006|261009223027099003|38070700021;
x-microsoft-antispam-message-info: KawP0jn/+wewR1u7Y+8RoQDeuLPfqILc0EuGmeyN617Bo0m95PxTiNBIvsFMblK65GZkatB55e4VHUwvJHr5cvn7iNxQIFEWgav9nUbx4CI/gS0/zTtJSHZDf8LStsoWUy5El+/BDPJRlo4gVxWIUj2p+6glMaUkG6jxVC48Ni5tFjUgUh+hPtz359GWvNj/qYZU4HAIRIjlFP6DwOwbNI8SNeMsyf3UkgKrUulgf2le4jO2/+f0dSVtHkJIjtexae5+rSGz6BT2Rvg1cal2jGFSmXzlEf5PqehW+/cwOX+2AGvhvZM1x5E0xRWpBGdlkDvIdNEKD1ziIQLkdnGhw3haV7GrJzbRIYRBZh8189wchre2fBL1g/eq2+wqG7Zajh8WjXJgXnON21yds3/hg8ATyJPlV9U2FsH3/5P0y43arW27G3ABF7eDEORRt51jf0ToCOITyQhJFiJAUsAtXV2CMkp61uMsHUXvYB0NLaKlVjEDIj+ztpEGkYh0TaYm12hFXRDor9eL6+psG9T5ZIX35Adl/Qk8pD3sMg3jKxhqUfJGZm+h7RdSQuLso+BI01VrCbc0VzXGXLP+SlXKyq1KeAsn60KkPeoBFcw+QF2BJoVyAEdOjV6oNXm9IFtmugryTAeEsCqtCgpYfbKyPEPtMTvXPtiUlDkyPaaRqZikLEfr6TXuRpQoYqsORpXq1CNxs6PwIZmIA3SzJQiR/QYp8+bK2dPHJxn7Bj2Pefg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(10067099003)(261021121427099003)(22082099003)(261021123027099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUk5dEZ6WWNETWZtTUordFhCNXZxcjJIeHNKRFlCNTg4WHA0a0tKY096Ri96?=
 =?utf-8?B?VVlEWGVlNTU2RVR3ZjJwR01STzd0NnNJamxhQUVBYyt4SGo1L0RheTNkYjYz?=
 =?utf-8?B?SmRmYVdRZEpkYUlsQ3FBNWtBcFRRUlloMkE5dEo2Q2czbS9YbU1uVVU5MGc0?=
 =?utf-8?B?dkk2Yi8rL0pGYUJ6b1IrZDNJWEIwdmErcHZ5L01PUjRlTUlhd3V0b0UxMGM4?=
 =?utf-8?B?RG80aUsrTmppOXByVmlQTVR0aVgzNDZVRTBCSWhFQlUxRms1MHo1QnNWbE5Y?=
 =?utf-8?B?WDdidTdMTmZxTzBrL0hTWEdIa1VkVDcxc3FkK1A4TE9RRExGc1Vnd2szUGVk?=
 =?utf-8?B?Z0VMdDJKbm1GeEtKSWlpa0l0ODRxWERHWWpHdWNuQTM5L0hTRmhiclFrYnV4?=
 =?utf-8?B?Z3RsMHMxWEMxQmplTHpDOFdZd0UveTlQN3dnRENXTFdJaTVGTmRYY0ZOSm9J?=
 =?utf-8?B?cUlpajRBR3ptL1dMczA0clVPeG1RdE9PU3NqT1UrQmpORGF2Y2g1UUorSWdU?=
 =?utf-8?B?U0ZHeW44OE1aaUVVeDBwNjdiR1Q3N3g2UHJDc3JhNUxXR2VkMlByaUpzYkEw?=
 =?utf-8?B?ZmtlNm1sQUhESFpsZGxVVjN5cGpRcWdVd3c0eG04Y1VnN2RqQTAvZmRaWkJG?=
 =?utf-8?B?dVdoR25NREZPVS80enV5S3h6MzkxRWZPVVRINWt4bXhQaXZva0I4b0ZlNWJS?=
 =?utf-8?B?Rmp6S3NlNmxyNW9PR0Z5VHRHY1RjWHpZSTlWQnJlZUZPdFhrN1VFMkdnbjZQ?=
 =?utf-8?B?bHV6UCtSTkF4eWhYREJQZ3BjT2pBSG5xRVpxbmZSenVQNTh0VnpBTVNPa05E?=
 =?utf-8?B?aVBzNUVwNks0MWpxZjVlYytNOEF1Unk3bUQwUXlCTlY3bjFFMjRIZ2FCK2Vo?=
 =?utf-8?B?bEYwVHJtR2IrWldZeUIxMnAvYmQ3YXVMdFZxYnFzMUN1WGszMlF4bVRIdkdi?=
 =?utf-8?B?OG11NkQ5d3llNkpBbXJhUUxMamV0Tkp4UzdlUEN6MHc5QksySVRkNmcrTE45?=
 =?utf-8?B?RFpQZXdla25wSnZJTTlWMDZpYWVJdW01amh2MXp0QlBTVkZWRWtZVkNtOTZB?=
 =?utf-8?B?UHRhMlVWR2h3OU5OS0dNOXhQaVFHaURtK3YwRXdBYk8rbTJOVnl0ZlhyWVJk?=
 =?utf-8?B?RHdTSUpWKzdreE01aGdpY0J4WHk4QmdtUjZwY29TamYvVTJWZUVOTHA0a0VO?=
 =?utf-8?B?VzdFRDllc29PTjUzMFl5N3RjU2syb0VXRXR3VFlHTVRyWFJjcW9xOWRiNXRx?=
 =?utf-8?B?ZEVxbXUrWWZEVTdJNWJldkpXbVF2R3pMMEJwcHVWUkhuK0Zqc2E3eUw1Smwv?=
 =?utf-8?B?UVhveXMvaXlsK2xxd1A1bGFMWTlsaEtINk40Z0ZBTW9SOXl5SjZzSlh4ajZP?=
 =?utf-8?B?QWRYajVGekttRnNadEpXSTVUMmlzS3VacjRUSE9YdHhCU2tsUkRUNFVwRTJh?=
 =?utf-8?B?U1lpODFJbVVrbHRCRUU5UkJxUjNLdHVmMzlYRU5IaEYya1BwU1k5N3ZRZ1hk?=
 =?utf-8?B?NjF3dzY3bDFjQjVoSG5UV2ZaZlovWGxHdENHUG9ZRHFEMVFFc2pXOUtYMU0y?=
 =?utf-8?B?V3Zla2FqUytVdk5LV1RqRWs1VzhXV0ZsSXBZdm1KSENqL2lvZUlJYUJzZzJY?=
 =?utf-8?B?WnVMbC9NZVB1eDJ3K3VjR0hOcUg5amQrQUJKZFFTKzJXd21KaFpFZ2k0L2Zx?=
 =?utf-8?B?aWM2K2ducXhSSmNLZm1Pek5pdnFEdW9UNzZUdEwzN0dpS1BuNVVRTUljanF5?=
 =?utf-8?B?ajZHZTdTL2x2MW04SDU0aUVhcXA3MFV0eTJxcUFTcUY2RHlvK3JBRlRNbWZt?=
 =?utf-8?B?cFE3aDl0cW1RaWU2V2IxTGJ1UmUrVWw3b1dZVUFZK3FmQ0NSSDhRUDc4ejE2?=
 =?utf-8?B?RSt5M3ZyQzdIU0tXay9FbTVxTjl3MGhvdEdmZW1zTC8xNnd5VGlNZHJNSDdL?=
 =?utf-8?B?WEI1c1dQN2pmamYvanFQQ1JCTWZ1TVJxbEx1MlJYMlpUc3U5aVk4bnRHYzJ4?=
 =?utf-8?B?T1dmRUdQUHhYOVRveU9Ya0c3T3FCN1BOWnIwaFFkdmpkTVhydEMyYStUSDZl?=
 =?utf-8?B?TGVNcklNNlhUeVA0ak5aemdkOXRhYmRkTytnOGVhOGpNVStvSWIyZnB6THJC?=
 =?utf-8?B?QlVGWThEOEJSV0hrSGNGT2UzZDY0RlY0Z3JuazZYYm80VldHUDN6bXhlN1Yw?=
 =?utf-8?B?NVEycFUzeWFpaTRXWEhoNGtIYjZkc1lnUFpEYm5rbzFSMWc1VjlCanNFSEh6?=
 =?utf-8?B?UFJtZXp0NjNaZDVESFhHMFNzT2VHWi9NMEhrUUJiU1RpQ1BSeWFRSUNmT0g2?=
 =?utf-8?B?VjhML1Y2TzIrOHIzaGZKTG9QRzlOcVF6UzJGU2did1hRYWRYaW01MU0vZWxl?=
 =?utf-8?Q?za7OQHCzEuukXMVU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <862246D64A93554F8EAF8AC4DE14128A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aGn41HuwLxJidcW8TQtjgx+dhSQKYni8i1WV533S+fKgJLLIehDJvdAz8lDJ606CkHbjaWx62g7bL7I3H3jeBhQCcsiGBtOOzazXhnVEVNzTpYSk2otVrk84sGJjYabUhDCDQaDZxw8M5W4OGEvgHnMIVoP2d6h98GNu8cCo9xP93f7AnY2GjoDLDafDuq69KkOhvUpE5hfZxo1Dazj2+hfe6cdWXWroU0InZc3VcnsDTKKgZEAs3ilUraD1IDMJURyE4US7eOpyAudTcauFM6vlETlRez5INvfBzVfrfUyFasrt+KJTVJEZhbnW9P2BicejWpi2N2Rm/tSKrIy1qg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61c49e5-08d1-46a2-8507-08df30189d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 08:43:58.3582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRf09pGyj7PsotBYWZifiZIdFVyOXaJM6ujQ8YeWtyVAidKRDCLy53xf7O8hVVUzxEx2UOm71iuLgu5DO3CbgM9se5yfXI3Ub7dMuPyRFs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB595933
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyMDI2LTEwLTIxIGF0IDEzOjEyICswMDAwLCBLYWhvbGEsIE1pa2Egd3JvdGU6DQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBJbnRlbC1nZnggPGludGVs
LWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+ID4gT2YgSm91
bmkgSMO2Z2FuZGVyDQo+ID4gU2VudDogVHVlc2RheSwgMjkgU2VwdGVtYmVyIDIwMjYgMTIuNDUN
Cj4gPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPjsNCj4gPiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gU3ViamVjdDogW1BB
VENIIDgvOF0gZHJtL2k5MTUvcHNyOiBEb24ndCBjbGlwIHBsYW5lIHN0YXRlDQo+ID4gZGVzdGlu
YXRpb24gcmVjdGFuZ2xlDQo+ID4gDQo+ID4gY2xpcF9hcmVhX3VwZGF0ZSgpIHVzZXMgZHJtX3Jl
Y3RfaW50ZXJzZWN0IHdoaWNoIG1vZGlmaWVzIHBhc3NlZCByMQ0KPiA+IHJlY3RhbmdsZS4gRWFy
bHkgdHJhbnNwb3J0IGFsaWdubWVudCBwYXNzZXMgdGhlIGN1cnNvciB1YXBpLmRzdA0KPiA+IHJl
Y3RhbmdsZQ0KPiA+IHRvIGNsaXBfYXJlYV91cGRhdGUsIHNvIHRoZSBjdXJzb3IgdWFwaS5kc3Qg
aXMgdW5pbnRlbnRpb25hbGx5DQo+ID4gbW9kaWZpZWQgYnkNCj4gPiBkcm1fcmVjdF9pbnRlcnNl
Y3QuDQo+ID4gDQo+ID4gRml4IHRoaXMgYnkgdXNpbmcgbG9jYWwgY29weSBpbiBjbGlwX2FyZWFf
dXBkYXRlKCkuIEFsc28gbWFrZSB0aGUNCj4gPiBkYW1hZ2UNCj4gPiBhbmQgdGhlIGRpc3BsYXkg
YXJlYSBjb25zdC4NCj4gPiANCj4gPiBGaXhlczogMWJmZjkzYjhiYzI3ICgiZHJtL2k5MTUvcHNy
OiBFeHRlbmQgU1UgYXJlYSB0byBjb3ZlciBjdXJzb3INCj4gPiBmdWxseSBpZiBuZWVkZWQiKQ0K
PiA+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2Ni45Kw0KPiA+IEFzc2lzdGVkLWJ5
OiBHaXRIdWItQ29waWxvdDpjbGF1ZGUtb3B1cy01DQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkg
SMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTog
TWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCg0KVGhhbmsgeW91IE1pa2EgZm9y
IHJldmlld2luZyBteSBzZXQuIFRoaXMgaXMgbm93IHB1c2hlZCB0byBkcm0taW50ZWwtDQpuZXh0
Lg0KDQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KPiANCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAyMCArKysrKysrKysrKy0tLS0tLS0tLQ0K
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
cHNyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4g
PiBpbmRleCBkOGZlZmIxM2MyNzkwLi45OTYwM2E0ODZjMjc4IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gQEAgLTI3MDksMjMgKzI3MDks
MjUgQEAgc3RhdGljIHUzMg0KPiA+IHBzcjJfcGlwZV9zcmNzel9lYXJseV90cHRfY2FsYyhzdHJ1
Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4gPiDCoH0NCj4gPiANCj4gPiDCoHN0
YXRpYyB2b2lkIGNsaXBfYXJlYV91cGRhdGUoc3RydWN0IGRybV9yZWN0ICpvdmVybGFwX2RhbWFn
ZV9hcmVhLA0KPiA+IC0JCQnCoMKgwqDCoCBzdHJ1Y3QgZHJtX3JlY3QgKmRhbWFnZV9hcmVhLA0K
PiA+IC0JCQnCoMKgwqDCoCBzdHJ1Y3QgZHJtX3JlY3QgKmRpc3BsYXlfYXJlYSkNCj4gPiArCQkJ
wqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpkYW1hZ2VfYXJlYSwNCj4gPiArCQkJwqDC
oMKgwqAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpkaXNwbGF5X2FyZWEpDQo+ID4gwqB7DQo+ID4g
LQlpZiAoIWRybV9yZWN0X2ludGVyc2VjdChkYW1hZ2VfYXJlYSwgZGlzcGxheV9hcmVhKSkNCj4g
PiArCXN0cnVjdCBkcm1fcmVjdCBpbnRlciA9ICpkYW1hZ2VfYXJlYTsNCj4gPiArDQo+ID4gKwlp
ZiAoIWRybV9yZWN0X2ludGVyc2VjdCgmaW50ZXIsIGRpc3BsYXlfYXJlYSkpDQo+ID4gwqAJCXJl
dHVybjsNCj4gPiANCj4gPiDCoAlpZiAob3ZlcmxhcF9kYW1hZ2VfYXJlYS0+eTEgPT0gLTEpIHsN
Cj4gPiAtCQlvdmVybGFwX2RhbWFnZV9hcmVhLT55MSA9IGRhbWFnZV9hcmVhLT55MTsNCj4gPiAt
CQlvdmVybGFwX2RhbWFnZV9hcmVhLT55MiA9IGRhbWFnZV9hcmVhLT55MjsNCj4gPiArCQlvdmVy
bGFwX2RhbWFnZV9hcmVhLT55MSA9IGludGVyLnkxOw0KPiA+ICsJCW92ZXJsYXBfZGFtYWdlX2Fy
ZWEtPnkyID0gaW50ZXIueTI7DQo+ID4gwqAJCXJldHVybjsNCj4gPiDCoAl9DQo+ID4gDQo+ID4g
LQlpZiAoZGFtYWdlX2FyZWEtPnkxIDwgb3ZlcmxhcF9kYW1hZ2VfYXJlYS0+eTEpDQo+ID4gLQkJ
b3ZlcmxhcF9kYW1hZ2VfYXJlYS0+eTEgPSBkYW1hZ2VfYXJlYS0+eTE7DQo+ID4gKwlpZiAoaW50
ZXIueTEgPCBvdmVybGFwX2RhbWFnZV9hcmVhLT55MSkNCj4gPiArCQlvdmVybGFwX2RhbWFnZV9h
cmVhLT55MSA9IGludGVyLnkxOw0KPiA+IA0KPiA+IC0JaWYgKGRhbWFnZV9hcmVhLT55MiA+IG92
ZXJsYXBfZGFtYWdlX2FyZWEtPnkyKQ0KPiA+IC0JCW92ZXJsYXBfZGFtYWdlX2FyZWEtPnkyID0g
ZGFtYWdlX2FyZWEtPnkyOw0KPiA+ICsJaWYgKGludGVyLnkyID4gb3ZlcmxhcF9kYW1hZ2VfYXJl
YS0+eTIpDQo+ID4gKwkJb3ZlcmxhcF9kYW1hZ2VfYXJlYS0+eTIgPSBpbnRlci55MjsNCj4gPiDC
oH0NCj4gPiANCj4gPiDCoHN0YXRpYyBib29sIGludGVsX3BzcjJfc2VsX2ZldGNoX3BpcGVfYWxp
Z25tZW50KHN0cnVjdA0KPiA+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ID4gLS0N
Cj4gPiAyLjQzLjANCj4gDQoNCg==
