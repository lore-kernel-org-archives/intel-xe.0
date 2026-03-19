Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7741091923
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 21:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2C410E7D8;
	Thu, 19 Mar 2026 21:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/RaAaBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139610E7D8
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773954702; x=1805490702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5z6mK9XZqKyGwx+ZGB/E/0/4xHt8BZ1q2aomHbKy9Xs=;
 b=f/RaAaBcmwrL5s6xaMj+8ErphikFmnSpbaJUtJzwOWdQLhK1Q3R37Wha
 H+KBji4E+Bw2gEH7b+8cU07uvi/qvCifF9/fjdM67egs6nQs8ssaEBIBZ
 ZkxfAknyqU6Cznbeb7359KRSQ8BiwbpiC5W2QNPgJ/sAMgN9W3muh/j+w
 T4ZaPSqiziMV4IkllX69C97lKso6yqbsJ9LeC5IaydVj3sgbmP0ivzaSM
 6u+r3rfcYXgBxTJebvhLGD6fRgfGmnUpMtM7xCnem6xPqDLaCtCat3hBG
 nOe7hryctdHzmf2/XcjWRFHMREbo8/aQx/sMDQmBAV4S1ze/cBTJ8V4N8 g==;
X-CSE-ConnectionGUID: aqPaE/aiQXqB735i0Bk5gQ==
X-CSE-MsgGUID: XwAHlGCeSACoCbEJYbdFFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74218471"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74218471"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:11:42 -0700
X-CSE-ConnectionGUID: UwjmPwaaQvarb8m2ES0bXg==
X-CSE-MsgGUID: Y5v8HnqhSRSIZrJLobAVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223113651"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:11:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 14:11:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 14:11:40 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 14:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8vKDT1pdKk93R/5gnUO4XlwR5Q4z1fg4B2uKJ4npyS3BfsIlVK6aJ8z3gR2cdTmu4WJRNIkMwNu54Ykpa4tB8U15Bg8lDAUT5NmhA9igShDmVJNtgAif9asRd1+dhXEPAW9+RmvT/x+1Z6sFA7DrWmJro/1uX46/B3t+RGJtt4yKkOl/qhVbOoDlyVZkERMG0qMG/eHklCv+3D046czZXRKoQ3H2l9tUgfxRoIbP3R0DS6YG9rtPebcXTFLF6FQcO3aMrt2pwTQGIlF4euOdH/yJfH39/l+ZrpcTLoLadaiGKVCpZRPizeT80TQjozX3l2Gj8f6StoMswqiTMrKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5z6mK9XZqKyGwx+ZGB/E/0/4xHt8BZ1q2aomHbKy9Xs=;
 b=a+Lw1rLLGNQEeFN99UF+zHNITlRubwydNCtnNhNyns7gT3JxWweOGpZ9IeS1GShAsc4KoJF0hFPmnXQ1rL0Aib4+2yhuRtj9XlSfNIeDFjveK1qPXneZkg7fLkS9q7aGAVZsDJRHSRVK/sY5A1M3PO8aQ43El5fFrqsNEJFuvlj0dV7BDPXG3qClfPwigZ0nEHZWe687UFlEURA4iPnvacD/b5g/P4TIRz8doG53e6G0atL4YP6NSobWddVXkL0Hhg/HEPTqL3mZIxw0U3G34IeBuTb9gtZhakrs5eSpN3nnI6BsIMVfTr+d4GRWsd6137dZkX9Et1BqeS7TFFKelQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA0PR11MB4589.namprd11.prod.outlook.com (2603:10b6:806:9a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Thu, 19 Mar 2026 21:11:38 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 21:11:38 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Thread-Topic: [PATCH] drm/xe: Add min and max context TLB invalidation sizes
Thread-Index: AQHct+Qs2obJfu8xwUays6o66amsPLW2WigA
Date: Thu, 19 Mar 2026 21:11:38 +0000
Message-ID: <874cf179e4c6aed3fb36208064fa9c20a90ba7c6.camel@intel.com>
References: <20260319210534.218992-1-stuart.summers@intel.com>
In-Reply-To: <20260319210534.218992-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA0PR11MB4589:EE_
x-ms-office365-filtering-correlation-id: efeb9998-bb37-4788-b1b7-08de85fc1c2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: oLCew9h1/negOoxuOFZNfI579QRpIyYpWMM3SiXRNnaVUrtgCnF8DP3InfiNm5onhtMHNwDZjNNmQINQaC9mmV59EoSi0fkQSl5VlN95QRhhhfRo7yp2Ff2OzE7pubbz5/Mq5y0XeoXvub4ea4vlHk2nrInZFODl6jF71SbdEvlxrjCAjyfMgPbiN9g/8pnm5r/+C1BpXZPft//1uME3pBrjmkiCd0kPIORI4AnC+l8HA8St6adlYEjOkpKGML8RIVZHph02XMrnwkfSRK3JlEHjrVnwFt8hZrTCkdu3qgnC6w6GJ0dcQiamlAygRwT5/OIYbq/SUoijhiimyMHpKXYO36cckOg4Jx8KIP+sqrVz2J4xwas+n0ASg++vBVtJQtx4tsx13QsVoBL6MEybmJjCR1e83QTStwuDlSCataE33EExSH3ARF+61aQ1SnbHqliajglu6nz1GWe6l4k2SS9n8ZYR/Pn3yvK7AMaoCxjllKx0w7t6ijDmCFYhoLk4OrbB6i66rao2HfxOAut9Z5rfZzpcnLSCtUvipeEgn+eBhWPUmJZxv3KdS5rRRUDzZOBWayqfnfNtTTKojQ26HNaNBAwOcEZ9t6/8XQSof0IDGwTfH2U58xU7Tyw8y2OdhWSbMy6kRAVuPcG1UhklAAxtd7gUc1TCYyJKRMu2+TfLXyee3VAGzkP1WWohaE9ys9ogc60mGzHSJ+yu4Hv9Le5Q0+e+gO66+Uhys8PYkUGHRFF7iwXQVNX/AghTU9xEciS6ArZN4HWdvgD70sHz0RFfPSPjLG0eG6wl7lS5XNE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzhHSEVUYzl0TWNva2VkZVVRZ0NGUzNIa1RzMjRxOFJqMmRpM3BkQnRpWDJK?=
 =?utf-8?B?UGpCSWE5ZzZsK1RmYm52UDVPV3VHZnI5Y1U5eFp1N0o2ZVZSbkwrbTU1bjFX?=
 =?utf-8?B?TE1RNnNNdVNBNUZjSXg2aDZWaWdtWTkySzYrbzRvaGFiVFZoMFpkK2F6cU1m?=
 =?utf-8?B?aGJ0QnY5Y2VqdVRTeUE1T0Y4bU5wMDZYdHJrTG9qMkZudFNvRVVOd0RKZWhY?=
 =?utf-8?B?clZYb0lZUS9VRzZVZ3ZZaUlMMklZaU52dE42S1R3eW9EZlQ4bTVSREVFdDJK?=
 =?utf-8?B?ZGVCMENKc1l4cXh5bmVNSWlOb3I3SE1BTThkTFhhQWxzbzZzbUJSTGdMVkhU?=
 =?utf-8?B?aEdqNXFFdHdoa0ZtVHE2b1IyZ3ViMDY5N3ltN2N2d29BcnV2cjUrWEIwOTRH?=
 =?utf-8?B?bkhnK0ZsU2drZlRzbU1oSGpURk8xV1lRNmtyZUxpSUFJSTJieFloSktTam1V?=
 =?utf-8?B?NWxzT3Z1MW9xYjV6RFVuUmovam40OGZNWEY2V0JLWlhtTUR1OWRucUdjeWhi?=
 =?utf-8?B?Tkt2N0VZK2FmOHBLajJhWks0TWYwbDQyYXdnaUwwUXdGWnNTSVdNNVRDVWd5?=
 =?utf-8?B?V0YxZzhlTmZrUlpHb2dpNmVubHA4bUM2NU5KS3UyZ0pvRzd2WGhXcmNkWjlK?=
 =?utf-8?B?ZEpRTXFrT3RERmVHSEI5dGV0WU43OVdvcEorNmRRQ3N0QTJuMHpnYUkzK0xL?=
 =?utf-8?B?OGY5U2NLVUtjTVBFdEVtUy9qK081VUF4S2RxVGwxL1FrQitkZWYrTUcwc0xY?=
 =?utf-8?B?b0Z3emIvN0NtbjVGZ3ZKY29nNnhFeVVpTHZWaWZwNExONU1lOGcrWnhmSmdy?=
 =?utf-8?B?dm96UW5pQVRhSGc3UDFSdXM0aXo0eWM2aW5QNUU4NVRtWGYxZWhnNU9Nc2Qr?=
 =?utf-8?B?eTgrQklRODdDdi81MTV5ZThoYUZsYi94cHYwUE5xdU5mcmpFZmpoVGUwcXN1?=
 =?utf-8?B?N01ObmhUUFN3RjZ3aGdIOTM0M3EzcFNIa3MzNFhjM0NPTUJ5bjlOZVFpNldW?=
 =?utf-8?B?RXc0cnhtaGZDU1RqSnJSZGg2d0NCdyt2YW4yTVc3dlFtOXRhSW5ZLzV1M0tt?=
 =?utf-8?B?NmhySElVenlJN1dkOTE5RXB0Q3ZpQVRtdlF0c3dUdFloUGxVU2QxK2VkbkR4?=
 =?utf-8?B?VmlaVmdOcyttWHRLYzlFR2NtRjQwQjAxcXM0T0hRZWl4TG4xc3hocHhPQm1U?=
 =?utf-8?B?TFhqRmlKRjBXaSt4VktzdFdpNW9PYmNIVnNhYW9xOTUrQVZhOWYzZG53Z0JR?=
 =?utf-8?B?UjBoZkJ5N2xiR3gwZkp3QkN1TmRlbW1odXNPUHA0UXVGeVE2SlNJR2prcHB5?=
 =?utf-8?B?Z200SWhiSFArQ3VLNWZKK1NJb2tLMGNNSUxxTUZLQ1ZtVkgxL3VJM2ozWHdl?=
 =?utf-8?B?Z0YyN1lHY1RhOG83SS8xUFN6d3ZJMDBaOTlOSExBTm81Q0tLSHhBb1Q4Zk15?=
 =?utf-8?B?aWowOTRHY3RBZXhBQmZSUnBLR2VMNjR2QVlsV2FOR0FUQmJuc0haeTA1a2lW?=
 =?utf-8?B?RmNSTGxlaW02QW5DVi9FTnFrdStXMTJqUnZJMmx2bnFLV2RRL0piUXptN1p0?=
 =?utf-8?B?cmFXeE9sYUNOYnA5TzBEa0E3Njl1YVcvL3VqOThIK3YrN1hxMzJNaTdlclFI?=
 =?utf-8?B?ZGlxK3lrQ3ZaWGNQM0RtaGtLaEU2K0RFWVJYTmdkeGZSSEhMUXhna0lJdlFP?=
 =?utf-8?B?b2lDSTlmM2IzRFlGdW1ER2VqM1FDYVAvODQ4cnBhZWo5U1VPb2RwRnR2cmxh?=
 =?utf-8?B?bFVwUTVGTjVjTXRHWmc2OExzMy80dituZDl4ZlN1b2ppVUkvUk5wNHJaUmYy?=
 =?utf-8?B?ZEIwTFFvbXh4UlBESW8vSE5DNncwdDJHSmpRaERnbFdjK3FRSElRVGpKbFc1?=
 =?utf-8?B?M2ZBT09rMHpqZnN1TzVnb2FmMXJIVnVVNDZKdng4cTFCaEJQVlFCSXkyWmtv?=
 =?utf-8?B?S1Z6ci83amtZNWkrSUxTM2RHejZyaVpRNWNDbE4vWm1kbnExeTNVTk1jcDJa?=
 =?utf-8?B?R2NGZXdiZWVFVFhKckV3K0lxUkQxNEd5bEptd1NVc1VOVzBHdU5DM2FwUDNz?=
 =?utf-8?B?RGhBaUwrdkwzbUtBZkxFM09ybjZHcDZ4R2VtMmdZeU0xNEhaVEJjaEwyOUpV?=
 =?utf-8?B?YmJBT1VsUjlHeXo3SThFR2o5bTNxaVIwWm5HWS9FcDVzNlVQU0ZUNm1TQjBY?=
 =?utf-8?B?a294Y3FycFA5bVpyRzN2RWRaWkphaUZWKy9EaGJlaGpUOGdPaDkzY1FJcDJT?=
 =?utf-8?B?OG5sam4wTE9ETGlvZ3FqYU5sQS95aWFzZHJxWmtUMW1sYnFYRGFoZ2hWRFFE?=
 =?utf-8?B?YUF2d3lNMkNSRG1hTnN1dkFSVXdyUWx0MkdBQTQ4aFl1bFpHUGZGWnhhZ1BO?=
 =?utf-8?Q?2pDzH5CF1t8ItnkM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB430EF2E7BFAC408EB157EE85C61D48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HPaJJEbY7auU562L7gTiYvI/QPctX/1+3nzn4I8ExuvqZsl2zrmZ6LSWZnMqpmWVGbpg0gVwPXvUPeu+nPzxDJXZocId8eck4SKYhHN/du39YFqcs60Sene+cpDmAhJ5wKO+O48ggSdN72Wt/U58WDQoMj3B8fdlLTaR8WzW+jnmHfpeJ9MnhUh+FwrNgyLIJtcB3yhw9vRHr4m6Ptjzzp2KqzzZdQmjOzQQ8ehg+SsQunMfktNgR3Z7Gr1/PUUbRYM7MNLBM24BUk7hpFROr9te7Q2xbL1agImcUYzzrVk8u0xWpRdpNfnCXO76R6E4msIRhT+2GfZhO5YS6tuQkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efeb9998-bb37-4788-b1b7-08de85fc1c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 21:11:38.3902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8UX1XVAwO5CgW/gE4ljkjC0Ss6Re3NV7xMWY1SMJLkbKffcO8dKaInjpM8y1Kr2DUGSD7Pb/0mfgu1R1CwWpQvOv+DjfJNZ1FTYqRcGIh+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4589
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

T24gVGh1LCAyMDI2LTAzLTE5IGF0IDIxOjA1ICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToK
PiBBbGxvdyBwbGF0Zm9ybS1kZWZpbmVkIFRMQiBpbnZhbGlkYXRpb24gbWluIGFuZCBtYXggbGVu
Z3Rocy4KPiAKPiBUaGlzIGdpdmVzIGZpbmVyIGdyYW51bGFyIGNvbnRyb2wgdG8gd2hpY2ggaW52
YWxpZGF0aW9ucyB3ZQo+IGRlY2lkZSB0byBzZW5kIHRvIEd1Qy4gVGhlIG1pbiBzaXplIGlzIGVz
c2VudGlhbGx5IGEgcm91bmQKPiB1cC4gVGhlIG1heCBhbGxvd3MgdXMgdG8gc3dpdGNoIHRvIGEg
ZnVsbCBpbnZhbGlkYXRpb24uCj4gCj4gVGhlIGV4cGVjdGF0aW9uIGhlcmUgaXMgdGhhdCBHdUMg
d2lsbCB0cmFuc2xhdGUgdGhlIGZ1bGwKPiBpbnZhbGlkYXRpb24gaW4gdGhpcyBpbnN0YW5jZSBp
bnRvIGEgc2VyaWVzIG9mIHBlciBjb250ZXh0Cj4gaW52YWxpZGFpdG9ucy4gVGhlc2UgYXJlIHRo
ZW4gaXNzdWVkIHdpdGggbm8gSDJHIG9yIEcySAo+IG1lc3NhZ2VzIGFuZCB0aGVyZWZvcmUgc2hv
dWxkIGJlIHF1aWNrZXIgdGhhbiBzcGxpdHRpbmcKPiB0aGUgaW52YWxpZGF0aW9ucyBmcm9tIHRo
ZSBLTUQgaW4gbWF4IHNpemUgY2h1bmtzIGFuZCBzZW5kaW5nCj4gc2VwYXJhdGVseS4KPiAKPiB2
MjogQWRkIHByb3BlciBkZWZhdWx0cyBmb3IgbWluL21heCBpZiBub3Qgc2V0IGluIHRoZSBkZXZp
Y2UKPiDCoMKgwqAgc3RydWN0dXJlcwo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJz
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmjCoCB8wqAgNCArKysrCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3RsYl9pbnZhbC5jIHwgMjAgKysrKysrKy0tLS0tLS0tLS0tLS0KPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrKwo+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5owqDCoMKgwqAgfMKgIDIgKysKPiDCoDQgZmlsZXMg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaAo+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gaW5kZXggNjE1MjE4ZDc3NWIxLi4wYzQxNjhmZTJm
ZmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oCj4gQEAgLTEzNyw2ICsx
MzcsMTAgQEAgc3RydWN0IHhlX2RldmljZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1OCB2bV9tYXhfbGV2ZWw7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAv
KiogQGluZm8udmFfYml0czogTWF4aW11bSBiaXRzIG9mIGEgdmlydHVhbCBhZGRyZXNzCj4gKi8K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IHZhX2JpdHM7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAaW5mby5taW5fdGxiX2ludmFsX3NpemU6IE1pbmlt
dW0gc2l6ZSBvZiBjb250ZXh0Cj4gYmFzZWQgVExCIGludmFsaWRhdGlvbnMgKi8KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTY0IG1pbl90bGJfaW52YWxfc2l6ZTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBpbmZvLm1heF90bGJfaW52YWxfc2l6ZTogTWF4
aW11bSBzaXplIG9mIGNvbnRleHQKPiBiYXNlZCBUTEIgaW52YWxpZGF0aW9ucyAqLwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgbWF4X3RsYl9pbnZhbF9zaXplOwo+IMKgCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogS2VlcCBhbGwgZmxhZ3MgYmVsb3cgYWxwaGFiZXRpY2FsbHkgc29ydGVk
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfdGxiX2ludmFsLmMKPiBpbmRleCBlYjQwNTI4OTc2
Y2EuLjc1MTJmODg5YTk3YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3RsYl9pbnZhbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y190bGJfaW52YWwu
Ywo+IEBAIC0xMzMsMTIgKzEzMywxMiBAQCBzdGF0aWMgaW50IHNlbmRfcGFnZV9yZWNsYWltKHN0
cnVjdCB4ZV9ndWMKPiAqZ3VjLCB1MzIgc2Vxbm8sCj4gwqAKPiDCoHN0YXRpYyB1NjQgbm9ybWFs
aXplX2ludmFsaWRhdGlvbl9yYW5nZShzdHJ1Y3QgeGVfZ3QgKmd0LCB1NjQKPiAqc3RhcnQsIHU2
NCAqZW5kKQo+IMKgewo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3Rf
dG9feGUoZ3QpOwo+IMKgwqDCoMKgwqDCoMKgwqB1NjQgb3JpZ19zdGFydCA9ICpzdGFydDsKPiDC
oMKgwqDCoMKgwqDCoMKgdTY0IGxlbmd0aCA9ICplbmQgLSAqc3RhcnQ7Cj4gwqDCoMKgwqDCoMKg
wqDCoHU2NCBhbGlnbjsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGlmIChsZW5ndGggPCBTWl80SykK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGVuZ3RoID0gU1pfNEs7Cj4gK8KgwqDC
oMKgwqDCoMKgbGVuZ3RoID0gbWF4X3QodTY0LCB4ZS0+aW5mby5taW5fdGxiX2ludmFsX3NpemUs
IGxlbmd0aCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgYWxpZ24gPSByb3VuZHVwX3Bvd19vZl90
d28obGVuZ3RoKTsKPiDCoMKgwqDCoMKgwqDCoMKgKnN0YXJ0ID0gQUxJR05fRE9XTigqc3RhcnQs
IGFsaWduKTsKPiBAQCAtMTYzLDEzICsxNjMsNiBAQCBzdGF0aWMgdTY0IG5vcm1hbGl6ZV9pbnZh
bGlkYXRpb25fcmFuZ2Uoc3RydWN0Cj4geGVfZ3QgKmd0LCB1NjQgKnN0YXJ0LCB1NjQgKmVuZCkK
PiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGxlbmd0aDsKPiDCoH0KPiDCoAo+IC0vKgo+IC0gKiBF
bnN1cmUgdGhhdCByb3VuZHVwX3Bvd19vZl90d28obGVuZ3RoKSBkb2Vzbid0IG92ZXJmbG93Lgo+
IC0gKiBOb3RlIHRoYXQgcm91bmR1cF9wb3dfb2ZfdHdvKCkgb3BlcmF0ZXMgb24gdW5zaWduZWQg
bG9uZywKPiAtICogbm90IG9uIHU2NC4KPiAtICovCj4gLSNkZWZpbmUgTUFYX1JBTkdFX1RMQl9J
TlZBTElEQVRJT05fTEVOR1RICj4gKHJvdW5kZG93bl9wb3dfb2ZfdHdvKFVMT05HX01BWCkpCj4g
LQo+IMKgc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbF9wcGd0dChzdHJ1Y3QgeGVfZ3VjICpndWMs
IHUzMiBzZXFubywgdTY0Cj4gc3RhcnQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU2NCBlbmQsIHUzMiBpZCwgdTMyIHR5
cGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fc3ViYWxsb2MgKnBybF9zYSkKPiBAQCAtMTc4LDkgKzE3
MSwxMiBAQCBzdGF0aWMgaW50IHNlbmRfdGxiX2ludmFsX3BwZ3R0KHN0cnVjdCB4ZV9ndWMKPiAq
Z3VjLCB1MzIgc2Vxbm8sIHU2NCBzdGFydCwKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0
ICpndCA9IGd1Y190b19ndChndWMpOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSA9IGd1Y190b194ZShndWMpOwo+IMKgwqDCoMKgwqDCoMKgwqB1MzIgYWN0aW9uW01BWF9U
TEJfSU5WQUxJREFUSU9OX0xFTl07Cj4gLcKgwqDCoMKgwqDCoMKgdTY0IGxlbmd0aCA9IGVuZCAt
IHN0YXJ0Owo+ICvCoMKgwqDCoMKgwqDCoHU2NCBub3JtYWxpemVfbGVuOwo+IMKgwqDCoMKgwqDC
oMKgwqBpbnQgbGVuID0gMCwgZXJyOwo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgbm9ybWFsaXplX2xl
biA9IG5vcm1hbGl6ZV9pbnZhbGlkYXRpb25fcmFuZ2UoZ3QsICZzdGFydCwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZlbmQpOwo+ICsKPiDCoMKgwqDC
oMKgwqDCoMKgeGVfZ3RfYXNzZXJ0KGd0LCAodHlwZSA9PSBYRV9HVUNfVExCX0lOVkFMX1BBR0Vf
U0VMRUNUSVZFICYmCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIXhlLT5pbmZvLmhhc19jdHhfdGxiX2ludmFsKSB8fAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHR5cGUgPT0gWEVfR1VDX1RMQl9JTlZBTF9QQUdF
X1NFTEVDVElWRV9DVFggJiYKPiBAQCAtMTg5LDExICsxODUsOSBAQCBzdGF0aWMgaW50IHNlbmRf
dGxiX2ludmFsX3BwZ3R0KHN0cnVjdCB4ZV9ndWMKPiAqZ3VjLCB1MzIgc2Vxbm8sIHU2NCBzdGFy
dCwKPiDCoMKgwqDCoMKgwqDCoMKgYWN0aW9uW2xlbisrXSA9IFhFX0dVQ19BQ1RJT05fVExCX0lO
VkFMSURBVElPTjsKPiDCoMKgwqDCoMKgwqDCoMKgYWN0aW9uW2xlbisrXSA9ICFwcmxfc2EgPyBz
ZXFubyA6Cj4gVExCX0lOVkFMSURBVElPTl9TRVFOT19JTlZBTElEOwo+IMKgwqDCoMKgwqDCoMKg
wqBpZiAoIWd0X3RvX3hlKGd0KS0+aW5mby5oYXNfcmFuZ2VfdGxiX2ludmFsIHx8Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxlbmd0aCA+IE1BWF9SQU5HRV9UTEJfSU5WQUxJREFUSU9OX0xFTkdU
SCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3JtYWxpemVfbGVuID4geGUtPmluZm8ubWF4
X3RsYl9pbnZhbF9zaXplKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Rp
b25bbGVuKytdID0gTUFLRV9JTlZBTF9PUChYRV9HVUNfVExCX0lOVkFMX0ZVTEwpOwo+IMKgwqDC
oMKgwqDCoMKgwqB9IGVsc2Ugewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQg
bm9ybWFsaXplX2xlbiA9IG5vcm1hbGl6ZV9pbnZhbGlkYXRpb25fcmFuZ2UoZ3QsCj4gJnN0YXJ0
LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAKPiAmZW5kKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGJvb2wgbmVlZF9mbHVzaCA9ICFwcmxfc2EgJiYKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZXFubyAhPSBUTEJfSU5WQUxJREFUSU9OX1NFUU5P
X0lOVkFMSUQ7Cj4gwqAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5j
Cj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMKPiBpbmRleCAxODllMmExYzI5ZjkuLjVl
MDJmOWFiNjI1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMKPiBAQCAtNzQzLDYgKzc0Myw5IEBAIHN0
YXRpYyBpbnQgeGVfaW5mb19pbml0X2Vhcmx5KHN0cnVjdCB4ZV9kZXZpY2UKPiAqeGUsCj4gwqDC
oMKgwqDCoMKgwqDCoHhlLT5pbmZvLnZtX21heF9sZXZlbCA9IGRlc2MtPnZtX21heF9sZXZlbDsK
PiDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8udnJhbV9mbGFncyA9IGRlc2MtPnZyYW1fZmxhZ3M7
Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5taW5fdGxiX2ludmFsX3NpemUgPSBkZXNj
LT5taW5fdGxiX2ludmFsX3NpemUgPzoKPiBTWl80SzsKPiArwqDCoMKgwqDCoMKgwqB4ZS0+aW5m
by5tYXhfdGxiX2ludmFsX3NpemUgPSBkZXNjLT5tYXhfdGxiX2ludmFsX3NpemUgPzoKPiBTWl8x
RzsKCkJhc2ljYWxseSBJIGRlY2lkZWQgdG8gZ2V0IHJpZCBvZiB0aGUgcGF0aG9sb2dpY2FsIGNh
c2UgZm9yIG5vdy4gSQpmaWd1cmVkIDFHIGlzIGEgZ29vZCBoYXBweSBtZWRpdW0gZm9yIGxhcmdl
ciBWTUFzLiBMZXQgbWUga25vdyBpZiB5b3UKaGF2ZSBhbnkgY29uY2VybnMgdGhlcmUgdGhvdWdo
LgoKVGhhbmtzLApTdHVhcnQKCj4gKwo+IMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5pc19kZ2Z4
ID0gZGVzYy0+aXNfZGdmeDsKPiDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzX2NhY2hlZF9w
dCA9IGRlc2MtPmhhc19jYWNoZWRfcHQ7Cj4gwqDCoMKgwqDCoMKgwqDCoHhlLT5pbmZvLmhhc19m
YW5fY29udHJvbCA9IGRlc2MtPmhhc19mYW5fY29udHJvbDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNp
X3R5cGVzLmgKPiBpbmRleCA4ZWVlNGZiMWM1N2MuLmNkOWQzYWQ5NmZlMCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcGNpX3R5cGVzLmgKPiBAQCAtMzQsNiArMzQsOCBAQCBzdHJ1Y3QgeGVfZGV2aWNl
X2Rlc2Mgewo+IMKgwqDCoMKgwqDCoMKgwqB1OCB2YV9iaXRzOwo+IMKgwqDCoMKgwqDCoMKgwqB1
OCB2bV9tYXhfbGV2ZWw7Cj4gwqDCoMKgwqDCoMKgwqDCoHU4IHZyYW1fZmxhZ3M7Cj4gK8KgwqDC
oMKgwqDCoMKgdTY0IG1pbl90bGJfaW52YWxfc2l6ZTsKPiArwqDCoMKgwqDCoMKgwqB1NjQgbWF4
X3RsYl9pbnZhbF9zaXplOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHU4IHJlcXVpcmVfZm9yY2Vf
cHJvYmU6MTsKPiDCoMKgwqDCoMKgwqDCoMKgdTggaXNfZGdmeDoxOwoK
