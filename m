Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4F4CCD185
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED20110E129;
	Tue, 14 Oct 2025 03:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROd8BTGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB7810E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760411327; x=1791947327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7Hozv41FZfvtarUGTjg2IveS0VOrEC/bBAx5IO1CyZg=;
 b=ROd8BTGubd+Lm/AVkQWpkkxInKCKiEjdpiU4o1YdbUf7+lhG9MJyYqOR
 PWBGNpZubOslFwg5HLg5lslkKwND9kYPbnCjbMTjNNGC3NF4MRTJ/HI3K
 bvYZ2uyRbftCwEoax/c5az5gWo3NSDcBhOnTo2GSATkMzGLL15aBTpHLj
 1aZFjarXDQn6i8smEQidVJyqXhUaWipyM60OspkL6uFeyvG/8nSGxLLkx
 cCpqje6HpgiCK6fMnZe2z/4+WgE2TxMiQPZCe87/F71HcGRvOVmhYhRA7
 FQi/WkegiSWoHYkr39pmkU5McO4ptQMkwk+KmtXYsuKI+3NZRGUUdCXxu g==;
X-CSE-ConnectionGUID: 4X9LxipxQXqsTh4D/+DXtA==
X-CSE-MsgGUID: iDzJ8VLpRySw2JkyBQXsLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73907633"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73907633"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:08:46 -0700
X-CSE-ConnectionGUID: R2F1SglKTB26hjaAzmONyA==
X-CSE-MsgGUID: 9qJBmnuGRk6IEiuLX1QNYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181565415"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:08:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 20:08:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 20:08:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 20:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIXiLZ9oIBOH711vH1pDY9XBknvkd8zjE0KSt8Qu5lK6Rg+5AhMR3iK08KiKa243fWcrSPu3pNcl5biuoCYU40ywRrWsOyQQcy6F2+z+k2+jutHY6CY0w8fTchEUHt2aWOIij044FGk3iyrIV0GzqGpeDNRRA/X2oCzxfNufXOm+BehD8I5HYxAVqJt0lo4BK/rZojSSR/NlBn7ql/fbznnKjDze7vXvT7OyBiorr1zHInAzGM88mNeM4koHoNHCw0eWfJG8KLmIcpfcCJNw67AVyBn3PV3VXhf80dtAK8J+HQaTJ801C31ksiqiBnuA+J8w50MvXz6x0eGV5nIXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Hozv41FZfvtarUGTjg2IveS0VOrEC/bBAx5IO1CyZg=;
 b=SGfNmjO1zQTO6J0mxnt455HcAcBNht0NHagnBNA2VzA0qEykztCcOZQa1xaS2GTt3zr+Av/IPkgK8iZOj/696Ds/d1QA6taYe7t60HvCRZLAsrokp6DuQC6MUCLdkgEC8jIBW+pGaveg/8VJ3E06IsjuceQ4H6JvfbSDpRKQ+HiSy/NfoaonLSTlJfHz3WmF0IQv+RaH240R8fx3NBAEtws5TP6GQWpcNw242Pgs9yiD6LmtsIyUJDUUJJMW1SuGStWci0zAPLPYHmeOoLip8Okv8UXoTDcF/f4goUtVOqgWl+MPFd9ZQZZytmjpBMDJp42IAqzqfEvmX1DXN4cUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 03:08:42 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 03:08:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Simon.Richter@hogyros.de"
 <Simon.Richter@hogyros.de>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Thread-Topic: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
Thread-Index: AQHcO/PqZxiwTgJVQUOfXOHdy3NqXbTAT/UAgAAB3wCAAAITgIAAlbaAgAAOKoA=
Date: Tue, 14 Oct 2025 03:08:42 +0000
Message-ID: <7c4585ccd8b175c764917b0a9de511744bddd35f.camel@intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
 <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
 <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
 <acdd0cfc8e700710ee5b43c816cdf7de3f57b374.camel@intel.com>
 <7b89fed3-3b8f-4787-8ef4-17f24477d829@hogyros.de>
