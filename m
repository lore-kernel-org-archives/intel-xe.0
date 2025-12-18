Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451AED711CC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 23:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33E910EB4F;
	Thu, 18 Dec 2025 23:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ip1GK4Sa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798BD10EB4F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 23:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766100434; x=1797636434;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=d8htGbP0VPm7Zc6WurL7PyQAmIGIpcSBBzlUVzyRO24=;
 b=Ip1GK4SaRxB+wrgtuiGTQXxOspSFR3FEjCDAw6ZqDxGnWMTBgZe889Pd
 +SEzP/OpzK4ZALcELpHwiM7yrD6t+LwtZjS22PxFTeCb0L7RC2JZSKixx
 6tCceggzcM0YpoMCr9u1gVEvg7E4hE7+/gDykfhNHCb3CKUs0p1D+er6n
 kWQUCHdugxb5D3xiGsEKl8WPmuf/YL94WHqZwmPQ2GGYrjvkMc9AYVLwd
 xuqSVyyab//fz8HNjnysMYliMo2hGbTRU6OLE2OJUdwgFOqknAgIfFU7n
 VsIK9D/Ez1EIXjpbSAcSd4BxVSHyz2K4zUEzfQ411VCq7ZlrxS25RoaQf w==;
X-CSE-ConnectionGUID: nIw0uAB1TMuw0QKTWpDLfw==
X-CSE-MsgGUID: S/Vl5XSjTmO0Z/7jxejlNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68138959"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68138959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:27:14 -0800
X-CSE-ConnectionGUID: oz3wqdY2QSKgYevGq20zDQ==
X-CSE-MsgGUID: AwI+G59DTfKdQYv8CupDhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203226368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 15:27:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:27:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 15:27:12 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 15:27:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ph0+6/gC9wasaPMnHLcA7KAmb+3FCvHe7HGa9P1GC9RgBc4RAbjptuzW7A3r9a/DOEZ2vZehGSV6FNitQcU8lXvzuhLqzubF2dMn2zouOMY3QJ9TDq1tJ2kneRJ5TwzrDWkMz+SGcUeoPz9Znc3GDOVtuHQ8trCV5rp6Eh7zBodTuBfZCR7eGNKpNmyiMyk9ILn400ZN03cQHB4azyKEcb62La5QumVrck5Pd0k6+WJX7nk48fAbdsubvd/cQYCmRqZBkVdf/9DrU5RGC6iU+D7W7l+sKpVu4BfvMNU/jpSNtQ+oD1VLnJ3/9+MPgwdSb9T/Hb+VrtKqd0ic9dC99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8htGbP0VPm7Zc6WurL7PyQAmIGIpcSBBzlUVzyRO24=;
 b=xpTf/wXPf3DTfhqOLOLLweXb1wU0uFzzeUEb3JMeefFfzvNClexajR758Rf2+k/T3MNrhRYyTzi5Cxu2jnR7SPg9LL3e1pM9FZbssvKvK6ghEirj55szUGgg5JtE1r1I835szWDuIQFUg8e27pwxaS8UfFSoQhpd+RB1DOEVQYvFIX0s0m0mXrCQ/opy/OCcphqyypLX0KYDMR3kEo2ky2x3iq6IbR4F3mrUX3SjVcb+QBcKsUuAb7120+Os1KLYMK5myQGNXET+k2hFZfyVEJnc1e3gTYFJcRHHno2AcaFYbavYvd41Ecm4uEB2WwkW6/Gk2XbRqoJhJJSL4pXX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 23:27:10 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 23:27:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Increase log level for unhandled page faults
