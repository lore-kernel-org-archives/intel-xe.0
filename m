Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14752CDD1A9
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D7910E149;
	Mon, 30 Sep 2024 19:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYCta13v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428C610E149
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727724711; x=1759260711;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=7FlmEuAwbanhiP53VPEtAjR388sVJr3wvBdLudKJc3w=;
 b=RYCta13vP6HVLjFnz4kiPy9Dut0SHfTNs4LUMxWwW0V5YqsUJX3QsMxh
 Iy+lRU4qGdZ0pi5NC0wG7m40vE9Dj1hFRF/qR6anBzAYNXrxIf90a6mVh
 x7vq47CNoSzagTaLL2sz41n7rO8/dEQWClQnrO6uxzHFIMNqs9lUQnoGU
 rPXAaMoIrJ1xO4AhuGojwMyPLVZmLTIZaaX1JzU5fYufWpDRx93h8ac0J
 CXI+RfJG60p9aJ8iyC5KhGTOhc0J3rdJdF0Df2uvMRlC0ByLp6zvn41dy
 2+XO2VNLg+I4gJXPM6ackWmVg3Pn74CRT+637yHchmkBA9u7eKBL4NPeC Q==;
X-CSE-ConnectionGUID: r0U+odpERZSui0ZMoagbkw==
X-CSE-MsgGUID: gQv3teI6SDKuCOER68q7Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44294184"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="44294184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:31:41 -0700
X-CSE-ConnectionGUID: QNKaatSxQmOYa6sXHXFgAQ==
X-CSE-MsgGUID: 0X3mkftMRnuZ6aP5AFd/nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="104235207"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 12:31:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 12:31:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 12:31:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 12:31:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 12:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qovzJjdkhgMRzZu2Kb+qRt8Et6mqpLbGeO7l0dqUIfGe6LkVmmKyao2tGzBQTgkkiWLVCES/vx6gYu82fV09IxVlT9Q5G5rKfr7pmjinXpROTg3kIckhKNN2oh6tukwOPL6hER27iZymCgOC7dHqVz9ENd3vWmEYeNYg+heINVfdM4wyOc0S67nBv7uUrKlAm89eVCsXUyrLejw5A19EQX/NsPNOMabVZA7+xn5ZpIfaPPT/VQXvCTxH4q4ozst6iWllYB/J+e79AsMw7FzuluvQkyMUDrxwkd7cVGWGQG0CwlnLK059vAgwTsmLcilXpYkVLQ5zaoQuxXvfaEA0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FlmEuAwbanhiP53VPEtAjR388sVJr3wvBdLudKJc3w=;
 b=M6QXckwLL3agCBzy88Od2G08FkXVbrPlOAtV4hy+K9cIZqXXXZpARiOqfCoR/RIHYyEwgSrjkYnkwOc3u7eRYHYXVnUJzZlcd/b3tVMuyu6u+JEejms95LobbR1q1jLBrz+4+nhasaoRJx2xOzZBXwZY68733kFLP6xEGT95y2ytAIkgh9TBU7x58qpJCR8t0+mEpxj1X0vssimXzPI1H5tzYrAZGlY97WDwsQksQqkXSkeVhMmbXNDQwoVXX9eQ/D1Au26rvM+cArzSX1c+05eZ3HTKwzN+SgL9cgsFBY5bN6yRHJA/uaslTzfTPH8B/m6NENe1Tbnm2tWHW1XZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by CH0PR11MB8142.namprd11.prod.outlook.com (2603:10b6:610:18c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 19:31:38 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede%3]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 19:31:38 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix memory leak when aborting binds
