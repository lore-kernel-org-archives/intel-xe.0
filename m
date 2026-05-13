Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426BBCD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 11:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E7410EE00;
	Wed, 13 May 2026 11:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMtanhQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7CB10E5D1
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 11:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778672549; x=1810208549;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=dKTbm+OadAZN2lCZx7vPnH+YNDYc96flBS5MQy896gY=;
 b=XMtanhQdi5og8oYsvPKthKbKmJX+gTFIB3wBoiqWN08/m+sVhbFy6uWX
 ZeRLD1VQlLwF8of21AIpakoqk1bS4YYkwzR2U6XAESCIeEJYKCbGTNYhJ
 d/2TEticvH5SrMQ1R7HVo6IM+XSDsPPtVa7gw7XirqRf/63I4Pof6xiz+
 BroGDgPhU4FAZcT8SvWRXjyXUridxvcr0cimdXObvYXEff6x5ZSRiELm2
 WDzTZuVtscxvtzBKGF6T0G6OiXtXkrHjqtNSZgXwU9VPj8qnFFZBC58x1
 ZiNtbP4q8hq56NxkwfAU6iQ59ULSnUs3dSWsDwfyqZcY6oVNvUJT5xukN A==;
X-CSE-ConnectionGUID: w85h6ZptQAKaKIZHIzRVLw==
X-CSE-MsgGUID: P9zT1PAlS4apIoI6rc7L8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="105056973"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="105056973"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 04:42:29 -0700
X-CSE-ConnectionGUID: lMCRll/ZS4yaBJvnJGlEng==
X-CSE-MsgGUID: wP8s85I3Rd6T3f8YwbQP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="238168161"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 04:42:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 04:42:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 04:42:28 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 04:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrIQ9VSnt606EyVBpVqthL5pJfvfZxYBevy+kxByc8QvNELdNEv+Ua8aW0fPr7n9Pq/ffcSutQPjwQUSIIW9M7YjxYWeerZYrei18yxe5UVy3avtFwNPOXd5zP1Z8N9XElJLMTyqDuK4boL4Fb6KVcuGrHmPGzjylGnuy8kd8UOOZWDjHesLgzp48n5fAHnGW7Ee8RdmNDcJj0VNx9HCeVUg4AVCWEHZ4hRYhg00PUUhqWJRdUk3p2AXcjircsN98O2QW4ObMpg3GJM3o1fuhVvBQ+dkKZyaa0NpazlDxaLX1S7EBUd0Gs80bOtacALlXeTG6tdvT44alADeFJEDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKTbm+OadAZN2lCZx7vPnH+YNDYc96flBS5MQy896gY=;
 b=EVenr3ZjSN0yYMwXF/erEhTnKrPpBVM55fZBb/D9MoQf/0hIX47IMMbCiK3c0h8ainDAM0kqO4rAaVWqhrtS2pTKiOU9Me45hNqIq6mXnmxYQ/UlrzXWSAhSvmyqbfGlcC1izLwNpf6Nsl0YIPJQ6Vmv+N5ZM/UkyFQuS/7LSFW6Z/tuLs/oBRIKWcBCvDqHzVxtZo4QZPznANddbSVwJ4EL3gPX29HelioSennTha/r9gMmLzGcvyiZ9BJbS5Sda8WP3n3/I8fx6BP9SNuId0jrrlHjcZj+uqD3EikcU5XXe+Txh+d8BajBlcyjqUDGUIiEq5S2QFa9tOUqdXrowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 11:42:22 +0000
Received: from CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::47d2:6278:7318:642a]) by CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::47d2:6278:7318:642a%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 11:42:22 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: LR mode TLB coherence for userptr, rebind, and
 exec ordering
Thread-Topic: [PATCH] drm/xe: LR mode TLB coherence for userptr, rebind, and
 exec ordering
