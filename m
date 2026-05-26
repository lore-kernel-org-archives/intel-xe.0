Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ED8CD5BD2
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 10:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D135F10E48E;
	Tue, 26 May 2026 10:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpOqlw9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8966210E48E
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779791394; x=1811327394;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HIAGxztrcPc6pVxEIh5BqJS1aIaCNTFOhAkgK8kPdjE=;
 b=jpOqlw9/YpXHLdJQpzT/F1k8e1B2rNl/WZj1l+YOxhR6iuymNVXzxeEO
 iHyPgSDwqxAYoXzL991cjze+W+wkGa3BNNHqOAAIeeLwuHzD68G+2cEDU
 hOLu3cSW78NwmwtWtyzPnYUu6kemUVlPTIpYM7bvJdeCqPKYKT0drCLjK
 51tCJCYUkXBiB0ymyagQ0ZnKdHSvf4CYYQ3WHyx+3plIERJ19fbtEK59/
 fj09NJGCNhr+DyetwscwvCuHxNKsAzgjeZGbbJj0SzkMtOqm5+GYPTHSj
 +4qjesZV+NmRMhQG0sLzJSZFvuyI7L4rJV5vs8e/kEMcF+XLrld8B0eQy g==;
X-CSE-ConnectionGUID: k8FfCelwQPKROlyO+l+BFw==
X-CSE-MsgGUID: P9MyehCbQMmDnAxWxZ0FQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91989396"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91989396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:29:53 -0700
X-CSE-ConnectionGUID: 6jm86ObBTNuHostq1DO0WQ==
X-CSE-MsgGUID: jrRC4DK+RAiWZ1uL2fLlvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="237704920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 03:29:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:29:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 03:29:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 03:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izXQYRqQfNY/euoEfaDuhL4bNAjNrigLg6jxcy0Oqqo07YyXBs+hFt/2fHDmD+TR1a3HbY7pg6cK6K4qyxwkBwVTJ5MST7y21NnrHnglKaJVdk2/CjVRrwDqVBcWhyebVNx5jxlD0JH1icNaQ8/DD7TUgIe5StcNKB22NsKZFF+FaNTL2TdvjfEmD1U+gMIRAX28d3OjMVxlGD/cr7Le1ns1bfwfSyV0xI1wbsQJJRTGO0K1S+DInUdo3YvFbEgGg/oqrabcNn5ueC8UTkHphmbDPPIrCN5W5N8KQyQFY8kC+z5q532BJnNnnAZpPrFi0EbDAjxcDsNJ1pGRw4hdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIAGxztrcPc6pVxEIh5BqJS1aIaCNTFOhAkgK8kPdjE=;
 b=cRQfS5s8zy0Ci0HOdZtH9I2ffCkLitdWJNtxTbsvIDRpYCjOD514YwiN6/swEX0ER5KRNqIxP6XCJbvwp2zOoLuF3uGB28Xaedx1lLNaDK/LZoQSSsDFpr/F0D6YKItbsKTGa6k9QPyLNqYlLCIEw/ajQLa2pAzYIWcaPtZc6m7VXDzXIz583SwW0+2nvjF9p7r3ZVJ6+U5YPzE3WBICTA5gFQf0AnsxXj3DgkE6y0HyfaClfppqbb+++ZiWFPwldVPm4ecMaYLniMM8nTtEbS7mHJtFT6n1gNcY8PoZgeMFbsPfj98VzXxs+7jpwIKOTKNam5obEHVuc8BZl3SZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.20; Tue, 26 May 2026 10:29:44 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 10:29:37 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>, "Nguyen,
 Brian3" <brian3.nguyen@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Wang, X" <x.wang@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: explcit TLB flush for context based tlb
 invalidation
Thread-Topic: [PATCH 3/5] drm/xe: explcit TLB flush for context based tlb
 invalidation
