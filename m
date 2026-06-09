Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B71CD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 19:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA21C10E601;
	Tue,  9 Jun 2026 19:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LidAOP0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38FC10E601
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 19:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781034870; x=1812570870;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HTQYwh5k1LXFGOEH1hc9zRIzCgpL+1ENUU57i4SqEfw=;
 b=LidAOP0djPppcPPIfzrbKHoYDkYCw8zWBhu4IY+7uFbhFNB//Xp+pTyK
 ZvKnV5O2BB7O05nY1j+7F82zPNqIjN4X/Dah4+Pwe/f5kx5JuUyJozTbM
 ymSo8s31/kY1sfcoag1Kv0J28ZldnAJicu7X+YeSvcTFA7XcpWmzihjT3
 o1cWJBEd8s6RfLbpGrpmJeqUuwaodERicmnl1ygOiC9BnIakJZRq8shbn
 zwyHJpF/1H2cGUBIXM2u2O5AaMe7k1plzqdIlda4xTyrtQ3vscL8PRaCe
 nztx4L55KCdGEZYdAQq5NCzq+v/vS6jeLcMnXWIAPcuv91aef8vyh85M6 w==;
X-CSE-ConnectionGUID: pY2gDLnDQ8OX2Y2oErY4pQ==
X-CSE-MsgGUID: xSrONxJDTxWxlNhNj3ORcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80831217"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="80831217"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 12:54:29 -0700
X-CSE-ConnectionGUID: SiymEHIpSr2habj6HCZvrQ==
X-CSE-MsgGUID: uzfQEx9HRJyw0K9PhdHSHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="241532199"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 12:54:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 12:54:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 12:54:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 12:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUlEdo5MCKPapbH2o7dj3qKiJnkONJpR67WVddYsFHxEipfv7s3eK8XrKC+LpFP/R0KHVUOuGhbwsvp+NdBvoAXScKaGwmDWbnFyhnpH9cQRlg1bSrmHD8kGsG78DwvgB1fsQcoRPzcZBIy6FQe7N0DX2zksALpNRfOEcHEjM6sqLBfpQdafHdkXPpr+DpFf95XoVkqRjcSMQByp2I9NnkCHOIdUlFtayhrJ4CoWss5tcUkVR/pdvB/zABGcUyzXdybfBmdpQVcK9soaZrL+0Rh2Ev9CNTrr/ufn8BYOaZiaZyGSlGl4vHZ0u+U3Xphe05Uxdvf4f7/RR8ixNOp0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTQYwh5k1LXFGOEH1hc9zRIzCgpL+1ENUU57i4SqEfw=;
 b=ZlUeRPjh90xteLs9hOc+5JyJfHNPoFD1u/VkfIdDgY/GFeEKc252iEYQHwcDg97yeycq66IMHCFGQUKwoEX5Iu2MxItvhOignGqmtQengK1O/y+xsgL29XVB+v+y9R4495fp0fI4ZSvG4/+S/negWdTEp5zg3zhkGtwbHbmglFrYzxIF18jrvVa282d9TZ35ldtOH5BO9PHvK8behjXYugjB4tpjrKWyKztgbH3IRm72z9RHWtQqxKRwfh4G/AYiMUpBx1wreXeLUPiNCJ4+5vLVUT7zzfo3i6n5/4AKENd5ZLYnQ/dkG7k733Gian64YXrpPxGK4oBc4NXMmDQ+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.11; Tue, 9 Jun 2026 19:54:24 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 19:54:24 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>
Subject: Re: [PATCH 06/12] drm/xe: Change MSI-X assignment failure to drm_dbg
Thread-Topic: [PATCH 06/12] drm/xe: Change MSI-X assignment failure to drm_dbg
Thread-Index: AQHc9UIJDkKe0UNEUEeNUVBknI3WULYxW/4AgAPEqYCAAYhdAA==
Date: Tue, 9 Jun 2026 19:54:24 +0000
Message-ID: <9e0e791fce3bfb5915c671cb5e949be796db439b.camel@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
 <20260605232108.674580-20-stuart.summers@intel.com>
 <afff928e-6e5f-45a7-999b-b9eb1e9f499a@intel.com>
 <bbe7a8d32e75b7263994c93eb2b3a0c714eb3714.camel@intel.com>