Thread-Topic: [PATCH] drm/xe: Fix memory leak when aborting binds
Thread-Index: AQHbETP8zCluuK53zkieju74bF6EH7JwvE6A
Date: Mon, 30 Sep 2024 19:31:38 +0000
Message-ID: <13a5c61ad44c3f3e51b5cf3581d11cf30b34b613.camel@intel.com>
References: <20240927232228.3255246-1-matthew.brost@intel.com>
In-Reply-To: <20240927232228.3255246-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|CH0PR11MB8142:EE_
x-ms-office365-filtering-correlation-id: a1cd8a59-ffa7-4879-4813-08dce186812b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TW13L2FhUnBORmRkQTEvcGRDRGpkWERiWU9OMy9wR0FUODlCNy80OXdZZUJu?=
 =?utf-8?B?ekNJdHBBOUl5ZlZSV2d3TnVFZTU0TENwZXNwL0l6QldqcEtVQXJBMW5jV1pK?=
 =?utf-8?B?L0tIVmxuR0F1WWZGSExReDJaQ2pxV1pPd3BTVGNoMFRwWWxGNUFZb1krb0c4?=
 =?utf-8?B?OHdHK1MwSDBQK1ZNNWZlQUFJSWEySXlYbjl6NHUvZThEQlR4NFlRUTE5NG04?=
 =?utf-8?B?Zm9zclV5alhLOXBqWkJ5THdwYzZEZlFnaTI2TDJSNU1mT2lSK2N3MllidTgw?=
 =?utf-8?B?RXFndGsxMm5PR2lKdHo0dzRjdjRiVmN3SWxqQXZyV1JGN0hadldaRHQyQXJN?=
 =?utf-8?B?ekNwaGVKQXlqQk9LenUya2p4RFFWNkRjd3QzSTNYamdkV040bnNIN1lHaVh0?=
 =?utf-8?B?Z25aSlR1V3FQdnBQVnpWSmEzQnJnSURNbEF1NTYzdFZmOU96cUdOc3lNRGJV?=
 =?utf-8?B?eTNnTGVnWUNRaGs5MUE2WGRkczRHaWhhc0poRlQwUzFaeWE2bW9KanRBTkNW?=
 =?utf-8?B?dkxyU1p6dXhYaEhSTjhIMTQrY25mVGJLZFhhQ3ZMKzJidS9uR1VlK2dTVXlD?=
 =?utf-8?B?NWZPdGJVcWZvTHJGYVdyQlhUNEZzMStzNVNCb3pQTHBXRUt6QUxVZDloQVZ4?=
 =?utf-8?B?OTRDR3htUEw4TnFXRHJUNUs1UlZYVW1oOVZKVnc3eU9xMVk5bHhxdTBwNno1?=
 =?utf-8?B?VkROZ0h2YXFIb1luTUlodHg4bk5CYm1sUjN1WGpSYkQ1V2FBMjJzeVZRY3J2?=
 =?utf-8?B?dlJKdm1YaXptNGhjbVEvZnZnR3YyL3Z6N0R6K0d0RkhJY0Q2N0V4K1YraS9Z?=
 =?utf-8?B?WmpXdnlSME96N3NCMG5mblQ0bVRMOXVtVjZJdjhmN0RjdjZuN0NwbmNhZlBo?=
 =?utf-8?B?cWtjT1J6S1hVTXBnVisrdGhzUENZYkRSdDJmZkJPZ1RydFVXTXhRU2RySzZR?=
 =?utf-8?B?cTl3MDlNT0pzQjVmZnBoOUZTT2xKbE9seFFpSEdWakFabFJLczlSbE1aYm5r?=
 =?utf-8?B?bGtwajJmVzM4V0tUbHRvNDBuTWM2Vng0bGZKQXBxWW9zUlNPM3hrZmxFcERh?=
 =?utf-8?B?OE9ONmR1Y3MzN0tqNmZJWVd4dGpUR09MVTd5VURLZHI3dFRaa253aktnQXJP?=
 =?utf-8?B?RFpmWlhEdkpUb095RllNVkk0Z01IaFo2NFB1SWVYZXU1anRnVWVuTVdXVndC?=
 =?utf-8?B?UFVhd0dzeXBNenpTdVczdXNWMDRwOXRPWWFnTkY5VmM0WGNyWmQrREFhSUVK?=
 =?utf-8?B?NW51ZDdMWXpZdTA1Nmk4ZDBnMnZNdSt4WXN2T3UrNER6V3pOT0JLWlMwUjVh?=
 =?utf-8?B?SmpJUUp3Uyt3Vk51N1BQMEZ1dk5NWVpaQkJQMG1NYktDUXVPN3RlL2VkaUtF?=
 =?utf-8?B?S251UjJTUkZ4UURBN2RKNTB0LzkvMU5QdXFxN0pqaWRIdjdEdkxuTlhBTCtS?=
 =?utf-8?B?bnAzSUFBT0RmRVVTNWp6cGtud1U1SXZGdVJEMldhOGVpUnZXaVBueDJ6dEEx?=
 =?utf-8?B?L3NNWjNtQTRQVElRNWJQaUc1NzIrcy9GT2FUVHZuc2hrcjZ3c290WXp0Z1ho?=
 =?utf-8?B?cXRKL2cwNnVXVHFpWTdremI4UGU4L1ZlME1ab1l5QnkvUzBwNEZzaFh6b1ky?=
 =?utf-8?B?ZDRPYklXMW9pdHFOcmxmVVVJSE9Ua3JacVhkYWhwQ0NDWjlSR1Z5SnZkNGRY?=
 =?utf-8?B?dXdJZ1V3aW1IQmtwcWRjRWpHZnZMVWx6d0Q4WllnOTMrTGY5cGpaN0RkMnhu?=
 =?utf-8?B?WCtTODhOMFFob2RtR0JiMlQ2SUtPRDM3NWp6SlYvTjVmd05iRzRGYXdISncx?=
 =?utf-8?Q?N4fzI6UMCWT5GfgWaMObqG3PURC11vo6k7XPM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3oreERpUWhnUFJpRHVKV1NkR3BoWDlsYi91UXljU0NNUWlKaUtMbTNlUWs4?=
 =?utf-8?B?d0kzRVhFUk5XZk4rdldzWGdSSFZCZmdBU3lwTnFOSFFsNU8yOEtiZEFuOUVP?=
 =?utf-8?B?NG83WUpKSktkc2xqa29xMWgwa0NZeU1RZE5iVUNsVzd4Rm1aeWMxMVBwaE5H?=
 =?utf-8?B?ckt3R3BTUjBmREpST0J5ZTlaTlRXN0hKank2V1YveEVqV3RJcW91NVg3S1hl?=
 =?utf-8?B?TGVqQU9ZYnY3SUJaSHo0dXlGLytud1VxMC9lalA0bThWdGJhczM3TGxFcGlw?=
 =?utf-8?B?UlJsQUpVb3N3K3E1YzhnY3dzYXZBVlB5RFJDcVNaSHZsV1JtRmJxUnpHOXlG?=
 =?utf-8?B?b2NUb3p3THRqR21oTlhKLy9obHdSdHcvbVMyVlFxZ250ek1hTTMzbTdtSkpT?=
 =?utf-8?B?bFBCTkNLem9yc3A3ZDFFNWpiSlFuTkk1MWVGUGdwRDBveWgybkl2TEF4QlNB?=
 =?utf-8?B?WllmRDBoZW13QTluRS9XQWhpcUdXc1JtV1YxRWl6THNCR3hKK083cThsbnAz?=
 =?utf-8?B?Rml6L0NaSVNnUGlhQTFGbUt2c3ZLSlpDcSs2VDE2ZGt1NmFFVEFMdGNIbllk?=
 =?utf-8?B?OCs2eTgvV0s3a3U1T3dvOUVrQ0tWdGREbklUNlkrUDJidmRhZGhGdkYxWGpo?=
 =?utf-8?B?Tyt3Z3p1VndSS2NRbFZuNVg4cW50cS9GSnFENitVOUd3bUxpY1Ixay9oSjBM?=
 =?utf-8?B?M0FRTUdQV3JONUtkNjBuOUt2a3BPZnoyWm81RU82M0tVbCtGYk53YVY2dmJk?=
 =?utf-8?B?dmpOOFFXY3c0cXQ2M2FQbEhUc3J5b2MzMDdvRUZ0TVhTUUxFcTVFdnoyR1lM?=
 =?utf-8?B?RXBYV0Q2NVM4SGE0ZXdNUU5mMzhFL0dxdjZ4ZWY3TVFEQ096dE1PUnd2TzA1?=
 =?utf-8?B?bXBOYmhGeEhzRmxLcE1qV05PVUVzRzNQcDlqdTJ4SW9zbHBDZUJlTEozd1JT?=
 =?utf-8?B?d2xKTnloNDNMNk84eXcvSm4vN1JUVWh1UEdhRzQ5WXErdlZUdDN4ckEybmxP?=
 =?utf-8?B?OEdBbjJTb1R6bGNpQ3IyVXVRd0JjOHRMcTNsQWR5bW1vMlk3QXIvYkMrUmg0?=
 =?utf-8?B?OUlrTEdFaGRBTlNzeGE1YWlsZFdVTlJpMjRpK0k0QW1CWlRiNU13THh4MVZ1?=
 =?utf-8?B?UytKVW9QV290RHNZek05NU13Q2gyVEpwaW4wd0FuSVVGem1ZcjdHdEhuaEcr?=
 =?utf-8?B?R2NTUi9LcTlpMzlXSVV6VlZ5UjBoamQ3aWxFdnRCT0dXUlVUNFQvMzFaYllB?=
 =?utf-8?B?dUUvQWJSZG1FNnF2M3RIK2VRbVFsZ0ltU253VHg0Q082N2Vra3kwUm9rSnVV?=
 =?utf-8?B?NzVXbk5XUGorUHlDTU1TUnc4dktyVjJ5eEhyYlBhOUtibmVvUFo3TmlVWi9v?=
 =?utf-8?B?T2w0NldnVEZlK1hjRjAvNW15MFpKb3UzWnBFUEM0R01qbHgvNGpUTDF0QUg2?=
 =?utf-8?B?QzU2ZHhsUXRLMGZyVmNuN00wZlRDY0I2dG95a1VYcG95SWZPdUJGdXhpckFw?=
 =?utf-8?B?SkJ3WTA3RWlNMTRMZVdzcHlFNWtEdy9UbUdOZ1YxSVJvbjI0T3FlT3VuUlpL?=
 =?utf-8?B?NWx3SVo4eDAzQkhWclQ3Y2JqYUNiRGhtMnNsOWpMaFF5L0dJOFFsVkdVbjVl?=
 =?utf-8?B?aFBsQ1lvcW1BcVFsNDVvOXB0SXhIL1I4NzViVENHSzMzaEdWK08xVHdjcENL?=
 =?utf-8?B?MmFXZTZoSFIvMmIreEZmRzFrMjAvUmgwN1ZQME95Y2J1WWR2SEFXVkRqek15?=
 =?utf-8?B?YWdIRk9Kbi9lZmcyaE1RMi9QNjdYTWtqbkxWOGxFZW11alVPSUtFK1hZTVVP?=
 =?utf-8?B?ckw4SXliWUpEcERudnl5RU85YmIrV2ZWemNaRllqbmw2Mldvam52QXBoZ01r?=
 =?utf-8?B?eTRPZ1pVSitiS1NiRFVvVEozaUx5NlJzSzdkSCtHNThZd1ZjMnV5cWNHek9N?=
 =?utf-8?B?cHlNOCttQlhHQ3NTa1d5bFh3Rm5qOE4yNzZWSlVlKzBaMjc0UEV6TENnSDZD?=
 =?utf-8?B?NkVteVlmZ1lwOFlxaE1qRmM2djJNQVZTd2JyVTh1R2RGekdSeCtUTXBpNkNl?=
 =?utf-8?B?dGRsRnVCaU9WNjFZbldwY1AzemFUK0hPN3dWdExEWklrQUNYZ3VwNlhZbi9U?=
 =?utf-8?B?bGNjOEtFTklRYWN2OGVmaEFhSE96ejB6YlExUHB0aWJucWxYaks2bGwxSVZE?=
 =?utf-8?B?VlFyeTVPeVVUZW8xOTk3TkZkZjJxVHhFa1l1aXo2U2hlcHhnbFc1ZnBzNlNu?=
 =?utf-8?B?UTlGRVV6aE9ZN3NidjZya1VVOGd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <785EECAA8F943044B77B651DE7BAF2A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cd8a59-ffa7-4879-4813-08dce186812b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 19:31:38.8132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMuiAeqyNhV5GtSBQfuGAp0a8GEaGquE+igEISTFM5RtkCouAd877jLHAHhg57XoyeuveupRBjaJdVX3loaG+/SwiUJI7QalcfT9AjE5T10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8142
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

