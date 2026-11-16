Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19482606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 23:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RDVjJFUA;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Ou9v/ezM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26CD10F527;
	Mon, 16 Nov 2026 23:51:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F3710F527
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 23:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794873068; x=1826409068;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2wiSF1Z/8DMcMoMiTv/FchcTztpchNffXJUN8wx9AJ8=;
 b=RDVjJFUA92dJWtFgBBok/IrtvYlDSlsmVvkHu6J3u7JxOWPBpFjAFinc
 IP4UENHv5yUBCoewde4zYUA9kOcC6GhL6nTfNU5VDb4euUHXmjxyjRSNX
 c5dlyx+RmgpqsBTVAWprbVG0G8F9L8NHlpZgdXN1HWwDw1TZ/4jcM6aau
 8yzAwc0B7REnVE0M+RYYLb3+aPSNLdFp/0k2HlwycXvNoTLEXgh9HO6m3
 sU/RSk9CBTLhCKxkYY2AI7DcGrEYbqQB8hJiO7HynBZtnQMSeQQ1ONrQu
 9a8lTqk6ZSImbiQAFM/zwl48Ks2H4JTNFm2mAEjvM9XJGxjKq7AAJ0VVZ Q==;
X-CSE-ConnectionGUID: GCgBne12ROasyEdt+fLUVA==
X-CSE-MsgGUID: lQ+RJlh8QxqszIVAZIOafw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3707283"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3707283"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 15:51:07 -0800
X-CSE-ConnectionGUID: xqYO6wqyRcOeZFbFUl3OnA==
X-CSE-MsgGUID: 6XAdOVafROKQb1evTVqa0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; d="scan'208";a="11598057"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 15:51:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:51:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 15:51:07 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:51:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuZuLxXm+JEVpkPoeRFLQVwO0UJUdVTOGT9xbvmO1q4JOQB/nGqMu2S7dBfoO/SXbAgHgMMrGOa4nqIjYC3kk02GBXckd5Pqd35IyjTDhsUwiIlWGDG/nMeG8uzk7bzUg1RH9DR7RxklRa4xbQ0baT7+rMLfDz64Q34XCDj4Oh5xJ8Xw5OuUsSDPcixF3J7UEwF0G1KM8pdIAV1conetmsdavcsTLNrPv6M/yzJB325FSoja3Zmqq8I41CUQIqWAvQSb38zZPVXFAxF3KjqcKWvySAyVWb6oSEBOcI6ViWEE2JeDZEHqDiZp8ElH6INWwe9NCKAvT0QYGMpKgeEu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wiSF1Z/8DMcMoMiTv/FchcTztpchNffXJUN8wx9AJ8=;
 b=lD5m4QJMIGLVf8Ez+U6GM6fHBXP1tk9W6QPv8UAXMPY1pXIEMWRIAspbs7ppED1ideRsn0Pm1qJm4njhW6HI0T3yEFvPwIxdA5CjR9cj+c0zKVPvt4GLRZqC1C7tuWRLpBjw2wmFL28EMqbsP+E9XJrNT3+jnF7mFCdmS0EeJLmhSSbcHctwCkgKVgFooiYmmyY/nZasV4CCYZ+KVX4q3cYKYjO2pGarm79GSTGFnYJb6tBXd6xIDwd8IcGYvywapUOm/cBUEQRBlcEBIe2orAQuaMwq3DHCh4h6/1AxmlTWiITTC5lg86fxUEAEgqV0KZJfOPw9O4gWFjm/k7VIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wiSF1Z/8DMcMoMiTv/FchcTztpchNffXJUN8wx9AJ8=;
 b=Ou9v/ezMRXINXHQxKtb2lhrKI4GZArpScbcHqg7gZ2idy+3UGClnXdJeFIc0RsWJUamU26Kh5Ce2TzsCZQ8IiBuKgo5dIS8Q9V5/N7PZrewom0Dd67HjRtiG8/VDQ5k9mVCeLs5xHbU345rHpcc59WzZM9LiZDKxYldIzVQeH70=
