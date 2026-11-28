Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A268606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 02:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dotdRyJz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EFE10E13C;
	Sat, 28 Nov 2026 02:59:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BF410E0C2;
 Sat, 28 Nov 2026 02:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795834787; x=1827370787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EL4IdMi3ByiHuxA7b+u35ZoRXgPx6Kw+5pFIzho8Bjw=;
 b=dotdRyJzGq6bkJtOsjXTg0X8FquwpmzxbV/gRyTSi3QTLB1+jQJHBcRW
 KJF+PvaI4KxlfgpLx98yAYxKkHCB9aIAGv6QqCUysn+uU9K04j9uXTiC/
 d9J2ZPK2hFwm9qgc+ki0Z6uEsVO7eJugSwLtrUBGxtioIW0xeuTQfftT2
 Svngb13akND0+8E1hjQsg9SdPOhI9gg+r2CVhpZ0UQhf+N9LwzwYCibWh
 MizTD+dq7XhZydIQtkqryOcMe4tyJhp1Yi5Yq49+pt3s2Y2z3TBsEQL14
 uhmrfi1fZ9zQini+6nxcMxIIWXB6gQRDn3nf8zfgWPviXifEDQ2K81/Ld g==;
X-CSE-ConnectionGUID: PpYy2oUqRl++WLZt8/Z91w==
X-CSE-MsgGUID: XwpKUzZNS9ObS3lxCzCNWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4642331"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4642331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 18:59:46 -0800
X-CSE-ConnectionGUID: 06/2U1EXT/+fDdhRu6exfg==
X-CSE-MsgGUID: lIGU6DTiS9SFFZGPURUe2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12912413"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 18:59:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 18:59:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 18:59:44 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 18:59:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7+7sHwgHnbMEEasVKu60E++s1ddhorgpGtBKivQ4QtSVE/E65S1QquGhmLbnqaSNBXqz5VJawGSLqN3NiJeuGJ7Qvnw0MK5fvpLu94lfo+il56fXZklpxxFh01fD6QWcNwt/puWXh6jAw/J05iVghM2KXAbsoi6yXCYW5M6Ng88pFVQZfdGBVFfOHF04H7d9JJYsO7+wIJ/pKy42Jxx4K31Eb/LH5H3kIJN7XmjkGtgiGaoJDXYYsZyEdNKwsTlb7FfUsiI8wGcn5hok6FyYaE2ge8UhHCMfTve5VDVDH5KgGWfkZNAcUKY/3O5S2p+oFvfMCzPvors6db/VaVQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OPdDwcUOJwwftJwRwJjKaaqGO6AJq0c57uEhfsd4OQ=;
 b=ZMYRqS5nChYjqOn9mIy6FiG0CDvrnErUJFjZ4bTFMFrd3DdYlPQq5fNnMR0FG1CbnnsSEXLwyq6/qovSyBT0q7zLxalYujdtpch+o4E9sLeruBAcPe00jqKWz1mjhrJfi6s73NIzNBOFibC0c5Bd3OKibOv6vrwJWlUyvVWU3q3JsYRe2gLSNI/P5TY1iQWyH9mEWGeew9PJGdY6YRfW9Xox0mQp/QK2DxQ289aZIUh2L/fj1T78V+HCqwe5xIRvyIFm7x7e+x6GXw5Hi5MjQemnp7/yLoLAeSC2jHM4IjHnbjAgnsmJKFuRxMb+uRwr3rQhLDHzSmYWxZ2fdKGhlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Sat, 28 Nov
 2026 02:59:42 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Sat, 28 Nov 2026
 02:59:41 +0000
