Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C49DC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C6510F1A8;
	Wed,  2 Sep 2026 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQ8j9xa3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9D710F1A6;
 Wed,  2 Sep 2026 12:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788351865; x=1819887865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GSwgZ7p7eiM6ccUTCrL3ArD7MPWUKd5dYd9WLIntWXQ=;
 b=BQ8j9xa3lqI7atuM59oWqzlLxpTivO/+ASQmcS80KCxEAIsP8RGlzTlH
 Uu6BL5hBLrFEvoANKxf+HpIEbGnhXr2ikjF5ts4bEBZiI2/WR5iReakEO
 Xlc3CkBbC2IaeTwoRi2QH8XeEFjvrghtN+3yOC8egBvivsx6BQnH08bXD
 Z+azE8wBZNEvq7AvaV6vAYqt+7/ee0G8utr57vMing1omxUh5BXAeOWee
 HKzEupCFgI+1RKtjmpRXDIZJEPru6AlDLPhsoudcV1dEVi4W54FSKb5v1
 5hojKOjO+eE8NmabEJ4nDPqCBZLCAsuKtCOSI6PBihvQolMP8W2TWuqqa Q==;
X-CSE-ConnectionGUID: utQ2KNkDQSeIG8+cEv1N3w==
X-CSE-MsgGUID: 3urUwem+QNafUykIABIOfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="91318174"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="91318174"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:24:24 -0700
X-CSE-ConnectionGUID: zbX/447zQRG7v9C9IH/lWg==
X-CSE-MsgGUID: y9PaFBpbRbuj8Qi+qJKPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="273565361"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:24:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:24:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 05:24:24 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaFR/Bd6uH6aGF2BVCgvg6CBhRFuoktFvj1KEhLnWs/SYcIWWQrspdQhx9N4B/0uBdBrBAAHi0S7NZe1YleuccrGynsS8FR223W8D0UyXj1Pxrx5fGeMgb2LyV5a0yoYA0Uer54aoziWWp+0sMX3TbQUvQxh1QyO7h33nonqtV1pHjFp3fi8FqeURqTH199saFqaEXDZ8t8YPLDOoKDzoKON7FiOHlWWDt2LQ9/4BhiPWUarjOrQ3uCMYp0ZQXjEHBoJzc274+ttuEKE7PeuRBTjgyrLIvQq3dkIZHeADopRh6Dkr9cXG2U+UDhcUlJLd2IWcb6K8OkH+Zf4HOHiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSwgZ7p7eiM6ccUTCrL3ArD7MPWUKd5dYd9WLIntWXQ=;
 b=dw/4RhIJWfeEsgYgPYTzqeWlGcQEMqfXlnXqF7wbbbCeAbJBtAQU9MKQxLLkEn2qjP+fip/qrZpzZZrcm7pmaHQX8sCaCWf120GtFM7RbPwMqUfZFBu6RXjjdc7lVUxIk4PS4p/m5LX85gDbtRBAYd4uKFWNxAKK0OrC02XLnHxmzlCiTg7xlwkU4kk01tn+2XFyvYhA+lXSwDpxxyjrUHzed37Wtt3w3WkNINVulslNSuXbtsVG9uaNDLu8yA+K87Da4s4fFhdea9BYzEOJZZmri4PQVx2bkE9IcENWb8RX62mkxTDFF15Cy1bkCK10hKToodWlyApqbUrTEliL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by PH0PR11MB4870.namprd11.prod.outlook.com
 (2603:10b6:510:34::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:24:21 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:24:15 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or timing
 changes
Thread-Topic: [PATCH v2 1/2] drm/i915/display: Reject flipq for pipe or timing
 changes
Thread-Index: AQHdOsmB7hQiHlpsJkWTGyTYaT3l2ra7L3WAgAAFzWA=
Date: Wed, 2 Sep 2026 12:24:15 +0000
Message-ID: <DS4PPF69154114F9B172B9F83FAC7D3A986EFB72@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
 <20260902105448.809455-2-mika.kahola@intel.com>
 <1a0861fec350345f6999e7f7d88561c0220b4e69@intel.com>
In-Reply-To: <1a0861fec350345f6999e7f7d88561c0220b4e69@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|PH0PR11MB4870:EE_
x-ms-office365-filtering-correlation-id: 0b562ec9-5792-4585-5bde-08df08ed1a67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|23010399003|376014|22082099003|18002099003|56012099006|38070700021|5023799004|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: 3Q67ltOQl6fpi0lm6SsS2e/Irid88Uj8esHgYEMnZf18m9mf2jX1h5XAhNNMeO4soSEnNh32TwOXgEgOkOg5EzHesGPFPcnReOdDjIq0tg/ChX0exdoAQzNMRZaGhQxVA0ALP/T7ez0cGdvlV7EH/3B63nK8MMLGehcYMQtunC0/nXdu89xQNmuv4YDnP/tAIFwLX0EPAwKXVbxwhLLedgbICwWlCeyvgWTUIEWbz+cb2bueTZDmHcnn3ydXm4ODwZK4+D2LwdBqp47u++8cG510gOvWZRIovKP+z2jRGYsUAwnYTUZeAeMq7cwe98Gu5J0WIGB/3GYxMYLUhoVkkU+7yDR0EDSNF06OfkSLJTf6fgeVJtXmQQqJ9IKkG+Tw4NN5S9qT6iYLQJjebL7MBorDr2fAjJqmwXPBcueq5EHCxBimDNNFQ28COUZ/1bDjT9J0f4l8LMx9dDJX5yGjw/lo3nrt6Tg034WVIFwVE3p/XlYPjLr7ps1x3kI4Gq+3ZrMw22zNgivszGU8fLqKVF+Hi4kvUjNXtV8ObavmfCJPqTfSRMqrTC6b0xtxTq8HFW9sWfs7jKLl3jIQjJvT8/+0338d412Tpapa2lmEaayrbDHMtG1jRb+8/Z/tdZ+Ml4oPHU/NbMiwScy1LFvl2MpEFyjWMM71yYVP2itcPzU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(38070700021)(5023799004)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFEyOUNWcEtTcTU5R1hJVUNqV3oyMEJYY0JEajlPS1AvTFZXTTdtN0hVZmFx?=
 =?utf-8?B?ZUEzWTF1eDlVSlU2Q3NrTkM1NngvWkxFcDZLR0lIRlFVNkRHVkRSUGtnUGdI?=
 =?utf-8?B?NUhNbjhMU1NXbm9pd1hwLytQRFRTbXJxdEllZENiWjlrQ2JRMXY2Sm83S0xm?=
 =?utf-8?B?dDEvUzA2bHd1dkFkRm1udTRpdXNSNFR2TlM2K09QL2svaVA4TDVXMFkvNVlz?=
 =?utf-8?B?RGR0MkU2MHV3MkF0M0htUDMwZDlSQ2dvR25Jc2JoWlR6VkZyWFFNZlNBL1Ra?=
 =?utf-8?B?bldhVmQ4T0tRMis3Y2RreEE2K29OQ3RBQjltRGFGSzhXUVNnb0RGMlhuNkdo?=
 =?utf-8?B?UFRtMFJKb2pVQUJUZHRCTlJEL1ZpZEhxazU3d2Rwc3VDZHVzWnk2ZU9oQUJj?=
 =?utf-8?B?WVhuelJoaW13NjVFMEJpUGFjN1ZYOGZHam43VzlBL2hnWk9HZy9FL3NxU3VS?=
 =?utf-8?B?RlpnaGZhOElFRktQb3E0SXZ6U2F2UVFza0QyUVZQeVNCRTk4a1VBcHN3OWR5?=
 =?utf-8?B?T21KRXNzd1lET1dXVUU2RGt4Ukd5dVBXcXY3RHZtdFM4SVlLS0pYVjh0V2Vs?=
 =?utf-8?B?QjhKdEVqWnNxbHNYd0I4SGZaZ09CaW44UU9JZy9SNm85TmwrV0x1ZnVPZzhO?=
 =?utf-8?B?bzU2Z0NPQWRvWFA0WnRNemo3ZnB0djFBR3l1MVB3SjM2QWxjUkRWUHpOUTVZ?=
 =?utf-8?B?MUlpNDRnUk54QzhYSUtXV0VaYkRGa1h1aGxrUDFoZERqYWdxd3N5UkRZVXUx?=
 =?utf-8?B?T3Rjb2NjNnFKSEk3ZkVvK0IzWXFtU3ZFRFlzRXFoR1NyUVppTHUrdTZEOVZT?=
 =?utf-8?B?dTlQcGJhbEVXd0JXQTBEMk9BbjQrRGdNVDZGU0c2VENXR3dBakd2SDB1S2po?=
 =?utf-8?B?T3NYUVQ2bmM5NXUxNmFwcUdlbkRzUnRSZGxNNi9jbG1MVnN3bGhrdTIxdThi?=
 =?utf-8?B?dlpSUkVCRFl0bi8xWGJsdlRDNmhxd05wWjdCK0VkSGhSendlcW1IUlRuTC9u?=
 =?utf-8?B?bUptaHZEQVBLRGFlbDhwUlA1VGRFODR0VUhzNTliUUpEaWFEUGV4TmFoNm9W?=
 =?utf-8?B?REpreUk2Z0w5aDd3S2lzOXN3dTBGVUFKMGJrQzV3SmdycnBVUGdXbmFyR0pr?=
 =?utf-8?B?K3ZFUTAwNU0xekZsNGN5M0JKNmQwSmY3bW1SZmdGbTJ3cHhiUGJPZ2lJbVpj?=
 =?utf-8?B?UnJQd3hCVncyU3dKRUJFY0M0S20vMC9lNEcrWjR4c3BrSFgrTldMVkdyMjB5?=
 =?utf-8?B?ZE5leGh3RThucmhka3l4VlVGUmlZWVNRUG55MldPZThRdjN6emhRSjU4K0Rk?=
 =?utf-8?B?N1hTeGtCQVoxeVBua3daV01HSjBjdXZrZmNuTVBpdWZSUHRhbHNPUWFHVUFT?=
 =?utf-8?B?V21rRmNEd0svV25nd0tyZ3RtMjVxUE5uMjQ1WlNTdldPNU95eVdEMC80Ulky?=
 =?utf-8?B?S0NlZDRxZUZYYVVQTnFpT280OTVwczFYUU42VXBUOUtjNlRIVmZSSFRFVXhx?=
 =?utf-8?B?U0FCbTZ0OUE3NkpsRXJDUDUreG8wblArTkJIazVxSldKM2Q4bThRWjUvTmFr?=
 =?utf-8?B?VENJZGpRWkdTNjZBeUM4VzNEWDkyd3IrSjZ4RDJSK0VOV2M4MHJqU1pKd0tz?=
 =?utf-8?B?T2tFTW42c3RzWkNSaTc5OG5CYzBFbGhTdGp6VHpFSU90eGUxbFRqVTgrblpM?=
 =?utf-8?B?ajRLNU9EdjY0dTN0Nk1JRGZqYklPNllGYlRnczRZZS9ZVmdDTDFiaEZqbk5N?=
 =?utf-8?B?MVBOUENrUlZuVFE2Slh3OWJEYjB2TXhkcGRTMy9vdVM5MVpUVURNaVp0NGF3?=
 =?utf-8?B?dHNBcENXMm5pditFQWVOQVhGd1psUnN3YnFScE1BOWhNQ2pDbEk0ano3REdM?=
 =?utf-8?B?aERVWUIvZU1xUzFuWVFvRU5MUi84bFRuU2Z2UlZueURGaTFXQStNT2t4ZGNU?=
 =?utf-8?B?TFIwNHZqczdaM2E5eGRvTWtuSXdMckQ2R1ZIQnl3WkxNdmRlTjR0aVZBRCtM?=
 =?utf-8?B?UlBXNEsyN01WNThaRjVxRUNtTHptdTFKaHBoeEg4cytTZ2pKR0kvSjVTLytw?=
 =?utf-8?B?SnZFMjVBWElIUmdOY3ExMnYxWm1SUS9ZR3lEeEo5VGtPL08vUzRISXVzcm5K?=
 =?utf-8?B?ZW1vM0xaSEt5a1BzNVBISC82ZVZ2RFFXT0RMOFY4S2QrRGhNTXhuQmZ0L2d4?=
 =?utf-8?B?R1NsZEYrb3FKTGFSOXhlbXQ1cmdrbDNXaXVuZ2pGeXNDMmxQS3l0ellCSFhh?=
 =?utf-8?B?a1I1ajZrZmZqWjljRkVnTWtGdEJzb2t6MHJ2WFh1b2ZDakpNWHRISVNIbERK?=
 =?utf-8?B?aWY3Q053WDJSQjVUcUVDalhHZnp2dFR6cS9NdSsvQ2ZqYTJadmMwTWtIbkR5?=
 =?utf-8?Q?4gMR/Nt7lI1P6uphEF4/QmTGy+wom8jdyw+Ar?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l36s/OwFAzmyH8ZqvHWtO8tAHzV7w7QszyUchuqlxbEkvK/y3C1oMPXOWAoemxLkFEKwEoN44beCphU68e2jCfhPlftsWvYUg+oa/Eu7+KaUoxKvH1FRNTAgHeOyH2WY6j6js/ne8OgS8t+Q89VmOdHtjxF+eIEcVoWXNtWqQ7RCv5hxaWyOww0ex16vUdnTlBvOq8eED8Ex13Z+p7+Dtv/KL1y8Ep1kiRrTg8DAccDEsbIFDjGC4/q09hVH6jCYIsSWtL4B9FAUpmiBxhfnB5Cne7FXduAzeKFs/amocdmHcCB5idRfxA4/89bBY3hLAj3AckHOzz7Rm3Q6r1vHZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b562ec9-5792-4585-5bde-08df08ed1a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 12:24:15.2936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GAzNEvIR+znQIeCVoK7+Yjcy+BucZbR1eiF64EM99v6IggleYOknNoZmfjiY9AX5Bf+zIHKNfgQ+nouAxYp4Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDIgU2VwdGVtYmVyIDIw
MjYgMTUuMDANCj4gVG86IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPjsgaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IENjOiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsgS2Fob2xhLCBNaWthIDxt
aWthLmthaG9sYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8yXSBkcm0v
aTkxNS9kaXNwbGF5OiBSZWplY3QgZmxpcHEgZm9yIHBpcGUgb3IgdGltaW5nIGNoYW5nZXMNCj4g
DQo+IE9uIFdlZCwgMDIgU2VwIDIwMjYsIE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5j
b20+IHdyb3RlOg0KPiA+IE91ciBmbGlwcSBlbGlnaWJpbGl0eSBjaGVjayBsZXQgcGlwZSwgTS9O
IGFuZCBMUlIgY2hhbmdlcyB0aHJvdWdoLg0KPiA+IFJlamVjdCB0aG9zZSB0b28sIGFsb25nc2lk
ZSB0aGUgZXhpc3RpbmcgYXN5bmMgZmxpcC9WUlIvUFNSL2NvbG9yLw0KPiA+IG1vZGVzZXQvZmFz
dHNldCBleGNsdXNpb25zLg0KPiANCj4gV2h5Pw0KDQpTYXNoaWtvIHNwb3R0ZWQgdGhhdCB0aGlz
IHBhcnQgd2UgY2Fubm90IHJlYWNoDQoNCi8qDQorCSAqIEZsaXBxIGlzIG9ubHkgc3VpdGFibGUg
Zm9yIHNpbXBsZSBxdWV1ZWQgcGxhbmUgdXBkYXRlcyB0aGF0IGRvDQorCSAqIG5vdCByZXF1aXJl
IGFkZGl0aW9uYWwgcGlwZSBvciB0aW1pbmcgcHJvZ3JhbW1pbmcuDQorCSAqLw0KKwlpZiAobmV3
X2NydGNfc3RhdGUtPnVwZGF0ZV9waXBlIHx8DQorCSAgICBuZXdfY3J0Y19zdGF0ZS0+dXBkYXRl
X21fbiB8fA0KKwkgICAgbmV3X2NydGNfc3RhdGUtPnVwZGF0ZV9scnIpDQorCQlyZXR1cm4gZmFs
c2U7DQogDQp1cGRhdGVfcGlwZSBpcyBhbHJlYWR5IGNoZWNrZWQgdmlhIGludGVsX2NydGNfbmVl
ZHNfZmFzdHNldCgpIGFuZCBpZiB1cGRhdGVfcGlwZSBpcyB0cnVlIGFsc28gdGhlIHVwZGF0ZV9s
cnIgYW5kIHVwZGF0ZV9tX24gYXJlIHRydWUgYXMgd2VsbC4gU28gdGhlIHdob2xlIHBhdGNoIHJl
ZHVjZWQgdG8gb25lIGxpbmVyIGNoZWNraW5nIG9ubHkgdGhlIHVwZGF0ZV9wbGFuZXMNCg0KaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzc1MDE0OC8/c2VyaWVzPTE3MTc5
MiZyZXY9Mw0KDQo+IA0KPiA+DQo+ID4gdjI6DQo+ID4gLSBEcm9wIHRoZSBzaW5nbGUtcGxhbmUg
cmVzdHJpY3Rpb24sIHBsYW5lIGNvdW50IGRvZXNuJ3QgbWF0dGVyIChWaWxsZSkNCj4gPiAtIERy
b3AgdGhlIHVwZGF0ZV93bV9wcmUvcG9zdCBjaGVjaywgZGVhZCBjb2RlIGZvciBmbGlwcS1jYXBh
YmxlIGh3IChWaWxsZSkNCj4gPiAtIERyb3AgdGhlIGFjdGl2ZS9lbmFibGVkIHBsYW5lcyBjaGVj
ayAoVmlsbGUpDQo+ID4NCj4gPiBBc3Npc3RlZC1ieTogQ29waWxvdDpjbGF1ZGUtc29ubmV0LTUN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
YyB8IDQzICsrKysrKysrKysrKysrKystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPiBpbmRleCA1NTNjNjBkNDUyZGQuLmY0Yjc2
YTk1NDdlMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5jDQo+ID4gQEAgLTczNjksNiArNzM2OSw0MSBAQCBzdGF0aWMgdm9pZCBpbnRl
bF9hdG9taWNfcHJlcGFyZV9wbGFuZV9jbGVhcl9jb2xvcnMoc3RydWN0IGludGVsX2F0b21pY19z
dGF0ZSAqcw0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgaW50ZWxfZmxp
cHFfY29tbWl0X2lzX2VsaWdpYmxlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0K
PiA+ICsJCQkJCSAgIHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1
Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoc3RhdGUpOw0KPiA+
ICsJY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKm5ld19jcnRjX3N0YXRlID0NCj4gPiAr
CQlpbnRlbF9hdG9taWNfZ2V0X25ld19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsNCj4gPiArDQo+
ID4gKwlpZiAoIWludGVsX2ZsaXBxX3N1cHBvcnRlZChkaXNwbGF5KSkNCj4gPiArCQlyZXR1cm4g
ZmFsc2U7DQo+ID4gKw0KPiA+ICsJaWYgKGludGVsX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0
Y19zdGF0ZSkgfHwNCj4gPiArCSAgICBpbnRlbF9jcnRjX25lZWRzX2Zhc3RzZXQobmV3X2NydGNf
c3RhdGUpIHx8DQo+ID4gKwkgICAgaW50ZWxfY3J0Y19uZWVkc19jb2xvcl91cGRhdGUobmV3X2Ny
dGNfc3RhdGUpKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwlpZiAoIW5ld19j
cnRjX3N0YXRlLT51cGRhdGVfcGxhbmVzKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+
ID4gKwlpZiAobmV3X2NydGNfc3RhdGUtPmRvX2FzeW5jX2ZsaXAgfHwNCj4gPiArCSAgICBuZXdf
Y3J0Y19zdGF0ZS0+dnJyLmVuYWJsZSB8fA0KPiA+ICsJICAgIG5ld19jcnRjX3N0YXRlLT5oYXNf
cHNyKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogRmxp
cHEgaXMgb25seSBzdWl0YWJsZSBmb3Igc2ltcGxlIHF1ZXVlZCBwbGFuZSB1cGRhdGVzIHRoYXQg
ZG8NCj4gPiArCSAqIG5vdCByZXF1aXJlIGFkZGl0aW9uYWwgcGlwZSBvciB0aW1pbmcgcHJvZ3Jh
bW1pbmcuDQo+ID4gKwkgKi8NCj4gPiArCWlmIChuZXdfY3J0Y19zdGF0ZS0+dXBkYXRlX3BpcGUg
fHwNCj4gPiArCSAgICBuZXdfY3J0Y19zdGF0ZS0+dXBkYXRlX21fbiB8fA0KPiA+ICsJICAgIG5l
d19jcnRjX3N0YXRlLT51cGRhdGVfbHJyKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+
ID4gKwlyZXR1cm4gdHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQgaW50ZWxf
YXRvbWljX2RzYl9wcmVwYXJlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+
ICAJCQkJICAgICBzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykNCj4gPiAgew0KPiA+IEBAIC03Mzg0
LDEzICs3NDE5LDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfYXRvbWljX2RzYl9wcmVwYXJlKHN0cnVj
dCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+DQo+ID4gIAkvKiBGSVhNRSBkZWFsIHdp
dGggZXZlcnl0aGluZyAqLw0KPiA+ICAJbmV3X2NydGNfc3RhdGUtPnVzZV9mbGlwcSA9DQo+ID4g
LQkJaW50ZWxfZmxpcHFfc3VwcG9ydGVkKGRpc3BsYXkpICYmDQo+ID4gLQkJIW5ld19jcnRjX3N0
YXRlLT5kb19hc3luY19mbGlwICYmDQo+ID4gLQkJIW5ld19jcnRjX3N0YXRlLT52cnIuZW5hYmxl
ICYmDQo+ID4gLQkJIW5ld19jcnRjX3N0YXRlLT5oYXNfcHNyICYmDQo+ID4gLQkJIWludGVsX2Ny
dGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkgJiYNCj4gPiAtCQkhaW50ZWxfY3J0Y19u
ZWVkc19mYXN0c2V0KG5ld19jcnRjX3N0YXRlKSAmJg0KPiA+IC0JCSFpbnRlbF9jcnRjX25lZWRz
X2NvbG9yX3VwZGF0ZShuZXdfY3J0Y19zdGF0ZSk7DQo+ID4gKwkJaW50ZWxfZmxpcHFfY29tbWl0
X2lzX2VsaWdpYmxlKHN0YXRlLCBjcnRjKTsNCj4gPg0KPiA+ICAJbmV3X2NydGNfc3RhdGUtPnVz
ZV9kc2IgPQ0KPiA+ICAJCSFuZXdfY3J0Y19zdGF0ZS0+dXNlX2ZsaXBxICYmDQo+IA0KPiAtLQ0K
PiBKYW5pIE5pa3VsYSwgSW50ZWwNCg==
