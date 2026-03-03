Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B850EDEBF7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 22:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBF910E8EE;
	Tue,  3 Mar 2026 22:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LH82N+pw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C7610E8EE
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772578484; x=1804114484;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=orGMKSYulAV5OoOecKlpMQnP64sIEBBttekBCcmgWos=;
 b=LH82N+pw5NVdJtgd07fK7JLvll3aOqTJSiUgpZZ5pMQ3x6CGTzrImLhu
 Nf2vTDy73MNISziD42J+ToX6RYQwf8jzsof2EVg9Klf2Ym1BdN0d1w/ym
 OZNnooBxLxEeb4lsKFnxAYrklRL4pOamnE/CmBG9s9AZKSrlMRm7u+eqW
 cjX0AhtnADt7kYtTjxD+xk0SirwypjB5Eies8Ml54Ag+D4tXUtBep2c5Z
 qYu9xL3tZLDuPRgLQjiYWJ//j0XxGNaVGtOy6wpyjtgDx6XynnXSL+kmy
 CQl2cC1GCBgLjtrMQa5GOXag6gF1xGBheKHg2Ep6GYBObXe+JEFlvi/kC g==;
X-CSE-ConnectionGUID: 2+a57X5RT5CfrancQkW8oQ==
X-CSE-MsgGUID: TMdAGRygSAuOWIB4iJJjtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77498622"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77498622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:54:42 -0800
X-CSE-ConnectionGUID: u/wsVKAqQ6mf+IexS56OGg==
X-CSE-MsgGUID: sk5n7ByVSGqUEuSpEQ/fdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="241157215"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:54:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:54:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 14:54:42 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:54:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP61F6RiCiTwj4x4bSgQisM8j+i5FfT+ZJs+xNHqYaW3osm/gVLaL88yz8+5zHK2X1OjRaIaSPq9CoHLWa3Lq4F58rvae5OjYXmvnecGF7jqZ6kKL/eRFH0m/e+8VMVuT9HiSwyZsxk+DYYB2hNY1WGeMIDBsySXek+QBMpCmwFY42d0EULsWgSlMK/3gbQnLK4IfdgUuy+NhKE2ZLoJwBjGtM7hAJacVcnvFqnVweNxUyDML085Ackt0X6ntYCo9xFzMgZ31LE5oJOr51qbBTDgjlskZpariQJ6rzxKlvB2jD5ZU73UChMPKfxlOYm3/QmuN4hKVPyQ+LIxhNFirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orGMKSYulAV5OoOecKlpMQnP64sIEBBttekBCcmgWos=;
 b=NqIJ1uk5VVkOnVx1EkTUz1cVPCiZ4uP2yhtbPMqjtNTmnfHSULXy2voEjpOsGLourZpTm2fvLRRmnowYpPxhsi/kE5iQE7LgnrLBczrhxWRx4TwECW+YAEi+VQG+fAjWUl+1O5CGTgsfcR/+x7fQIXP05qxbB0ZSzBNf/t6x8ZCrFNsp569NBaGZskEHTsi82yxxiCUDr7PwMU49C729Hp6nr/k9sXe3xPRKtd/+xXjcYb/em6Uurw3XuJU12x51739fBtmtfczoZkQPFZW5tTh1nCcJc0i9nhBVA4EGvfTPbXtADGRVLiHZl+wzsIo7mKl+irdJOuW/+WIp6krsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 22:54:38 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 22:54:38 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Thread-Topic: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Thread-Index: AQHcqFKAUNfvNZ13i0KIe9mS5ua2BbWbu6uAgAADcwCAAZklgIAAFSMAgAADW4A=
Date: Tue, 3 Mar 2026 22:54:38 +0000
Message-ID: <1b4ec7807684fbe0f4cc6d7a83e5ae2e0bc9f4e2.camel@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-4-matthew.brost@intel.com>
 <a88781b47e972b47ee6e46a3347f6293d36d9e39.camel@intel.com>
 <aaX65nBqdWvXGmZF@lstrano-desk.jf.intel.com>
 <fd39339c6fc8461bb32fa01454754c58bb88f835.camel@intel.com>
 <aadj2K8I7Bom1vXJ@lstrano-desk.jf.intel.com>
