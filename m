Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE665606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P+rVU2SK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5EF10E5CD;
	Fri, 23 Oct 2026 09:01:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0599B10E5C9;
 Fri, 23 Oct 2026 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792746097; x=1824282097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+loRmhKxUAQPeObNtYyt8Fgz9+EUMEVzvjK1/OI2q6s=;
 b=P+rVU2SKy5nW3n79E+rN7i8q1YrhAm+3GuTqOFtW+v2oNLRFmideUwyd
 Qrhpz52l35pBg8OfOQdLsLRup1J6oiUJBLZWzIUBVNN3Ye2WSHRYf7qb+
 aT1zj8ewNkHC7Gqe7Jb9uwv0YcIeY7GDOb1TOWrxA1ZL/wOVuXs1h+gdx
 jU+hXvd0ohayb5nPt52Kyoi800EjKkUOAKpuiyhw+D/1JZcqfCAb618Yk
 /vEd+oAL4VLbHFJZjspNCzzTS+1ndtRP5iPJ1GLub+xkM3rzN7BstKksG
 aY0EshPMDz9+3nbzEJwUD8if6N725v9IlOvQ+g0wKqZzk1wJFLwkN1mm1 w==;
X-CSE-ConnectionGUID: xC/gZRcyQwyHh61vNOriNw==
X-CSE-MsgGUID: X0TOSKKpTI2b0C+7aNUJhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1536390"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1536390"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:01:37 -0700
X-CSE-ConnectionGUID: CGWWPV0LRfysyJaMGT30AA==
X-CSE-MsgGUID: u9/FrSDtT4CA0RDLi8A3cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3522748"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:01:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:01:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 02:01:16 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fnu37in58ftnVHXzumWVDjz5znP+Ys7HJt0vwTQpjkkzam+PWitd91zs1lqSZTqbq7a91Ncw8HvfbfFYQ2mRfaWdaUMkMainyHyX1PxqyFYa7B18EK0uij4HKgCvBkM/4/YnwA0+ptKE3TPVCECO/wLWyNvtsO7J02xUoP+Ux7VmcKkRSlmEl7lArNuxVNfQmVvwBiOPsCalEwlKFdqjo8NTEC24TC3UqrrPnbelu/i0PXRlw+m3l/6rUTpV9q7UvGBoo+lvQfepXwCEog6IWwpF0p0ctsRmSsjAPUScbwArrRX5FKO060TI9ppA+1JY1UE3VctJEpgYykwhHY2cOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+loRmhKxUAQPeObNtYyt8Fgz9+EUMEVzvjK1/OI2q6s=;
 b=BLvtxYnyhXj8CA6K1keUXoSrHHVkka2oGie/GiUs7kBYNKv1/Y4NjL/5jrWmvqzZK1tefDeIQ2yuOZ+WQ8P0pRdByT0refUXwR9zm1faeOGGHycB5QCUacJMdiTof7oYgvPUUFYu6R91Te5fxOXUC2zV7uFeNo2RYPGKCki+44LXv5K7Lj1F+INlS7UxFb6vhBlqljgyj495JGergEUDRjJhqy55OAkvuL0yDYSj2spvpBPfAuIO4Z+XoeSBKE3iH2kYy60EyBeIOsGwxVxT+fxTkH3ehDyirJNi/gTakE/XFC+XyxSHsP1dyPq28wkBiaWwNi0Gk327iwaIovKpcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 09:01:13 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0522.017; Fri, 23 Oct 2026
 09:01:13 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [PATCH v2] drm/i915/cmtg: Disable CMTG after encoder disable in
 hsw_crtc_disable()
Thread-Topic: [PATCH v2] drm/i915/cmtg: Disable CMTG after encoder disable in
 hsw_crtc_disable()