Thread-Topic: [PATCH] drm/xe: Increase log level for unhandled page faults
Thread-Index: AQHccG78RYxXvobfTkGJ1dKlkDatRLUoCsWA
Date: Thu, 18 Dec 2025 23:27:09 +0000
Message-ID: <8c5df1f24d143c1b509e23810d2f76c87d48f1cc.camel@intel.com>
References: <20251218223745.4045207-1-matthew.brost@intel.com>
In-Reply-To: <20251218223745.4045207-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB6246:EE_
x-ms-office365-filtering-correlation-id: 5092214d-e1e4-4ad0-97e8-08de3e8cf767
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?akJoNWZTRU5PdUU3UzZzSmNGWWtiVzZ5SU5FeVh3OEk3Q2dUR2VtancvTWhu?=
 =?utf-8?B?RXVFVnRJZGJUdXRPYVFlTnVrajVhUjRic204SCtURitmZC8zemxNVG5OcTBo?=
 =?utf-8?B?Rmw1RUV0RUg3bTF4RkZqcUJrZUJ1M2haMGJKOVFSMzY1YlViQUR4cDVUWkY0?=
 =?utf-8?B?N1ZOZWs5RTBWSnJaa1BDZGNNRkI2RFNsaUVldXdEdGtNeUlGNExGNWdNSVBk?=
 =?utf-8?B?TUZsUkh1MFhTSzAxMWF3SjUzWjNLZ2VsVTJCOXlzelpQOEdlR1VlRndoQ3JP?=
 =?utf-8?B?WjViM2k3TVpOYisvQ1FhOXhMZUs0M0ZNYk9yaDJPYmErM05tUFZhcU5DOXVn?=
 =?utf-8?B?UjBJZ0hKbTFXTEdsb2tCU2oxTlFRTVdnM1pEcTlQUU5EMk96dU9RYjNGdGVt?=
 =?utf-8?B?NDBPM05BYUJuakRyZXdPZWNmU0pJSmJrVVUrd0VtbUJaMHdFRzA1V3RqbDU2?=
 =?utf-8?B?T1lXcHF0R3NKZGNpdWlIZEJ5dllESjdUWWwyRVVMN1BSQjhOb3R1S1pIRXVM?=
 =?utf-8?B?cWhmRVA3MUdTaGpCa1dvVzQ0ZEI1Q0NRRzFNS05qV3ZLV2JobUQrY2Q3WWp4?=
 =?utf-8?B?cTBQd3NjdzJFR2xCdVZMNk5EVXFyNUNTS09qQ25oU1grcG5uL1p0V1Q3TUhB?=
 =?utf-8?B?WGNVWmhVN2ZrMG1kTW44bUQwajU3Z3JhS2JQQlIwVWlXWjhOTEZBbWRqbDN0?=
 =?utf-8?B?SFg4UGVQamNOUlB3VlorMExva2gxejk4SkNJVG1VZXdtQWdLQzA2eEtqVEM3?=
 =?utf-8?B?V2Rxc0xoOWJsS05XRFVTcElpZWRZQVlKb1ZvTy85VnN5dXdzT3JsQ1Vid29v?=
 =?utf-8?B?TlphcmZUV1lBaHNiUDlOeTVSLzMxR1JRKy8zUm1Pd3NGUnVwN01SVW5GTHRl?=
 =?utf-8?B?M2M3TlVtbzdDZ1lwajZLNGpaTkxoK0QwWWlFUGxJNE1sRkJzV2FaTkdmeGVl?=
 =?utf-8?B?bW5mN2YzOGlYUXZNZGFwbFB4Vk1qbElNeFAva0U4NTRLeCtrV2pWTHVVMFhZ?=
 =?utf-8?B?dFVmTXgxRTFuSlJWWTVLZjRjT1NkUHc4UDh1K2sySlFWR0NIS25nVFhqZEg3?=
 =?utf-8?B?Zi85TXRkVkNqVG1pMG5lSFppMS9rZSt4L3A5WlRHSTlEd1JDbFJLcForUERy?=
 =?utf-8?B?WFVrT2ZTSlMxWnFiVEVyK3FNZ0VPSHpNMVgreGFjZWlTblJFSFlLczFtNmtO?=
 =?utf-8?B?N0FMZmwrdHNRTjQySFdpTUtpVmh3QkZYa0duazh3dDRLNHprYWhGNWlTOFY1?=
 =?utf-8?B?MHdTMGFNUjhNem1PZDhKRDVQRjdQdGdyQUh4Q2wxOVg5OE40aGxoMW1zSk91?=
 =?utf-8?B?UDA3bzJVMzkzRVFzamMrYTlUMnprbzdvSEt3ZkZsREszdmRvQlZKeEovTlcy?=
 =?utf-8?B?OFRpUStvZnRvdlVjaFJSUytuamdDTlVubjlPV0g0amg3SmJnZ0hES2RqUDJM?=
 =?utf-8?B?TXlUd0ZmdEEvUjRYb05aWFlUVG03RlBoNnMxVHJlMGRzS1M2MUtZMGt1YTVH?=
 =?utf-8?B?cDhhaGN4ZzQ2UXJ3MEkrY0cva1lzNlA4ZzFma0ZSYXFCOGh0TXdNSDFKRVc2?=
 =?utf-8?B?WFBjUzE4NE96c1pkajhWVURUdjEvbkx4blZWYU51czgyMHBOZTJjMnZBdTRD?=
 =?utf-8?B?VE9ReE9JT3ZwSktXU2V3MVRGbS9wbjc5RWFOaVZUa2sxTHlLZHFZbzcyT2Nr?=
 =?utf-8?B?UGdhVXRiMHhjVnVMQTFrMHJoYzZtZmpXLzEvMHlVUlRPWHV1eU45azNpNFBx?=
 =?utf-8?B?WUkxb3BTN2VsbndWSzlTb1F5QUtOb3ZUWU1CbVVLUUdrU3lHMFhtN05qaE1p?=
 =?utf-8?B?ZzB1Z2J4ZWN4aUQrelJBWHlHelRnQnFvZjhnUXNKbjYvU25LTGt5QUlYTDEz?=
 =?utf-8?B?WHlqTmZGRmdqOWVZMkkzVHNNNlJOOTZuemFZSHQ2RFFUYWRBSEVoaTZMa1pm?=
 =?utf-8?B?alVQZUl6QWQ5OUtNdXpHdTBsTEdaSjJZbDhUdEUyOGRZa1NiRjdOa0ozcjBU?=
 =?utf-8?B?YmNucDI2aXV5ZkMxbmhCU2RpSEVxeGdCa3ZST3BPQnIzUW9aempvNzRadGli?=
 =?utf-8?Q?fiQ92N?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGF6S2J5R2lwcmtRekZvSm5mSDBzZnBubUoxYWdnaDVqSUNWa3gzYTg1SXBp?=
 =?utf-8?B?Mmxtd2h0QThpRFV3VjFpN2svUG1lYlNab2daSGJSaEhQa0J3cHlibkxhZWZW?=
 =?utf-8?B?bkdGNVhrQ2NYTjAyS1NubUsxK3NYa3VIVmJmbEFGM0ltMjhiUXk4TEowME1I?=
 =?utf-8?B?ME1wVTgzeHFUZUtBUk4vWUZQSkxkTjNSb0dWUGN4aHlJdmtIR3ZjbEgwREtI?=
 =?utf-8?B?SDc1YUZPKzhjcEpTdUp4VlRJeE9NeS9rRzB1THNIeFlxTnUrcVo2Zm9ZNVNF?=
 =?utf-8?B?MFhaZ0F4U0tDOUFlNllrNDk0cVQreDM4MHp3YjdhQkphYVZDZVNPYXdIdm5H?=
 =?utf-8?B?RFRTVVZoc1FPbFFRZHRYUlJkUE1kbXg1dW5JUk5sdW9mMTAvTS9Ha0UveUVP?=
 =?utf-8?B?MjQzRWRMTUU3R2VRNldHd2ZxZ21Vb3c3S2syNkgvaTZRSC9kZ1N4UTVRWnZ5?=
 =?utf-8?B?OGZUZk02ZWlsanV1TTkxUWcwc25rb1Z6QTdvZ2xwMFdDcTU4M0p0eXJtTGFs?=
 =?utf-8?B?N05UVVdpNGdZTzNJTWlPVEJJdzRJMWdGOXBRL0tCcVVGUlZJK0NKNVNqZnZE?=
 =?utf-8?B?cU1TNTJieXhKR3pqcXg0YnVVVFN1VXFyK2xCMVNqYUtRalpyQlJBdktmanFH?=
 =?utf-8?B?QTBvdk5GTXV1WmhzRWNGNVlDSVJSNXREaVNhbXp0UlFzZyttUGlSSmJXeUQw?=
 =?utf-8?B?V1A2RDVacDJjQi9Sd3NyOTZDVVl6eTNVaGppUlVNeWtNek9QQUZKN1ZSUGxM?=
 =?utf-8?B?UkZ4OGJYQ2ZaSkZybDdibDdKYzhTQkFVQmRwOXdnYlVtMDBxYUdselYzK1cy?=
 =?utf-8?B?cDRuRll3Rjd0SWYxYXptaENFc3k1czdqcnNDa0lSdDNxb01IbkxhcnpUY3cr?=
 =?utf-8?B?Ykk0UVhRQkt2V2h4cEQvUkJZdU83OEJveDY3c01kUzhOaHRFdzVTQ0F4WGtL?=
 =?utf-8?B?TE9hdTRNWDhjeUJIazY5dlUwbFBHVVZoNmR6UmE2alVqQzNDQkU1RzJKbTZC?=
 =?utf-8?B?aU45bVFwNUpkeldGcWRTN0pQYmZnekdJRU9FNVRWcHhZSFVmRFB5bXdOK1ZD?=
 =?utf-8?B?dHFmN0JmbEJ3d2JvcjRkR2hmUERqaEVndlpqZEpUQlpyWWEyNmdRS05ZUnZs?=
 =?utf-8?B?SkNRbU4vRVp1Szd1R29SVFRDd1BFTE9JK2phMjdHcUx6b21kLzFPNjdWbFla?=
 =?utf-8?B?cFhsNFZOQktZZU5lL3dpR1VxL01DdTNIeHdlTXQ2MjA4RHZ2R0pEU1hFNmdt?=
 =?utf-8?B?c0Q0aE1oMXBBL0N5SXFWMlc4Z2QxRnE3bW05ekFqRU9vVEQvY3dvb1F4RnZC?=
 =?utf-8?B?c00yZFQ5VGJjRVliZjdLbk0vNXNKeTlhSjEwaUM1T1NaRjloQmhibDZySFpF?=
 =?utf-8?B?OW1McnlHRE9yWUxmMm1Rb2R0TWxjT0dyK2JTS3cySmN1aDQ4cGFTRDlVdkhN?=
 =?utf-8?B?R0c5ak0rWDU5YndYRGhGVTR2KzJiZk1VZWhnSEk2Y0ZTWWo4UDZiWlM3TEkz?=
 =?utf-8?B?MVdRY2NBUVNpYVNVZFcxMCtrb1BEUDJqT2diT1prUWcyZ29XOUVzdXBaRjlF?=
 =?utf-8?B?Z1NHUTNKcTdjOEJvU3FFQWIyOEZrcGtLd2ZSUm02eU9TcTFJM2duTmk4dk5D?=
 =?utf-8?B?TytMbmxrOTlnOHJHMkV4dG52UGlKZi95NlUwRE5oWTI4cUJ1QmZ1dkhEdHZP?=
 =?utf-8?B?MzJTOUsvOUpTbHY2RlRuZEZKTW95NG0yY0gzaTR3aWx6RVZnSHlVWTdsTmpx?=
 =?utf-8?B?d1o5aEU1NC9uQ2xXeGNYaE85S1ZpWmhKY3ZFMzhpU3NZQm1aZFpyMWtCakJY?=
 =?utf-8?B?d1c5UzBoa0pIcUExZkgzQWJINFNtRG1lRzZmSTYxUXVqVjZrbit2dDJycEJ0?=
 =?utf-8?B?dEtjbTFSZXc0bEtqajVla1YyZldVVGxiMHhQUVd2amRLTGlBYW80U01DcGVU?=
 =?utf-8?B?NmpFWkUzaDZLSEFjSFB1OVNQTzZ0b2Uzd3FqVjU4WlF6V3VmcnpidWo0SnQz?=
 =?utf-8?B?WHBhd25xNCtoN0VycGFBMDl0MFhmODNpTks2MjRMYVJmZms5ZEo1ZU9zMkNm?=
 =?utf-8?B?dHBwWHY5aUptMEZOUlRYS2svR3ZRM2VrQm1rVkp3a3JhMTM5Ykc2bFVaL29m?=
 =?utf-8?B?UnVqblgwSENUaUJTZmt2Z3N5UkNaSjBnRm15bkhpWWRERjhhMGpMZmhtYnl4?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB6A4835BE6F064FA3EF3487E897B2D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5092214d-e1e4-4ad0-97e8-08de3e8cf767
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 23:27:09.9509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkpvP/AhhgM0qD2HFwHiGLxZbmlu9T4nZJSdTTL2vqfLxBjow6CxOblllfs1tJgHwqnBqRziHUBTrbrAZvTktIpPOHsd/ZIMyGoLX9YIMSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDE0OjM3IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFNldCB0aGUga2VybmVsIGxvZyBsZXZlbCBmb3IgdW5oYW5kbGVkIHBhZ2UgZmF1bHRzIHRvIG1h
dGNoIHRoZSBsb2cKPiBsZXZlbCAoaW5mbykgZm9yIGVuZ2luZSByZXNldHMuIEN1cnJlbnRseSwg
ZG1lc2cgb3V0cHV0IGNhbiBiZQo+IGNvbmZ1c2luZwo+IGJlY2F1c2UgaXQgc2hvd3MgYW4gZW5n
aW5lIHJlc2V0IHdpdGhvdXQgaW5kaWNhdGluZyB0aGUgcGFnZSBmYXVsdAo+IHRoYXQKPiBjYXVz
ZWQgaXQuIFdpdGhvdXQgdGhpcyBjaGFuZ2UsIHRoZSBHdUMgbG9nIG11c3QgYmUgZXhhbWluZWQg
dG8KPiBkZXRlcm1pbmUgdGhlIHNvdXJjZSBvZiB0aGUgZW5naW5lIHJlc2V0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPgoKUmV2aWV3
ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+CgpJIHdhcyBn
b2luZyB0byBzdWdnZXN0IG1vdmluZyB0byB4ZV9ndF9lcnIoKSwgYnV0IGl0IGlzbid0IHN0cmlj
dGx5IGEKa2VybmVsIGVycm9yIGhlcmUuLiBpdCBjb3VsZCBiZSBhIGJ1ZyBpbiBhbiBhcHBsaWNh
dGlvbiBvciBzb21ldGhpbmcKYW5kIHRoaXMgaXMganVzdCBhIGxpdHRsZSBtb3JlIGluZm9ybWF0
aW9uIGZvciB0aGUgdXNlci4gU28gbWFrZXMgc2Vuc2UKdG8gbWUuCgpUaGFua3MsClN0dWFydAoK
PiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCAxMiArKysrKy0t
LS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZWZhdWx0LmPCoCB8IDM2ICsrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0KPiAtLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRp
b25zKCspLCAyNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19zdWJtaXQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQu
Ywo+IGluZGV4IDQzZmQyMDY5ZjliMi4uMjU5YzRlMWRjYWU3IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3N1Ym1pdC5jCj4gQEAgLTMxNTksMTMgKzMxNTksMTMgQEAgaW50Cj4geGVfZ3VjX2V4
ZWNfcXVldWVfbWVtb3J5X2NhdF9lcnJvcl9oYW5kbGVyKHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMy
Cj4gKm1zZywKPiDCoMKgwqDCoMKgwqDCoMKgICogU2VlIGJzcGVjIDU0MDQ3IGFuZCA3MjE4NyBm
b3IgZGV0YWlscy4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoGlmICh0
eXBlICE9IFhFX0dVQ19DQVRfRVJSX1RZUEVfSU5WQUxJRCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgeGVfZ3RfZGJnKGd0LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIkVuZ2luZSBtZW1vcnkgQ0FUIGVycm9yIFsldV06IGNsYXNz
PSVzLAo+IGxvZ2ljYWxfbWFzazogMHgleCwgZ3VjX2lkPSVkIiwKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR5cGUsIHhlX2h3X2VuZ2luZV9jbGFz
c190b19zdHIocS0+Y2xhc3MpLAo+IHEtPmxvZ2ljYWxfbWFzaywgZ3VjX2lkKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfaW5mbyhndCwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkVuZ2luZSBtZW1vcnkgQ0FUIGVy
cm9yIFsldV06IGNsYXNzPSVzLAo+IGxvZ2ljYWxfbWFzazogMHgleCwgZ3VjX2lkPSVkIiwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZSwg
eGVfaHdfZW5naW5lX2NsYXNzX3RvX3N0cihxLT5jbGFzcyksCj4gcS0+bG9naWNhbF9tYXNrLCBn
dWNfaWQpOwo+IMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2d0X2RiZyhndCwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJFbmdpbmUgbWVtb3J5IENBVCBlcnJvcjogY2xhc3M9JXMsCj4gbG9n
aWNhbF9tYXNrOiAweCV4LCBndWNfaWQ9JWQiLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfaHdfZW5naW5lX2NsYXNzX3RvX3N0cihxLT5jbGFz
cyksIHEtCj4gPmxvZ2ljYWxfbWFzaywgZ3VjX2lkKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3RfaW5mbyhndCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIkVuZ2luZSBtZW1vcnkgQ0FUIGVycm9yOiBjbGFzcz0lcywK
PiBsb2dpY2FsX21hc2s6IDB4JXgsIGd1Y19pZD0lZCIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2h3X2VuZ2luZV9jbGFzc190b19zdHIo
cS0+Y2xhc3MpLCBxLQo+ID5sb2dpY2FsX21hc2ssIGd1Y19pZCk7Cj4gwqAKPiDCoMKgwqDCoMKg
wqDCoMKgdHJhY2VfeGVfZXhlY19xdWV1ZV9tZW1vcnlfY2F0X2Vycm9yKHEpOwo+IMKgCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlZmF1bHQuYwo+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4gaW5kZXggYWZiMDY1OThiNmUxLi42YmVlNTNkNmZm
YzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VmYXVsdC5jCj4gQEAgLTIyMywyMiArMjIzLDIy
IEBAIHN0YXRpYyBib29sIHhlX3BhZ2VmYXVsdF9xdWV1ZV9wb3Aoc3RydWN0Cj4geGVfcGFnZWZh
dWx0X3F1ZXVlICpwZl9xdWV1ZSwKPiDCoAo+IMKgc3RhdGljIHZvaWQgeGVfcGFnZWZhdWx0X3By
aW50KHN0cnVjdCB4ZV9wYWdlZmF1bHQgKnBmKQo+IMKgewo+IC3CoMKgwqDCoMKgwqDCoHhlX2d0
X2RiZyhwZi0+Z3QsICJcblx0QVNJRDogJWRcbiIKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIlx0RmF1bHRlZCBBZGRyZXNzOiAweCUwOHglMDh4XG4iCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJcdEZhdWx0VHlwZTogJWRcbiIKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIlx0QWNjZXNzVHlwZTogJWRcbiIKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIlx0RmF1bHRMZXZlbDogJWRcbiIKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIlx0RW5naW5lQ2xhc3M6ICVkICVzXG4iCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJcdEVuZ2luZUluc3RhbmNlOiAlZFxuIiwKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGYtPmNvbnN1bWVyLmFzaWQsCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVwcGVyXzMyX2JpdHMocGYtPmNvbnN1bWVyLnBh
Z2VfYWRkciksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvd2VyXzMyX2Jp
dHMocGYtPmNvbnN1bWVyLnBhZ2VfYWRkciksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBmLT5jb25zdW1lci5mYXVsdF90eXBlLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwZi0+Y29uc3VtZXIuYWNjZXNzX3R5cGUsCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHBmLT5jb25zdW1lci5mYXVsdF9sZXZlbCwKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcGYtPmNvbnN1bWVyLmVuZ2luZV9jbGFzcywKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfaHdfZW5naW5lX2NsYXNzX3RvX3N0cihwZi0K
PiA+Y29uc3VtZXIuZW5naW5lX2NsYXNzKSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcGYtPmNvbnN1bWVyLmVuZ2luZV9pbnN0YW5jZSk7Cj4gK8KgwqDCoMKgwqDCoMKgeGVf
Z3RfaW5mbyhwZi0+Z3QsICJcblx0QVNJRDogJWRcbiIKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiXHRGYXVsdGVkIEFkZHJlc3M6IDB4JTA4eCUwOHhcbiIKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiXHRGYXVsdFR5cGU6ICVkXG4iCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlx0QWNjZXNzVHlwZTogJWRcbiIKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiXHRGYXVsdExldmVsOiAlZFxuIgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJcdEVuZ2luZUNsYXNzOiAlZCAlc1xu
Igo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJcdEVuZ2luZUluc3RhbmNl
OiAlZFxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZi0+Y29uc3Vt
ZXIuYXNpZCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1cHBlcl8zMl9i
aXRzKHBmLT5jb25zdW1lci5wYWdlX2FkZHIpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxvd2VyXzMyX2JpdHMocGYtPmNvbnN1bWVyLnBhZ2VfYWRkciksCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGYtPmNvbnN1bWVyLmZhdWx0X3R5cGUsCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGYtPmNvbnN1bWVyLmFjY2Vzc190
eXBlLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBmLT5jb25zdW1lci5m
YXVsdF9sZXZlbCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZi0+Y29u
c3VtZXIuZW5naW5lX2NsYXNzLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHhlX2h3X2VuZ2luZV9jbGFzc190b19zdHIocGYtCj4gPmNvbnN1bWVyLmVuZ2luZV9jbGFzcyks
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGYtPmNvbnN1bWVyLmVuZ2lu
ZV9pbnN0YW5jZSk7Cj4gwqB9Cj4gwqAKPiDCoHN0YXRpYyB2b2lkIHhlX3BhZ2VmYXVsdF9xdWV1
ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqdykKPiBAQCAtMjYwLDggKzI2MCw4IEBAIHN0YXRp
YyB2b2lkIHhlX3BhZ2VmYXVsdF9xdWV1ZV93b3JrKHN0cnVjdAo+IHdvcmtfc3RydWN0ICp3KQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfcGFnZWZhdWx0X3NlcnZp
Y2UoJnBmKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9wYWdlZmF1
bHRfcHJpbnQoJnBmKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2d0X2RiZyhwZi5ndCwgIkZhdWx0IHJlc3BvbnNlOgo+IFVuc3VjY2Vzc2Z1bCAl
cGVcbiIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgRVJSX1BUUihlcnIpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2luZm8ocGYuZ3QsICJGYXVsdCByZXNwb25z
ZToKPiBVbnN1Y2Nlc3NmdWwgJXBlXG4iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRVJSX1BUUihlcnIpKTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcGYucHJvZHVjZXIub3BzLT5hY2tfZmF1bHQoJnBmLCBlcnIpOwoK
