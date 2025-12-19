Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23A2D7879F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 17:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9170510F042;
	Fri, 19 Dec 2025 17:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6IzxXS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2EE10F042
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766163647; x=1797699647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ku+CRTJbhw56r/rb+F1EYb7Vb32BswLDCF2VdOiRCMQ=;
 b=A6IzxXS42YSt7oBrEdHy43xQdxP3847SKSQnPxDdDQ2v0aLrfmxPJBke
 uAUxmkg88g8bN1NF9umDd3zA2ic2+xuVMbxOTy41z5s1A4QJiMRy71IUH
 DcrOIXdYMLGoJZZ6X5ot/Rw6+Hz0/XwNstd2rC5sSJND9QFdXFz0S7zE4
 yLRh9aIloHahePAFBPgRrbRqDuxBLDhQ7fMicKyGfJO0o0Tb2XhYWULwu
 jZiDwUQVgHTuHD14JZSFPg6Lb6Tg2XPu/2PU/5bLRCjLHgfgAfaSa25Q+
 nU0JE8XWeK6hSgGGGi8c1+EbDICjt8XZD11d6f74uJ2+IaNH1rO0MLPR0 Q==;
X-CSE-ConnectionGUID: TxVjblKgSW6GRYiyF6YZ+w==
X-CSE-MsgGUID: 57yW2UPBQm6QGYWJqfTxTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="90785262"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="90785262"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 09:00:47 -0800
X-CSE-ConnectionGUID: sGEZpSURR5OsLPnRb/DASw==
X-CSE-MsgGUID: H8wdWf1rTNqRf8z3a+IbkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199739108"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 09:00:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 09:00:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 09:00:44 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 09:00:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRSDoZ/FZVqN9IhamDVh7avNicajD2Ry9Vu8j9jy57bGH+J4SmPgiexAaAAo+fpIoJjMikzihqp21fcNOFVVvJHorq4ElkimUokY7FoFr+61ok71H/WRnFNWZF8yWVW43T28v77XkSHx3DqQr/bEjO6D1RtmDK8F7hOztxl7r0TapSyJqgjSxHrLkoRMUTLhIfaWvls7WgFSaoOHKg5LiBdopJ2/z2zt/kJanmCBHpYpOwHi06+n7gk8jgWZ6k5/d7ZOZ2wSeUKvlsbFN0oziMmOi5f6+fjOOeGRCXC49ngezUfozIJknLCYIrr1SyCE41CArfbP9fGdWIbnDRauMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku+CRTJbhw56r/rb+F1EYb7Vb32BswLDCF2VdOiRCMQ=;
 b=xcWbPqpcU/w4oKj3Yd++4+cGozNNYL9bwPpWaW1ZqJVVXTSQyw9taNxTORAV3civVHKe4I+4zHJZat4UbhtPg0jeF3HBi8tExdscTI+0WxQ5J7Iy9c1IPbRyGJBogmTnmzjzR1LuXhRXoA6D+P5UVFqHSCD6FBC1BZQEDce4Oa1PgGI56eJD7tFAjqZ5FoVN93PWCad79Ck8xXLroE7PkNt9sgQtxnmiloDLU5cg5iZ6DXThJnmz/B8IJLilzUvQM8p4unA8IdwUtbQr3U8WhuPsr5CPWwgFcWk+9LjMiJ/I65xNL6gFQFFP4zMCnVcgC1nycJycCYdufLqqVd6OCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 17:00:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 17:00:36 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
Thread-Topic: [PATCH] drm/xe: select CONFIGFS_FS dependency
Thread-Index: AQHccLoiboIjqFAWB0iEUEeMQsVdiLUpIL8AgAAH+QCAAALJAIAABQUA
Date: Fri, 19 Dec 2025 17:00:36 +0000
Message-ID: <2c98afb4a0709d622ca7345b65b75690c73d1c37.camel@intel.com>
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
 <20251219163238.GN4164497@mdroper-desk1.amr.corp.intel.com>
 <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
