Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA112C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 06:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4541210E472;
	Wed,  2 Sep 2026 06:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3lBCMbn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2EA10E472;
 Wed,  2 Sep 2026 06:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788329666; x=1819865666;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XyuJCgcscsqPEUFF9CHPhjpKyyDviVCFWZICcfb7+aE=;
 b=Y3lBCMbnm3/f8v7NbYK7rps2USKVR2raGBOXoCng3CgUBwNSq0FLf521
 P6hU6agcResKj2R2/n1mtIHVZUvL03MZZUGDIVPZjeKj6dXtqhh05ebms
 9GO95eDuDmdk/J3JWY1kfUm4PW7tkqvmeXMjQziAyZiI9oFr01J5W/0gl
 xfoDNNIcxHIjtF+QEBISV4ofTo00zhklUHkP9iuT9PqyFLi5BrX+OGaeD
 yzo1OJth56o9bk8f7vgv/ItS2Voab1ndZ0wNITfTYpa2uZauPQCr+gcxb
 6AYp69BsNismBaT2vtOgyIM3vlerp23aLCeaNaaVHPFCF73GPrHGHtQ2K Q==;
X-CSE-ConnectionGUID: kJ2VCBx8QxeiOy6ubA3xsw==
X-CSE-MsgGUID: Wvoh43LNRpCBeAGN+47m3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88900340"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88900340"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:14:26 -0700
X-CSE-ConnectionGUID: DWQmxnQIRzq4E5mVxV0VxA==
X-CSE-MsgGUID: VPA1sgcSTMi4HmPy/+YEmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265595570"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 23:14:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:14:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 23:14:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 23:14:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqtspTD3davraTPfrANNoV97CAv/QNcdje9zL2T7nWSB1or2/wNgv7UYJp2b9E1THpB4aPVln4Icuk27LT2Dibw+2lkykVYa7jT2rihkDtwYcNwHo+SKs4+fp6htrlfQYMZY4lQ3l/DC1HuAUcx6OmypA1cosqyhEUgzGgRKoGkGCngrn7St+yulrKTs7DYsKaYMm/28OLMvwU0k3UAbW+btU+sSR3O1POFw7Mjtzr2o+cTSYBAbckv6PyIqWrkSo+Yd/oRF+BuBYAaxQjeDQyUCEcBwbh9MTRiREbXBjtH2oyjepTdhcx4HHdb43fD3TZJ+KKZTvJ1Saqrh7+wLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyuJCgcscsqPEUFF9CHPhjpKyyDviVCFWZICcfb7+aE=;
 b=QgJXCH3hubPv5sPL1TGJmTMClpJJR9tPcsq0Eu5EgroepLvM9/V+QjGyza0UbIoAH7PXdE7rFq65kOSdCIzAAZixwudxNtsqPVGt/Z2ON3fx1jjBm+JbIpYrRbexVvJBdsw2lluN7Qzwqy5zDu7z79WEidoNObLA6WRAOYiFbO/ztz2bzKdL2DCYUCO6hfe9gtGwB5IL/oypQx2AwnH1DG5mfQ+nhCyVVtBVjbYGHN1lodc4CQGUNA9OPSFg+jra9l9ZWuLROwrCzNC3s8XBkR78NsKNRDtkFErenFTt15thds5Py7tHuAa1ZrAGX5Z5DPvsLzraR7GpD3fDIazh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 06:14:14 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 06:14:14 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Manna, 
 Animesh" <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v5 04/15] drm/i915/alpm: Enable debugfs for DP2.1
