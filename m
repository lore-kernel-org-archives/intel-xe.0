Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42687F483C6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD9910E0AA;
	Mon, 23 Mar 2026 16:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J21sMmmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC3810E0AA
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 16:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774283203; x=1805819203;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5AIPDOYHP9C6K7xox5mBxrhsOtY4Jc3OUF01I76CLgo=;
 b=J21sMmmJBqao3Ze+/0OhKmLCGXEJ3ROMk98lH1/M0RIshUrZ2PmOTW+m
 Sv8zJia7bv9rqit2NlxCZZznBKJDynLxhaNYYY9lX7oTTSaa1tNaaBpad
 FXQUX9XOwGexU3G/F7/T2N21Hjy22KAWcFKP1b1hT/2nLwGl5DjVoZUu5
 +drdF2E5WnFjK6RDK+jPNq092LCgL3QDntu6+Zym+T2c2jetReoCokieJ
 DrqncLdEP1rJ28s2ZZltXxI6SlC9vWpLId1oaa6EmTQuwfWb0+D47IubM
 kkiRen46WsmQPHUUGxDhQeuJgZls+i/vMVmsQXMD9OKo7yt4wnMKGKwJJ Q==;
X-CSE-ConnectionGUID: cA3ZjAv2SCKIYLSPJXzHCg==
X-CSE-MsgGUID: nSTB6yBDRPKYRwor7ANSsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="62844049"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="62844049"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:26:42 -0700
X-CSE-ConnectionGUID: 1sNqzALgTpOXGSCf8qi9Qg==
X-CSE-MsgGUID: 438tTcmMRR66BlVqds2fmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228554238"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:26:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:26:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 09:26:39 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nU5nShOEcJvhQVPUgAme6IAUzACjeTeOrowPQNxHdQIk+slAor0QrzqbVnYJg2XU4d21SsaJCQoablwuJ7Zk2rriB2RyKRgsnMIkg5Ug0DGxSB3x08oVRHnvk5zXbg6fD2UOs+/57SL+44kxXiYKcwmejrNnvadU+3oxM0PCxdyot2dxu4eeRgkcpT0yvlf4q8sGiMxjO0jiT3lvSmxjmkWXXR8fqLdryOiuWLY9FbT94dps+G9cN5sa0PSanzfxd3uMUvvghFXQFwcNtdjC/O7kIkY5erz/ZPho0CqJKjMk2bU+Dp6bFjUTf3e1MPBHPHFCPmlFZIBCQgRZk6fNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AIPDOYHP9C6K7xox5mBxrhsOtY4Jc3OUF01I76CLgo=;
 b=SO6r2aVWIOJS7KQqxmRw/L0Rc5Ck0T2+KQfSGikloiPyUdZYG/VrjiWxYUnQ3Pa8FQF+ttTkM9dzfZOs+TPZLQDHbmcgE+xbY/eGUPBdOPmTEpykskHfny00KMrSQL6S5PaazZdwujv6/ytZbkNKYm+rLxjcwClaIvuX9ryGMWdPYXGWIGa48DJ1HIiXRA9pQ5HLRrGAs+ELGmsx4B7xLu03BqnReXJ2UIFMz3CSCMN48zEu/EUJWro3Fuqk0JWt4TsN2LVGt9wuxGQepFTMcT4mIPN9URZGHYhk0OkKJ6ssqFlL1MAjyakgzbKA5Ng+J2tPZ559nmrZI9Wzob+ejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 16:26:36 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 16:26:36 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no
 queues mapped
Thread-Topic: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no
 queues mapped
Thread-Index: AQHcrC/wQH2rmKaem0yHaBcUZ+4Qg7W8ZmsAgAACQQCAAAE9AA==
Date: Mon, 23 Mar 2026 16:26:36 +0000
Message-ID: <64af464463c20f4fa78deb75fdf341373331a04b.camel@intel.com>
References: <20260304233728.926378-1-matthew.brost@intel.com>
 <7f334028a55504b5f75f2fddd555a65107de2a49.camel@intel.com>
 <acFnkD6HZV4r/8o6@lstrano-desk.jf.intel.com>
