Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13168C55ABF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 20:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C0710EFE7;
	Wed,  5 Aug 2026 20:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4Nfsevt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C5110EFE7
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 20:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785962227; x=1817498227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6CT/4mrJ0BRq2Oy9SBID0RTO+S+SZHfUwlO8a0jAsho=;
 b=g4NfsevtC2g52VysqxJMHyvZJ0VcG7Au15V92HhnADTkXHZsBAeY5yur
 7kYPKXLArNOzAkQMuKVYAIN3UskO5k2Cm710ZZwP1owNk79HjHVtsMjlh
 Sh3iP/gcyWc7tajG+21xCDAbDjf1HwThOoUvvH46q9VB7Dv4Hanbe5HSm
 HaoE6TbOLcUW0nWDlk8jsSAvWgLpMpkG5/mFTQ/D9vDnPka9/hQ8GV9Cg
 be8tsWtweOuLD+9VqFzwvqSh/W7kzJ50VVEB1H7CRmWFJ/UVQPFab0sdg
 4cHyCnLEA/ewhnncN70HgekMdyHRQE5J6V2Zj2WvhWVatz663uNG8Ikq4 g==;
X-CSE-ConnectionGUID: Lj1A1Yg2QBq9rHq81daT6A==
X-CSE-MsgGUID: btcle48VRM6u6cs6E6I3eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97195399"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="97195399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:37:07 -0700
X-CSE-ConnectionGUID: 3O8unRMgR+yEsd9rIQ90tw==
X-CSE-MsgGUID: qJSgxrVWSeqizEUDPo8BmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="261365176"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:37:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:37:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 13:37:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEmgUX89YoZEU468iV3h2UUX6BgQBcqW8QR2q4GvBuHP/R4HY6tw92Tt2YRLjW7qpDOxzb8gcHTTQxMXv4t8XCvdK3tAHabHlaPy9OdQWCLlylaLTAQ1q9t5Lsf7Cu1SLYZ6w8pJfl69rPdUppxQgclmLATComfp8PVbU02d1gO5sOOlzqDdXinUysCklg5reXRrCrTjOu7eti3uLlWeypFi62UZmx302AbuBSDSO1v0vyZ4CRLlA5s3LzBS3EY2pWLUDEcGolYSgW53oPUeq0tYJefPxkGOf8nuE2K+xgIUI2MFHGIT8oikEquhhvV7uRYQNbItq6agkMteKDqK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CT/4mrJ0BRq2Oy9SBID0RTO+S+SZHfUwlO8a0jAsho=;
 b=ibh14+OCQ5QU2hol4MAZVmBJwd1kdr25pX94tVt4WGoCrrwXZKj7e6Ozuwf7EI4fg2U3+ImN25xnJy9D9cqeS5Uu/aO8ssAbM4T9/aklF/PfEW21gh8ASSzxd/EhlDhOKTF+tb1Ucsd3RFCSI7T6gda+MXwza37Xx4y6UQBA/bGCbLUKumlEwZMizGvF6ybAvOr1c3SSsE3nocfTzl0x+sJyzgdb2+qU4oj3MAuPagY6UqxV5GL2t8BjdmWeDTeGs8xI3i+hfcn4uXPxO3LDCWpGggbZiMoyUUdgsJcOTY+W29JTFof7dxAusNL36jXfr3vkGxIfywF5KWmQD4DN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by IA3PR11MB8894.namprd11.prod.outlook.com (2603:10b6:208:574::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:37:03 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0270.018; Wed, 5 Aug 2026
 20:37:03 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Thread-Topic: [PATCH v2] drm/xe: Fix a bug in pc_adjust_freq_bounds()
Thread-Index: AQHdJGjbHTEKBG9JKk64m3v3i0q5y7aP64UA
Date: Wed, 5 Aug 2026 20:37:03 +0000
Message-ID: <30078648509cf682c11e12aa3eb025f2e293aaab.camel@intel.com>
References: <20260804232218.1736159-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260804232218.1736159-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|IA3PR11MB8894:EE_
x-ms-office365-filtering-correlation-id: d4188d3a-2889-4163-1b93-08def3314f12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: F+rYloBlltzIFqq3bl8q23ErL1zMlfUyniTvJsV9tlFj4KgOiiD9bNu7raBb+pr0DBlhvhAFfWOgAT6lAgCBSsVClKhuAKlERYoIFGUSePvFqzhYwRIT4hv9r1p8Dc7YdrS1X9sra7NVfIS7nooWmt7Yo9LfKMPa7nltPoAgTattLhl0JPwd0+ZmrUI/u8Y57UtQEPYIcnFg1f2XXEOznTxJUfl2idiltdDPV98LkoI5nFzrqbe6CwGOw16xbjHp90ImeObRqZULYV3TUJzM8uIBK47jiae7O5gnVY9flJ+6qU0MGAgMY9us7EKRj2MriTdFij9qu7x+XyoaV3JTY1iqxJ8mQsfcXsqwQ8+sBEc1TkKMtyj/2mW3OpjAYS2q69udRIOsttEUCmJxAJGla7v8ejicJkn95sKEeGOGYX1z5y0kIMicAIOP7mJVoeI0ts9xd6ZAREkVEMEmJCmPXx3b3segiWVHqtldsvV0ZVbIF1Oz2mujsPVLS1ZWcRxST1wEoQmRL+Bn9dAkvf+sGAscmLzy/AkSHbhp/XIPBmlveouyeedGNpuSyKvay0z6vJx1psQxtaKhOW3z4dgne0MFL4qVRW6OOMOgBMQR/L1S9t0WE/HnIniJF7Dg11OSdNhOVaI+2XKHbo611aHeyyIiwRwwiOnlzjlJEHlU+2b27UjFMNNngfiKWxXPGcdYBJ4RDAFqkERgqsyYY4PyjlMr/+n7x5suxo9tnZ7pHto=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVdyZHZwdktjbm9maEFEeVZNay9JUDBSS2JwakhnMVdxSTBncG9SRDh0UGxx?=
 =?utf-8?B?ZHgweWFtaDdVcWZvSmJiMFRXUWpoR3l6QjNleTlwZ2lCUVQyZk5qZ1crdG5m?=
 =?utf-8?B?WE8yTFE3S3llSGxrVUVrS1hiVXlCblpMeTRZMDZVNFNrY256aW1rU2Z5TGRr?=
 =?utf-8?B?cmNORWU5WWtkUURHcFcxLzJJMkxaRXlwYVlJTUcxdW4xb0tOL2RhSU5IbllH?=
 =?utf-8?B?UVlLZzhLZGZTZHF5Vi9ocldvemFBRVEzd1FOdmRKUCtXRDF1SHRQT1JseEI4?=
 =?utf-8?B?ZUVTRVpVVlJoRVhnb3VYV2tPbXgxRzZMUUxWbEE3dE1nVVBsSTBudHdWYWhl?=
 =?utf-8?B?RnBCQnVaWVhpRTRkN1RTODFFNUJQTHByakNFVkhTZTNjRDc0c1Y5WHMxamRD?=
 =?utf-8?B?NnVjaWxMWXZPMDgyVXJTQTJxdFdONUQzWVJlT3loSjhmWGtnUUlmQ1ppWjlL?=
 =?utf-8?B?b2ZTQUtTTEQzYklKSU5VQ3JOWXdIK3ZVY2VZY3hkUVVRcFNtanNnKyt5NXZE?=
 =?utf-8?B?bG5sTDdHUXF5SnQycGRxU2NHQ1NYREF0SitLQWMzaTc5TmN1b3pEa3ZHM045?=
 =?utf-8?B?OExqWEltOGZqYi9hQXJ1NENNUmtTRjh6cHd4MVVyZSs2cTdrUlo5Qi9qRnpT?=
 =?utf-8?B?dTFlNzlPaEJFLzNLdnFmbDR1L1lNQ2ZhOUgrQjMzOTc5OUwva2s0ZzVSc1E2?=
 =?utf-8?B?UzdFZmRtRDJWWXh3THVqaFZFaFlqb05EdmYvVXNsR3c4YWp3TEIyMW1FQU1D?=
 =?utf-8?B?OGdWQmxUMHg5YVl6REU5YzE4ZmFPSGNJR0dpT0dGYmhJdUIyOXJOWm9QbFpX?=
 =?utf-8?B?VzNyb3NJM2h1SHo5bHNOcG1kTWdzNmRZSEE2M1hobHNEOXF3UUV5U1lEb3Y5?=
 =?utf-8?B?MDE3WkhSUTdYbGsyaFJ4NTVoMTZWRHNXdmZaVEJhMkdzRUx0UVB2c0huTVJr?=
 =?utf-8?B?OWJoOWRzcWFmdnpEaEM1U2FzN1YxU1VkZDhuNTc2VGVWY0toN2RTdWNVR3lk?=
 =?utf-8?B?TjYycnJuUzRWSWZPeXZndmtVcVNMZVQ4d1JrZWlWS3hMWVlLL0IvVTBsY0c0?=
 =?utf-8?B?NkxCZlhJNmtrK1oxUEtrMFZYOEVjaXNCaWtuUnhFMTYxZEtFaFpITnFWR21u?=
 =?utf-8?B?R1JleG5hU3ZiNXVDMzBOV3l2UlZOeDdOenVLV0RMenBhL0ExdXllZitEZytB?=
 =?utf-8?B?ZkVWSTZDbm0vRGQveHhYRi92VXZyTzhTV25USjFkL2RoMHloT1AwVnhEUDVV?=
 =?utf-8?B?a1p0L3gyRjJvbGNMemw1Qkg3TGQxYW96SUtDcUhMVVdjTFVtdGNITHg5Z0RJ?=
 =?utf-8?B?dEx3ZWhLdHVmb3VjMW45cFZBRHpGU01wRk12b2FwVnJwRUVTUUtaNU9pQlJm?=
 =?utf-8?B?bU0wa2JLTUhYcFpSK3FJVS9vS3o5VlZTTDljTkU0cXptcWc3NEduSUNxYzh4?=
 =?utf-8?B?TjhWTXpNS29GRkpPOUNFWllRZVh4Y0NabU5oZ1owNTF5azhlWVA1TjBzR25P?=
 =?utf-8?B?TENYa2J3Q0hmUStaZGFQZnl4K0I0eVZNcTIvaVZKWDhUZ3l0ajJNa2FiQ25U?=
 =?utf-8?B?Ukpjc09aWTBYR2tnMnJDQTczQVZiVTFoYlVBN0hzMTEvN1VGMTVRajJxQ0Ns?=
 =?utf-8?B?L1dTUjhpcnNwUmxKTkJ1Y0JNK3ZFVTVQQ3g5dFFBM2I2Z1NoNkZvcm5nSEtY?=
 =?utf-8?B?TCtZOXN6eHpKVm5paHZBbU03bTlFZkhZWGVRVFpCazRXdm1Jc3BWKy9XMlQv?=
 =?utf-8?B?YVVQSlIwYlFoSXlQSXpjd1ZZS3oxUW9aaEcrZDFCaU9lVlN6TThWdEhGTmxr?=
 =?utf-8?B?akhCMWRPelFHOUF4cm5hc3U2OGJpbHpWMGFkSFdkeGU5ek8zSnRCUTBnVEt0?=
 =?utf-8?B?QXVpOW8wWk53SUIzdHRkRmlhd1Avblp3c3hiTkUwdkQwQVRwRUEvc1poMDNH?=
 =?utf-8?B?TzlVUTdCOTNQdUU3dkJSdVZJSHIzeXpwZExUem5oZFU3N3dya1RJL2twSzE1?=
 =?utf-8?B?QnVURWFwUyt3cmdGTlI0Zk5hQ0tjczB2NXFWeDhmZXpjZCt5VEFpbmxQU0FW?=
 =?utf-8?B?bVJyWVBZMDRIdWNjcEJTb1NiMEhMWjdKTTJ6WW9LQnFhdkFwWEhHbHBKRmVk?=
 =?utf-8?B?TFhHL2dMcVJaU2Zkb3Radm5HQSt6WTl4MUlhTHYyV2docXNCS3hCYnM3dzc3?=
 =?utf-8?B?N2ZPeVVsa0FPZEtHY3drLzRDZm1NNHpURDUzbFkvaTBEYThwVjBLL1hXMHJF?=
 =?utf-8?B?OEkzem84Umc4TDlXUCtJM1drUkpVUXNUSVhKSE5iWHI5emFtRldUQU1PUERl?=
 =?utf-8?B?MGZsVEpmellpQjhPVWRSVmpuUU9uVVNCdzhIcWFKcFZqdFZNZHlKRmc5M2hS?=
 =?utf-8?Q?BBQryyanxZqw7v1Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F07303B3F1BBC74389DB3116742D0BD5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DJaVvYFqkdXK07ChHyKWKv1+xtTFJrkXkphr7X4EMVEFOnh7019xP1RTBgQdMw0yI86+m0oLpLrB3M/ZfkQGZBJ7Fg5zIS9ZYFG793SYvnuIjb+FV5uQSXuFMM8dlimfoZk8Qcffss0stA0bizPdfcQiNwGn9GhPATcK0BxDu60I9/W3oVEDWpJLN7NNQxBO90aEB68bE+PBS5IjYnMFly/xBhFCcUmKhGReRzKA2vuorqOVDOdGERAKv09MPWitkh/c5rrU9tvQ1ASK4jjHe6MTxf95iEZrjJTrcJ1mm6Ic3HOGueAqx5vS1X+W+N4BIrBJnUAOWdyS6d6oR802GQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4188d3a-2889-4163-1b93-08def3314f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 20:37:03.8535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0jLraxrJ0FBOLA7k8IwXJuYe/AQ521oyKNX5CLLxTXqBNYA7joT5XYxJVs/vT0PhpOyWLDsoHGZ9RLrJO3dIH9pFaKCnoQf71abs9EtlO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8894
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

T24gVHVlLCAyMDI2LTA4LTA0IGF0IDE2OjIyIC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Og0KPiBJbiBjYXNlcyB3aGVyZSBtaW4gZnJlcXVlbmN5IHdhcyBhY3R1YWxseSBncmVhdGVyIHRo
YW4gQk1HX01JTl9GUkVRLA0KPiB3ZSB3ZXJlIG5vdCB1c2luZyB0aGUgdXBkYXRlZCBtaW4gZnJl
cXVlbmN5IGFzIHRoZXJlIHdhcyBhIG1pc3NpbmcNCj4gY2FsbCB0byBwY19hY3Rpb25fcXVlcnlf
dGFza19zdGF0ZSgpIGJldHdlZW4gdGhlIHR3byBzZXR0aW5ncyBvZg0KPiBtaW4gZnJlcXVlbmN5
LiBVc2UgdGhlIHhlX2d1Y19wY19nZXRfbWluX2ZyZXFfbG9ja2VkKCkgdmFyaWFudCB0bw0KDQpC
dXQgd2UgYXJlbid0IGRvaW5nIHRoYXQgYW55IG1vcmUgcmlnaHQ/DQoNCj4gb2J0YWluIHRoZSBm
cmVxdWVuY3kgYXMgYSBnb29kIHByYWN0aWNlLCBhbmQgY2FjaGUgdGhlIGNoYW5nZWQgdmFsdWUN
Cj4gdG8gZml4IHRoaXMgaXNzdWUuDQo+IA0KPiB2MjogcGMtPmZyZXFfcmVhZHkgaXMgbm90IHNl
dCB1bnRpbCBhZnRlciBwY19hZGp1c3RfZnJlcV9ib3VuZHMoKS4NCj4gU3RheQ0KPiB3aXRoIHBj
X2FjdGlvbl9xdWVyeV90YXNrX3N0YXRlKCkgaW5zdGVhZC4NCj4gDQo+IEZpeGVzOiBiZGRlMTZj
OWFjNWMgKCJkcm0veGUvYm1nOiBVcGRhdGUgV2FfMTQwMjIwODU4OTAiKQ0KPiBTaWduZWQtb2Zm
LWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbg0KPiA8YmFsYXN1YnJhbWFuaS52aXZla2Fu
YW5kYW5AaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5heSBCZWxnYXVta2FyIDx2aW5h
eS5iZWxnYXVta2FyQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19wYy5jIHwgMTIgKysrKysrKysrLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3BjLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMNCj4g
aW5kZXggNTlmMmZhNzlhZDQyLi4zMTA2YWM1MDgyN2MgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X3BjLmMNCj4gQEAgLTkxMSw2ICs5MTEsNyBAQCBzdGF0aWMgYm9vbCBwY19uZWVkc19taW5fZnJl
cV9jaGFuZ2Uoc3RydWN0DQo+IHhlX2d1Y19wYyAqcGMpDQo+IMKgc3RhdGljIGludCBwY19hZGp1
c3RfZnJlcV9ib3VuZHMoc3RydWN0IHhlX2d1Y19wYyAqcGMpDQo+IMKgew0KPiDCoMKgwqDCoMKg
wqDCoMKgaW50IHJldDsNCj4gK8KgwqDCoMKgwqDCoMKgdTMyIG1pbl9mcmVxOw0KPiDCoA0KPiDC
oMKgwqDCoMKgwqDCoMKgbG9ja2RlcF9hc3NlcnRfaGVsZCgmcGMtPmZyZXFfbG9jayk7DQo+IMKg
DQo+IEBAIC05MzMsOCArOTM0LDEzIEBAIHN0YXRpYyBpbnQgcGNfYWRqdXN0X2ZyZXFfYm91bmRz
KHN0cnVjdA0KPiB4ZV9ndWNfcGMgKnBjKQ0KPiDCoMKgwqDCoMKgwqDCoMKgICogU2FtZSB0aGlu
ZyBoYXBwZW5zIGZvciBTZXJ2ZXIgcGxhdGZvcm1zIHdoZXJlIG1pbiBpcw0KPiBsaXN0ZWQgYXMN
Cj4gwqDCoMKgwqDCoMKgwqDCoCAqIFJQTWF4DQo+IMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gLcKg
wqDCoMKgwqDCoMKgaWYgKHBjX2dldF9taW5fZnJlcShwYykgPiBwYy0+cnAwX2ZyZXEpDQo+ICvC
oMKgwqDCoMKgwqDCoG1pbl9mcmVxID0gcGNfZ2V0X21pbl9mcmVxKHBjKTsNCj4gK8KgwqDCoMKg
wqDCoMKgaWYgKG1pbl9mcmVxID4gcGMtPnJwMF9mcmVxKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0X21pbl9mcmVxKHBjLCBwYy0+cnAwX2ZyZXEpOw0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91dDsNCg0Kbml0OiBsaW5l
IGJyZWFrIGZvciByZWFkYWJpbGl0eQ0KDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBtaW5fZnJlcSA9IHBjLT5ycDBfZnJlcTsNCj4gK8KgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiDC
oMKgwqDCoMKgwqDCoMKgLyoNCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFNldHRpbmcgR1QgUlAgbWlu
IGZyZXF1ZW5jeSB0byAxLjJHSHogYnkgZGVmYXVsdCBmb3INCj4gQEAgLTk0Nyw4ICs5NTMsOCBA
QCBzdGF0aWMgaW50IHBjX2FkanVzdF9mcmVxX2JvdW5kcyhzdHJ1Y3QgeGVfZ3VjX3BjDQo+ICpw
YykNCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHdlIGFyZW4ndCBleHBlY3RpbmcgaGlnaCBwb3dlciBv
dXRwdXQgYWNyb3NzIGJvYXJkDQo+IMKgwqDCoMKgwqDCoMKgwqAgKg0KPiDCoMKgwqDCoMKgwqDC
oMKgICovDQo+IC3CoMKgwqDCoMKgwqDCoGlmIChwY19uZWVkc19taW5fZnJlcV9jaGFuZ2UocGMp
KQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0X21pbl9mcmVx
KHBjLCBtYXgoQk1HX01JTl9GUkVRLA0KPiBwY19nZXRfbWluX2ZyZXEocGMpKSk7DQo+ICvCoMKg
wqDCoMKgwqDCoGlmIChwY19uZWVkc19taW5fZnJlcV9jaGFuZ2UocGMpICYmIG1pbl9mcmVxIDwg
Qk1HX01JTl9GUkVRKQ0KDQpTaG91bGQgdGhpcyBiZSA8PT8NCg0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0X21pbl9mcmVxKHBjLCBCTUdfTUlOX0ZSRVEpOw0K
DQpPayBJIGRpZG4ndCBxdWl0ZSBnZXQgdGhpcy4gV2h5IGRvIHdlIHdhbnQgdG8gaWdub3JlIHRo
ZSBtaW5fZnJlcSBpZg0KaXQncyBhYm92ZSBCTUdfTUlOX0ZSRVE/IElmIHdlIGNhbGN1bGF0ZWQg
YXMgc3VjaCBlYXJsaWVyLCB3b3VsZG4ndCB3ZQ0Kd2FudCB0aGUgaGlnaGVyIHZhbHVlPyBzbyB0
aGlzIHNob3VsZCBqdXN0IGJlOg0KcGNfc2V0X21pbl9mcmVxKHBjLCBtYXgoQk1HX01JTl9GUkVR
LCBtaW5fZnJlcSk7DQoNClRoYW5rcywNClN0dWFydA0KDQo+IMKgDQo+IMKgb3V0Og0KPiDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCg0K
