Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0EEFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFEB10E183;
	Mon,  4 May 2026 04:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQ5LibFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A3910E183
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777870462; x=1809406462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vjUUwH8xPB+s6kRDzvCHB4zPS8ZgDv6J2fynr5LUUdc=;
 b=nQ5LibFgd2nOr9j7MrN/kOzCp10fuJ1rkZErWxp7piiVgY76Ig5f7L9M
 AG4ADqBOdtS8raiDi5GM+xuSp94XXstvDPU7FFnIMXFDo9aiyU8565wjp
 8zk7570pGT9C4hH2T6M+XWV/jHDgGq7eAm3FPsYu42xTcs7TYuX/1+p5N
 BeouQCw4JC7eSZJO5D3au+Fhtvn1ZQDzCv7AT59uQNszKXfH30Lib3YuT
 k1Q3GQwyFgaBDxWwSYR0GLoXSPy4qN/xmGhIkGKpD2xrA2u1uEmBZ1Uvi
 oDVCqolqfA3lNZswN75i/BZQpGV0HAAHKmzX6vx1ZmZj8p2SDoP7U5R6w Q==;
X-CSE-ConnectionGUID: cC7U56xoQfuLVb9M4z9LUQ==
X-CSE-MsgGUID: zMow4qiuREysI30A0oEaVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="101391518"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="101391518"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:54:22 -0700
X-CSE-ConnectionGUID: rANADunJQQSdcIBHkgGZKw==
X-CSE-MsgGUID: rBu7DdoaQFeZ0h8fysdXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="235477449"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:54:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:54:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 3 May 2026 21:54:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 21:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkCSCaedj/ZZgl5+fkEz2+zLdggI1aKhAy1x6VibwZq68A2EGwMXYCyrS5EImI8CTy57atdagZ33uoUVA2aravOb/k3RqKAYwvt6gADty56O0SASh5UXkmX5WZgfiLu/NbkGqZ2eIYQq7WsUIAMmtLFjS7d0A97ElaUHUMrLSgtZmqzdsOGwmDOujYyWrPHOVHLzXcHLiN6IuApHsfmc5EH4XXnoSzvKoMw1RVnjzxDZ7qyYR8C+M0XlinN+6g7R+NsUUJi3suDqecp3ztNZVF+WC652XVqyEP9wxEbIb2/PLOSG5FgPkMrLyfDn/VtupyqXuMBTAjWV3TDA+B+yTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjUUwH8xPB+s6kRDzvCHB4zPS8ZgDv6J2fynr5LUUdc=;
 b=keBQd4Uzp+TpzFmbSTCBvIotMPo5tLYnImM/uLganuwpGMMyR8gu1fN38A7zkqgyePvErbB+Zpoi6E7VRC9ji6jYKX2E5KCXX5lxM5Xg6p8pq/LzB8DaDn376Euw++s4Wfl7xFxcqdcK3TdsHG+vfgHy9S2nDw1Arg+W6aXtzAcQbwWRoWqP0QTpCleWf/EdIvzBDfAKZn10ShRkN3ZPYhH+WoAdWgaAyHdMiTG7q0iauoArp9c9gLeLr/lzd9lDXD6NqF5hylJNrOWGfla1r6zs0T5HVC42QsjfyoUV8bdrYz5GORgHjoG7CzQFk+t8Ydcii1AGqluupMdnoi0yLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 04:54:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 04:54:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 0/9] Add new debug infrastructure for configfs
