Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C0BC624D5
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B65B10E20C;
	Wed,  2 Sep 2026 10:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keeTT6dX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C705310E0D2;
 Wed,  2 Sep 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788343859; x=1819879859;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oIB4qBDt3C+Equ36V3bMYSvkjbxDNAyLXreCpt1S+vU=;
 b=keeTT6dXx6HPKfnfdOJ/htlTfvrSag0WoaZNsJmnxWN+rNOy2eC8j6yW
 ESXo+7Sqbpn3xRormmYMsH0ltAusNbifsc7o0GTCQNyrHkhGT3mgOBQxh
 Pgk/mcA7QpZXtXk+ejwbOa0n1wygb4QOvt9F9UFOFMknk7cqYxEerNVF3
 CJfk86why2eA7uE4X8bF8n+sqd6t5avMsBr4w4dofuA0NQ0O2+4fyMdh4
 TDV+LZnC9haH1juernnx0iKo1jKi8q2+bu+8HB/0aAxgIzrlfa1Ln8JpW
 lI4Jq0mXMtRmVpw6uOg9S4wGyUcileJr0vqE8lS76YmsnAcqBzxQNLVJd A==;
X-CSE-ConnectionGUID: YmYafeh3Ryur2MaZdD0Qtg==
X-CSE-MsgGUID: 5EOOOKrzQ4WEDfie8XWGhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106166017"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="106166017"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:10:58 -0700
X-CSE-ConnectionGUID: iAeBWZ3gRPeK0kEw1F9knw==
X-CSE-MsgGUID: YtVDPqoDRIiRkndgZuYbmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265660481"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:10:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 03:10:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 03:10:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.41)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 03:10:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETJXbfy25Kh+B05hrEhB3vk6TogXQnJfWDAIVbBibJwjGQxZWrSvYk3LWiyIZxRvEWbbFe5PCTxqyoYW+8RgdoZ8zHEADmZsSp9+fHNKqJYExO6FxdX7ceypgc/q0eQzCFsAVvFFEjqZ67+ZuPz/S6AZmbUROBQGVCl9lK1FH9iupwpl0KMLbOhquxa3GnM09PwYfckWQUQj32BT5jOjkvTlcc5eAgMhY27kj67WjtOC8m3aqPOWq/Jg6dhLVuMweREkDfhZOt/U0oeX/MP+gmOajakd+L3hRw3Knh3XVI+S/dm70qTAS19xP+nl6DaWqpoSWZ70Ks+bn7nXhznz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIB4qBDt3C+Equ36V3bMYSvkjbxDNAyLXreCpt1S+vU=;
 b=PlzSPYs80eM2vU+Jwy1kHf9gKjhhla95yW/OPSXPB08gMj5EJjZ61rhSq9lezihBfMQLdwt2BugTGZ+R9XSpwvW6BblJ4KPJkUH0dCb/YTU3b5IHgphZh9LtQrDxxTAsEqDqTS+rKm8lGhpQlVe6pLZdce04nmXfDOoA5MXXPPCVIB4+fFm+ny2UUTAp8MEiu60blwmNUcxl8kT+1V+fJQPPg344Be102KVxuWo64Aqa71XAjYZtJ78DuIcrNu9NKA6uyCgYHi8WZ/kl0ERKe7yUV5+3t5WTw/nzpSReB5mmVbZEU7yb9AfSuPMLR3LRpQyXQ7+FLYo2QXKgidy8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB968233.namprd11.prod.outlook.com (2603:10b6:610:360::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 10:10:47 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 10:10:47 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 14/15] drm/i915/alpm: Compute and program switch to
 active latency
Thread-Topic: [PATCH v5 14/15] drm/i915/alpm: Compute and program switch to
 active latency
