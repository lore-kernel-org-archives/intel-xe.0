Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B796FCC6B24
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 07:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC0110FB69;
	Wed, 14 Oct 2026 07:04:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D5F10E148;
 Wed, 14 Oct 2026 07:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791961489; x=1823497489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rfBG+Ze8c1Jf81u8PL5h3NeVpy2ZMFFKk1I5SLVSIFc=;
 b=LL5fd+/pj9gmf1x3OcxR/rLlxwqlh8qFKexLHxBjpLYDXGKxmy7Wzpfl
 jL/rHf2bP55BX3Ddtg50D+9k9AUMHJEsqKFB3QGM3ijW0VW4KNbR/eksJ
 I/h6ZZEW914NoMuN3GLX2sUXse9m4O1fPmWls5ljorXlMug3i7s9vzIhP
 eiGUqFhE98cPGvKJwfvDqtryFHqCLGZ4JC+aaTWJCmxsDB3F3jY017nWp
 c1uRaiKFH5uQU9Z4nS+z/9FFAVy4YIyAxpwtMX5VUCoUrCpTEuWDt3e6n
 KugsP3CikrF+M/lHoCXcEN2HN0lbPmX0UR/NF0GESXxj3lFLTJ7UTc2GK A==;
X-CSE-ConnectionGUID: ukEqRuJXSSCVwHJ7KBCZJg==
X-CSE-MsgGUID: oFsdMlDARsOQMgW5At5Uqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="584614"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="584614"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 00:04:48 -0700
X-CSE-ConnectionGUID: n/mUGEesRSqNq4iaERmaCw==
X-CSE-MsgGUID: ooV8FvYNRIyOzDi/oMzQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="3196486"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 00:04:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 00:04:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 00:04:47 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 00:04:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4WIJEWt1XzyandkZt3ZQlJA7+iWsMJDdu+5kU/P9TebMxXvpP5r7Tnyb+EDYfFARQ0fRLHYKz2/xhtSmuKU5aDWkWD0dwlBjUu+89DbvVM1PsokiCzCIJdhthlJ4mWdQ9Z43qK52AWDJlEeRF5nbrPI9o20wpoYQJrVfeEwNaVm6yGEX+nuGO3PikS/K1aYjsCfCA7UEse1n5cCUtiMCjJs3HNLni2a0YEO4AAPz73kwRF/X4z10BK8pR5/UFZ5GrSSLj7E0ECBU1OdaOmknUddxoKP65ExybG1H0DToCMx9VpyaXOq1ufDJhYtQIZeWLgkXdjSCwUi0gvPGWvhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfBG+Ze8c1Jf81u8PL5h3NeVpy2ZMFFKk1I5SLVSIFc=;
 b=Qape4rAG+uhsGZSD56Dfo8qEvD+yZ5YuMQKXWXvk+qvA+qeTRODVzgYe8CUfTurjnlibuOmCrvS9kqTcOuZrIJ7rphpYZ6BwnO7epbmdGPPDA7vLlDtFzgCd2564LVlALCWCW7zp2kI4oDl2muxa7ybOnqkv2n+4r72Gk1ARg2VQH6g4pbGfk/qhfFjCLiCHiHhhz0uu31bcpCoKOdnSpc/alNvR18RodDqqGMVLG6tcN3HZLN8mfosLw2hkVjwhBCX3yK6dTrj6hs4kVuPRrwbJDkHI2QQljhzZTxH0qegEt5VOwEEKRqQMTHxNkPGgCfqAjzTc8d6NJcCxElfA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by IA0PR11MB7354.namprd11.prod.outlook.com
 (2603:10b6:208:434::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 14 Oct
 2026 07:04:44 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 07:04:44 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port A
 only
Thread-Topic: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port
 A only
Thread-Index: AQHdV9oBn6mEPhDl2Eivx5DzTRQ/b7b6KEAAgAFEdZCAAAPFAIABNBrg
Date: Wed, 14 Oct 2026 07:04:44 +0000
Message-ID: <DS4PPF69154114F7EC73EA9D46E9BF35D20EF9D2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
 <20261009103552.1864818-3-mika.kahola@intel.com>
 <as0Tgm77ARcfcHQI@ideak-desk.lan>
 <DS4PPF69154114FE5A707C5339FD36A7CF2EF9E2@DS4PPF69154114F.namprd11.prod.outlook.com>
 <as4m2CWYG-lUzfta@ideak-desk.lan>
In-Reply-To: <as4m2CWYG-lUzfta@ideak-desk.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|IA0PR11MB7354:EE_
x-ms-office365-filtering-correlation-id: c21bb673-4f3d-42a0-4293-08df29c16d47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|10067099003|18002099003|38070700021|4143699003|260925022911599003|261009223027099003|260925021911599003|260925021311599003|11063799006|5023799004|56012099006;
x-microsoft-antispam-message-info: lxcE69+TQl1n+P9HfVHyD0afm0GWvuUF3gooLO6DNdZ7nwSc0BPp50lAbf6aJQ1uDtQzgDCwI65EZ7iByfOdFsBgT7/5i4x7C7ICuDdtWmufVL2B5XOGBKYo7mJC1lS/iJgS5x+aCy4xwozaMYauCXShB1n7+zn3pJq+Iu3A0SbGUjFW1/l4raINmbun50Jav3VlPXROVOpjmKajLiqiGK0kDd3ICov95j7NLygf3j1n3BU0+Wdg56vGF3Jv8mkwIgKB9MWlm/0hUTEFRc66MfsCw2sGCaqN4mSIC18Dp1CCSst7kUSjO0G84vjxMJjZhYcFGuPuX0RsoculWPWaS1fbeVfcacOAq0gTH2c20sz81a0o1lqSZRaJ81UqyduyjUJAJLAciAJL1fuEeWBm1y3nexGXq7orbexg8gfcTJd8evTrmzHaj38qvEu3SjzYh3+m77saCGblGJA8fkAHmH6D1m5b1UP4h99abwqtgYigAA7gJ7k2eJqzRy/H+BRyAN/dkCdeKcmywaYpH8YkG2/zmDK1/HzrAspPB4n3vSFCC98oGrGqtmtC2BECBskDsmdKE42fErCuEXGAYiYI9uFhb9uK0JUqJPV2w4UkrCbLYm4fMmnfpoxxRNwXMQevjGMlRSTnUi4Mn+6GIZw97I529aopro2u0NYljpZLI9GgyEEnEYSR5CLm2XjuBplV9yXeh7+WfwadJUXQGFaU386uZssqgnpXeMzVEkpRW/Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(10067099003)(18002099003)(38070700021)(4143699003)(260925022911599003)(261009223027099003)(260925021911599003)(260925021311599003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXVTWGVIL1phMEtIYmZ1ekNNU1FuTWNQaldVUjg5NUNiYzNXWkdpZHNrTSty?=
 =?utf-8?B?U0p6d0dYM2Y0cUhvZ1JZaWNGYUR4ZU4zUER2UzFZMGhZL0FCUHBVeEgxQXRQ?=
 =?utf-8?B?dTkxVkxzVlVSNDFNUVk1Vkh2OXIyRHFNMDFhc2xXYWFHc3NDWEtQV3YxaUNE?=
 =?utf-8?B?ckFqZzNhRzVoaG1hNE9NS1BPM0NGU29HM3d0YytjaTJCV3BZVHgwOG93YXpC?=
 =?utf-8?B?aGZpRllqWGFnTmpWcjkzYzYyaTdFd200aEExTDloUlgxbndYQStKVTVhNkUr?=
 =?utf-8?B?bnFxMUx0NElhR1JYamtMSnZqUmJycGJWUVNSNy9iOFIyQUJadHh2dkpCSHJS?=
 =?utf-8?B?TExYQytIeklWK0ZRcVVHRWdwUldKeGlsRldvMElETWl3ZmN6WkdwVDgzK3pE?=
 =?utf-8?B?WUdDU1dwa1JwNmNPUnRiUi9HL0UwZGl3RElEM1NJTUpLZ0VFUkZ3YklFYysy?=
 =?utf-8?B?MmsyMkhqNkZBRFlUVmxBUkJzTzlwaHBuSTFTTlE0NG9idURjUVFacWFNSGVj?=
 =?utf-8?B?RjZZQ2xza1d1N2lBNzlEUzl5YUNYalhvRnZKZm83SGU0THNkRkkyVUZUN3hz?=
 =?utf-8?B?UjM1MWUvaUZwUWVXZXhtdVlta2F6RlpsMkVrVzFwVWpxSEw3eWk1SE95bG9r?=
 =?utf-8?B?YVVxWm9IY1oxWWtiazJPL0F3N0NZNXdPY0lXbjRJeUhzeWFsQ2YxMFp1bjNT?=
 =?utf-8?B?Wmx3R01MblN6emIwM3F5cTh3dU9tNWp0a0ZldnZmUlloQWdzOFJJbDV6SzdP?=
 =?utf-8?B?S2RXMTZpNjRTeGhKMFo0U2JIeFhGenIybXlKTC9sVDg3bFZTMXlMQ21DZnQy?=
 =?utf-8?B?bE82U3lWcWlQbGkwU2prVitWWjVkRUJMS29xblpIRisyZ1ZMZG1lVHFDcmJN?=
 =?utf-8?B?bytOWmpTN1hIVGtNQ0U3dW5KT3VvWFdvN1FhaHZWaUpRVGxDeE5LVS8xRUhv?=
 =?utf-8?B?aUN5UUgrcDFqL2k2UUgzK0N3UzZsbUVZU3VZWUFQRmE5SmFTOW9FVUxQejBv?=
 =?utf-8?B?Z2NLSDhmUTNLOUp4aXB6aUpFUERNNkkwbGw0YzNzcTkrdlRUK0hmbmtCRC9r?=
 =?utf-8?B?d28wekRVZEg1Q3VyMDZzUHg2NUx4QTErYjBzWmdnMXg4QjNFZXJMbTZ6eHhq?=
 =?utf-8?B?bU5zSDJNbmwwbVJDM0wvWjNtMHRPVnp1QWhFZW5IVmtwMGJBYkRiM3ZQWDlP?=
 =?utf-8?B?RGJKTXpEWnhWVFE5MW1pUnBPOFRPWDc1aDkzL2MrVFpKYkhsay9pQVVvaXBN?=
 =?utf-8?B?UlF2SXQ2V0NYYnhTTk00VThrKzRLVEliWjBwNG1HSlplRDQwc25uYnAxSTUv?=
 =?utf-8?B?YXRSSE4zN1RzSXYvS01tVHRxY3RMYlF4MmpiNndkWUFjTVJIaXZ4b1A1QmtV?=
 =?utf-8?B?QkFQTXdZYkJ5ZDB6NXZoZEhxZlE1cGJaT3RZc0JBVm9nOXoyN202Z2NTVU1h?=
 =?utf-8?B?Rm5HbW5QdXJQWmJsSFFqU3o4M2tObG8zcmM2ZzNLTkY0SkZNMm8vTjlTS0x0?=
 =?utf-8?B?NDMwdnk4cS8xRXk5dml5bWZzaUcwWTE2L2tSZmNtclJiaWtPcFphSGpreWxI?=
 =?utf-8?B?NEgxQzdXSWhoekdWNXg4OXRMR2Ura1UwRmtmcVJETlA2K0pIRjBlUnlhUVpN?=
 =?utf-8?B?VDBUbGVIUDNIUFpkMm1kS3pGbTBXL1Q2UE5NYzVRUW9pRDVMOWRwYmRScExI?=
 =?utf-8?B?VzJOek44dXU0Tk9NUmFtS3l5VVMzLzZydjFqKzJmV1BOVU5naVhxVkNaT1lU?=
 =?utf-8?B?aGdPMnhMa0xEZmlrZWtqZzhScVdaaGh1SjJuRVlvcCtDZ0Irc3daTThQb0Jq?=
 =?utf-8?B?TGtBakRpby9BT0lWUi9tZ2MycWtnSjRGNW1wSlVjREg4SVBzMEZzQkFSQnVz?=
 =?utf-8?B?ank3R01ZRXcyWXJ0S0JkcUYrYzBEZHNUWk1WYTFqend6N3JPWGFHZUk4MjBC?=
 =?utf-8?B?QmFzVGNFcVU1RCt1bEttRW1iUkpBR1FvckRoaXpRNHFqcFhvTnZnSjFYaG5W?=
 =?utf-8?B?QWRVakRsTnFhNHo5OFdoZ2JXYTJ3WnJpNlpVZ3dITFMrMTF1cTcxSkZHWS9P?=
 =?utf-8?B?dzlGaWRvZWNVbnA4WWVWUDRvWnh3MmhVUnRIUUVRNkJpb2lsU3FVRDk5WjI2?=
 =?utf-8?B?dnZXRXhVK2ZzTURZMjlxaG5SNi9DS2NrQU5tNFQ3c1pCMEhXaE1zVDhyaWdT?=
 =?utf-8?B?TlZSdkF4R0h5ZFFQUENPcHNpbFJ4b280elFKNUR2cFh1VlliVmh0ai93dldL?=
 =?utf-8?B?YUErVTBKSzVvdkxzaUUxcVhRZVZiN0M1U0hJZVVKY3I2RU5OdzliMlR2c0VI?=
 =?utf-8?B?Z3FPOTZXUXNCUUNJZ2NUUDhVb1pJZFNCYWdWbGo5bXJOVHNlcFBxUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0q1MBuHTLztJMsKzdcVh1rQRltzWRE2uWxoHrQ6IbTUKBDGAUSCGw3Hc86WfaMyAOUOthwpE/IOu9M1rGs+Bn9/ZmK6dmbAxLx2Qk2soUKX++evkfSkjYTa8FZVHX2c0anYoIfZXD72xxQF5DbHj/8+bXKEFgTPLpCTJUTcwbs+1x2HAZLFKYLtvgA/GPvMGmlhMB5rKVV1MeIhnq0XMV+Uruyv/+06NJ+rJA2R4hJMJ6aJjzIk0xSCMtsPmbhq1T0uYrl70xwjuhC5sN4kthO8dVMmehrrwlhkE+maxBjz4fcgYelf3LI3aFQ+o4xO/cdgLWBQKTqNVj8QLEIrpEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21bb673-4f3d-42a0-4293-08df29c16d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 07:04:44.8106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jEjGz8cWVkCICCwVcTf8iowKaJEUuoNQfNUMArkPJNc0+Tt6Nt3/pJ4wxfW59o4SQRp8girXOjtWDCyBYa9K1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEZWFrLCBJbXJlIDxpbXJlLmRl
YWtAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCAxMyBPY3RvYmVyIDIwMjYgMTUuNDENCj4g
VG86IEthaG9sYSwgTWlrYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi81XSBkcm0vaTkxNS9kcGxsOiBhcHBseSB0aGUgUExMIHBv
d2VyIHNhdmUgVy9BIHRvIHBvcnQgQSBvbmx5DQo+IA0KPiBPbiBUdWUsIE9jdCAxMywgMjAyNiBh
dCAwMzozMTowMVBNICswMzAwLCBLYWhvbGEsIE1pa2Egd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogRGVhaywgSW1yZSA8aW1yZS5kZWFrQGludGVs
LmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgMTIgT2N0b2JlciAyMDI2IDIwLjA2DQo+ID4gPiBU
bzogS2Fob2xhLCBNaWthIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+ID4gPiBDYzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0gZHJtL2k5MTUvZHBsbDogYXBwbHkgdGhl
IFBMTCBwb3dlciBzYXZlIFcvQSB0byBwb3J0IEEgb25seQ0KPiA+ID4NCj4gPiA+IE9uIEZyaSwg
T2N0IDA5LCAyMDI2IGF0IDEwOjM1OjQ4QU0gKzAwMDAsIE1pa2EgS2Fob2xhIHdyb3RlOg0KPiA+
ID4gPiBXL0EgMTQwMjIwODExNTQgYXBwbGllcyB0byBwb3J0IEEsDQo+ID4gPg0KPiA+ID4gV2hl
cmUgaXMgdGhlIGFib3ZlIGRlc2NyaWJlZD8gSSBvbmx5IGZvdW5kIHRoYXQgdGhlIFdBIGlzIEMx
MCBQSFkNCj4gPiA+IHNwZWNpZmljIGFuZCBjYW4ndCBzZWUgaG93IHRoZSBwb3J0L1BIWSBBL0Ig
YmVpbmcgdXNlZCB3b3VsZCBtYXR0ZXIuIEl0DQo+ID4gPiBzZWVtcyBtb3JlIGxvZ2ljYWwgdGhh
dCB0aGUgV0EgaXMgbmVlZGVkIHdoZW5ldmVyIGEgQzEwIFBIWSBpcyB1c2VkLCBpbg0KPiA+ID4g
d2hpY2ggY2FzZSBpdCdzIGJlaW5nIGNvcnJlY3RseSBhcHBsaWVkIGluIHRoZSBXQ0wncyBDMTAg
cG9ydC9QSFkgQiBjYXNlDQo+ID4gPiBhdG0uDQpJIGRvdWJsZSBjaGVja2VkIHRoaXMgYW5kIFdD
TCBpbmRlZWQgbmVlZHMgdGhpcyBXQSBmb3IgcG9ydCBCIGFzIHdlbGwuIEkgd2lsbCB1cGRhdGUg
dGhlIHNlcmllcyBhY2NvcmRpbmdseS4NCg0KVGhhbmtzIQ0KDQo+ID4NCj4gPiBUaGUgQlNwZWM6
IDc0MTUxDQo+ID4NCj4gPiBUaGUgdGl0bGUgb2YgdGhlIHdvcmthcm91bmQgb25seSB0YWxrcyBh
Ym91dCBwaHkgb24gcG9ydCBBIHRoYXQgbmVlZHMNCj4gPiB0aGlzIGFkZGl0aW9uYWwgcHJvZ3Jh
bW1pbmcuDQo+IA0KPiBJIHRoaW5rIHRoYXQgTE5MIHdvcmthcm91bmQgd29yZGluZyBvbmx5IG1l
YW5zIHRoYXQgdGhlIHdvcmthcm91bmQgaXMgdG8NCj4gYmUgYXBwbGllZCBvbiB0aGUgQzEwIFBI
WSwgd2hpY2ggb24gTE5MIGNhbiBiZSBvbmx5IG9uIHBvcnQgQS4gVGhlcmUgaXMNCj4gbm8gUEhZ
IGNvbm5lY3RlZCB0byBwb3J0IEIgb3IgYW55IG90aGVyIHBvcnQgb24gTE5MLg0KPiANCj4gPiBI
ZW5jZSwgSSB0aGluayBldmVuIHdpdGggdGhlIFdDTCBjYXNlIHdlIHNob3VsZCBsaW1pdCB0aGlz
IHRvIHBvcnQgQS4NCj4gDQo+IEkgdGhpbmsgdGhlIHdvcmthcm91bmQgc2hvdWxkIGJlIGFwcGxp
ZWQgb24gQzEwIFBIWXMgYWx3YXlzIGV2ZW4gaWYgdGhlDQo+IFBIWSBpcyBjb25uZWN0ZWQgdG8g
cG9ydCBCIChvciBhbnkgb3RoZXIgcG9ydCBpZiB0aGF0IHdvdWxkIGJlDQo+IHBvc3NpYmxlKS4N
Cj4gDQo+ID4gVGhhbmtzIQ0KPiA+IE1pa2ENCj4gPg0KPiA+ID4NCj4gPiA+ID4gYnV0IGludGVs
X2VuY29kZXJfaXNfYzEwcGh5KCkgYWxzbyBtYXRjaGVzIFBIWSBCIG9uIFdDTCwgc28gdGhlIFcv
QQ0KPiA+ID4gPiByYW4gb24gcG9ydCBCIHRoZXJlLiBGaWx0ZXIgb24gUEhZX0EuDQo+ID4gPiA+
DQo+ID4gPiA+IE9uIFBUTCBub3RoaW5nIGNoYW5nZXMsIGludGVsX2VuY29kZXJfaXNfYzEwcGh5
KCkgYWxyZWFkeSBtYXRjaGVkIHBvcnQNCj4gPiA+ID4gQSBvbmx5LiBNVEwgYW5kIExOTCBhcmUg
bm90IGFmZmVjdGVkIGVpdGhlciwgdGhlIFcvQSBpcyBmb3IgUFRMKy4NCj4gPiA+ID4NCj4gPiA+
ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRlLW9wdXMtNQ0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4g
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBsbF9tZ3IuYyB8IDYg
KysrKy0tDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kcGxsX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcGxsX21nci5jDQo+ID4gPiA+IGluZGV4IGU4OTliMmViMDg3MS4uMTY0ZmU3MTA0
NTQ1IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwbGxfbWdyLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcGxsX21nci5jDQo+ID4gPiA+IEBAIC01MjI2LDggKzUyMjYsNyBAQCBzdGF0aWMg
dm9pZCBzYW5pdGl6ZV9kcGxsX3N0YXRlKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LA0K
PiA+ID4gPiAgICogVGhlIGRlZGljYXRlZCBkaXNwbGF5IFBIWXMgcmVzZXQgdG8gYSBwb3dlciBz
dGF0ZSB0aGF0IGJsb2NrcyBTMGl4LCBpbmNyZWFzaW5nIGlkbGUNCj4gPiA+ID4gICAqIHN5c3Rl
bSBwb3dlci4gQWZ0ZXIgYSBzeXN0ZW0gcmVzZXQgKGNvbGQgYm9vdCwgUzMvNC81LCB3YXJtIHJl
c2V0KSBpZiBhIGRlZGljYXRlZA0KPiA+ID4gPiAgICogUEhZIGlzIG5vdCBiZWluZyBicm91Z2h0
IHVwIHNob3J0bHksIHVzZSB0aGVzZSBzdGVwcyB0byBtb3ZlIHRoZSBQSFkgdG8gdGhlIGxvd2Vz
dA0KPiA+ID4gPiAtICogcG93ZXIgc3RhdGUgdG8gc2F2ZSBwb3dlci4gRm9yIFBUTCB0aGUgd29y
a2Fyb3VuZCBpcyBuZWVkZWQgb25seSBmb3IgcG9ydCBBLiBQb3J0IEINCj4gPiA+ID4gLSAqIGlz
IG5vdCBjb25uZWN0ZWQuDQo+ID4gPiA+ICsgKiBwb3dlciBzdGF0ZSB0byBzYXZlIHBvd2VyLiBU
aGUgd29ya2Fyb3VuZCBpcyBuZWVkZWQgb25seSBmb3IgcG9ydCBBLg0KPiA+ID4gPiAgICoNCj4g
PiA+ID4gICAqIDEuIEZvbGxvdyB0aGUgUExMIEVuYWJsZSBTZXF1ZW5jZSwgdXNpbmcgYW55IHZh
bGlkIGZyZXF1ZW5jeSBzdWNoIGFzIERQIDEuNjIgR0h6Lg0KPiA+ID4gPiAgICogICAgVGhpcyBi
cmluZ3MgbGFuZXMgb3V0IG9mIHJlc2V0IGFuZCBlbmFibGVzIHRoZSBQTEwgdG8gYWxsb3cgcG93
ZXJkb3duIHRvIGJlIG1vdmVkDQo+ID4gPiA+IEBAIC01MjQ1LDYgKzUyNDQsOSBAQCB2b2lkIGlu
dGVsX2RwbGxfcG93ZXJfc2F2ZV93YShzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSkNCj4g
PiA+ID4gIAkJaWYgKCFpbnRlbF9lbmNvZGVyX2lzX2RpZ19wb3J0KGVuY29kZXIpKQ0KPiA+ID4g
PiAgCQkJY29udGludWU7DQo+ID4gPiA+DQo+ID4gPiA+ICsJCWlmIChpbnRlbF9lbmNvZGVyX3Rv
X3BoeShlbmNvZGVyKSAhPSBQSFlfQSkNCj4gPiA+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICAJCWludGVsX2N4MF9wbGxfcG93ZXJfc2F2ZV93YShlbmNvZGVyKTsNCj4gPiA+
ID4gIAl9DQo+ID4gPiA+ICB9DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuNDMuMA0KPiA+ID4gPg0K
