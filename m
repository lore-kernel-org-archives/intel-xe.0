Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB18FC55179
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 03:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A5210E4FC;
	Mon,  3 Aug 2026 03:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8hCMBni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BFE10E36F;
 Mon,  3 Aug 2026 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785726020; x=1817262020;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EI8lUO/A3jMSp+gTEPsEkCsG3aoLoKbImSKDdtryseI=;
 b=i8hCMBnirkqI1Y33DlCymxp/g03wNmVCf7wKOP6yxxOJTWKacvT8B9kd
 e46XqFWy+9YclExaPeh3fkYL8gwTH2PWjYlvXa2dvOdOZ04bK/LjWPl1i
 5neC6HdD8E3WZ2srh0bKU1NpoSONOxzg1Y8gT+yVAxWCUsl3mDbcMcESt
 QPoHXbjoPi2q7C6TcwrrhsHJ9uA52XSRkfJDRScIY+FqSBV/WmDVL/GIL
 s0RXHQPM3lwq5bAUNZhVnzx3fCspzNu1t33TI0cLBgIedTJl0WeGY2Hxz
 TO2CpgwLqOf5K2GR0sIshDB4Ad0IajGx1NBH2AHTm1nDPyp1U4Bd+8gmU w==;
X-CSE-ConnectionGUID: aQPLJLhtTpaqwVPC0E73gg==
X-CSE-MsgGUID: N8LsA/R1SWGG55RZyFgGeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="88786663"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="88786663"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 20:00:19 -0700
X-CSE-ConnectionGUID: /2ok9STZTI+NctR9R3H60w==
X-CSE-MsgGUID: UKpK93auRiGRrwSWPu7+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="284476127"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 20:00:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 20:00:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 20:00:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 20:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feZroZmyTATPZGzDCPT4XwpolfYRX36EpfsfmMXJ3/N80n+adb1/HYfDrdoFvvt82pXmBmapzzr5rvVbeB79qnXj10kq3B0I9nYm6tXatNmUc/W2Ueg6xhotCxhLd1QEA0NluBufxzm9KeE8PBfihqRwU9aB1in/g6CMw8LywL89ClKDZKILRKjwIpQIBpoiNbS/yBgg9tXQK+XwczVKPZbKEQ1zscXpUY4i6ZZV8m1jCdcTZzgn7kNyTvW5/VhHo9TOKh1ps7XWxRkqJREEIk9fP/660VKoVAiXK0R/ws3+MNNQohpBp1jG8MXYmXrgjAT/6K0gtTYFjWuXQu989Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI8lUO/A3jMSp+gTEPsEkCsG3aoLoKbImSKDdtryseI=;
 b=et7HTgNFXzzN4J06EM8Sqj3VgPnl5bfeIFxKrrLegfAJO+l4y1Rm0bjTj2NqRwRXZGMsza+Hew4rKfDcRubpvnmgodQWn9Jda1jYJBj16EbkWy2WpnVO9BHgfokO0afq4iDMfW9a5Xxr2bG6oapEMHj5P64yZJEO7vtCtXP0SUp+crVFk0ZfJ4Bt2u9HdZ5T9fDOMrR9O8zi1MKrVzFIs4SBlJUitCUBu5rzlsjeqWTQANfzqip+oQ00C6tePgqtBgDc6pedg1vEH5lgXYlE7tsNl98mK1fAPsu4eiOmRt4qQVwO4tvOazm+mYvWzXnfCwJTdhT4Cs4nHeC2p8Q4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA0PR11MB7159.namprd11.prod.outlook.com
 (2603:10b6:806:24b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 03:00:12 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 03:00:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/{i915, xe}/display: add core workaround query to
 display parent interface
Thread-Topic: [PATCH v2] drm/{i915, xe}/display: add core workaround query to
 display parent interface
Thread-Index: AQHdHrMLOkW5kl2R7UyHYlZRb2ZDB7aLqe3A
Date: Mon, 3 Aug 2026 03:00:11 +0000
Message-ID: <DS4PPFE901A304FB7CAB444AB9AF146CF3BE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260728162514.594285-1-jani.nikula@intel.com>
 <20260728170257.615855-1-jani.nikula@intel.com>
In-Reply-To: <20260728170257.615855-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA0PR11MB7159:EE_
x-ms-office365-filtering-correlation-id: 055d5d57-c245-4687-f851-08def10b55de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|4143699003|56012099006|10067099003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: AUsFDRyX5ySkp2/xoMd5QsSzbWcB3tloSs2yLanVy/Gtc4pulfThYEtctZo2i/hzhGufANX2HPxZmmxjRSH3lPARviD0JrkEdP32GZUPpzkp9G65xYxHq4hmXT8bNgPS24fvmhWUOuITysHVvtIu7MvuIFqx2LTbKypeczDBBnJmlhKMWt9QzNZSXXTjTd9cKutSvcI16ZAePrYb5Ts8oQi5UclSc+jlHzyRdf4rjB6hfZaotmIO9iMTjlAhs4+nQPLUgndhHturriGpXkjEjcgqkW8u55u3b4wLEiscSgQt81Q4KqNn1xqGDAZ9Cq6qo864gH0GJXQWXIHQX3rM4C4Mn8E0VzQqjEsacqs42p5oBiJfqvb5z0sJ7jkgpPuT4kd/W7+d3tFr8SwB9PQJekSS+9WivG2synV+BSuAPbImp7LFmo72SJVb35CM2QwlPEglJC2zCEp2IdMQXjbustTJsh0/4G72d9YC+BoUvEexJKdPxKD6QkCI47PrHM52VF7VJUafHwpPVf48jIrqGwfuO+RCB8Vfg9usysIe92SEjVuzwhOtTyB8PCLGLL2MP6XsttTK6wiMYZxqlRB5U4XHoGHS2k/gGKhdJ5EThM4ZgXaf9VL45JugVGmn8pEfCxX/G6C6ut8A7rUO/cXtavExeS10raRLE9Y83PFHx4QaYuUkNpqIsnYgmn5bk0qWe3bTRlCyd/zCXi4kYnHa8s+WD2OW/eFm4l87E+WLlzU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWNTbzJzSmY2a0dDY01IZ3hzcU80RC9aTWdVbVdWOUFXQXo3QVVoczAzTUVi?=
 =?utf-8?B?QW9taWU0SUtadlRPS0FRMmN2azhnelRQU2MvOWo5d0p4TnBKUHhmcklDMlo1?=
 =?utf-8?B?L0Rva2NPNFN2VVFLNGkzN3lEVFBpUDdvNm5mMHdjSko3V2FTMDlLMEpKaHlG?=
 =?utf-8?B?UmxZUzZaT24rc3lENEQ0Mzd5YTNldkJqd014Wmw4ZUxiMEYzTnZ6dE02bk82?=
 =?utf-8?B?eHVudDhCamgyUHA1Q21INjlLTVpDUjMvbTBoN05DOS9DK1VYY3E1YWNUSE8x?=
 =?utf-8?B?RDRWWlZsdVM3M1ArTENYRzVrS2ZWNlR3NVhQWUlsU2lwNldXellHdlowNXU0?=
 =?utf-8?B?bWlFS0N1S1YyRzg1cmhaaEFMTUdhMTAxakVXQ1VpODUxckkvaEtvZVRYNzNT?=
 =?utf-8?B?eGN2Y3Q3YVpoZG9pbUFhRmRFRDh3cmt2bEh5VmpWWEpDTkxkMG9rRzNiR2Jv?=
 =?utf-8?B?L1FwTEhJR3lHbjhCMFJNOCs0LzRldkFMQlJ3blNtbTQ5emJVdS9kQlZDOHhI?=
 =?utf-8?B?ckQ4aHltQ2hWRCtrV0lEdDQxb3hqSUZlTHE2MlM4QjhLMjJHMnVNRnp4SDBl?=
 =?utf-8?B?NTZGY2pFM3RmQ09SQkIyM3UzSlFBMmQ5aHI2OVNPUGcvK0tJcWRsSzB2QTNL?=
 =?utf-8?B?Rkc4MWh5YXphZHF6anR0b3Z6VEtvV1A5MHZ1bWViUGpyMmxpd0YycFhUQjhC?=
 =?utf-8?B?M21QQjRXSWhXT2U1a3l2MDgrb0xrZS85WXRMMGJQWUgvSGRBUFdQdXhNbkxp?=
 =?utf-8?B?Wk1WR3lFM2lwdE41RlE4YXBoRWVLVjRWbHF6dTlQKzhHSEZieE1qb1kzWXhJ?=
 =?utf-8?B?bmdMZnkvcnJZZHI1L1N5a0NvMktkVUZuSzY4ZEl0YnZ0eEs3SVJianBwaUFW?=
 =?utf-8?B?dDdvbkVKSSsvZ0ZlK3NWWDZiYVphanlzY0dqZTJPOC9wRHBIVWVZajB3K3pR?=
 =?utf-8?B?L3pReFQ1c1JFVHZJV2t5cXNvSDhCbkhsbG8vUDhmRU9OUWZnWWpTN3NSaFFO?=
 =?utf-8?B?ZXFpRVlTZ1pTODFYVUFCWlgrdGQ2ZkxOOGg3elN1K2liVjAvL0ZDbSt0Wkx2?=
 =?utf-8?B?QmxZU09iS0xoQ1J1eVBIdm5oK1RaZXJpUjN1K3dNbWRLNjhpek1vczVvSWFj?=
 =?utf-8?B?SG9QWWVLYUxFUE1lbFB2WUp1TGNDZVN6djVKdnpndDFWeWgxdlJQUFRiY2tY?=
 =?utf-8?B?d1pmSks2L1lKM1hJeS94K0c2Sk04dTh3bWN2VDdiM1FLdU1kZERreDMxV09J?=
 =?utf-8?B?UTJvYnNLbkdITGhKSVRvMTNDeG5VYUczamY5RnhhTld1V0x5SGw2eWlSWWFy?=
 =?utf-8?B?Mi9OWCtSRnBGR0pSYitZc2MxekxrKzZvQm5GOUR5RW9aSnZHb1JhZGtXOHlM?=
 =?utf-8?B?YlFBbmY5dGpIZkdsK1JzSW5oL3I1YzVvcWdCTElQbjRmMkNUeTJqWHc4Mkhy?=
 =?utf-8?B?WU1tVXRyM3FVQmtxWTJWL25nV0pUNTd4TDBBY1pZVHlOb282bjdmNHorOThH?=
 =?utf-8?B?dzE2aGppSlR5ZGVtN0hjOTBSZWZ3bGxpSGJaNWlMT1RtUFZxelRwMy9YWGVw?=
 =?utf-8?B?OGl4U0FlNzY3RVZ6cVJrUmU4U0V3ZXdoN2kvOURqN2laeHhaR0o2dFhDL3ZR?=
 =?utf-8?B?M1IwSGdtTkhUaTIwclNhRHZYSE9wZ0RBRUpETTRDU3A3WGlQMDltamRUSFZN?=
 =?utf-8?B?R0FyaFZQaUJ6ZnJqdkZBNFI1bENWSThZUTNOMmRzSWwzZWxxNE16SVhjZGRG?=
 =?utf-8?B?ZWwzdnBRZ1NoR21ZSXdHNFJPY2huZGs1QXBtZGhramxlc3pDWjFBREZKMGZV?=
 =?utf-8?B?Y2ZZL3oweXN2R25JV0xnRDYwd1ZGejQ5bzQzNFpVQitwYTJkWUovenVxRG96?=
 =?utf-8?B?aWJtNWl4bFBKVXFVZzlSYTM4M2RtWVYyS2ZRS203cEcvZjNwdG1vNWVITU1K?=
 =?utf-8?B?eTBUZko5R1ZXRk5VQWt4V2wrYlkrSnNjSjEyeEl5QUdqQnhNYUQ2Ty9GbzZF?=
 =?utf-8?B?N3ozQVlZUnVPUkFSQ1dIR0IyZ045OU9yQVdmaTRPRHNXS2J0NGhpb2VUdGtt?=
 =?utf-8?B?c3lyZ0NtZ0duNW91TmNZS2dWOEVkanU3L1pQditZcGZXUlJvckZvd1U4VHZJ?=
 =?utf-8?B?R1FreXZxMkgvd0U3ckZFdTNPQTdwK29uQ2JMZmU0M3crbW5uMWNVNjh3Yzlz?=
 =?utf-8?B?aUJZT2tOc1AyelZLQTRqUldWN3V0UitEYlN4MGlGZFNOdTdvT3ZhUjZRMk9o?=
 =?utf-8?B?RW9JTTFrQ1NBZDBpZHBKdDJtd1E1akVQZUVlQlk4SmFuZWtHQlpxOSsvQytN?=
 =?utf-8?B?MllRTEx1VS9TdTdOb3o5RG4yWWo0Y1UrWnFtRVZPS1ZidHZQZ0l6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nmpX/Sur0k0j/FwKFiEQoZ5lyQV2pXDqStcuK5ZgwqvxNj1O2oT7LobclYfMAlW9NrZAqOXlbchrqDhsnHHX0gk9nz6feg8D8PxEbwHqyMpmwaz7VedACfAU/0EHmmhdywAEDE/oP1zp3eSqigDcm1CnYDvClcrjPdyYbn6zDUg86dH0qz0fCML77pmvYCc4hrPYdAkghN1Nbku+bt8qiwy7KFaoga4xQbRrUysKNZ8a+h8mwE7Xf7BzdEfCD8LYJ8k5gMGOjn4xlzqala+F4/8YLkFDvCcEiXJLEwYYRSSL0LR1dYJ3WoZPFYRx02r5158EeO64owzw27h6R1jD+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055d5d57-c245-4687-f851-08def10b55de
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 03:00:12.0535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zEdzRDUG/X/ZCLd7dxOT5vuiz0e9BWpICy8EJhpeNclP88eVwWCrI9xhxWufszGbIgFr2zN5W2LKsOyHApRCxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS97aTkxNSwgeGV9L2Rpc3BsYXk6IGFkZCBjb3JlIHdv
cmthcm91bmQgcXVlcnkgdG8NCj4gZGlzcGxheSBwYXJlbnQgaW50ZXJmYWNlDQo+IA0KPiBUaGVy
ZSBhcmUgd29ya2Fyb3VuZHMgZGlzcGxheSBuZWVkcyB0byBhcHBseSBkZXBlbmRpbmcgb24gaW5m
b3JtYXRpb24gb25seQ0KPiBhdmFpbGFibGUgdG8gdGhlIGNvcmUgZHJpdmVyLiBBZGQgYSBkaXNw
bGF5IHBhcmVudCBpbnRlcmZhY2UgZm9yIHRoZSBxdWVyeS4gRm9yDQo+IHN0YXJ0ZXJzLCB0aGVy
ZSdzIG9ubHkgb25lIHdvcmthcm91bmQgbGlrZSB0aGlzLCBzbyBrZWVwIGl0IHNpbXBsZSBpbnN0
ZWFkIG9mDQo+IG92ZXItZW5naW5lZXJpbmcuDQo+IA0KPiBUaGlzIGxldHMgdXMgZHJvcCBhbiAj
aWZkZWYgSTkxNSBhcyB3ZWxsIGFzIHhlIGRlcGVuZGVuY3kgb24gc29tZSBkaXNwbGF5DQo+IGhl
YWRlcnMuDQo+IA0KPiB2MjogZ2l0IGFkZCB4ZV9kaXNwbGF5X3dhLmgNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmMgfCAgMyArKy0NCj4g
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmggfCAgOSAtLS0t
LS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXkuYyAgICAgICAg
IHwgIDIgKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfd2EuYyAg
ICAgIHwgMTMgKysrKysrKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZGlzcGxheV93YS5oICAgICAgfCAgOSArKysrKysrKysNCj4gIGluY2x1ZGUvZHJtL2ludGVsL2Rp
c3BsYXlfcGFyZW50X2ludGVyZmFjZS5oICAgIHwgIDcgKysrKysrKw0KPiAgNiBmaWxlcyBjaGFu
Z2VkLCAyOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0
NA0KPiBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5X3dhLmgNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfd2Eu
Yw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5jDQo+
IGluZGV4IDM2NjJlMGYxN2M2OS4uMTBkYzI5MzA0NjhkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfd2EuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfd2EuYw0KPiBAQCAtNCw2ICs0LDcg
QEANCj4gICAqLw0KPiANCj4gICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+DQo+ICsjaW5jbHVk
ZSA8ZHJtL2ludGVsL2Rpc3BsYXlfcGFyZW50X2ludGVyZmFjZS5oPg0KPiAgI2luY2x1ZGUgPGRy
bS9pbnRlbC9zdGVwLmg+DQo+IA0KPiAgI2luY2x1ZGUgImludGVsX2RlLmgiDQo+IEBAIC0xMzEs
NyArMTMyLDcgQEAgYm9vbCBfX2ludGVsX2Rpc3BsYXlfd2Eoc3RydWN0IGludGVsX2Rpc3BsYXkg
KmRpc3BsYXksDQo+IGVudW0gaW50ZWxfZGlzcGxheV93YSB3YSwNCj4gIAljYXNlIElOVEVMX0RJ
U1BMQVlfV0FfMTYwMTE4NjM3NTg6DQo+ICAJCXJldHVybiBESVNQTEFZX1ZFUihkaXNwbGF5KSA+
PSAxMTsNCj4gIAljYXNlIElOVEVMX0RJU1BMQVlfV0FfMTYwMjM1ODgzNDA6DQo+IC0JCXJldHVy
biBpbnRlbF9kaXNwbGF5X25lZWRzX3dhXzE2MDIzNTg4MzQwKGRpc3BsYXkpOw0KPiArCQlyZXR1
cm4gZGlzcGxheS0+cGFyZW50LT53YSAmJg0KPiArZGlzcGxheS0+cGFyZW50LT53YS0+d2FfMTYw
MjM1ODgzNDAoZGlzcGxheS0+ZHJtKTsNCj4gIAljYXNlIElOVEVMX0RJU1BMQVlfV0FfMTYwMjU1
NzM1NzU6DQo+ICAJCXJldHVybiBpbnRlbF9kaXNwbGF5X25lZWRzX3dhXzE2MDI1NTczNTc1KGRp
c3BsYXkpOw0KPiAgCWNhc2UgSU5URUxfRElTUExBWV9XQV8xNjAyNTU5NjY0NzoNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5oDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3dhLmgNCj4gaW5k
ZXggMzM4YjMyZTQxNjJkLi40MjVhMzAwODQwYWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV93YS5oDQo+IEBAIC0xMiwxNSArMTIsNiBA
QCBzdHJ1Y3QgaW50ZWxfZGlzcGxheTsNCj4gDQo+ICB2b2lkIGludGVsX2Rpc3BsYXlfd2FfYXBw
bHkoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpOw0KPiANCj4gLSNpZmRlZiBJOTE1DQo+
IC1zdGF0aWMgaW5saW5lIGJvb2wgaW50ZWxfZGlzcGxheV9uZWVkc193YV8xNjAyMzU4ODM0MChz
dHJ1Y3QgaW50ZWxfZGlzcGxheQ0KPiAqZGlzcGxheSkgLXsNCj4gLQlyZXR1cm4gZmFsc2U7DQo+
IC19DQo+IC0jZWxzZQ0KPiAtYm9vbCBpbnRlbF9kaXNwbGF5X25lZWRzX3dhXzE2MDIzNTg4MzQw
KHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KTsgLQ0KPiAjZW5kaWYNCj4gLQ0KPiAgLyoN
Cj4gICAqIFRoaXMgZW51bSBsaXN0cyBkaXNwbGF5IHdvcmthcm91bmRzOyBlYWNoIGVudHJ5IGhl
cmUgbXVzdCBoYXZlIGENCj4gICAqIGNvcnJlc3BvbmRpbmcgY2FzZSBpbiBfX2ludGVsX2Rpc3Bs
YXlfd2EoKS4gIEtlZXAgYm90aCBzb3J0ZWQgYnkgbGluZWFnZQ0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+IGluZGV4IDhkYTRjNDU3YTRhMC4uMTBkODBkYzgx
MmJjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheS5jDQo+IEBA
IC0zNyw2ICszNyw3IEBADQo+ICAjaW5jbHVkZSAieGVfZGlzcGxheV9iby5oIg0KPiAgI2luY2x1
ZGUgInhlX2Rpc3BsYXlfcGNvZGUuaCINCj4gICNpbmNsdWRlICJ4ZV9kaXNwbGF5X3JwbS5oIg0K
PiArI2luY2x1ZGUgInhlX2Rpc3BsYXlfd2EuaCINCj4gICNpbmNsdWRlICJ4ZV9kc2JfYnVmZmVy
LmgiDQo+ICAjaW5jbHVkZSAieGVfZmJfcGluLmgiDQo+ICAjaW5jbHVkZSAieGVfZnJvbnRidWZm
ZXIuaCINCj4gQEAgLTQ1OCw2ICs0NTksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGludGVsX2Rp
c3BsYXlfcGFyZW50X2ludGVyZmFjZSBwYXJlbnQNCj4gPSB7DQo+ICAJLnBjb2RlID0gJnhlX2Rp
c3BsYXlfcGNvZGVfaW50ZXJmYWNlLA0KPiAgCS5ycG0gPSAmeGVfZGlzcGxheV9ycG1faW50ZXJm
YWNlLA0KPiAgCS5zdG9sZW4gPSAmeGVfZGlzcGxheV9zdG9sZW5faW50ZXJmYWNlLA0KPiArCS53
YSA9ICZ4ZV9kaXNwbGF5X3dhX2ludGVyZmFjZSwNCg0KU2hvdWxkIHdlIG1heWJlIGhhdmUgYSBj
b21tZW50IGRvY3VtZW50aW5nIHdoZW4gaXQgaXMgb2theSB0byB1c2UgdGhpcywgYmFzaWNhbGx5
IHVzZSB0aGlzIG9ubHkgaWYgdW5hdm9pZGFibGUgYW5kIHdoZW4NClJlcXVpcmVkIGluZm8gaXMg
YXZhaWxhYmxlIGluIG9ubHkgY29yZSBkcml2ZXIgdG8gYXZvaWQgaXQgYmVpbmcgbWlzdXNlZCBp
biBmdXR1cmUuDQoNCk90aGVyd2lzZSwNCkxHVE0sDQpSZXZpZXdlZC1ieTogU3VyYWogS2FuZHBh
bCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQoNCj4gIAkuaGFzX2F1eGNjcyA9IGhhc19hdXhj
Y3MsDQo+ICB9Ow0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5
L3hlX2Rpc3BsYXlfd2EuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3Bs
YXlfd2EuYw0KPiBpbmRleCAyYWExYjhjMDM0MTEuLjQ2ZTQxZThhMzMwNCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheV93YS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfd2EuYw0KPiBAQCAtMywxNyArMywy
MiBAQA0KPiAgICogQ29weXJpZ2h0IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4gICAqLw0K
PiANCj4gLSNpbmNsdWRlICJpbnRlbF9kaXNwbGF5X2NvcmUuaCINCj4gLSNpbmNsdWRlICJpbnRl
bF9kaXNwbGF5X3dhLmgiDQo+ICsjaW5jbHVkZSA8ZHJtL2ludGVsL2Rpc3BsYXlfcGFyZW50X2lu
dGVyZmFjZS5oPg0KPiArDQo+ICAjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+ICsjaW5jbHVkZSAi
eGVfZGlzcGxheV93YS5oIg0KPiAgI2luY2x1ZGUgInhlX3dhLmgiDQo+IA0KPiAgI2luY2x1ZGUg
PGdlbmVyYXRlZC94ZV93YV9vb2IuaD4NCj4gDQo+IC1ib29sIGludGVsX2Rpc3BsYXlfbmVlZHNf
d2FfMTYwMjM1ODgzNDAoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+ICtzdGF0aWMg
Ym9vbCBpbnRlbF9kaXNwbGF5X25lZWRzX3dhXzE2MDIzNTg4MzQwKHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0pDQo+ICB7DQo+IC0Jc3RydWN0IHhlX2RldmljZSAqeGUgPSB0b194ZV9kZXZpY2UoZGlz
cGxheS0+ZHJtKTsNCj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRvX3hlX2RldmljZShkcm0p
Ow0KPiAgCXN0cnVjdCB4ZV9ndCAqd2FfZ3QgPSB4ZV9yb290X21taW9fZ3QoeGUpOw0KPiANCj4g
IAlyZXR1cm4gd2FfZ3QgJiYgWEVfR1RfV0Eod2FfZ3QsIDE2MDIzNTg4MzQwKTsgIH0NCj4gKw0K
PiArY29uc3Qgc3RydWN0IGludGVsX2Rpc3BsYXlfd2FfaW50ZXJmYWNlIHhlX2Rpc3BsYXlfd2Ff
aW50ZXJmYWNlID0gew0KPiArCS53YV8xNjAyMzU4ODM0MCA9IGludGVsX2Rpc3BsYXlfbmVlZHNf
d2FfMTYwMjM1ODgzNDAsDQo+ICt9Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZGlzcGxheV93YS5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkv
eGVfZGlzcGxheV93YS5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uMDI2MmI0NjM5MTZkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheV93YS5oDQo+IEBAIC0wLDAgKzEsOSBAQA0KPiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiArLyogQ29weXJpZ2h0IMKpIDIwMjYg
SW50ZWwgQ29ycG9yYXRpb24gKi8NCj4gKw0KPiArI2lmbmRlZiBfX1hFX0RJU1BMQVlfV0FfSF9f
DQo+ICsjZGVmaW5lIF9fWEVfRElTUExBWV9XQV9IX18NCj4gKw0KPiArZXh0ZXJuIGNvbnN0IHN0
cnVjdCBpbnRlbF9kaXNwbGF5X3dhX2ludGVyZmFjZSB4ZV9kaXNwbGF5X3dhX2ludGVyZmFjZTsN
Cj4gKw0KPiArI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pbnRlbC9kaXNwbGF5
X3BhcmVudF9pbnRlcmZhY2UuaA0KPiBiL2luY2x1ZGUvZHJtL2ludGVsL2Rpc3BsYXlfcGFyZW50
X2ludGVyZmFjZS5oDQo+IGluZGV4IGRlMzk1ZGY5Y2EzMC4uYmRjOWY5YWQ0ZmNiIDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL2RybS9pbnRlbC9kaXNwbGF5X3BhcmVudF9pbnRlcmZhY2UuaA0KPiAr
KysgYi9pbmNsdWRlL2RybS9pbnRlbC9kaXNwbGF5X3BhcmVudF9pbnRlcmZhY2UuaA0KPiBAQCAt
MjMwLDYgKzIzMCwxMCBAQCBzdHJ1Y3QgaW50ZWxfZGlzcGxheV92bHZfaW9zZl9pbnRlcmZhY2Ug
ew0KPiAgCWludCAoKndyaXRlKShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBlbnVtIHZsdl9pb3Nm
X3NiX3VuaXQgdW5pdCwgdTMyDQo+IGFkZHIsIHUzMiB2YWwpOyAgfTsNCj4gDQo+ICtzdHJ1Y3Qg
aW50ZWxfZGlzcGxheV93YV9pbnRlcmZhY2Ugew0KPiArCWJvb2wgKCp3YV8xNjAyMzU4ODM0MCko
c3RydWN0IGRybV9kZXZpY2UgKmRybSk7IH07DQo+ICsNCj4gIC8qKg0KPiAgICogc3RydWN0IGlu
dGVsX2Rpc3BsYXlfcGFyZW50X2ludGVyZmFjZSAtIHNlcnZpY2VzIHBhcmVudCBkcml2ZXIgcHJv
dmlkZXMgdG8NCj4gZGlzcGxheQ0KPiAgICoNCj4gQEAgLTI5MSw2ICsyOTUsOSBAQCBzdHJ1Y3Qg
aW50ZWxfZGlzcGxheV9wYXJlbnRfaW50ZXJmYWNlIHsNCj4gIAkvKiogQHZsdl9pb3NmOiBWTFYg
SU9TRiBzaWRlYmFuZC4gT3B0aW9uYWwuICovDQo+ICAJY29uc3Qgc3RydWN0IGludGVsX2Rpc3Bs
YXlfdmx2X2lvc2ZfaW50ZXJmYWNlICp2bHZfaW9zZjsNCj4gDQo+ICsJLyoqIEB3YTogRGlzcGxh
eSB3b3JrYXJvdW5kcyBxdWVyeS4gT3B0aW9uYWwuICovDQo+ICsJY29uc3Qgc3RydWN0IGludGVs
X2Rpc3BsYXlfd2FfaW50ZXJmYWNlICp3YTsNCj4gKw0KPiAgCS8qIEdlbmVyaWMgaW5kZXBlbmRl
bnQgZnVuY3Rpb25zICovDQo+ICAJc3RydWN0IHsNCj4gIAkJLyoqIEBmZW5jZV9wcmlvcml0eV9k
aXNwbGF5OiBTZXQgZGlzcGxheSBwcmlvcml0eS4gT3B0aW9uYWwuICovDQo+IC0tDQo+IDIuNDcu
Mw0KDQo=