Thread-Topic: [PATCH 0/9] Add new debug infrastructure for configfs
Thread-Index: AQHc24ChmAiHu8RtKkqCpF2eo9GXurX9TRwA
Date: Mon, 4 May 2026 04:54:17 +0000
Message-ID: <533180ac389da97c36e56942bb89af116f1bec50.camel@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS4PPFD667CEBB6:EE_
x-ms-office365-filtering-correlation-id: 3ae142b9-cf99-484f-a4d1-08dea99932b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Im5oEo9XthDDZ3euClkb6HVsiREyG0i0YYgwAWC/dg9iKA3R0ia1qMDKEa8/1BNKQY66Y2dArOyXwptcDKjkArgab+O1zIiZQMzOlcOJRN7IaX36vjJoOXECpgT2c97FbAHwN/PeSVoIytwMFO7CI7lbHTvhvfElhS9vvHvx15P8GrC0hutPXxFSDcBIAes1B3eQwugV9CW4toK8ilRakntVcKFkUJc7WfgKcpWleK45cU1tqmRTipBgpBgqhIiorNjDsRuNO2ZflrTO+KuyA1FdFdoQLYFSMkngE0qnuf7qhOKKQzOyLfynwwKU5aOJyLXKgoeuitH2kqtMl2e6S/wLufCCZMNfP4TzJBdpp1SEDjs+x6Elf1b94soBCrNeFOzXMDRMerh7LScI1JOrat1CNY8x44jjGeHlPOBuviDkWaRQ8qkjwtbDl6zeSHw6lxb/aGmsPfL4YM8DrF624rt1P9fbPYBsbymf+8YX/PFVIpa9//zKblSrVMGsvk0vdMnX+RCkA5yHnP0Su57R+aLUqcaKmcOxXOm6ZF4SISVyxDhaAYC0PcwP4k524dUbnAAOUgo2KLzxKb9VQfXPjm78cDd2hEqs1HI+0ke/LoZFfsstZPMkR4a621Ue61gKoqxPsu5Jgd1erXQU5U0S0A2B1hJI7iyYJ0oo3Dp2E+PpxgAjvmVJAIEGB8crOS6QG4t58yrWYgGS9v0eFDKZkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm95YXN1Wm84emExSGNyc0lIOHoxZnNvVjFQUWVMaTVuOEJwUW53enBSM2s5?=
 =?utf-8?B?bFBHUFhidzRHTEw0NW5lYlRsU2FwVnlrR0dSSjZaWDYrOUNuQ1FmaHAxRlky?=
 =?utf-8?B?Q0tKOGJhZHUyWDdFMVJ6NFZqMk5wUlJrZTVUUnREQU52R0xYQ1kzVW81QWRt?=
 =?utf-8?B?Ny9rNEZHVWV6WU5WcGhBazl0YnJUeGtXcjVlaHN4SmJ5cmJ1TlljWTVtbUlY?=
 =?utf-8?B?dWI1bG5vc2RRM3ArVGRqVDUva0Y5TFpIdGZEVEp5WklDK2h3akhKZEV1NkhM?=
 =?utf-8?B?WFB6QXU1Ull3TkEySjh4TEZ6MVp4VXh3TUkzWnNRYUM4eUt4b3BhanNFVHZo?=
 =?utf-8?B?UUttSjJHQmFxNVZ0RUdoUHJ1WTh3cTYydmFmUUlJM0FHVVFaNW1DaVNUUnly?=
 =?utf-8?B?dXZjblc2VWRwb2RFRzg4cW1PbENIejZJd1VvbFZib3ZkU0QwU244YmNkaDM2?=
 =?utf-8?B?TGx1NmRBOWJoRWpDR1dNMktRTU91dy9kOEtYdklQcUMyK1pBV3dySCtrZHg2?=
 =?utf-8?B?SENhemVRZzA0SG9vKytuZUx4Tm5KcStIc3E5NC9mS084bzNPOWpaMGpIRXNP?=
 =?utf-8?B?WUtLZ3h2NTNSMXhIQk5SNFVZWU5vNUhjcGsraXhWMW5KL0lMMENUV1BRVDJw?=
 =?utf-8?B?Unhad08ydGowWTkxNm1pT3gwSlF3dXE5b2d2eUM3bWNvVW45WU9tQnhRWWxi?=
 =?utf-8?B?bzZ5TVp1YzAySjZITUxFVUx4R1VZYlNSeWg2SXBuemEyU1Bsazgveml3ZEtH?=
 =?utf-8?B?R1NUM0VaUkhxK3R5S3BVMmpKaEtqV3QzMnRJOTRTbllJTS8rQUZ5TWZ5RS9O?=
 =?utf-8?B?QVd5QitlbURKWFErVWR0V2p4clhaN0NuSklSL0luM3NuVmZFN1IxS3BURGhX?=
 =?utf-8?B?STRyeTBmVFZiWDVGVy91dWRIRkJ6eGNXUzNoaEdXTlFJWi9BM2d3M3p5ZE1F?=
 =?utf-8?B?ZlRQalduRTJISTIvT3lpY1c2Q05XcnI5VzJEYTVKRDFzaDREcXk3d28vR0lo?=
 =?utf-8?B?eTAxdlRSbGYrcHc2ZTI5YVdja2lNNXJTV0VXMTlUcHRxc2FRVjJ4Z0tOQjVz?=
 =?utf-8?B?ZU1DdWU5SDg0NDErZ1Y2Zm41b2g5UjVNR0lheFNQV1A1VFRxLzl5elNXY0M0?=
 =?utf-8?B?UlcwbGJIZ0VkMVNiR2ZlVytGemQ3QldXTkNPRVdoaUhVcnJXR3hEYTFXOHBG?=
 =?utf-8?B?VmJBQlBYRUNsemxSOTdjSk5nUkZ6SW55ak1rL0lqdnJnZzZRMEEreTh5eFE2?=
 =?utf-8?B?SlNUTTFIOGtELzg3cXlqVlJCUHhjZGwrVGpLZmFINmtLbjNhbTh2VXp1TlBU?=
 =?utf-8?B?RHpLd1c0aFFnNlZJYlY1V2EwUjJENGpKb25OM3R3aWtKaFU3bFhWR2xWR1dF?=
 =?utf-8?B?RG8zQTRkSFpkcWpMTTRWMFdNTEVYdk4wNzdkWkNTY3g3Vk9kcDNuVDVGNmlu?=
 =?utf-8?B?TWFjVVdVdytGaTBiK2k5dW9RRmtzbTN5UUhJRGpkNGYwMEJjUE1SSG1VeG9L?=
 =?utf-8?B?TW1mc1BCeDRpRXEwczY3YU8vV1o2VkNyM2FwYUxQN0laMU1laXhHb1psTy8z?=
 =?utf-8?B?Q2Z3c052MGhKeWhJSEhyV3VWWEo0STNLNmVZVFZZNS9XTVpOZldHWWUzYVRC?=
 =?utf-8?B?NVlTcEljT3BFQ0JmYndvOGJUeW12bFRpRUVHTFdHRmt6Ry9yUEJSaHdldkJh?=
 =?utf-8?B?VTA2K2dMZ0xjVjRsRjJaM0owUWlBQ2dsQ1c5cVFkdG5yeGV0aUpWMmJiZjdl?=
 =?utf-8?B?ek4yZjgzS3FqR0RQUDBvWHRUN2RHTTJzSUlrT0JGb2U2M1JreG1Rdkk5STNI?=
 =?utf-8?B?SFpsbDFOMDZFbkM0ZTFyQVRkblFQQ3JGWWNpbnFmaUNDdEtCdlEzVDRPYTh2?=
 =?utf-8?B?MDRhT1E1aHFYU3dlNzRzSEZSVVpXWitBMEdkYW85ZjdmRFd0U0o1K1ZFc21S?=
 =?utf-8?B?dkxjd2FnYUxFV2gyVnNzVFpQVXJGNXZBYnlnS1BOeHY0VHBKbXJHWnFmQkZn?=
 =?utf-8?B?VnZNQUEzSHluZkxZQWRVd0dJYXRtb200TnE4VlhjaHQ5SWQxOXFZekVlUm1T?=
 =?utf-8?B?RitBZ0NuYzFXK3QrV3ZoY2orSUJ2djlROEZVbWVKcTJWUWR4YkxvZFB0Unc1?=
 =?utf-8?B?enozTFU1Z1U4Y0wvVm1RVDZJekhCU3FydExoTFVMS212ZmtPeGdHRFY2Qlh3?=
 =?utf-8?B?UzJXMFN3L3cvZEtKWDYrNDhOWS90VkxiZU1yTEdVK3g0Zm52eDVMMnBYRERR?=
 =?utf-8?B?WWxHbE1la2c2VXlZVTBQWUwzRlRLSXlqdDhoWkNwRDVWWmN0bDQ2a25lLzIv?=
 =?utf-8?B?cE5zOWx2Zk5NaUVFd0xJa1ptT1diT0ZqclptWDlIRjlJMWZ0QUhBVjdRS0hM?=
 =?utf-8?Q?PUFo/CsunYfBZVO4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90131E1F01B31645905BDEE80426059D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Pbjy6LYn/8rb6+B02s/I7iDd6bOAb5OfQB0h5+Fbdexd56CBK5s+cpfD1+j5xMaNqP3/jolO1llbeeCaDeZCPhEu4sEgzgZTL2Yaz9tAF7kJhGSKzBAG6lGTv2f6LReJd2tDfaDTAPefNs9qkL2bXU7nDw4G7YwBuaiZul0Mgaow0AxIXgS48tho5rFo7UFlhEqmReE9DlyZNk7mQPnIjL0JlORZrmGwLxrRifLaV7WhHh0AdWVssMWeRAKFFM6fm6uP5X8x/NjW9SI4FmJuJFUVJoXgIes/kOm2lnWo3LZJ47gKQhRafkFtBtYlUfqLuJ9ph2gqBj9QqOTJ8lu6kg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae142b9-cf99-484f-a4d1-08dea99932b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 04:54:17.8704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjxgL9GDu4lUfzxPIBQlt1hzVAXrtimQta/7GwtAX4y4GarXw0ExWG4T+Xg+cI7gC6r8y4ejf1qnh7ncMh+AmzreRAoGIIGWw0+6qRp90NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD667CEBB6
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