Thread-Index: AQHdYY9SYEPD0xWKM06HGo0VH85Mc7cKmOsAgAA2nnA=
Date: Fri, 23 Oct 2026 09:01:12 +0000
Message-ID: <DS0PR11MB8049E7519329D4E03500EA5DF9642@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20261021190631.527183-1-animesh.manna@intel.com>
 <15f30286-0c23-421a-9d1d-860a2b12850a@intel.com>
In-Reply-To: <15f30286-0c23-421a-9d1d-860a2b12850a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|SN7PR11MB6560:EE_
x-ms-office365-filtering-correlation-id: bfa61383-81b6-4d5b-6716-08df30e43035
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|261009223027099003|261021121427099003|261021123027099003|10067099003|56012099006|261022105027099003|6133799003|261022075727099003|22082099003|18002099003|38070700021|4143699003|5023799004|11063799006;
x-microsoft-antispam-message-info: VxreK24XbETYChFF4L3P7t3dWkvBVsMSqLT4Q86aYe8Jzw0uuYHXTitd3cboF3y0U9x8Xx/PnLUhdYZIZqpp6wLKkCmKomoPo0JA6gYFwBTP5DkX8aVBXDxB7kx3rAM/8DnNKS/MF7E6MUA3J9L7oCS0PtWIPyRjXqQVvqsZ3Fv9VmzwZ9k5rihVhs/Tq0/gaLYQO2XsVXudrsLKV994ZU+TxJYYM5ZluF+Vvd0ZIGm5ehKQWW3CBPgk9iWgHjEyRWfAkEXKnw7Dr9PC7E3MW5LLzDmz8cc5UGAIV+vsO4KGyPU/H6ns2ibmFN8pJ+/QHDddHK07/NcOlpR0PN0iIK+OJKvyknHIp34jk6tLvDNOUDIcAz0bRFwj4OUzUw6jPCL+eTY6Z7NGvqlhn3op1mUG83Udw2VbHYc9mPn+8Rpnxdcw2s4BRyKCCVB/hnNZisxPe0ebLuuh++ubvZiKKHo6tN6/XmCx8Ai/auE6Lbh5ZTEih7I/1ILv15lLcHeuZWe/XyqiL/gU43qHxFiSRhQFaK8BUkqN511xkaVXb5N7Lzn3evrwPcmrFTo79TqWAI2caq2KGBA8zYLJ2zHzErTSO9pVYgQfBHCK3iCynybk1+vKArfd0tQU2/OwHJzFSsduccChnK+DNqgfaijj+1zKJB+PBndL2jYlywLqCQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(261022105027099003)(6133799003)(261022075727099003)(22082099003)(18002099003)(38070700021)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmxiV1RnRzhhYlpkcUJxWC9pVEg5TDUwajdOL211TWtGUnJnVTJTMlZFN2o2?=
 =?utf-8?B?SmdNWUdvbFpFSXZNeU1ZaVFDeUFyNkc1cGFVZXMyL3lqS01YdDhKeXc5YWZF?=
 =?utf-8?B?Nm84TnhvZ0NLeHNab3hBcnBzZG5xN0U4STZ6akRNdmRGcjNOayt3eitUNER6?=
 =?utf-8?B?SnV5USt2QURJaFEyUzVTSCtpTHFkVlR1RjBIU01peEw5Y1JCZ2ZjNDZkNlBM?=
 =?utf-8?B?ZTkvU0lCcS9wbmZjKytaWlhiNjIxWnJ3aW1HTFBLWFF1RGNRbzk5TFlYUmRS?=
 =?utf-8?B?QWQ4b2FlVlRJRDJ0WTA0eDZ6aGlVdWp6UzJvUUswcHNHWnJwV3BCU1RCVFBV?=
 =?utf-8?B?dDl6Wk4ya3Q2UUNORit4cmZnaGduR1ZpRHFoUkxDV1JmbXpYVG5pSlVHWThT?=
 =?utf-8?B?a3hGSCtvUTVlbk5NYVhCcXRLeHl4YTBoWXZNeUh3V0RJdXBuS25qS2sxZzBx?=
 =?utf-8?B?WENqTVlRSjZuQmpINnlkaUN3ZVA3T2JUSVB0WmU0MmhhU3QxWmlJR2lWc3lt?=
 =?utf-8?B?eHRmZXRxTDh6cHoyVkFVc2dBUk4vYnVsZE82eWVBS0dIWDE1cjJOSkdIaTV1?=
 =?utf-8?B?VHNsendobElRODBDejhwZ2N3S1NIcFI0c01XOG9ONUN1L3ZiOFpvcTRRWU5G?=
 =?utf-8?B?WUJ4RGJpQSsrbFpOQ0RCemw5c1l1M1BxcWUraXhzcHdqc3VKVDZGZnpQREhI?=
 =?utf-8?B?bEZNeUdrVmtWUUdQaTZtTUc0TUZ2RGVxTk9LSmc2QmNrL1YrWGZSTHNzekhS?=
 =?utf-8?B?c1Y5YkFpVm5JdWJnS2g0QWwrb25aaWFiTlNPdmJoNVFJM3RuNndKS3Y5dUVI?=
 =?utf-8?B?UExSZzU4dm54Z0JjSXhDNFpqUXNZdlEyc1NJQ2VSS3p5MFMxbW1iQVh1ejlP?=
 =?utf-8?B?VngwQnROeTFNTjIra0dTTy9SUGV6K1pLeGN6ajBqaFRMdEdrbVQ5WFNPdTda?=
 =?utf-8?B?d2dnWWVucE9aMzA2RzVBTnlXTlRVV1Z6S3BPZEg0blB3Unc0aWxES1RqWmFp?=
 =?utf-8?B?TVNqN1JBTjNyL0ZENjZNSG1TVnhqemVLQW9UdGZHbUppWGJVdDZ5bHJFSEMv?=
 =?utf-8?B?cGo0WUJLTW5VR1ZkL1A5eVAyV0lCZlI1SzdidFhXdTBIMnJ3d2pSVThoaHFY?=
 =?utf-8?B?N01kQkpjVVpSMFZ3OWQ4d1d1QnhiZGNGbGE5ZUlGc3oxYnZhdkk4Z1JIcUd3?=
 =?utf-8?B?dlY2cGZhMWo2blhOZFhXU0pybld4NWhSZVFhVzFNZGdhUW5idzM0dFhOMnpP?=
 =?utf-8?B?T0ZlSGtQNWtXZjI3K0hscDQ2Y05nVUluQThWVHlUemRyQUVleS9KY21DK1FY?=
 =?utf-8?B?MXFBV3Nuckx5RDY5WGQ0Nkk2SUJIZzdzaWQ0ZHI1OW5EbzdZMDNWV3hkV2Zw?=
 =?utf-8?B?RWZHVFM1TlhKYkhBc3RKRHRUN1BDZUpocXlMYUxUejFGeDhsSlYzUFJTcWZG?=
 =?utf-8?B?M2VxZWI0Rm9mRjFsL3dYRytnS3NIaTR6djM0bmw3Um55bE5VVVdzaC9BbGEr?=
 =?utf-8?B?RGdZcGhsajgyY0NibkszZ1lUcEdJZnVqZGNaMXN6Yk9IdUNsWHlMbERVQkZi?=
 =?utf-8?B?elE0UUFJcFdvOVhkZEthZzBIMnFLWC9YcnVmOTNTZDBVcW5ia1dnKzdidXda?=
 =?utf-8?B?L3dPakF0eGsydnBxREJsakE2T3B2RVVWWk82SHlHU25DWTlPN1ZRRkh4ckpK?=
 =?utf-8?B?YlZ4eDE3eEgyRHNVOTk4cGgwLzZxb0JLb2dveGdIaXN3ZHZyUGJDSHpLWVRz?=
 =?utf-8?B?Mm8yQzBLam90cERoQldRN25NZ0RwNE90cWxLSmxqVmtyQkxRcW81eWIwcm9P?=
 =?utf-8?B?a2pPUHhaY3pzbmdvcmNQZFJiSC9KczhtaWhJR0J2L2NoKzBoTFFWRURNTFNU?=
 =?utf-8?B?YW1ZcjgwbWFLVDhSRS85ZU9oVTh5RUVnT0lvdVd3S3ppY3o1TzFJbVFVeUw0?=
 =?utf-8?B?QVlmK0ZIT2JHL2pOaDNwNmVDUTBtbjlla2ZqYVQ3L0lIWWhQM1lMWU5zWDVK?=
 =?utf-8?B?QlpaUE5lb2Ruc0lrQ2o1OWN2RnRLWUpoOXorK1V6UjFjL0ZnYTI0U002WGxR?=
 =?utf-8?B?MWlQY3hZV0dkcUFRcDBKZzQzZHNROE9MNThYa21aNmZjUTBOTUxIcWkxQ2xk?=
 =?utf-8?B?RXUwYWtKNHhKU013Sk9uNFdYM1RDZ2JPeWphOXprbWFOMlhIeVNHNHdCcWtz?=
 =?utf-8?B?THFwNlFKUnlyeGlJaVluM3ROY2dMcCtzOHNGL3lxTTBOK0IwdkNIK2F5bTBo?=
 =?utf-8?B?TGc0Q3BlWTVTb2JFZSs5T1pWOWoxMlRzajlPeU5YM0dHN3dzM3dLTHk3QVdl?=
 =?utf-8?B?RCtMRTRJUU9BNWxId3U5bi85Ni9adzZ3QlMxT1g5eDZXUzRaK1E1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jSGEy/mESR4I5x6ilkBKDGfveOS+3irbkNN/Gpu8cf81rYVOzULfD3InkV67ZhRJKnrt8RbDAB1ktLfSDSFugxxg30ikbow9YqMNMdenLc+e6yOhRVsoSpgNEmMY1t46aGQbWRLvdSP2Gcm45DJSzSf6pQ+7DdqAT9LcmRaf10AJgKai4JNmHJLKf0fMqpxi0hS+JPLEUWdlEh49dH7rvt9eLVt63yUdOYNym9Moqx1Esh2Sociri8B0bLkuBdf0oRv9UOkuuThPiDDmcYGpnyYJBkMm89kgTMBRma+dR/JEsvU5dPu8QkUU+F67qByDyfN4jP4pwlMFXNiO0ZG0QQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa61383-81b6-4d5b-6716-08df30e43035
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 09:01:12.8990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+Cn+bcb1ae8SmCe+DqAGrkCCzNqV8yB52vUIZaEU1RG6xSXJYthWnqaVfk5TircYJx+Ti4skt+8W3/y7/Kn5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGliaW4gTW9vbGFrYWRh
biBTdWJyYWhtYW5pYW4NCj4gPGRpYmluLm1vb2xha2FkYW4uc3VicmFobWFuaWFuQGludGVsLmNv
bT4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDIzLCAyMDI2IDEwOjQ5IEFNDQo+IFRvOiBNYW5u
YSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRlbC0NCj4gZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBO
aWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47IFNoYW5rYXIsIFVtYQ0KPiA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBkcm0vaTkxNS9j
bXRnOiBEaXNhYmxlIENNVEcgYWZ0ZXIgZW5jb2RlciBkaXNhYmxlIGluDQo+IGhzd19jcnRjX2Rp
c2FibGUoKQ0KPiANCj4gT24gMTAvMjIvMjAyNiAxMjozNSBBTSwgQW5pbWVzaCBNYW5uYSB3cm90
ZToNCj4gPiBoc3dfY3J0Y19kaXNhYmxlKCkgZGlzYWJsZXMgQ01URyBhdCB0aGUgdmVyeSBzdGFy
dCBvZiB0aGUgQ1JUQyBkaXNhYmxlDQo+ID4gc2VxdWVuY2UsIGJlZm9yZSBpbnRlbF9lbmNvZGVy
c19kaXNhYmxlKCkuIFdpdGggdGhpcyBvcmRlcmluZywgdGhlDQo+ID4gd2FpdCBmb3IgQ01UR19T
VEFURSB0byBjbGVhciBhZnRlciBDTVRHX0VOQUJMRSBpcyBjbGVhcmVkDQo+ID4gaW50ZXJtaXR0
ZW50bHkgdGltZXMgb3V0Og0KPiA+DQo+ID4gICAgeGUgMDAwMDowMDowMi4wOiBbZHJtXSBDTVRH
OiBBIGRpc2FibGUgdGltZW91dA0KPiA+ICAgIFdBUk5JTkc6IGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfY210Zy5jOjIwNQ0KPiA+IGludGVsX2NtdGdfZGlzYWJsZSsweDMzMS8w
eDNkMCBbeGVdDQo+ID4NCj4gPiBUaGlzIGlzIHNlZW4gd2l0aCBpZ3RAa21zX2hkckBicGMtc3dp
dGNoLXN1c3BlbmQsIHdoaWNoIHJlcGVhdGVkbHkNCj4gPiBkaXNhYmxlcyBhbmQgcmUtZW5hYmxl
cyB0aGUgZURQIGFjcm9zcyBtb2Rlc2V0cyBhbmQgc3VzcGVuZC9yZXN1bWUuDQo+ID4NCj4gPiBN
b3ZlIHRoZSBDTVRHIGRpc2FibGUgYWZ0ZXIgaW50ZWxfZW5jb2RlcnNfZGlzYWJsZSgpLCBzbyB0
aGUgZURQLXNpZGUNCj4gPiB0ZWFyZG93biAocGFuZWwgdW5wcmVwYXJlLCBBTFBNIGRpc2FibGUs
IGJhY2tsaWdodCBvZmYpIGhhcyBjb21wbGV0ZWQsDQo+ID4gYnV0IGtlZXAgaXQgYmVmb3JlIGlu
dGVsX2VuY29kZXJzX3Bvc3RfZGlzYWJsZSgpIGFuZA0KPiA+IGludGVsX2RwbGxfZGlzYWJsZSgp
LiBUaGUgdHJhbnNjb2RlciB0aW1pbmcgZ2VuZXJhdG9yLCBEREkgYnVmZmVyIGFuZA0KPiA+IHBv
cnQgUExMIGFyZSB0aGVyZWZvcmUgc3RpbGwgcnVubmluZyB3aGlsZSBDTVRHX1NUQVRFIGlzIHBv
bGxlZCwgYW5kDQo+ID4gdGhlIHJlcXVpcmVtZW50IHRvIGRpc2FibGUgQ01URyBiZWZvcmUgdGhl
IHRyYW5zY29kZXIgYW5kIHRoZSBwb3J0IFBMTA0KPiA+IGZlZWRpbmcgaXQgYXJlIHR1cm5lZCBv
ZmYgaXMgcHJlc2VydmVkLg0KPiA+DQo+ID4gdjI6DQo+ID4gLSBNb2RpZnkgY29tbWl0IGRlc2Ny
aXB0aW9uIHJlZ2FyZGluZyBQU1IgZXhpdC4gW0RpYmluXQ0KPiA+IC0gQWRkIGZpeGVzIHRhZy4g
W0phbmksIERpYmluXQ0KPiA+DQo+ID4gRml4ZXM6IGM1ODhhMzI0MTgzYiAoImRybS9pOTE1L2Nt
dGc6IEFkZCB0cmlnZ2VyIHRvIGVuYWJsZS9kaXNhYmxlDQo+ID4gY210ZyIpDQo+ID4gU2lnbmVk
LW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDE1
ICsrKysrKysrKysrLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ID4gaW5kZXggNzYwMmY2MzNmNDlkLi4xYzQyYWE0Nzdm
M2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYw0KPiA+IEBAIC0xODU0LDE1ICsxODU0LDIyIEBAIHN0YXRpYyB2b2lkIGhzd19jcnRj
X2Rpc2FibGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ID4gICAJCWlu
dGVsX2F0b21pY19nZXRfb2xkX2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOw0KPiA+ICAgCXN0cnVj
dCBpbnRlbF9jcnRjICpwaXBlX2NydGM7DQo+ID4NCj4gPiAtCWlmIChjcnRjLT5jbXRnLmVuYWJs
ZWQgJiYgaW50ZWxfY210Z19pc19hbGxvd2VkKG9sZF9jcnRjX3N0YXRlKSkgew0KPiA+IC0JCWlu
dGVsX2NtdGdfc2V0X2Nsa19zZWxlY3Qob2xkX2NydGNfc3RhdGUpOw0KPiA+IC0JCWludGVsX2Nt
dGdfZGlzYWJsZShvbGRfY3J0Y19zdGF0ZSk7DQo+ID4gLQl9DQo+ID4gICAJLyoNCj4gPiAgIAkg
KiBGSVhNRSBjb2xsYXBzZSBldmVyeXRoaW5nIHRvIG9uZSBob29rLg0KPiA+ICAgCSAqIE5lZWQg
Y2FyZSB3aXRoIG1zdC0+ZGRpIGludGVyYWN0aW9ucy4NCj4gPiAgIAkgKi8NCj4gPiAgIAlpbnRl
bF9lbmNvZGVyc19kaXNhYmxlKHN0YXRlLCBjcnRjKTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJ
ICogRGlzYWJsZSBDTVRHIGFmdGVyIHRoZSBlbmNvZGVycyBhcmUgZGlzYWJsZWQsIGJ1dCBiZWZv
cmUgdGhlDQo+ID4gKwkgKiB0cmFuc2NvZGVyIGFuZCBwb3J0IFBMTCBhcmUgdG9ybiBkb3duIGlu
DQo+ID4gKwkgKiBpbnRlbF9lbmNvZGVyc19wb3N0X2Rpc2FibGUoKS9pbnRlbF9kcGxsX2Rpc2Fi
bGUoKS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKGNydGMtPmNtdGcuZW5hYmxlZCAmJiBpbnRlbF9j
bXRnX2lzX2FsbG93ZWQob2xkX2NydGNfc3RhdGUpKSB7DQo+ID4gKwkJaW50ZWxfY210Z19zZXRf
Y2xrX3NlbGVjdChvbGRfY3J0Y19zdGF0ZSk7DQo+ID4gKwkJaW50ZWxfY210Z19kaXNhYmxlKG9s
ZF9jcnRjX3N0YXRlKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gICAJaW50ZWxfZW5jb2RlcnNfcG9z
dF9kaXNhYmxlKHN0YXRlLCBjcnRjKTsNCj4gPg0KPiA+ICAgCWludGVsX2RwbGxfZGlzYWJsZShv
bGRfY3J0Y19zdGF0ZSk7DQo+IA0KPiBOaXQ6IFNpbmNlIHRoZSBpc3N1ZSBpcyBoYXJkIHRvIHJl
cHJvZHVjZSBhbmQgdGhlIGV4YWN0IGNhdXNlIGlzIG5vdCBjb25maXJtZWQsDQo+IHlvdSBjb3Vs
ZCBtZW50aW9uIHRoYXQgbW92aW5nIHRoZSBDTVRHIGRpc2FibGUgbGF0ZXIgYXZvaWRzIHRoZSB0
aW1lb3V0IGluDQo+IHRlc3RpbmcsIGJ1dCB0aGUgZXhhY3QgcmVhc29uIGlzIHVua25vd24uIE5v
dCBhIGJsb2NrZXIuDQoNClllcyBhbHJlYWR5IHRyaWVkIHRvIGV4cGxhaW4gaW4gY29tbWl0IGRl
c2NyaXB0aW9uIHRocm91Z2ggLSAiIE1vdmUgdGhlIENNVEcgZGlzYWJsZSBhZnRlciBpbnRlbF9l
bmNvZGVyc19kaXNhYmxlKCksIHNvIHRoZSBlRFAtc2lkZSB0ZWFyZG93biAocGFuZWwgdW5wcmVw
YXJlLCBBTFBNIGRpc2FibGUsIGJhY2tsaWdodCBvZmYpIGhhcyBjb21wbGV0ZWQgIg0KSGVyZSBl
eHRyYSBkZWxheSBpcyBoZWxwaW5nLg0KDQo+IA0KPiBQbGVhc2UgYWRkIGEgYENsb3NlczpgIHRh
ZyBmb3IgdGhlIGBpZ3RAa21zX2hkckBicGMtc3dpdGNoLXN1c3BlbmRgIGZhaWx1cmUsDQo+IGlm
IGFwcGxpY2FibGUuDQoNCkFGQUlLIGN1cnJlbnRseSAnQ2xvc2VzOicgdGFnIGlzIHVzZWQgb25s
eSBmb3IgZ2l0bGFiIGlzc3VlIG5vdCBmb3IgdGhlIGlzc3VlcyByYWlzZWQgaW4gaW50ZXJuYWwg
dmFsaWRhdGlvbi4NCg0KPiANCj4gdjIgd2FzIHNlbnQgYXMgYSBuZXcgdGhyZWFkIHdpdGggYSBk
aWZmZXJlbnQgc3ViamVjdC4NCg0KQXMgc3ViamVjdCBsaW5lIGlzIGNoYW5nZWQgc28gcGF0Y2h3
b3JrIGNyZWF0ZWQgdG8gZGlmZmVyZW50IHRocmVhZC4gTmV4dCB0aW1lIG9ud2FyZHMgaW4tcmVw
bHktdG8gbWF5YmUgdGhlIGNvcnJlY3QgYXBwcm9hY2gsIHdpbGwgdHJ5IGluIGZ1dHVyZS4NCg0K
PiBQbGVhc2UgYWRkIGEgbGluayB0byB2MSBiZWxvdyB0aGUgYC0tLWAgbGluZSBzbyB0aGUgcmV2
aWV3IGhpc3RvcnkgY2FuIGJlIHRyYWNlZC4NCj4NCiANCnYxOiBJbml0aWFsIHZlcnNpb24gaXMg
aW1wbGljaXQgZm9yIGFsbCBwYXRjaGVzIHNvIGRyb3BwaW5nIGl0Lg0KDQoNCj4gSW4gdGhlIG9y
aWdpbmFsIHNlcmllczogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8x
NzE3NjYvLA0KPiBKYW5pIGFza2VkIGFib3V0IENjOiBzdGFibGUuIFBsZWFzZSBjbGFyaWZ5IHdo
ZXRoZXIgdGhpcyBwYXRjaCBpcyBhcHBsaWNhYmxlIGZvcg0KPiBzdGFibGUuDQoNClllYWgsIG15
IHBsYW4gaXMgdG8gY29weSBzdGFibGUgbGF0ZXIgYWZ0ZXIgZmV3IGRheXMgb2YgbWVyZ2UgaW4g
ZHJtLXRpcC4gSnVzdCB0byBhdm9pZCB1bm5lY2Vzc2FyeSBiYWNrcG9ydCBpZiB0aGUgaXNzdWUg
aXMgY29taW5nIGFnYWluLg0KDQo+IA0KPiBXaXRoIHRoZSBhYm92ZSBhZGRyZXNzZWQsIExHVE0u
DQoNClBsZWFzZSBsZXQgbWUga25vdyBmb3IgYW55IGZ1cnRoZXIgY2xhcmlmaWNhdGlvbi9zdWdn
ZXN0aW9uLg0KDQpSZWdhcmRzLA0KQW5pbWVzaA0KDQo+IA0KDQo=