In-Reply-To: <bbe7a8d32e75b7263994c93eb2b3a0c714eb3714.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS7PR11MB6296:EE_
x-ms-office365-filtering-correlation-id: 16e316b0-5cf8-4e4d-0974-08dec660e81a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|4143699003|11063799006|6133799003|56012099006;
x-microsoft-antispam-message-info: PXqa0jhAPQujx/K/4WL1o5w+WOiKQpgh3a5b75dlwjkO3mP2lauUxbQVA49b8fHEXWvH8QNhbL47EHs3lJJnE1mIZzYsvaffccrNmXcvS6QXz5a5sef+H3fMUmg+sJT5ANbrMxoEyVO7Mc6wncVi/81hYiTjwPqtxxFu18zDnRmOlIPQsxMPxuWqs7VZ10HZN0XhwqTHYt3RnaNKj84+Z03JoRxqZ5L/fEUBOOFLMRYoZAkBCCFrpNNL6UfmgI/96tKpTULA9DlKb2cecDYU7ZeCHDPYUDhSA7M5fXBf7XP2lw5LuDVAk4bLYkoJ3kZlhOpBy1VHhI9xI47Tc0adtxxkj2yeEepXghxK40enmbgq8sRZREJ58/qNiIHGlSPZ16OBS8ONl2hgvWAmKyg1FmCYUsXDfIBNiPiEiLtgnb8CL9Z5UU9ediifk0/GFMyhbNpPoHKIvAO5ogcd6AaYXSLXfzTzJgMLzEPPV66kF2vkT1MsBb/XcNBlSzEPZXB+Kq35WhhZzeh6zh658N8NgtEKB6wphIF/wm52wQW0lMhwA7UcMP+LVUsg2tn912Y95NODJI0PO/JKECWEC/LF6aHg0M+UjSBwKWqYr1sSPni60KDKaqtAz62C5L+MRSQ2ykSxFt5KDEOOS+aSlqsqvbjSZSmCHMoFDMdRONom+xMrHUorh0CHJAHAo9SVUDzLiqmg06RscvWYUDDCkSpU3H125EUVxRsWPJuwQqfUdUIPCw+yJO7zkacmm/ytWi0L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTM4WUdVUW84SElYMjNFeTgrd0ZPK09GUW1GRHpxdFVMb1NXdkZndFFCazgy?=
 =?utf-8?B?ZXN0Q1orQUg3QVBrRXVTVEQyOEdHMGl6NkdkVXdCZnh4aGxZVmQ4cHl2MGFG?=
 =?utf-8?B?cFlONnp4WDd4SS9wNC8vYTUzbC9wWWFEdkNYV21qWStHSStGalNmYTQyNDhN?=
 =?utf-8?B?WmNXdTVKeXI5RndEenNPSjFUM1hjN3VaVWVCOGMrMS8rZjBIRHJxRGduWGda?=
 =?utf-8?B?UzZLSVlTTFFBdzNrMFZKdGNEVXZRaWJUMkNuUC9tc3gzajRRVytseXJHZ05t?=
 =?utf-8?B?aS9mUzN6YUVxN1VsZWYwSDZJUHRFMDNnUGdQVDNNem9HVkw1UEhNalc2blg3?=
 =?utf-8?B?aSsxN0VaNkxyYnRhTGtlU2tSY2RVdkxkQkNuNldWUURtRVVUSnAwd1M1VlZn?=
 =?utf-8?B?Mms1MjNMYk1OUlRRMGtISTZVZGIxOUlibHdiMjFpR2FOTXpieDNkWWtiVFk1?=
 =?utf-8?B?ZDVTT2cvbWFKWkM1NEtxWEJFaVBMZlJDekZlTnJKNzVDcC9kOXVnMFA2S3h2?=
 =?utf-8?B?ZXB1K2FzanlpUzMvaEZ3WEQ0QzZmRDlQWGcxNUNRS1UrMExMUVpaaHJNUlhF?=
 =?utf-8?B?eTJGT0EvZDAzcGZzVDNjY3lNVzBnbFRtclFUQzNzME1RVi85SlN4WVQwaCtn?=
 =?utf-8?B?aVAva0JtZHIvZUc4U2lOODlKK2FBclBsWjJkRFRpZGR2TldlWU9NemxlcENH?=
 =?utf-8?B?bE9xbzZXb3BPN1pUY1E2SDdDc3h4SDBPYjdPanNkNDdxb1Ftb0tUbXA4a3hX?=
 =?utf-8?B?NnpBM2NjdmNBSDZZMThJWWhxaGliL05FekZvWTJNYlU5bEwxcU9ja2FsSXEz?=
 =?utf-8?B?QThNQVJib2NZNUY3ZTg0Y0IyeUROc0NtOFRmNVhFSCtMazVkVGVRRUhzT1Ey?=
 =?utf-8?B?TW03V0ozWitzeUgyZVY3VHNNYjE3Wjhtd1dHZ0UxNFRVblhvS2RIS2lSU2Fs?=
 =?utf-8?B?eStXSFpYYjU3NnQ0NGFia242T3IrWmN3VUZOQVUxbzMzMTY3YmhtQ0hOeXAy?=
 =?utf-8?B?aDkzajNLQ0hGMkNHZ2hDbUk5YmNWMCtwcEtiVTN6YWhPWjhvSFdzNFM5cVBR?=
 =?utf-8?B?d3lSQ2hqUjVwQVg4bUFzOW5hazJ0cWpSVDZ2U3J5VjhQWkJDSXBsUFJCWDNm?=
 =?utf-8?B?S1FrMFZuTTk1eTduK1hFbms4WEllV3N6UkdoY3gzV0x1VmEwUi9HOElMa2d2?=
 =?utf-8?B?TXoxSnV4MVZEYVNhOVkxRE5pMytPY09ZNjdKRFdmalhBVjdNOG1MaDZ6TlhM?=
 =?utf-8?B?a0N3Y1pvYlo2Zkh5am9GZFBuYlhqaDVPYVBDRzA2bzdvK3FUdXJodTl3UXVj?=
 =?utf-8?B?OXdHanE3Q3E3aTBwT2pYdVhoYWRiQ01hRjBCTG9Hc0ZWVkdkSDYxUHBYeU5a?=
 =?utf-8?B?bTkwOEFLMEFmYjhNREw2ci9YWHZ1U1ZsdVhDaWNSZHZsMml6NTJVVGQ0T3Nu?=
 =?utf-8?B?OENrdjN5WVFnWFQ5aXRvSlA5c3hjbnFOTlNjaEtDWm5EWVBEVHpKVmtrS1ZF?=
 =?utf-8?B?WDZHU21SYkhBOCtOckkyU0tZM2tNYmgwK2lidlRvUU84VUo5SUgzVW1yK1pY?=
 =?utf-8?B?bHV1R2dKV3ZUMzBheGFoOGxrK2tuVm0rM0RTOU52eUZ4dXlyOGZQRWRRbEpu?=
 =?utf-8?B?VFU1QW8xNzcwOU5QUyt0UG90T1k4U3hPcUpOSGtLYjlXLzBVb3NRRXg4cTF1?=
 =?utf-8?B?Z0F4WVBvelZkcTZZdnY5ZEJFYXBuOGxHQ2pQNjRqZFF2R2ZJcjBVRGQ0MEV0?=
 =?utf-8?B?V2k1OWJYQVNHaDR5L1hzYWtLL1p3UDR2SmFmVytTYlJ1R1E3MHlQc2ZqRlhV?=
 =?utf-8?B?cXFObDJiWWt3MGZpbnloQ1RUTHZEb2pFWVFmMmZoRCtEYWN5QkNXRXN0dDlz?=
 =?utf-8?B?ODhVQkZKR1VJclRycS9RZWlaWkR6RjMxdGs2cUx3VEgxSjVoY0hyeTgzUklE?=
 =?utf-8?B?K3R3ZVdIcG9Lc1JNNjlSUjFrbzFyNVRDS1g4M0toUEU2QjlzdTFEbHNhb3RE?=
 =?utf-8?B?ZnJyY251ZjB2Q2pQUTh3QUhBRndlbUxsMGw3Tlo4K2FTbXgvdk9DalNob3Vj?=
 =?utf-8?B?aXZtOURoYmtWQnAwZVpIRzN4R0J3Q0Y0M2U5TzNFSHdrMUJ4NzJVZGF5bzZO?=
 =?utf-8?B?TlBMNHVZUHFlRHR1LzlVN2JsWDhlVUsvY3BpSjBEYWhuak1GcjlONnN1ZGdm?=
 =?utf-8?B?aXRLeTBialFVbURLaHh4aEVxRCtpcDBPaGNSdk5YYjNiUkR1SnNBTzZNWGs5?=
 =?utf-8?B?VC85YkprN1dYREdlZlQzNEcwakR5MWhxZjdBWjR1Mld6bFRHcEc5aEJFMzRt?=
 =?utf-8?B?b3N5ZFRJc1pyUmJKQy9OejJhbnR0cjQxTTdRKzRWSjA3YUdFTzFFZlNwbndV?=
 =?utf-8?Q?GdjRRQPLdsB+pvVw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <764E10B0F7AA9D44B5539EDF81C33822@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OSYgTxAcODDFCAdbE46PbiXga9BXtbypm9IZhiGDjI5VkCeaeNrOV9kFkJ2h8d5pAeG8PHY7oUdQ4aFjBlpJ0Ia9NNZNM5UUxd9ufd3TtpLgmXFw6XbuYTAuNk9jtnM1v0fAcqJWw1AeXsBWgCMoEVv9XhodvkqX2nGsl3/yCqOKLsc8r4a9ikwY3ffc31FSWG8z3bwzxC0r+uGaG/mmnepRPOg9Y9vRZ7BxnlPPj7fiv056D29aDac71rXOYAWGuVMIZCStZQ6byd+6BZQsFpq8Tehs41lp+aE3ZTA4XcNCdU/jwyVFw8GA16U1hwQcGKOpHlfWvCbIs7Sqw+HhLA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e316b0-5cf8-4e4d-0974-08dec660e81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 19:54:24.5952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHeay/6Uf+sM1KSC1SzeAvFzuProCWhgCrPeUdBh7hAzg1qGiOqbMKKLzC0KYWtb+BUgahs/F37kHUaYfvJ/lNNs1Dzio3JhShGJH/6xfrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
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