In-Reply-To: <7b89fed3-3b8f-4787-8ef4-17f24477d829@hogyros.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB5873:EE_
x-ms-office365-filtering-correlation-id: 7c800a2b-9c45-4f14-8007-08de0acefb01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N2cvOTBIZkVlMk8vUjd0bmZ6N0JoSlZJYkdPRk1udUlsMHBPc1JjZmtDclVC?=
 =?utf-8?B?L1ZEZVJBWlVoK2syTmtmZTYrdVVRaXRaRFR2cGRmeGkrYnZybGRiOUlXWndL?=
 =?utf-8?B?SUlmNVVJV3dyUkt0WEU2REE0TTRmNTJBQ3g3bHlFZ01BeEo0S1RFQy9NT0wx?=
 =?utf-8?B?OGhDa2NvcXZFNmlpcEMrT09NZzNQRllGKzM5VStSbFlwVThPaDRVOHFvRVBz?=
 =?utf-8?B?L3UyWXdzYlB1bmo3ZFRKWGdJK1Y1bHBkM2FoWkZrL2YyNEh5QVkyeDdKanJz?=
 =?utf-8?B?dWJDdFowRTRkUkZzdFdhWlg5NXdKOXB3d3l4VnNOSGphQTg5ODA5TzFvYkJG?=
 =?utf-8?B?L3lOR0czUjVQY3U4QmxQejNWVk03TFhTaElOdkpwdjZSMWZONVJUcGY2cU5l?=
 =?utf-8?B?NTN3T2ZmWmNydkZBNUZ4REY2Zkw4SGhzZHNoLzhxZlpaRVQxYlZCNE1namlu?=
 =?utf-8?B?Y211dkZOWTFIOUhTRWwzRUJjMVVTNHBKaUlHbzRhakNYUEFOQ21PN1lxUFdi?=
 =?utf-8?B?VEhpbWhhL2RDYTR3MitDZEFuYmJiQkdmT0toQXNhME9QY3N2TFFna2V4MnVt?=
 =?utf-8?B?ZU9TM1J1YjZZd0Z2RGp3VWh3V0U5cThrcTFybjZtbU9oVGNFbmYwMDRmRy8x?=
 =?utf-8?B?TDVnUVVEakxETWhVV0RmYTE3WGF3bEZ2MEFhb0l6dGtTTTdaYjRsWUpOOWRJ?=
 =?utf-8?B?VlNiT09YRERrUEt4bTRkbFhPTXEwZzZWNjRRdFM1MzJqM1NCSTF3RlRuR2hC?=
 =?utf-8?B?N0szV2lxSkpseXVtZ0VYUXNqVW9wVDh3WXBKZkxaWEpKY2N6RVRMdEk2VkpF?=
 =?utf-8?B?cG1YZkhhN2NkOFNKQ1JKN01Dc08ycmFEWHk0cmx0VWk3bEFxUjkzQlQ0RVBw?=
 =?utf-8?B?NmZFd0ZCVGpxd2NGbzJXL3ZJa3RCUjhid2ROUUVqNkMvUjJXZmtBNFNQWTd3?=
 =?utf-8?B?TGZrVGxqakpTOG1TYkk5ZVRSeWVkbnVRWnlxZjRlS2xlZXFmRDZyUWpVYlJx?=
 =?utf-8?B?YjY5WnFHTFAzUkVGL2ZTYnJXRmdhQmhXYmowMFc2VitYMW9HY1hTQmpoS1hG?=
 =?utf-8?B?eFhKbFZzYWFqaGJKQjB2RUk0Mkw1UkMzMDhLUUtHYTVkZFl6TnFsWUtSUHo5?=
 =?utf-8?B?NFpmVlk4VTExM2dzTVpHSWtOR3VmL2NaN21IRUZFQnpjc3pmYjQ2Tzk1bjlN?=
 =?utf-8?B?emI0UkZkTU4yV2JheXExcmhDNXlXZEJQazJvWnVRa01qajlmbHpUK0xrMDNs?=
 =?utf-8?B?SG1idG1ENFJnbWhJN1dGVyt6b3BnQ0FXTnZWcHErMjFXT01zOWhvZTB6NEVj?=
 =?utf-8?B?K1RJZGdoVmJsM3lGZTlqenZ4UzRKMjhoRWFrUS9nK2kzamNPVWx3Smc3RmZK?=
 =?utf-8?B?Nk0wUXh6NHQ2dEFnZjVmSmZndVZJcXd2WTlvQVlza0NnV08rVldFVXd0QTZQ?=
 =?utf-8?B?Vk51dVRnenBFaTNmdjhpM2JaNGViVTgwTTZtTDNXOExubEtWQmhkZEg1enVW?=
 =?utf-8?B?ZmpjK0JOTWxaZWk2VU9UN2hQSHdZVURPVlMyR3dPTmtvbCtyOCsrQ2Y1REZv?=
 =?utf-8?B?S3RSbDIrRFpGZUdyZHFnT2Z5ME44RnpIa1F0Y1B3WG9KUUJLVUxydjQ0Q3Vn?=
 =?utf-8?B?emE3ZU05YjVteDUwZlNmYlducmF0amgwNWtNN1Fmc1VtNXMxUkFqMTVlWGNE?=
 =?utf-8?B?WE0rd0UwVWFNb29lRXdlazREU2ZvNnNnMmhwWmpTV2VIM1YyUk83Y21yY3Ew?=
 =?utf-8?B?bTRHbDNZakhuaWd2R0lTdXdBSk5iQ1Bhb3R2NzI5eHpvWXJBSmZOM2ZqaTEr?=
 =?utf-8?B?RnZjT2xCdE03Q3dvaTV1SlVyOFFzcGJSZ0hkT2piSmFtMG82bHByUW9DUWlD?=
 =?utf-8?B?NUhmOElXWUsrZ2NDalB2RFZYVEFKQ2J3OXBiZ2pkRU9qKzRJTE05aWdHOE5M?=
 =?utf-8?B?ckJTNFdrMXhTOU1tTjAySStxZ0tEeDViSFE4K09aYVpCTDRDSlZDZ1prNzdQ?=
 =?utf-8?B?S0l2TG42ZDZtUmhvc0xXU09ya2tleDdBZHgvN0NGeGhudUJ5MnJyWGlHU2c4?=
 =?utf-8?Q?4Fc9PX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UThoRzJNLy9lTWZLOW5xVW1saE5qUFBJR1hUSlVMOHB6TmwySnlhejEzaDd3?=
 =?utf-8?B?TFVnNllGUkJJQVlxSUZ1clU5amliYmZMbHRjR0NHWGIwUVZiSWNJUUxIdUR6?=
 =?utf-8?B?b1JDV1ZuN3JMN1l1MWp0ZVVNTGUyQ1cwdVdlQUdoQy9tNWc2UEwxdlJ4MWlH?=
 =?utf-8?B?TUNXNVM5Q1lQWitxTWFTaE9qbjNTK1pleThNOGpoWDV3Rk1HMlRhZ1l6aXJr?=
 =?utf-8?B?LzBaM0tJQXg2VVpMR01Zc0RvMTVDLzl1N0ZhSFcySEpjUUdwZUZ4ZU15Mmla?=
 =?utf-8?B?KzIxVjU3LzJaeGtnVlNKUXZkeXIvbEdnOXRiQ0RkZjRnU3pDWmVMUWc4cDNi?=
 =?utf-8?B?eHRxTXRoQSszV0QzKzFaY0Y0WFdqekVjdCt5RFpwR1A4SlBNeUhsMDN3ejlm?=
 =?utf-8?B?dVRWdDdjcTNPQkxHM0dZT1VpU1JnakdNK3VQYlYzT2RVMnRQRmV3WXVtR055?=
 =?utf-8?B?VWhIQWJVSnRHOUlZb2tXb3M3TWNvTjk0ek9Yc1ovdUxRSDdaQWc4RGJDelhR?=
 =?utf-8?B?UFZBT3IrVG5VOFpDdDFHaUNYSFlFTkNDb04xUHJJVVc0bm92UU1NTHNFeHhK?=
 =?utf-8?B?MjRRUnlqR0pkdkV0TzRIUkRaaGsyZG96TmRaUVVYTk53cnE5OHNwUTFxdVdm?=
 =?utf-8?B?bEF6N0xCSWd6SkMyOVdhTnRmSEhwTlVYMGQ0MkdsMzdMUFFmS2hlZXhxdjQ3?=
 =?utf-8?B?Z1JSa044bnJiVURWR1p2N2VDMFRYNVhOTmthWS9VMkYvb3hZYWpQKzFVQ0hZ?=
 =?utf-8?B?Tzk4RXVRdEZwSTgxME4rdGRQOCszYWNzK3BZakxQUFZwRThKdnp0ODV5bk5S?=
 =?utf-8?B?U3pOOVlmV2JseUhZUWIraGRiblRXazloQXhRMEQvbDllbWJKQ1NKNU5NRWxw?=
 =?utf-8?B?MXNaeFVSbWpGUzduNDFKZXdLNlJvR0lCTkZoVEFDalRqbHpDTzBBV3dWaUwv?=
 =?utf-8?B?N1VGeUZ4ZkpCR2Zla2FxWkl3Qm42b21RMjU0QzhROXltY0pLUFBkU1RvQWFk?=
 =?utf-8?B?SW1OWWVvektNaFNMTmxWRmhKSUg0YnFXbXdtUEVISzA2QlJudWErZC91SHJx?=
 =?utf-8?B?SlE2NW9LdWsxT2F5MUpOMkU2aGEzV3ZFT01vRUl0Y2hRUFlkSWMrMVdaUEhh?=
 =?utf-8?B?bWl1MDgyQTIrSWlZYjh3WFlHOGFJZUd0QS9rNmlnU1VDS21xS3VGRGcySmsz?=
 =?utf-8?B?azUwT29hdTBCbWJaUG82RFlBTGFRdkgrY3lweTFCVEQyVVl5UkJ3TndBUUdn?=
 =?utf-8?B?MXJ6cnU4VjhLSy96YjNWZExZczY3cUgraG50STJTa3lxYm9ON25nZzUyZThS?=
 =?utf-8?B?dTMwODJaUVl2YjAvNVlCQjE2SE12RzhDdTRHOG04NW5HN1MrN0JVMXc5MFdx?=
 =?utf-8?B?eXBsRTFmNGp6Z2hLMUQ2YmRkWDh1bU5wdGFjNDNBOXBaY2JXeWY2eS9qZEk5?=
 =?utf-8?B?NUdtV2x5SXB1OXpHK3RUOHhhQ0R5bWI1QTRDWE5ycEFCZ2N1S1NtcU9OSGF2?=
 =?utf-8?B?QThvU1NKeGRCR1E4RGlZa09GS1paMkJERmdNYkJHUlQ5ZVVzM0NHaWVrV1l3?=
 =?utf-8?B?SXBBUGtjRXh5dVNUa0JjWEhaL2VFVDZycHd1VEJhZElXWG1vd3FoYkcvOFR1?=
 =?utf-8?B?bjUwVlFQV1dFaFpqUSswYy9mOElWL2RqVkJMQTZ3cDBNdmdKL0IzV1lyMldz?=
 =?utf-8?B?bnBmOFJxM0w5QmU5OUEvekhnenRrckE4SFlqVHdQZ1NDZDJxMnVWZU5GVlIz?=
 =?utf-8?B?VzRMbmJMcmYrTDJlWG9PTFUwdGlZQzcxN3ZtbTdEUEI0YURQTHJoNkpkSlFP?=
 =?utf-8?B?R0xXVWtlSGJ0MHFGMWVLeTFoZ3hOb01ucmc3OTMyNlFOMjVCajNuRGdyN3FB?=
 =?utf-8?B?VEdqN2hWRXhLbExtbHFkS1VqR0piTHViT3FEZjBTNzQvMHA3ZXlnZm9JSE5a?=
 =?utf-8?B?QzViMXJGbG1pN0VpcW9FdjJDVTNnM29FM3NNWGFTbnNDdTZzNy9KWnUvVGpp?=
 =?utf-8?B?dGNJNzFZMmNldDJCcERUNnBlWXBwQU5RV0ltU1YreTluKzkzMWxRYkY2MVJT?=
 =?utf-8?B?eTJaTytPaEUzNU5FWjUrbkFlSVo5eE45TWtCdll2TW5XVzBsUjhkRTRmdWg4?=
 =?utf-8?B?NmZ0RkxBYzZWYVVOTWZmWTJvMWd1T2xJaEp3UGFRNTN0Qm05NjN5aHNvZzFr?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E66945856FC5354581EF48BA42B78E19@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c800a2b-9c45-4f14-8007-08de0acefb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 03:08:42.3792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MUcI6ceBYq+ubC1lgHIh13IuRzOioF85xUWD7IcuGgGpvW+Q9HS2yEUHcsGMztbBk+W7HkYcRpIYqY2HrQ+lBkOFuVaP3FFIER6kVsjlGCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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