Thread-Index: AQHc4sHDBJckQi7a30i8bwQJjaWxC7YL1ZiA
Date: Wed, 13 May 2026 11:42:21 +0000
Message-ID: <00be42dd8d2725f965ac39c1ddca2f165ddb93cf.camel@intel.com>
References: <20260513101659.3470307-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260513101659.3470307-1-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7730:EE_|SA1PR11MB7062:EE_
x-ms-office365-filtering-correlation-id: c647c1d9-d475-4c3e-9bbd-08deb0e4b24d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|22082099003|18002099003|56012099003|921020|38070700021|11063799003;
x-microsoft-antispam-message-info: ozspU6q6HVTmKfNjr/VDJHj15XIS033UymyW3ufMumyjFocCwnIumEgaMggq0kO4GnIk7ZPo/fCoDTDnthdeP9LP8lsYOz294hYohdmRNW3CRqkOXz/bLxHOkZYd/Pi6H1rO7Cm5KtgR0TggTjYn9cfzJsjW133bPwtRfkPGtwDLm3Ys7fDkeEyQO6OpVtY1k5UDBgOAUrmYoBRCOPWknO4TIjJnelzX3kO2UvK0VjiD+uD8EMoSdE51qbhOVFOlhzJMk8+575LMLb7DMh0mTVQNnBqmUIG7r0RCcZteM/p6eyCW2k9GzUwBq46RbzyMjfxciqkFI0IGiAwOWLFSqReyLh/eaq3uir8uuNMMTxv3VRyFqIVtfhZeug+ZCPqdWHIKKpe/Mn0O+OKTh9MC0AUO+2G5h9JtssKTSQkcZZZCxdryg/8UZoNrgNiilQ3q6qhXZvsBbSXV6VJpJghIMLJYuoqcXNdBFGmtyjmJok0sqFzGWgPo0+Ld3N4Ku1nAUwCaP1Zvmb+iYxSSemsFOUxMODZ0RuuIgLXkcwOQxTVG2w4X6Nf0JttCWHA5DC1TUp6P0lfZEJIBwRLP4ysZt5AyRr6Y5qwaUmstFweKXRXw9QI7cOMxVjZ3AGn4ZsYrY9ZULdche2OlcNeBeyhjgk2Phdtgg6aUVLGzF2JRVWXJZybcDK6Br2OKc50zUw780Db3tGRo6q2Iq+NFrK+pNTBD5vOAAWikDaTu/TVmI5QAty0h44O/dQ9bKFygPJKtsxj2zZiBDYSLZe5msZXeDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7730.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(22082099003)(18002099003)(56012099003)(921020)(38070700021)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGJET0RsR3Z5a1B1eXU5RVJJazBlQUhvTlZyVWprdERHaU54dmovS004ekVz?=
 =?utf-8?B?enU4ZUF2ejE1RUlPZTNzQjJ1SmR0ZlNKMHRvSUZQRGozUlJ0bHZHL1N1MVNr?=
 =?utf-8?B?WEhLWFZlZ2FGWjEvVkl2ZWlreGNYdml3bTJDU3A0cWtxSFB5QWhZcU5tRjhz?=
 =?utf-8?B?bHRGSSs4Y1gyRDdCTXBla0YvK1JnUWZpbDZWWk9BTHBqbzZ5WStncHE3VVZw?=
 =?utf-8?B?RXExS2F3a2FWaXlLSGFWb3UzcmRuTXFrYW1jZkx2MUxyM21CQk8vdndJTElu?=
 =?utf-8?B?VWhlUEdkcDJwR3IzTUc5bmJMMlZiSDZBWW5BNXV0aTcwR1dFYkhlUVprWlV5?=
 =?utf-8?B?VnJxdXhLOFV6Z1RxTktBUXRMSEU1bTNyR2p3TThDUVpEWnc1cVh3L25VVDlu?=
 =?utf-8?B?bUltMWRxclhqRHhQZ3VoRmtkaXIrSFlveXRWVHYwQ2tHOFFtdkgvbVZjM3NT?=
 =?utf-8?B?RGJ4V1FjNmFmSlRNUHhuUU1NWDFYWUtGNW5jTXh1VWlCekJVWnZlZGVFL25j?=
 =?utf-8?B?UmpkQWJCeXB0T0RIMUVSbFFIYjdYNFFhSnpkWGxINGQ1SFhRK2FDRzZ2cjF0?=
 =?utf-8?B?YnhreE9MTTliK1A4cEk2eEtGMlZRTTN1MTNLMDVMc0JiZkdreHpMdThNeDlw?=
 =?utf-8?B?d1dEdTFLaWxvNkt0MXpkd2o0OGtMY0NJZEVFSWRqYkN2ZklpR1g5ZVo4YWpV?=
 =?utf-8?B?MG81b3B4S2V5TjNJOElXTGtsSVZUVDdiTmNUVzl4c1pUNDBGZE5NeGF4OTgz?=
 =?utf-8?B?dkdVYnlTT2xoMzc5WE1lcTI4TUFpMEdRRGJzcFJZL0xDM1VTMFBqOWhNNStO?=
 =?utf-8?B?YlZSNG5NSVEzY3FYZ1F0cXVRWlJVT3lpeThKY2k2T0F4M3R4WjVKWkFKR3oy?=
 =?utf-8?B?M29uV3IzUWQrbFhNTGxNdTR5NDQ5UnNsMG5IaDlFbWlsVU5FKzJjQlhPRjQv?=
 =?utf-8?B?Tk8rSExsbDV4UUJUcmNPSTZqVjlwNWNWT3RoR3J2SUJhWVBHT01YSXFuZ25J?=
 =?utf-8?B?NzFsQlVsNitSbGRkV1NYU0FEcGxQTTNYR01IdnExU2k4ejQ3RXpVbjN0Y3RJ?=
 =?utf-8?B?UUUxQjhPbVdkNHpCbkRVdElaYVFrOGlIMS9kRU9QaElpWWQyRDA3NDNLZzlN?=
 =?utf-8?B?R1ZOVFV1dnB3eUtZbkRkVCs0dCtYa0FCZmNLSDVZRjVXVVJmaUdxWm1FbGhR?=
 =?utf-8?B?VkxGY1BJM1RCVzNFdHFwVjA3d0t5TzVtUVFkNW00VktJa05rblBxYWZxZUQw?=
 =?utf-8?B?NXVMWHFmS0NGUHo3bVowWUo2WVhOOXB1aDNKNGRiZ2RWdmNmc0pKUk1rNU1H?=
 =?utf-8?B?N29TZnpoZWFGL0NUVWRGRkpheTNhYkpUdWJrYmxmbHFQSVg5eUQyY2lLNGlE?=
 =?utf-8?B?WlpLVjdGWTNBdjR5YlAxQjViWUd5OE80dkNLZzh3Zk1RbDZ4MC9MR01vTWRu?=
 =?utf-8?B?V1hBYTBKVFBPWG9xVEJNT1E1UXkyQXlhQ1VvcncxaHYwcStFZ3YzSWViRjlL?=
 =?utf-8?B?NjJsOGIyZVVhMFQrdVB2bE5YazVJbFo3SGpoTkp3dS9ZK0Ezc1ZzQitDOExX?=
 =?utf-8?B?bEpwZDlTeXhLR2QrRHBsZTljUUtDNVN1UUw3TDFPWHhmYjZ5bjZZMzEwQUxn?=
 =?utf-8?B?TFg2SE9VRE9HeDdtTlZiV3I2K043M2FYS3JNM20yd1JITkhNUW1OSEtKeWJt?=
 =?utf-8?B?cmYyKzRHb09WS2FpZDdpNEROYWI1RE50NGNFSlhEV3d2V3BHREhtMEt3MzEz?=
 =?utf-8?B?bCtYS1FwQmxBLzVYQ0pTN0U1SEZyVThzdmNONVIvTXRqSDVaUms5ZjFKamxz?=
 =?utf-8?B?WSsyQk5lUThNdFU0a0NjOWFCUkJWakRybUhjTjVjR2dUYWtSeUVDeGtxaG1F?=
 =?utf-8?B?WSt4dnRndkJVa0Q3dWJSOTIvZGNWbmRSMWk1WVJZYTBmSVRoMXFnekpRVDdT?=
 =?utf-8?B?RlRMN091MEloVzFkNVZ6TDdoMUZ4ZXlpcXlTWi9yNGJkaXoxekFqTk0ybGhx?=
 =?utf-8?B?SUZnQURqWU51RHVqV1RNWktMQ1I1STg5SnlwOUxVNlhsd0N1YjRjTnowbTlR?=
 =?utf-8?B?MGVTemUxdGJOa2ltZmkzTmRHT2tnK01mNUpBcmVHU3loNStFN2kzdWJUbEtk?=
 =?utf-8?B?ZjBQS0VpaEpmNWVzRUtxVGl0V1hzSnVodHUwcjBWWlBMeElGZ1BGekFNWkZK?=
 =?utf-8?B?QmZDMW9oZm5IMXFYUmczUkJxVzFDd3duVXU4ZC9sRkJET1NxdFRseXA1Vk13?=
 =?utf-8?B?dkRkR0hZaGpiNzhiekVqYXhvelhGYkkybnUrM3NFY25yNU9RVGNvSHprUnd3?=
 =?utf-8?B?ODdFS3RlT2ozYWxZamJnNTJiNWJUTkhSR2Rpc0E0Y1kwNXhxZTFnL0hwcGVp?=
 =?utf-8?Q?Vzq4borR1rvr3IiRqoE7evgc/xPQhc7ti0apjyu+XZuSB?=