T24gTW9uLCAyMDI2LTA2LTA4IGF0IDIwOjMwICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFNhdCwgMjAyNi0wNi0wNiBhdCAxMjo1NyArMDIwMCwgTWljaGFsIFdhamRlY3prbyB3
cm90ZToNCj4gPiANCj4gPiANCj4gPiBPbiA2LzYvMjAyNiAxOjIxIEFNLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiA+IE5vdyB0aGF0IHdlIGhhdmUgcXVldWUgYmFzZWQgTVNJLVggdmVjdG9y
cyBhbmQgYSB1c2VyDQo+ID4gPiBjYW4gcG90ZW50aWFsbHkgY3JlYXRlIG1vcmUgcXVldWVzIHRo
YW4gd2UgaGF2ZSB2ZWN0b3JzDQo+ID4gPiBhdmFpbGFibGUsIGRvbid0IHNwYW0gZG1lc2cgd2l0
aCBkcm1fZXJyIG1lc3NhZ2VzIGZvcg0KPiA+ID4gZXZlcnkgZmFpbHVyZS4gQ2hhbmdlIHRoYXQg
dG8gYSBkcm1fZGJnIGluc3RlYWQuDQo+ID4gDQo+ID4gb3IgbWF5YmUgd2Ugc2hvdWxkIHVzZSBf
cmF0ZWxpbWl0ZWQgb3IgX29uY2UgdmFyaWFudHMgdG8NCj4gPiBzdGlsbCBoYXZlIHNvbWUgaW5z
aWdodHMgYWJvdXQgdGhlIGZhaWx1cmVzIChhcyBkcm0uZGVidWcNCj4gPiBjb3VsZCBiZSBkaXNh
YmxlZCkNCj4gPiANCj4gPiB1bmxlc3Mgd2UgZG8gaGF2ZSBhIGZhbGxiYWNrIHBsYW4gaW4gY2Fz
ZSBvZiBzdWNoIGVycm9ycw0KPiA+IGFuZCBjYW4gcmVjb3ZlciAtIGJ1dCB0aGVuIHdlIGxpa2Vs
eSBzaG91bGQgbWVudGlvbiB0aGF0DQo+ID4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlDQo+IA0KPiBS
aWdodCBpdCBpc24ndCBhbiBlcnJvciBwZXItc2F5IGluIHRoaXMgY2FzZSB3aGljaCBpcyB3aHkg
SSB3ZW50IHRoaXMNCj4gZGlyZWN0aW9uLiBJZiB0aGUgdmVjdG9ycyBhcmVuJ3QgYXZhaWxhYmxl
LCBpdCBqdXN0IGZhbGxzIGJhY2sgdG8gdGhlDQo+IGRlZmF1bHQgb25lICh2ZWN0b3IgMSkuIFdl
IGNhbiBzd2l0Y2ggdG8gdXNpbmcgcmF0ZWxpbWl0IGlmIHRoYXQNCj4gbWFrZXMNCj4gbW9yZSBz
ZW5zZSBoZXJlIHRob3VnaC4gSSBqdXN0IGRpZG4ndCB3YW50IHRvIG92ZXJsb2FkIGZvciBhIHZh
bGlkDQo+IHNjZW5hcmlvIHVzZXJzIG1pZ2h0IGhpdC4NCg0KT2sgYW5kIEknbSByZWFsaXppbmcg
dGhpcyBpc24ndCB0aGUgcmlnaHQgcGxhY2UgdG8gYmUgbWFraW5nIHRoaXMNCmNoYW5nZSBlaXRo
ZXIgc2luY2UgdGhpcyBpcyB0aGUgbXNpIHJlbGF0ZWQgZnVuY3Rpb24uIEFuZCB0YWtpbmcgYQ0K
Y2xvc2VyIGxvb2ssIHdlIHJlYWxseSBhY3R1YWxseSBzaG91bGRuJ3QgZXZlciBnZXQgaGVyZSBi
ZWNhdXNlIHdlDQp3b3VsZCBwcmV2ZW50IGFkZGluZyB0aGUgaXJxIHdpdGg6DQogICAgICAgIGlm
ICghYXRvbWljX2FkZF91bmxlc3MoJnhlLT5pcnEubXNpeC52ZWNfY291bnQsIDEsDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgeGUtPmlycS5tc2l4Lm52ZWMpKQ0KDQpJIHRoaW5rIEkg
aGFkIHRoaXMgZnJvbSBwcmlvciB0byB0aGUgbWF4IHZlYyBjb3VudCB0cmFja2luZyBsaWtlIHRo
aXMuDQpJJ20gZ29pbmcgdG8gZHJvcCB0aGlzIGNoYW5nZSBmb3Igbm93LiBTb3JyeSBmb3IgdGhl
IG5vaXNlIGhlcmUuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29t
Pg0KPiA+ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLXNvbm5ldC00LjYNCj4gPiA+IC0t
LQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMgfCAyICstDQo+ID4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KPiA+ID4gaW5kZXggNDBkM2Q0M2U0OTJmLi44NzFjNmM1
YzRmYWMgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYw0KPiA+ID4gQEAgLTc2OCw3ICs3
NjgsNyBAQCBzdGF0aWMgaW50IHhlX2lycV9tc2lfcmVxdWVzdF9pcnFzKHN0cnVjdA0KPiA+ID4g
eGVfZGV2aWNlICp4ZSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpcnEgPSBwY2lfaXJxX3ZlY3Rv
cihwZGV2LCAwKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBlcnIgPSByZXF1ZXN0X2lycShpcnEs
IGlycV9oYW5kbGVyLCBJUlFGX1NIQVJFRCwNCj4gPiA+IERSSVZFUl9OQU1FLCB4ZSk7DQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVyciA8IDApIHsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBkcm1fZXJyKCZ4ZS0+ZHJtLCAiRmFpbGVkIHRvIHJlcXVlc3QgTVNJIElS
UQ0KPiA+ID4gJWRcbiIsDQo+ID4gPiBlcnIpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRybV9kYmcoJnhlLT5kcm0sICJGYWlsZWQgdG8gcmVxdWVzdCBNU0kgSVJRDQo+
ID4gPiAlZFxuIiwNCj4gPiA+IGVycik7DQo+ID4gDQo+ID4gbml0OiB3ZSBjYW4gdXNlIHhlX2Ri
Zyh4ZSwgLi4uKQ0KPiA+IG5pdDogd2UgY2FuIHByaW50IGVycm9yIGNvZGUgdXNpbmcgJXBlDQo+
IA0KPiBHb3QgaXQgYW5kIG1ha2VzIHNlbnNlLiBJJ2xsIGZpeCBpdC4NCj4gDQo+ID4gDQo+ID4g
YnR3LCBtYXliZSBpdCdzIGFsc28gYSB0aW1lIHRvIGNvbnNpZGVyIGRldm1fcmVxdWVzdF9pcnEo
KSBzb21lZGF5DQo+ID4gPw0KPiANCj4gWWVhaCB0aGF0J3Mgbm90IGEgYmFkIGlkZWEuIEl0J3Mg
anVzdCBkb2luZyB3aGF0IHBjaV9yZXF1ZXN0X2lycSBkb2VzDQo+IGJ1dCB3aXRoIGNsZWFudXAg
YW5kIGVycm9yIGhhbmRsaW5nLiBCdXQgSSdkIHJhdGhlciBub3QgaW5jbHVkZSB0aGF0DQo+IGNo
YW5nZSBhcyBwYXJ0IG9mIHRoaXMgb25lIGlmIHBvc3NpYmxlLg0KPiANCj4gVGhhbmtzLA0KPiBT
dHVhcnQNCj4gDQo+ID4gDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBlcnI7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gwqANCj4gPiANCj4gDQoN
Cg==