In-Reply-To: <43529e9d-3bd4-44d5-a603-8394a7a0f049@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|MW4PR11MB5936:EE_
x-ms-office365-filtering-correlation-id: 9d255598-22d5-4e92-b773-08de3f202152
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?M2RWTE5ONEJUNWtPZnFlNTlzUzEwNUZYclF0VElmY1h1TTM4SXlmbGtTeTdv?=
 =?utf-8?B?R0hCMnNSd3JtR01BaEgyWkxxaGZGK3NIMzRiblBaY0ZKQzk4M1g1U1hHcDdW?=
 =?utf-8?B?aTg0STlRTGtkUEFKUmpxRDM0U05iNlVnWWlHWDBYRmxVYUFxZmZGSG9JMjRL?=
 =?utf-8?B?UWpjOHpKditQLzlvQ2hyRWN5N1AvZTRrVVBBNWt0c3VIUkpTbC9xS3NENmF6?=
 =?utf-8?B?MlpiaDdCOU81NWJ3YlFjSFpmTFpGd05PUzhmZnd1azE5VlN4R2VlMzZJQVIv?=
 =?utf-8?B?RE95ejJGSWZ6NkR5NXJkL2ErbEZnRmxaVGxHMUJpUENiUTVrcW1LZjhFd1VQ?=
 =?utf-8?B?cGNyeGZmUFArbGNneHhpcnZRS2VWK2taUlRLT0lLVEljWTRWbnNBSWt2QXBW?=
 =?utf-8?B?TXZLMG1kZU0xM2tyTklxcEIvVEhoYnNqNE04THU2aVI3dHRYTHRKekNuVGhQ?=
 =?utf-8?B?aVdIY0pid0QyV1hVb0dJUXVUWExHQ3VDR3lvV1puU1RPOFdrRGZLM2ZVVDVO?=
 =?utf-8?B?R1dpV0ZBYjZaTnpwaG1EanFKbmE1eVdSM3ZnTnhRTXlhdlUrRStMYU54SXdR?=
 =?utf-8?B?UzcxOUVOQjh3aXBRTHN5SmdEU1hFQzJSNW90alJCZGZMcmNwdGVyRHljb1Rx?=
 =?utf-8?B?Z1NyM3lBM0p0YUxqT1hCcDBTTEdicTJPRDVraXRlT3JtY0ZUUm94LzRYRkRh?=
 =?utf-8?B?emhBbzdJbGFlSlRIYURmTStKV0kwb3VoWkdiNjBTSVo0Mmx1L1VzUVd0Wnc2?=
 =?utf-8?B?VmtweFAvWUsvdmh3cTVtSCttTTBWM05RWCtkNVVEdy9RWVZqWkVDWnhlTG5C?=
 =?utf-8?B?REk4dHRIcVE0MXh0ZDgwdW4yejMzaDk1Y2ZwbllVTkloM0Voek8rT3A4NE1B?=
 =?utf-8?B?blZtRnVvT3Z4Tno3N2h0U2pmMW5CMFBGUGpSYkdZMmJFNXRiblRnODRKRHda?=
 =?utf-8?B?em1mQTRqT25oTDZSSm1YNWFwcG8ySXhISHZWMFBxMnBnU0ZIbVpISTBXckl4?=
 =?utf-8?B?cTBMZEZqeFQ5eXhrWlJBOThTaXlQa0ptT2Z1d2x1dlRZM3BBNzF1b2pxMkY5?=
 =?utf-8?B?Qk83cGw1RnZxSldsUVB6N1Vyb2QyQmo5MzNWQktPQU4xa3hMM21oZmhmbHYw?=
 =?utf-8?B?VSthb2dEMjNtdEw5NHNIVWcxTGRORXk0dnpvbTZTQnE5NURKMyt4OVIrSURm?=
 =?utf-8?B?TFYxSlVXdjhkUWgwa1RURCtCMkJQN1lNbmNpK0FPcWdScWFPVy95SGlLZTZY?=
 =?utf-8?B?WkJZV2d6SW02NWFYcEcwL2FKTnZvSFhmd3JROG1XVlhNTUdXQ2FTWkZCWVlp?=
 =?utf-8?B?YkxyWkUrRkRoc29jQ3BrRHovZ3VaV1g3ejQyY3Y3VVQyMk00Tk1wYUM3cS9F?=
 =?utf-8?B?TzRqVzZhbU9pOHYwR3hWaTlPYlVkMGVLbzJwUDJBSGhoa1VLQmpKa3dpRTJq?=
 =?utf-8?B?SmRCNlduSzlGOGhER01mK2E0aEVkTkg0S2Y3LzZTZ1RtNVBHRGsvWEVaN0Fy?=
 =?utf-8?B?d3RQTkFNc1AxckR6Vlo0c2c1aE9NS3ZLWjNwejFOTk1MMmttQlpCUzJUWjBR?=
 =?utf-8?B?OUZEd0s1MUYxeDZIYTQ3bUdCL0RsSTlyeG5ZR3lLOG9pYStPaGtaaVNXSFpQ?=
 =?utf-8?B?L3hmOW9CL1RacmFINFRnWjNrU2dTNTBvVU1uYTlrdUVrdXZVVUNDaEFtV0pB?=
 =?utf-8?B?ZGZ2d2RqZE81alBYQTZVNHBQSjlWRE9Ub0tsR3NUc1hFc2NySDNxempmWGZS?=
 =?utf-8?B?aFJGeGVDaDdDK2VDLzhaUC8rbExESzRCR05yUVhBbmEreG5LcXlTZEFPSHV1?=
 =?utf-8?B?MFFrTm9KUWRZa1hWcER3K1RHRzExN3lMMm1NOGtuTU9QZk43Z2FoMU1ISlcv?=
 =?utf-8?B?RWFyK3QraDdnU2puZHNLY05Lb29WR2cvUHN1bGVRa0FjOXdhcHk0UWsxSTlW?=
 =?utf-8?B?WDk4OFlSRUtFazJSRWwwTGNzZml6THNKNysvaTkwVXZTeUFvWmFweEo5aVE5?=
 =?utf-8?B?S0F2Q0RSSXNCY0R0UHdlMHZEbEkvNnVGa3ptSW9OUVJpUVlMTHhKYkxndll3?=
 =?utf-8?B?WksyVjFOQ2hiRzQ1SndlS2FyRjhNdWMwdlJCQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFNqZ0pDZkkzbk9POFplRzFZaXdIYUJjaXVIMysrdEZ2bEk5UEtkMklmaWRK?=
 =?utf-8?B?bkV6Sy9RM28zcUQwMTg5WjdoZWJZTUtyaDRMajVNS0M3V3lIVlFOZGhUWjNY?=
 =?utf-8?B?Y3BuZDZRMFd1ZCtCd2NtZ2E5bjQ2UjIyVFN2NnZmNjBCMnJDTzkySXdRbENx?=
 =?utf-8?B?d29Wb2dMb2hmck9XcHdsQ1RMc0U3RllnSGVqMGgrSHVlK2VwbzY2eFBHd3k3?=
 =?utf-8?B?NkJTSVUrV2J6SjI4VFplMXcxUUIwa21IZDM1Z2hEa3A2emJUeHVwc0RGVjB5?=
 =?utf-8?B?NTU2QkpZK3ZZVU9oV0E3aXp3UHJ5VFRLakE3SVRCbGNCTGxSTTVPeFdXRnp2?=
 =?utf-8?B?VGlLMnZISVBwZ1RKYnJBckx5NTUyRFpZaUhHcUtJMTRxUGlDR0FIS3h6eEhD?=
 =?utf-8?B?S0lCYjVHbFVkdVM5Tm1QVzVzeWQzZkhWUUtqNHRMM3dGNkFONUdhQTI1cldN?=
 =?utf-8?B?WUk0dG1KWDNtSkFOUCtzWmo3Z3lQUkI5Mm5RSzJ5bmJKWjNqWkF6YmxFVVYw?=
 =?utf-8?B?bE94d2hSb1FHbzBsOFJMVENFNlJHTGFrZ0RNQllHQnlFeUU0YWVWUDltV3R3?=
 =?utf-8?B?aGxwcGFTdGZHdkp0Lzl0cno4b1lqSWVJOW9wY05aM1pySWhxbTNCaWhCZGlh?=
 =?utf-8?B?c1N5VjR3cm56WEMyMldiekpQRTRGeThvSmdkUVo0T1djdmdYRTMwRUo0ZlhU?=
 =?utf-8?B?ZUlEUithd1pBcksvNUFYcG5RSUVhVjJ1RVUwOFk5SVJrY1Q0bjdtVWNNSDJG?=
 =?utf-8?B?VjZKV0I0dHgwT2Zic1E5K05OL0c0azUveUJDNWVwalk0VzI5azNvb3V4TDdO?=
 =?utf-8?B?SUt0dGRFUFJVUEl0MDdzTFY3dzliWmFlRzVoQS9MV3hmeFNqcmlYSlFpSW84?=
 =?utf-8?B?M1BJZ3BMM2IvdGdvKzA3bHZqYVdXOCtGL3R5ZU1ubXZuYmRtdE5iajIyaERX?=
 =?utf-8?B?L3ZTVXFIS3M2OHI4Q2tNWGJZdytwaUZNSHBsSGp0TVdCZ29jM3gxcjY3QTZO?=
 =?utf-8?B?b3VKeXdRQkpjR1l4RGlDYkkzN0ttRU9qUkNQenJQaEI3TmxqYjFwZWRUaVJP?=
 =?utf-8?B?dUZRZ0VDUE1HYTdYaXBvMm1yYjlwMEFnc3hZSVhmVlNUdENNOUVhUVdQT3ZT?=
 =?utf-8?B?U3RSQ2FmRUdRVmk0b2dHM2ViQXRXZEJVTHNlS1JpTWlETmNadEduVFZJd2VJ?=
 =?utf-8?B?ZHJkdGdMN2thYlA1bVM4QWZGTlpOditHZUwvVnlrdG9zV0lxQjhZdmVRRy9q?=
 =?utf-8?B?blhSVHFqVDNEUXBiRzlNdmpoUG5QRnFEc2pqTHNMY3pENXEvd3ZtdGhWTHNu?=
 =?utf-8?B?V1UyTmhtNHdpUURNS1N5R3pCK3FsMzFwaGw1QXI0YTlKbTc1N3YxV3NTSmFj?=
 =?utf-8?B?ay9RUE0rUFpJczZ4aFBjWjhwTXhHNEFiSnJZVnFCWUREQTlNWkpTTk5XSUg4?=
 =?utf-8?B?b3FDZmJlNitiQksvS1M2RlVFM1pPOFBFNHFTZnNDcUNZN3VlK3NPUXJmcjhr?=
 =?utf-8?B?Y3h4U2V5OHp1MkVpeE1FY2xxdUdBcklwbnlmY0FYQVZNOUZwSTE2V2tQVFpF?=
 =?utf-8?B?d3J4cnlmRGxjQlJ4VFprcVU2VEZpTmJzcDh4QjdvUjBtaWZkc0ZXRFU0Z3la?=
 =?utf-8?B?NXhTK2hlVDkvWHBRYjFZL280SFJLNXQyV1hHZmhnTkU5ZWd6MGtOY3JXbjVP?=
 =?utf-8?B?TC9ERFVCUXp6bEx4dElsZCtQelkwcGRUYzVtT0g5bk5RR1l5aDgvV29qRElr?=
 =?utf-8?B?MExyTm9pd083VVJycG5DUnZPV1dWbG1xaENTMTRJTnk0Y1NPc2t0RU9vTkxw?=
 =?utf-8?B?M0NNSEdNa3FEdHZUNDkwR3pNOWFPcGM0YzhxNWRvS1dWT01ySzg0dGEvQUMx?=
 =?utf-8?B?VDh3U0RPMm9QTHVUdXAzUFMyRnAySlN5Tk1aTExRVmFFWjBCR0V3RXh1SWM5?=
 =?utf-8?B?ZjFLOXJtVjdIRTRydTNxZ2g5bkxtZHZrbUNJRnZnRDdQZEw3TVpDOGRHRkZz?=
 =?utf-8?B?WHpNRFJCWGU5c2k2TU16dHNPMmkyMFYyU0NRQS8xaUlwZnRqWjVLWTd3YTNE?=
 =?utf-8?B?bllRSWVMSlZYUmdxMGplaEJOZDNaWXdLLytBKzY1Q2JkRk1pUmU1T3lybjJF?=
 =?utf-8?B?cDlTWVRaNkI3eElFK1BXYnFyck1zQlQ4Mlh2ME82UEJacCttVlpad2RQZmhN?=
 =?utf-8?B?NGpWOXVKMGJnOXp0akdneXMvZ1hyZFIxNjEzMkZYZjkyMW9mcU9tUmU2ejc0?=
 =?utf-8?B?VXNlWGRWcld6OXAyU0xWMDU3NFJHaEdZRkZoZjJUeGpqRnhVUzRTaUxsV0tN?=
 =?utf-8?B?NnhEQnk5WTJiRUtCbjFKZ2Y3am9XM051WnI1aklLMmtpQWVuSHBDVTFEYmJo?=
 =?utf-8?Q?AXfXBZR6gc7/9shY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9318C70F853A2C4C861C3829BD497E59@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d255598-22d5-4e92-b773-08de3f202152
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 17:00:36.3455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQjTvM6kKLZKl6D4BolYHS/LwagDi1yfKI2rdv87Qc17k2s1CWtKSqf7mYjWVMZwTPoqNjHJMD4aiOaAe8TjZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
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