x-ms-exchange-antispam-messagedata-1: zza/wzcdMLAqNQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B9D0237EA52F640B18D57D8B3CD4876@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JFsuUjXs5g9EaDcgsUVliRwTu6b4fVyFDn0XSIjB01nVsMJaS3ufOeOfb0fgpYxpxbzqZJMCfcp7E9oUYO35Ul6ywujB60+o97Pn/5LrmW+vcagyIoT38K2ZWcBU93aLyeNV+pNUWtPBcmc9i3/vocsO3XkDNbIKV2VJ3MAw+wmH1x26/FXAJn4dZKZEX+faKczz9LOZqnlG55tkYAEsB5cWthXUnu2dkExb8bb9NRHCQAMlZpoPZwHAfcCXplAsecberhX935qftNCfzqfqLnXEYp/5xbpQD70XR7337925RlNxmUKJ42q/FP/F5/jvnemL8JtZjq2TKy4y438O+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7730.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c647c1d9-d475-4c3e-9bbd-08deb0e4b24d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 11:42:22.3156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obpBb70778SFixfE9rGcm7pKOCmPEWPYpzTJJ1CAKOumiL3BCvQxGmVvXn0+3tpqYDKjqF7VciCQ+OXJYANh4yLOPL0IwM9/85qZ9qZXzFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