T24gTW9uLCAyMDI2LTA1LTA0IGF0IDA0OjQzICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToN
Cj4gQWRkIGEgbmV3IGNvbmZpZ2ZzIGRlYnVnIGdyb3VwLiBUaGUgaW50ZW50IG9mIHRoaXMgc3Ry
dWN0dXJlIGlzDQo+IHRvIGFsbG93IHVzIHRvIHNlcGFyYXRlIEFCSSBmYWNpbmcgY29uZmlnZnMg
ZW50cmllcyBmcm9tIHRob3NlDQo+IHdoaWNoIGFyZSBwdXJlbHkgZm9yIGRlYnVnIHB1cnBvc2Vz
LiBBbmQgaXQgYWxsb3dzIHVzIG1vcmUNCj4gZmxleGliaWxpdHkNCj4gaW4gaG93IHdlIGRlZmlu
ZSB0aG9zZSBwYXJhbWV0ZXJzIHVzZWQgZm9yIGRlYnVnLg0KPiANCj4gQWRkIGEgbmV3IGluZnJh
c3RydWN0dXJlIHRvIHRoaXMgZGVidWcgY29uZmlnZnMgZ3JvdXAgdGhhdCBsZXRzIHVzDQo+IGVh
c2lseSBkZWZpbmUgdGhlIHBhcmFtZXRlcnMgaW4gYSBxdWljayBsaXN0LiBUaGlzIGlzIHByaW1h
cmlseQ0KPiB1c2VmdWwgZm9yIHNpbXBsZSwgc2luZ2xlLXR5cGUgcGFyYW1ldGVycyBzdWNoIGFz
IGVuYWJsZS9kaXNhYmxlDQo+IGZlYXR1cmVzIG9yIHNpbXBsZSB2YWx1ZXMgcGFzc2VkLiBGb3Ig
bW9yZSBjb21wbGV4IHBhcmFtZXRlcnMsDQo+IHdlIHdpbGwgc3RpbGwgbmVlZCB0byBkZWZpbmUg
dGhlc2Ugc2VwYXJhdGVseS4NCj4gDQo+IFB1bGwgdGhlIEd1QyB0YXJnZXQgcmVsYXRlZCBjaGFu
Z2VzIGZyb20gWzFdIHRvIGZpdCB3aXRoaW4NCj4gdGhpcyBuZXcgc3RydWN0dXJlIGFuZCBhZGQg
YSBuZXcgZGVmaW5pdGlvbiBmb3IgZ3VjX2xvZ19sZXZlbA0KPiBvbiB0b3Agb2YgdGhlIGV4aXN0
aW5nIG1vZHVsZSBwYXJhbWV0ZXIgKHRvIGVuc3VyZSB3ZSBhcmVuJ3QNCj4gaW1wYWN0aW5nIGV4
aXN0aW5nIHVzZXJzIG9mIHRoZSBtb2R1bGUgcGFyYW1ldGVyKS4NCj4gDQo+IE5vdGUgdGhhdCB0
aGUgZGVidWcgcGFyYW1ldGVycyBoZXJlIGFyZSBhbGwgdG8gYmUgdXNlZCAiYXQgeW91cg0KPiBv
d24gcmlzayIuIFdpdGhvdXQgaGF2aW5nIGluIGRlcHRoIGtub3dsZWRnZSBvZiBob3cgdGhlc2Ug
aW1wYWN0DQo+IHRoZSBzb2Z0d2FyZSBhbmQgaGFyZHdhcmUsIHRoZXJlIGNvdWxkIGJlIHVuZm9y
ZXNlZW4gY29uc2VxdWVuY2VzDQo+IG9mIHNldHRpbmcgdGhlbS4gQXMgc3VjaCwgdGhleSBhcmUg
YWxsIHdyYXBwZWQgaW4gYQ0KPiBDT05GSUdfRFJNX1hFX0RFQlVHIGNvbmZpZ2ZzIG9wdGlvbi4N
Cj4gDQo+IEluIHRlcm1zIG9mIHRoZSBwYXRjaGVzIGhlcmUsIEknbSBhbHNvIG1ha2luZyBhIGZl
dyBvcmdhbml6YXRpb25hbA0KPiBjaGFuZ2VzIGxpa2UgbmFtaW5nIGFuZCBzb3J0aW5nLiBJIGFs
c28ga25vdyB3ZSBoYXZlIGEgZmV3IG90aGVyDQo+IG1vZHVsZSBwYXJhbWV0ZXJzIHRoYXQgY291
bGQgbWlncmF0ZSBoZXJlLCBidXQgSSBkaWRuJ3Qgd2FudCB0bw0KPiBvdmVybG9hZCB0aGlzIHNl
cmllcyB0b28gbXVjaCwgc28gdGhlIGZvY3VzIGZvciBub3cgaXMgb24NCj4gdGhlIGV4aXN0aW5n
IGNvbmZpZ2ZzIGVudHJpZXMgYW5kIGRlbW9uc3RyYXRpbmcgdGhlIG5ldyBzdHJ1Y3R1cmVzDQo+
IHdpdGggdGhlIEd1QyBsb2cgbGV2ZWwgYW5kIHRhcmdldCBwYXJhbWV0ZXJzLg0KPiANCj4gSSB1
c2VkIEdpdEh1YiBDb3BpbG90IHdpdGggQ2xhdWRlIHByZXR0eSBleHRlbnNpdmVseSB0aHJvdWdo
IHRoZQ0KPiBwcm9jZXNzIGhlcmUgYW5kIGF0dHJpYnV0ZWQgYXMgc3VjaC4gSGFwcHkgdG8gYW5z
d2VyIGFueSBxdWVzdGlvbnMNCj4gYXJvdW5kIHRoaXMuDQo+IA0KPiBJIGFsc28gZGVjaWRlZCB0
byBkcm9wIEpvaG4gSGFycmlzb24gZnJvbSB0aGUgTlBLIHBhdGNoLiBJdCBoYXMNCj4gYmVlbiBt
b2RpZmllZCBxdWl0ZSBhIGJpdCBmcm9tIHRoZSBvcmlnaW5hbCwgYnV0IG1vcmUgaW1wb3J0YW50
bHkNCj4gSm9obiBpcyBubyBsb25nZXIgd2l0aCBJbnRlbCBhbmQgdGhhdCBlbWFpbCBhZGRyZXNz
IGlzbid0IGF2YWlsYWJsZQ0KPiBhbnkgbW9yZS4gSWYgaXQgbWFrZXMgYSBkaWZmZXJlbmNlIGhl
cmUsIEpvaG4gYW5kIEkgaGFkIGJvdGgNCj4gc2VwYXJhdGVseQ0KPiBpbXBsZW1lbnRlZCB0aGlz
IHNhbWUgY2hhbmdlIGF0IGRpZmZlcmVudCBvY2Nhc2lvbnMgZm9yIGRlYnVnLiBUaGUNCj4gb25l
IEkgdXNlZCB0byBzdGFydCB0aGF0IGluaXRpYWwgc2VyaWVzIHdhcyBjaGVycnktcGlja2VkIGZy
b20gaGlzDQo+IGxhdGVzdCB2YXJpYW50Lg0KDQpRdWljayBub3RlIGhlcmUgdGhhdCBJIHN0aWxs
IG5lZWQgdG8gZG8gc29tZSBJR1QgdXBkYXRlcyBoZXJlIHRvIHRha2UNCnRoZSBuZXcgZGlyZWN0
b3J5IHN0cnVjdHVyZSBpbnRvIGFjY291bnQuLi4gSSBkaWQgYSBsaXR0bGUgbWFudWFsDQp0ZXN0
aW5nIHNvIGZhci4gQnV0IEknZCByZWFsbHkgYXBwcmVjaWF0ZSBhbnkgZmVlZGJhY2sgeW91IGhh
dmUgaW4gdGhlDQptZWFudGltZS4gSSBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlIHRoZXJlIGFyZW4n
dCBhbnkgbWFqb3IgY29tcGxhaW50cw0Kd2l0aCB0aGUgb3ZlcmFsbCBpZGVhIGhlcmUuDQoNClRo
YW5rcywNClN0dWFydA0KDQo+IA0KPiBUZXN0ZWQgb24gQk1HLg0KPiANCj4gWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTYyMDg3Lw0KPiANCj4gU3R1YXJ0IFN1
bW1lcnMgKDkpOg0KPiDCoCBkcm0veGU6IFJlbmFtZSBzdXJ2aXZhYmlsaXR5X21vZGUgdG8gZW5h
YmxlX3N1cnZpdmFiaWxpdHlfbW9kZQ0KPiDCoCBkcm0veGU6IFNvcnQgeGVfY29uZmlnX2Rldmlj
ZSBmaWVsZHMgYW5kIGRlZmF1bHRzIGFscGhhYmV0aWNhbGx5DQo+IMKgIGRybS94ZTogU3BsaXQg
b3V0IGNvbmZpZ2ZzIGRhdGEgc3RydWN0dXJlcw0KPiDCoCBkcm0veGU6IEFkZCBhIG5ldyBkZWJ1
ZyBmb2N1c2VkIGNvbmZpZ2ZzIGdyb3VwDQo+IMKgIGRybS94ZTogTW92ZSBkZWJ1ZyBjb25maWdm
cyBlbnRyaWVzIHRvIHhlX2NvbmZpZ2ZzX2RlYnVnLmMNCj4gwqAgZHJtL3hlL2d1YzogQWRkIGNv
bmZpZ2ZzIHN1cHBvcnQgZm9yIGd1Y19sb2dfbGV2ZWwNCj4gwqAgZHJtL3hlL2d1YzogQWRkIHN1
cHBvcnQgZm9yIE5QSyBhcyBhIEd1QyBsb2cgdGFyZ2V0DQo+IMKgIGRybS94ZTogQWRkIGluZnJh
c3RydWN0dXJlIGZvciBkZWJ1ZyBjb25maWdmcyBwYXJhbWV0ZXJzDQo+IMKgIGRybS94ZTogTWln
cmF0ZSBleGlzdGluZyBkZWJ1ZyBjb25maWdmcyBlbnRyaWVzIHRvIHBhcmFtcw0KPiDCoMKgwqAg
aW5mcmFzdHJ1Y3R1cmUNCj4gDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKw0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS9hYmkvZ3VjX2xvZ19hYmkuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICsNCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgOTUyICsrLS0tLS0tLS0tLS0tLS0NCj4gLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfY29uZmlnZnMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyMyAtDQo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmPCoMKgwqDCoMKgwqDCoCB8IDkwMA0K
PiArKysrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19k
ZWJ1Zy5owqDCoMKgwqDCoMKgwqAgfMKgIDU2ICsrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2NvbmZpZ2ZzX2RlYnVnX3BhcmFtcy5jIHwgMTEyICsrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9jb25maWdmc19kZWJ1Z19wYXJhbXMuaCB8IDEyNyArKysNCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfY29uZmlnZnNfdHlwZXMuaMKgwqDCoMKgwqDCoMKgIHzCoCA3MyArKw0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZWZhdWx0cy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgNSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMiArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfbG9nLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0NCj4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfaHdfZW5naW5lLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9wY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHNtaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAxICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcnRwLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jwqDCoMKgIHzCoMKgIDMgKy0NCj4gwqAxOCBm
aWxlcyBjaGFuZ2VkLCAxMzY5IGluc2VydGlvbnMoKyksIDkxMiBkZWxldGlvbnMoLSkNCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmMN
Cj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2Rl
YnVnLmgNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZp
Z2ZzX2RlYnVnX3BhcmFtcy5jDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9jb25maWdmc19kZWJ1Z19wYXJhbXMuaA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaA0KPiANCg0K
