Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D29C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 16:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC74C10E293;
	Tue, 15 Sep 2026 16:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0PgPaix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CEB10E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789489885; x=1821025885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fBp9cBXOAFkBWtAfTF5WeOPEb5SfGKNenxn6Wny2XdE=;
 b=L0PgPaixrRrnbayu9YaNvaBS6L5W8vvnThLWGObi/ud5LZlesQmO8/sa
 7QJNWNHAkQV+DZWcUFxDsUdcAb/dsyEbyFdJZuVbvEgq5B55qGr1HfHg9
 9+6+/r9zXQ2kGSeoaEH6qMQEZYcj/bGvjxHUxJmoYTNzKcjxbe0k4bhtB
 1O9Mkwq8uTT4KkXrgmizdpSN2cu6Dm8uH0SSBpYQ4dcNJuILvpqQY9jos
 OXZD2G/8+6M+EGFcsntDSDtw5I0dbUwhTdGBVVy1yZvJJopfKAth37rRQ
 NSqkLx67sSYixDtUGZY+x2qhgflL3AfTb90dAWdOyM8S8/QS4rq8OuI/B Q==;
X-CSE-ConnectionGUID: mLru4pO+QVmEwqBfYf9Zjg==
X-CSE-MsgGUID: cmCdaD7lTqaUmPxUFLn1XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93731121"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93731121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 09:31:22 -0700
X-CSE-ConnectionGUID: XZnDZjCJS1m8DfeqEYpIqQ==
X-CSE-MsgGUID: S1SeojzTScGXwhbb6ga5pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275010719"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 09:31:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 09:31:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 09:31:21 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 09:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrLOgbFixv0TOxM4oplRBMMlxnAwnQbcyy0d8Kxz4lc/racEN5t0Il6KZQJwI8HP6qqvGLeLmZN8NxeotGBN6tWP/eC5UXtjkZZXswi464UwtjNFzkHWsIv60wSTquss8G0FjZsms/0Gim8cHaeKNq95wq75jR/5dMM4cm0l/cfFJfWWsnT9S9tdvK4jEuHVoyt5kiWSe3Ra3+qs753LeF7R4smXDPAeSrI8HNfX6YgTNSQtPazqp6sq+zmima2V7zkqtOLrIxTdnwz+De45ZKDGeuwmEBU3/XCz1iAeqT/w5I2plJI+aQc8no3eHZhA4HDx73dfPK4UJkGrX1xqYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBp9cBXOAFkBWtAfTF5WeOPEb5SfGKNenxn6Wny2XdE=;
 b=DuTRaoxte9gisnj9+8Aket2d+ewNUIo66Dh3+v5VhIG6+sMiNYOOJoZTR11FGDogCsFeZzPFv4GDG+mGnvpHsf3FVcwkEmK7GR0SLZ4RPIQkMYGgzUQp7m/aCdYAnNFJTh9GxEOXN7cMTKa0OvHvAZ56UHT66n0c8EZMFbN9TRM+PqyixmTtrTW3PQ+/pI0MO4PIzbbV+2rhl9Fmj9OQ8EQCX0OWFqvnE17vnhg3JwAGSN6DT4AMcEGyAF7ONClO6xaecVXHX6z4YT1AJUx4zQfDI2YeO/+Ln86CyDq1ekDUV9/AjwajFdPh0vFKkgYOwfyw6bZXZICVVzOv6LytFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 15 Sep
 2026 16:31:15 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 16:31:15 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Dong,
 Zhanjun" <zhanjun.dong@intel.com>, 
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
Subject: Re: [PATCH v8 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Thread-Topic: [PATCH v8 2/2] drm/xe/guc: Compress GuC log and CTB dump with
 zstd
Thread-Index: AQHdOzSCYoyFrKaEGkObpq1aSb75SbbIXVkAgAeLfQA=
Date: Tue, 15 Sep 2026 16:31:15 +0000
Message-ID: <47fca92c2790544023c85b787c1abb9028d8b485.camel@intel.com>
References: <20260902234039.885267-4-alan.previn.teres.alexis@intel.com>
 <20260902234039.885267-6-alan.previn.teres.alexis@intel.com>
 <aqMekldlWxNWQrFD@intel.com>
In-Reply-To: <aqMekldlWxNWQrFD@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|SA3PR11MB7436:EE_
x-ms-office365-filtering-correlation-id: 45a648e8-3594-4f05-e579-08df1346c362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: B5hekVh4wPViwCTEFvGEgXX3DJLEYxybJmL4NZQqMmR85FPeOlmYb8Ra2TcX0N6nRPJTB+aSiMOHVgyQ9+fNy1YtNOE/EOrIO958o3lUM0wIHPydNcAEMw6OuLfGTNYmj/v9cp5WNuJzxfBC5EESTErymPmcRlSM13OuS/PPhU2ZLE10M8oYeOlEZ7C/bFGMygtoZTljQIml746/m+LzC/Uv33/dmV8iHBMqN5D5xj0OMcdgLqdBB+BT10b8StUMm0uBFTQw2jhtO/zQ9gUbSo77+uG2J6M33aGPtucdmlD2qfH7x4nVKajv0iHg678Tb4Tbg4xjNY03EPtFXjztd4HQSvGRzZct4P//VTEqikLpP/g6bxyJ74xmKD1K2nCXCQIBnjknoLQPSg6mSgy1tXD4ti9/pUjpdyZcQIJbmFvVFVx9v5Yc24WqZOoGQ/6+YsgJ5PFhMqt40NYSbmcjrWuhgbla+ZxA8qAcQ6RbyWob6kU7BI0iirtZ/RDTi2bx3fCACCSZZXdl8PTNE/KbBskIOebZh3vaMGYOJUxYQPKPcfzx/aZleYEdMBIIEALbtMaW9Z96NFuyDI/Ve4GiXpRm/R0LFjRfi/SxJrZqDnP0xPc988++irQxrs4VGOIO1LaWEzEH6T/5ee/OIX629DYUnV4hUDvK6Gq1ZUrhW/wMuBKKgBPtJVbNFZ8Sk16H74VHGUlkev5WxqCFjN99t2hhGjU/OjCRUdJyIkDSoMM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXpyVWllSTZ0djVxQjhJR3RlYSt3UXpzdFJ0WlJHaUM4QXVJSnJ3bXJSTjdJ?=
 =?utf-8?B?aW4zYW1IL3RIdm83YlR2Nm1uSDNkOEg3cFMxc0ZTNXlWUTlNbXhmU3BKc2VB?=
 =?utf-8?B?QVZxcVFQTVhENEhwTytYSEZ0a2IxWDlTM0d5OGRKS29QVFVqK0RwOGpsNXlK?=
 =?utf-8?B?SVJua3l6WXlzRFpCekdLSW9KQStRc2NLd3VkUjZFa0Y1WlFXanVIc3RsT2Jm?=
 =?utf-8?B?SDVtNHhMbTNFOXcza2FlR3A5dENxZkUyYkhsWEV6UEI2WE5MZDliMVdyL1dj?=
 =?utf-8?B?QThadDVEcU03anJRUFhtVmFDRXE1Tll1NU5waUY5N0NXeXlIdzVIL1FXeWp1?=
 =?utf-8?B?VklQVVNWZDhPSU1nTUhnOGUzYWtmSWY0RkRoQzZWNzJoWVVPdjFFTXJwcVVN?=
 =?utf-8?B?M1lQQ0Nlazg5TzdtRjRLdEpjVmFnRGV3TmdHNFJ5NEF1K2wyY1FjczVHRFZw?=
 =?utf-8?B?SHdUZi9DWXV6SkJrY0dOZDNaNkt6Q2xqQjc4cjBMSktKWjZvOWlhT04yTUlL?=
 =?utf-8?B?VHpwQnE3T3JvS0N3VkRXK3UyQlozbzBER2c1c2s3aU5UOTRhQVU0ZzZ6SGZU?=
 =?utf-8?B?RDdrK0dWMEhKcng2aXlHdmNNZUE2RjJXL2pLUWQ5N1VPdzlxM3gxYVFqaEIx?=
 =?utf-8?B?RTh6R2FxeXlBZE1SUFRUMEdIcFgyNm13elZEZU1iS3RKbU5jczVGcXhDTUdJ?=
 =?utf-8?B?bnFnMnFKdi9ubFdFY1ZITEdiT2RETlhNSkZtR2FkWGxPS1BERzVZMFp0Mm9F?=
 =?utf-8?B?VWlNVnBBcXVLMFNtOHZoV08xZGhwOXZGcHAvR2poMkZwM1pjT3ovVWVaV1pu?=
 =?utf-8?B?dEFGZkdhaG5EUTV6TTlUQktNSzZvOGtFV2hFOENsZW9oYVlCYUpZaEF6R2hl?=
 =?utf-8?B?dVh5WGxNQXg2TWxFOFpoeEd3L2VaVlQ5emo3dTlMcVE5a3lFeWsxakJqWndV?=
 =?utf-8?B?QUV0M21RWk5pVnhFR05JeEhhM05wNHdTVTJEeER6c2NTT0ZqMUNtdTZubTFh?=
 =?utf-8?B?KzNMSTl0enBmUUhCZ00wSEZjSG9mNllCZmJKM1BGaDJxRHZTRm4xRWtoSjVr?=
 =?utf-8?B?N3NYL0pRZEppRHBzUndXYkxhZFp2ZUVDVFZQWUFHblVBbmFtOXFMcC9jOXoy?=
 =?utf-8?B?dTduMWR1OUR1NWJWZGt5QjhQNkRvOVFCcFFPdDJUdVRGdXl2NGNnV0hXTEhB?=
 =?utf-8?B?am9VMDIrQ2xaWXlzdUVwVENrN3FSMkNkY3hSbGtDd1NlQ0ZtK0pjeHZ0WWU3?=
 =?utf-8?B?cVQ4ZVpOemxTNC9PYkZEcHFGTUx2STFkeG0zb1ByV3pFQ1ZTUXc5WHlwbWc3?=
 =?utf-8?B?cnVPUmI0QmhneUsvMm94NXM1TnQxQ0wyQlR3ZVNXemFDa0pDYkZrNXI5d3dY?=
 =?utf-8?B?M2toT0k2Rm9haUV0YThQcEZmM0pnSm1rYTVhNjlSclZIaXBISk1pQWlzcE5u?=
 =?utf-8?B?R0xwZHdSMkdTZDRZNnl1TzIxbmRPNGhseW1YS1NFcmN2Z1MwTXBBQm5uN0Jh?=
 =?utf-8?B?aDdFakw2OW1LSXNCK3pOSnpqTjc1UkhSaVNzbk1QYW1kN0s2YjZLendPQmt4?=
 =?utf-8?B?b3lzNUN0WGVGZXlEc2YrYnRUWDhtVFQ1SDBMZzR3YWVWZmt3Zm9aMkFmSkFp?=
 =?utf-8?B?OWgrbStTZjI2UG9ML2pWZWIwSmRQb3FacFc3SjU3YzBYTDRVTkRkZE9VLzBG?=
 =?utf-8?B?Qm93MnRMMG9HSElPMkhLNkJnUFp1QXVKRWMvSFlQckJEeXNsWGVWZHAwaFE4?=
 =?utf-8?B?anIxV0c1b3ZmRTlqZ1FSeUJTTG5wZDV0ZGtwWEdDRlh0cDU5b1ozNU9oWllD?=
 =?utf-8?B?Sm9kMVNQUDh1OUhPK1lwd09PWlZaZjJtTGZYQ0VwTzdDTEV3aDZSTnBsa3Vr?=
 =?utf-8?B?SzVLVE93K29EQWFTZzUxVVc4Y25ncThTYmxJTi9YV3BsV1BZNkNnNjNRRDNl?=
 =?utf-8?B?dGlYNmtKZStLQXh3dk12N1F5QmM1N2FjNmlWemtoMlViN1JLSno4czB3V3Vi?=
 =?utf-8?B?aFVuVU5ySFBUdTZDL28yN005MmRzM2ZrZTUzdmY1cUxkcGZoQzBNaEdqaHhm?=
 =?utf-8?B?S1NrWlVWdFJFajE2VHhxK1BLejF4blRQZ1hER3F3V3pKRTExQ1BoOW91NU94?=
 =?utf-8?B?Z2wvUVE4Z0F4d3ZYN3hVcXpWYmhtS2xVc1pBQzM2WWxSYVUvTWlIcERGeVht?=
 =?utf-8?B?NURTNzA0ZVBwUUpmYzVnaXlZV1lONml6UmtSeExjU0MwemN0US9iZXM0WXhY?=
 =?utf-8?B?b0ZPR2hNeE83M1d1UjFkYis2TFU2YUt6RURxeDJwSkhwRlFvbDhDY2F6aytC?=
 =?utf-8?B?Zjl3M2R4VkZOOWRTS1MvcjJZQ0ptcjFyZFc2ZUdiUDJOT2FwVXhLYkd6U3Mv?=
 =?utf-8?Q?WujYFG/x9qmQQHrJsQn4V6XVCXmVYDdjwjW38?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <055122FD6124BF4E8C388D4DA8CAAD81@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2cJLUklczZWZoCqp5jrsmZVBmR0NibctPxuRBY8iNp1wBfZuJ95doR3EM9HnAxZExm8qA0zPA2i28aTtk7Ns4fpbQzw2guOXDtUfLWxR8FemdezIhnmcTbLyNS3VyJZd4DjkZX9dwBeHeit4Pj5ZkWZI81A5u4wA/u0tBNxp+tMU55PXOCbXhxSk1gvIfWqn3ppuAmWWZZCUJg8BAzi5c6sOlFkBtLgkzaLgu9Ok+vypyU5Zprtc+v3bQEkc9ZTgm9fSYFmexecj8r5jO6QXCS+VVEk25GxwE64bnEzj/6I4fRvNrwV+g/F4r1UUGkjfe8lpz831mHsCMT2PpUGAuQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a648e8-3594-4f05-e579-08df1346c362
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 16:31:15.6027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLL99HYyk6laG45RVuEaDHPSdPRf/wh2vNnVKlnXLLh7uMbsiRt2XgQvfo4rP2LnyJmxMinjuFOWwBFchtQVSfFRdDZ/V2HaxdI6y8nz7xG3X/RgvBzD1Ig+PDgubEBC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

T24gVGh1LCAyMDI2LTA5LTEwIGF0IDE3OjE4IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFdlZCwgU2VwIDAyLCAyMDI2IGF0IDA0OjQwOjM0UE0gLTA3MDAsIEFsYW4gUHJldmluIHdy
b3RlOg0KPiA+IEZyb206IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCj4g
PiANCj4gDQo+IFBsZWFzZSBhbHdheXMgc2lnbi1vZmYgd2hlbmV2ZXIgaGFuZGxpbmcgKHN1Ym1p
dHRpbmcgb3IgbWVyZ2luZykgYW55IGtpbmQNCj4gb2YgcGF0Y2guDQo+IA0KPiBBbHNvLCBwbGVh
c2UgbWVudGlvbiB3aGF0IHlvdSBoYXZlIGNoYW5nZWQgaW4gY29tcGFyaXNvbiB0aGUgcHJldmlv
dXMNCj4gdmVyc2lvbiBzdWJtaXR0ZWQgYnkgWmhhbmp1bi4NCj4gDQo+IFRoZSBDSSByZWFzb25p
bmcgbm93IGlzIG11Y2ggYmV0dGVyLg0KPiANCj4gQWNrZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9k
cmlnby52aXZpQGludGVsLmNvbT4NCj4gDQphbGFuOiBpIHdpbGwgYWRkIHRoZSBzaWdub2ZmIGJ1
dCBpIGFscmVhZHkgYWRkZWQgdGhlIGNoYW5nZXMgZnJvbSBwcmV2aW91cyB2ZXJzaW9uDQppbiB0
aGUgY292ZXIgbGV0dGVyLiAodGhpcyBpcyBub3QgYSBzaW5nbGUgcGF0Y2gpLiBTbyB3aWxsIG5v
dCBhZGQgZHVwbGljYXRlIHZlcnNpb24NCmNoYW5nZSBpbiB0aGUgcGF0Y2gyIGp1c3QgZm9yIHY4
LiBJIGFzc3VtZSB0aGF0cyBva2F5IHdpdGggdS4NCmFsYW46c25pcA0KDQoNCg==