T24gRnJpLCAyMDI1LTEyLTE5IGF0IDE3OjQyICswMTAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDEyLzE5LzIwMjUgNTozMiBQTSwgTWF0dCBSb3BlciB3cm90ZToNCj4g
PiBPbiBGcmksIERlYyAxOSwgMjAyNSBhdCAxMTowNDowNkFNIC0wNTAwLCBSb2RyaWdvIFZpdmkg
d3JvdGU6DQo+ID4gPiBPbiBGcmksIERlYyAxOSwgMjAyNSBhdCAwMTozNToxNFBNICswNTMwLCBS
aWFuYSBUYXVybyB3cm90ZToNCj4gPiA+ID4gWGUgZHJpdmVyIHVzZXMgY29uZmlnZnMgZnVuY3Rp
b25zIHRvIGV4cG9zZSBjb25maWd1cmF0aW9uIHRvDQo+ID4gPiA+IHVzZXJzcGFjZS4NCj4gPiA+
ID4gSWYgQ09ORklHRlNfRlMgaXMgYnVpbHQgYXMgbW9kdWxlICg9bSkgd2hlbiBYZSBpcyBidWls
dC1pbg0KPiA+ID4gPiAoPXkpLA0KPiA+ID4gPiB1bmRlZmluZWQgcmVmZXJlbmNlIGVycm9ycyBv
Y2N1ci4NCj4gPiA+IA0KPiA+ID4gUGVyaGFwcyB3ZSBkb24ndCBuZWVkwqAgdGhpcyBtaWRkbGUg
cGhyYXNlLiBPbmx5IHRoZSBmaXJzdCBhbmQgdGhlDQo+ID4gPiBsYXN0Lg0KPiA+ID4gQnV0IGFu
eXdheSwgd2UgbmVlZCB0aGUgcGF0Y2ggaW4uIEkganVzdCBwdXNoZWQgaXQuDQo+ID4gPiANCj4g
PiA+IFRoYW5rcywNCj4gPiA+IFJvZHJpZ28uDQo+ID4gPiANCj4gPiA+ID4gQWRkIHNlbGVjdCBD
T05GSUdGU19GUyB0byBlbnN1cmUgY29uZmlnZnMgaXMgYnVpbHQgYXQgbWluaW11bQ0KPiA+ID4g
PiByZXF1aXJlZA0KPiA+ID4gPiBsZXZlbC4NCj4gPiANCj4gPiBJZiB3ZSBtYWtlIHRoaXMgY2hh
bmdlLCBzaG91bGRuJ3Qgd2UgYWxzbyByZW1vdmUgYWxsIG9mIHRoZSAjaWZkZWYNCj4gPiBsb2dp
Yw0KPiA+IHdlIGhhdmUgdG8gc3VwcG9ydCBydW5uaW5nIHdpdGhvdXQgY29uZmlnZnM/DQoNCndl
bGwsIHRoaXMgY291bGQgYmUgZG9uZSBpbiBhIGZvbGxvdy11cCBwYXRjaA0KDQo+IA0KPiBidXQg
aXMgaXQgYSBnb29kIGlkZWEgdG8gYWx3YXlzIGJhY2sgc2VsZWN0IENPTkZJR0ZTID8NCg0KdGhh
dCdzIGEgZ3JlYXQgcXVlc3Rpb24uIFdlIGFyZSBtb3JlIGFuZCBtb3JlIGRlcGVuZGVudCBvbiBj
b25maWdmcw0KdG8gc2VsZWN0IG9wdGlvbnMuIEJ1dCB3ZSBzaG91bGRuJ3QgYmUgZGVwZW5kZW50
IG9uIHRoYXQgdG8gcnVuDQp3aXRoIGRlZmF1bHRzLg0KDQpCZWNhdXNlIG9mIGJvdGggY29uY2Vy
bnMgSSBqdXN0IHJlbW92ZWQgdGhlIHBhdGNoLg0KU29ycnkgZm9yIGhhdmluZyBydXNoZWQgd2l0
aCBpdC4NCg0KPiBtYXliZSB0aGUgYWN0dWFsIGZpeCBzaG91bGQgYmUgbGlrZSB0aGlzOg0KPiAN
Cj4gLXhlLSQoQ09ORklHX0NPTkZJR0ZTX0ZTKSArPSB4ZV9jb25maWdmcy5vDQo+ICsNCj4gK2lm
ZGVmIENPTkZJR19DT05GSUdGU19GUw0KPiArwqDCoMKgwqDCoMKgIHhlLXkgKz0geGVfY29uZmln
ZnMubw0KPiArZW5kaWYNCg0KSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgYWxzbyB0aGUgYmVzdCBv
cHRpb24uDQoNClBlcmhhcHMgd2Ugc2hvdWxkIGFsd2F5cyBpbmNsdWRlIHRoZSBmaWxlIGFuZCBs
ZXQgdGhlIGlmZGVmcyBpbnNpZGUgdGhlDQpjb2RlIGRlYWwgd2l0aCBpdCBwcm9wZXJseT8NCg0K
PiANCj4gDQo+ID4gDQo+ID4gDQo+ID4gTWF0dA0KPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gQ2M6
IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+ID4gPiA+IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gPiA+ID4gQ2xvc2VzOg0K
PiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUxMjE5MDgy
Ny5JZVhZajRxZy1sa3BAaW50ZWwuY29tLw0KPiA+ID4gPiBDbG9zZXM6DQo+ID4gPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTEyMTgxODU0LmhQeVRBWGM1LWxr
cEBpbnRlbC5jb20vDQo+ID4gPiA+IENsb3NlczoNCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI1MTIxOTA0MDcuQ2NVRlhYMkYtbGtwQGludGVsLmNvbS8N
Cj4gPiA+ID4gRml4ZXM6IDE2MjgwZGVkNDVmYiAoImRybS94ZTogQWRkIGNvbmZpZ2ZzIHRvIGVu
YWJsZQ0KPiA+ID4gPiBzdXJ2aXZhYmlsaXR5IG1vZGUiKQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSaWFuYSBUYXVybyA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+
ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZyB8IDEgKw0KPiA+ID4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL0tj
b25maWcNCj4gPiA+ID4gaW5kZXggNGIyODhlYjNmNWIwLi4xMDk0YzVmYzViZGYgMTAwNjQ0DQo+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnDQo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnDQo+ID4gPiA+IEBAIC00Niw2ICs0Niw3IEBAIGNvbmZp
ZyBEUk1fWEUNCj4gPiA+ID4gwqAJc2VsZWN0IFdBTlRfREVWX0NPUkVEVU1QDQo+ID4gPiA+IMKg
CXNlbGVjdCBBVVhJTElBUllfQlVTDQo+ID4gPiA+IMKgCXNlbGVjdCBSRUdNQVAgaWYgSTJDDQo+
ID4gPiA+ICsJc2VsZWN0IENPTkZJR0ZTX0ZTDQo+ID4gPiA+IMKgCWhlbHANCj4gPiA+ID4gwqAJ
wqAgRHJpdmVyIGZvciBJbnRlbCBYZTIgc2VyaWVzIEdQVXMgYW5kIGxhdGVyLg0KPiA+ID4gPiBF
eHBlcmltZW50YWwgc3VwcG9ydA0KPiA+ID4gPiDCoAnCoCBmb3IgWGUgc2VyaWVzIGlzIGFsc28g
YXZhaWxhYmxlLg0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi40Ny4xDQo+ID4gPiA+IA0KPiA+IA0K
