Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A03C5AE59
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97B010E8DA;
	Wed,  4 Jun 2025 00:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYY9P2Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775110E752
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 00:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748995767; x=1780531767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vN00Qv1Hel7K9JhQ4Se+WhlqkVYaGJy9l8jbRg0VP1o=;
 b=UYY9P2Y13FJ6SpaDHzlWohZNYQDkwoz/4octrfbkzq5HB3LhZkchtdLr
 N2lM0BPIpXiuTbkGWPlop1PViNj4OkUCfuq3kM3uQ7zWUTF55ss0RofLK
 es7Lt0U7q2oTp63Mk8dvMb6Ue+xx2Ni0UtokxUbL+k7p96cnsjApXORvq
 yeNpF9mBHj7EGOCB1dejQKKtpJ1L0x7Y+jMH9oexu1pC5UExpHH2MWLMC
 Fy8t5fnvU9vQquqZNdmw47Ro36MpFKqdv39AFNmVBouStLNIitZP75G4P
 1hmwL9YrljdXrQiN+059GeGgsTGYuzY6NLVhM1qGJGvR0znOCBAZP+a0s A==;
X-CSE-ConnectionGUID: YcZcZ8zLQLqWACwo3IGoYQ==
X-CSE-MsgGUID: QelXWI+aQmWKuHaEpmU8PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51202308"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="51202308"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:09:19 -0700
X-CSE-ConnectionGUID: GdzTq45qQ/SgtRd5LM99Mg==
X-CSE-MsgGUID: tccd3wJ5RYWGIzcjzwl7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145989595"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:09:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 17:09:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 17:09:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.69) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 17:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnyN8nHSG/ZAwoBZgXoPLZaqWKRXwoRxQfy+2PETrNnw82z8zdmLBFAdZrObswR4saoXGWmu/JhJMLG+TvSxjRmrAjz3/9aTvOTXtB8j8cqTBnQXaihe0SekLEvzymUd9yNEX5EGSUj4xLueVBwl7tOqKAmdsK6hpBune0L92wFWc2uXj7cONTY9dMstu6CwmhQjU/pAZqkaKrHrbSkJ+QwTiEQvCzWZVaNxeBHrb7KHlRCcouABFUR7LNkt3PydL+zthKMjvwSmplwWUYfrBPgpyom6lLgeGOStXltO5tDI0Aw9d5LQlRyjlFoRMUU0pWW8Xqq75raNUQN3Ffhxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN00Qv1Hel7K9JhQ4Se+WhlqkVYaGJy9l8jbRg0VP1o=;
 b=hJiGlQGZDvyBYAhkQ/xXCtSkC4pX0SISWwZLoUaT6vlSC+El7Q8pxXMW2JfSXC+YSc1d6IVyTd8w6rGvvXqSlskwbfePf3GosTk/bIwEsGzfHJpnWJZv2f24qz5NqsuVE1erCZeAswzEm21v+j/7ZyURTd0QbRn9ttUb6khagwmkcZf8PTiOZCCclnNnIHFOKJNHDogEHT5hExm3zyybcb8Dhjl7QW40u6oCKGLyON+D7bO+bTro6WbvM1nwqX26PARP7XVPWZzuDClWeRKQFscv2ZoAMevtVK1ROVrhSTMlQnstq1osQxKa/fuQnP48MSPFR/IrSeQ+XkGVdGJ+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Wed, 4 Jun 2025 00:09:16 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 00:09:16 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/guc: Ignore GuC CT errors when wedged
Thread-Topic: [PATCH v3 2/4] drm/xe/guc: Ignore GuC CT errors when wedged
Thread-Index: AQHb1BirND0BJv+nx0Gmz3at3lBeRrPxs3MAgAAS/QCAAFstAA==
Date: Wed, 4 Jun 2025 00:09:16 +0000
Message-ID: <f8e661c8811bb0ccf911c197d2fcf8ca86463f26.camel@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-3-vinay.belgaumkar@intel.com>
 <11b5e74326ea99b8d809e5018621bbbf3383b6df.camel@intel.com>
 <5f735205-387b-4a60-91ff-757747b4275a@intel.com>