SGksDQoNCk9uIFdlZCwgMjAyNi0wNS0xMyBhdCAxNTo0NiArMDUzMCwgdGlsYWsudGlydW1hbGVz
aC50YW5ndWR1QGludGVsLmNvbQ0Kd3JvdGU6DQo+IEZyb206IFRhbmd1ZHUgVGlsYWsgVGlydW1h
bGVzaCA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gDQo+IExSIG1vZGUg
Y3VycmVudGx5IHJlbGllcyBvbiBjb250ZXh0LXN3aXRjaCBiYXNlZCBUTEIgY29oZXJlbmNlIHdo
aWxlDQo+IHBlci1iYXRjaCBpbnZhbGlkYXRpb24gaXMgZGlzYWJsZWQuIFRoaXMgaXMgdW5zYWZl
IHdoZW4gaGFyZHdhcmUNCj4gYXV0by10YWlsIHVwZGF0ZSBhZHZhbmNlcyBleGVjdXRpb24sIGFs
bG93aW5nIG5ld2x5IGZldGNoZWQgd29yaw0KPiB0byBydW4gYmVmb3JlIHRoZSBleHBlY3RlZCBp
bXBsaWNpdCBjb2hlcmVuY2UgcG9pbnQgYXQgY29udGV4dA0KPiAtc3dpdGNoIG9yIHJlLWVuYWJs
ZS4NCg0KU28gdGhpcyBpcyBlc3NlbnRpYWxseSBzYXlpbmcgbmV3IGhhcmR3YXJlIGRvZXNuJ3Qg
aW52YWxpZGF0ZSBUTEIgd2hlbg0KZXhlY19xdWV1ZXMgYXJlIHJlLWVuYWJsZWQgaW4gdGhlIHJl
YmluZCB3b3JrZXI/IElmIHNvLCBzaG91bGQgd2UgaGF2ZQ0KYSBkZXZpY2UgZmxhZyBmb3IgdGhp
cyB0byBrZWVwIHRoZSBleGlzdGluZyBiZWhhdmlvdXIgZm9yIGN1cnJlbnQgSFc/DQoNCj4gDQo+
IDEuT24gdGhlIExSIHBhdGgsIGFkZCBhIGRlcGVuZGVuY3kgb24gcS0+bHIucGZlbmNlIHNvIG5l
d2x5DQo+IHN1Ym1pdHRlZCBleGVjIGpvYnMgd2FpdCBmb3Igb3V0c3RhbmRpbmcgcHJlZW1wdC9y
ZWJpbmQgd29yaw0KPiB0byBmdWxseSBjb21wbGV0ZS4gVGhpcyBhdm9pZHMgb3V0LW9mLW9yZGVy
IGV4ZWN1dGlvbiB3aGVyZQ0KPiBhIG5ldyBiYXRjaCBjb3VsZCBydW4gd2l0aCBzdGFsZSBUTEIv
UFRFIHN0YXRlLg0KDQpQbGVhc2Ugc2VlIGJlbG93Lg0KDQo+IA0KPiAyLkZvciBMUiByZWJpbmRz
IGluIG5vbi1mYXVsdCBtb2RlLCBmb3JjZSBleHBsaWNpdCBpbnZhbGlkYXRpb24NCj4gaW5zdGVh
ZCBvZiByZWx5aW5nIG9uIGltcGxpY2l0IGNvbnRleHQgcmUtZW5hYmxlIGJlaGF2aW9yLg0KPiBU
aGlzIGF2b2lkcyBzdGFsZSBUTEIgZW50cmllcyBzdXJ2aXZpbmcgYWNyb3NzIHJlYmluZC4NCj4g
DQo+IDMuSW5jbHVkZSBMUiBtb2RlIGluIHRoZSBpbml0aWFsIHVzZXJwdHIgaW52YWxpZGF0aW9u
IGNvbmRpdGlvbiBzbw0KPiBMUiBxdWV1ZXMgYWx3YXlzIHBlcmZvcm0gdGhlIHJlcXVpcmVkIFRM
QiBpbnZhbGlkYXRpb24uIFRoaXMgYXZvaWRzDQo+IGNhc2VzIHdoZXJlIExSIGV4ZWN1dGlvbiBj
b250aW51ZXMgd2l0aCBzdGFsZSB1c2VycHRyIHRyYW5zbGF0aW9ucw0KPiBhZnRlciBhIG1hcHBp
bmcgY2hhbmdlLg0KPiANCj4gQXNzaXN0ZWQtYnk6IEdpdEh1YiBDb3BpbG90OmNsYXVkZS1zb25u
ZXQtNC42DQo+IFNpZ25lZC1vZmYtYnk6IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVzaA0KPiA8dGls
YWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWMuY8KgwqDCoMKgwqAgfCAxMSArKysrKysrKysrKw0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wdC5jwqDCoMKgwqDCoMKgwqAgfCAxOCArKysrKysrKysrKystLS0tLS0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmMgfMKgIDYgKysrKysrDQo+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5oIHzCoCAyICsrDQo+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3VzZXJwdHIuY8KgwqAgfMKgIDIgKy0NCj4gwqA1IGZpbGVzIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVj
LmMNCj4gaW5kZXggZTA1ZGFiZmNkNDNjLi4yYWJmODUxZWY3YTEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2V4ZWMuYw0KPiBAQCAtMzAxLDYgKzMwMSwxNyBAQCBpbnQgeGVfZXhlY19pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCB2b2lkDQo+ICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+
IMKgCQkJZ290byBlcnJfcHV0X2pvYjsNCj4gwqAJfQ0KPiDCoA0KPiArCS8qIExSIGpvYnMgd2Fp
dCBmb3IgcHJlZW1wdC9yZWJpbmQgdG8gY29tcGxldGUsIGJ1dCBvbmx5DQo+IHdoZW4gYQ0KPiAr
CSAqIHByZWVtcHRpb24vcmViaW5kIGlzIGFjdHVhbGx5IGluLWZsaWdodC4NCj4gKwkgKi8NCj4g
KwlpZiAoeGVfdm1faW5fbHJfbW9kZSh2bSkgJiYgcS0+bHIucGZlbmNlICYmDQo+ICsJwqDCoMKg
IHRlc3RfYml0KERNQV9GRU5DRV9GTEFHX0VOQUJMRV9TSUdOQUxfQklULCAmcS0NCj4gPmxyLnBm
ZW5jZS0+ZmxhZ3MpKSB7DQo+ICsJCWVyciA9IHhlX3NjaGVkX2pvYl9hZGRfZmVuY2VfZGVwKGpv
YiwNCj4gKwkJCQkJCSBkbWFfZmVuY2VfZ2V0KHEtDQo+ID5sci5wZmVuY2UpKTsNCj4gKwkJaWYg
KGVycikNCj4gKwkJCWdvdG8gZXJyX3B1dF9qb2I7DQo+ICsJfQ0KPiArDQoNCkV4ZWMgaW4gTFIg
bW9kZSBiZWhhdmUgbW9zdGx5IGxpa2UgVUxMUyBjaGFpbmluZy4gV2Ugc2hvdWxkIG5vdCBhZGQN
CmZlbmNlIGRlcGVuZGVuY2llcyBoZXJlLCBzaW5jZSBMUiBqb2JzIG1vc3RseSBieXBhc3MgdGhl
IHNjaGVkdWxlci4NCg0KVGhlIHdhaXQgaW4gcHJlZW1wdF9yZWJpbmRfd29ya19mdW5jKCkgc2hv
dWxkIGJlIHN1ZmZpY2VudCBzaW5jZSB0aGF0DQplbnN1cmVzIHJlYmluZHMgYXJlIGNvbXBsZXRl
ZCBiZWZvcmUgZXhlY19xdWV1ZXMgYXJlIHJlc3VtZWQ/IFByb2JhYmx5DQpuZWVkIHRvIHZlcmlm
eSwgdGhvdWdoLCB0aGF0IGl0IGFsc28gd2FpdHMgZm9yIHRoZSBUTEIgZmx1c2ggZmVuY2VzLg0K
DQoNCj4gwqAJZm9yIChpID0gMDsgaSA8IG51bV9zeW5jcyAmJiAhZXJyOyBpKyspDQo+IMKgCQll
cnIgPSB4ZV9zeW5jX2VudHJ5X2FkZF9kZXBzKCZzeW5jc1tpXSwgam9iKTsNCj4gwqAJaWYgKGVy
cikNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3B0LmMNCj4gaW5kZXggMjY2OWZmNWVlNzQ3Li4wMjgxZGM5Y2EwN2YgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wdC5jDQo+IEBAIC0yMDA2LDkgKzIwMDYsMTAgQEAgc3RhdGljIGludCBi
aW5kX29wX3ByZXBhcmUoc3RydWN0IHhlX3ZtICp2bSwNCj4gc3RydWN0IHhlX3RpbGUgKnRpbGUs
DQo+IMKgDQo+IMKgCQkvKg0KPiDCoAkJICogSWYgcmViaW5kLCB3ZSBoYXZlIHRvIGludmFsaWRh
dGUgVExCIG9uICFMUiB2bXMNCj4gdG8gaW52YWxpZGF0ZQ0KPiAtCQkgKiBjYWNoZWQgUFRFcyBw
b2ludCB0byBmcmVlZCBtZW1vcnkuIE9uIExSIHZtcyB0aGlzDQo+IGlzIGRvbmUNCj4gLQkJICog
YXV0b21hdGljYWxseSB3aGVuIHRoZSBjb250ZXh0IGlzIHJlLWVuYWJsZWQgYnkNCj4gdGhlIHJl
YmluZCB3b3JrZXIsDQo+IC0JCSAqIG9yIGluIGZhdWx0IG1vZGUgaXQgd2FzIGludmFsaWRhdGVk
IG9uIFBURQ0KPiB6YXBwaW5nLg0KPiArCQkgKiBjYWNoZWQgUFRFcyBwb2ludCB0byBmcmVlZCBt
ZW1vcnkuIE9uIExSIHZtcyBpbg0KPiBub24tZmF1bHQgbW9kZSwNCj4gKwkJICogaW1wbGljaXQg
Y29udGV4dCByZS1lbmFibGUgaXMgbm90IGEgcmVsaWFibGUNCj4gY29oZXJlbmNlIHBvaW50LA0K
PiArCQkgKiBzbyBmb3JjZSBleHBsaWNpdCBpbnZhbGlkYXRpb24gaGVyZS4gSW4gZmF1bHQNCj4g
bW9kZSB0aGUgVExCDQo+ICsJCSAqIHdhcyBhbHJlYWR5IGludmFsaWRhdGVkIGR1cmluZyBQVEUg
emFwcGluZy4NCj4gwqAJCSAqDQo+IMKgCQkgKiBJZiAhcmViaW5kLCBhbmQgc2NyYXRjaCBlbmFi
bGVkIFZNcywgdGhlcmUgaXMgYQ0KPiBjaGFuY2UgdGhlIHNjcmF0Y2gNCj4gwqAJCSAqIFBURSBp
cyBhbHJlYWR5IGNhY2hlZCBpbiB0aGUgVExCIHNvIGl0IG5lZWRzIHRvDQo+IGJlIGludmFsaWRh
dGVkLg0KPiBAQCAtMjAxOSw5ICsyMDIwLDE0IEBAIHN0YXRpYyBpbnQgYmluZF9vcF9wcmVwYXJl
KHN0cnVjdCB4ZV92bSAqdm0sDQo+IHN0cnVjdCB4ZV90aWxlICp0aWxlLA0KPiDCoAkJaWYgKCgh
cHRfb3AtPnJlYmluZCAmJiB4ZV92bV9oYXNfc2NyYXRjaCh2bSkgJiYNCj4gwqAJCcKgwqDCoMKg
IHhlX3ZtX2luX2xyX21vZGUodm0pKSkNCj4gwqAJCQlwdF91cGRhdGVfb3BzLT5uZWVkc19pbnZh
bGlkYXRpb24gPSB0cnVlOw0KPiAtCQllbHNlIGlmIChwdF9vcC0+cmViaW5kICYmICF4ZV92bV9p
bl9scl9tb2RlKHZtKSkNCj4gLQkJCS8qIFdlIGJ1bXAgYWxzbyBpZiBiYXRjaF9pbnZhbGlkYXRl
X3RsYiBpcw0KPiB0cnVlICovDQo+IC0JCQl2bS0+dGxiX2ZsdXNoX3NlcW5vKys7DQo+ICsJCWVs
c2UgaWYgKHB0X29wLT5yZWJpbmQpIHsNCj4gKwkJCWlmICh4ZV92bV9pbl9scl9tb2RlKHZtKSAm
Jg0KPiAheGVfdm1faW5fZmF1bHRfbW9kZSh2bSkpDQoNCnhlX3ZtX2luX3ByZWVtcHRfZmVuY2Vf
bW9kZSh2bSkgKyBIVyBjaGVjay4NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KDQo+ICsJCQkJLyog
Rm9yY2UgZXhwbGljaXQgaW52YWxpZGF0aW9uIGZvcg0KPiBMUiByZWJpbmRzICovDQo+ICsJCQkJ
cHRfdXBkYXRlX29wcy0+bmVlZHNfaW52YWxpZGF0aW9uID0NCj4gdHJ1ZTsNCj4gKwkJCWVsc2Ug
aWYgKCF4ZV92bV9pbl9scl9tb2RlKHZtKSkNCj4gKwkJCQkvKiBXZSBidW1wIGFsc28gaWYNCj4g
YmF0Y2hfaW52YWxpZGF0ZV90bGIgaXMgdHJ1ZSAqLw0KPiArCQkJCXZtLT50bGJfZmx1c2hfc2Vx
bm8rKzsNCj4gKwkJfQ0KPiDCoA0KPiDCoAkJdm1hLT50aWxlX3N0YWdlZCB8PSBCSVQodGlsZS0+
aWQpOw0KPiDCoAkJcHRfb3AtPnZtYSA9IHZtYTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9zY2hlZF9qb2IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zY2hlZF9q
b2IuYw0KPiBpbmRleCBhZTViMzhiMmE4ODQuLjJmNmM4NGM2NjJkNSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9zY2hlZF9qb2IuYw0KPiBAQCAtMzUzLDYgKzM1MywxMiBAQCB4ZV9zY2hlZF9qb2Jf
c25hcHNob3RfcHJpbnQoc3RydWN0DQo+IHhlX3NjaGVkX2pvYl9zbmFwc2hvdCAqc25hcHNob3Qs
DQo+IMKgCQlkcm1fcHJpbnRmKHAsICJiYXRjaF9hZGRyWyV1XTogMHglMDE2bGx4XG4iLCBpLA0K
PiBzbmFwc2hvdC0+YmF0Y2hfYWRkcltpXSk7DQo+IMKgfQ0KPiDCoA0KPiAraW50IHhlX3NjaGVk
X2pvYl9hZGRfZmVuY2VfZGVwKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYiwNCj4gKwkJCcKgwqDC
oMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkNCj4gK3sNCj4gKwlyZXR1cm4gZHJtX3Nj
aGVkX2pvYl9hZGRfZGVwZW5kZW5jeSgmam9iLT5kcm0sIGZlbmNlKTsNCj4gK30NCj4gKw0KPiDC
oGludCB4ZV9zY2hlZF9qb2JfYWRkX2RlcHMoc3RydWN0IHhlX3NjaGVkX2pvYiAqam9iLCBzdHJ1
Y3QgZG1hX3Jlc3YNCj4gKnJlc3YsDQo+IMKgCQkJwqAgZW51bSBkbWFfcmVzdl91c2FnZSB1c2Fn
ZSkNCj4gwqB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9i
LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmgNCj4gaW5kZXggMWMxY2I0
NDIxNmMzLi43NzFmYWIwMDUxNzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9zY2hlZF9qb2IuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmgN
Cj4gQEAgLTg5LDYgKzg5LDggQEAgc3RydWN0IHhlX3NjaGVkX2pvYl9zbmFwc2hvdA0KPiAqeGVf
c2NoZWRfam9iX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX3NjaGVkX2pvYg0KPiDCoHZvaWQg
eGVfc2NoZWRfam9iX3NuYXBzaG90X2ZyZWUoc3RydWN0IHhlX3NjaGVkX2pvYl9zbmFwc2hvdA0K
PiAqc25hcHNob3QpOw0KPiDCoHZvaWQgeGVfc2NoZWRfam9iX3NuYXBzaG90X3ByaW50KHN0cnVj
dCB4ZV9zY2hlZF9qb2Jfc25hcHNob3QNCj4gKnNuYXBzaG90LCBzdHJ1Y3QgZHJtX3ByaW50ZXIg
KnApOw0KPiDCoA0KPiAraW50IHhlX3NjaGVkX2pvYl9hZGRfZmVuY2VfZGVwKHN0cnVjdCB4ZV9z
Y2hlZF9qb2IgKmpvYiwNCj4gKwkJCcKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5j
ZSk7DQo+IMKgaW50IHhlX3NjaGVkX2pvYl9hZGRfZGVwcyhzdHJ1Y3QgeGVfc2NoZWRfam9iICpq
b2IsIHN0cnVjdCBkbWFfcmVzdg0KPiAqcmVzdiwNCj4gwqAJCQnCoCBlbnVtIGRtYV9yZXN2X3Vz
YWdlIHVzYWdlKTsNCj4gwqANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91
c2VycHRyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdXNlcnB0ci5jDQo+IGluZGV4IDY3
NjEwMDVjMGI5MC4uOWM2ZmQxMDA0YzdjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdXNlcnB0ci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91c2VycHRyLmMN
Cj4gQEAgLTEwMiw3ICsxMDIsNyBAQCB4ZV92bWFfdXNlcnB0cl9kb19pbnZhbChzdHJ1Y3QgeGVf
dm0gKnZtLCBzdHJ1Y3QNCj4geGVfdXNlcnB0cl92bWEgKnV2bWEsIGJvb2wgaXNfZA0KPiDCoAkJ
CQnCoMKgwqAgZmFsc2UsIE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCj4gwqAJWEVfV0FSTl9PTihl
cnIgPD0gMCk7DQo+IMKgDQo+IC0JaWYgKHhlX3ZtX2luX2ZhdWx0X21vZGUodm0pICYmIHVzZXJw
dHItPmluaXRpYWxfYmluZCkgew0KPiArCWlmICgoeGVfdm1faW5fbHJfbW9kZSh2bSkgfHwgeGVf
dm1faW5fZmF1bHRfbW9kZSh2bSkpICYmDQo+IHVzZXJwdHItPmluaXRpYWxfYmluZCkgew0KPiDC
oAkJaWYgKCF1c2VycHRyLT5maW5pc2hfaW51c2UpIHsNCj4gwqAJCQkvKg0KPiDCoAkJCSAqIERl
ZmVyIHRoZSBUTEIgd2FpdCB0byBhbiBleHRyYSBwYXNzIHNvDQo+IHRoZSBjYWxsZXINCg==