Thread-Index: AQHdNFnAZZw2tuiSAEStBgJaQLM7dba7He+A
Date: Wed, 2 Sep 2026 10:10:47 +0000
Message-ID: <1fa48b1674e09bf95f903d8445eea212257ef949.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-15-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-15-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB968233:EE_
x-ms-office365-filtering-correlation-id: 198e6e48-35b3-44ba-ea38-08df08da757f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|5023799004|56012099006|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: RyyONNs3qiWQhWILvuFDFHKZlpde9CnPm77b1Sn0XACf/CyhYzvY75nKi3HV7CQSg+fri4n/CJZlsQyqstiXJKnpJQhERO75rfoya14Wiz7mWhSokhIMwuNbG4cPS7pFvk3CBArOZBqqGYxviSNp48tBN/tVl/E5JEvQdB1Jm7MBso8PaJQ5XwrrKvFmsE+S6Mdi+UdTiKJCHar4Dhni8fFE+8CRPeY4fY+sF0OR0BItGKIBVWwU7+SySvxwXc1V2Axj+VB20j6A5GnffB7GYuPit1nhix5HmVSVAJ9x2kpDDICu2bpya55XSP/jNzMYTzgZt18Lt1LP3pwk9PfAn59bbp7A91T2TN9NXPyBE6/H8Z9FcEbgQHCzJY/R5qQiiQUK6a8jQuHQX+DP7i28UHaT6bYNydDKnujzysIw885MSCkC/SrRrIcIL1QbHP9r4iD7KD1rU3roy1C+IoaBTh9j7l+fr8uZGclOq3JBm201plty4rFQexw8Ub00EY7CTe12rlqZ8rmrgfrDqi2Q6bzZux8+QiQ8qAxRyxIXXnHRDrghu1P/umuFEmQbvO5gyvMtiXGL89RRT1maTe+glLcsKZZHDZtCXQqeIEyqqpW5CkHlsHBcGx30VkUdv8qXm1zq9GiFqw17OZzPconHjZM72v8M62N7qPBIqTvizk7JOtcuwGs7+ToVuq0Cmboz3kX6eKaKQa03vGQrzvaKU2u6ftoWYIilWcOmBANJa2Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(5023799004)(56012099006)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVlQUkovUk9rWlhRc0w3elJ5Z1dqVDltQTkxYXJ0WFZjc0IvYXVtc3BtN1JO?=
 =?utf-8?B?TU4yOE1mMGZlZ2dUSnpaWWpsL2o2RFNSQTlhOWk3TGpJUytnREdubmJIc3dU?=
 =?utf-8?B?Tmpiakp0UHNXVnJBZUFvNGx0Um14WGtFTWpmMFNyYjdSbjljYjhCSGVvWm5y?=
 =?utf-8?B?ZE5RY1hFY1UvUzV0QmZEMVY5ZTJvTjBLbXcyS0d2aWxnbFZnZlhmdmxIWTA2?=
 =?utf-8?B?YlpxTEpHa2ZuaHlvcnVHOWppVFp1T2hsa0pJSm5PUjBjUnFEZzZxeFcyR09y?=
 =?utf-8?B?dlJ4Q0preGEyeGtpcnhwdHphZFRNbjk3U3FGUXFMOHZVUDhrM0NmYnUzRTha?=
 =?utf-8?B?c0Q2K08zb0NjeEU5RVdPYm9WSXdJVWFkNHVYcGFKcDh3a1lpZytlN2E3cSsy?=
 =?utf-8?B?M2YwWGpnSzBKb3lwZ3B2NFltV0J5QjFXRHJNTUFZdmNoVzRYVTlUcVVHcFlr?=
 =?utf-8?B?NkZxTU5SdlhZOWthVDhHelhkMzlvUWt3NythMHl1bVdVbDNYazNKckxpNTE2?=
 =?utf-8?B?czdEeWMvdzUvTDN0QVNMK1NwYVFCSVc3VWlGRWFHdEFGd0Q2Vk9Bc1B5QjNR?=
 =?utf-8?B?ZlRSZzlCaUY5QVVkdHFuZDZJRlpIY1lUYzJpWWh1L085a3VwMDFGVXlXVUtw?=
 =?utf-8?B?d0N1Z1hzK2dKMnREVUxrbTNWdGZ2c2RQbFVJVXlieU01WWxzTGI1RnJ1Vno1?=
 =?utf-8?B?OUcrdmp2U2U0SStONkJCNnV1cmJWNWtFcUpJbEd2d0dyZmd6QWxmOXVpNEZS?=
 =?utf-8?B?b05iRnI2Q2JValF4M3pzTFBQV2FUNUcvampmMEg2YW14Rnd0cXhVaU8yMS92?=
 =?utf-8?B?dWc0bmJVUk1nYjlpS2lRSVVIbDVxRUoxajE2cTVBVkVDbHRkb3hmaGxOakxv?=
 =?utf-8?B?VWw5WUsxZ1hVSlhHMU9qNTRlTXdVdS9sODJrWjZ1R1dSMFFTRDZNUzBQR3Fm?=
 =?utf-8?B?RzI0ZVcyZDlSYVVxMzF5NHN6NFl4QWlaenJJVWsvZjkzU21MWWdEa0taNXhN?=
 =?utf-8?B?TDN4YmdLVjJHWUlnMVZ6S3pNZm5DUzYrcU5TU1lZZDdLekUwdXhxRlJNcVVR?=
 =?utf-8?B?UWpPSmlpdjdSVVlsT2UyL3Q2QzdheFlZSDhjRzZkc3ZXWm5ZbElJMVVVUUVu?=
 =?utf-8?B?SzdqQWJDK0pJTmg1Z09OSDZSUlpkRDBoWmRxOHJyUHFmV3FWUzhEYksyaFRu?=
 =?utf-8?B?TFhKZktsOUc5WHFxazJmek9oUDIxR1FZTTVKQzA1eTFnZ0xueW5CVUxRUm9X?=
 =?utf-8?B?aXJ1MFVpTGk5MUJXU3RXekxTWmFXSjZLeUJSbVdIdE9jczA2WVJJc0ZHSG5S?=
 =?utf-8?B?TEVGS2VqSDlrd0hIeFBqZ2F4bUxQdk9BMnkzM2NhSGNWc0tFUXMva1oxeHU4?=
 =?utf-8?B?QlpJN0E1R3pyRWxienBWL0xtMGYrbjk0Y2hzK25FNW8yWkowd0czOHQzWG10?=
 =?utf-8?B?MWc5K2lNWWQvcW1tMURHL1V5UWpiMUplU2VJU3VieHBJb0JTSmlhYkxHM2tV?=
 =?utf-8?B?U0ZNZTI2Ly9WVUIrZi9KVkJWOEZsaUFPeWhTRHNuR0h3em5iaXRQN2hGQmt0?=
 =?utf-8?B?aTB1cmJWT2UwUXUzZVBHamU3L2ZDbFNuYm5GTFRkcW1XbUZnTGc2Mk1PSGh1?=
 =?utf-8?B?K0pXMStEMG1QV3pzdDdpaTRmZWs3b2ltN1NqamVHa3pvN1NqL3ZVMEtSZzJX?=
 =?utf-8?B?bXhDaVhZTWdKRXpOTWtBZlR6ZVByVHFOL1dFVUlrMjlpc0Z1bS9Vc1FHOXlB?=
 =?utf-8?B?WElTTC9TZ3NnVkI0SFhscFBoMGVJUXlERE45RVVmRktKQW5rSEdZYURkd2Ro?=
 =?utf-8?B?alB6Rms2cmhzWG1jYUw2UGZ3dzNpb2UzNjRYN21yTVlYSUdvbnlsMUxnVG0v?=
 =?utf-8?B?U2dBV3Vmc0QzakJzTDdVR1lEZVQ3dHo2MWhyTUEwOG16ODFobnUvT0p2L0Fh?=
 =?utf-8?B?K2lpbGxFUWNCRnlMd1pSRmhUbmVKaWlabnJJNWVjeXhLRjVCcmVYTTBKMkRW?=
 =?utf-8?B?WlpITnBNbmxaSXdicDhzazVPTGQ1dFhmL2tyaVVGNUVGd1hWUnpDcWdCSEJr?=
 =?utf-8?B?UWltNVpzUmRDRlY1SjVSY2hlWjRYR29BdjJIZDdnV3duSUFLQ3F4OHJzSVYy?=
 =?utf-8?B?OTdHcUJydmF4RVRvKzA5S1VXckJwOWk0czBMWDkyaWVVSC83dFRocWU2NGtI?=
 =?utf-8?B?QzA3TEVPdG9kemUxT0VrWjFva01TOTNRdG5HTTQxeEhUNkZWTWYwdmVUa0w3?=
 =?utf-8?B?eFRGM3E4VjFMSDBnRTc4ZTROM2lOU3VxWTQ5clZEdW5TUzRNL1lYSlVRN3Bx?=
 =?utf-8?B?UktDYlAvNEpiSFVuUWFYclBXam90Sy80THdXb0VmS1EvR1psanBVQkJNdnVw?=
 =?utf-8?Q?qFCPXwJ0tXHMALCw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31A00B988B234349AEB4F021F4FA0F04@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UG7/Ktgksdg/541/lF530Jt4LzOpOKB3+3SOW8+7A32WulNrRcjEIBEFmnoI0eZrLAMf4JPWhUqoW2Qbqz2TiMTznjekOju/IGMj7YdLpfyDUF9S2kvZmpC5ECKneVezdagwk7clA0UVtxBg4LcKJo0zWCsVojbe5VKQf+xfrqBIq9POLk9q7HU/5NdsZ4dIeBXj2ugsSF1G5QY0jUTn8Cfu66WnF5zg/IeW7FWbLVNY8mYxJTVgJi28Cln3vuLZwOQxB3zNvR44Qr+0BC+XahxWNZ1+0F4MvttT8RDWrNA/9cLek5ag7cj/8lcSD6AzaBAnqjTNfaOuc1pcFr+jxw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198e6e48-35b3-44ba-ea38-08df08da757f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 10:10:47.6417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1HlBOFQxCbJSUAghzkIKVEuK82iO+CvH5nGICuaGp6sazGuPgNnG3Wy+it04LUUr9IZbrGlQ6C3Rz107+XQsW+O4W1buDozkPml/uIOI0P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB968233
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