T24gVHVlLCAyMDI1LTEwLTE0IGF0IDExOjE3ICswOTAwLCBTaW1vbiBSaWNodGVyIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIDEwLzE0LzI1IDI6MjIgQU0sIFN1bW1lcnMsIFN0dWFydCB3cm90ZToN
Cj4gDQo+ID4gU28gYWNjb3JkaW5nIHRvDQo+ID4gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvYWRt
aW4tZ3VpZGUvbW0vaHVnZXRsYnBhZ2UuaHRtbA0KPiA+IHdlIGNhbiBwb3RlbnRpYWxseSBnZXQg
NE0tMjU2TSBwYWdlcyBvbiBzb21lIGFyY2hpdGVjdHVyZXMuDQo+IA0KPiBUaGVzZSBleGlzdCBi
dXQgd2lsbCBub3QgYmUgdGhlIGZpbmVzdCBncmFudWxhcml0eSBvbiB0aG9zZSANCj4gYXJjaGl0
ZWN0dXJlcywgc28gdGhlc2Ugc2hvdWxkIG5ldmVyIGFwcGVhciBhcyBQQUdFX1NJWkUuDQo+IA0K
PiBUaGUga2VybmVsIGlzIHVuYWJsZSB0byBsb2FkIGV4ZWN1dGFibGVzIHRoYXQgaGF2ZSBhIHNt
YWxsZXINCj4gYWxpZ25tZW50IA0KPiB0aGFuIFBBR0VfU0laRSBmb3IgdGhlaXIgbG9hZGFibGUg
c2VnbWVudHMsIHNvIHRoYXQgZ2l2ZXMgYSBuaWNlDQo+IHVwcGVyIA0KPiBib3VuZCBmb3Igd2hh
dCB3ZSBuZWVkIHRvIGV4cGVjdC4NCj4gDQo+IFRoZXJlIG1pZ2h0IGJlIHBsYWNlcyB0aGF0IG1h
a2UgdGhlIGFzc3VtcHRpb24gdGhhdCBpZiB0aGVyZSBpcyBhIA0KPiBodWdldGxiIHNpemUgdGhh
dCB0aGUgaG9zdCBzdXBwb3J0cywgaXQgd2lsbCBiZSAyTSwgYnV0IHRoZSB3b3JzdA0KPiB0aGlu
ZyANCj4gdGhhdCBjYW4gaGFwcGVuIHRoZXJlIGlzIGEgZmFsbGJhY2sgdG8gUEFHRV9TSVpFIGFu
ZCBzbGlnaHRseQ0KPiBkZWdyYWRlZCANCj4gcGVyZm9ybWFuY2UuDQoNClllYWggbWFrZXMgc2Vu
c2UgU2ltb24gYW5kIHRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cCENCg0KLVN0dWFydA0KDQo+IA0K
PiDCoMKgwqAgU2ltb24NCg0K