Thread-Index: AQHc7OmC201RgDaWPk6+tA/IjiuR3LYgG0YA
Date: Tue, 26 May 2026 10:29:37 +0000
Message-ID: <6e2de381a46fc4c6c5a0038f8e848e8528bb938b.camel@intel.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
 <20260526082700.1383831-4-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260526082700.1383831-4-tilak.tirumalesh.tangudu@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM4PR11MB6020:EE_
x-ms-office365-filtering-correlation-id: b804170b-7585-4631-f585-08debb11b02c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|921020|38070700021|11063799006|6133799003|4143699003|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: mfezofbWKhpq/DSxH+6hFiOouOyUq3lzLfhUGHp10QgV5RKWE55rQv1pGU70lto/HfmEWAfmFnbPix50YSivNUmjRPHcYUCs8sJyxvYc8vpeM5rUNtI+FMk36v+rOV0d7SOqJBAaHGugAvw7ukDhp+UYy3mGzAASwykkCwWwNAIQ1Ly0FMo7jDolN6lo6UTxL3fXdscDf9DEO7TLVM88gDilSIa88EYj+m4Jx21zF6pDLYWHvIfH5QUp+OVp9RGxkrPByMOE9IacIOPJNiKZMGHvjbGwmnzRdC1fGHZqOnje1AK9JvkJXz+KF2eukop+s/Y/gMjLOmnpGO3BDY17BbYJBv+hSwRJB7GkxaeeQ9GKhS8ufLU3r+POp7GlUpJOT8NSH8UyZvaEJWOPGzJ3Cd5UVhiRajpTuahbUb7kg24TEzhZDbOx9JXq9Ny3W72XhDdwmUT2DJqmKq7ggZWw4+nONLCf7Pdr0Lw6QXKhisKZ2eqazCdAfECAegZdSZTDWUiNoA6HNIAY3aSSDMQzg02B7VZ3joVBwyn+DA9ANZQlNU5htLhbBFxmAvs2OnwPP7IabXYEP7w4RF122Z8cKzSbqFh5htuqMkVdkpOxPmYJFlGq6SK4BL1X2i6NJ62okiSBMXXQCjxFTFEJBsvTr0LJwzmwFYPiprk1Sdh7vocx/mbmJs0JL1kZBKk/CRX6fBIpu9aWOSHvFfXugic5Itb9zcq/Zc0JFmdmM+/IqYrOiPZwwC+l1e1g4t2EOEvV8Jf1buvI6sTtrKyn9mvwGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(921020)(38070700021)(11063799006)(6133799003)(4143699003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHMzeDVURm4vb2hISzlrTGFQRk0xa2NnQUFOWW9lUEZFYXFUY0ViaTNNWjE4?=
 =?utf-8?B?aW51M3NrT1U5NW9sZWNDV0xpMkMweElTSGxGeTdVUlpQTldWT1gzMEU4VGsv?=
 =?utf-8?B?QWdrSGZqbEY2eHJCRlF2N0xpbEMvUDRlVFVnbjdyZ1d6aDAzWlZoWWsrK252?=
 =?utf-8?B?V3lSYTBYTUkxKzY2bURoUTRza05uejVUOXplNVdpSDVQQ1F6Y2UrMENBRW4x?=
 =?utf-8?B?b2JFMHd1RnFPNHBuV3VRRjIrMWo2NEE4R2RxODB4U25mdi9LVUFRbUZHRnFO?=
 =?utf-8?B?eC96M3AyeTRNaXplREpvM2hEcDlkbVltZVZVY1A3NVJXWEt5VE1GbXZyaFhj?=
 =?utf-8?B?WDNvcS96cFN4SWJjb0VvOGFaZXIwWkg3cnlFRVhYdGVTbzJTSHZ5NjlHR2FR?=
 =?utf-8?B?WFRwVllWcmNtOUpyNlJjNXJNK2wvRGpndEVUYlVJbEdIaUxpdHRHVzBsT3lW?=
 =?utf-8?B?NWZiRjd0TTdYKzB3MmdzU0MvWTY0ZGlLNFZRcjhtUE42eFNkNzJKRVBkZkQ1?=
 =?utf-8?B?YUZDQ3JKNm9za1JCKytTYVBmWEcrWHFzTmpJV0p3Q3VZWnpZZytkUzBYcFFu?=
 =?utf-8?B?ZGVlOXVpY29zV3dNMDNoNVJQOWNNZzhsZ3dkR2N5bnNKdG5MSm82WjdSSjhR?=
 =?utf-8?B?S1dzQlVTL1BoQisvMkxpcWl2TTBEMWJzaUZ5dDBOUk9hNUtlRXNSMEtNWklP?=
 =?utf-8?B?TGxPWEg2VmcySlp0b1ZpSXhwdzZGNFBxNVd4K01hWnExS2wxRGdIOEtxZkV3?=
 =?utf-8?B?UlVoNUNCWnNYMTFIR25URk4zYmUybzYxaXJvbTlhQVFzT3R3VkJoczI0TDNH?=
 =?utf-8?B?M3FNeFhrUFA0eFEvY1J3ZW5PYmZ4ZlBENDZjNkIrK3daQ2NEOXI4V2lRYWNj?=
 =?utf-8?B?OHhxb3VMYm5OcWJlYnBBNWsxejBMdko1Zmh4M3Z3bTY2NlJ5NVllZXBTSHQ0?=
 =?utf-8?B?NStDM1FsT0x6UkduR0VXbm5xaHhkMHYyeXJKMzA4eG1uVEI2d2JDd1ZFOUF5?=
 =?utf-8?B?cGZrSVFKUEhGdTlEODlUazgzTzlxdFlSNUdJdmFLZW4yZ095cThSQjYwMDF0?=
 =?utf-8?B?SnJuQ1lOejc3K2VsN3EyMXhVb1hjL0xaWjJLeUgzMkZ5KzF6ZkZPSDc3RzNC?=
 =?utf-8?B?T0NxaFA4Q3E4czJyR0pkQWdVUGFMQU9CZzhHZ2x6b2VKUXYwODBFY0lSemJ5?=
 =?utf-8?B?V29ma2s4aXJJaUtTblpOK0xsQWF5UG9jQUpNT0hqbm16QXZuNUhscmRZS1FU?=
 =?utf-8?B?NnBSdlNSNndNQWgxM2s0SU5MY0NpWTFPazRNeDZveXFreVBFZzNlTFNPZWo4?=
 =?utf-8?B?RHFqbFFlVms1WlRzRDNxejJYYnUwZGgyTjVybFVjbzdTZDUvNVErdGNUdWdT?=
 =?utf-8?B?cFNReThRWFhVd1dUQjNNQU0wdUl6SzJ0cnZEM1BaNU5YY0tWaVRQNFVZQnpI?=
 =?utf-8?B?Y2g0c3ljVlRVY1N1ZFYrb0J0dVJmWE5LZzdvWUtFUmgrc0tKeHl4SktMVmxo?=
 =?utf-8?B?cjUvbFBUajREQUJBRVFRVFoyVmJtZzM3R2pVR244dGt5NHpPbS9xTTJHWm0r?=
 =?utf-8?B?dlpSZms2a1I1Y0htRXpnMnpzNVRjVjNMb255VFg0bGd3S0dpM2FQTXRmYzcx?=
 =?utf-8?B?a3FPTGRYT2R5K0x1UlRaMFpiQitqVEtyVXZKNml5alRMZlorZ3MvdURjTkFw?=
 =?utf-8?B?OTFZTnhUb0lpMzFnSzY3VHdYT2lEQUwra0RCNUVHODh5aXJYKzR0cGV0L1pv?=
 =?utf-8?B?UmxyYTBaNVRDbERBWHZCODF2bW5oSkVZa0hGYUdtMk4vd21NU09lOHhlVjhq?=
 =?utf-8?B?RXEwMGhSVGdWcGJOQlVBdm54bG80NG42ZHkzRXdSQnM5WUNZdkhXLzNTc0l4?=
 =?utf-8?B?alJsbWdoOU16TmVNbzdFclNLdTlVeXZZVkZUOWVVUVlURXpFOXdRNUNqTWxZ?=
 =?utf-8?B?OUtXQUFXSEF2UkFPYXgvbVhJTCtVVDBacENxcWYzczJMZThHb1BxZEM3SE5R?=
 =?utf-8?B?emsvZXBPTUxiK1BkdnhVa2VBeWpwS1NuajIvSVBBc3ZzMEJNdVZCVmZPOUpu?=
 =?utf-8?B?TFNvQU1IRk1XV09sUWExQk1OQXQ4L2lpcERBeU1yOFRYY1RqYnk1bzZkb1Fl?=
 =?utf-8?B?M1UveldxanhmYTcwSHZzVFdzb3Z5akRMeUhjYmlCdmQ5R3lUY2Y2ZXczK0du?=
 =?utf-8?B?MXRFV2ROZWlIOXBqZU0ydVpqNmFyUDNEUzltNVRlOVhXM2tWNTJrdDFFVzdl?=
 =?utf-8?B?UUtHMmpRZDZ4U2NqeTUwK2grbDV4b2FtanRJMGFHVlkybzRKSjlMbytqd3Ru?=
 =?utf-8?B?QUpGTzA0RWczMDAzYW5TUjAzcjZoblZqYm5HVGdXRXkwdXBVdFNGZjNLWUFz?=
 =?utf-8?Q?jnt92+RRREhJs3AE7tiNacqOXmLUJ8mPeEhQo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5940AE92E9180B4595CA126DA87D87F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e/c55gfvMFpkkn7C6YtIe5J/5eT5bB+zUm0YKAI+89TwefM0QVcc07kK36YrkItag9BVLKP8/SvXc4Z+kA3EHWT57WxKk6uI/ch9k1pFbjjPEHCe5IB/SQdpzLCzt6y8eZj3LUm8bCr9tLdjLBi3fHUmvylsBbDeSgmVRdQLGTxDY9HQ9CjB2Wjh2e30wroVWIG4dTBPXpGDhM6MTlFTbcuqwA/fAc0bb2juevjO0ExUyvcEPbyF1uFO7ZSD9nVHJ7iu7mHKrF6oBRwj3wlCfImJQi9yDvWYhyrtwO71+GooN0DRdJTaN9PBOG6gOTH+wasJfYxCNvTwSwb3low2pg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b804170b-7585-4631-f585-08debb11b02c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 10:29:37.7543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gxHskpAf2PAwVYTQvCH5zvr8buMKnUWLRNxOsbNfaIoWwfLihZH+sHk9WIu9tJEvY89LLE+53YRvFN9nn0LmefpbmuUGksa0++cpZG+AFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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

T24gVHVlLCAyMDI2LTA1LTI2IGF0IDEzOjU2ICswNTMwLCB0aWxhay50aXJ1bWFsZXNoLnRhbmd1
ZHVAaW50ZWwuY29tDQp3cm90ZToNCj4gRnJvbTogVGFuZ3VkdSBUaWxhayBUaXJ1bWFsZXNoIDx0
aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29tPg0KPiANCj4gSW4gTFIgcHJlZW1wdC1m
ZW5jZSBtb2RlLCBvbiBkZXZpY2VzIHdpdGggY29udGV4dCBiYXNlZA0KPiBUTEIgSW52YWxpZGF0
aW9uLCByZWJpbmQgb3BlcmF0aW9ucyBmb3IgVk1BcyByZXF1aXJlDQo+IGFuIGV4cGxpY2l0IGlu
dmFsaWRhdGlvbiByZXF1ZXN0Lg0KPiANCj4gUmVxdWVzdCBleHBsaWNpdCBUTEIgSW52YWxpZGF0
aW9uIGluIG5vdGlmaWVyIHBhdGgNCj4gYW5kIGluIFBUIHBhdGguDQo+IA0KPiBVc2VycHRyIFZN
QXMgYXJlIGV4Y2x1ZGVkIGluIFBUIHBhdGggc2luY2UgdGhlIG5vdGlmaWVyIHBhdGgNCj4gYWxy
ZWFkeSBzdWJtaXRzIGludmFsaWRhdGlvbiwgcHJldmVudGluZyBkdXBsaWNhdGUNCj4gcmVxdWVz
dHMgZm9yIHRoZSBzYW1lIHJlYmluZCB3aW5kb3cuDQoNCkkgdGhpbmsgd2Ugd2FudCB0byB0cmln
Z2VyIGEgVExCIGZsdXNoIG9uIHJlYmluZCBoZXJlLCBldmVuIGZvcg0KdXNlcnB0ciwgcmF0aGVy
IHRoYW4NCmRvaW5nIGl0IGluIHRoZSB1c2VycHRyIG5vdGlmaWVyLg0KDQpPciBpcyB0aGVyZSBh
IHNwZWNpZmljIHJlYXNvbiB3ZSdkIHdhbnQgdG8gZG8gaXQgaW4gdGhlIG5vdGlmaWVyPyBJDQpi
ZWxpZXZlIGZvciBidWZmZXIgb2JqZWN0cyB3ZSBkb24ndCBUTEIgZmx1c2ggb24gZXZpY3QsIHJp
Z2h0Pw0KDQpUaGFua3MsDQpUaG9tYXMNCg0KDQoNCj4gDQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6
Y2xhdWRlLW9wdXMtNC42DQo+IFNpZ25lZC1vZmYtYnk6IFRhbmd1ZHUgVGlsYWsgVGlydW1hbGVz
aA0KPiA8dGlsYWsudGlydW1hbGVzaC50YW5ndWR1QGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3B0LmPCoMKgwqDCoMKgIHzCoCA0ICsrKysNCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdXNlcnB0ci5jIHwgMTUgKysrKysrKysrKysrKystDQo+IMKgMiBmaWxl
cyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cHQuYw0KPiBpbmRleCAyNjY5ZmY1ZWU3NDcuLmQ1YzRjODIyMDVlNCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3B0LmMNCj4gQEAgLTIwMTksNiArMjAxOSwxMCBAQCBzdGF0aWMgaW50IGJpbmRfb3BfcHJlcGFy
ZShzdHJ1Y3QgeGVfdm0gKnZtLA0KPiBzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwNCj4gwqAJCWlmICgo
IXB0X29wLT5yZWJpbmQgJiYgeGVfdm1faGFzX3NjcmF0Y2godm0pICYmDQo+IMKgCQnCoMKgwqDC
oCB4ZV92bV9pbl9scl9tb2RlKHZtKSkpDQo+IMKgCQkJcHRfdXBkYXRlX29wcy0+bmVlZHNfaW52
YWxpZGF0aW9uID0gdHJ1ZTsNCj4gKwkJZWxzZSBpZiAocHRfb3AtPnJlYmluZCAmJg0KPiB4ZV92
bV9pbl9wcmVlbXB0X2ZlbmNlX21vZGUodm0pICYmDQo+ICsJCQkgdm0tPnhlLT5pbmZvLmhhc19j
dHhfdGxiX2ludmFsICYmDQo+ICsJCQkgIXhlX3ZtYV9pc191c2VycHRyKHZtYSkpDQo+ICsJCQlw
dF91cGRhdGVfb3BzLT5uZWVkc19pbnZhbGlkYXRpb24gPSB0cnVlOw0KPiDCoAkJZWxzZSBpZiAo
cHRfb3AtPnJlYmluZCAmJiAheGVfdm1faW5fbHJfbW9kZSh2bSkpDQo+IMKgCQkJLyogV2UgYnVt
cCBhbHNvIGlmIGJhdGNoX2ludmFsaWRhdGVfdGxiIGlzDQo+IHRydWUgKi8NCj4gwqAJCQl2bS0+
dGxiX2ZsdXNoX3NlcW5vKys7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dXNlcnB0ci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3VzZXJwdHIuYw0KPiBpbmRleCA2
NzYxMDA1YzBiOTAuLmIyYjU3ZTcyOWVhYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3VzZXJwdHIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdXNlcnB0ci5j
DQo+IEBAIC0xMDIsNyArMTAyLDIwIEBAIHhlX3ZtYV91c2VycHRyX2RvX2ludmFsKHN0cnVjdCB4
ZV92bSAqdm0sIHN0cnVjdA0KPiB4ZV91c2VycHRyX3ZtYSAqdXZtYSwgYm9vbCBpc19kDQo+IMKg
CQkJCcKgwqDCoCBmYWxzZSwgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOw0KPiDCoAlYRV9XQVJOX09O
KGVyciA8PSAwKTsNCj4gwqANCj4gLQlpZiAoeGVfdm1faW5fZmF1bHRfbW9kZSh2bSkgJiYgdXNl
cnB0ci0+aW5pdGlhbF9iaW5kKSB7DQo+ICsJLyoNCj4gKwkgKiBGbHVzaCBHUFUgdHJhbnNsYXRp
b25zIGZvciB0aGlzIHVzZXJwdHIgVk1BIGJlZm9yZQ0KPiBkcm9wcGluZyBDUFUtc2lkZQ0KPiAr
CSAqIHBhZ2UgbWFwcGluZ3MuDQo+ICsJICoNCj4gKwkgKiBJbiBmYXVsdC1tb2RlIFZNcywgd29y
ayBpcyBub3QgZHJhaW5lZCB2aWEgcHJlZW1wdC1mZW5jZQ0KPiBzZXF1ZW5jaW5nLA0KPiArCSAq
IHNvIHN0YWxlIFBURS9UTEIgc3RhdGUgbXVzdCBiZSBjbGVhcmVkIGV4cGxpY2l0bHkgYmVmb3Jl
DQo+IHBhZ2UgcmVsZWFzZS4NCj4gKwkgKg0KPiArCSAqIE9uIGRldmljZXMgdXNpbmcgY29udGV4
dC1zY29wZWQgVExCIGludmFsaWRhdGlvbg0KPiAoaGFzX2N0eF90bGJfaW52YWwpLA0KPiArCSAq
IGEgY29udGV4dCBzd2l0Y2ggaXMgbm90IHN1ZmZpY2llbnQgdG8gcmV0aXJlIG9sZCB1c2VycHRy
DQo+IHRyYW5zbGF0aW9ucy4NCj4gKwkgKiBUaGVyZWZvcmUsIHRoaXMgbm90aWZpZXIgcGF0aCBl
eHBsaWNpdGx5IHRyaWdnZXJzDQo+IGludmFsaWRhdGlvbiBhaGVhZCBvZg0KPiArCSAqIHVubWFw
IHRvIHByZXZlbnQgcmV1c2Ugb2Ygb2Jzb2xldGUgYWRkcmVzcyB0cmFuc2xhdGlvbnMuDQo+ICsJ
ICovDQo+ICsJaWYgKCh4ZV92bV9pbl9mYXVsdF9tb2RlKHZtKSB8fCB2bS0+eGUtDQo+ID5pbmZv
Lmhhc19jdHhfdGxiX2ludmFsKSAmJg0KPiArCcKgwqDCoCB1c2VycHRyLT5pbml0aWFsX2JpbmQp
IHsNCj4gwqAJCWlmICghdXNlcnB0ci0+ZmluaXNoX2ludXNlKSB7DQo+IMKgCQkJLyoNCj4gwqAJ
CQkgKiBEZWZlciB0aGUgVExCIHdhaXQgdG8gYW4gZXh0cmEgcGFzcyBzbw0KPiB0aGUgY2FsbGVy
DQo=