Message-ID: <277461fe-d81a-40e9-abd6-612e00368aa3@intel.com>
Date: Sat, 28 Nov 2026 08:29:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] drm/i915: Add more vertical timing diagrams
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-14-ville.syrjala@linux.intel.com>
 <75e1eff1-0710-4712-83f4-07db32c2cf94@intel.com> <awmeDlxhpzOsqpba@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <awmeDlxhpzOsqpba@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0238.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::19) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|MW4PR11MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c86da2a-28eb-48c0-849f-08df4cfba60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|11063799006|4143699003|6133799003|18002099003|261009223027099003|22082099003|10067099003|56012099006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: qTlkZLDgyHxH6T4BGDJJVOIU0reyeXuUq7SsC5TDBV0IMjyNzGGxVW7WG/0ZRQR6YkvsgKhCujPl53hov+u3NB9RS5IF/pjW+J7SX/KaJX2p2/jRxr+vaYFvzkYiUveQmMK1nVweEPOcYX2EqodeAoZm6oMfFNv+20/qXCWQ58PwTDCTpzmsagFbswyt+xqqomsNSwjOqF0afnhASv61qUqI9Y1F7gtdrYFjBleL2e6op/ZOSnTENMvZDVv5xQlLl/5vkDI4d63CKj2MSYw2SgP/aSrI56x2XX+C4B8wIbuQLgwSWeOEJucr1CfPs72U1xJ94u++xE06DSOP9yMrmBd9NDg6rpYepEUOmrWoP5qAOsuYw4tQZUIJzGIr0gQ1l9FQ9QsErgo3BasuBdTfyVh4ax/qvrxGXCKA7HnMqFIY/Grny8x/2ZBoK4VwT7Y/iVO4MxN6XPVsL3Abm8PfQPKDoF2gMO48u9gcbyXReWIE2lOIFnqgq9FUgrySMRhEJTHPJEsCGIEbBmGuKyhay41OEwfUwxv7FQ8G3V4nPjPvkiEafSlJhOYKzoBghU9m3xHwRCQpHKaaqs64MiuA663cJ60P5XCC/Vj609/XKUKg5BMZUf/cAUiB0gQ2ZHY+mozn1/rxi9KQFbAQD+E54jXMi/DI4rbCYn4X+9rtBjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(4143699003)(6133799003)(18002099003)(261009223027099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0Q5WFloMEFYckRtMnhGMGtvK3JqZDhRVmlrY2oxM3RadnNSaThpS0pzbExY?=
 =?utf-8?B?a2lVT0NrU0dEdCtzZVZTT3RNM3doNVRJZitMakVJWXhtbVROVFB3T3d5aHk2?=
 =?utf-8?B?d1FVeWxxQTFkQ0xVS3dmZ20ydVJXYi9GaXd6SmlCcmJ5cFdycWp2VjdwVm0z?=
 =?utf-8?B?OVkySlBqMjBtR0lsK3Q3eHh5L3ZWM0FqWERnYXIvY0JQL3V4Vm83OGVUeGsy?=
 =?utf-8?B?TU5jN3FEaERGZnB1d1EyV1JEWXVvU2xRZFROM2QzS2FFdjk4Wi9RaEhIR283?=
 =?utf-8?B?aVlvMGI5dDNpaTRRU3JzQUZQY3JkQ2ltUWVBYVFNU0lRdnVWWFY1RjZGSmFW?=
 =?utf-8?B?bm9GaUc2bGhFV2ZVV3ZVRUN6UHUvcXM4Y3Voa2orU3U3dVlZVmNMNklDTEdY?=
 =?utf-8?B?WkcvRVhhSnpOdFZOMXZrSmJMa3lQb1FwZ1R3K2RFK2JtMmNMSmlkNVVvTE1y?=
 =?utf-8?B?MlRLWWZnbXBJRXU5cXUxVUxwcFYyRXFQVkUyZHRIR2R6UnpBdDVwVUVHSkda?=
 =?utf-8?B?SWExMHcwVzY3NEp4Ukw2QmpDaURTVkRqditqZ0ZibThsbFAvbys5V2lMZHND?=
 =?utf-8?B?T1dCSU44U3hES1F3Q0dvb1Q4R2hlMkFNOEhHU200SWYrcFdFcUUvSVV4Y1l6?=
 =?utf-8?B?djBtd1pLWU1yeWtWTkxzOHZ3YVZSKzR1RU9MYnE2S1dFdk1xazdwUzNSUWpN?=
 =?utf-8?B?MnNFRW1CNnBnb0pzVHlOaFpUUDlwei8zak5HcVFLWWx1akpzR2k4NVNvV05U?=
 =?utf-8?B?Z2pvRkp1dkZQamJhblo1dmEzM25iQ1dxa01veG9BVE93OWlxUmgzY2Jmb2do?=
 =?utf-8?B?T05oaXU5aG1CUk5hVkJucGZBN3RPMzhyRFVlQSsrL3NZdXZwWGtUeUl1bXRU?=
 =?utf-8?B?L3pzcm9EZU1VSVhDemtKcS9rd054dnY3NzIvZ2tUYVVyZFg4SDVucTAyeFY5?=
 =?utf-8?B?cVNBVzAwMk9DUlRsOVpBUjZlU3RyOHdUaE8zcHVHT0QrNTAzWW1wYmF1K3g1?=
 =?utf-8?B?andwZUhWRVg1Yk5heUJ0VE1vRDdQNVFPeE4vMlRvMCtGWVVJU2ZPQWZmTDV3?=
 =?utf-8?B?Yitkcnl1ZXB6NXk1ZHN5QUlBQzIwSFY5bGR4elEycTZwa215RmI1VVU5Z1N0?=
 =?utf-8?B?QWN1U2xPTFJmV1hqVVlZWEw3T3FPVFBoTm5WbWhlQU45d2N0UUZXbmw3Y09I?=
 =?utf-8?B?R1BhaEFuYkdFUlY4d1p3aDM4Yjl3T1lhSFk5eE5NSmo5dzJ1TkF2TXZGbUFx?=
 =?utf-8?B?aGVMR01KV01nSThtRVVBS1FtMzBhQVhON0JpQ3Z6TDZSd2JjcVlhdnV6ZHJh?=
 =?utf-8?B?cnVEcSt4czZ0ZnZDZWlTVi8vaExHQ1pZOVFBRUdDbk5OSHRoZ2k3RHA2R1lF?=
 =?utf-8?B?UEFTY2JZVGxLL3QvQmtrUVVpZ3V6RUllMytWbTJ3VWJ2Y0o1cEY3Y1NNOFJt?=
 =?utf-8?B?V3NvNHFlWW9KN1lKVzRMTXZZaDBKRHFESDNzNlRoMk5lOGZCMmYzc1JwOUZ0?=
 =?utf-8?B?VDZDaExyaDNSMWEwelFJelhGZ3RLLy85cXVSMzhqcmYrckp5RmJzQkVYQ3J2?=
 =?utf-8?B?V21wZS9vcys2V2JBTHZXVnI3OG83M29kYURSTFRrd3JuYXBuTndzUDZoZTdZ?=
 =?utf-8?B?QjN1a2N6Vm9pdDhwblR0ODgxNlU5Znh3eUl3MDZIT21jbGg1dXFrbzZ2ak9B?=
 =?utf-8?B?dHZ0Y1NIVkZNcm80dEZNRVRqeTd4Mzd2YWVHWEdxWHV4RUZnaVhUNGNZS0NK?=
 =?utf-8?B?N2w0K0J2QzZ2ZkM1QSt3QitIeGtDVnRURlk2RWlkRlM3aERkMjBzTkVVY3Yx?=
 =?utf-8?B?bHVsRVRRZXJ1TWRzQU0xVUI5MGVEWS9NRjF6M0NHdjNEN1ZGQ3hTRzA0MDZ4?=
 =?utf-8?B?NzFENVBQemVvSWVxdjJiTG5QdldqcFN3ZlBpbDBjNHhibHBWQ1NvNTc1UGlv?=
 =?utf-8?B?M0NuYzFlMjN1aGMrNlFpS29QN2I5L21JT215dGg5b1F3cEtkMllhb3pyTTNx?=
 =?utf-8?B?ajFodWFTN1R6ai83UDBGRyt3NTJNUksvdThUMnU0dnFjWHlBSng3ZWlnTjJQ?=
 =?utf-8?B?TjJYU21rYnVCcHBSN0JIOG1NMEJHczN4OXBLdXI1cFRUVENNWlY1dko1d1Vi?=
 =?utf-8?B?QVJrMTlpTzJoODhHeU4rOGpkdnM2aTJIN1RUNXNabXYxTnI1eDU5NXZlaEYr?=
 =?utf-8?B?OGl1RmlaaU5nRjlkTTlzYjIyYko4UjN6WldkRDFJcHBvdmJKdDRVeEZpZnJt?=
 =?utf-8?B?MVpBTk11aG1aWkV4ZWhsWHlLb0p1WkNuNHlXUlgwb21LclJYWTVOaHZtdGpq?=
 =?utf-8?B?SGRhOEVzSENPSnBROEJoOFJua2RTcVY1bUFQblB5R0QrclUwQkdheFNBdmRG?=
 =?utf-8?Q?VgRxSQDvELy7APyQ=3D?=
X-Exchange-RoutingPolicyChecked: dg+hLIP0CVe6FUU3JPmDoEX6elagdr07vZGHJAeWreOS9REXhbbniU4rlc+hCTcAciINaSjsV//ObTzOB+sd3DJFp8/nxVQBuujUVGG7zASocLOaxSR3oXvAzlronIYQdXTeekilrR4NK+zYqq0EBhZGl1Ge+kv76miW05b2VpwOavTOkT5uvisuASUC7xSCXRzuBnTpvXb52SIONzRGsdVUPzKBfxHmsjPnqEMqztgkUYermsVwdear0TuvedBs+LFZKb8wiyRx1UdebNAt9JDXF45c5kdQLfgq+P+u67RODoWT1KOxe2QSZeLOZieuGYkmlOA91Xh2uIDjoqYDFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c86da2a-28eb-48c0-849f-08df4cfba60b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 02:59:41.8873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlIgwLdGsUic4MzTYGNfkjCojpcTWzRZYlAKyBM+6eLfV+4cf4ha5Ite0lVwXnsCDct2aXrD4rrKDNATFDio/8PUi91llWvZaF6cnQkzios=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/27/2026 8:43 PM, Ville Syrjälä wrote:
> On Fri, Nov 27, 2026 at 11:36:59AM +0530, Nautiyal, Ankit K wrote:
>> On 10/23/2026 10:28 PM, Ville Syrjala wrote:
>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> Document what's going in the vertical blank interval on all
>>> platforms. We already have one diagram, but that also includes
>>> details on the frame counter vs. pixel counter differences and
>>> whatnot, and so would probably get even messier if we added
>>> more to it. So create a new set of simpler diagrams. We basically
>>> have four different timing generator behaviors, add a diagram
>>> for each.
>>>
>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/display/intel_vblank.c | 50 +++++++++++++++++++++
>>>    1 file changed, 50 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
>>> index 084f6aaea61d..d93a78cea9cc 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
>>> @@ -68,6 +68,56 @@
>>>     *   of horizontal active on the first line of vertical active
>>>     */
>>>    
>>> +/*
>>> + * Overview of vertical timings:
>>> + *
>>> + * Legacy timing generator (pre-TGL):
>>> + * ... vactive |    vblank   | vactive ...
>>> + *             | "guardband" |
>>> + *             | FSD |
>>> + *             ^     ^
>>> + *             |     frame start (vblank interrupt on gen2/3)
>>> + *             vblank
>>> + *
>>> + * Legacy timing generator (TGL+):
>>> + * ... vactive |         vblank         | vactive ...
>>> + *             | window 2 | "guardband" |
>>> + *             |   SCL    | FSD |
>>> + *             ^          ^     ^
>>> + *             |          |     frame start
>>> + *             |          delayed vblank
>>> + *             undelayed vblank
>>> + *
>>> + * VRR timing generator (ICL):
>>> + * ... vactive |               vblank               | vactive ...
>>> + *             | window 1 | VRR stretch | guardband |
>>> + *                                      | FSD |
>>> + *                                      ^     ^
>>> + *                                      |     frame start
>>> + *                                      vblank
>>> + *
>>> + * VRR timing generator (TGL-LNL):
>>> + * ... vactive |                    vblank                     | vactive ...
>>> + *             | window 1 | VRR stretch | window 2 | guardband |
>>> + *                                      |   SCL    | FSD |
>>> + *             |    DSB safe window     |
>>> + *             ^                                   ^     ^
>>> + *             |                                   |     frame start
>>> + *             undelayed vblank                    delayed vblank
>>> + *
>>> + * VRR timing generator (PTL+):
>>> + * ... vactive |                    vblank                     | vactive ...
>>> + *             | window 1 | VRR stretch | window 2 | guardband |
>>> + *    |  SCL   |                        |   SCL    | FSD |
>>> + *    |         DSB safe window         |
>>> + *             ^                                   ^     ^
>>> + *             |                                   |     frame start
>>> + *             undelayed vblank                    delayed vblank
>>> + *
>>> + * SCL = set context latency
>>> + * FSD = frame start delay
>>> + */
>> Perhaps good to mention: on ICL/TGL guardband was called pipeline_full?
> I suppose a note about that might be in order.


That will do.

>
>> Can we also document the wait_for_vblank and DSB chicken bits behaviour,
>> something like:
>>
>>    * VRR timing generator (PTL+):
>>    * ... vactive |                    vblank                     |
>> vactive ...
>>    *             | window 1 | VRR stretch | window 2 | guardband |
>>    *    |  SCL   |                        |   SCL    | FSD |
>>    *    |         DSB safe window         |
>>    *    |        ^                                   ^     ^
>>    *    |        |                                   |     frame start
>>    *    |        undelayed vblank                    delayed vblank
>>    *    ^
>>    *    |
>>    *   wait_for_vblank ends here (DSB chicken bits redirect it to the
>> safe window)
> Hmm. Maybe just an extra note at the end?
> Something like this perhaps?
>
> When DSB_CHICKEN is configured to wait for vblank, the signal
> is edge triggered on the undelayed vblank. When DSB_CHICKEN
> is configured to wait for safe window, the signal is level
> triggered on the entire DSB safe window period.


Note is perfect, and accurately describes, what I intended to capture 
near the diagram.

Can we make DSB window with dashes, if it doesn't spoil the diagram:

+ * VRR timing generator (PTL+):
+ * ... vactive |                    vblank                     | 
vactive ...
+ *             | window 1 | VRR stretch | window 2 | guardband |
+ *    |  SCL   |                        |   SCL    | FSD |
+ *    |---------DSB safe window---------|
+ *             ^                                   ^     ^
+ *             |                                   |     frame start
+ *             undelayed vblank                    delayed vblank
+ *
+ * SCL = set context latency
+ * FSD = frame start delay
+ */

+


Regards,

Ankit

>
>>
>> But even without above suggestions, the diagrams LGTM.
>>
>> I had a very primitive diagram in my scratchpad. This is better.
>>
>>
>> Reviewed-by: Ankit Nautiyal ankit.k.nautiyal@intel.com
>>
>>
>>> +
>>>    /*
>>>     * Called from drm generic code, passed a 'crtc', which we use as a pipe index.
>>>     */
