Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55BF606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vm+2RJbg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D37510EBD4;
	Mon, 26 Oct 2026 06:19:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3CC10EBD4;
 Mon, 26 Oct 2026 06:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792995540; x=1824531540;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=J+oC2gIfiUNe6uBEVHw7pyRE9/t4HxmACYW8Qbj58AY=;
 b=Vm+2RJbgjJl81e8dagH4R7ZapKueYeTjYUxpI0WSMac6fvxcSAcghHCA
 ehhqexhtme3fGDzgCIgzxMwvLFQcidshqsgPjAPqnWv6Kpq7n4cFQU1vN
 YG9w2LjqqtKzN7vZC1B1oNliVddR/XVspp1daATYUOTFDMxLwV+/2ijbB
 1zcSuG05NughDwxhpRGqyhSemQnOKodAxmvyKjE0uaibJZu4JGQT+mJDX
 r7xW6O24U7A6zEv0LfEWDWrBTxyXJO+Pzj6jdP1Sg4/Gt/v6IfnrCKUPd
 opL31D5djKmUkhxCE6YkAYhWeHRXXh68wvrLFtlspvZcuN2qbjohGSP3t A==;
X-CSE-ConnectionGUID: aLcWE3TZSmquL+69sM2CJQ==
X-CSE-MsgGUID: 6JWD2tALROyKGnmnUcd+lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1683038"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1683038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:18:59 -0700
X-CSE-ConnectionGUID: zxt2w9DnSkigx6I371T2Hw==
X-CSE-MsgGUID: FZ+yoARTQWawKC1XgvVWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4278831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:18:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:18:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 25 Oct 2026 23:18:42 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjO+ZKBiWRWR3MFa7OblmbgWN4YnBe2mSnBMBbfO/4MuAKG3EJpFJ5+aBUhvEsRAem1MfCJf4mbg00QbXVEowSSqvjq5WKZxhq5c1uHD0+YdqiiuMinf2IOXuBkXYqvX/jcO2mpAiSFJmpT1krNoT15eZ1Fc7XTVUvKcH+ht0IgSn2PfW6capOqdwVC9tPlCftk+eHJDrF6QAm9ne9Bcer28282VsInSIYchgF3O/0RhiRdoyEUtqJ89g8+eFvtsCpk+757AdPc24AaY7Fry2ZkQHgGQi2MVigWSbAMqsKdFrLSSP4TD9hwHSjhJCU8CEeSEgEESs92lM1er/wPVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+oC2gIfiUNe6uBEVHw7pyRE9/t4HxmACYW8Qbj58AY=;
 b=pDz3YV6fbWdcQAzAFPhiqbwQiI7POvTEw6EPAUtq9VvgUOPWhv7hdQbqhFkVdvoJttUr27lX+J21cCrwo1ibeTp5H6EfEaPLHT2PUuf1BdWA5oxypPXLxvEClLk/IfpN+RxogzOH/S57CX3rMThI78JNL378YLto+Y1bOWYuUEoVtYEk8xarltSZXliJnck6TIfFENAeDw0k/d6rdOVJQyLET/x6kdNrUbOgARiVjEKte9pRdz4qGnYK/mCtVwhqVd/i0OeuAefjXwA8O9idLEbj0ggwI+SxKeGwwaFoF3SnELKUx6rJBH5HBduD9YMob4HwUz9+NuFvMb5ydKsRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 06:18:38 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:18:38 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 7/9] drm/i915/psr: Resolve the PSR encoders through the
 joiner primary
Thread-Topic: [PATCH v3 7/9] drm/i915/psr: Resolve the PSR encoders through
 the joiner primary
Thread-Index: AQHdYtV28fbQpglJC06uhKeO5LW0brcPXf0A
Date: Mon, 26 Oct 2026 06:18:38 +0000
Message-ID: <f761005425fcdd971b0541b65d0cdc5ae3de64a7.camel@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
 <20261023100052.683192-8-mika.kahola@intel.com>
