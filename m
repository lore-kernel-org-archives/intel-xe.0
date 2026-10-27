Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2F606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUjhqsJG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D221610F608;
	Tue, 27 Oct 2026 14:50:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078FD10F609;
 Tue, 27 Oct 2026 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793112640; x=1824648640;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TmRZD6hlHFp575qjvtN9hJwcsnnH3n4qn5FN7N3xeKI=;
 b=hUjhqsJGT8oYHvgOHdMQDoMVUSxUXY9vQD8lSQSAWDZLkp61EGxQcGUT
 HX1VC7t4S0aRk73jU175gXpCebL9WrHOOaXJ+HpVAY50ClEjYTOoRZClZ
 Xe69EDeoD5ZJQ3Uj8m/01G4ySNdkq46rXnS8BQJjbaclp1l65005uDO4W
 I4AoPmWFBgQk6iBE0D6XOmvzIJ9DNUD2nwWQJxpslPZSkPzXnHn0Ez1pq
 IribJ8/fqqe3vwsU2N/UUf++MwdtLoYovIfZMnMfV2NrGqaUPqD4OfZCS
 5VPxkIpQsZjEkGpbGEDPPALq6gBg/yRnD/yxRaZWdsKGt83UbrmnATQxe w==;
X-CSE-ConnectionGUID: xzSu2asaRaOQ8B+8on3+Uw==
X-CSE-MsgGUID: QtQgOTVIQl6uGTxP0TjPQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1703051"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1703051"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:50:39 -0700
X-CSE-ConnectionGUID: Yz7m+BnTR+O5eGsQ6Hg73Q==
X-CSE-MsgGUID: o62OQOYjTUaDX3/ACjJ40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6319332"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 07:50:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:50:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 07:50:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 07:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPbXiFKvp0HFG5y2/UikviEdBJC/yF/cBglgYEyptNwU/39elj2BGnmHIVjDSEja8qWYp/HCHd+vQaAxHtIg6bxNSfjW2ubONajBh8f5lQRsC1jtEvTlVboIBNGOTaxeG731+uBz0pWuaJIAyIRKmOW16tk6EMriu8+TTTAUsK1avIJ5bbLj+yRPyqQcoIA8M7N5T7dYAJ6ToemQB739a755zdEqpcO8Z4cg8OMqKL9thR/1ihBG7ux7lIZ774oP/RT2YgZezZkM3niXkpOnK6qkU2+ATvgmtoYbKSWcY2iNFqGdDuF5wrIh9sHhlBy67t8cPHuLNa+eugrdSF+TIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmRZD6hlHFp575qjvtN9hJwcsnnH3n4qn5FN7N3xeKI=;
 b=t6VakG4g2g0kQpdE+BLwxozlQdETv8BnD/y52x6Yjqy1vkvwpdd7QgclqtCI9ygHouUJTAbAVDxBO3L5F5qTjal26CKQIMDmXc/j+ooilqTK0UUuxQVULsyA9nRjYr93ilAj/RhrXZLePYHZKmpIKwZ3dGX6C67q7a79QbOa3SXsSNebT/siBmFRFNj/SNmkUoWz4GoAcTAJ+n4tHFpwiDti9fIM00w5KrldszAkc4wMCl5zGLAccqTNDkDPNEnT0YhnDRkmcTT0ZoanzjmxBSXDZBEudHPQalyyeyBG3MFn01cpi0JSCdA3c1tt9dtoHvO6fCmEUZoAOlvLzVpRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 by IA4PR11MB9372.namprd11.prod.outlook.com (2603:10b6:208:568::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:50:37 +0000
Received: from SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e]) by SJ0PR11MB5039.namprd11.prod.outlook.com
 ([fe80::d9f2:247d:ca72:fc1e%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:50:36 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 =?utf-8?B?UG9sby1GcmFuw6dvaXMgUG9saQ==?= <polo.code.dev@gmail.com>
Subject: RE: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with
 SKU-max, not zero
Thread-Topic: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with
 SKU-max, not zero
Thread-Index: AQHdI/PPUs3/1za0SUinRpU/FCLTULcR9+eAgAAFHfA=
Date: Tue, 27 Oct 2026 14:50:35 +0000
Message-ID: <SJ0PR11MB5039C01C4E43B048F136BBE6BA602@SJ0PR11MB5039.namprd11.prod.outlook.com>
References: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
 <20260804-cdclk-v1-1-484864b1aafd@intel.com>
 <c28c27da-ccc4-454c-8c3b-e34808fccf97@lankhorst.se>
In-Reply-To: <c28c27da-ccc4-454c-8c3b-e34808fccf97@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5039:EE_|IA4PR11MB9372:EE_
x-ms-office365-filtering-correlation-id: 99d9e0ef-ecb5-4f31-c17e-08df3439a8d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|23010399003|261026140227099003|38070700021|260925021311599003|260925021911599003|260925022911599003|4143699003|11063799006|10067099003|56012099006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|18002099003|261026121527099003|22082099003|6133799003;
x-microsoft-antispam-message-info: NLY7fdV68eYPPN67LoxDnVz6esPhIl14+sba3BYDZ8uU0fJRTAgfx+cnQjZdejQadwqLVrsFvgp8qoP/tOoWRVoHqkC2swRwegW579awPcmkjck0O7FTN0vWji3JMC19uuVrAe8xPXs2U/HXPHcYouOLcAqXlGjV3ib/ssm7SPCjtF56iw8F+kmpn+oVAX8AbwKe8MXcZXIpOukfUnlRh9SOjbcWgkQ/VH1KK1sMcZhbiObUV5y1V9rhyfHOl7gmm8/SII1p4mNiS1FqJ4rgJQSu5oJ2BwpPQI1k+SIlAS0ob9QNTviu2ZmwtoZh128Km+8535YCO5a58MuAwwrodjQvlrHIRe0fO+XLK8cS9lakeZF4Eb61Vmaqsr6IAgSoXjkkd3OgxhyZ1t/ORJIBmm3HEe17ya3A4m7m9IQ2Tf9A2KT8Jg2UxHyH933JWrsyZL8VNj0q5PL8llvbYhNW75voitG3W412shkqQnx95kyh/LLThg+5hFqdqCvLI6w7C1FqXm3JVGmOads9NWPzL4jQfTsjSeYK39Ji7Cxb18fYm+dMXNZlSzi/l5lK8s5CwcDzyLvHAnEsOwojOPuptBVlNe274kPY682ek2e4ndZlE54Ji3RskxfN4ts/t51NUZH+uHJ4zmC61hNnpOq8ybBQg3uDEi7XKhLfaAZh4PY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(261026140227099003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003)(4143699003)(11063799006)(10067099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(18002099003)(261026121527099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGRNdWRjeldJYXk3TmNGTTBLeTgwWDAwR2ZPTXhNdFNLSTlyM0plbWgzZDVj?=
 =?utf-8?B?NU5aR3kxVDJmdWdXcUkrWVVBc2syWE9Fby9XaTdaeWlSMlZGNFE5bFByY1hz?=
 =?utf-8?B?V2hWRDJIejd4MkduUkFJUnNxMjhaeGFLTE5YMVdtVEQzN0taT09sTnlhTGlq?=
 =?utf-8?B?emxJcU11Z016OXFlOWIzL0g2RlBBU0ZJalZLVXZucDRGMzFjV1NrTDhiVjRm?=
 =?utf-8?B?MUt2RmtaWGJZYUh6dzZId0g1aGFIenl2aC9zMjdYSkZ5ZmFWdGtLaXIvQ2pI?=
 =?utf-8?B?eG1acStxcDBNOVBrVG9MWW1JK29kVWVLVXhieHJqZmVqVHRzbDZDMDV0UlZZ?=
 =?utf-8?B?a1V0b1MyUVBOc0VrdmF5dG9NTE1jUVY3a24zZk1wb2NkT0pMcGFSWUZqQnc0?=
 =?utf-8?B?YWlJb1QzY2ZhUmF0VnRLcjhqeTdBMzZZRFMwb3p6TGVabE9yTUFaeWNFdWNy?=
 =?utf-8?B?eWtkclVRYmduUmZqbEM5QmpMN3BGeWhncUI5TkJ1MkFWMG1TT0Nhc1BwdjdC?=
 =?utf-8?B?aGxxeVBsMWV1b3VIQ2dPRnpmRlhEaWI1MlpJRWRwVHNLam92RzQ0MGNhUldK?=
 =?utf-8?B?NG1VaW5ZTy9senNZbzFrQmZlc0paWmtDSU90aFZsLzh3QUhBdFVkczViTk9l?=
 =?utf-8?B?OExHalBRK0RvQ3FFN3JVRWM0bGJOeVhYQWRFR2lGUG1uMGdRbFVBNW43Nm1E?=
 =?utf-8?B?N2dmdGlMMUVKN2trWmdwSGFoblk2akthTDZ2Mk5NNlVabVluQnBtZ0J6TnVD?=
 =?utf-8?B?NnNlRWVacXBPK0QxTTRBbTQ3S2V3eFd5dHJBUVpuNmM4b0xxZ20rRkZXVTJL?=
 =?utf-8?B?aE5PcHAydmo5RWQvYmZjMlU5RG1wanU5SWt5a2k0NE96eGVTMkd3YUVBRkEv?=
 =?utf-8?B?QjFpei9hT0FvWjdubi9Xc0ZmRDVOMlBxSHZoSkVRMlB5VDAxSFZjdktlQ1ZV?=
 =?utf-8?B?THVQU1k4TC94OWZIZVdBUGVIcTFMTGxpd0dUdUlFeXowOW94cHhlQVRnazFq?=
 =?utf-8?B?NWZheFNSKzJCOTlrczJLKzFmR1NrZGJjSVZrenBvZDloQ0xjUWdKWCtSMzF2?=
 =?utf-8?B?bTN4M3VxVWpwNjhxSWZZeXB0ZlRPTHNrc2hWbnJFbjRMdHNDOXRVYlZkNEtx?=
 =?utf-8?B?NCtNcWhYS1Y0WEtSdkpmQWNVamhaRG9lSDYzTDJzMTdoZmkxQXNZY3JBR2JX?=
 =?utf-8?B?cUtiQ2ZZaEN3eHdPcDdMWXZOVHVzbTJSQkhPUlVNMWoveFBibVlOYXF1ZXUr?=
 =?utf-8?B?S2VndklCUHNTR3M4Y2hRRXV3U2FMUFMza1IyOG9MMXJGTU1XVzFwaDdyaGZj?=
 =?utf-8?B?QnAwNjc4aGJGQU4vSnRBS2FTcUlBL0s3dE1oNnV2Zzljb1phSGtWWTZaU3BV?=
 =?utf-8?B?RTN6dzk1RTdsSzNhcFFWNHdmWGtJNXlDQy9tZWFZMjNCTk1FRjV6U09rRDQ5?=
 =?utf-8?B?WENpM084djBSOGF2ZU5COGU1WEFNQnBCTkM3Z1NrQWJmdlBKRzQwV2dMZWlD?=
 =?utf-8?B?bkRvR20vRFFReElIeWtlNUE0Z2N4ZFVnUUVMbnJxUGxzdjN2SlpoY1ozajNL?=
 =?utf-8?B?dU5SeS8yY2xMMTgwZytkYkFDUGpqaURGRlR2SUlaR0lZOFA4ZVRScjZYTEZp?=
 =?utf-8?B?b29UWUdHZ2poWGNyQ21CTDVRZENQMExrOHFWRFJxRlh5ZzRlaEhBd2tFeFAw?=
 =?utf-8?B?VnFQd0xoSmZIcGlSWks3cUM0Y1VqOFdtbmVZODQ2cjZnc0NQODV4eW44bTBV?=
 =?utf-8?B?MU40QWgxOGcrV3FIdVBCakRnN0Q1WHBlZGR5MEtwV0hJV2I0cUo1VXhGaHdh?=
 =?utf-8?B?VTVScWxlZ0Z1UXFiTjVtamRUb1FLNDVxSmNiK2pQSzdBbmowemwvRXdmeGlF?=
 =?utf-8?B?RDhWSkVHRjAxNGMxbS9iVE9lODVYYnNPRS9paFZpNE5HZVhRNmRyWnM0UFha?=
 =?utf-8?B?aGl4Ujk3L0lPelRRT0tDRGw0OWcrWXhIcXRtOE9MWktOYUk3UTBWOUhlVnRh?=
 =?utf-8?B?aVpyY3F6SVVSUEVsK2RTZXNsUEtySGwyMVMxaFZrTTEwVGFPdXBHVkN6cXRi?=
 =?utf-8?B?Y0hxcXZTUUE2d0pFRTBEa2FJWTB6b2NVcVhZSURxT2ZnNFpCT1dIdUdyZ0tS?=
 =?utf-8?B?ZEpBSEpQUTN1MmhIQ3R1c014ci9PVjk2Y0JENmJGSDgxQnFpTkxhcC94c3Mw?=
 =?utf-8?B?VW9mSDJlVFJnaVFEL3hlMlR3dkJ1SVRDcSt0NkNEdFhCbEQ3bktOZzh1L2pW?=
 =?utf-8?B?K3BLclRobmlCd3dXa1czYXRiYS9LV25qVElKcVE3a0xLdFc5VHFFSWNDTnJR?=
 =?utf-8?B?cVdHdHVVMTVUMk9jdStFK3ZxcWg2VFRlbUVFOXp4MHpkS0hLYyt2SUtXOXhh?=
 =?utf-8?Q?DFe19EIIfXpJptQgCLV3h3B1CLjmEj0YW7xxPTaDC0Vk7?=
x-ms-exchange-antispam-messagedata-1: jjMPwH0E8t4aHw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bT+Cjm/wf5Qm+lOoihgnL27bj8kE2OnGzPztXiY7TnEG75KKJuNh2pUbDuSqwksv09wm59+zzWoYGCHZsEarVywIsdTmzZDoFdTePR5V/nUTyYOSLXfY6awcVBb5Ea3kX1d9gqHc+2LlFusJ7qtnTLfr4F34x49K5wtoAZpuGMiHyt1wdY14T/NGorfEHb1uiwbsF6TjVfmE3ci0NGr6Jl5rFMwayhnwSB3P1gvo6S9u9h8McC4yGT+X7uXa54dU/2I2UapSuvIFLVtO7/vPr2JhWjVakyGyInd/lcEpIrQZMAVns96d03A8EMODTe+3UjT4Lxuw4kY1GTbJlaDqpQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d9e0ef-ecb5-4f31-c17e-08df3439a8d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 14:50:36.0093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZvxrF+rNJl1llgozvT30m9zdrGicZrr8nMisVMGlWRkfXzTgfPMtS47QhdEpXF0nOqVGOaiusTcSfN8uOKvCow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9372
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hYXJ0ZW4gTGFua2hvcnN0
IDxkZXZAbGFua2hvcnN0LnNlPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI3LCAyMDI2IDg6
MDIgUE0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47
IFBvbG8tRnJhbsOnb2lzIFBvbGkNCj4gPHBvbG8uY29kZS5kZXZAZ21haWwuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDEvMl0gZHJtL2k5MTUvZGlzcGxheTogU2VlZCBza2xfY2RjbGtfaW5p
dF9odygpIHdpdGggU0tVLQ0KPiBtYXgsIG5vdCB6ZXJvDQo+IA0KPiANCj4gDQo+IE9uIDgvNC8y
NiAxMToyOCwgQXJ1biBSIE11cnRoeSB3cm90ZToNCj4gPiBza2xfY2RjbGtfaW5pdF9odygpIGhh
cyBhIHJlY292ZXJ5IHBhdGggdGhhdCBydW5zIHdoZW4NCj4gPiBza2xfc2FuaXRpemVfY2RjbGso
KSBoYXMgZGVjaWRlZCB0aGUgcHJlLU9TIENEQ0xLIHN0YXRlIGlzIG5vdCB1c2FibGUNCj4gPiBh
bmQgemVyb2VzDQo+ID4gZGlzcGxheS0+Y2RjbGsuaHcuDQo+ID4NCj4gPiBTZWVkIHdpdGggdGhl
IFNLVS1wZXJtaXR0ZWQgbWF4aW11bSBpbnN0ZWFkIChhcyByZWFkIGZyb20gU0tMX0RGU00pLA0K
PiA+IHNvIHRoZSByZWNvdmVyeSBwYXRoIGxhbmRzIG9uIGEgY2RjbGsgdGhhdCBzYXRpc2ZpZXMg
ZXZlcnkgcGlwZSBvbiB0aGUgU0tVLg0KPiA+IFRoZSB2ZXJ5IGZpcnN0IGF0b21pYyBjb21taXQg
dGhhdCBmb2xsb3dzIHdpbGwgZGlhbCBjZGNsayBkb3duIHRvIHdoYXQNCj4gPiBhY3RpdmUgcGlw
ZXMgYWN0dWFsbHkgbmVlZCB2aWEgdGhlIG5vcm1hbCBza2xfbW9kZXNldF9jYWxjX2NkY2xrKCkg
cGF0aC4NCj4gPg0KPiA+IENsb3NlczoNCj4gPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZHJtL2k5MTUva2VybmVsLy0vd29ya19pdGVtcy8xNjU5NQ0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IFRlc3RlZC1ieTog
UG9sby1GcmFuw6dvaXMgUG9saSA8cG9sby5jb2RlLmRldkBnbWFpbC5jb20+DQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYyB8IDY1DQo+ID4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2NCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2NkY2xrLmMNCj4gPiBpbmRleA0KPiA+DQo+IGE1M2Q4ODcy
NzE3NzgxOTNmZDQwMGI5MTk5YWQ4NDFkNWQ5NzMwZmUuLjE5ZjNlZjhhZGZjZGVkMzc4NDI4OTI0
NQ0KPiAzOWRiDQo+ID4gOTMzNjgzNDI3OGVhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYw0KPiA+IEBAIC0xMjg4LDYgKzEyODgsMzEgQEAg
c3RhdGljIHZvaWQgc2tsX3Nhbml0aXplX2NkY2xrKHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ICpk
aXNwbGF5KQ0KPiA+ICAJZGlzcGxheS0+Y2RjbGsuaHcudmNvID0gfjA7DQo+ID4gIH0NCj4gPg0K
PiA+ICsvKg0KPiA+ICsgKiBTZWVkIGNkY2xrIGZyb20gdGhlIFNLVS1wZXJtaXR0ZWQgbWF4aW11
bS4gVXNlZCBieQ0KPiA+ICtza2xfY2RjbGtfaW5pdF9odygpJ3MNCj4gPiArICogcmVjb3Zlcnkg
cGF0aCB3aGVuIHNrbF9zYW5pdGl6ZV9jZGNsaygpIGhhcyBkZWNpZGVkIHRoZSBwcmUtT1MNCj4g
PiArQ0RDTEsgc3RhdGUNCj4gPiArICogaXMgbm90IHVzYWJsZSBhbmQgaGFzIHplcm9lZCBkaXNw
bGF5LT5jZGNsay5ody4NCj4gPiArICogU2VlZCB3aXRoIHRoZSBTS1UgdG9wIGluc3RlYWQ6IGl0
IGlzIGd1YXJhbnRlZWQgdG8gc2F0aXNmeSBldmVyeQ0KPiA+ICtwaXBlIG9uDQo+ID4gKyAqIHRo
ZSBwbGF0Zm9ybSwgYW5kIHRoZSB2ZXJ5IGZpcnN0IGF0b21pYyBjb21taXQgd2lsbCBkaWFsIGNk
Y2xrDQo+ID4gK2Rvd24gdmlhDQo+ID4gKyAqIHNrbF9tb2Rlc2V0X2NhbGNfY2RjbGsoKSBvbmNl
IHBlci1waXBlIG1pbl9jZGNsayBpcyBrbm93bi4NCj4gPiArICovDQo+ID4gK3N0YXRpYyBpbnQg
c2tsX2NkY2xrX2luaXRfaHdfc2VlZChzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSwgaW50
DQo+ID4gK3Zjbykgew0KPiA+ICsJdTMyIGxpbWl0ID0gaW50ZWxfZGVfcmVhZChkaXNwbGF5LCBT
S0xfREZTTSkgJg0KPiBTS0xfREZTTV9DRENMS19MSU1JVF9NQVNLOw0KPiA+ICsJaW50IG1heF9j
ZGNsazsNCj4gPiArDQo+ID4gKwlpZiAobGltaXQgPT0gU0tMX0RGU01fQ0RDTEtfTElNSVRfNjc1
KQ0KPiA+ICsJCW1heF9jZGNsayA9IDYxNzE0MzsNCj4gPiArCWVsc2UgaWYgKGxpbWl0ID09IFNL
TF9ERlNNX0NEQ0xLX0xJTUlUXzU0MCkNCj4gPiArCQltYXhfY2RjbGsgPSA1NDAwMDA7DQo+ID4g
KwllbHNlIGlmIChsaW1pdCA9PSBTS0xfREZTTV9DRENMS19MSU1JVF80NTApDQo+ID4gKwkJbWF4
X2NkY2xrID0gNDMyMDAwOw0KPiA+ICsJZWxzZQ0KPiA+ICsJCW1heF9jZGNsayA9IDMwODU3MTsN
Cj4gPiArDQo+ID4gKwlyZXR1cm4gc2tsX2NhbGNfY2RjbGsobWF4X2NkY2xrLCB2Y28pOyB9DQo+
ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCBza2xfY2RjbGtfaW5pdF9odyhzdHJ1Y3QgaW50ZWxfZGlz
cGxheSAqZGlzcGxheSkgIHsNCj4gPiAgCXN0cnVjdCBpbnRlbF9jZGNsa19jb25maWcgY2RjbGtf
Y29uZmlnOyBAQCAtMTMxMSw5ICsxMzM2LDE0IEBADQo+ID4gc3RhdGljIHZvaWQgc2tsX2NkY2xr
X2luaXRfaHcoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+ID4gIAljZGNsa19jb25m
aWcudmNvID0gZGlzcGxheS0+Y2RjbGsuc2tsX3ByZWZlcnJlZF92Y29fZnJlcTsNCj4gPiAgCWlm
IChjZGNsa19jb25maWcudmNvID09IDApDQo+ID4gIAkJY2RjbGtfY29uZmlnLnZjbyA9IDgxMDAw
MDA7DQo+ID4gLQljZGNsa19jb25maWcuY2RjbGsgPSBza2xfY2FsY19jZGNsaygwLCBjZGNsa19j
b25maWcudmNvKTsNCj4gPiArDQo+ID4gKwljZGNsa19jb25maWcuY2RjbGsgPSBza2xfY2RjbGtf
aW5pdF9od19zZWVkKGRpc3BsYXksDQo+ID4gK2NkY2xrX2NvbmZpZy52Y28pOw0KPiA+ICAJY2Rj
bGtfY29uZmlnLnZvbHRhZ2VfbGV2ZWwgPQ0KPiA+IHNrbF9jYWxjX3ZvbHRhZ2VfbGV2ZWwoY2Rj
bGtfY29uZmlnLmNkY2xrKTsNCj4gPg0KPiA+ICsJZHJtX2RiZ19rbXMoZGlzcGxheS0+ZHJtLA0K
PiA+ICsJCSAgICAiY2RjbGs6IGluaXQgc2VlZCBjZGNsaz0lZCB2Y289JWQgdm9sdD0lZCAoU0tV
LW1heCwgbm8NCj4gcGVyLXBpcGUgbWluX2NkY2xrIHlldClcbiIsDQo+ID4gKwkJICAgIGNkY2xr
X2NvbmZpZy5jZGNsaywgY2RjbGtfY29uZmlnLnZjbywNCj4gPiArY2RjbGtfY29uZmlnLnZvbHRh
Z2VfbGV2ZWwpOw0KPiA+ICsNCj4gPiAgCXNrbF9zZXRfY2RjbGsoZGlzcGxheSwgJmNkY2xrX2Nv
bmZpZywgSU5WQUxJRF9QSVBFKTsgIH0NCj4gPg0KPiA+IEBAIC00MjMxLDYgKzQyNjEsMzkgQEAg
dm9pZCBpbnRlbF9jZGNsa19yZWFkX2h3KHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ICpkaXNwbGF5
KQ0KPiA+ICAJY2RjbGtfc3RhdGUtPmxvZ2ljYWwgPSBkaXNwbGF5LT5jZGNsay5odzsgIH0NCj4g
Pg0KPiA+ICsvKioNCj4gPiArICogaW50ZWxfY2RjbGtfc3luY19od19zdGF0ZSAtIEFkb3B0IHRo
ZSBIVy1hc3NlcnRlZCBjZGNsayBpbnRvIFNXIHN0YXRlLg0KPiA+ICsgKiBAZGlzcGxheTogZGlz
cGxheSBpbnN0YW5jZQ0KPiA+ICsgKiBAaHdfY29uZmlnOiB0aGUgY2RjbGsgY29uZmlndXJhdGlv
biBhcyBjdXJyZW50bHkgcmVhZCBiYWNrIGZyb20gSFcNCj4gPiArICoNCj4gPiArICogVGhpcyBo
ZWxwZXIgcmVjb25jaWxlcyB0aGUgU1cgc3RhdGUgdG8gbWF0Y2ggd2hhdCBIVyBpcyBjdXJyZW50
bHkNCj4gYXNzZXJ0aW5nLg0KPiA+ICsgKiBJdCB1cGRhdGVzIGRpc3BsYXktPmNkY2xrLmh3IGFu
ZCB0aGUgY29tbWl0dGVkIGNkY2xrX3N0YXRlJ3MNCj4gPiArYWN0dWFsL2xvZ2ljYWwNCj4gPiAr
ICogc28gdGhhdCBhbnkgZm9sbG93aW5nIGF0b21pYyBjb21taXQgc2VlcyBhIHRydXRoZnVsIGJh
c2VsaW5lIGFuZA0KPiA+ICt3aWxsDQo+ID4gKyAqIG5hdHVyYWxseSBhdHRhY2ggYSBjZGNsa19z
dGF0ZSAodmlhIGludGVsX2NkY2xrX2F0b21pY19jaGVjaygpKSB0bw0KPiA+ICtyYWlzZQ0KPiA+
ICsgKiBjZGNsayB3aGVuIHRoZSB3b3JrbG9hZCBkZW1hbmRzIGl0Lg0KPiA+ICsgKi8NCj4gPiAr
dm9pZCBpbnRlbF9jZGNsa19zeW5jX2h3X3N0YXRlKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNw
bGF5LA0KPiA+ICsJCQkgICAgICAgY29uc3Qgc3RydWN0IGludGVsX2NkY2xrX2NvbmZpZyAqaHdf
Y29uZmlnKQ0KPiBZb3UncmUgZGVmaW5pbmcgdGhlIGZ1bmN0aW9uIGhlcmUsIGJ1dCB1c2luZyBp
dCBpbiBwYXRjaCAyLg0KPiANCj4gQ2FuIHlvdSBtb3ZlIHRoaXMgcGFydCB0byB0aGUgc2Vjb25k
IHBhdGNoPw0KU3VyZSwgdGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KDQpUaGFua3MgYW5kIFJlZ2Fy
ZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICt7DQo+ID4gKwlz
dHJ1Y3QgaW50ZWxfY2RjbGtfc3RhdGUgKmNkY2xrX3N0YXRlID0NCj4gPiArCQl0b19pbnRlbF9j
ZGNsa19zdGF0ZShkaXNwbGF5LT5jZGNsay5vYmouc3RhdGUpOw0KPiA+ICsNCj4gPiArCWlmICgh
aW50ZWxfY2RjbGtfY2xvY2tfY2hhbmdlZCgmZGlzcGxheS0+Y2RjbGsuaHcsIGh3X2NvbmZpZykp
DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWRybV9kYmdfa21zKGRpc3BsYXktPmRybSwN
Cj4gPiArCQkgICAgImNkY2xrOiBzeW5jaW5nIFNXIHN0YXRlIHRvIEhXIGFmdGVyIGRyaWZ0IChz
dyAlZC92Y28gJWQvcmVmDQo+ICVkIC0+IGh3ICVkL3ZjbyAlZC9yZWYgJWQpXG4iLA0KPiA+ICsJ
CSAgICBkaXNwbGF5LT5jZGNsay5ody5jZGNsaywgZGlzcGxheS0+Y2RjbGsuaHcudmNvLCBkaXNw
bGF5LQ0KPiA+Y2RjbGsuaHcucmVmLA0KPiA+ICsJCSAgICBod19jb25maWctPmNkY2xrLCBod19j
b25maWctPnZjbywgaHdfY29uZmlnLT5yZWYpOw0KPiA+ICsNCj4gPiArCWRpc3BsYXktPmNkY2xr
Lmh3LmNkY2xrID0gaHdfY29uZmlnLT5jZGNsazsNCj4gPiArCWRpc3BsYXktPmNkY2xrLmh3LnZj
byA9IGh3X2NvbmZpZy0+dmNvOw0KPiA+ICsJZGlzcGxheS0+Y2RjbGsuaHcucmVmID0gaHdfY29u
ZmlnLT5yZWY7DQo+ID4gKw0KPiA+ICsJY2RjbGtfc3RhdGUtPmFjdHVhbCA9IGRpc3BsYXktPmNk
Y2xrLmh3Ow0KPiA+ICsJY2RjbGtfc3RhdGUtPmxvZ2ljYWwgPSBkaXNwbGF5LT5jZGNsay5odzsg
fQ0KPiA+ICsNCj4gPiAgc3RhdGljIGludCBjYWxjX2NkY2xrKGNvbnN0IHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlICpjcnRjX3N0YXRlLCBpbnQNCj4gPiBtaW5fY2RjbGspICB7DQo+ID4gIAlzdHJ1
Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSk7
DQo+ID4NCj4gV2l0aCB0aGF0IGNoYW5nZWQsIGZvciBib3RoIHBhdGNoZXM6DQo+IFJldmlld2Vk
LWJ5OiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCg==