Thread-Topic: [PATCH v5 04/15] drm/i915/alpm: Enable debugfs for DP2.1
Thread-Index: AQHdNFmt7dEYrJ/SXEyVglDpQLkwFLa629mA
Date: Wed, 2 Sep 2026 06:14:14 +0000
Message-ID: <9b70636293e7732df9af122fcf4fa319c9a46b4b.camel@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-5-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-5-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB6323:EE_
x-ms-office365-filtering-correlation-id: c1d2aca1-99c5-4fd3-3917-08df08b969b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: vNuhJwA39QOVGRgz310C1Ocfea8aNXY5vOuOMh3eJhIAqKzjGMfoWxM7wNnoXbQl2j0GHwAuoQOSlmVg0WtL9PH6xKdmCfLnojtkLH50gH1LNV1X2bDNVM2FWZBiBqvgmWFwJkMchBtDabNRxsV5pJs9mw7RJQQTj0cx9m4UQoAF8Ah5KV0pUah9zhsM4Fh2jpVpBjDOucNejjxtYiUxZBijx7Gf9LsUj/b/8iaSqg/l2RFRz2Kt69ydNO6i9K10e8+CmCoRqWHqdpncHDfYnI3GLMqcB2I5vxwRjEtTquNU/rbpenHp8xzjGcqv2avwY5Phorr1bW3Mg5IgOL+ymO16b8sx4qAX+dmiLTNXnX7aSpmRzjizaUjxLJR1fkepeEfXPMa6HhIUh1GsTO9DHEMrgF58d2d/Tz1DCd1OcegVbbxdPuRFLddGgnb8t3MQkHVPuSASgSrhcFzOk+Q7o68lcS+BvzheZJn2ufo04dBjpnkrYr9lazMLPS2aCi5nsjIQQ1MK86AZHL8UX0Us+slxG1dXjhZC0fYUSLZYtzEEF1aqXAAabYH0yAp9xY/9rVmn9+6LOE34TbH38v+POk0dxj4l9zm6yUG3WBM4wCMyMcCphA7CdIlRdCC0TZQDkHQ+JI7NH+yfrA+i4SzipYcATixOT3fSfKEKSGwbOHZDasY/qXFIsn96HBv6NGYBzPMu/0TQeKDm8nGwnt92rO5QdLeON4a29twatWlmUF4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnhMMUVDd0FWcXhVb0IwS24xSnladE5qbGlQVTVmcklZbkEvNldkNnBzL1Zt?=
 =?utf-8?B?bTJsTDNHaXBOa2VYTjVyK2V2VkkvUWRZOWtHTGlBdys1Slc0UUNjc3orZGZt?=
 =?utf-8?B?NEkxR1IvUnJpNy82Nkk1Yy91TldiYUZ5c09renh1VEZUSkJyUEJSS05BZHMv?=
 =?utf-8?B?UCs0VHpXMmhqNjRFWEVnamtrTEFMWWdjckR6ZmxyK3l2ZVMrbXFVYnVyd2Nq?=
 =?utf-8?B?ekFEdUZYUkJtTGlGK1I2TkRYSDg1cEFLK0VUMkdoNEovY09XMWlsMjAwSWZs?=
 =?utf-8?B?OExLNEIwUEhVZE1xajVWV3k0V0pzWnZEV2RGejlDMGJqSmtKWnlBVmoxMVEy?=
 =?utf-8?B?Wm1SUUxuVkJ6Rzk0cGZoWWhZeDZhV2RPYzBkRFNkNkk0ME42ZDhDMitPVzY4?=
 =?utf-8?B?bU5IbWM0TWVTU3dXWU95Q09SMG9QZkpGRlAzdUVhOEdVcTFiSml4NzFlcFNj?=
 =?utf-8?B?QTZmTzRrZXhpL0F5aHo5YTFZdENJRmd6ckZnamhTSlljeCtEdzZyTFhjdzRH?=
 =?utf-8?B?QkxHOFovQWd5bnZ3MElSN1paOFRUNzRvVlFITEFiV0RIU1BwQ0MvWlpiT0RH?=
 =?utf-8?B?bzAvQWs2WlpHQVg4ZXhQM0ozc1hwYitIcnRDemVZWW40TDhDVElkdlpXaHp0?=
 =?utf-8?B?aVkxV1dvMmxxZVNxUFQzbGFJVDJhNnJ1eTJaNzBtd25DKzg4aUxKZ1FSbWhi?=
 =?utf-8?B?eTlDMGlrTWRIOU1TVDIwSm4ya1kyVWxxSnVCU3dZVXhTMnRweWo1YkljVHNZ?=
 =?utf-8?B?MjdnNDVlSFEyaTFxU3FvT2hLT0l0c0tGOXFMYWlrUUoyblBYdHd3VlhLYzFh?=
 =?utf-8?B?YWRJU1dNVy84dXJrZzFrby9WWmVhYUg4NVdONVJWc01WUVNpS3lWOUZYSzBm?=
 =?utf-8?B?TDdxV05LT3VwN2I0cWxEemZaYURqWHFlQzI3V1Fqa01IdTNIUUFPQnFPMmJm?=
 =?utf-8?B?UnVobmtVMGFRS3BJay9ySXFabStyeFluNnZaRG4rdHJhQTQ1UmZzSFlhVXV2?=
 =?utf-8?B?VXpob2d6d2RqV1RQakdHemI5YjVwTHF1dHRaTFdlUGN0d1pIWVRBWUhhdGhL?=
 =?utf-8?B?MUc1eW1yZk9Sd09vTW1vTkZPM1NoMXBCSFdNMnJKU3FwWG1venkwdVVFUG55?=
 =?utf-8?B?VUdncmVzZG5VMlZLZGM2MFp6Q2Z2OEtWWUoya2txQTYvQlBycnpBYTcyRTdC?=
 =?utf-8?B?RXVpdzZLWWpZZUZtTUtLQ2Yxd1VEQXZxc0R1ZHJWQ1FUZENXMXdNaTZadjU4?=
 =?utf-8?B?SUs2eExnUStKZjlEamQ3RVFVK21PUEVBR3REWUp0NVE3TVg2R3JCMG9UelFI?=
 =?utf-8?B?Q2RXOG1EREROd1JFb2E2dHVyVS9FcjdxL3o0RVByckFqZTIyV0gzYkphbmJ2?=
 =?utf-8?B?dmRWbXFRMEZySWMrZmF2UmpMa3RCNGFEWVdtVmZCUTFuOXh4djdxN1l5Rlgr?=
 =?utf-8?B?NThueWppUUx6YTAvaHZPUm1LRnhPVFhweHZxYTZuVGJ0eEV0WDBqbVZMR0po?=
 =?utf-8?B?MmIrMDJBVUZCOTk5U2lRYjZxY2FpbDZla3M3UmFDS3pRL2I0V3c3VmFzazZr?=
 =?utf-8?B?UmNCVTB0Y25MREhZd1ZCK2VjSVBzU0tpWXR1TE1pUm5qY0k2WmtqVEV3WGZa?=
 =?utf-8?B?YVVzc1g3SXhrTWNJNW5udjlYUTlhN3RpSnNtejI5NmNUaVY0ajJLb212cEhr?=
 =?utf-8?B?M1l3bE9Gc3dobnRqbjc4Zi8yMExiakdqYmZxTk1sRHJYQUsycDU4OG4rbnBv?=
 =?utf-8?B?aUU4cHgxMkZpb0ZFVmo2Vml1MDVaZmI1eit2OXRzdW1HbXZweFY1a3NpTUUw?=
 =?utf-8?B?enkwN1U4QnVWK1hRSEtyaG9EdTIrQ0tEQmk2cml6ckUralpZeDYrS3Vza2RU?=
 =?utf-8?B?SjMwQUNweUhVVVV5bDhKLzUyMVdXS1RpckxuVXdvVlM5U3VVeENFUC9YQ09Z?=
 =?utf-8?B?TWNvU2psa2N6SnZ0dUg0QXJCWmxFaGE2M2UzSVl5a1cxSEZIcHp0TWJrM3VX?=
 =?utf-8?B?UjBGUUxVWTIzZk5uZzFrVGs2c2M3QjlzT3ptVXd0bk5PRlJjQ0hwSkxpSjgz?=
 =?utf-8?B?dWVhZTVuNUg0Ni9zUTlhSURid3VoOE1XeW5VTWhaMEZONXdYLytGMzRNczBS?=
 =?utf-8?B?cWRRMWhqem5ETnp0UlhWcCtFVVhmNzB2QVRDbkRFU0pPV2VvRlFQeW9FUUF5?=
 =?utf-8?B?OGk0RWkycFI3SUdaVmlvY2VzMm14QkpoQ0NzU2ZxU0g0K2JobWxKeTZzODdY?=
 =?utf-8?B?bC9jeDN5bkxaSHN3NE8wandLUWZDTE5RZ0FzRmorbVlIYXQ5Tkw1VUcyT3hp?=
 =?utf-8?B?aFlNNTlBeVY5WTR5WFlLNGNhUVFWTUtGalQ2TS84ZmUvcmFoUTZSdzVCL3FU?=
 =?utf-8?Q?Ho8oMxkEkOfWMKSA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E84EBBBEE8010941B8E17BAB6E81285C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Fj3dwAO5AqBmNBJBuZv9siCMc0Adc9uvK6Fb2PnP/arlpG6SOpMUR9psZmqRyMfCf1Yex5IIIF0XBNxSpzWZ4f+KKhUnRWjXah9IkZzaeC1K8A6kAbaHLVuutAonkmJoFXaD3nrJ10LU5IGZSysqfY0vxdMH9LGNj4hEY8WIpI+1yo2dI9F9j6BzolBvXM4xf2N+6jbcI2X2h4EtWpLQEb6jXHGL9lN2ezlxpl+tDvZz19WwFktagHTrHQIrKYQKT0X1HDPDTJtseeFvs6NV+img7OoZumh1tE5JDB3TrnP8+P3KOqceGy3EV15amF6k3utN5gEgnOqT8OUEpKy34w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d2aca1-99c5-4fd3-3917-08df08b969b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 06:14:14.4936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIQ2toar5NHpKUNrmkLlxzXEqXXEPepCEvWnNsOOu/ELoXuWA4C/JCffI3q0f01bBtmqbw8SVp7pM5da6CouUnMP19kNG4mzVCnblXJvcvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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
