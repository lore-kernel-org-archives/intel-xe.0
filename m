Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF09C3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 20:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0FC10E31D;
	Thu, 25 Jul 2024 20:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYZeGciu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B492F10E31C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721939702; x=1753475702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CjYigdBZfU9/KWrsBq9rkvTdGowQr3tS3dA5HieMyls=;
 b=aYZeGciupij4Ok+uOLpBfae7k9SqyR3HClP4rqaaXgPnRwVtO68xWHkA
 wbnmCxDYb5y3Plg5p2H6a25iXYr4h8qtCT6J7u3ol+f3T/wk1t+LV6Ec2
 NnKDTltTf07IxYa0+Bhpe8vzZzK9EjbRp+iXPc+sB5QBHr5gC1b9fAz1R
 o+VaTC1wXc+ySzXs7Ug0xTjqnW9CDzo6IlICGsmozChepPD8akiMCZYIk
 Qe9uZDU1A0huVrA3luB/z7RZixwvGvYXh5/Uus26O8RrOpFj4LCtP5AdF
 zqZpQr9DS0fK4Wq+P+Xw9U6EG6IS8pur05VnuedeuIEoO9mRPHpYwfvkv Q==;
X-CSE-ConnectionGUID: P8dQsRakS3iKgsVLh9K1qQ==
X-CSE-MsgGUID: X+Cq4AdKTOG5NAsc6SthaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37171988"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="37171988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 13:35:02 -0700
X-CSE-ConnectionGUID: Ukelt/K+SyWn+PgcvxGaNw==
X-CSE-MsgGUID: vWGKllT4QaWbxftmv+qtQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="57863084"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 13:35:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 13:35:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 13:35:01 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 13:35:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJEfOkede6KmoH/Hk9vHJVtgz94TDzSm5p0aJQnrzDFJGqOTZTf7lhSPHJj5yG5I7LE7qG+0nM7cYyFssVlu3nxzx0MbuD+niPo3qaefMVUndQD9k/ohC0Du5Fnz0A2WpesLfmX+hIZGDEpxRLZznuj+cQTr9dch+obWmpU4tpRN/fj3W6LGBAfq3x498a7TdlsTSihVspqybtgkiAJE7Ncbx5v2irPtaKHNHeY2edTpSWeD3lMGcCT6pRMeQcN0fECFBDRgZUU+9Qldh9sCMs7gzLJkDkTDlovfhPNOQ6fNW72qNYYEypcfsMnQcDPLWAC+jLqo1CLcN2d+WoYmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjYigdBZfU9/KWrsBq9rkvTdGowQr3tS3dA5HieMyls=;
 b=HYD9zNvwVtmowitP9XdHBWNYt83QWAlC7hciLD7iwWZs7tF93lcIlNDXGq+Wv18JqSd1L0BVI08JzgDva3569ewNexCsDdzDpHvHuiXLpsHqTfrJ3ZRgKamSQ9G3/Jdoq43W9AkV9axHDKXbzmdQAw+wXkZ7jfdCuq0MHITaoSGF3XJ672rHFKmOmzQLOsOmZ2Z0xmQmNhMBy+FfzJobJLR84s3F/7hiRijXeIIYQ2DKENGE0WvkylgbQYgZWHD0zmc6k1lFYBHy9cftUtEdJ4SzTJJyO8CcUAhA1TPZOfZXWZ+wZmOMohVw5JhlT1QupWdlEoOM7qsDQgkh1epsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by PH7PR11MB6884.namprd11.prod.outlook.com (2603:10b6:510:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 25 Jul
 2024 20:34:58 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::9696:a886:f70a:4e01%7]) with mapi id 15.20.7762.027; Thu, 25 Jul 2024
 20:34:58 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Zhang, Carl" <carl.zhang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [Intel-xe] [PATCH v4] drm/xe/xe2: Enable Priority Mem Read
Thread-Topic: [Intel-xe] [PATCH v4] drm/xe/xe2: Enable Priority Mem Read
Thread-Index: AQHa3VdFwUrlddfaZUiIeO3g92Zl2LIGtUAAgAEzPBA=
Date: Thu, 25 Jul 2024 20:34:58 +0000
Message-ID: <PH0PR11MB578265DFEC741611A34B14A282AB2@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20240723233131.1122655-1-pallavi.mishra@intel.com>
 <PH0PR11MB55790825A825CDF629E6BB6287AB2@PH0PR11MB5579.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB55790825A825CDF629E6BB6287AB2@PH0PR11MB5579.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|PH7PR11MB6884:EE_