In-Reply-To: <5f735205-387b-4a60-91ff-757747b4275a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA0PR11MB7356:EE_
x-ms-office365-filtering-correlation-id: 8bb6ea1d-b705-486d-7a85-08dda2fc0b87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QTIxaExSOU9INkZUZ2E2Zlo5ZkovQytqSTU5ZXZkSWVPQVNLQVFNdzVsaE1B?=
 =?utf-8?B?YnQvUVBueGpacFRxRzY5K2htd3RGWFhRek9HMERSbTF6VzFPRkhCOEhReEVO?=
 =?utf-8?B?Z2RaR2xxOVdyQ3BKaWFkQ3FBQTZic2NxL2tSUFJrTUllUmNKMW9nZ1JSYllY?=
 =?utf-8?B?YURmVk1xVEVxWHpkVmpjQXFzRkVRKzVSL1JEVUxjL1ZTbEFwMUhvOE9lekpS?=
 =?utf-8?B?L1RCb0E1SEpiV3ZmOFJuVWpWaWpWUHNsamhmTFlrTWRVd3BCWWp6cnBMcml0?=
 =?utf-8?B?ZjAxZ0RXYjIyQ1lHSVppcDlFNlk5MW1WWVlBektPcGdacnNGeWpBQUkxNUND?=
 =?utf-8?B?c2ZhRHprRC8yckw2QXZrYUZzNHNBazVuY3VwUDlUdS9DQU1JMlkvem05UXJ3?=
 =?utf-8?B?bWdiMUxxUHZOcnljRmt0OG5GeWpkZE9TN05vMUpac3lnNXRSN3JLMUJhN2hw?=
 =?utf-8?B?SkNQNlhRczd0UGlwUnViT3YyV3BVeTZRQU1VSDF0RVBlL1hqQ0p3dE1uSzJ4?=
 =?utf-8?B?ajk0cGJ6ZFZhci9NdjJySjZhNElvUjNTdUEwN1hPMXFuSjBoTmZwNGh6cDNl?=
 =?utf-8?B?NDlpclF2M2NldDBKeGdxL2ZCcnM3QUYyb2I2UlFKcnhMTHhHaXRsWkRzZ3pW?=
 =?utf-8?B?Nm5aeWhpWG93RWNSWHk3Sm13ZzZEYnJyeUc4aFJ1cHUxQ2RBdC9NL0xGMDlC?=
 =?utf-8?B?dGJVci9scy9obzJzUWZKN09KVGFHcVNVVWlSV3owNm1MMG9FTGpZWnorbSs5?=
 =?utf-8?B?SmVIcmdSdXRYdkJCZ3dQaGRSV3lsQmdLTW10OVl4dlFvazlONTBCRUcyVFZu?=
 =?utf-8?B?K3VKekc4L3ZJcU02OWdFclY1YStIOCtrNjNNZUJVSG9aVE5OQWRzV2VZN2xl?=
 =?utf-8?B?aGxtU0dtOVdaeXNKNHpaaDFVRnlmODF1YTFFU1IzZ0ZuUnhGMFBMMzdlV3JB?=
 =?utf-8?B?NmU5RXRjOGFFTGhYbC9hVXlqNXNHc2xSa2xmVzFzQzdLaTZtVnh6aFhvUkdM?=
 =?utf-8?B?THZxTWZWNG5DcWxzbzVhZmxiZVJOeGlqckRmd2gzM0UxTldnS2FOUVh4UHpa?=
 =?utf-8?B?ZDlTT04xcS9sOFNpYzBlV2NpcFpibmZTMk5wZTJQV0NUTlMvUENDRUk3MFVP?=
 =?utf-8?B?OSsyTXJ5UWhsRWVRb01LZ1A1N2lvUzY3TDVQQVJPTDg3S0luQzl6WDFqV05k?=
 =?utf-8?B?QlBXMTVQZDhiOGRHSUlwTXI0QzBXaWlwL2l6aGJDRVFTR2tpeE5haHd4c201?=
 =?utf-8?B?cFdSdVVjaTdNM09BRWZrcjJoYkNsRHRQMWhEWnNUVm9wNEtBcXF0QWtDaGRn?=
 =?utf-8?B?VHFxWFJudmJtVjBON2g5RUpxbm8yTDEzM2NYdStyWmhRUlp1WTNlRmxxZDdY?=
 =?utf-8?B?cDlGakRRcnkzYno2K0ljQWxSYW05Y0s1RHQ1Mitscm5xT3JmRHc0TXlxVkpL?=
 =?utf-8?B?SUZvcTZCelBWZTFTeGxRSXJlWDRHYmdQNit2R0ZPK0tFR09TZzVzanZESE5i?=
 =?utf-8?B?V3g3WXhWUnppNXpiNXZVSElHUjcrTS95WWp5bGxDeFlHbXIwYVNRUkh3c2JY?=
 =?utf-8?B?L3Y4ZlE4SmMvQVdPU1IvS1FqenNib2FXNzJLc1ErSk1HQ0dUUytmSWRtSGZ3?=
 =?utf-8?B?SENRT0QzbXhBeTAyMEVSSGJneThyeDhUeXBpTXBjZEQyRWJTUkJ2R2ZhdFc2?=
 =?utf-8?B?dWVwMytpYzh4azNwdmdWTWJMSVplUjZ0cXZhc0lkNVNPQ0lOTUtVS0cvS1Na?=
 =?utf-8?B?c2h3TGFaa3JxaHJhMFF0cVVJU3VRTEtSeFFEemdheTJtTmtKZndJYWIwSThy?=
 =?utf-8?B?ZkN4aFlSeUhCQjFuTG0yT1loalF0dUwrL2hQc2xBOFpYV1ZmVjU4dWtiVjFa?=
 =?utf-8?B?aFlDMmkwZlV3K1ZkRW9zS0kwMHVhYndGQ3NmUXVMN05JQkVxQzJybWh0eUYx?=
 =?utf-8?B?TGJqZ2Jrb2N6MVQ1UmNhNEVIUm10eDVJN2w4UlJ3Zm9ZWHBWdjVMb0U2ZHA5?=
 =?utf-8?B?OCttZXFud3pBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUFSWE51N0V5S3dzNWwrNkwvTFR0MFo4cVgrR3pKcGhGemNWeXNKUlBNQVpT?=
 =?utf-8?B?ZFk4U0x3OCtiL096UTQvbVVoVFZ0TVJBTjFuZUNJK1NYaExCeFhVakRHR01w?=
 =?utf-8?B?eXlaZHJVYXQ4ZEhmRDZXdGR4QkFXQUN2akpmTzR4V2JrU2xkaERmQ0RXdldC?=
 =?utf-8?B?N1NPeDUzSmRtcXVyUmNFTlhBekRDRlh0YTRKTEdBQURjM20yZTR0cW5pY2cy?=
 =?utf-8?B?Q29aZlVBNGRjK2EybE1oSHNHZTluNlYxM2RWSnZxRHZXTU5nUWtZdzdIR3dl?=
 =?utf-8?B?NVkzYmlNWHNIOFlXenQ5Vys2cm1Qby9qSW1YaitIL3hBaXVRaUhCZmpUUGQz?=
 =?utf-8?B?N284bTVtZGJHNW9FVkRUL3JrcDdQVmc3QSt3UGhEUVJnSUVJV2R0T1A0TXBC?=
 =?utf-8?B?YzcwS3dWbVVqeXVONUlRd3FlMFRNeHBIRDdSYXI1V2duUGtaRitwLzZmRmZy?=
 =?utf-8?B?Z2VQVGdYZEJkQUdmWHVscnc5Vzl1eFIyQ1ZnanBoaGpmZklNc1VWK3FUeEs4?=
 =?utf-8?B?UEVEYzg0M2dUclcxRjU5S0xpSE1mR1NjL0RCVnJHSEhDREdpbDNWcDVwYmY2?=
 =?utf-8?B?bFZVOVNYN1JUdmdheG5MT0dKbkprYXpXcjJwOHFreWQ4ckFXNkZGVWQ5WUFw?=
 =?utf-8?B?VUFscGtoNUE5RDFTLzBKdzM4cUVsL095VHdzRXNRZHlpTTRUcXJINC9aZVJJ?=
 =?utf-8?B?RUljZFk5VDRjUlovbmsrNThBSU5jUHNxcW0wRXV6ejVDZE11K0VaVEFkWTlN?=
 =?utf-8?B?aDQ2ZFJpK2dOYnFSUlY5S2paTTNwaHpGbXp1U1JJNWgrSUFqcEJQNWNGRFJm?=
 =?utf-8?B?dStKeGtzN1RlNUFBSURWRi9ETks0MW9WUVhBYTdxbVpoNEtZeHo3VDcvazFU?=
 =?utf-8?B?YWxhdEVYa1R0dlptOVRpOFN2T1ZRdjd0UDBqcm14cERHcHMvTnhYYlI0Nmo0?=
 =?utf-8?B?YVRnaysrOWNKTnhKL1FGcDRUdkNlNFRUOW4wVGtsYTBiclRyNTFaKzNQaWlm?=
 =?utf-8?B?ZXF0SUptRVhKenZrVU9OWEVEdjBxbHpON3gxR1BJOXcvUk4yMlFLMUwrUEhT?=
 =?utf-8?B?UXdIc0VoMzFqMUxoMFh2RjA3WURXVG1WOVhLdHBtM0Z4UEErc1p2NDlkWHNQ?=
 =?utf-8?B?bjd6dmtPclNCUTlJK2RpYU1iMTdBOGtHTnZkMTNUOEZHVUgyeXZONG92U0l0?=
 =?utf-8?B?QUo4STQvc2lDM3FaMnZmcFM0L0VoZzFFNFVmVmdDSlY4UmRYczdxNWE0c3pv?=
 =?utf-8?B?eTdlYTFXdDdrVHdkN2xDbDVEQm0zYlhURW1NM1dkTytZbXczbGx2aXlEWXFq?=
 =?utf-8?B?bGJEVVQ3eGZPM0xnNEVMSWVtVjVSd1V6QlJxRGZ1bGNLdytUYmdic3BEVWhE?=
 =?utf-8?B?cFVHM3FqL0pRZUo5YlF5RkJkaFFKM2QyVWsyZjJxdVcwL21pOGZIaHlCUFZV?=
 =?utf-8?B?MitDbkJPN0J1d2dkMlFUQUhwUFNnbFo5QUJZRkFuRDZGNnpxZkxhZjFTbzFS?=
 =?utf-8?B?MmhTd251Q042S3crUThFSU5nS3c4THBFbmZseGZOOFlFdkF5WVphTzVXY2N2?=
 =?utf-8?B?cUxmUlhwOG5ZcXZyQkdUNVFKSDNFLzZ5SllqcXRuNGVZbHdrMngveFFQRmRZ?=
 =?utf-8?B?UzZrME02S1lDOHIwbUVNdlROdVlrNHFEV0NXWVhRR2ZNbWpPYjB0Slp6UTRD?=
 =?utf-8?B?ZzU1OVMxdU5hQzR0WXJNVnJqMVBJdXR4VjJQUUVSa2FPUHJHZ2Z1NWJubE1n?=
 =?utf-8?B?RGE0UGFHNm1lRk9nVk9CbWt3cjU4SzdLREREOXFzdURXZHFLd3lGV1V6MEJU?=
 =?utf-8?B?S09TMkJESUxMMXZyN0pyelMvQjAwVHljbTMxSHl5bjkyQm5TLzdWaUlXM0hw?=
 =?utf-8?B?RFJRRmV6N1J5SmNqZXV3N0t3NmdEdVMva29CaG11dlJZTnpOWjZnTTVDYm1v?=
 =?utf-8?B?UzN5NjRlZ2NJTjZjNFltTkFoWUZjZEFGTklFOS80RW5vZjVxcXpKdlpHbk5y?=
 =?utf-8?B?VStzUlV3WG5nUVVMeGgxMTRDeE1CLzREM1AxLzRzYThneXQycVZxVFhlRUZ2?=
 =?utf-8?B?N0pIMk5OMmpITlVLZWIrYUM4aDhBNllEMUpWN01lN2g3ckhZa1ViMTJvalBv?=
 =?utf-8?B?ZVdnWmFqVlVIcGtiRzBnc0RlaHc3WTVhRkRnOEEwbEtpMlovQzJJU1UyTmRN?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <070CF659D7E3D74090BC2EF8E51561F8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb6ea1d-b705-486d-7a85-08dda2fc0b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 00:09:16.4826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaJ39GJIHILJdZMzbEXcDPZll8TEGkqiPVzlafiXOfsoa4LapqUrPiu+1W21tMKRvcaOeGk0iXUpAxQ8r1lZa+fyuL788XhMZNiAHS1n8eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDExOjQyIC0wNzAwLCBCZWxnYXVta2FyLCBWaW5heSB3cm90