T24gRnJpLCAyMDI0LTA5LTI3IGF0IDE2OjIyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBNYWtlIHN1cmUgdG8gY2FsbCB4ZV9wdF91cGRhdGVfb3BzX2ZpbmkgaW4geGVfcHRfdXBkYXRl
X29wc19hYm9ydCB0bw0KPiBmcmVlIGFueSBtZW1vcnkgdGhlIGJpbmQgYWxsb2NhdGVkLg0KPiAN
Cj4gQ2F1Z2h0IGJ5IGttZW1sZWFrIHdoZW4gcnVubmluZyBWdWxrYW4gQ1RTIHRlc3RzIG9uIExO
TC4gVGhlIGxlYWsNCj4gc2VlbXMgdG8gaGFwcGVuIG9ubHkgd2hlbiB0aGVyZSdzIHNvbWUga2lu
ZCBvZiBmYWlsdXJlIGhhcHBlbmluZywgbGlrZQ0KPiB0aGUgbGFjayBvZiBtZW1vcnkuIEV4YW1w
bGUgb3V0cHV0Og0KPiANCj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY5MTIwYmRmNjIwMDAg
KHNpemUgODE5Mik6DQo+ICAgY29tbSAiZGVxcC12ayIsIHBpZCAxMTUwMDgsIGppZmZpZXMgNDMx
MDI5NTcyOA0KPiAgIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6DQo+ICAgICAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAxYiAwNSBmOSAyOCAwMSAwMCAwMCA0MCAgLi4uLi4uLi4uLi4oLi4uQA0K
PiAgICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMWIgMTUgZjkgMjggMDEgMDAgMDAgNDAgIC4u
Li4uLi4uLi4uKC4uLkANCj4gICBiYWNrdHJhY2UgKGNyYyA3YTU2YmU3OSk6DQo+ICAgICBbPGZm
ZmZmZmZmODZkZDgxZjA+XSBfX2ttYWxsb2NfY2FjaGVfbm9wcm9mKzB4MzEwLzB4M2QwDQo+ICAg
ICBbPGZmZmZmZmZmYzA4ZTgyMTE+XSB4ZV9wdF9uZXdfc2hhcmVkLmNvbnN0cHJvcC4wKzB4ODEv
MHhiMCBbeGVdDQo+ICAgICBbPGZmZmZmZmZmYzA4ZTgzMDk+XSB4ZV9wdF9pbnNlcnRfZW50cnkr
MHhiOS8weDE0MCBbeGVdDQo+ICAgICBbPGZmZmZmZmZmYzA4ZWFiNmQ+XSB4ZV9wdF9zdGFnZV9i
aW5kX2VudHJ5KzB4MTJkLzB4NWIwIFt4ZV0NCj4gICAgIFs8ZmZmZmZmZmZjMDhlY2JjYT5dIHhl
X3B0X3dhbGtfcmFuZ2UrMHhlYS8weDI4MCBbeGVdDQo+ICAgICBbPGZmZmZmZmZmYzA4ZWNjZWE+
XSB4ZV9wdF93YWxrX3JhbmdlKzB4MjBhLzB4MjgwIFt4ZV0NCj4gICAgIFs8ZmZmZmZmZmZjMDhl
Y2NlYT5dIHhlX3B0X3dhbGtfcmFuZ2UrMHgyMGEvMHgyODAgW3hlXQ0KPiAgICAgWzxmZmZmZmZm
ZmMwOGVjY2VhPl0geGVfcHRfd2Fsa19yYW5nZSsweDIwYS8weDI4MCBbeGVdDQo+ICAgICBbPGZm
ZmZmZmZmYzA4ZWNjZWE+XSB4ZV9wdF93YWxrX3JhbmdlKzB4MjBhLzB4MjgwIFt4ZV0NCj4gICAg
IFs8ZmZmZmZmZmZjMDhlOWVmZj5dIHhlX3B0X3N0YWdlX2JpbmQuY29uc3Rwcm9wLjArMHgyNWYv
MHg1ODAgW3hlXQ0KPiAgICAgWzxmZmZmZmZmZmMwOGViMjFhPl0gYmluZF9vcF9wcmVwYXJlKzB4
ZWEvMHg2ZTAgW3hlXQ0KPiAgICAgWzxmZmZmZmZmZmMwOGViYWI4Pl0geGVfcHRfdXBkYXRlX29w
c19wcmVwYXJlKzB4MWM4LzB4NDQwIFt4ZV0NCj4gICAgIFs8ZmZmZmZmZmZjMDhmZmJmMz5dIG9w
c19leGVjdXRlKzB4MTQzLzB4ODUwIFt4ZV0NCj4gICAgIFs8ZmZmZmZmZmZjMDkwMGI2ND5dIHZt
X2JpbmRfaW9jdGxfb3BzX2V4ZWN1dGUrMHgyNDQvMHg4MDAgW3hlXQ0KPiAgICAgWzxmZmZmZmZm
ZmMwOTA2NDY3Pl0geGVfdm1fYmluZF9pb2N0bCsweDE4NzcvMHgyMzcwIFt4ZV0NCj4gICAgIFs8
ZmZmZmZmZmZjMDVlOTJiMz5dIGRybV9pb2N0bF9rZXJuZWwrMHhiMy8weDExMCBbZHJtXQ0KPiB1
bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjkxMjBiZGY3MjAwMCAoc2l6ZSA4MTkyKToNCj4gICBj
b21tICJkZXFwLXZrIiwgcGlkIDExNTAwOCwgamlmZmllcyA0MzEwMjk1NzI4DQo+ICAgaGV4IGR1
bXAgKGZpcnN0IDMyIGJ5dGVzKToNCj4gICAgIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZiIDZi
IDZiIDZiIDZiIDZiIDZiIDZiICBra2tra2tra2tra2tra2trDQo+ICAgICA2YiA2YiA2YiA2YiA2
YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiA2YiAga2tra2tra2tra2tra2traw0KPiAg
IGJhY2t0cmFjZSAoY3JjIDIzYjJmMGI1KToNCj4gICAgIFs8ZmZmZmZmZmY4NmRkODFmMD5dIF9f
a21hbGxvY19jYWNoZV9ub3Byb2YrMHgzMTAvMHgzZDANCj4gICAgIFs8ZmZmZmZmZmZjMDhlODIx
MT5dIHhlX3B0X25ld19zaGFyZWQuY29uc3Rwcm9wLjArMHg4MS8weGIwIFt4ZV0NCj4gICAgIFs8
ZmZmZmZmZmZjMDhlODQ1Mz5dIHhlX3B0X3N0YWdlX3VuYmluZF9wb3N0X2Rlc2NlbmQrMHhiMy8w
eDE1MCBbeGVdDQo+ICAgICBbPGZmZmZmZmZmYzA4ZWNkMjY+XSB4ZV9wdF93YWxrX3JhbmdlKzB4
MjQ2LzB4MjgwIFt4ZV0NCj4gICAgIFs8ZmZmZmZmZmZjMDhlY2NlYT5dIHhlX3B0X3dhbGtfcmFu
Z2UrMHgyMGEvMHgyODAgW3hlXQ0KPiAgICAgWzxmZmZmZmZmZmMwOGVjY2VhPl0geGVfcHRfd2Fs
a19yYW5nZSsweDIwYS8weDI4MCBbeGVdDQo+ICAgICBbPGZmZmZmZmZmYzA4ZWNjZWE+XSB4ZV9w
dF93YWxrX3JhbmdlKzB4MjBhLzB4MjgwIFt4ZV0NCj4gICAgIFs8ZmZmZmZmZmZjMDhlY2UzMT5d
IHhlX3B0X3dhbGtfc2hhcmVkKzB4YzEvMHgxMTAgW3hlXQ0KPiAgICAgWzxmZmZmZmZmZmMwOGU3
YjJhPl0geGVfcHRfc3RhZ2VfdW5iaW5kKzB4OWEvMHhkMCBbeGVdDQo+ICAgICBbPGZmZmZmZmZm
YzA4ZTkxM2Q+XSB1bmJpbmRfb3BfcHJlcGFyZSsweGRkLzB4MjcwIFt4ZV0NCj4gICAgIFs8ZmZm
ZmZmZmZjMDhlYjlmNj5dIHhlX3B0X3VwZGF0ZV9vcHNfcHJlcGFyZSsweDEwNi8weDQ0MCBbeGVd
DQo+ICAgICBbPGZmZmZmZmZmYzA4ZmZiZjM+XSBvcHNfZXhlY3V0ZSsweDE0My8weDg1MCBbeGVd
DQo+ICAgICBbPGZmZmZmZmZmYzA5MDBiNjQ+XSB2bV9iaW5kX2lvY3RsX29wc19leGVjdXRlKzB4
MjQ0LzB4ODAwIFt4ZV0NCj4gICAgIFs8ZmZmZmZmZmZjMDkwNjQ2Nz5dIHhlX3ZtX2JpbmRfaW9j
dGwrMHgxODc3LzB4MjM3MCBbeGVdDQo+ICAgICBbPGZmZmZmZmZmYzA1ZTkyYjM+XSBkcm1faW9j
dGxfa2VybmVsKzB4YjMvMHgxMTAgW2RybV0NCj4gICAgIFs8ZmZmZmZmZmZjMDVlOTVhMD5dIGRy
bV9pb2N0bCsweDI4MC8weDRlMCBbZHJtXQ0KPiANCj4gUmVwb3J0ZWQtYnk6IFBhdWxvIFphbm9u
aSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsLy0vaXNzdWVzLzI4NzcNCj4gRml4ZXM6IGE3MDhm
NjUwMWM2OSAoImRybS94ZTogVXBkYXRlIFBUIGxheWVyIHdpdGggYmV0dGVyIGVycm9yIGhhbmRs
aW5nIikNCg0KSXQgc2VlbXMgdG8gZml4IHRoZSBpc3N1ZSBmb3IgbWUuIEl0IGFsc28gc2VlbXMg
Y29ycmVjdCwgYmFzZWQgb24gdGhlDQpsaW1pdGVkIHRpbWUgSSBzcGVudCB0cnlpbmcgdG8gdW5k
ZXJzdGFuZCB0aGlzIGNvZGViYXNlLCBzbzoNCg0KUmV2aWV3ZWQtYnk6IFBhdWxvIFphbm9uaSA8
cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPg0KDQoNCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3B0LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+IGluZGV4IGQ2MzUzZTg5NjlmMC4uZjI3
ZjU3OWY0ZDg1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYw0KPiBAQCAtMjE4OCw1ICsyMTg4LDUgQEAg
dm9pZCB4ZV9wdF91cGRhdGVfb3BzX2Fib3J0KHN0cnVjdCB4ZV90aWxlICp0aWxlLCBzdHJ1Y3Qg
eGVfdm1hX29wcyAqdm9wcykNCj4gIAkJCQkJICAgcHRfb3AtPm51bV9lbnRyaWVzKTsNCj4gIAl9
DQo+ICANCj4gLQl4ZV9ib19wdXRfY29tbWl0KCZ2b3BzLT5wdF91cGRhdGVfb3BzW3RpbGUtPmlk
XS5kZWZlcnJlZCk7DQo+ICsJeGVfcHRfdXBkYXRlX29wc19maW5pKHRpbGUsIHZvcHMpOw0KPiAg
fQ0KDQo=