In-Reply-To: <acFnkD6HZV4r/8o6@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA3PR11MB8001:EE_
x-ms-office365-filtering-correlation-id: afa0ce16-8086-4487-f496-08de88f8f465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: Gv08iawYYDppsxRwFRyIuaY6kcSLqwBxQUI135WkDeVS6LLUogHBaiZ5Xa8wM4UIaUGaQ3Ltuzplh11ghs/uGX2TgO49iBEpGg7hE0nsP70/Udc+tFLKNTvCwfNGCLMRWxE4ZfigD+vSooHp7Xxg7JMJkFSXYaTX3fpvgnVdNaRZgIMFM9J2dTLnp6q0S92Vm+44Om4Q/kliwNP9h11zeHqt2wqe+WMzBl+dI4P2B3POaDpjVnI3Y/VvRArMBYQT5nED+qLXFCXhP2ipTCc2JM09OdRiPyYNJVz9d7f8I4PI4T5rDDkeqEjZAqP/2J1SoY6vJSqnVw1rd2uZMYcM1MqMSYA8ynaTtDiTllVIil1AGYnnyJqxJHVOpxrRQ/seAmfoRiigh0MeAuR/vcBYzljDELvSBR2B564ceOx4cEtmOM0aou9Tgr9T2wE7nY6iskcJHNAKH+hFVpNB6sjKAuCGdT/gUDqfQ8IDRokCG2fXsAWdJGiCcGHZU+X0W3dLM+LjX6WDsR3GnbMsZoJqJqL968FMLUr3DhlOCmqX08L4zTuhJ1Ue+EoyucA/6I1akz5n4bYAoBp7pV1/aCuvXfgPpsXZ+5TMEto5r/HqKW722lnL42RM9eDz66R4jMDxdWT8a3vmFStxajmRj0migHi2ocKdGgoNm0URIJI1qx/G1RZW/Owi6nRvWNNVvfrWwR2ZoHhi5AuJG1bFpjqb718+epvoXfkd6vXnfKqQixihglbv3mNPTOzqeA8zuv5tv7zxJchnViEWKMcBEzPZcQSp7Lp5thuByxZKTXNoDJA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alBEdjFyQWlBUHhBZ2dQVU5XaG44c1hqalI4ZTZzaWZYZVZkU3pwWk8xT3BM?=
 =?utf-8?B?ZjdlQnZuNVVjSStHMlQzVUdNUm5KcXI1RmlOY05GSDk0QS83S1NpZ1FGVkxQ?=
 =?utf-8?B?UXk2RllTb3ZoTDcvWWJuMVZqRTZEbmswVmFaV3BzWTFWQzhhK2VBM3dWL0Ew?=
 =?utf-8?B?eHhRTEh5aHh2bGFPdjBDeHZhREY5c0toYnQwWkN0MzhUaGE3OGhyVTU2djZ5?=
 =?utf-8?B?bWtYSWh5THdiSTM3UGRKaGNXcjBjbTh6bnN6aFZKblVkUS9VRlA0VERlQjYz?=
 =?utf-8?B?Q1ZjY2x6bU40amJ5WXhVTytQZkloeThpaTJmMWgyTkhiblViV3o1dU9WaHlN?=
 =?utf-8?B?NkVsa01YQTB4bEhsUTA2K1VZbjA4ckdySXBpalB3TzFwektEZWV0Zk8zVDYr?=
 =?utf-8?B?ZHVjWDFNSnZ5SmxPUmdYazJBaE0xZjdlYWJzQVdjUEl6aFRMN3BvaVB5ZHgw?=
 =?utf-8?B?RllMb2piNlpQS0lSNmNwek5SOTJra3hKalZEUHB3MDdkZmpZSnBtcEpqRWt4?=
 =?utf-8?B?NkhJaTlKZEhLU0MwQmd5U2xENzJKUTZ4OFdIcEUrdG13aUlIWUUvZWVQRGhZ?=
 =?utf-8?B?Yks4UnByMDA0TU53TVN0SjBNT3BhZWtUbSt0dE8zeHFZa1VNRlNlOWV3MHFi?=
 =?utf-8?B?Q29TcDVnZ2lnL2VTZ0NLbVE1QTFOazI1MkE0bk94K0lTTWRwL0VrYmhNZGR5?=
 =?utf-8?B?UVVJeDF0bTJQZ0Z3RXUzRzBmU3BGUUExeEJ1RXJkS0p1VklMZm95S21RNEtO?=
 =?utf-8?B?NGZxTE5ia0hhU011aUR4LzBWSWtValVjZUt5dU1DZWk2SUV0MGRJOWk4UTRJ?=
 =?utf-8?B?NlVMdUJEUEVoeDY5SDBCZVhlTFQ1dnN1WENGREJGZzVtaEcxSDEzZ0pXYlhX?=
 =?utf-8?B?c1ZIMHZPT3JReWtLeWhwbms5eGVsN1NaNnJkNmhmaXZCd21wZVJabzRDenE2?=
 =?utf-8?B?U1VsL3hQWHp6RHcwVDc5S0tha0JkcUR5RmxuTHhuVjZlM2Noc0dDYjIwOWg3?=
 =?utf-8?B?aXN5ZTZDYm5XMVA2RkJqOHJNSExUR3FFeFNHWXZYNDZNS2hGUGExUHk0akt3?=
 =?utf-8?B?cFRZWDcxTXFQc2o2MTlsZFM5aExEUDkraXpvR3NKZnZCeGRGK0l4R1ZmaUow?=
 =?utf-8?B?S01XMVJ3Qzl2R1hORGY0T0Rxb3V0aFVXQ3dPWWEzS3ZJd2hFbXFnWWdWS0Yy?=
 =?utf-8?B?L2hjL1Jha3ViMWFqdENxcWxXS0U3bGw1ZG1TNFBGTFo0bWt4QTF4Yi9lQVcr?=
 =?utf-8?B?YlRFLzBzeis4ZGRzSkc3YmxPSTk3N05OMVVablcxNmRQQkJ6aVprSWJBWTA1?=
 =?utf-8?B?NU1jd3hHZjEzSDYwQnZOWWRaQk05WFFxYmNUUFNYYitlak5Tb1hKME5QZ0Z0?=
 =?utf-8?B?eVovZGg0UGcwZ2xGTXhPOGMxb1FPNVljcjhCajFiYXNSM0J3MzVJc2Q3b2lw?=
 =?utf-8?B?Q2V2ZlhONi94NzBoZzR4cnUwSmN1YWNybW5Rc2x2RlZ2REhPMXRNY1hEM01H?=
 =?utf-8?B?M1JSVU15aTZFUzJwZGE3UXAyRk0veS82aFNmdlF3Vk5jK2lFb0RiZ3U2UkVk?=
 =?utf-8?B?SnF6OW5mbWRrTDY0QzdtL3VkNzZqWDlGQWhycFd3U1FtOW13ZjlMbTFVUGFH?=
 =?utf-8?B?QTdwbmNpZlZ4Vjd1Wm5MSUtQOTY2eHFibHBwWU5mU05nbktOZGxqTWdpN0Ro?=
 =?utf-8?B?R1hvaEZOSVU2V3ZJOWt2M0JrdFBoS3dOZCs1elJaU2xGTjU4aDd6Y1plbW5H?=
 =?utf-8?B?NE8wV0lZZ2NvbTlkb0JxdExQSU8vRVJJSUdyazFQOUxFYmVBd3h2WkUzam44?=
 =?utf-8?B?QjRiaFR4U2tqYWh0bWlmMFhhR0dHa2xIWmxUMHBPZmJ3RzM3QVRoWXJhaG9T?=
 =?utf-8?B?TGhhYm01MHVaYTlaMG1RSDR1TVNPSjZuZ1NER1M0aDNNcC9RWVozUTdGZEVO?=
 =?utf-8?B?b3hEWnM5YVpQdldHZjFUc29CcGdITVVtWm5RSUhlUUcvSHAxM1hCZkZ5VDZD?=
 =?utf-8?B?UWo2UlJLWDJtVXl0ZFRZYVVUWnluV2h3dDBrcXlwWHpZaE9nMXNwaWxCcUs5?=
 =?utf-8?B?SEtIVmFEZnNUVzF5eWtaNk12K3p2MWVBa3BCdlkwblhIbWhBZUFuWXczTlh0?=
 =?utf-8?B?VUpwWURSTWFsLy9BVWNhTW5yeUpWZTlzaWZPU1h5dlVwZURKbUxJd05FZk1k?=
 =?utf-8?B?bTdKTHFhVkpzZUZlVG83bXJBUXgyUjRRMlZEd05ST0NBMkt4T21oZWRaV3cx?=
 =?utf-8?B?WUR3UVNPK1J3aXpRVEFPYzZBbGlRako5V1M4U01MZ2FMRzVmK0dlVVB3am9h?=
 =?utf-8?B?VnhuRDcyUWlacFZtaGw4UCtjVmFPOEF2V051OUN1ZkpVb0Y0T3JHUUFnd0dx?=
 =?utf-8?Q?IzTtujoXxxSgvwgY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DB80DB7A9CCC743B2F00F537E3C01C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MqmlRBZ3FzdpIQvlbOqZTg75mDYPH6DMIFndSCl0XfZYU66aiYNMkr2NVGOoBciFOGyLC2tvtBWFAY0r/cvZyvzEGPO3I5W1a187r147QDxHYIKRV384/kon3jYLN0TAmBEdDNsnUgFQQLIFN6PrcHtLgUelHoQrXn1QeMqhspiYcfO3oCu+PlvpgBJLvcCnio5kAyiAmxUj+rB/Ro3umM6k9FL9y7aidrg9YnFZ56w+aGIgT9aT5VK7MrL/bzRWqML0qFDrZLOYx70LPDUdkl7/GptwxHFrmlj6hzcZB8rtsFGkM1gCf6cKOApuqPShIr4uVQAEGhRihqTss2t7Uw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa0ce16-8086-4487-f496-08de88f8f465
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 16:26:36.6461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZ1fpkIZScsOWFj/PE9LXMGdU57eLpcu+Xu22i8WglsJiqno124gplt9CJrmqr0Zg5QsI4eiMTADnHwzzihdW/NSsF33CGwHL/2KBk/YDgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
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