ZToKPiAKPiBPbiA2LzMvMjAyNSAxMDozNCBBTSwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOgo+ID4g
T24gTW9uLCAyMDI1LTA2LTAyIGF0IDE2OjQ0IC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Ogo+ID4gPiBNZXNzYWdpbmcgdG8gR3VDIG1heSBnZXQgY2FuY2VsZWQgd2hlbiBkZXZpY2UgaXMg
d2VkZ2VkLiBEb24ndAo+ID4gPiBmbGFnIHRoaXMgYXMgYW4gZXJyb3IgaW4geGVfZ3VjX3BjIGNv
ZGUuCj4gPiBTbyBpZiB3ZSdyZSB3ZWRnZWQgYWxyZWFkeSB3ZSBhcmUgYWxyZWFkeSBpbiBhbiBl
cnJvciBzdGF0ZSByaWdodD8KPiA+IEkKPiA+IGNhbiB1bmRlcnN0YW5kIGZsYWdnaW5nIGFkZGl0
aW9uYWwgZXJyb3JzIG1heWJlIGdpdmVzIGEgZmFsc2UKPiA+IG5lZ2F0aXZlLAo+ID4gb3IgcmF0
aGVyIHdvdWxkIHByb21wdCB1cyB0byBsb29rIGF0IHRoZSBlYXJsaWVyIGVycm9ycyB0byBtYWtl
Cj4gPiBzdXJlCj4gPiB0aGVzZSBhcmVuJ3QganVzdCBjYXNjYWRpbmcsIGJ1dCBkbyB3ZSByZWFs
bHkgbmVlZCB0byBjaGVjayBmb3IKPiA+IHRoaXM/Cj4gCj4gWWVzLCB0byBhdm9pZCBmbGFzZSBD
SSBlcnJvcnMuIFRoaXMgd2FzIGFjdHVhbGx5IGZvciBhIENJIGZhaWx1cmUKPiBzZWVuIAo+IGlu
IHRoZSBwcmV2aW91cyBwYXRjaC4KCkkgZmVlbCBsaWtlIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2
ZSBhIG1vcmUgZ2VuZXJpYyBpbnRlcmZhY2UgaGVyZSwKbWF5YmUgZXZlbiBqdXN0IHhlX2Rldmlj
ZV9hbHJlYWR5X3dlZGdlZCgpIHRoYXQgY2hlY2tzIHdoYXQgeW91IGhhdmUuCkJ1dCB0aGUgY29k
ZSB5b3UgaGF2ZSBkb2VzIHdoYXQgaXQgc2F5cyBhbmQgdGhlIHNlcXVlbmNlIG1ha2VzIHNlbnNl
IHRvCm1lLgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRl
bC5jb20+Cgo+IAo+IFRoYW5rcywKPiAKPiBWaW5heS4KPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4g
U3R1YXJ0Cj4gPiAKPiA+ID4gQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2Vy
YW9sb3NwdXJpb0BpbnRlbC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmF5IEJlbGdhdW1r
YXIgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYyB8IDEwICsrKysrLS0tLS0KPiA+ID4gwqDCoDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jCj4gPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jCj4gPiA+IGluZGV4IGNiMDU2MzQ5NGZjYy4uNzkzZGYz
NDg2ZDFmIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jCj4gPiA+IEBAIC0xNTQs
NyArMTU0LDcgQEAgc3RhdGljIGludCBwY19hY3Rpb25fcmVzZXQoc3RydWN0IHhlX2d1Y19wYwo+
ID4gPiAqcGMpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gPiA+IMKgIAo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfY3Rfc2VuZChjdCwgYWN0aW9uLCBBUlJB
WV9TSVpFKGFjdGlvbiksIDAsCj4gPiA+IDApOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAocmV0
KQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0ICYmICEoeGVfZGV2aWNlX3dlZGdlZChwY190
b194ZShwYykpICYmIHJldCA9PSAtCj4gPiA+IEVDQU5DRUxFRCkpCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9lcnIocGNfdG9fZ3QocGMpLCAiR3VDIFBDIHJl
c2V0IGZhaWxlZDoKPiA+ID4gJXBlXG4iLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVSUl9QVFIocmV0KSk7Cj4gPiA+IMKgIAo+ID4g
PiBAQCAtMTc4LDcgKzE3OCw3IEBAIHN0YXRpYyBpbnQgcGNfYWN0aW9uX3F1ZXJ5X3Rhc2tfc3Rh
dGUoc3RydWN0Cj4gPiA+IHhlX2d1Y19wYyAqcGMpCj4gPiA+IMKgIAo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqAvKiBCbG9ja2luZyBoZXJlIHRvIGVuc3VyZSB0aGUgcmVzdWx0cyBhcmUgcmVhZHkg
YmVmb3JlCj4gPiA+IHJlYWRpbmcgdGhlbSAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqByZXQg
PSB4ZV9ndWNfY3Rfc2VuZF9ibG9jayhjdCwgYWN0aW9uLAo+ID4gPiBBUlJBWV9TSVpFKGFjdGlv
bikpOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ID4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAocmV0ICYmICEoeGVfZGV2aWNlX3dlZGdlZChwY190b194ZShwYykpICYmIHJldCA9PSAtCj4g
PiA+IEVDQU5DRUxFRCkpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9ndF9lcnIocGNfdG9fZ3QocGMpLCAiR3VDIFBDIHF1ZXJ5IHRhc2sgc3RhdGUKPiA+ID4gZmFp
bGVkOiAlcGVcbiIsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRVJSX1BUUihyZXQpKTsKPiA+ID4gwqAgCj4gPiA+IEBAIC0yMDEsNyAr
MjAxLDcgQEAgc3RhdGljIGludCBwY19hY3Rpb25fc2V0X3BhcmFtKHN0cnVjdAo+ID4gPiB4ZV9n
dWNfcGMKPiA+ID4gKnBjLCB1OCBpZCwgdTMyIHZhbHVlKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FQUdBSU47Cj4gPiA+IMKgIAo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfY3Rfc2VuZChjdCwgYWN0aW9uLCBBUlJBWV9TSVpFKGFj
dGlvbiksIDAsCj4gPiA+IDApOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBpZiAocmV0ICYmICEoeGVfZGV2aWNlX3dlZGdlZChwY190b194ZShwYykp
ICYmIHJldCA9PSAtCj4gPiA+IEVDQU5DRUxFRCkpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB4ZV9ndF9lcnIocGNfdG9fZ3QocGMpLCAiR3VDIFBDIHNldCBwYXJhbVsl
dV09JXUKPiA+ID4gZmFpbGVkOiAlcGVcbiIsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWQsIHZhbHVlLCBFUlJfUFRSKHJldCkpOwo+
ID4gPiDCoCAKPiA+ID4gQEAgLTIyMyw3ICsyMjMsNyBAQCBzdGF0aWMgaW50IHBjX2FjdGlvbl91
bnNldF9wYXJhbShzdHJ1Y3QKPiA+ID4geGVfZ3VjX3BjCj4gPiA+ICpwYywgdTggaWQpCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVBR0FJTjsKPiA+ID4g
wqAgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19jdF9zZW5kKGN0LCBhY3Rp
b24sIEFSUkFZX1NJWkUoYWN0aW9uKSwgMCwKPiA+ID4gMCk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDC
oGlmIChyZXQpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQgJiYgISh4ZV9kZXZpY2Vfd2Vk
Z2VkKHBjX3RvX3hlKHBjKSkgJiYgcmV0ID09IC0KPiA+ID4gRUNBTkNFTEVEKSkKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2VycihwY190b19ndChwYyksICJH
dUMgUEMgdW5zZXQgcGFyYW0KPiA+ID4gZmFpbGVkOgo+ID4gPiAlcGUiLAo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVSUl9QVFIocmV0
KSk7Cj4gPiA+IMKgIAo+ID4gPiBAQCAtMjQwLDcgKzI0MCw3IEBAIHN0YXRpYyBpbnQgcGNfYWN0
aW9uX3NldHVwX2d1Y3JjKHN0cnVjdAo+ID4gPiB4ZV9ndWNfcGMKPiA+ID4gKnBjLCB1MzIgbW9k
ZSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiA+ID4gwqAgCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19jdF9zZW5kKGN0LCBhY3Rpb24sIEFSUkFZX1NJWkUo
YWN0aW9uKSwgMCwKPiA+ID4gMCk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQgJiYgISh4ZV9kZXZpY2Vfd2VkZ2VkKHBjX3RvX3hlKHBj
KSkgJiYgcmV0ID09IC0KPiA+ID4gRUNBTkNFTEVEKSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHhlX2d0X2VycihwY190b19ndChwYyksICJHdUMgUkMgZW5hYmxlIG1v
ZGU9JXUKPiA+ID4gZmFpbGVkOiAlcGVcbiIsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9kZSwgRVJSX1BUUihyZXQpKTsKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKCg==
