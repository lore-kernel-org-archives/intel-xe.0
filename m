Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED11CC982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 23:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE19210EEB2;
	Tue, 22 Sep 2026 23:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4oW4u9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20F610EEB2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 23:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790119616; x=1821655616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RJWdyZStlZ/PH5LN332Uauk2aHR+Q/8BjgsNWCbHbV8=;
 b=H4oW4u9H06OsCTnA/jcJg8WPipDCKSmggNMXCqTa3TuQmEfdnQeVkFiE
 OwiOJxTiFioVBdf46ojN/NKUeePPWFqncaCcqHcr0exe1iZkWYRC9XAkq
 Ck87euGmi56gveRDUuXh4pXn9yGtotmk2tXXUZx1gOoY3OCCYflpxDu4H
 2V5RX+8I9IhHv9UbY1/ewZ/NRmn2TT6dGKbtQNFl8fCdc0m5wmOhdizFQ
 hJxkEeA3KC4y+B8yBFNQSPO8ypk9iLYvSHjOrcL78uJILYsN3rky2i/rf
 iZrWAC1X6sInQNF0HezTOl5rsoBSoxFGhovLSbmHy2uFc5O7j8T25RgXa Q==;
X-CSE-ConnectionGUID: GJA9Nr5TQyOdq/3RhYjzAQ==
X-CSE-MsgGUID: SD/IByq9RA2by7HtA24new==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1274820"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1274820"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:26:51 -0700
X-CSE-ConnectionGUID: ZrMaFaXWTB2kH+1k1aamjg==
X-CSE-MsgGUID: 32dwKa4jTP+1akN8P3lhxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="273539066"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 16:26:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:26:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 16:26:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 16:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKmBb6OdKQbUjhKaYCxB8ItM1lv20dCuVUfWrNPPY1vtOPdC0kBaB32tXAmiXnw8RTzaCDgbWRaPnLz+tArrA+jYUA2GVmZdcM4Sq7llIhWX+8LlNs5DdwXWJXkjumaDJECqv781f3ewN9gD3rGDqYu0GVvsusIsvrp+o76zbwD8VJAIUdBxcbwOzInC/jqnAhDiCLxCDsZn+hJahapdLrGtb6Skggmv3Ho0bY774E2/HplJyhwoBKX4D4pj0EJJvbtCiHyQiNhQZPYdxw9bRrG4HMXoVZKSexGW0ic7Y82fuFgkqRA2TrMIaIaVit9MmyrXK3EAncoodu8j2YrYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJWdyZStlZ/PH5LN332Uauk2aHR+Q/8BjgsNWCbHbV8=;
 b=Jg3Ipzt/RITjLXl+0I+zsvt5vmkFpkGAzedjst3fAwDSW4687V9F9XPyi13e4Ex1bIVdYAvRlG7RmTOdFKbBBWbVLpFjGma32RFLfSujbZGpO10zeyCZouaq2cwq9H/2ASdgRf37ZEP/yR8bRShMMSdwVXtUmWTNESlFmz+Lc993L7xlfx9lxN0Ge/SWUwXtgc7Qe52pZkmvegXRcz6cHJuV6BkqO6xoQugQpx+4LuF/bgksApBIkEQLY+xsGvZiWDadyH+eV7UQZOmPL6QhHImzYpePYyK4e+jCa53dSiwMHfkcbkNJ6MYzZsVf/8qd0/pAs11fun9KDo/iUQArqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by CH8PR11MB9482.namprd11.prod.outlook.com (2603:10b6:610:2bf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 23:26:48 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 23:26:48 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2 0/2] Enable GSC loading and PXP for NVL-P