In-Reply-To: <aadj2K8I7Bom1vXJ@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH8PR11MB6732:EE_
x-ms-office365-filtering-correlation-id: 5437307b-09dd-493f-1edd-08de7977d945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: uIKaiYsjSWI4V9rnXcPN7R+fptERzN0jdf1OL0JO3Qi00lO8u7I5T7C5jtogsbnSVhBNozrOvciwdSV2gw7TDXqbtkgCIs69Xbbpvtwp5YErbI/yWcYJz39cucMmMMyoV8tYTb11ZpNj6Ozl43Iui2mIS6H7dAdmGDJQyfmnJEYvTxhV08GiLCJ9tjABbCTsblZhNPQIkfEsNMydBFvhJ0kMPgSklst/QTWDKhawCx1jCdCLVGPizfAGRCB4EgCTogkle6mgN+mq301au/+7p8l13RLw6nuqe1Bj/rza8K/0jBaog+uxTjlA1YC27psReYMAj21lBTffxTQiRNZSb6uw8+7liwx458ARLIGz9nvseXi9+pbljaLGKxq2KbY1DQQLXqjfpUtRmjJi8hHRVGA6Rz4p/TnM2IDi3chyGCrerlmxpJtlT+EyRw48GW2qZFFKJoRcPR/a2PNAHW2XbeStsKdXR0r8BoekanJlS4uNXIqlJvt1jSZwOyDzSaGUCuCKYCV617NKw38M1SdYVnZkaEBlGnABVHXOAJW5XQYjS64XTNNPkby9iURf1h00Q44sc70GvU9awwwt/AGwh57waK140vXT9njjNScYrcl5Zbf+/Ekp4aO0Q3lMGkl6ElLDA86TLEA23Cgw0eI5Uh9XgEcREaEHs6TabspIOCBJNGCHkhSmdhy0Csk7DpRyH2DfImYWe6jIQEuaE/n320kFUON9e9GcZZWEzM7/0q57OXiALKGJx4dEaBfIGfKaHIv9N2CWJM1tIu9DfMzrRWKbWAwl5okzr8EFfaNpiIw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1ltV2dtcnkwVDgwcCtrNkIwVWZrRjJudXNFaEJrRm9SUWNlcDcyRDlIQUJa?=
 =?utf-8?B?S1MyNUJKeG9LVzg3NUhlTFBsK2E5QXl1cm5NdUgrWERFVWtwczlTSUQ0YkVG?=
 =?utf-8?B?V1VzMmNJRFhjVXMzUDdYdkVyMkU2Wk92RnpYblEycnN5Vy9tT0dEdi9JR0ZO?=
 =?utf-8?B?cTJhYU4ySjdzSVVSbFBzZ1VrTzR2RTBFUld0SFl4RVIxVnZZK0xlUm15eDho?=
 =?utf-8?B?S0VGbDBKV1dxU2ttbCtaZ08zNEUxOHZ3NDY5WityQnhiM0Y3NmpSSno5Znpy?=
 =?utf-8?B?dEt6TlFGR0tlNEpUMlpPUmJyQTBsNjh4cnJjWlJzZ2FJWkVsbGVVaWxkY0dL?=
 =?utf-8?B?cEFYUFVpMTkvblFRaHJtUkEzWnY3Z21kNitBTlVVTFNZZ0FROW42eXhBem9Y?=
 =?utf-8?B?QlJocWlHcDk4NjZXb1ZkT2gyTGFudEo3TERrcWd1TzBxdDF1WlBrcTBzcGVu?=
 =?utf-8?B?Z01XOGtnZFZpNU4rOUFqSTQyTjZRSTFNT3MvOXdvRnJCdURvQXVZbTdRNjl1?=
 =?utf-8?B?WkF5NW9JR00xUzRyNVQ1emVIVkxCWHNKMUlsMDE3eU0zYVFLZkd2cVp2dnBo?=
 =?utf-8?B?RDl6NHNHcWI0N0dCaU9vMVN2UngxVE5iMXg4TUdTVGJZZnhGalFCRmRydHp6?=
 =?utf-8?B?NnFRRlozS3RkeFJvRVZyZE5IZlRFdlQ2WlZGQk1BVW14b1NKTW5KVUorZ1E2?=
 =?utf-8?B?b2xCbkVPcEI3VmdwUnBYZ2ZxL3lJV29wWHhKZ0kzbWZsSHNIRDJyWEJYWEtZ?=
 =?utf-8?B?Y3Z3bHhNVzN6M0JyVHgyYURaZzVXMmQ4eDJ6bHp4VXhzZWZ0UUovT2pmTzBO?=
 =?utf-8?B?YkIrZVo5VE96MFZkM3FoaENrM21oSWZsTVFFUnloOUtrVlNuejQ5akdvcTBG?=
 =?utf-8?B?cW0ycHZxZzZkRHgrenZTM3hUMllIRXA5Qk4wSTh4ZmlJaGNzb3BybWhlRVVY?=
 =?utf-8?B?WWJoMVl6TTVYcC9UKzJ2NGI4MDdNakhZSjRaN0NOODE0aHQ0ckIrc1RlWVRG?=
 =?utf-8?B?SkQrSS90RlRhV3BiVUV5OXRKYUxHMVZFRGsxMmdUNFdETnZIL1h6U3J5WWVS?=
 =?utf-8?B?UXY5Tm5QcWtuOHYxQ2ljYlZqQ3lEVjh6TXgvSUhLRHh2Y2ZSdjZPemNFZ040?=
 =?utf-8?B?RG1CZFhWYndwd1ZCck4zOStNOVBtd1FnbWx6SkwveHNNSE8velNKcmo4RHVw?=
 =?utf-8?B?N0crNE9UeDRaWDdxemNkNzFqME5DUG5WR2h3dUcyN21SREVHTFkyaSs4Z3BS?=
 =?utf-8?B?OXMvV0NDZGhJOThoT2xjb204ZzF4NW5NRDB5dkduekNzUG44VlNiMzBNbFJa?=
 =?utf-8?B?a2xpSXppWHNWOWVoQ0wxQ1NweVFlN3lkcjVjRUdHSzgyZGRjT1owZ2FQdXEv?=
 =?utf-8?B?dFd6TUlmRzlPbWREWjBlT1BkMnhyMWkwdytPR1NtbG5ONmpDZC9NMTdIdnZj?=
 =?utf-8?B?cGpYZTFNMzVnNjFPOGFKMzR2dzNpZTVnT1RmNE0vUUgvazRmeXkrRmV5Q0dX?=
 =?utf-8?B?b2xHZTh1VDROZjFuKzhsV09Qa1JMUzJDOURIazlQWTNSd0p6QTBUMEdYYktJ?=
 =?utf-8?B?SHAyeDNoVlBUdElYVjBHdmZqb3AvQTBKN092MzdESloyMkEzd2w0MUw1UHJw?=
 =?utf-8?B?Tkd6Z0E3cEkxV0Ztc0M4RzVjMzBVaUxBZno4NnRwU0kyZVNNdFQzdW1IYjNH?=
 =?utf-8?B?ZnNSTmk5MGZ5Q0dYU2FMSEhEZThGSnQwRWMyYUpTT0pSbFpKM1FEc3VhWXR4?=
 =?utf-8?B?eVBMNGVUbzF4TVJZRlN2TnpnVFRxbDdjZk5helJxQ0FWdGt4YXRaVzAzUmNh?=
 =?utf-8?B?a3dSemZEUVhzVldJWGJPa0FZNFFPNEwyc1c1N2t5clp4NmFaZmd1QXJGRms4?=
 =?utf-8?B?ejFrTzFzZjkzR1grVkt4U3lDVjJpZG10QVRPYWNzRnl1ZnMyUVM4bmtrQmtY?=
 =?utf-8?B?NGRMWE04NG92MVdBNjlIU0tZbWh6MG1ZRitOK2FPWjZnVlVtWThNVGc4cXlh?=
 =?utf-8?B?T2hnQ2ZVTkRWNG1CQ1FyRUx0SzVKdG9PN2dVUHExcEc5aXc5Y0IrQXV4ZFQ2?=
 =?utf-8?B?NTB4bE1oOHo4NXFLWTNjMUNrajF3T1Jsdmp4UEVpRzA1anM4OXdWK1JqdDRV?=
 =?utf-8?B?Sk92dUEzajg3QlJwNXRhSWQ0MUNoM0JUNzBDUUhqMm9YV1VQc1FobHJFMUdo?=
 =?utf-8?B?YUtkOVZuK2IvWmdYZ1l0MXdZUlYvYkdrK3EyMVBycG8wei9GVTZOZ2dFeXZQ?=
 =?utf-8?B?UUV0TFBmLzBuWEY2LzNyMHdGbURlSGpsQmNDbVEwdzVtZzFqWk5qNTBuY1M3?=
 =?utf-8?B?QkxGMnZtRmlzY0lCdVBRWDc4WXRHSm1GODRFV3ZEL0U5VStmQUhvK3JnVVNC?=
 =?utf-8?Q?KzJYlTdM2Tx1t7L4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67D141CCC68AD94FB9C77452BAB95918@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5437307b-09dd-493f-1edd-08de7977d945
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 22:54:38.5829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONrJGELwpTi6Jn6chNR9itqZVf7WdbdquqK3ABlvnUqI+K/cCLs4FQfyEmXJbP9eLhAD3AIHIerwHbQGP/UiqN/YyoSYKD1mS3/PMHfpSkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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

