Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC49CCCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E8D10E041;
	Wed, 29 Apr 2026 20:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LO72rPb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F219E10E041
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777494338; x=1809030338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oBNBK8qTTQQXAOw0CyXHZ/pDKFYu2XFJmEFm7J/sD2Y=;
 b=LO72rPb7N/zdnv2RaVHP0Rwf1r89TnJroYI+bjV2DAvfk86pUTZvCk2c
 +CamJRvm0Y7qGE49AS6OacogS1SEoja/d3U2gokgK8Si6mLXaKWtwet/d
 bLcBX3mh+TOVHBEt+/ZyFtb1RUDr0Kg3wKeUlQoFTsDflDyxahJbjD+BQ
 gEwCABetfIEKHrHW8x1tQPszdBUStPidk8PDJHjiYjYOLdSXeC8/CALO4
 hrJ9/ATdH2HQctnWZS7G4CQWyT+kBENPYJERbFySKrCjHHXbQrd2j//ci
 HpktuITVIL9WftcE9ZGQW5fCtlWVWaVCDZoggMA2KvYq6R64B8+8O3x+y A==;
X-CSE-ConnectionGUID: EG7VkQ/CQTG+ygimrPhY8w==
X-CSE-MsgGUID: 2+/y/wfKQ1uWfAl/NuuOsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="95999945"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="95999945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:25:38 -0700
X-CSE-ConnectionGUID: Sg+pCFbSQcm3MIdDB3PRVg==
X-CSE-MsgGUID: aVKknEgyRsCj//nYc1D/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234396220"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:25:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:25:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 13:25:36 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFNPVppLlo8zhLUh2XgFF8tse+pxQCDRdqwymbVl/Dl6s887ERbNkl649ePCwGIXSaaDIoMCcbr8KVZN1icIQCA3bBXrH0PMNHshF6Oa1cYYBZGUZy++/C08ByzEqXPn9WtstvEflxk+HzygHqr0Fu2yktpNQWKcMwlg/s3AB2Hba8GQiPVEBGt29tdek6Dv+Ac6DIyBJTYowl/ydFq3G7pGT5pAVn6KAn5gVci0zPjtZNe79LZdgdTHT2gjTFQXBiz/2oobnK6iEmI0tM6PcQP/xmoWv0Pjj9rHF/G6oVoSJidTLdK8rzBk0y4pTvk4O9GJ+9nbhWMz7WEwPSLN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBNBK8qTTQQXAOw0CyXHZ/pDKFYu2XFJmEFm7J/sD2Y=;
 b=EefqLAvfkDeNXZnRGpFO9G6O65d1pFy/2x6+H+J+XWwpM/3w/Zh8k7o3X8C4rqm2Hefy/vQcJSudJZXUppwyVtizcCFOCykwwRsVVZXeeZD15TRk7uO1m0ppvCGCUrCROtebJSjmI21D4J+n5tmHq7wl2S3A/oI1PlPK9l3tR8SZQgegxmFZsKk5tOASY6WV0hAh71CewOIwmVJ19CyY1Ds5CTqjd7mEAbH5+vamOi5VdVVNF6Ht4hY9uCgfcFC1/imJNi31FKWJtH9N55b/cItu54tllWLKtE7W67AWtfPoVlzDDNxDPVnaP24O17pRmCNbUQ8zJgJvnl0LSEpO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BL3PR11MB6482.namprd11.prod.outlook.com (2603:10b6:208:3bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 20:25:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 20:25:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF
 view during migration
Thread-Topic: [PATCH] drm/xe/pf: Fix MMIO access using PF view instead of VF
 view during migration
Thread-Index: AQHc2A2rM7/5/AczIEa2mcS/xSi0qLX2fIqA
Date: Wed, 29 Apr 2026 20:25:33 +0000
Message-ID: <a2b00865f74aca893aa0d9a1af179b42f8dece63.camel@intel.com>
References: <20260429192259.4009211-1-shuicheng.lin@intel.com>
In-Reply-To: <20260429192259.4009211-1-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BL3PR11MB6482:EE_
x-ms-office365-filtering-correlation-id: 1cad1667-e827-4b6c-48c9-08dea62d7708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 4//MGHrriZzl3lQsbhGse7x3sCowtv7/3PTB3tP18vzd0ISZ0isNC8xvHzYIZ5sD7KzyvZh5LaoWPZl80k3gIWATBxd1w5UeYCyeeupTkPiJAVtcX7HaHzZlzSweCJdKOxiu9maY2yWU+KTUWyfta5w9xE1XpsFpJdf+Vg25BKa8uNzrYi6s6dHNG2OnGpX7of+IcD6CFnzXamAi7PM0jFo26atDp8h3sFUtCSkL3TqOe9K04WUDb5ukK0JEK2U43wyE2XztsONOy0ckNmePHzy7HT+Ntf9zeWhIGWNZt/m40ga3wUMaexQWIWepzl+V1dDh0kvNmj0X8oNylunULeiauSyqh3bOnqdNKZd54oNutME8KqDudpPqf6PytX1nWBZ7AlY04949iiX5QfdVZ/Gnu6GY257x+/XBgSdUqJ7JSR85vxlqYsZPdwjU5gR++UiFbDIp+tSHnSKjAAHREBnLO2vioQogzzGXTzQgW0kPL6bAuUQiMka2ArcTBcPZDOHKFtRw/KlMQl592COmuh7P/cpg0KVdArj3gIQg68G5NUTX5r5b8523fdG75zIuQk5uyZ5KMeJ9Y3WUjRObe5rJ1axjJjkyqZv30palB3ShrlvOnU3FW1fhHTlY5SNyd6NI/2u20gTEhdal9/CMxZAIoYp6TvpIsYhfo2DLd2TX7uXg4vc5jLwq73fon08sQQ6+tMYNwl6j+MTDHbQLcWr3e5JUJLFiqsDLALyStt0zJTtKVYlnuomdYa+PFM5vNhkoaC5i/vPTBPQ1WNwvkEIk/B634HodkZkJ7AmGBjk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0lLRWVsNERkd1kyTmZCczNrbHNSUmluTVhxQ0p2ajJZTmpWR3AyM0UwanVt?=
 =?utf-8?B?WXlkR1U1bkJpc3MyVUk5ak02SG93d3dJSHA4ZW9EeW5jbWhzRFdrV0hGMnFO?=
 =?utf-8?B?S0N1cVA0S3R6YS9UZGpmRXJ5VGx2S0pNUEVCczN1VVdVM05UOE92NkhPcjlE?=
 =?utf-8?B?bS9qaGkxV21wZ2JUK1NGelN2TVZsamdLUWhJc1N0OFdyN29BbXpQdFZycXdu?=
 =?utf-8?B?TWd0ckpwemFCZnRHdldBb0N4czI4MVpOVGxvZjFTTTd1K1NjNEI4TVA2ZVlr?=
 =?utf-8?B?ajVDN1dnMzhRRUNidm9YbWFlZ1ZGcy9lM1ZQZTFkMGFOUHY2cFl4L216RFEr?=
 =?utf-8?B?MFVBQ2VDTkRxdERObDk5S3RJRStUM3RYeXBWQk1UZ2o5VXI4bkQrbUlMUDE1?=
 =?utf-8?B?MjhDcFo5U2doSVR5KzlTZ2UvSDkxTnhzV1ZQcFdNQjJOeXF3ZDFHZ2l3MkJU?=
 =?utf-8?B?b1pxNDE2dE1zaklJUTlQc2hZWDRtSDFTRVd6WEJUcUdEUUFzZHJoWTlJMG9P?=
 =?utf-8?B?dW0zWXBvajJEanQrc0FtVEZWOEd4RGdldStLOEx2bU9iVGl6YUJZQXNONkNU?=
 =?utf-8?B?eStVTEJ6cEY2UW9HRHNxZnRmTlJjMVQyRXlwMzkvblZPSXFEVnNmOVpma2t6?=
 =?utf-8?B?SnhDRFduN2FlVEU5dzlIUDhoOEM4R3hrWDJuWXROeXVkOE50ZnZXSXdoRzlR?=
 =?utf-8?B?ajFVdFUzSlpRZmlCUi9WSkU1YWEvNVF3VUNObXhjRGxmbDRMQTVRRGVPU2Z5?=
 =?utf-8?B?eFJTVVprR2o3eHp6OFlVdU5wRTlSeTZMSElTZEt3NjdrMHZMR1l4ZHgxWEJC?=
 =?utf-8?B?WUlERlU0VEZoSHZ0VEE1SWxXbkViaGdPNi94SlhjeXBKNHNhc1RpK2hmd0dv?=
 =?utf-8?B?ek9MaWlvQkdVZGxsa2U1QWpHSEJET3FlNzNlVzNWOVJxT1J5NnczRVZnTXlB?=
 =?utf-8?B?YnAyRmNaejZtWkw1NzB1WER4cG1tMHRTcnVaZWM3Y3k3K2F0a1I1QTk0WnR2?=
 =?utf-8?B?TmZ3TFE1MUladWJqY01nWG15NW1GK3lVTjBwallmVkxqck9Qc3Zjc2lxcmhE?=
 =?utf-8?B?UXVEcmovc1k5Wm8vSEU0TUlrY2VqbDRkeHQvYmF5ams4NzlVL25vS2M5WGlt?=
 =?utf-8?B?S0lZcDNLL0NKUHl6Mk1EbUdIempvWmJHbTkvYWdmMjUxWEluclVHbjZLUUFi?=
 =?utf-8?B?VXZJb3Z5L1RyM3JYTVd0Sld6anFGcmo3R0cwclhpdW1ZTFBmS1Q4ZmRnZ28x?=
 =?utf-8?B?UVdVYkZzZ1pjeTlWYlpBVHdESW1YZm9nZXNMajJaOVVqRnFZVTBUK1Qwb1BB?=
 =?utf-8?B?eUxtYkVidGIrT2RmaEwwWmkrN2t1YUlXTWdaQkFNdkwxQm10ejcyRjk2QllQ?=
 =?utf-8?B?eStSZ1Y1emQ4Y05KcDMwYytQRmFMRXRyalRHTkZjZkZFU0hSZ3loKzNlY081?=
 =?utf-8?B?TWJHTEZWSE9VSFZZYnpDbmswdGMxeXVncFVWUVNsWFhZb0VGS2ZZNXU2OUph?=
 =?utf-8?B?d05JNThyZkpQQm5OQnhoamtRZHdEa1l3ay9IRUdQT25aeVl6NVhvSHZMWjVH?=
 =?utf-8?B?R2VkRHFaUWFXSll3S1RlZnRMZWF3VHl6Qk1xZ092b2MyK3NzWVZOdmhPOUJp?=
 =?utf-8?B?Y05pck9iaXZWRXA0dldKU0tIVUsvWXd0Rk9TNTMvcTRERjF2aGVrY2dDWXNm?=
 =?utf-8?B?ZlFhV0tNRGMzMG51Rnhua3ZBaVBrUmkvYkl0SEtSZGp0ajg2Z2xDRzVIUGpr?=
 =?utf-8?B?UTlXeE1OeUJxTVk1eFdRTGJySks4NjRteEQ3OUplL1JKV1UxaEVreFdodVYw?=
 =?utf-8?B?VmJXMm9vVlkrdDNjUjJBTEtwV1MxcGFLSElJSzlnZGhjTlJ1akVTR0hSUFM2?=
 =?utf-8?B?UjJUL1dETkxHNk8yT2lPVFFZT2ZtZWo2Z3V6OWlUemt2dTdteHpra200WmUw?=
 =?utf-8?B?TTIwUnpzVUNEVGRjYjJ1bXRyOWpraEdDN2NaL1pJRk50RkJpRnRSblFSR3RU?=
 =?utf-8?B?NkpCVi9DMjVRTUtZRE1aMXZVd3h6QU1aL1JUOUVRYi9zVGNTd0JqRGVOWTZh?=
 =?utf-8?B?T3JYUzRPWjJ0UWN2RExOZ2hKb2k1WnUveHRiQXBuZGJyOTI4N1RVbDk3elIr?=
 =?utf-8?B?cW01OEhyeXRMQkRnb3dSRmMveFlIb0hjYzlQamVtMnVYTjBpQjdJZ1BHV0h3?=
 =?utf-8?B?ZlRJaW5zRWNsSGZwdDh0S2E1TWpCRGo4ZS94TDJnanI4QzFhakJTVGprcFhJ?=
 =?utf-8?B?UnZpdy9UcTVwUEdrQjBUZUdwM1AyYkhPQnd3OEFZbE9BczFOeTc3VzFYRUhH?=
 =?utf-8?B?QUNlQTZ0bm1UeWwydDE4M0FkRnZ3L3RSbzlLNzJwV29wMFNZdlhEaXZ3ZHFK?=
 =?utf-8?Q?dnexfSDmGL9K68IQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EA6A57A9497734FB689DA0585E9BC8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gKY3AsqVanZGFSR+9BXMbp17DwQSjAViCM3Yaa61tCZ2MkuEbHJ/O0XCK7tfMr4z5ip9cnMnAS2dx+2gI/3Q7XVjemP8Gr6Va8PMPTbTotUo9CpBuPSquDs7Ls3d7hJ+hpKiNernBei+rheBGNqvtFvojRWh8axhtlDDOTxgclC1e8T3jyGsW+PpVNjp7fIYh0h/jAZXh4d/ca9NYbWUclIIZh7gmsxB2EUNfO7MuwQOChJz0iNAZ2OfoNsgtsACIKrGZEK3tQhn9Bj9RlYhfWnCpxeKzgGoTgq/vA9XQinGcHS4Yq7cOaWFzxDw3/Yk2anc0TVVb0+ZqIusUyoUeA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cad1667-e827-4b6c-48c9-08dea62d7708
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 20:25:33.3713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4FOqpP9JHMxrUJh70xyqXp7ytugYbEFc2ToGB00G07gT7eXdWuuBwQmfr5Bmq+YmKbNnK2DAfIbUUJSv0uz/cQKgXw4UVnVUgv8piYPFE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6482
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

T24gV2VkLCAyMDI2LTA0LTI5IGF0IDE5OjIyICswMDAwLCBTaHVpY2hlbmcgTGluIHdyb3RlOgo+
IHBmX21pZ3JhdGlvbl9tbWlvX3NhdmUoKSBhbmQgcGZfbWlncmF0aW9uX21taW9fcmVzdG9yZSgp
IGluaXRpYWxpemUgYQo+IGxvY2FsIFZGLXNwZWNpZmljIE1NSU8gdmlldyB2aWEgeGVfbW1pb19p
bml0X3ZmX3ZpZXcoKSBidXQgdGhlbiBwYXNzCj4gJmd0LT5tbWlvICh0aGUgUEYgYmFzZSkgdG8g
YWxsIHhlX21taW9fcmVhZDMyKCkveGVfbW1pb193cml0ZTMyKCkKPiBjYWxscyBpbnN0ZWFkIG9m
IHRoZSBsb2NhbCAmbW1pby4gVGhpcyBjYXVzZXMgdGhlIFBGIG93biBTVyBmbGFnCj4gcmVnaXN0
ZXJzIHRvIGJlIHNhdmVkL3Jlc3RvcmVkIHJhdGhlciB0aGFuIHRoZSB0YXJnZXQgVkYgcmVnaXN0
ZXJzLAo+IHNpbGVudGx5IGNvcnJ1cHRpbmcgbWlncmF0aW9uIHN0YXRlLgo+IAo+IFVzZSB0aGUg
VkYgTU1JTyB2aWV3IGZvciBhbGwgcmVnaXN0ZXIgYWNjZXNzZXMsIG1hdGNoaW5nIHRoZSBjb3Jy
ZWN0Cj4gcGF0dGVybiB1c2VkIGluIHBmX2NsZWFyX3ZmX3NjcmF0Y2hfcmVncygpLgo+IAo+IEZp
eGVzOiBiN2MxYjk5MGY3MTkgKCJkcm0veGUvcGY6IEhhbmRsZSBNTUlPIG1pZ3JhdGlvbiBkYXRh
IGFzIHBhcnQKPiBvZiBQRiBjb250cm9sIikKPiBDYzogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hh
bC53aW5pYXJza2lAaW50ZWwuY29tPgo+IENjOiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2Fq
ZGVjemtvQGludGVsLmNvbT4KPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQuNgo+
IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPgo+
IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX21pZ3JhdGlvbi5jIHwg
OCArKysrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3Bm
X21pZ3JhdGlvbi5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0
aW9uLmMKPiBpbmRleCA4N2ExNjRlZmNjMzMuLjAxZmUwM2I5ZWZlOCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0aW9uLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3Rfc3Jpb3ZfcGZfbWlncmF0aW9uLmMKPiBAQCAtMzg1LDEwICsz
ODUsMTAgQEAgc3RhdGljIGludCBwZl9taWdyYXRpb25fbW1pb19zYXZlKHN0cnVjdCB4ZV9ndAo+
ICpndCwgdW5zaWduZWQgaW50IHZmaWQsIHZvaWQgKmJ1Zgo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oGlmICh4ZV9ndF9pc19tZWRpYV90eXBlKGd0KSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGZvciAobiA9IDA7IG4gPCBNRURfVkZfU1dfRkxBR19DT1VOVDsgbisrKQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnc1tuXSA9IHhlX21t
aW9fcmVhZDMyKCZndC0+bW1pbywKPiBNRURfVkZfU1dfRkxBRyhuKSk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWdzW25dID0geGVfbW1pb19yZWFk
MzIoJm1taW8sCj4gTUVEX1ZGX1NXX0ZMQUcobikpOwoKR29vZCB0byBnZXQgZmVlZGJhY2sgZnJv
bSBNaWNoYWwgV2EvTWljaGFsIFdpIGhlcmUsIGJ1dCBJIGRvbid0IHNlZSBhbnkKdXNhZ2Ugb2Yg
dGhlc2UgTU1JT3MgZnJvbSB0aGUgVkYgaW4gdGhlIGRyaXZlci4gQXJlIHRoZXNlIGV2ZW4gZXhw
b3NlZAp0byB0aGUgVkY/IFRoaXMgc2VlbXMgdW5zYWZlIGZyb20gd2hhdCBJIGNhbiBzZWUuLi4K
CkNhbiB5b3Ugc2hvdyB0aGUgZXJyb3IgeW91IGFyZSBzZWVpbmcgc3BlY2lmaWNhbGx5PwoKVGhh
bmtzLApTdHVhcnQKCj4gwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGZvciAobiA9IDA7IG4gPCBWRl9TV19GTEFHX0NPVU5UOyBuKyspCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWdzW25dID0geGVf
bW1pb19yZWFkMzIoJmd0LT5tbWlvLAo+IFZGX1NXX0ZMQUcobikpOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVnc1tuXSA9IHhlX21taW9fcmVhZDMy
KCZtbWlvLAo+IFZGX1NXX0ZMQUcobikpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAw
Owo+IMKgfQo+IEBAIC00MDcsMTAgKzQwNywxMCBAQCBzdGF0aWMgaW50IHBmX21pZ3JhdGlvbl9t
bWlvX3Jlc3RvcmUoc3RydWN0Cj4geGVfZ3QgKmd0LCB1bnNpZ25lZCBpbnQgdmZpZCwKPiDCoAo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfZ3RfaXNfbWVkaWFfdHlwZShndCkpCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKG4gPSAwOyBuIDwgTUVEX1ZGX1NXX0ZMQUdfQ09V
TlQ7IG4rKykKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX21taW9fd3JpdGUzMigmZ3QtPm1taW8sIE1FRF9WRl9TV19GTEFHKG4pLAo+IHJlZ3Nbbl0p
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfbW1p
b193cml0ZTMyKCZtbWlvLCBNRURfVkZfU1dfRkxBRyhuKSwKPiByZWdzW25dKTsKPiDCoMKgwqDC
oMKgwqDCoMKgZWxzZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChuID0g
MDsgbiA8IFZGX1NXX0ZMQUdfQ09VTlQ7IG4rKykKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX21taW9fd3JpdGUzMigmZ3QtPm1taW8sIFZGX1NXX0ZM
QUcobiksCj4gcmVnc1tuXSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB4ZV9tbWlvX3dyaXRlMzIoJm1taW8sIFZGX1NXX0ZMQUcobiksCj4gcmVnc1tu
XSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9Cgo=