PiBFbmFibGUgQUxQTSBkZWJ1ZyBpbmZvIHRocm91Z2ggbG9iZiBkZWJ1ZyBpbmZvLg0KPiANCj4g
djI6IGNvc21ldGljIGNoYW5nZS4gW1N1cmFqXQ0KPiB2MzogVXNlIGNvbW1vbiBhcGkgaW5zdGVh
ZCBvZiBESVNQTEFZX1ZFUiBjaGVjayBpbiBtdWx0aXBsZSBwbGFjZXMuDQo+IFtKYW5pXQ0KPiAN
Cj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBSZXZp
ZXdlZC1ieTogU3VyYWogS2FuZHBhbCA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYyB8IDQgKy0tLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+IGluZGV4IDA4
YWQ3N2NkMzJmOC4uOGNmY2RhOTdjZjU4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2FscG0uYw0KPiBAQCAtNjE3LDExICs2MTcsOSBAQA0KPiBERUZJTkVfU0lN
UExFX0FUVFJJQlVURShpOTE1X2VkcF9sb2JmX2RlYnVnX2ZvcHMsDQo+IMKgDQo+IMKgdm9pZCBp
bnRlbF9hbHBtX2xvYmZfZGVidWdmc19hZGQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQ0KPiDCoHsNCj4gLQlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVs
X2Rpc3BsYXkoY29ubmVjdG9yKTsNCj4gwqAJc3RydWN0IGRlbnRyeSAqcm9vdCA9IGNvbm5lY3Rv
ci0+YmFzZS5kZWJ1Z2ZzX2VudHJ5Ow0KPiDCoA0KPiAtCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5
KSA8IDIwIHx8DQo+IC0JwqDCoMKgIGNvbm5lY3Rvci0+YmFzZS5jb25uZWN0b3JfdHlwZSAhPQ0K
PiBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQ0KPiArCWlmICghaW50ZWxfYWxwbV9zb3VyY2Vfc3Vw
cG9ydGVkKGNvbm5lY3RvcikpDQoNCk1heWJlIHdoYXQgeW91IGFjdHVhbGx5IHdhbnQgaXMgaW50
ZWxfYWxwbV9sb2JmX3NvdXJjZV9zdXBwb3J0ZWQNCihyZWZlcnJpbmcgbXkgY29tbWVudHMgb24g
cGF0Y2ggMyk/DQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gwqAJCXJldHVybjsNCj4gwqAN
Cj4gwqAJZGVidWdmc19jcmVhdGVfZmlsZSgiaTkxNV9lZHBfbG9iZl9kZWJ1ZyIsIDA2NDQsIHJv
b3QsDQoNCg==