T24gVHVlLCAyMDI2LTA4LTI1IGF0IDExOjE1ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBQcm9ncmFtIHRoZSBBTFBNIHN3aXRjaCB0byBhY3RpdmUgbGF0ZW5jeSBpbnRvIEFMUE1fQ1RM
Mi4gRm9yIFVIQlINCj4gbGluaw0KPiByYXRlcyB0aGUgbGF0ZW5jeSBpcyBkZXJpdmVkIGZyb20g
dGhlIGxpbmsgc3ltYm9sIGNsb2NrIGFuZCBjb252ZXJ0ZWQNCj4gdG8NCj4gc2NhbmxpbmVzLCBm
b3Igbm9uLVVIQlIgcmF0ZXMgaXQgaXMgemVyby4NCj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIg
PGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5u
YSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAgfCAzMg0KPiArKysrKysrKysrKysrKysr
Ky0tDQo+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5owqDCoMKg
IHzCoCAxICsNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0u
Yw0KPiBpbmRleCA4YzE3ZGE5ODgzZDYuLjVkMmFjNzU2MTU2NyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gQEAgLTI3MCw2ICsyNzAsMzEgQEAg
c3RhdGljIGludCBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2Qoc3RydWN0DQo+IGludGVsX2RwICpp
bnRlbF9kcCwNCj4gwqAJcmV0dXJuIGVzdGFibGlzaG1lbnRfcGVyaW9kOw0KPiDCoH0NCj4gwqAN
Cj4gKw0KPiArc3RhdGljIGludCBnZXRfc3dpdGNoX3RvX2FjdGl2ZShjb25zdCBzdHJ1Y3QgaW50
ZWxfY3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSkNCj4gK3sNCj4gKwlpbnQgcG9ydF9jbG9jayA9
IGNydGNfc3RhdGUtPnBvcnRfY2xvY2s7DQo+ICsJaW50IHN3aXRjaF90b19hY3RpdmU7DQo+ICsN
Cj4gKwlpZiAoaW50ZWxfZHBfaXNfdWhicihjcnRjX3N0YXRlKSkgew0KPiArCQkvKiBzeW1ib2xf
Y2xvY2sgKGZMaW5rKSBpbiBNSHogKi8NCj4gKwkJaW50IHN5bWJvbF9jbG9jayA9IHBvcnRfY2xv
Y2sgLw0KPiBpbnRlbF9kcF9saW5rX3N5bWJvbF9zaXplKHBvcnRfY2xvY2spIC8gMTAwOw0KPiAr
DQo+ICsJCS8qDQo+ICsJCSAqIHRTd2l0Y2ggdG8gQWN0aXZlID0gMzIgKiAoTUxfUEhZX0xPQ0sg
TGVuZ3RoICsgMw0KPiArIDY0KSAvIGZMaW5rDQo+ICsJCSAqDQo+ICsJCSAqIFRoZSAiKyAzIiB0
ZXJtIGlzIHRoZSB0cmFpbGluZyB6ZXJvIHBhZGRpbmcgYWZ0ZXINCj4gdGhlDQo+ICsJCSAqIFBP
U1RfTFRfU0NSQU1CTEVSX1JFU0VULCB0aGUgIisgNjQiIHRlcm0NCj4gcmVwcmVzZW50cyB0aGUg
TVRQDQo+ICsJCSAqIHRpbWUgc2xvdHMuIFRoZSByZXN1bHQgaXMgaW4gbWljcm9zZWNvbmRzLg0K
PiArCQkgKi8NCj4gKwkJc3dpdGNoX3RvX2FjdGl2ZSA9IDMyICogKCgzOTYgKyAzICsgNjQpIC8N
Cj4gc3ltYm9sX2Nsb2NrKTsNCg0KWW91IGhhdmUgYWRkZWQgTUxfUEhZX0xPQ0tfTEVOX1VIQlIg
aW4geW91ciBlYXJsaWVyIHBhdGNoLiBJIHRoaW5rIDMyDQppbiB0aGlzIGZvcm11bGEgaXMgc2Ft
ZSBhcyBpbnRlbF9kcF9saW5rX3N5bWJvbF9zaXplLiBTbyB5b3UgY291bGQgdXNlDQp0aGF0Lg0K
DQpCUiwNCkpvdW5pIEjDtmdhbmRlcg0KPiArCX0gZWxzZSB7DQo+ICsJCXN3aXRjaF90b19hY3Rp
dmUgPSAwOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiBzd2l0Y2hfdG9fYWN0aXZlOw0KPiArfQ0K
PiArDQo+IMKgLyoNCj4gwqAgKiBBVVgtTGVzcyBXYWtlIFRpbWUgPSBDRUlMSU5HKCAoKFBIWSBQ
MiB0byBQMCkgKyB0TEZQU19QZXJpb2QsDQo+IE1heCsNCj4gwqAgKiB0U2lsZW5jZSwgTWF4KyB0
UEhZIEVzdGFibGlzaG1lbnQgKyB0Q0RTKSAvIHRsaW5lKQ0KPiBAQCAtMzI5LDcgKzM1NCw4IEBA
IF9sbmxfY29tcHV0ZV9hdXhfbGVzc19hbHBtX3BhcmFtcyhzdHJ1Y3QgaW50ZWxfZHANCj4gKmlu
dGVsX2RwLA0KPiDCoAljcnRjX3N0YXRlLT5hbHBtX3N0YXRlLmF1eF9sZXNzX3dha2VfbGluZXMg
PQ0KPiBhdXhfbGVzc193YWtlX2xpbmVzOw0KPiDCoAljcnRjX3N0YXRlLT5hbHBtX3N0YXRlLnNp
bGVuY2VfcGVyaW9kX3N5bV9jbG9ja3MgPQ0KPiBzaWxlbmNlX3BlcmlvZDsNCj4gwqAJY3J0Y19z
dGF0ZS0+YWxwbV9zdGF0ZS5sZnBzX2hhbGZfY3ljbGVfbnVtX29mX3N5bXMgPQ0KPiBsZnBzX2hh
bGZfY3ljbGU7DQo+IC0NCj4gKwljcnRjX3N0YXRlLT5hbHBtX3N0YXRlLnN3aXRjaF90b19hY3Rp
dmUgPQ0KPiBpbnRlbF91c2Vjc190b19zY2FubGluZXMoJmNydGNfc3RhdGUtPmh3LmFkanVzdGVk
X21vZGUsDQo+ICsJCQkJCQkJCQ0KPiAJwqDCoCBnZXRfc3dpdGNoX3RvX2FjdGl2ZShjcnRjX3N0
YXRlKSk7DQo+IMKgCXJldHVybiB0cnVlOw0KPiDCoH0NCj4gwqANCj4gQEAgLTYxOSw4ICs2NDUs
MTAgQEAgc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdCBpbnRlbF9kcA0KPiAq
aW50ZWxfZHAsDQo+IMKgCWx0dHByX2NvdW50ID0gZHJtX2RwX2x0dHByX2NvdW50KGludGVsX2Rw
LQ0KPiA+bHR0cHJfY29tbW9uX2NhcHMpOw0KPiDCoA0KPiDCoAlhbHBtX2N0bDIgPSBpbnRlbF9k
ZV9yZWFkKGRpc3BsYXksIEFMUE1fQ1RMMihkaXNwbGF5LA0KPiBjcHVfdHJhbnNjb2RlcikpOw0K
PiAtCWFscG1fY3RsMiAmPSB+QUxQTV9DVEwyX05VTUJFUl9PRl9MVFRQUl9NQVNLOw0KPiArCWFs
cG1fY3RsMiAmPSB+KEFMUE1fQ1RMMl9OVU1CRVJfT0ZfTFRUUFJfTUFTSyB8DQo+ICsJCcKgwqDC
oMKgwqDCoCBBTFBNX0NUTDJfU1dJVENIX1RPX0FDVElWRV9MQVRFTkNZX01BU0spOw0KPiDCoAlh
bHBtX2N0bDIgfD0gQUxQTV9DVEwyX05VTUJFUl9PRl9MVFRQUihsdHRwcl9jb3VudCk7DQo+ICsJ
YWxwbV9jdGwyIHw9IEFMUE1fQ1RMMl9TV0lUQ0hfVE9fQUNUSVZFX0xBVEVOQ1koY3J0Y19zdGF0
ZS0NCj4gPmFscG1fc3RhdGUuc3dpdGNoX3RvX2FjdGl2ZSk7DQo+IMKgDQo+IMKgCWludGVsX2Rl
X3dyaXRlKGRpc3BsYXksIEFMUE1fQ1RMMihkaXNwbGF5LCBjcHVfdHJhbnNjb2RlciksDQo+IGFs
cG1fY3RsMik7DQo+IMKgCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIEFMUE1fQ1RMKGRpc3BsYXks
IGNwdV90cmFuc2NvZGVyKSwNCj4gYWxwbV9jdGwpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaA0KPiBpbmRleCBmOGFjOThm
ZjhhODcuLjRjYmY1NmE5MTk1ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgNCj4gQEAgLTE0NDEsNiArMTQ0MSw3IEBA
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlIHsNCj4gwqAJCXU4IGF1eF9sZXNzX3dha2VfbGluZXM7
DQo+IMKgCQl1OCBzaWxlbmNlX3BlcmlvZF9zeW1fY2xvY2tzOw0KPiDCoAkJdTggbGZwc19oYWxm
X2N5Y2xlX251bV9vZl9zeW1zOw0KPiArCQlpbnQgc3dpdGNoX3RvX2FjdGl2ZTsNCj4gwqAJfSBh
bHBtX3N0YXRlOw0KPiDCoAlib29sIGhhc19hbHBtOw0KPiDCoA0KDQo=