In-Reply-To: <20261023100052.683192-8-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB7919:EE_
x-ms-office365-filtering-correlation-id: a05d07de-c430-41a8-4e5d-08df3328f929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|3023799007|10067099003|18002099003|22082099003|11063799006|5023799004|56012099006|4143699003|261021121427099003|261009223027099003|261022105027099003|261021123027099003|261022075727099003|38070700021;
x-microsoft-antispam-message-info: I7khNaVErecECOnKRjliFlIowGGBkR3WgVIhpnZuML5V5MITk7ojmSeJ+4fgoYmOMwYwam4qXOsk7FcXjMsc9lnJ1ASmQX/sZJtYwMv7cUmWthrTWevEJhrDy1VO6I/Iv8izx/x1xkXw0uG46XW/1WsN4lN476fTEauUEuzMoxHkgeL29EmdUYoocvVCpluA1aGrxujWUusqYO7/zZ9nCXiicIbNfgY7BIPJlRs/wZQFYyIjqukfRvPIOEnSFAwmKfY0oBOAEmMLjAzha2YHL+3Sr3iKTv7765azQIHvy5VVjCtBdSA+b+XzXaQODprRp/C4XLHcTt6dNLnO3f0Be/6Su4URU9TeOmphjJEys+0wZWGJZ4CeuxJn/LRu3tznIhfNlFYW2gxeVxYSRX23no4FNF0CqVDt2l6UNgKxjuAsX9QbMEoiuA/D8vQg+AOEhDS/t026Xq3S47D0COEUrYd1RxIzhPzyGp/8bVkQrvCEQb1xf8lwThzkglgEMXP6QiyQpH5aMS9ZNT/w1hDfcWUGuInsXqZJ7pkqmoAzPx2/KJ2G1wFeFRnBGSJN3HtPNZ8FpLRA6CAmYvIhkIJjMtm6jB8zusRQ27W0FEhQXyBumwrX4xvDmB/NzG2VCyO4Yx42Rh+3ihqASJUerEqWOkfdPXfhN3wp0EW6Ep4uGYo0vofnAFc7yTxP3Lld4ozxJOa8yUOdUnRMFl36UudV4alHxq05uEpUjU8kcuA74fw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(10067099003)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(4143699003)(261021121427099003)(261009223027099003)(261022105027099003)(261021123027099003)(261022075727099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzU2K3h4VnhWMnBVd2ljRVQrUSthdEJCS0FnbTBObldjcUxDYmlYSVlLeWhs?=
 =?utf-8?B?Q3BkQXcraFl5TnMwbllXcDRleUg4Vk1WcWI5dlhFYzgyT203MUxlTVBsNVZo?=
 =?utf-8?B?ZVhvNWZlOHlOTUZKSUhrb2V3eFEzUzZaMStJZER2SDN2QWo3QTVpMjlhSU9Q?=
 =?utf-8?B?SHQ1djNuQ1RlbEtlT0VkNG5OZFJCaHAxcXVJYk9Sd2FBZitoTWxwVnlZdGRX?=
 =?utf-8?B?Y01zSUxUc0R2aGNqSmpXRTBLM2htaFUwbFRIaU5WWHAwck5hdnF0QlVpdFNi?=
 =?utf-8?B?Qk82Z2I4U0xyN2xncGxYd25mb2lscFJKcG9mRDR3ZUFkUExyUGJTWXNiTG5M?=
 =?utf-8?B?TVNtVUswOGpWcHVMdHVmb29DSGMwMGhjMHBUNDRsUnhEZ2Izb0MrVGVrQmVa?=
 =?utf-8?B?RjVlQjg4SkpJRldVRWxTdlZydlBaS1RsZ2hBVGZIUFNMQks4NTNVQnhvYy9Q?=
 =?utf-8?B?Sm1uYlpvYVpnZlo5cmVUOXVVWnFucnU5SzBvUXNHVDJ3UE5QRDNPb3FWRWRs?=
 =?utf-8?B?bG9oVTk2NGY4dWNuRStMaWNjUUxJQTBmVWhMTTVxM29XbnhWTzlReHpQYXhr?=
 =?utf-8?B?S21PTTlOZS9lUTJ3SUpUMVJlRkxSeTdjYUpiWmhMSzY1V01vL2ZlMFZkREpj?=
 =?utf-8?B?NjJ6M3FJZm1PdnJHWGlTSlNnQitEYUpoaGlHZW1IYjlkSGxEcVphc1pqaVhT?=
 =?utf-8?B?SGlWQmxrQ01zWGJTMUd4bHdIM05iM2ZHMGp2MGF0aHo3OW5vMDVFRlJGQ0wy?=
 =?utf-8?B?bUdiV3Y3ditvVnRHRzdqYVJScjRiSTBzbzFjbW0vcVpheWg1TXpUaXZTMEwr?=
 =?utf-8?B?eURQaTJRSE1CbTdHWFZuWjV1ZmtnM0IwcTZuMTFFVFR4Y01sc0k3OWtPNXlu?=
 =?utf-8?B?R2VqQXh2V2w0M2FRSkNlY2ZrNWZTZk5xSDRXZUtVZElBUGNKd1M1WGl5VS8x?=
 =?utf-8?B?K2d6K3ZEcjBxZGZBUUZoMTBEcU5PdFJjR0p2cHpXaHJ3blcyTnJjL0pjVjMv?=
 =?utf-8?B?UDRJWmp0NU9WZ1VIRnZLdGFhbnZZT1dqU3o4N1diaTZSVXVrOTRSZDdGR2NM?=
 =?utf-8?B?K1FJZmRLQW50cXMyeVo1a210cUczc05KT1NPQU9uVy9NTm5oa2t4UEdUc05M?=
 =?utf-8?B?Vm1TcDBhTzJFSmJud1FjcUxJR0RyNHM2OEhFVy9sckkrc2dFYjJRZGE4bzg2?=
 =?utf-8?B?a2hhWnM5QlV1R1Jlb1FkUlk5cWR0MDdaaS96bWpxY2FCZnp0YVdJS0dJc296?=
 =?utf-8?B?bTRJKzMyUWtDMzVkTndQZ1Q4SUxKcjYxYnpvc2xONkRJQ0RtVXVmck9WVmkr?=
 =?utf-8?B?bmdrWmVTVitDN3VCSzl0TFl4QVFyaVJwSWFteWN6YWhwVWFOZ3ZaaUNGS1Nr?=
 =?utf-8?B?Q0p4N3NITW1CTnRONkY0c3piUXhiZVE2bjF0U2ZUaGIxK0V3MU01a1pMWFY2?=
 =?utf-8?B?MlQ3UE1qWEN2TUxJcURFS3B6YkxWSjN2bUcxNTRrYkh6SVFFLzN0NDFORzRj?=
 =?utf-8?B?eEVtZGZGR2tWeFB0Q29JWVlFc21HSzIyVDgvR3gvSmhBRUxzVjZzRUhQTDV5?=
 =?utf-8?B?WGluaU93ZzNTbWY4bmNHdE9tcy8xWHlaekY1SjBHUkNuM1pGTWtDaW5MT3hK?=
 =?utf-8?B?Z2ZMZUVSem1YQ3FDaGNEaUhpTXVUOEROVDI0anZtSlh2TjJCSTBUTHpaS05D?=
 =?utf-8?B?bXdVVXhrSTRuVDhFWTRweFMzZ2lIVDFUVThwSmNUR2ZoUVo2RTNzb3BmcTFF?=
 =?utf-8?B?MTc5eExZb3M5emVVWFdDYmpuVUYxOHMwOVV3dkJPSytGYUROUVF3SjZrSnJu?=
 =?utf-8?B?eFI0c2MwbUEvV1RUM1d4dllNM1Q3SmxHZ0o1aFo0N0g2cWtnYWFBZlJWcFN0?=
 =?utf-8?B?N2Fpc2hOd1hCTm1IcnI2R2xyU00xdUQyN05oTDVtNEVRNFhRMVFNK1htQTgv?=
 =?utf-8?B?dmxiYXRvT09CakQ5ZDVtTmJxYmtYVW1HNWtET1htUm1zRTZjemdjQ2d0TWkv?=
 =?utf-8?B?aDRINEwxYlFHYW5MdmFMSXN2a0JWY0kwVnZveHVXSVE2TWVzaGFlbnJyUVlJ?=
 =?utf-8?B?OW9yeTllQmlHTU16dXFrV2JaV2RTT0duaHh5U1RtNllDOG8rSDB0bjUzN0ZS?=
 =?utf-8?B?dlo0Zm82WHpXVVJuK0JyUkJqSVdiU0p3REt5dC9uZHVZY3BXUUFCcjJDV1pE?=
 =?utf-8?B?Q2R5ZXJobkpjVjBXdXBBWG84MEswNmZxaFdZeUQ3MjdCOXQ2bGJFYVY2cStC?=
 =?utf-8?B?REo3cGhsd2hDMmp5eHB4bG5vMElGdE9CNmxCNXNTelNwUnVoMHphaXJuZGVQ?=
 =?utf-8?B?YXp4Qnd3bTdyaHhCeTBQVHZqWFpIWHhnaFlNTTFySWxJelRqeDNQVWRCckpY?=
 =?utf-8?Q?TVTrjBN2+z63sn0w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6BD44F2F59F7D4CBC63E4382CDEF81D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m8pyeBczwzaY7OYP8gFyJ3ZGcnIbyDY37BpaAF/sbnIfWPpHwyCuhkxF9SF/uhOVDs9QSWttXEx0vvYmNhzvZ/Zloc+zX4VEx6GzNb9GRipbwAnlTum3Hcsflxjo2VtMt71L5MLEQLgMHcJL623lFPjV5e1q8Gllsig+owrHrwjLpuRduv2dHnfYGNcGEa4PLbqPZFYTIaKJy42j87dVngwFMeV30C4DdCFamtSSaaa3vAyYgKc4egjWLJJ5K0G5kzXFUHbCSt658PVivwyzSp7e57+R3StNjOx83cbeNIN3Qh6hvdAEdx9ZVcbSvZtv8+zKq/az+nX1ZtSM+S5HJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05d07de-c430-41a8-4e5d-08df3328f929
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 06:18:38.1623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3U8MkITCpJ9Wk7QFb12Uv8NKHABiCmINfVMVvZgqwfEoR4jK16DnqsIfq3jS9pekWoRtQSz0DsYZnH0i8DpPbtW6wLiUUW1W2R2aComfPXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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

T24gRnJpLCAyMDI2LTEwLTIzIGF0IDEwOjAwICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
QSBqb2luZXIgc2Vjb25kYXJ5IGhhcyBubyBlbmNvZGVycyBvZiBpdHMgb3duLCB1YXBpLmVuY29k
ZXJfbWFzayBpcw0KPiB6ZXJvLCBzbyBmb3JfZWFjaF9pbnRlbF9lbmNvZGVyX21hc2tfd2l0aF9w
c3IoKSBpdGVyYXRlcyBub3RoaW5nIG9uDQo+IGl0cw0KPiBjcnRjX3N0YXRlLiBpbnRlbF9wc3Jf
bG9jaygpL2ludGVsX3Bzcl91bmxvY2soKSB0aGVuIHRha2Ugbm8gbG9jayBhdA0KPiBhbGwsIGlu
dGVsX3Bzcl93YWl0X2Zvcl9pZGxlX2xvY2tlZCgpIG5ldmVyIHdhaXRzLCBhbmQNCj4gaW50ZWxf
cHNyMl9wcm9ncmFtX3RyYW5zX21hbl90cmtfY3RsKCkgc2tpcHMgdGhlIGNmZiBjaGVjayBhbmQg
aGFuZHMNCj4gdGhlDQo+IGVuY29kZXIgbGlzdCBoZWFkIHRvIGludGVsX2RzY19zdV9ldF9wYXJh
bWV0ZXJzX2NvbmZpZ3VyZSgpLg0KPiANCj4gUFNSIGlzIGEgdHJhbnNjb2RlciBsZXZlbCBmZWF0
dXJlIGRyaXZlbiBieSB0aGUgcHJpbWFyeSwgc28gdGFrZSB0aGUNCj4gZW5jb2RlcnMgZnJvbSB0
aGVyZSBmb3IgYSBzZWNvbmRhcnkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8
bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxq
b3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tDQo+IC0tDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gaW5kZXggZmZi
YjFlNTVjMmI1YS4uZjFkNTJjMzlkODgzNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3Bzci5jDQo+IEBAIC0yNjM4LDYgKzI2MzgsMjQgQEAgc3RhdGljIHZvaWQg
aW50ZWxfcHNyX2ZvcmNlX3VwZGF0ZShzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwKQ0KPiDC
oAlpbnRlbF9kZV93cml0ZShkaXNwbGF5LCBDVVJTVVJGTElWRShkaXNwbGF5LCBpbnRlbF9kcC0N
Cj4gPnBzci5waXBlKSwgMCk7DQo+IMKgfQ0KPiDCoA0KPiArLyoNCj4gKyAqIFRoZSBqb2luZXIg
c2Vjb25kYXJ5IGhhcyBubyBlbmNvZGVycyBvZiBpdHMgb3duLCBpdHMNCj4gdWFwaS5lbmNvZGVy
X21hc2sgaXMNCj4gKyAqIHplcm8uIFBTUiBpcyBhIHRyYW5zY29kZXIgbGV2ZWwgZmVhdHVyZSBk
cml2ZW4gYnkgdGhlIHByaW1hcnksIHNvDQo+IHRha2UgdGhlDQo+ICsgKiBlbmNvZGVycyBmcm9t
IHRoZXJlLiBPbmx5IHZhbGlkIG9uY2UgdGhlIHN0YXRlIGhhcyBiZWVuIHN3YXBwZWQNCj4gaW4s
IGkuZS4NCj4gKyAqIGZyb20gdGhlIGNvbW1pdCBwaGFzZS4NCj4gKyAqLw0KPiArc3RhdGljIHUz
MiBwc3JfZW5jb2Rlcl9tYXNrKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICpjcnRj
X3N0YXRlKQ0KPiArew0KPiArCXN0cnVjdCBpbnRlbF9jcnRjICpwcmltYXJ5X2NydGM7DQo+ICsN
Cj4gKwlpZiAoIWludGVsX2NydGNfaXNfam9pbmVyX3NlY29uZGFyeShjcnRjX3N0YXRlKSkNCj4g
KwkJcmV0dXJuIGNydGNfc3RhdGUtPnVhcGkuZW5jb2Rlcl9tYXNrOw0KPiArDQo+ICsJcHJpbWFy
eV9jcnRjID0gaW50ZWxfcHJpbWFyeV9jcnRjKGNydGNfc3RhdGUpOw0KPiArDQo+ICsJcmV0dXJu
IHRvX2ludGVsX2NydGNfc3RhdGUocHJpbWFyeV9jcnRjLT5iYXNlLnN0YXRlKS0NCj4gPnVhcGku
ZW5jb2Rlcl9tYXNrOw0KPiArfQ0KPiArDQo+IMKgdm9pZCBpbnRlbF9wc3IyX3Byb2dyYW1fdHJh
bnNfbWFuX3Rya19jdGwoc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiDCoAkJCQkJwqAgY29uc3Qg
c3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+IMKgew0KPiBAQCAtMjY1
MCw3ICsyNjY4LDcgQEAgdm9pZA0KPiBpbnRlbF9wc3IyX3Byb2dyYW1fdHJhbnNfbWFuX3Rya19j
dGwoc3RydWN0IGludGVsX2RzYiAqZHNiLA0KPiDCoAkJcmV0dXJuOw0KPiDCoA0KPiDCoAlmb3Jf
ZWFjaF9pbnRlbF9lbmNvZGVyX21hc2tfd2l0aF9wc3IoZGlzcGxheS0+ZHJtLCBlbmNvZGVyLA0K
PiAtCQkJCQnCoMKgwqDCoCBjcnRjX3N0YXRlLQ0KPiA+dWFwaS5lbmNvZGVyX21hc2spIHsNCj4g
KwkJCQkJwqDCoMKgwqANCj4gcHNyX2VuY29kZXJfbWFzayhjcnRjX3N0YXRlKSkgew0KPiDCoAkJ
c3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9DQo+IGVuY190b19pbnRlbF9kcChlbmNvZGVyKTsN
Cj4gwqANCj4gwqAJCWlmICghZHNiKQ0KPiBAQCAtMzQ2NCw3ICszNDgyLDcgQEAgdm9pZCBpbnRl
bF9wc3Jfd2FpdF9mb3JfaWRsZV9sb2NrZWQoY29uc3QNCj4gc3RydWN0IGludGVsX2NydGNfc3Rh
dGUgKm5ld19jcnRjX3N0YXQNCj4gwqAJCXJldHVybjsNCj4gwqANCj4gwqAJZm9yX2VhY2hfaW50
ZWxfZW5jb2Rlcl9tYXNrX3dpdGhfcHNyKGRpc3BsYXktPmRybSwgZW5jb2RlciwNCj4gLQkJCQkJ
wqDCoMKgwqAgbmV3X2NydGNfc3RhdGUtDQo+ID51YXBpLmVuY29kZXJfbWFzaykgew0KPiArCQkJ
CQnCoMKgwqDCoA0KPiBwc3JfZW5jb2Rlcl9tYXNrKG5ld19jcnRjX3N0YXRlKSkgew0KPiDCoAkJ
c3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9DQo+IGVuY190b19pbnRlbF9kcChlbmNvZGVyKTsN
Cj4gwqAJCWludCByZXQ7DQo+IMKgDQo+IEBAIC00MTA5LDcgKzQxMjcsNyBAQCB2b2lkIGludGVs
X3Bzcl9sb2NrKGNvbnN0IHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0K
PiDCoAkJcmV0dXJuOw0KPiDCoA0KPiDCoAlmb3JfZWFjaF9pbnRlbF9lbmNvZGVyX21hc2tfd2l0
aF9wc3IoZGlzcGxheS0+ZHJtLCBlbmNvZGVyLA0KPiAtCQkJCQnCoMKgwqDCoCBjcnRjX3N0YXRl
LQ0KPiA+dWFwaS5lbmNvZGVyX21hc2spIHsNCj4gKwkJCQkJwqDCoMKgwqANCj4gcHNyX2VuY29k
ZXJfbWFzayhjcnRjX3N0YXRlKSkgew0KPiDCoAkJc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9
DQo+IGVuY190b19pbnRlbF9kcChlbmNvZGVyKTsNCj4gwqANCj4gwqAJCW11dGV4X2xvY2soJmlu
dGVsX2RwLT5wc3IubG9jayk7DQo+IEBAIC00MTMyLDcgKzQxNTAsNyBAQCB2b2lkIGludGVsX3Bz
cl91bmxvY2soY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+
IMKgCQlyZXR1cm47DQo+IMKgDQo+IMKgCWZvcl9lYWNoX2ludGVsX2VuY29kZXJfbWFza193aXRo
X3BzcihkaXNwbGF5LT5kcm0sIGVuY29kZXIsDQo+IC0JCQkJCcKgwqDCoMKgIGNydGNfc3RhdGUt
DQo+ID51YXBpLmVuY29kZXJfbWFzaykgew0KPiArCQkJCQnCoMKgwqDCoA0KPiBwc3JfZW5jb2Rl
cl9tYXNrKGNydGNfc3RhdGUpKSB7DQo+IMKgCQlzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwID0N
Cj4gZW5jX3RvX2ludGVsX2RwKGVuY29kZXIpOw0KPiDCoA0KPiDCoAkJbXV0ZXhfdW5sb2NrKCZp
bnRlbF9kcC0+cHNyLmxvY2spOw0KDQo=