T24gVHVlLCAyMDI2LTAzLTAzIGF0IDE0OjQyIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIE1hciAwMywgMjAyNiBhdCAwMjoyNjo1NlBNIC0wNzAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI2LTAzLTAyIGF0IDEzOjAyIC0wODAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIE1hciAwMiwgMjAyNiBhdCAwMTo1MDoxMVBN
IC0wNzAwLCBTdW1tZXJzLCBTdHVhcnQNCj4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBG
cmksIDIwMjYtMDItMjcgYXQgMTc6MzQgLTA4MDAsIE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4g
PiA+ID4gPiA+ID4gV2UgYWxyZWFkeSBtYWludGFpbiBhIGpvYiBjb3VudCBmb3IgZWFjaCBleGVj
IHF1ZXVlLCBzbw0KPiA+ID4gPiA+ID4gPiA+IHNpbXBsaWZ5ID4gPiA+IHRoZQ0KPiA+ID4gPiA+
ID4gPiA+IGlkbGUNCj4gPiA+ID4gPiA+ID4gPiBjaGVjayB0byByZWx5IG9uIHRoZSBqb2IgY291
bnQgcmF0aGVyIHRoYW4gdGhlIExSQw0KPiA+ID4gPiA+ID4gPiA+IHN0YXRlLg0KPiA+ID4gPiA+
ID4gPiA+IFRoaXMNCj4gPiA+ID4gPiA+ID4gPiBkZWNvdXBsZXMNCj4gPiA+ID4gPiA+ID4gPiBl
eGVjIHF1ZXVlcyBmcm9tIExSQy1iYXNlZCBiYWNrZW5kcyBhbmQgYXZvaWRzDQo+ID4gPiA+ID4g
PiA+ID4gdW5uZWNlc3NhcmlseSA+ID4gPiBjb3VwbGluZw0KPiA+ID4gPiA+ID4gPiA+IGlkbGUN
Cj4gPiA+ID4gPiA+ID4gPiBkZXRlY3Rpb24gdG8gYmFja2VuZC1zcGVjaWZpYyBpbXBsZW1lbnRh
dGlvbiBkZXRhaWxzLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gPiA+
ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWUuYyB8IDE1ICstLS0tLS0tLS0tLS0tDQo+ID4gPiA+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+
ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNCBkZWxldGlvbnMoLSkN
Cj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiA+ID4gPiA+ID4gPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNfcXVldWUuYw0KPiA+ID4gPiA+ID4gPiA+IGluZGV4IDJkMGU3M2E2YTZl
ZS4uYjNmNzAwYTlkNDI1IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+ID4gPiA+ID4gPiA+ID4gQEAgLTEzODIsMjAgKzEz
ODIsNyBAQCBib29sIHhlX2V4ZWNfcXVldWVfaXNfbHIoc3RydWN0DQo+ID4gPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gPiB4ZV9leGVjX3F1ZXVlDQo+ID4gPiA+ID4gPiA+ID4gKnEp
DQo+ID4gPiA+ID4gPiA+ID4gwqAgKi8NCj4gPiA+ID4gPiA+ID4gPiDCoGJvb2wgeGVfZXhlY19x
dWV1ZV9pc19pZGxlKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiA+ID4gPiA+ID4gPiA+IMKg
ew0KPiA+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoGlmICh4ZV9leGVjX3F1ZXVlX2lzX3Bh
cmFsbGVsKHEpKSB7DQo+ID4gPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGludCBpOw0KPiA+ID4gPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IHEtPndpZHRoOyArK2kpIHsNCj4g
PiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmICh4ZV9scmNfc2Vxbm8ocS0+bHJjW2ldKSAhPQ0KPiA+ID4gPiA+ID4gPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHEtPmxyY1tp
XS0NCj4gPiA+ID4gPiA+ID4gPiA+ZmVuY2VfY3R4Lm5leHRfc2Vxbm8NCj4gPiA+ID4gPiA+ID4g
PiAtIDEpDQo+ID4gPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiA+ID4gPiA+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+ID4gPiA+ID4gLQ0K
PiA+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1
ZTsNCj4gPiA+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+ID4gPiA+ID4gLQ0K
PiA+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoHJldHVybiB4ZV9scmNfc2Vxbm8ocS0+bHJj
WzBdKSA9PQ0KPiA+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBx
LT5scmNbMF0tPmZlbmNlX2N0eC5uZXh0X3NlcW5vIC0gMTsNCj4gPiA+ID4gPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqByZXR1cm4gIWF0b21pY19yZWFkKCZxLT5qb2JfY250KTsNCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gU3RpbGwgbG9va2luZyB0aHJvdWdoIHRoZSBzZXJpZXMsIHNvIG1pZ2h0
IGJlIGhhbmRsZWQNCj4gPiA+ID4gPiA+IGVsc2V3aGVyZSwgPiA+IGJ1dA0KPiA+ID4gPiA+ID4g
anVzdCBsb29raW5nIGF0IHRoaXMgcGF0Y2ggYWxvbmUsIEknbSBhIGxpdHRsZSB3b3JyaWVkIHRo
aXMNCj4gPiA+ID4gPiA+IHdpbGwgPiA+IGNhdXNlDQo+ID4gPiA+ID4gPiB1bmV4cGVjdGVkIGlz
c3VlcyBpbiB0aGUgZXhlYyBxdWV1ZSBjbGVhbnVwLiBUaGlzIGZ1bmN0aW9uDQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+IGN1cnJlbnRseQ0KPiA+ID4gPiA+ID4gZW5zdXJlcyB0aGF0IHRo
ZSBqb2IgaXMgaWRsZSBmcm9tIHRoZSBoYXJkd2FyZSBsZXZlbC4gVGhlDQo+ID4gPiA+ID4gPiBj
aGFuZ2UgPiA+IHlvdQ0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIGN1cnJlbnQgY2hlY2sgaXMgYWN0
dWFsbHkgaW5jb3JyZWN0IGlmLCBmb3IgZXhhbXBsZSwgYQ0KPiA+ID4gPiBxdWV1ZSBpcw0KPiA+
ID4gPiByZXNldCBhbmQgdGhlIExSQyBoZWFkICE9IHRhaWwuIEhvd2V2ZXIsIEkgYmVsaWV2ZSB0
aGUgb25seQ0KPiA+ID4gPiBwbGFjZXMNCj4gPiA+ID4gd2UNCj4gPiA+ID4gdXNlIHhlX2V4ZWNf
cXVldWVfaXNfaWRsZSBhcmUgY2FzZXMgd2hlcmUgYSBxdWV1ZSBoYXNu4oCZdCBiZWVuDQo+ID4g
PiA+IHJlc2V0LCA+IHNvDQo+ID4gPiA+IGl0IGhhcHBlbnMgdG8gd29yayBpbiBwcmFjdGljZS4g
SXTigJlzIGFsc28ganVzdCBhbiBhZHZpc29yeQ0KPiA+ID4gPiBjaGVjaywNCj4gPiA+ID4gc28N
Cj4gPiA+ID4gbm90aGluZyBiYWQgaGFwcGVucyBpZiBpdCBpbmNvcnJlY3RseSByZXBvcnRzIOKA
nG5vdCBpZGxlIi4NCj4gPiANCj4gPiBTbyByZXNldCBjYXNlIGFzaWRlICh3aGljaCBub3QgdGFr
aW5nIGludG8gY29uc2lkZXJhdGlvbiBhbnl0aGluZw0KPiA+IHlvdQ0KPiA+IHNhaWQgYmVsb3cg
OikgSSdkIGNvbnNpZGVyIGEgYnVnIGhlcmUpLCBpdCBkb2VzIGdpdmUgYSBmYWxzZSBzZW5zZQ0K
PiA+IG9mDQo+ID4gdGhpbmdzIGJlaW5nIGFjdHVhbGx5IGlkbGUgb24gdGhlIGhhcmR3YXJlIElN
TyB0aGF0IG1pZ2h0IGJlDQo+ID4gZXh0ZW5kZWQNCj4gPiBvdXQgdG8gb3RoZXIgYXJlYXMgd2l0
aG91dCByZWFsaXppbmcgaW4gdGhlIGZ1dHVyZS4gSSBhZ3JlZSB0aGF0DQo+ID4gdGhlDQo+ID4g
Y3VycmVudCB1c2UgY2FzZXMgbWF0Y2ggd2hhdCB5b3Ugc2FpZC4NCj4gPiANCj4gDQo+IFllcywg
c28gSSB3b3VsZCBzYXkgdGhpcyBwYXRjaCBpcyBhY3R1YWxseSBpbXByb3ZpbmcgdGhpbmdzIGFu
ZA0KPiBvcGVuaW5nDQo+IHVwIHRoaXMgZnVuY3Rpb24gdG8gb3RoZXIgcG9zc2libGUgdXNlIGNh
c2VzLg0KDQpBZ3JlZWQuLg0KDQo+IA0KPiA+ID4gPiANCj4gPiA+ID4gPiA+IG1ha2UgaGVyZSBt
b3ZlcyB0aGF0IHRvIGEgc29mdHdhcmUgbGV2ZWwgY2hlY2suIEFuZCB0aGlzIGlzDQo+ID4gPiA+
ID4gPiBnZXR0aW5nDQo+ID4gPiA+ID4gPiBkZWNyZW1lbnRlZCBhbmQgY2hlY2tlZCBiZWZvcmUg
d2UgdGVhciBkb3duIHRoZSBleGVjIHF1ZXVlLg0KPiA+ID4gPiA+ID4gU28NCj4gPiA+ID4gPiA+
IHByZXN1bWFibHksIEd1QyBhbmQgdGhlIGNvbW1hbmQgc3RyZWFtZXIgY291bGQgc3RpbGwgYmUN
Cj4gPiA+ID4gPiA+IGRvaW5nID4NCj4gPiA+ID4gPiA+ID4gc29tZXRoaW5nDQo+ID4gPiA+ID4g
PiBoZXJlIGFuZCB3ZSdyZSBmYWxzZWx5IHRlbGxpbmcgb3RoZXIgcGFydHMgb2YgdGhlIGRyaXZl
cg0KPiA+ID4gPiA+ID4gdGhhdA0KPiA+ID4gPiA+ID4gcmVseSA+ID4gb24NCj4gPiA+ID4gPiA+
IHRoZSBlbmdpbmUgdG8gcmVhbGx5IGJlIGlkbGUgdG8gdHJ1c3QgdXMgaGVyZS4NCj4gPiA+ID4g
PiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gU2VlIGFib3ZlIGZvciBwYXJ0IG9mIHRoZSBleHBsYW5h
dGlvbiwgYnV0IHRoZSBvdGhlciBwYXJ0DQo+ID4gPiA+IGludm9sdmVzDQo+ID4gPiA+IHJlZmVy
ZW5jZSBjb3VudGluZyBhbmQgZmVuY2Ugc2lnbmFsaW5nLiBBIGpvYiBjYW4gb25seSBoYXZlIGl0
cw0KPiA+ID4gPiBsYXN0DQo+ID4gPiA+IHJlZmVyZW5jZSBkcm9wcGVkIHdoZW4gaXRzIGZlbmNl
IGlzIHNpZ25hbGVkLg0KPiA+ID4gPiANCj4gPiA+ID4gQSBmZW5jZSBjYW4gb25seSBzaWduYWwg
dW5kZXIgdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOg0KPiA+ID4gPiANCj4gPiA+ID4gLSBJdHMg
c2Vxbm8gaXMgaW5jcmVtZW50ZWQgdmlhIHJpbmcgaW5zdHJ1Y3Rpb25zICh3aGljaA0KPiA+ID4g
PiBjb3JyZXNwb25kcw0KPiA+ID4gPiA+IHRvDQo+ID4gPiA+IMKgIHRoZSBMUkMgaGVhZCA9PSB0
YWlsIGlmIGl04oCZcyB0aGUgbGFzdCBqb2Igb24gdGhlIHF1ZXVlKS4NCj4gPiANCj4gPiBSaWdo
dCwgc28gdGVjaG5pY2FsbHkgSSBndWVzcyB3ZSBjb3VsZCBoYXZlIGEgaGFyZHdhcmUgaGFuZyBh
ZnRlcg0KPiA+IHRoZQ0KPiA+IHNlcXVlbmNlIG51bWJlciB3YXMgd3JpdHRlbiBzaW5jZSB0aGF0
IGlzbid0IHRoZSBsYXN0IGluc3RydWN0aW9uDQo+ID4gdGhlcmUsIGJ1dCBzZWVtcyB2ZXJ5IHVu
bGlrZWx5LiBBbmQgaWYgd2UgZGlkIGhpdCB0aGF0IGNhc2UsIHRoZQ0KPiA+IHJlc2V0DQo+ID4g
aGFuZGxlciB3b3VsZCBjb3ZlciB0aGF0Lg0KPiA+IA0KPiA+IE1heWJlIHRoaXMgc2hvdWxkIGJl
IG9idmlvdXMuLi4gYnV0IGp1c3Qgc28gSSdtIG5vdCBtaXNzaW5nDQo+ID4gc29tZXRoaW5nDQo+
ID4gaGVyZS4uDQo+ID4gDQo+ID4gU28gSSB0aGluayB0aGUgc2lnbmFsaW5nIGhlcmUgd2UncmUg
dGFsa2luZyBhYm91dCBpcyB2aWEgdGhlDQo+ID4gTUlfVVNFUl9JTlQgaW46DQo+ID4geGVfaHdf
ZW5naW5lX2hhbmRsZV9pcnEgLT4geGVfaHdfZmVuY2VfcnFfcnVuDQo+IA0KPiBUaGlzIGlzIHdo
ZXJlIGZlbmNlcyBhcmUgc2lnbmFsZWQgb3IgaWYgd2UgdGltZSB0aGVtIG91dCBpbg0KPiBndWNf
ZXhlY19xdWV1ZV90aW1lZG91dF9qb2IgdmlhIHhlX3NjaGVkX2pvYl9zZXRfZXJyb3IuDQoNCkFo
IHJpZ2h0Li4NCg0KPiANCj4gPiANCj4gPiBBbmQgdGhhdCBkZXBlbmRlbmN5IHlvdSdyZSB0YWxr
aW5nIGFib3V0IGlzIGhlcmUgKHhlX2V4ZWMsIGFsdGhvdWdoDQo+ID4gSQ0KPiA+IGtub3cgdGhl
cmUgYXJlIGEgZmV3IGluIHhlX21pZ3JhdGUsIHhlX3B0LCBldGMpPw0KPiA+IMKgwqDCoMKgwqDC
oMKgIC8qIFdhaXQgYmVoaW5kIHJlYmluZHMgKi8NCj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoIXhl
X3ZtX2luX2xyX21vZGUodm0pKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGVyciA9IHhlX3NjaGVkX2pvYl9hZGRfZGVwcyhqb2IsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgeGVfdm1fcmVzdih2bSksDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRE1BX1JFU1ZfVVNBR0VfS0VSTkVMKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGVycikNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZXJyX3B1dF9qb2I7DQo+ID4gwqDCoMKgwqDCoMKgwqAgfQ0KPiA+
IA0KPiA+IFdoYXQgaXMgdGhlIGV4cGVjdGF0aW9uIGZvciBMUiBqb2JzPw0KPiA+IA0KPiANCj4g
VGhpcyBpcyBjb21wbGV0ZWx5IHVucmVsYXRlZCBidXQgaW4gZG1hLWZlbmNlIG1vZGUNCj4gKCF4
ZV92bV9pbl9scl9tb2RlKQ0KPiB3ZSBjYW4ndCBmYXVsdCB0aGUgZGV2aWNlIHNvIHdlIGlzc3Vl
IHJlYmluZHMgaW4gdGhlIGN1cnJlbnQgZXhlYw0KPiBJT0NUTCBmb3IgYW55dGhpbmcgdGhhdCBt
b3ZlZCBzaW5jZSB0aGUgbGFzdCBleGVjIElPQ1RMIC0gdGhpcw0KPiBvcmRlcmluZw0KPiBleGVj
IElPQ1RMIHN1Ym1pc3Npb24gYmVoaW5kIG1vdmluZyBtZW1vcnkgYmFjayBpbnRvIHBsYWNlICsN
Cj4gcmViaW5kaW5nDQo+IGl0Lg0KPiANCj4gTFIgbW9kZSB3ZSBlaXRoZXI6DQo+IMKgLSBSZWJp
bmQgaW4gcHJlZW1wdCByZWJpbmQgd29ya2VyDQo+IMKgLSBMZXQgdGhlIGRldmljZSB0YWtlIGEg
cGFnZSBmYXVsdCBhbmQgcmViaW5kDQo+IA0KPiBCZWNhdXNlIG9mIHRoaXMgd2UgZG9uJ3QgZXZl
biB0YWtlIHRoZSBkbWEtcmVzdiBsb2NrIGZvciBMUiBWTXMgaW4NCj4gdGhlDQo+IGV4ZWMgSU9D
VEwuDQoNClllYWggb2sgbWFrZXMgc2Vuc2UgYW5kIEkgYXBwcmVjaWF0ZSB0aGUgZXhwbGFuYXRp
b24gOikNCg0KQW55d2F5IEkgdGhpbmsgd2l0aCB0aGF0IEkgYWdyZWUgd2l0aCB0aGUgZGlyZWN0
aW9uIGhlcmUuDQoNClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNA
aW50ZWwuY29tPg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dCANCj4gDQo+ID4gVGhh
bmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4gPiAtIFdlIHRpbWUgb3V0IGpvYnMgb24gdGhl
IHF1ZXVlIGFuZCBzaWduYWwgdGhlaXIgZmVuY2VzIGluDQo+ID4gPiA+IHNvZnR3YXJlLiA+IFdl
DQo+ID4gPiA+IMKgIG9ubHkgc2lnbmFsIGZlbmNlcyBpbiBzb2Z0d2FyZSBvbmNlIHRoZSBxdWV1
ZSBoYXMgYmVlbiBraWNrZWQNCj4gPiA+ID4gb2ZmDQo+ID4gPiA+ID4gdGhlDQo+ID4gPiA+IMKg
IGhhcmR3YXJlIChpLmUuLCBzY2hlZHVsaW5nLWRpc2FibGUgSDJHIHRyaWdnZXJzIGEgRzJIDQo+
ID4gPiA+IHJlc3BvbnNlKS4NCj4gPiA+ID4gDQo+ID4gPiA+ID4gPiBGb3IgcmVmZXJlbmNlLCBJ
J20gbG9va2luZyBhdCB4ZV9zY2hlZF9qb2JfZGVzdHJveSgpIHdoZXJlDQo+ID4gPiA+ID4gPiB3
ZQ0KPiA+ID4gPiA+ID4gZG8gPiA+IHRoZQ0KPiA+ID4gPiA+ID4gZGVjcmVtZW50IGFuZCB0aGVu
IHRoZSBleGVjIHF1ZXVlIHB1dC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gU28gbXkgcXVl
c3Rpb24gaXMsIGhvdyBhcmUgd2UgZ3VhcmFudGVlaW5nIHRoYXQgaGFyZHdhcmUgaXMNCj4gPiA+
ID4gPiA+IGluZGVlZCA+ID4gaWRsZQ0KPiA+ID4gPiA+ID4gYWZ0ZXIgdGhpcyBjaGFuZ2U/IEFy
ZSB3ZSBtb3ZpbmcgdGhlIHNlcXVlbmNlIG51bWJlciBjaGVjaw0KPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiBzb21ld2hlcmUNCj4gPiA+ID4gPiA+IGVsc2U/DQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gDQo+ID4gPiA+IEkgdGhpbmsgYWJvdmUgZXhwbGFpbnMgdGhpcy4NCj4gPiA+ID4gDQo+
ID4gPiA+IE1hdHQNCj4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGFua3MsDQo+ID4gPiA+ID4gPiBT
dHVhcnQNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IMKgfQ0KPiA+ID4gPiA+ID4gPiA+
IMKgDQo+ID4gPiA+ID4gPiA+ID4gwqAvKioNCj4gPiA+ID4gPiA+IA0KPiA+IA0KDQo=