x-ms-office365-filtering-correlation-id: ca50dbaf-7df3-49a3-b4cd-08dcace9404e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MklHOXpJekovQkVTVVppbGE3WTlOLzRQK1VTbWhySUNFamVsb1laYjhTdlVX?=
 =?utf-8?B?alVqRHZkckhyTE9scXplbFArbElMd2oxekdrNys4OW1VbUlWRThwTXRvUlQr?=
 =?utf-8?B?TWpIcHdINEg1S3JCTlNLTlNGdWlRUVlrSWdmLzFjckVVSUxiVzdnZmhKU2dR?=
 =?utf-8?B?cjRQNm1GU3h0UzBNcmJ0djBoZGZlQ3YxWW14Mm40ZCtUUzdQZTFadXhENjNq?=
 =?utf-8?B?RkUvVk5pUGNmU2JlTjNrcG9leTd1MGxJcSsyNzBlN25VSW9ybkQ2dmw0Z3RM?=
 =?utf-8?B?a1lBZUlJeUQzVGgyaG1tR0k3WGM1cUZJN2NOYjc3RFk2c3NVRkI5endDTksv?=
 =?utf-8?B?U2VmdU8wV1lyMzhmZ21lMExNWExtRHYyMzNxZUhFQzBramlpWnp5ZlJTUlZX?=
 =?utf-8?B?SzVJY2NYTkhnTGV3SlZhaVl2SkdTc2txZThTdnRhLzJRcThxK1Z3SlU3MUdV?=
 =?utf-8?B?NXJzWnJVWlp0amVEWlE0bll0RDhWQ2xKM0RsdVNDU212NW5RQ1F0eS9QLzhs?=
 =?utf-8?B?V3hwUlRBanJ3Wm0vbFNTcjZsYUJWaWQzak1OTHFQeW1qSTdIdE5ZSG9lT1VN?=
 =?utf-8?B?dEkzNVBoOHRaUklxUDl6aTREc3dPVE9raUwwRFBVQXFFZno1TEhtSWo3Q1l0?=
 =?utf-8?B?SUxWcHQyOXA2S3dqQysweVYxKy83NlozWmlZNEFmY1VYbmsxSmpWN0xUVjhG?=
 =?utf-8?B?VWg1elRQalhxR3QyQjd2V2pUWGVGVWJ2ek1TUGF1aEpXaEZPZndvSXduYUZE?=
 =?utf-8?B?NGRPOUx6UG85bGZUTjREeEtKd2cwNFdxNG9XUDE0cU9YRzdvWWtGTExIaVZK?=
 =?utf-8?B?UFRjd21pZnpsbXg1Y0xNZG5qL0g0YmlGMEU4ZS8rQ3doL2p0RDRGMnZqQ0l0?=
 =?utf-8?B?K0MxLytVM1N1VDRnSzlMc0RDU3c2c281RnhXQ0ZlMVFzaGZuWjhTbXVBK0Ex?=
 =?utf-8?B?V2RET0JXZlpNdDJnUE9HK25OaGpmZjROVWZLQW9JaGw2UzBkdGlndFA3clRN?=
 =?utf-8?B?dlNSMkRQWkk4eVRYSUttenJwYTh6U21KWG9xUnd5bW1tK1JqUUwxOERyYVlu?=
 =?utf-8?B?VWpETE8zTEhndTNlcWtKQVh6K3ZWNTEzOFc1dUFiQkR0a0ZzQW80RTFBYkNE?=
 =?utf-8?B?aVZiZm02dEFkcjcyTk1LUlF0eitvam5SUytLdGZvQXlCV0M0bGlyUlBjc3k1?=
 =?utf-8?B?UGdBZ2tSQlBYVCtDT3NlTThKeXRublpsVHFtUzN2dlVZVVhOd2xzQmdJa0ky?=
 =?utf-8?B?amtuU1grYWcwckxYK3I3STNDbFFZYVMzbjRVazZLdFI3dXdCaEdSbGF0N21M?=
 =?utf-8?B?QVJUMGR1UkNJbHJUaUZtYkZmRVlSOTBSZy9KZGFOUk03elplWGxkYitMdk1s?=
 =?utf-8?B?QU9mM3MxVUxoR2orbld0WEUvNHNYNzNWajRXOWV1N05XV0RhaFNwUFA1TW1O?=
 =?utf-8?B?WlM2WUV2ZW5JeW1QMGJIYzFZMGpuSjA5YStjSGVsNm5TZUxIZ3lTZDRMd3R4?=
 =?utf-8?B?djFDRTFmTmV2VU5EeTJ0cHpRQWNHNnlMa1NvTUtUYUVJbmJTZ0dyaUxkRnFZ?=
 =?utf-8?B?VTZEaHFXMG1IMjdmZ3FaL1o4UXdzQkxiRkRKZFkxN0o1RUhTVFlZak1GN2dH?=
 =?utf-8?B?MjU2YS9QUTVQMmRJQzloS2NoSDNpTldUQ0JkWHNrVE03N2o5d1Z2QnlSR2lv?=
 =?utf-8?B?QzZIQ0lrR3pBMlcvenFnekFKeVhoalowajhyTVFoOUxkS2dqYkp1NUZENlhS?=
 =?utf-8?B?cEFKOHl1V21DMXo3VGZFMldBcUMwS0xreXFvaFliV1F2YUF5bmhuTDJzM2Rt?=
 =?utf-8?B?SzBJeGlIa2s3Wm9KSWZ1Vi90R0IrejdPMlhNY1VpNEVXc1lqYWNXdnBrZGg4?=
 =?utf-8?B?bm1CSW1tZkR3NTFNcGRRQS9LOE42eWVRVFJ2U0FucnhuakE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm95WTBXU29vRlhEd3oyT216Y29OVkd6YWFSQVZaamlYajdCRlR6bjhGbmVs?=
 =?utf-8?B?alRNNy9kdHBwUkJYemhwYzRuZFNOZjI2andLM2NCQlllRnZmZk5Ja2dnazRY?=
 =?utf-8?B?S1daQVBiKzh0Q2dWdFVLSzJlRE00OCttYmF1elZYMGl2ZENtbDN6R2VSU1F2?=
 =?utf-8?B?bEF1Sm53YUZteFhEOUowZGdJNzBpOVBhQVVjSllQKy80em4rczVjdG9xZ1Mr?=
 =?utf-8?B?dzQ0azcycndsVkJad3dsMS9jeVRncjRyZlIxL3RsUlJFaGNZVUhkUFcwVndE?=
 =?utf-8?B?Q1Bac2N4Tk9WY3NvS3pKSHhLV2xVUnNJZVllVy91UGg5L245OUk1TjUyOW9Y?=
 =?utf-8?B?SjhmRC9BZ1NhRzNWYThLV0dSY1ErczJhUjhFYTEvazRZanhvKzZBaU5rUCtz?=
 =?utf-8?B?TCtIb3c4VXF2UlYzblNPc1JVWXBwU3hTaXhIeUMweGxFYTV0QWpsRlA3b05H?=
 =?utf-8?B?QU5WRUNmdVhYQ3lrcGdJK1E5cUVmc3hkOWI1aG40bGw5Z3ZqRXU5RDhpMjRh?=
 =?utf-8?B?SlBqa3JpSzBUeHNzT25jSU8xRWl3amFWQWJNR1Y1SW8rd1VNdGxVV3kzUDM2?=
 =?utf-8?B?N2RGc3Q5dmFWVVM0UXhRNG5UaXU1UE9TN3JCYlVyajd4bFRYdDJwV0swQy9R?=
 =?utf-8?B?eE9iRUdsNkg3aHlOYk5uTW0yK1JUTVp3T2dpeDdTcDFmVnVCNVNvTU5XUURL?=
 =?utf-8?B?OW5NaUpGZEYyeXZXVTF6QXM0WlFzenpvZVhtNVJrbUR4RFlqL09xRi9FcGxS?=
 =?utf-8?B?d3BRTUJwV1A0d3VGNFZlOFFUTmM2eFpDcVR0emVUNVN2d3dFRXE4UDZKTWZv?=
 =?utf-8?B?MTFwWnlHVEhRaGdGdHY3NWVEejlYVUFiM05TOGcxdmN0MDVJRTh6WVhzTEEv?=
 =?utf-8?B?eEZkaStHTC9zbHBJZldHL3IvNHlYQkhhd01lTlhzTHdVNXhnNFNKcC9GMGhn?=
 =?utf-8?B?QWxhYVhOalRkYjlzbGM3d0lJeUwyTFVpOVJqR2IyTUNsc0dmODBTaEphQ0tK?=
 =?utf-8?B?ejRscEJES3hUOTFKM3luSmYwRGVsakdkTHZBV0Uza0xYS1hDbHA5QTJsNEcw?=
 =?utf-8?B?QW95dU9mdWxBMEFTeGlKN0N2Z0Z1L0FCWldrYXRjR1pCVVZ1YUZyUlRVQU80?=
 =?utf-8?B?eERLcHZId003cVBSOW5jd3J3eGlTMGFEdEhlME5waC8rdlkyTUF3b2pQMGpC?=
 =?utf-8?B?dFB1ZldSNFQ4c2JnU0RWOEdDU01lTEg3SnlXNjNWRnBTZFhVM3JMdldtY3FO?=
 =?utf-8?B?SGY2aEVoWWJxcDA0QlVUaWMzQ0NRQktmaXQ0MEpSOVk4cDdROE5IUFVvc1Yz?=
 =?utf-8?B?RnNxK3c2OEpjb3VvUXFqTWNpUEJ4bWZaUWxWWUc0V3Q1YXZYSFE4emFoTW5h?=
 =?utf-8?B?bmVkUmxCR2p4UTBrU1VMaHl4UUdFU2c4cThDZmR1bEh1N3JyMlJLV3R5ZGlF?=
 =?utf-8?B?M0kwd2FWdjVNSzlhZk05Q3ZPZUIvZEhEbm9SQWgyUnhFUCszYWJwQmVKalRh?=
 =?utf-8?B?a0RScVBBU3NRanlRdWgrU3RnTlorN1FGdkxlWUY3MnRJa3JKY2oyR29Pd25i?=
 =?utf-8?B?b01GK2xROXo3U24wdmVBeVdxTWJWQlJJNmM3MjM2ZXY1bWlyMGg3SmlWTnVr?=
 =?utf-8?B?YVJ1Z3N3ZDBZMCt4V0VaUWdaMWlja29jcVg0b0JuTTM3OVBDRTVGMnMyZnpQ?=
 =?utf-8?B?YXhTK1NjbnN1Q1hvYTZHNmt1eHRGUndTU2pubmZzd24yV3dxaU53eWlMSEdD?=
 =?utf-8?B?WkE1UE5jbEdnUVNPTXVqTGNyM2htaFdSekdJdkhtR2t0QzVXSUo5RUFtZGw1?=
 =?utf-8?B?MjVIZkdycHRCTG1zR3FxVmpWYXFzOS9rNFhJV1Roc0NscVJKY1AvRlNvT2dD?=
 =?utf-8?B?bVl5cldzSFVGNEY1VUJLS2ZJL0dQM3pHVGU3b2MraWsvd0o1WmFoT3dPQURi?=
 =?utf-8?B?bWUwdVVrWnBtQnFpbFEwQU9qWWpBcWpyc1VVY29RUTNuNnRVQ1JmbktUaUc2?=
 =?utf-8?B?OGhBTlJpYUhYQUU3bDUxSTBCN2JRalJuSzJVYWp5Zyt5VEJ4OC9hMWhIY3Jz?=
 =?utf-8?B?akFyVGhrMXhCMElwZ29JR29LMWpqSkNRV3NHczhuZmREVlZ0NDBaZlpPaytC?=
 =?utf-8?Q?YnmgAlN/55lGhIqxkdL+LveEu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca50dbaf-7df3-49a3-b4cd-08dcace9404e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2024 20:34:58.5950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zbt74+DjT/DEBDcujMbHQbCkP9OYcOlerYiMigTUyF8wi3h6HVa8PcYs+uaJOPG0IXbL41Nd+X/wriEoKBN8qxAnQ5ScmiC1IK9zp+adyNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6884
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhhbmcsIENhcmwgPGNh
cmwuemhhbmdAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjQsIDIwMjQgNzox
MiBQTQ0KPiBUbzogTWlzaHJhLCBQYWxsYXZpIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+OyBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFJvcGVyLCBNYXR0aGV3IEQgPG1h
dHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBTb3V6YSwgSm9zZQ0KPiA8am9zZS5zb3V6YUBpbnRl
bC5jb20+OyBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBSRTogW0ludGVsLXhlXSBbUEFUQ0ggdjRdIGRybS94ZS94ZTI6IEVuYWJsZSBQcmlv
cml0eSBNZW0gUmVhZA0KPiANCj4gSGkgUGFsbGF2aSwNCj4gQWNjb3JkaW5nIG91ciBkaXNjdXNz
aW9uLCBhbmQgIHRoaXMgZmVhdHVyZSBvbmx5IGF2YWlsYWJsZSB3aXRoIFJDUywgQ0NTIGFuZA0K
PiBCQ1MgLCBzdXBwb3NlIHdlIGNvdWxkIHJlbW92ZSBtZWRpYSAgcmVsYXRlZCBjb2RlPw0KDQpK
dXN0IHNlbnQgb3V0IHRoZSBsYXRlc3QgdmVyc2lvbiB3aXRoIHRoZSBjaGFuZ2UgYXMgcGVyIGxh
dGVzdCB1cGRhdGUgZnJvbSBIVyB0ZWFtLg0KDQpUaGFua3MsDQpQYWxsYXZpDQo+IA0KPiBUaGFu
a3MNCj4gQ2FybA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IE1pc2hyYSwgUGFsbGF2aSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAyNCwgMjAyNCA3OjMyIEFNDQo+ID4gVG86IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJA
aW50ZWwuY29tPjsgU291emEsIEpvc2UNCj4gPiA8am9zZS5zb3V6YUBpbnRlbC5jb20+OyBaaGFu
ZywgQ2FybCA8Y2FybC56aGFuZ0BpbnRlbC5jb20+OyBDYXZpdHQsDQo+ID4gSm9uYXRoYW4gPGpv
bmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBNaXNocmEsIFBhbGxhdmkNCj4gPiA8cGFsbGF2aS5t
aXNocmFAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtJbnRlbC14ZV0gW1BBVENIIHY0XSBkcm0v
eGUveGUyOiBFbmFibGUgUHJpb3JpdHkgTWVtIFJlYWQNCj4gPg0KPiA+IEVuYWJsZSBmZWF0dXJl
IHRvIGFsbG93IG1lbW9yeSByZWFkcyB0byB0YWtlIGEgcHJpb3JpdHkgbWVtb3J5IHBhdGguDQo+
ID4gVGhpcyB3aWxsIHJlZHVjZSBsYXRlbmN5IG9uIHRoZSByZWFkIHBhdGgsIGJ1dCBtYXkgaW50
cm9kdWNlIHJlYWQNCj4gPiBhZnRlciB3cml0ZQ0KPiA+IChSQVcpIGhhemFyZHMgYXMgcmVhZCBh
bmQgd3JpdGVzIHdpbGwgbm8gbG9uZ2VyIGJlIG9yZGVyZWQuDQo+ID4NCj4gPiBUbyBhdm9pZCBS
QVcgaGF6YXJkcywgU1cgY2FuIHVzZSB0aGUgTUlfTUVNX0ZFTkNFIGNvbW1hbmQgb3IgYW55DQo+
IG90aGVyDQo+ID4gTUkgY29tbWFuZCB0aGF0IGdlbmVyYXRlcyBub24gcG9zdGVkIG1lbW9yeSB3
cml0ZXMuICBUaGlzIHdpbGwgZW5zdXJlDQo+ID4gZGF0YSBpcyBjb2hlcmVudCBpbiBtZW1vcnkg
cHJpb3IgdG8gZXhlY3V0aW9uIG9mIGNvbW1hbmRzIHdoaWNoIHJlYWQNCj4gPiBkYXRhIGZyb20g
bWVtb3J5Lg0KPiA+DQo+ID4gTm8gcGF0dGVybiBpZGVudGlmaWVkIGluIEtNRCB0aGF0IGNvdWxk
IGxlYWQgdG8gYSBoYXphcmQuDQo+ID4NCj4gPiB2MjogTW9kaWZ5IGNvbW1pdCBtZXNzYWdlLCBl
bmFibGUgcHJpb3JpdHkgbWVtIHJlYWQgZmVhdHVyZSBmb3IgbWVkaWEsDQo+ID4gbW9kaWZ5IHZl
cnNpb24gcmFuZ2UsIG1vZGlmeSBic3BlYyBkZXRhaWwgKE1hdHQgUm9wZXIpDQo+ID4NCj4gPiB2
MzogUmViYXNlLCBmaXggY3JhbXBlZCBsaW5lLXdyYXBwaW5nIChqY2F2aXR0KQ0KPiA+DQo+ID4g
djQ6IFJlYmFzZQ0KPiA+DQo+ID4gQnNwZWM6IDYwMjk4LCA2MDIzNywgNjAxODcsIDYwMTg4DQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYWxsYXZpIE1pc2hyYSA8cGFsbGF2aS5taXNocmFAaW50
ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50
ZWwuY29tPg0KPiA+IEFja2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NCj4gPiBBY2tlZC1ieTogQ2FybCBaaGFuZyA8Y2FybC56aGFuZ0BpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdz
LmggfCAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYyAgICAgICAg
fCAxMSArKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVf
cmVncy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oDQo+
ID4gaW5kZXggYzM4ZGIyYTc0NjE0Li44MWI3MTkwMzY3NWUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3JlZ3MuaA0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgNCj4gPiBAQCAtMTA0LDYgKzEwNCw3IEBA
DQo+ID4gICNkZWZpbmUgQ1NGRV9DSElDS0VOMShiYXNlKQkJCVhFX1JFRygoYmFzZSkgKw0KPiAw
eGQ0LA0KPiA+IFhFX1JFR19PUFRJT05fTUFTS0VEKQ0KPiA+ICAjZGVmaW5lICAgR0hXU1BfQ1NC
X1JFUE9SVF9ESVMJCQlSRUdfQklUKDE1KQ0KPiA+ICAjZGVmaW5lICAgUFBIV1NQX0NTQl9BTkRf
VElNRVNUQU1QX1JFUE9SVF9ESVMJUkVHX0JJVCgxNCkNCj4gPiArI2RlZmluZSAgIENTX1BSSU9S
SVRZX01FTV9SRUFECQkJUkVHX0JJVCg3KQ0KPiA+DQo+ID4gICNkZWZpbmUgRkZfU0xJQ0VfQ1Nf
Q0hJQ0tFTjEoYmFzZSkJCVhFX1JFRygoYmFzZSkgKw0KPiAweGUwLA0KPiA+IFhFX1JFR19PUFRJ
T05fTUFTS0VEKQ0KPiA+ICAjZGVmaW5lICAgRkZTQ19QRVJDVFhfUFJFRU1QVF9DVFJMCQlSRUdf
QklUKDE0KQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5l
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiA+IGluZGV4IDA3
ZWQ5ZmQyOGYxOS4uNTQ4M2RlYWFiMWJkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9od19lbmdpbmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19l
bmdpbmUuYw0KPiA+IEBAIC00MjUsNiArNDI1LDE3IEBAIGh3X2VuZ2luZV9zZXR1cF9kZWZhdWx0
X3N0YXRlKHN0cnVjdA0KPiA+IHhlX2h3X2VuZ2luZSAqaHdlKQ0KPiA+ICAJCQkJCSAgIDB4QSwN
Cj4gPg0KPiA+IFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVfQkFTRSkpKQ0KPiA+ICAJCX0sDQo+
ID4gKwkJLyogRW5hYmxlIFByaW9yaXR5IE1lbSBSZWFkICovDQo+ID4gKwkJeyBYRV9SVFBfTkFN
RSgiUHJpb3JpdHlfTWVtX1JlYWQiKSwNCj4gPiArCQkgIFhFX1JUUF9SVUxFUyhHUkFQSElDU19W
RVJTSU9OX1JBTkdFKDIwMDEsDQo+ID4gWEVfUlRQX0VORF9WRVJTSU9OX1VOREVGSU5FRCkpLA0K
PiA+ICsJCSAgWEVfUlRQX0FDVElPTlMoU0VUKENTRkVfQ0hJQ0tFTjEoMCksDQo+ID4gQ1NfUFJJ
T1JJVFlfTUVNX1JFQUQsDQo+ID4gKwkJCQkgICAgIFhFX1JUUF9BQ1RJT05fRkxBRyhFTkdJTkVf
QkFTRSkpKQ0KPiA+ICsJCX0sDQo+ID4gKwkJeyBYRV9SVFBfTkFNRSgiUHJpb3JpdHlfTWVtX1Jl
YWRfRm9yX01lZGlhIiksDQo+ID4gKwkJICBYRV9SVFBfUlVMRVMoTUVESUFfVkVSU0lPTl9SQU5H
RSgxMzAxLA0KPiA+IFhFX1JUUF9FTkRfVkVSU0lPTl9VTkRFRklORUQpKSwNCj4gPiArCQkgIFhF
X1JUUF9BQ1RJT05TKFNFVChDU0ZFX0NISUNLRU4xKDApLA0KPiA+IENTX1BSSU9SSVRZX01FTV9S
RUFELA0KPiA+ICsJCQkJICAgICBYRV9SVFBfQUNUSU9OX0ZMQUcoRU5HSU5FX0JBU0UpKSkNCj4g
PiArCQl9LA0KPiA+ICAJCXt9DQo+ID4gIAl9Ow0KPiA+DQo+ID4gLS0NCj4gPiAyLjI1LjENCg0K