Received: from IA4PR11MB9012.namprd11.prod.outlook.com (2603:10b6:208:56d::14)
 by SA2PR11MB4859.namprd11.prod.outlook.com (2603:10b6:806:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:51:03 +0000
Received: from IA4PR11MB9012.namprd11.prod.outlook.com
 ([fe80::c3a4:5732:30b7:706d]) by IA4PR11MB9012.namprd11.prod.outlook.com
 ([fe80::c3a4:5732:30b7:706d%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 23:51:03 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
Subject: RE: [PATCH v1] drm/xe/guc: Reset TLB invalidation state in submit fini
Thread-Topic: [PATCH v1] drm/xe/guc: Reset TLB invalidation state in submit
 fini
Thread-Index: AQHdbd76M+G8rYsJFU6cR4ktuQ8HVrcxbMSg
Date: Mon, 16 Nov 2026 23:51:03 +0000
Message-ID: <IA4PR11MB9012D078F2244973C2FC7E7B9A7C2@IA4PR11MB9012.namprd11.prod.outlook.com>
References: <20261106110620.2065903-1-piotr.piorkowski@intel.com>
In-Reply-To: <20261106110620.2065903-1-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9012:EE_|SA2PR11MB4859:EE_
x-ms-office365-filtering-correlation-id: 64499409-a715-4f93-dfd6-08df443c7956
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261022105027099003|261026140227099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info: Blc8HSZDx4leMmUPr4WVEzPeP8U5hvJcWpcotHe1OSfbmqiE+PWZufXWiJFGSiV15icuMFA3Ct3Yead4cQLwYatEw7QHNBZHtbjyes8oTCwNnef8GhDbWcytEeBKcFKIVVbki4P1vvjVzkxImQA3nnVGipoUG4nje1FX6kpwdTXjdx+FUVbuGFs5FAo9f1dtf9YpvDAoKP951Qo72ZJBx88OHYozRlQwpJN/xTDgylXbAnXE/ZkcYTxS1foQKJ6Z2B3y3/15zoG2wCRDbwmGg7p1QLlvYqyxU99P213YdigLUQl7Lsd7i7QU8Wb0f2d6NLYQ/BN6DwPlYTukLWSHxb21XU4jreNc57e15/4ljENRxl9mwjbE7EgsCq5EDYhb9Z6aS0EFwG4ycCHZkF4+dfSH+55oIv7jUtz3zej/rXEBlAk7QDaOvtp5lPGGFIrR8NQuWwa/7N3Hhb0N2mabEvbVx0T9XmV/ANTfVWDRyJBjpDLpboLsr0OcrOmpbs5bKoTQ19ni7LbwkXPPMsisq1x43ZtdRbO44+N12G1zhqRvvwsgK7b+qHbHxMRD47yzcCIL4UR+KqrYpRzbyfWAQKxzULryeWBndVP91bgMcKFrJ4n/gVcnXTtQdyBaq5pQrt6zpEj+c98tx/vxSUQ8vCJKpKtM86OvFVNTvJZyEUSV3Qp5AgzMHqzuG/cKQSVBgA1LHBxTDFeTi2cAkadPqlkufN2rHVE11++x3u7+JQU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9012.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261022105027099003)(261026140227099003)(261021121427099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEtoL3ZhQSt1OWd1eDNQZTUwUUcyNTd4RTMyb0dmRWZuNzNHRXpFYy8waTdI?=
 =?utf-8?B?ZkIwZHFxNW1sYlkyYW1MMWlYWnVDc2o2QlBqbTlFWkw3QTZHQXpNeGo5V0xi?=
 =?utf-8?B?NmxSM0VIVXg5eVo3UEw1d1oyQ0VRU1FJM2sraFVOdUwvVnhRQ2F3Y2k1cVhl?=
 =?utf-8?B?SkRRZDliTUNWalhaMi9UeUZ1TlRDeHgzaVo5TnE5aDk5VXFqYVRsOUNyUnhN?=
 =?utf-8?B?Y29DaTN0bGRLRHZGbHRtZXhhbzZ0dXVWWTdHR2xxQlZBYStEd0xEaEVCbGU5?=
 =?utf-8?B?SnhOb1FKSWhiSHdkQVB2L2FVeUpNWFdGVi81YUNvQ2xBbE92Sm01YjFtcDhR?=
 =?utf-8?B?VHRSalkxcnVIVnlyYXZnbUZTZkdxYjBOWGhLQ3BjcFNrandMdzZhWjRrYzE5?=
 =?utf-8?B?c1ZrdjNNSEpvdEQzdytmYlNnbXFLelF6cDJ2SVo5ZDg2V3BQaEdzdXI2dHBa?=
 =?utf-8?B?UXNlSTl4L2FMOFBxOUJXZ2JmV2RvaFpJSFB6cHZZdGFsWFlCNm1DdEVKeThG?=
 =?utf-8?B?QlQ3KytrTzkycEVXblpCMy9iL0d0bUl4MERpcmhEa2g5Rlo4L0xoQlZTUHA3?=
 =?utf-8?B?UXFLa1JIV0tsWUFoaDB6SFdNc2xRTlBxbytReUdkbzJ0R0ZlZmZaQmx1NWNx?=
 =?utf-8?B?cXIyRFQwMm85VUF2cm5sZkJTUWlrZVJBSXR5alRhNGJLZU4xVi9JSE5iMTJG?=
 =?utf-8?B?L2ExejJPa3c5Z1JZNG1La1BkWHJXbE9FbWhMR2p6VU9ZYm5pU3BjdjhxV0Vw?=
 =?utf-8?B?QmFGZFVEMWN5aUVXUUVTYWlYNzlyUTJrL0VBajk2V0tYejRuQXJhQU95R0Nx?=
 =?utf-8?B?dGRLRmJGUkx1WG1leHFVQ1M2TVBoSXlmQXI3a2NEN2VHMHNOdnMxSXJ3SmVR?=
 =?utf-8?B?WTNRZEhEWTJ4ZUVYRU1SQkVmMHowU3hiT25BOU9TNGIwZzBhRithazZpdkNx?=
 =?utf-8?B?ME84aCtSa0NMNDVjR3JFenI1VkpYckFISGV6YkpaRDBzQTB5Unl3YStlaXVW?=
 =?utf-8?B?eEhnVHh5b0tvbFI0Zmd3MGc3VVNiZnpmSnZXeG5iclhKUVcxdnl5a1Bvd21B?=
 =?utf-8?B?WEtOdmFDSkhlUndxRWxXVjA3a0VLWGFPQ01CS3l1emg4clZ3MkRqMklJN21R?=
 =?utf-8?B?ejEwZFluTEt1Wk0rbTludmdGSExGM3pyOW9PYVA4ZEozYXRUNnVNZFNlQi9w?=
 =?utf-8?B?NmhLRitKbzlGRWF2RXQ3aHBwejk4WWpHS2htMHB6dEh0Nkc0ajlkMDRzN2tz?=
 =?utf-8?B?K2UxVmd0bGNHeCtBcVRsM3dPZEJrcjBiczdZUExXR2QrejhoSEtFK2pxWUND?=
 =?utf-8?B?OEFyLzZkSXhHb3g1L2NZZlFYWFlqWVB6YlpoQ0xHOGhBbjE0VzJxcHBmTXFZ?=
 =?utf-8?B?QkNCN09MZHR0dW5KQU9mc1NZeDM1dDRBRHdkRHpLb2Q3c1pzRkNCRzgyT0ov?=
 =?utf-8?B?bzY3b1dsaVFGcWE4aDF0a29CeDFqRkJxam1hcWc2NXlsVnpqLzdBR2ZnNC9o?=
 =?utf-8?B?TjhwdC82S09OR2d4cGR3N3VYQXFIZWZ4TkpycDlSWXRlaUwrb3QyT1RiaUhp?=
 =?utf-8?B?SVNHVi9hZmlvdW9zK1BibVJyaWoxVU1yUkpBWWtNbWF1RHUxWkZlblBPekZz?=
 =?utf-8?B?MlJxWHBhL01qY3NVeVNUV1JGb1VVeVg3YU9SU1ZmZ3U3dk45U3lUMnVsNXps?=
 =?utf-8?B?R3JiM2h6Wm16aWdxSVpVRXJ6Q01lTGV6TGhjQlM2bUY1QXlVM25laWE4ZTZp?=
 =?utf-8?B?c0t5MDlXZEZJbE94a3Y2R3c1dXBWQ25EOWFITXkwTXZlUk0yQXBSa1h3UWdz?=
 =?utf-8?B?cmxBSXhyYkozNTdydEo1djEyU0RIOFJkZnVySTc2V0VVN0xhSkI5dG5GaTN0?=
 =?utf-8?B?bjAyT0lFd2dkb2FtYjcxbWl0NXMwZDB5TzNrbWh4QVlIRi9FQmVwTEs0VXR3?=
 =?utf-8?B?SHFWWTZYbWhNeE9ReThmUXdwbnVUWWRhNk9PeDRGUlhvNW9wUTUzUnJQeC8w?=
 =?utf-8?B?Z1hKZmIvSVVnS1dHRUtyNHM3d0lKV2h6NEw3anBRQ1FTc3Z4L2ZMbGswQWNx?=
 =?utf-8?B?TTl3WDZoQUw4S0Q2eVl2VmZBVWE4MnFYbHNMY2U2K1BVNTQrTlM4c2FteUZF?=
 =?utf-8?B?Z0FUOFk4cTlReUtIa1d2anNkcURMNVNCRHc1SkhSdm5kLzh4WG45T2lkRVRE?=
 =?utf-8?B?ZW4ydXFuVzJkVTl0emRSbkczc3dYWXBWY2VQVEI2bEd6cVQyaVoyWGMvckFJ?=
 =?utf-8?B?MGtKMkVWdjBFVGF2cUN0WVV6OWhYOG5qVC9ZVFF1QnVGaC9oS2Y1eFRYSDBN?=
 =?utf-8?Q?Wyy7yIqMeWv0vqLoCr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BLNrhyeTjmhI+O5Sra4+6kD7lyWuX36it5YD5U8Uf5cEv0+VNeTs7YAyXqrtG+rnnhRlFeEojvqmExd24RG8lac2Ek4W31ONPUhBY4k30DJ2C0ZutjhtxZu0UKO2P4k2nYdleET7DF60CnI/keFZvbT6F/J/YmWraxPG5ZSkZZziVWUEw48nt1UnjxpU1INA54vtWlMNBb6LHp9wzSgqpHYBlJ1g7rr+iZrDSuHSEQkc9PXJwMr8abg2WvQkrGnDsdJdoFO+Sy2lQN+7q3J7cv7s1B6hcjqw+3HZQT/6D+lo77cnIIYFnY82dPLi0O0GqEYqFzQTVtO2WbHnUBgo/A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64499409-a715-4f93-dfd6-08df443c7956
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 23:51:03.4183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VouhYV99UFbwHgxqLBuWDELFBH9PRrZzp9UYllJb+HCbElOlviQGeEdB5l7gwFOw+d3zo+U92RvnYU9l0oY6hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4859
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBGcm9tOiBQaW90ciBQacOzcmtvd3NraSA8cGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20+DQo+
DQo+IGd1Y19zdWJtaXRfZmluaSgpIHN0b3BzIHRoZSBDVCBidXQgZG9lcyBub3QgY29tcGxldGUg
cGVuZGluZyBUTEIgaW52YWxpZGF0aW9uIGZlbmNlcy4gSWYgYW4gaW52YWxpZGF0aW9uIHdhcyBz
ZW50IHJpZ2h0IGJlZm9yZSB0aGUgc3RvcCwgaXRzIGRvbmUgbWVzc2FnZSBmcm9tIEd1QyBpcyBk
cm9wcGVkIGFuZCB0aGUgZmVuY2Ugb25seSBjb21wbGV0ZXMgd2hlbiBpdCB0aW1lcyBvdXQsIGxl
YXZpbmcgaXRzIHdhaXRlciBzdHVjayBmb3Igc2V2ZXJhbCBzZWNvbmRzLg0KPg0KPiBXZSBoaXQg
dGhpcyB3aGlsZSBkaXNhYmxpbmcgVkZzLCB3aGVyZSB0aGUgVkYgcmVtb3ZhbCB3YXMgYmxvY2tl
ZCB1bnRpbCB0aGUgVExCIGludmFsaWRhdGlvbiBmZW5jZSB0aW1lZCBvdXQuDQo+DQo+IExldCdz
IHJlc2V0IHRoZSBUTEIgaW52YWxpZGF0aW9uIHN0YXRlIHJpZ2h0IGFmdGVyIHN0b3BwaW5nIHRo
ZSBDVCwgYXMgaXMgYWxyZWFkeSBkb25lIG9uIEdUIHJlc2V0Lg0KPg0KPiBGaXhlczogYTZhYjQ0
NGExMTFhICgiZHJtL3hlOiBGb3JjZWZ1bGx5IHRlYXIgZG93biBleGVjIHF1ZXVlcyBpbiBHdUMg
c3VibWl0IGZpbmkiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciBQacOzcmtvd3NraSA8cGlvdHIu
cGlvcmtvd3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19zdWJtaXQuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGluZGV4IGIxNGIzN2I3NjdmNS4uYTkx
MWM3Y2I5ZTI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1p
dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAgLTQ3
LDYgKzQ3LDcgQEANCj4gICNpbmNsdWRlICJ4ZV9yaW5nX29wc190eXBlcy5oIg0KPiAgI2luY2x1
ZGUgInhlX3NjaGVkX2pvYi5oIg0KPiAgI2luY2x1ZGUgInhlX3NsZWVwLmgiDQo+ICsjaW5jbHVk
ZSAieGVfdGxiX2ludmFsLmgiDQo+ICAjaW5jbHVkZSAieGVfdHJhY2UuaCINCj4gICNpbmNsdWRl
ICJ4ZV91Y19mdy5oIg0KPiAgI2luY2x1ZGUgInhlX3ZtLmgiDQo+IEBAIC0yNjUsNiArMjY2LDcg
QEAgc3RhdGljIHZvaWQgZ3VjX3N1Ym1pdF9maW5pKHZvaWQgKmFyZykNCj4NCj4gICAgICAgLyog
Rm9yY2VmdWxseSBraWxsIGFueSByZW1haW5pbmcgZXhlYyBxdWV1ZXMgKi8NCj4gICAgICAgeGVf
Z3VjX2N0X3N0b3AoJmd1Yy0+Y3QpOw0KPiArICAgICB4ZV90bGJfaW52YWxfcmVzZXQoJmd1Y190
b19ndChndWMpLT50bGJfaW52YWwpOw0KDQpMR1RNLg0KSSB0aGluayB0aGVyZSBzaG91bGQgYmUg
YWx3YXlzIGEgdGxiX2ludmFsX2ZpbmkoKSBhZnRlciB0aGlzLCBidXQgdGhhdA0KaGFwcGVucyBt
dWNoIGxhdGVyIHdoZW4gYWxsIGRybSBmZHMgYXJlIGNsb3NlZC4gSWYgeW91IG5lZWQgdGhlIHdh
aXRlcnMNCnRvIGJlIG5vdGlmaWVkIGVhcmxpZXIsIGNhbGxpbmcgeGVfdGxiX2ludmFsX3Jlc2V0
KCkgaGVyZSBzaG91bGQgYmUgZmluZS4NCg0KUmV2aWV3ZWQtYnk6IEZlaSBZYW5nIDxmZWkueWFu
Z0BpbnRlbC5jb20+DQoNCj4gICAgICAgZ3VjX3N1Ym1pdF9yZXNldF9wcmVwYXJlKGd1Yyk7DQo+
ICAgICAgIHhlX2d1Y19zb2Z0cmVzZXQoZ3VjKTsNCj4gICAgICAgeGVfZ3VjX3N1Ym1pdF9zdG9w
KGd1Yyk7DQo+IC0tDQo+IDIuMzQuMQ0KPg0K