T24gTW9uLCAyMDI2LTAzLTIzIGF0IDA5OjE3IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIE1vbiwgTWFyIDIzLCAyMDI2IGF0IDEwOjEzOjI4QU0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIFdlZCwgMjAyNi0wMy0wNCBhdCAxNTozNyAtMDgwMCwgTWF0dGhldyBC
cm9zdCB3cm90ZToKPiA+ID4gSWYgbm8gZXhlYyBxdWV1ZXMgZnJvbSBhIFZNIGFyZSBtYXBwZWQg
b24gdGhlIG1lZGlhIEdULCBpc3N1aW5nIGEKPiA+ID4gUFBHVFQgVExCIGludmFsaWRhdGlvbiBm
b3IgdGhhdCBHVCByZXF1aXJlcyBhbiByYzYgd2FrZSB3aGljaCBpcwo+ID4gPiBleHBlbnNpdmUu
Cj4gPiA+IAo+ID4gPiBTa2lwIHRoZSBtZWRpYSBHVCBUTEIgaW52YWxpZGF0aW9uIHdoZW4gdGhl
IFZNIGhhcyBubyBleGVjIHF1ZXVlcwo+ID4gPiBtYXBwZWQgb24gaXQuIElmIFRMQiBpbnZhbGlk
YXRpb25zIGFyZSBhbHJlYWR5IGluLWZsaWdodCBvbiB0aGF0Cj4gPiA+IEdUCj4gPiA+IHdlIGNh
bid0IGJyZWFrIGZlbmNlIG9yZGVyaW5nLCBzbyBpc3N1ZSBhIGR1bW15IEdHVFQgaW52YWxpZGF0
aW9uCj4gPiA+IGluc3RlYWQgdG8gbWFpbnRhaW4gc2Vxbm8gb3JkZXJpbmcuCj4gPiA+IAo+ID4g
PiBUaGlzIG9wdGltaXphdGlvbiBpcyBwYXJ0aWN1bGFybHkgaW1wYWN0ZnVsIGZvciBTVk0gd29y
a2xvYWRzCj4gPiA+IHdoaWNoCj4gPiA+IG1heSBvciBtYXkgbm90IHVzZSB0aGUgbWVkaWEgR1Qu
IEF2ZXJhZ2UgVExCIGludmFsaWRhdGlvbiB0aW1lCj4gPiA+IGRyb3BzCj4gPiA+IGZyb20gfjc1
dXMgdG8gfjE4dXMgaW4gc3VjaCBiZW5jaG1hcmtzLgo+ID4gCj4gPiBTby4uIHdoYXQgaWYgdGhl
IHVzZXIgY3JlYXRlcyB0aGUgVk0sIGJpbmRzIGl0LCBhbmQgb25seSB0aGVuCj4gPiBjcmVhdGVz
Cj4gPiBhbiBleGVjIHF1ZXVlIGFuZCBzdWJtaXRzPwo+ID4gCj4gCj4gSSB3b3VsZCB0aGluayB0
aGUgVExCcyB3b3VsZCBiZSBlbXB0eSBidXQgc29tZXRoaW5nIGlzIGNsZWFybHkgd3JvbmcKPiBp
bgo+IHBhdGNoIHBlciBDSSBhbmQgcGVyaGFwcyB0aGlzIGlzIHRoZSBwcm9ibGVtLiBOZWVkIHRv
IGRpZyBpbnRvCj4gZmFpbHVyZXMKPiB0aGlzIHdlZWsuCgpJIGtpbmQgb2YgYWdyZWUgd2l0aCBU
aG9tYXMgaGVyZSB0aGF0IHdoYXRldmVyIHdlIGRlY2lkZSBoZXJlIHNob3VsZAp3b3JrIG9uIGJv
dGggR1RzLiBBbmQgSSdkIGV4cGVjdCB3aGVuIHdlIGRvIHRoZSBjb250ZXh0IHN3aXRjaCB0aGF0
IHRoZQpUTEIgd291bGQgYmUgaW1wbGljaXRseSBmbHVzaGVkLCBzbyBJIGFncmVlIGl0IHNob3Vs
ZCBiZSBlbXB0eS4gTWF5YmUKd2UgYWRkIGFuIGV4cGxpY2l0IGZsdXNoIG9uIGV4ZWMgcXVldWUg
Y3JlYXRpb24gaWYgd2Ugc2tpcHBlZCBpdCBvbiB0aGUKYmluZCB0byBjb3ZlciBhIGNvcm5lciBj
YXNlIHRoZXJlPyBCdXQgeWVhaCBzZWVtcyBsaWtlIGl0IG1pZ2h0IG5lZWQKZGVidWcuLi4KCi1T
dHVhcnQKCj4gCj4gTWF0dAo+IMKgCj4gPiAtU3R1YXJ0Cj4gPiAKPiA+ID4gCj4gPiA+IEFzc2lz
dGVkLWJ5OiBHaXRIdWIgQ29waWxvdDpjbGF1ZGUtc29ubmV0LTQuNiAjIERvY3VtZW50YXRpb24K
PiA+ID4gb25seS4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfdGxiX2ludmFsLmMgfCA0Mwo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+
ID4gwqAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3RsYl9pbnZh
bC5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+ID4gPiBp
bmRleCBjZWQ1OGY0NmY4NDYuLjIwYzM0NDY5ZDlhNSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3RsYl9pbnZhbC5jCj4gPiA+IEBAIC0yMDUsMTQgKzIwNSw1MyBAQCBzdGF0
aWMgaW50IHNlbmRfdGxiX2ludmFsX2FzaWRfcHBndHQoc3RydWN0Cj4gPiA+IHhlX3RsYl9pbnZh
bCAqdGxiX2ludmFsLCB1MzIgc2Vxbm8sCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJt
X3N1YmFsbG9jICpwcmxfc2EpCj4gPiA+IMKgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX2d1YyAqZ3VjID0gdGxiX2ludmFsLT5wcml2YXRlOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd1Y190b194ZShndWMpOwo+ID4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oHN0cnVjdCB4ZV92bSAqdm07Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGludCBlcnIgPSAwLCBpZCA9
IGd1Y190b19ndChndWMpLT5pbmZvLmlkOwo+ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
bG9ja2RlcF9hc3NlcnRfaGVsZCgmdGxiX2ludmFsLT5zZXFub19sb2NrKTsKPiA+ID4gwqAKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChndWNfdG9feGUoZ3VjKS0+aW5mby5mb3JjZV9leGVjbGlz
dCkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVDQU5DRUxF
RDsKPiA+ID4gwqAKPiA+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIHNlbmRfdGxiX2ludmFsX3Bw
Z3R0KGd1Yywgc2Vxbm8sIHN0YXJ0LCBlbmQsIGFzaWQsCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4g
PiBYRV9HVUNfVExCX0lOVkFMX1BBR0VfU0VMRUNUSVZFLAo+ID4gPiBwcmxfc2EpOwo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBpZiAoIXhlX2d0X2lzX21lZGlhX3R5cGUoZ3QpKQo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHNlbmRfdGxiX2ludmFsX3BwZ3R0KGd1Yywg
c2Vxbm8sIHN0YXJ0LAo+ID4gPiBlbmQsCj4gPiA+IGFzaWQsCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAKPiA+ID4gWEVfR1VDX1RMQl9JTlZBTF9QQUdFX1NFTEVDVElWRSwKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmxfc2EpOwo+ID4gPiArCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoC8qIFRyeSB0byBza2lwIG1lZGlhIEdUIFRMQiBpbnZhbGlkYXRpb25zICov
Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgdm0gPSB4ZV9kZXZpY2VfYXNpZF90b192bSh4
ZSwgYXNpZCk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIodm0pKQo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBUUl9FUlIodm0pOwo+ID4gPiArCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGRvd25fcmVhZCgmdm0tPmV4ZWNfcXVldWVzLmxvY2spOwo+ID4g
PiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghdm0tPmV4ZWNfcXVldWVzLmNvdW50W2lkXSkg
ewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFdlIGNhbid0IGJyZWFrIGZlbmNlIG9yZGVyaW5nIGZv
ciBUTEIKPiA+ID4gaW52YWxpZGF0aW9uCj4gPiA+IGpvYnMsIGlmCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBUTEIgaW52YWxpZGF0aW9ucyBhcmUgaW5mbGlnaHQgaXNz
dWUgYSBkdW1teQo+ID4gPiBpbnZhbGlkYXRpb24gdG8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIG1haW50YWluIG9yZGVyaW5nLiBOb3IgY2FuIHdlIG1vdmUgc2FmZWx5
IHRoZQo+ID4gPiBzZXFub19yZWN2IHdoZW4KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIHJldHVybmluZyAtRUNBTkNFTEVEIGlmIFRMQiBpbnZhbGlkYXRpb25zIGFyZQo+
ID4gPiBpbgo+ID4gPiBmbGlnaHQuIFVzZQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogR0dUVCBpbnZhbGlkYXRpb24gYXMgZHVtbXkgaW52YWxpZGF0aW9uIGdpdmVuCj4g
PiA+IEFTSUQKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGludmFsaWRh
dGlvbnMgYXJlIHVuc3VwcG9ydGVkIGhlcmUuCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKi8KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV90
bGJfaW52YWxfaWRsZSh0bGJfaW52YWwpKQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IC1FQ0FOQ0VMRUQ7Cj4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0gc2VuZF90bGJfaW52YWxfZ2d0dCh0bGJfaW52YWws
Cj4gPiA+IHNlcW5vKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8g
ZXJyX3VubG9jazsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiArCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoGVyciA9IHNlbmRfdGxiX2ludmFsX3BwZ3R0KGd1Yywgc2Vxbm8sIHN0YXJ0LCBlbmQs
IGFzaWQsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+ID4gWEVfR1VDX1RMQl9JTlZBTF9QQUdFX1NFTEVD
VElWRSwKPiA+ID4gcHJsX3NhKTsKPiA+ID4gKwo+ID4gPiArZXJyX3VubG9jazoKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgdXBfcmVhZCgmdm0tPmV4ZWNfcXVldWVzLmxvY2spOwo+ID4gPiArwqDCoMKg
wqDCoMKgwqB4ZV92bV9wdXQodm0pOwo+ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biBlcnI7Cj4gPiA+IMKgfQo+ID4gPiDCoAo+ID4gPiDCoHN0YXRpYyBpbnQgc2VuZF90bGJfaW52
YWxfY3R4X3BwZ3R0KHN0cnVjdCB4ZV90bGJfaW52YWwKPiA+ID4gKnRsYl9pbnZhbCwKPiA+ID4g
dTMyIHNlcW5vLAo+ID4gCgo=