Thread-Topic: [PATCH v2 0/2] Enable GSC loading and PXP for NVL-P
Thread-Index: AQHdSr344BBia7Bfp0OUT4YnfidGk7bbPjCA
Date: Tue, 22 Sep 2026 23:26:48 +0000
Message-ID: <5bd962a7def2a460aec77c08756ab22f77f40314.camel@intel.com>
References: <20260922181232.1111750-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260922181232.1111750-4-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|CH8PR11MB9482:EE_
x-ms-office365-filtering-correlation-id: d7f739e2-5d29-442e-2baa-08df1900f953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info: bdYsF6iWvJ7GPx4wF1Utzs5O+mVInIfjgzTyB31FXo2AIjfWPvOo4HZfgZsxBj/vTb9HFl7xlR2+Aq0M8uDvCmzbjhC0YlXhI+GFwSgahhryvkVwQsob9zVP7Z4EFt0TTxVnRiHm7BQk45hIH0JR8RBf/RyxhecSc+hirjXTuDLd5vg7BFojsvJWTFa89puWetHxcM9udbttHhepfihE+2XzFH6xO8HPFPTSAtZKlwLL8ui5MNXMqx5QTfQ6sVi/12n86ymtkRSbZKLABStNwducKM7qZoZTNiwCrED1T8VpzCTkL4KmQDoq25vXBamVNpKBqPFcbu9QXD8QlJspF1sdFjxbsRAXKuZlltstenL+p9Y9Hv4DutgvibHUg6YsNp4XTUheYCVYRXSTtQx173p2ZH1XHABM01Oo7wl05Bao98Av1BIag2L9X6pntyoNMgyyKODll3FBw/aZlDYp9eHBCu/4a80kL52iiCeSOf9U4c9B4S1MVn56oBHp1p7u8OWpHDZnsi0JYu66Ny2h0sbvSbuVYjouaZ9W1naGhpsf/HJGqAZGl8yk/mty+fqWrAp5kNuoJa6s+fkh1FUY71g/8F1mC6VLTxwkQr6EsJcXh18B7/pJBZtJ1aq5vLE5JR5/v08ILJ6psq9AB5NTbY5FUpLSc7bIgo+8H4yCb6QeQqdOl7KnTMqD9AzcDyG9vD3JgQ/p1CaSMX+YJ+PcNMd/yRgPP7AXQZrQNtnXmok=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(10067099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U05OUCtRQWNhbzRyTG1NL0RHK0FSSUEwdzdoaHdPako1cGFWcXZIYWFyNk4v?=
 =?utf-8?B?cEgyNk5mR004QmQ4UWdaSUp3N3J0cDJKc2ZQMkxIMWpuTVd2RC8zSm9vajdD?=
 =?utf-8?B?cGFmbEcxWkhSZC9paVJlVkdMUFFDUDRxek5xWXErQnZUN25ZL3RLMms2ckE5?=
 =?utf-8?B?eVU4SSthRXNTdDhnRm8yWG1iMHEyWDJ0VmhBOFlXejY4RGl3Q3ZsRHE1NjRS?=
 =?utf-8?B?bDRRLzQ0QmEzUlNIdTcrU1FQSGsxcVorb1pnQk1QajhBREVQU3JjN1gxTWpy?=
 =?utf-8?B?V2NBSVJzS3p0MmpRdDN3RmR0U0V4Z1dKeXljYWpxY2xXVDRsTXFFZzZ6dzQ5?=
 =?utf-8?B?ankycHNad3A3RTVPc1h5T25WWThoMW1iSytaMGdRdFZvSDdRSkZWSEhuZWN2?=
 =?utf-8?B?djNuWm9BcW5mTmk1akgzZDg0ZzNXOWk0ZllXM3FhNHJCU2dZS2hrcXd1UWZN?=
 =?utf-8?B?ZWMrWTViNTlWOEZHMTNWckZYUDhSdFpncEpsTzJrS0FkVnBYa0JoY0FOUkY5?=
 =?utf-8?B?NEdLTlpkMk1vaVdRa0NlOExneXJoY1Y2T2tEYUdyc2VJMTFFNGpWQzNBMVFw?=
 =?utf-8?B?K21uMVNjY3I2SVVBOHZscXRkRlg5ZWtoS1ZsUFRlUW9LMTlsMnkvVFh2b2tq?=
 =?utf-8?B?d09lMVNhUDJtMlBnZ0xYMlJFeDFxL2dKY05kU2NBYTY4N2craStSakh1VFZk?=
 =?utf-8?B?WlZ2THJTQTRuR0RrQklJQkFIVDVYSHRWbVg3K21SK3hWejVRWkVUNDk1OWpv?=
 =?utf-8?B?UVRpc0N1NnZXbFVyVi9ueXVLVWFkeFR6aS9kY3NiSEQ5enQ0SlFYTjU0SGN1?=
 =?utf-8?B?cGZkZ3NxY21FWk5NNUQ3SUhoV0JuS2Z0YVJwMXpLanc1dHJnSG9PLzZhZE1P?=
 =?utf-8?B?M2phOW56NXJHWWNHcURIazhQR0RVUVBaR3ZvMGgrMklOcnoyNUxOWHhvbUMw?=
 =?utf-8?B?M3FUTmFUNDRxMG9KMmhtZDR3UER0dDhvaXNyeXA2MlZJeDR5UTlENEFZcG9t?=
 =?utf-8?B?MHNlTmVKd0ltU1Q5SFI3VDc1RUk0dWkxU2d0U2plcy9KVzlCeHFqM0hoVnVN?=
 =?utf-8?B?UUZZcWFDd056MWhyZ0M5Vy9NMkdQbE5PMnd6Mm13VXR4bTRYRVg5c2dnV29p?=
 =?utf-8?B?ODFPeEVjSWwrdUpYd2Q4VDJXeFIwOG82ZDBHL2JSblR5eUZKVjY3S09mTWh5?=
 =?utf-8?B?WTRkTE1jU1Y5RUdPaDhoRzUyVU5RZVphZTJqdWdNTnRYOHd4YTJSOEQvOCtO?=
 =?utf-8?B?VmhZS29ueDgrQmh0Ym5XczQycFQ2d2xsbG1DYmJRSDhqUE9JQ2U4TXNkekFm?=
 =?utf-8?B?c1Q4VUNmMlRyN0hmQ3ZSaGFZUWM5VXB1NlgyOUFVS2RHRHc0U1dTa3RJMXNC?=
 =?utf-8?B?VVVkZWVhc2tiKzh2aG5ubHF5QjYrcmY4MWN3RnFVRnFjbFJjbnBEd2JEdkJl?=
 =?utf-8?B?eFl2aWZhbUJGTEFhU2VJaHJIZnpON2krMHZ4OFhsOXA1SEtIS1IyZTA1OXBm?=
 =?utf-8?B?K1c0eHh3cTJ3Y1JSb2tmeit5ZWxBSGFyZE03SlMrVnA3aVNOaUIzTmptdXds?=
 =?utf-8?B?T0pTMW5EdC9jU0ZRTTl3OE91bzlyQU9JdU5SU3pCK0RHbnp3c3kxUTZZZmZq?=
 =?utf-8?B?a29qMFJJSDVDRzFreGVpS0djOUdsZkNPVmNXL1Jzb2ZVanpTcWRuUloyMXFF?=
 =?utf-8?B?VEQyNE93QmRuNUZvU2pnRk15WmIrOGUzNys4bDNmZU5Bck81eHQ0RGFHWWZC?=
 =?utf-8?B?ZWxYNHRzZno2bHFDOXhWNGNPbmRnWHozN3Jvem92K0ZRcFdkVVV5QmdCN2Ra?=
 =?utf-8?B?d0QveTRSUVM2RVkxWnF4dEFRbE5DbThjd09UOW5icitVSExjOXpwWVBKTkpU?=
 =?utf-8?B?N2tPc01HNlRDRGVQYXZsVmdGQjA2VC9odWk2bGJSc2YzZng2YXBpc2tMZzhK?=
 =?utf-8?B?SHBTbUxiV2tQeDRhekViMHpWcmpQZytnVnBYcHNRRC9Mcm5tSVdqOTRsNFFU?=
 =?utf-8?B?VlNXY0ZqeGh3blVieVR6QW4vRlh5b2VPNktYT3RvMkNUdnBadGRRR3dZK1Vh?=
 =?utf-8?B?Qms5N3ozM2NzSDJxS3A5ZDRleTAvNjlnMHp0SStDcVlzSHpoTDBRQjA1cmZp?=
 =?utf-8?B?L3BPaG12dGNpQ0I0QnAyYm1sMUxwVTFQK1orKzVXYWR0Tm5hN1ROVzAwSTl4?=
 =?utf-8?B?RkI4M3NKTXh0K0JuYlJ3QzR2VGI1UVZPS296NXloLy9MaXQ1VGp4aHJWM2hS?=
 =?utf-8?B?REsxZnlaTC9wTmw0aWtWMktOc1dQZ0I0dVpuK3Jsem9ycVh3R0ZqQ1BCS0Q0?=
 =?utf-8?B?enU0QzBaVy9JMEl2b0NsM3dMYVVMVmhZa2RHWjR5MHJtbzJYSjNhQU9wcXVS?=
 =?utf-8?Q?KIJl8Hljaikr/1Xr2YFQoe9/YfdRpcnIXzQjE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4986F8F44AD3C54A99A182C61A1C510E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: I83Iu9Grw8dzPqHl4qM22gR3E6YtxLhgLFNScUnruj7OnvEkYFSTg3fzOxFmpaL340xoxEzDjegi1pqtUxe9wVUd8ZliPISOOqws9RSB7CyF7YXR6yClLKLt8KhXxgzhfMpKm+/gdDURtUpKf2JgnphSXxSb1FUbC0yeC7G3/bmciCJZPZ+nqiROObSFK+28G6cSKMQ2Kfx9V4MhpDHSHDfKDsv5ZllctSLIH10EkYL505wGNLzX6oZ0LRY4yHW0g2whJHejpjehk8lu0p06X0QYOutpoccP5c5dmektd93EGvn0i5vRUjK7+JT0wtvxTy/Z/DGUsDQq+L9FcJlRQw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f739e2-5d29-442e-2baa-08df1900f953
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 23:26:48.3543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2zd8RdU3X/6U7TUoAtp9G9qMCqcWg0/2BmS/aihznDgIsyg4tItC44I5p8ZywdKkg090I8wbH4Rpq0mQTFaU3gOOKxy8ZnbbGDDzJH2TGmqjEcDRRnkJF9bNvtjtuC/1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9482
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

UGxlYXNlIGlnbm9yZSB0aGlzIHNlcmllcy4gQXBvbG9naWVzIGZvciB0aGUgaW50ZXJydXB0Lg0K
SSBuZWVkIHRvIGZvbGxvdyB1cCBpZiB3ZSBhcmUgYWJsZSB0byBlbmFibGUgYm90aCBOVkwtUyBh
bmQgTlZMLVAgd2l0aCB0aGUgc2FtZSBmaXJtd2FyZSBvciBqdXN0IE5WTC1TIGZpcnN0Lg0KDQou
Li5hbGFuDQoNCk9uIFR1ZSwgMjAyNi0wOS0yMiBhdCAxMToxMiAtMDcwMCwgQWxhbiBQcmV2aW4g
d3JvdGU6DQo+IEdTQyBmaXJtd2FyZSBpcyByZXF1aXJlZCBmb3IgY29udGVudCBwcm90ZWN0aW9u
IGZlYXR1cmVzIChQWFAsIEhEQ1ApLg0KPiBUaGlzIHNlcmllcyBhZGRzIHRoaXMgc3VwcG9ydC4N
Cj4gDQo+IGhpc3Rvcnk6DQo+ICAgIHYyOiBGaXggb3JkZXJpbmcgb2YgTlZMLUdTQy1GVyBpbiBY
RV9HU0NfRklSTVdBUkVfREVGUyAoU2hhc2lrby1ib3QpDQo+IA0KPiBBbGFuIFByZXZpbiAoMik6
DQo+ICAgZHJtL3hlL2dzYzogRGVmaW5lIEdTQyBmb3IgTlZMLVANCj4gICBkcm0veGUvbnZsLXA6
IEVuYWJsZSBQWFAgZm9yIE5WTC1QDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5j
ICAgfCAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV91Y19mdy5jIHwgMSArDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiBmZjgz
MWFmOTE2NzQ5OTBmOWYxODE0MzQwODYwZTk2OTQzZDVkZjFhDQoNCg==
