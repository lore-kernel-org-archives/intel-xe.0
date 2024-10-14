Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4A3D1625B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 13:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE13A10E2C6;
	Mon, 14 Oct 2024 13:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INYvVanW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28FB10E2C6
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728911313; x=1760447313;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Eyn6J/1JzNjSDDTgn+IoPy21ORI4RGv1JcrMq1h4RRA=;
 b=INYvVanWtPCp4cd71GYVN9Rr9nkD+JU1JTYtMEenfrgvNlyIj0nFJMdg
 SO9GuGnuWOeI2N7Iyl2JCPSsxViEkQErX2MF04Xtzk18jN99G80LwCqbZ
 w3396SRGrl+NaP+/qWrDd9vKCPQHeNBEPxM/D+Bj2x5juBAtALiaSxhVa
 Hl/n9pGi2sAS5LKt2+/oUWud9LBxI30rW0lIhpf4gtzL2pWzS36MV9es5
 +TtkAmGdIaozPbnQpVD2kResPYVgYX7IIBo+vhSyORBjhAQo2JJ2vboze
 hmiMnH3xXOzPPeFJ+zzG5mPZ2N7mRjLRk/5+1Eql6uwGay+x27naUEnRB Q==;
X-CSE-ConnectionGUID: U7C34V32SNua6zRBwlCIjw==
X-CSE-MsgGUID: oHGxAnxmRFiXV3+fScqA4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38812394"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="38812394"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 06:08:32 -0700
X-CSE-ConnectionGUID: wz0Dks35THGXnin1k0dA6A==
X-CSE-MsgGUID: +QhaoLInTs+rb6taJJtFDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77667573"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 06:08:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 06:08:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 06:08:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 06:08:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 06:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eqnbc85MkCXImq+fp/xM3h3VG0v0ibOUdiL+7xLiTtJapvBLQCXv7eaWnxQvfQx8insQQVSRVw4kgpvjzE6QNtmjVkgygQQ1J4REcFR5uAB/0/o88OOOr05QAPs1MC42joXRS/6ao4iYci50hoN2UI84onrC+8suCqKUkWUJLQqO69cVGQz0v2TIaefy3MqGhjyg4O2HsGN+CFvqX3BFahCL9yltLq/9RXOjn+tILz+ABE2BkD4kgsv0WRtq/J/9giObi5QVBfpCebIkYmEtqqSU+oOwVz1vraKSCTen8kaaJa3KxWuIjDj5/7aYuej7OOqY3U0q3c6fILjTJxKjig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eyn6J/1JzNjSDDTgn+IoPy21ORI4RGv1JcrMq1h4RRA=;
 b=HPVufiPYSn/hkXiYKaYrmZdmGK6gqXMPFOPNV2I7VZdb+h8xjgsVlzmVioVuVTs153yFeJlXjFYCf+hR5x/rI5BBfx8nC4U/QHM4Fvjduje6kQjfoVy40rEt6drVBkd7X6dUofX/OFCcyQsb7MvE1UhRDlsVVQgHjtvLxEt74nJl9klbsY+WgYmAjqRxc15FPlb0HUGQdsdfGLQGowZQiN9QXWEfEQetKVYEMvkc0Hv7Ft2N6IrphEqrc4uXssVi2cEjQ8uNXk4ghjoRNydPQXr2qCNFzhWSGq7Tq0NPH+i0oMccY0XogrO8MK5+6n/vO79oGgU8Sp8iDHRcxDcnRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.26; Mon, 14 Oct 2024 13:08:26 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::3c10:ee83:63ac:867f%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 13:08:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Topic: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
Thread-Index: AQHbGjMg8Jp//ueXMEqEEybxX62qF7J+ccYAgAeabpCAABDpAIAAFEzQ
Date: Mon, 14 Oct 2024 13:08:26 +0000
Message-ID: <DS7PR11MB6197DD082F407482D23E655281442@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20241009101004.664216-1-tejas.upadhyay@intel.com>
 <c55c17c9-9882-4124-918b-88b951469185@intel.com>
 <SJ1PR11MB6204E78CF08AFA14DA26E2A181442@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <e8f4f5fd-d7a1-4ca9-8a62-543d10c32a15@intel.com>
In-Reply-To: <e8f4f5fd-d7a1-4ca9-8a62-543d10c32a15@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|SA0PR11MB4606:EE_
x-ms-office365-filtering-correlation-id: 9cb00a0d-fe16-4f4d-1d45-08dcec514a67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OGJUeEhXOXloQXVyU3gxMW1WTGVEejhqNUdPZFZXTytUSmxseXh4QlJoaUNG?=
 =?utf-8?B?SU5DT2NDc3Q2SWt1OE1aaHdJakhZM2VUYnBKZXRJMVh3dXJoVHFqeWtNNm5x?=
 =?utf-8?B?RThUTXJ3V1JLQ1lIQ1cvQkdaUytYcmhmR0t1M3hBKzMycmN4U1A4Mko1cDRy?=
 =?utf-8?B?R0dCdHpzSnpEQ3VtbEgveFJPZVVSdDZ3UWwyVzdDTHJwaGRwSk5ySDJIWlcw?=
 =?utf-8?B?aE1mNTFjT2FGKzNBbUJnNERlWWJTSnZjZW1LajA2WTUxOWRteEtTY3BPK1Uz?=
 =?utf-8?B?K25XbzZCMlhCWGF3NXlhTjZYbTRTWXlFWFN6NHZHN2FJelVMMzVMV2M4aFRR?=
 =?utf-8?B?ZGt6TEowemp0c3VTZFJlenhldHJUbnJvQkd6OWxIcVFFdlczakxJMTFhTGpE?=
 =?utf-8?B?ZG53SHJNNkV2R1Z0eENnMXpqV3FqQ0J0aHdxaENjb0tTUjYvckMwc1ozVnRB?=
 =?utf-8?B?WGorVUF5YWVYckdQLytTSGZITG5ZbmowelJXeFlPeDg3Nng2R2NWL1NtVjds?=
 =?utf-8?B?dmEzTzB2aGR1dDc1dkYvUWo1azdIckVrdXZqdTRUZTNnSlgyWG5mVWNMMWlC?=
 =?utf-8?B?SDljZ0QxaVJ3ejlPcWlxM0o5QlhsQm5zR1Bqb3dxaXNnSTR1cGoxVmsya0dX?=
 =?utf-8?B?cWhnY2tuV09GQWdqQ1NQNDhzdUFmTjQvNU1Gbjk0cHJCM3lna1JEMmc5Zm12?=
 =?utf-8?B?cVc5V3E1ciszaitPaGNPdFE3TjA5V1JveVlBZ0VHWEJRRHp2S3BGaVc2K0FF?=
 =?utf-8?B?VVBhc0hlb0N2RWNmQkNYeGFWakkwTHJodEhTNUZLTkl3R0F2bEZkalJxVmdT?=
 =?utf-8?B?YldNWVYyRVlMVnhSRCtLbEpyM1d0aGJRR2grUEFucnNzRUs2UTFUWGRZTEo4?=
 =?utf-8?B?dGVYUDI1bjNFTFZyWFU5L2I4azcwdWtuaERQYXROLzlFMEZiMXpDTjE5WHVD?=
 =?utf-8?B?UDhaVjZjRUJmdm1FN0ttQUVuTjJtOWdXa3UveHhJcTBBT1B5SGpYdHY2MzRz?=
 =?utf-8?B?T2JzcTUvVjdWd2E3eWtEb082M095S1hxNzNWWDVmQ3dVUGdhQzRESkNqaVhi?=
 =?utf-8?B?cmdzajhhNitGS0hOWXMvSkhoRFg3ay9Bb1U5MDJ6WEF3ZEh5YUFBNGplaEY3?=
 =?utf-8?B?d2xxa3JENTJGdThvMUFpUDVob29oR0dCa3pQbnJHbDI1N2U3MGU3OXo5VnBh?=
 =?utf-8?B?UU5SZlM1cnVuZVJieHYxYklTK1RHait5NjNUT25GbHREVStqQUo4OTZ0eDBi?=
 =?utf-8?B?SUh1K211bjFSaEVhN0Izd0hKb0NLYlZFcG1GM1BjTjdXeFhqd2dBa0pVUHgy?=
 =?utf-8?B?NGRnOE9qQmJ0RmNWV3A3dXVXRUR1MmZjelVGV3QyTWxXam9QN0JHNUMzT0kv?=
 =?utf-8?B?SkxodnN5YUd4ZFJSTzRnaDJmeFNVWEl3cjVxaEtoUzcvcVEvZXNFMFBuU0dI?=
 =?utf-8?B?RVhxN2pXcllKaVA3UzFmczBMVE5RblBRUXVuSU9TMjArY2ZyMnJkZXFhUlpv?=
 =?utf-8?B?VzZNYUFxQVFBWCtaUlh4ampoY1JBaVhhWFRMQmxlMHZaU0NMZG9CUXFINGsv?=
 =?utf-8?B?OEdVKzlvN3h2OHloejlxdFBDSXg5MDc4WHY5Z1V4KzNJUzAzelNldkl2cTlT?=
 =?utf-8?B?YS8yYTVGUkVocGYrNjNGTDhtbTRqM2pnaEhqSk11SjlQdHJCNnkvME9YaEVv?=
 =?utf-8?B?Z0NGY0dScmFaNW5LMXo0S2FmSVVCSWo5UWt4Zzh2NHBucmw5elJhZEl3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THJob3JNQWI3OGR4cEd5WUcva2IrdEJsdWU2WHZyZDRSdERob2d4bzEvUFFU?=
 =?utf-8?B?QnllWEdRTlJxWXRnb1NQVDU1bTVsYzJXdXhFRzZyYS8vT2NPZnJobXB6ZWNh?=
 =?utf-8?B?OVlJdG93emRiUEFKUTBEcC9wcUVpa0dJOWwzUENlVGtobHdPb3ZNZER4V3ZL?=
 =?utf-8?B?OEwyR2pwVytZRXRXTGFQMU15UzR6YzNZVDYveVpFendlTnRHMGFrY29wUFZp?=
 =?utf-8?B?UkpGd1pVSDc3MXdQN09QSzJEVVFqMDRsSlVPeFZ4UnJJaU5IWVcwYjR0RHVG?=
 =?utf-8?B?cGRnMi9UN2hmaDNOd3ovQVo0WnprdG1udktqdFNPYkNOVFNmSG80V1NPcHlV?=
 =?utf-8?B?QU5NajlHZ0JmWW9VM0NqeC9uNTVzMFlWSlZqcFlMdnVKb2FKL1Q2aDlZVnZa?=
 =?utf-8?B?K0dEaFJFaDRoMVFYbXpBTlIvWDVpYTk0N3BtVUY5czEzbVpwMUFXcVV2ZitX?=
 =?utf-8?B?V3dGb0V1TlpMSXpwejAvQkJ3a0dyTGh3czkvVVl5cStjTFU1VThaZ0JkTGNY?=
 =?utf-8?B?djRrSHVnQTFITDhRSktuYzNMczhiajFiZWdRSnhaVFJpamhUVERLR3FXTFR0?=
 =?utf-8?B?cmtBeEgvY0lSRkt4R3VhQXBVejVKdDV4ck44Yi9jN3VOZXdZWnZweVRsR3dB?=
 =?utf-8?B?Ylp6RzBUU0tPR21RTG1jSDlLYkE5Mm1FSVc2bi82eGVFRHcxWW9mWmM2VEFE?=
 =?utf-8?B?VlZ4S3ZyUE0xY2RESVRENnhPZFAyRDYyd29hVEZIbC9FR0hudHl6Wmx1UDZH?=
 =?utf-8?B?V1l4c0ZNelBSYlJnVXk3K21qdWkrT01OTGcvbXV0bHphZFB6d0REMVhrejBx?=
 =?utf-8?B?VHhRaTNvamM5MDZCWncwWmlweHVMa2JIa1FPWklKNXBvbkswQlhHTVRnQk0x?=
 =?utf-8?B?alVvWEk4YkJaUGZaRFZJbGc0VTIyYTVCTDRYWDVLZ2FLUEZhU0hiSjBRZVY3?=
 =?utf-8?B?WURJOWRCaldRcFM3MEE3UVZTSE1XSEVRcEgvTDRpWDFodUI3WGtqQ0dXeSts?=
 =?utf-8?B?aGZ2cjQvZFY3OFVkTUFocmRMSFU5aXNvNTJ2RUNVQ3Nxd3hMQ1hLcW5yU0Fx?=
 =?utf-8?B?cGl1MlVRUDZNYkFBMUg0K0tLcDMwUlRDZ2xJV1FMK0tUWU0zckFkeTg3aDlQ?=
 =?utf-8?B?enRNRzdjUnorSmxlZ29vMlBZbktqR1gyZ1pqTmJtWG85aXJzaDNQMGlWcWtm?=
 =?utf-8?B?K2NsV0l4VDBuSFY2RHY5L2plSUFjSUdRT3UxK1BKcnZNbisyK280cDg4LzVi?=
 =?utf-8?B?bE1UODE1MTV3K3Z3K0VzVi9uYnBwd0Vjek44dFZvTko0L2prYmlTYmZhbWlK?=
 =?utf-8?B?dXhEaUVlMy9DdUJQMnV5ODV5Ny8xQWpGcFg2RHQxS1FSQ1NDbkdJbXFCcXov?=
 =?utf-8?B?STJjaDhJaW4rOFN2eHc3RDY0azRYdHV3a2kydHBQZUdjek93akIxK252bmpH?=
 =?utf-8?B?VEFYTEtVL0dwZmRqUWVqV1Avc3JHd3hrdDZNd1lHV2lEOHl4T29sZEoyYi8x?=
 =?utf-8?B?aEsxUGJ5WThmYW80TVR4UVcyK3o3K29lV2dHeWcyS0o0RldhVWtWVkdRZHEz?=
 =?utf-8?B?RlhET08rakFiZVY5WVdEMG5wY05GN0pVTUkyVE1vVDFESmVqK1dTYzZUdks1?=
 =?utf-8?B?YStQcitRQWpjM01LZG00b3hWa3l0Q0JCaHVJSnhKWHBub1drR3VRSzZXOS9V?=
 =?utf-8?B?dzByc1NYaWMrYndaTWpFZWxoWnBENVErRHZPbGFJOERuQVpJb2s1eXl1WjRF?=
 =?utf-8?B?OVN4K1lBa2F3a0lmQ3I5WnRPQTJMcHdWMXRhUlE5RSs5ZEUvQzVIWHkyb2hS?=
 =?utf-8?B?bUxCWDhxRXFMaVdWRmF5emUwa2V1QTB1RFhOblJmNFI3cnZtdWQyclpQZmxv?=
 =?utf-8?B?RE9VQm9JT0N2ZDJqeXYzamRjaCsyNlc2NVljTTY0dGtvR3ZaQ0NnTXFlNGVG?=
 =?utf-8?B?RDlYTGRwL2FvMjUyeXBmaWJBRGpqWkVpbXF4U241N2dOZjNuQ2FkSXYzb3px?=
 =?utf-8?B?SXJpc2Z0Yi8rdnhPNHdiMndkQzlmZ2g5UGNVQ1hLZmhMVzEwMlFSUXpHeHlx?=
 =?utf-8?B?TUVNUU5DRUUwNVNjMWNXNEl2ZGVxbm1lcUNGZFA5OFlMbU4xOFp2akQvT0xl?=
 =?utf-8?Q?XbpBYzgi7hz6OcM20oeG6sQL/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb00a0d-fe16-4f4d-1d45-08dcec514a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 13:08:26.4093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLmfE3W2lpSVC8CYwuu6i7lNhS3/jPETvh36ymWEeQXnkOCXXAzUJyJOUHPc2V7xZo1CibSXNNh8Fb9dFv6RCIPID+GsPtKg+r3pp31I8gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE0LCAyMDI0
IDQ6MzQgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBkcm0veGUvbW1hcDogQWRkIG1tYXAgc3VwcG9ydCBmb3IgUENJIG1lbW9yeQ0KPiBiYXJy
aWVyDQo+IA0KPiBPbiAxNC8xMC8yMDI0IDExOjIzLCBVcGFkaHlheSwgVGVqYXMgd3JvdGU6DQo+
ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBBdWxk
LCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXks
IE9jdG9iZXIgOSwgMjAyNCA3OjI3IFBNDQo+ID4+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFz
LnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0KPiA+PiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL21tYXA6IEFkZCBtbWFwIHN1cHBv
cnQgZm9yIFBDSSBtZW1vcnkNCj4gPj4gYmFycmllcg0KPiA+Pg0KPiA+PiBIaSwNCj4gPj4NCj4g
Pj4gT24gMDkvMTAvMjAyNCAxMToxMCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4+PiBJbiBv
cmRlciB0byBhdm9pZCBoYXZpbmcgdXNlcnNwYWNlIHRvIHVzZSBNSV9NRU1fRkVOQ0UsIHdlIGFy
ZQ0KPiA+Pj4gYWRkaW5nIGEgbWVjaGFuaXNtIGZvciB1c2Vyc3BhY2UgdG8gZ2VuZXJhdGUgYSBQ
Q0kgbWVtb3J5IGJhcnJpZXINCj4gPj4+IHdpdGggbG93IG92ZXJoZWFkIChhdm9pZGluZyBJT0NU
TCBjYWxsKS4NCj4gPj4NCj4gPj4gSSBndWVzcyBpdCBkb2Vzbid0IHdvcmsgaWYgd2UganVzdCBk
byBWUkFNIHdyaXRlIGZyb20gdGhlIGhvc3Qgc2lkZT8NCj4gPg0KPiA+IFdyaXRpbmcgdG8gVlJB
TSB3aWxsIGFkZHMgc29tZSBvdmVyaGVhZCB3aGljaCBVTUQgd2FudHMgdG8gYXZvaWQuIFNvDQo+
IHRoZSBzdWdnZXN0aW9uIGNhbWUgb3V0IHdhcyB0byB1c2Ugc3BlY2lhbCBNTUlPIHBhZ2UgbWFw
cGVkIGRpcmVjdGx5DQo+IHdoaWNoIGlzIG5vdCBhY2Nlc3NpYmxlIGZyb20gdGhlIFBDSSBidXMg
c28gdGhhdCB0aGUgTU1JTyB3cml0ZXMgdGhlbXNlbHZlcw0KPiBhcmUgaWdub3JlZCwgYnV0IHRo
ZSBQQ0kgbWVtb3J5IGJhcnJpZXIgd2lsbCBzdGlsbCB0YWtlIGFjdGlvbiBhcyB0aGUgTU1JTw0K
PiBmaWx0ZXJpbmcgd2lsbCBoYXBwZW4gYWZ0ZXIgdGhlIG1lbW9yeSBiYXJyaWVyIGVmZmVjdC4N
Cj4gDQo+IFdvdWxkIGJlIGdvb2QgdG8gYWRkIHRoaXMgaW5mbyB0byB0aGUgY29tbWl0IG1lc3Nh
Z2UuDQoNCk9rLg0KDQo+IA0KPiA+DQo+ID4+DQo+ID4+Pg0KPiA+Pj4gVGhpcyBpcyBpbXBsZW1l
bnRlZCBieSBtZW1vcnktbWFwcGluZyBhIHBhZ2UgYXMgdW5jYWNoZWQgdGhhdCBpcw0KPiA+Pj4g
YmFja2VkIGJ5IE1NSU8gb24gdGhlIGRHUFUgYW5kIHRodXMgYWxsb3dpbmcgdXNlcnNwYWNlIHRv
IGRvDQo+IG1lbW9yeQ0KPiA+Pj4gd3JpdGUgdG8gdGhlIHBhZ2Ugd2l0aG91dCBpbnZva2luZyBh
biBJT0NUTC4NCj4gPj4+IFdlIGFyZSBzZWxlY3RpbmcgdGhlIE1NSU8gc28gdGhhdCBpdCBpcyBu
b3QgYWNjZXNzaWJsZSBmcm9tIHRoZSBQQ0kNCj4gPj4+IGJ1cyBzbyB0aGF0IHRoZSBNTUlPIHdy
aXRlcyB0aGVtc2VsdmVzIGFyZSBpZ25vcmVkLCBidXQgdGhlIFBDSQ0KPiA+Pj4gbWVtb3J5IGJh
cnJpZXIgd2lsbCBzdGlsbCB0YWtlIGFjdGlvbiBhcyB0aGUgTU1JTyBmaWx0ZXJpbmcgd2lsbA0K
PiA+Pj4gaGFwcGVuIGFmdGVyIHRoZSBtZW1vcnkgYmFycmllciBlZmZlY3QuDQo+ID4+Pg0KPiA+
Pj4gV2hlbiB3ZSBkZXRlY3Qgc3BlY2lhbCBkZWZpbmVkIG9mZnNldCBpbiBtbWFwKCksIFdlIGFy
ZSBtYXBwaW5nIDRLDQo+ID4+PiBwYWdlIHdoaWNoIGNvbnRhaW5zIHRoZSBsYXN0IG9mIHBhZ2Ug
b2YgZG9vcmJlbGwgTU1JTyByYW5nZSB0bw0KPiA+Pj4gdXNlcnNwYWNlIGZvciBzYW1lIHB1cnBv
c2UuDQo+ID4+Pg0KPiA+Pj4gTm90ZTogVGVzdCBjb3ZlcmFnZSBmb3IgdGhpcyBpcyBhZGRlZCBi
eSBJR1QNCj4gPj4+ICAgICAgICAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoLzYxODkzMS8gIGhlcmUuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVGVqYXMgVXBh
ZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPj4NCj4gPj4gTmVlZHMgc29tZSBV
TUQgQ2MuIFRoaXMgd2FzIHJlcXVlc3RlZCBieSBzb21lIFVNRD8NCj4gPg0KPiA+IFllcywgSSB3
aWxsIGFkZCBzb21lb25lIGluIGNjLg0KPiA+DQo+ID4+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyB8IDY4DQo+ID4+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2UuYw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmMgaW5kZXggY2QyNDFhOGUxODM4Li5jOTdhNGQxZjBhOTgNCj4gPj4+IDEwMDY0NA0KPiA+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gPj4+IEBAIC0yMzksMTIgKzIzOSw3OCBAQCBzdGF0
aWMgbG9uZyB4ZV9kcm1fY29tcGF0X2lvY3RsKHN0cnVjdCBmaWxlDQo+ID4+PiAqZmlsZSwNCj4g
Pj4gdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG8NCj4gPj4+ICAgICNkZWZpbmUgeGVfZHJt
X2NvbXBhdF9pb2N0bCBOVUxMDQo+ID4+PiAgICAjZW5kaWYNCj4gPj4+DQo+ID4+PiArc3RhdGlj
IHZvaWQgYmFycmllcl9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKSB7DQo+ID4+PiAr
CWRybV9kZXZfZ2V0KHZtYS0+dm1fcHJpdmF0ZV9kYXRhKTsNCj4gPj4+ICt9DQo+ID4+PiArDQo+
ID4+PiArc3RhdGljIHZvaWQgYmFycmllcl9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSkgew0KPiA+Pj4gKwlkcm1fZGV2X3B1dCh2bWEtPnZtX3ByaXZhdGVfZGF0YSk7DQo+ID4+PiAr
fQ0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1
Y3Qgdm1fb3BzX2JhcnJpZXIgPSB7DQo+ID4+PiArCS5vcGVuID0gYmFycmllcl9vcGVuLA0KPiA+
Pj4gKwkuY2xvc2UgPSBiYXJyaWVyX2Nsb3NlLA0KPiA+Pj4gK307DQo+ID4+PiArDQo+ID4+PiAr
c3RhdGljIGludCB4ZV9wY2lfYmFycmllcl9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLA0KPiA+Pj4g
KwkJCSAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkgew0KPiA+Pj4gKwlzdHJ1Y3Qg
ZHJtX2ZpbGUgKnByaXYgPSBmaWxwLT5wcml2YXRlX2RhdGE7DQo+ID4+PiArCXN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSBwcml2LT5taW5vci0+ZGV2Ow0KPiA+Pj4gKwl1bnNpZ25lZCBsb25nIHBm
bjsNCj4gPj4+ICsJcGdwcm90X3QgcHJvdDsNCj4gPj4+ICsNCj4gPj4+ICsJaWYgKHZtYS0+dm1f
ZW5kIC0gdm1hLT52bV9zdGFydCA+IFBBR0VfU0laRSkNCj4gPj4+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiA+Pj4gKw0KPiA+Pj4gKwlpZiAoaXNfY293X21hcHBpbmcodm1hLT52bV9mbGFncykpDQo+
ID4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsNCj4gPj4+ICsJaWYgKHZtYS0+dm1fZmxh
Z3MgJiAoVk1fUkVBRCB8IFZNX0VYRUMpKQ0KPiA+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4+
PiArDQo+ID4+PiArCXZtX2ZsYWdzX2NsZWFyKHZtYSwgVk1fTUFZUkVBRCB8IFZNX01BWUVYRUMp
Ow0KPiA+Pj4gKwl2bV9mbGFnc19zZXQodm1hLCBWTV9QRk5NQVAgfCBWTV9ET05URVhQQU5EIHwN
Cj4gPj4gVk1fRE9OVERVTVAgfCBWTV9JTyk7DQo+ID4+PiArDQo+ID4+PiArCXByb3QgPSB2bV9n
ZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOyAjZGVmaW5lDQo+ID4+IExBU1RfREJfUEFHRV9P
RkZTRVQNCj4gPj4+ICsweDdmZjAwMQ0KPiA+Pj4gKwlwZm4gPSBQSFlTX1BGTihwY2lfcmVzb3Vy
Y2Vfc3RhcnQodG9fcGNpX2RldihkZXYtPmRldiksIDApICsNCj4gPj4+ICsJCQlMQVNUX0RCX1BB
R0VfT0ZGU0VUKTsNCj4gPj4+ICsJaWYgKHZtZl9pbnNlcnRfcGZuX3Byb3Qodm1hLCB2bWEtPnZt
X3N0YXJ0LCBwZm4sDQo+ID4+PiArCQkJCXBncHJvdF9ub25jYWNoZWQocHJvdCkpICE9DQo+ID4+
IFZNX0ZBVUxUX05PUEFHRSkNCj4gPj4+ICsJCXJldHVybiAtRUZBVUxUOw0KPiA+Pj4gKw0KPiA+
Pj4gKwl2bWEtPnZtX29wcyA9ICZ2bV9vcHNfYmFycmllcjsNCj4gPj4+ICsJdm1hLT52bV9wcml2
YXRlX2RhdGEgPSBkZXY7DQo+ID4+PiArCWRybV9kZXZfZ2V0KHZtYS0+dm1fcHJpdmF0ZV9kYXRh
KTsNCj4gPj4NCj4gPj4gV2hhdCBpcyBnb2luZyBvbiBoZXJlIHdpdGggcGNpIHBvd2VyIHN0YXRl
cz8gU2F5IGRldmljZSBnb2VzIGludG8NCj4gPj4gZDNob3Qgb3IgZDNjb2xkIGFuZCB5b3UgdG91
Y2ggdGhpcyBtbWlvLCB3aGF0IGhhcHBlbnM/IERvIHlvdSBnZXQgcGNpDQo+ID4+IGVycm9ycyBp
biBkbWVzZz8gRG9lcyBycG0gbmVlZCB0byBnZXQgaW52b2x2ZWQgaGVyZT8gTWlnaHQgYmUgZ29v
ZCB0bw0KPiA+PiBoYXZlIGEgdGVzdGNhc2UgZm9yIHRoaXMuDQo+ID4NCj4gPiBJIGFtIG5vdCBz
dXJlIGhlcmUuIEJ1dCB3ZSB3aWxsIGhhdmUgZm9sbG93IHVwIElHVCBwYXRjaCBvbmNlIGJhc2lj
IElHVCBpcw0KPiBtZXJnZWQsIHdoZXJlIHdlIHdpbGwgdHJ5IHRvIGFkZCB0ZXN0IHlvdSBhcmUg
c3VnZ2VzdGluZyBoZXJlLg0KPiANCj4gSSB0aGluayB3ZSBuZWVkIHRvIHVuZGVyc3RhbmQgdGhp
cy4gSWYgd2UgbmVlZCBycG0gaGVyZSwgdGhlbiB0aGUgZGVzaWduDQo+IG1pZ2h0IG5lZWQgdG8g
Y2hhbmdlLCBzaW5jZSBncmFiYmluZyBycG0gZm9yIHRoZSBsaWZldGltZSBvZiB0aGUgbW1hcCBp
cw0KPiBsaWtlbHkgdGhlIHNhbWUgYXMganVzdCBkaXNhYmxpbmcgcnBtIGNvbXBsZXRlbHksIHdo
aWNoIGlzIG1heWJlIG5vdA0KPiBhY2NlcHRhYmxlLiBOb3Qgc3VyZSB0aG91Z2guDQoNCndlIGRv
bid0IG5lZWQgcnBtIGhlcmUgYXMgdGhlIG1lbWJhcnJpZXIgaXMgdG8gZ2VuZXJhdGUgYSBzaWRl
LWVmZmVjdCBvbiB0aGUgR1QgdG8gc2VyaWFsaXNlIGFueSBtZW1vcnkgdHJhZmZpYyBhY3Jvc3Mg
dGhlIFBDSSBidXM7IGlmIHRoZSBkZXZpY2UgaXMgYXNsZWVwLCB0aGVyZSBpcyBubyBtZW1vcnkg
dHJhZmZpYyBhY3Jvc3MgdGhlIGJ1cywgdGh1cyB0aGUgcmVxdWlyZW1lbnQgaXMgc2F0aXNmaWVk
DQoNCj4gDQo+ID4NCj4gPj4NCj4gPj4+ICsJcmV0dXJuIDA7DQo+ID4+PiArfQ0KPiA+Pj4gKw0K
PiA+Pj4gK3N0YXRpYyBpbnQgeGVfbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpIHsNCj4gPj4+ICsJc3RydWN0IGRybV9maWxlICpwcml2ID0gZmlscC0+
cHJpdmF0ZV9kYXRhOw0KPiA+Pj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcHJpdi0+bWlu
b3ItPmRldjsNCj4gPj4+ICsNCj4gPj4+ICsJaWYgKGRybV9kZXZfaXNfdW5wbHVnZ2VkKGRldikp
DQo+ID4+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gPj4NCj4gPj4gV2l0aCBob3R1bnBsdWcgSSB0
aGluayB0aGVyZSBpcyBhbHNvIGEgc3BlY2lhbCBkdW1teSBwYWdlIHRoYXQgZ2V0cyBmYXVsdGVk
DQo+IGluDQo+ID4+IGlmIHdlIGRldGVjdCB0aGF0IHdlIGFyZSB1bnBsdWdnZWQgaW4gdGhlIGZh
dWx0IGhhbmRsZXIgdG8gYXZvaWQgc2lnYnVzDQo+IGtpbGxpbmcNCj4gPj4gc3R1ZmYgKHNlZSB4
ZV9nZW1fZmF1bHQoKSkuIEFsc28gSSBndWVzcyBhbGwgbW1hcHMgYXJlIG51a2VkIG9uIHVucGx1
ZyBzbw0KPiA+PiBldmVyeXRoaW5nIGdldHMgcmVmYXVsdGVkLiBCdXQgdGhpcyBkb2Vzbid0IGxv
b2sgdG8gdXNlIGZhdWx0IGhhbmRsZXIgYW5kDQo+IGp1c3QNCj4gPj4gcHJlLXBvcHVsYXRlcyBp
dCBoZXJlLCBzbyB3b25kZXJpbmcgd2hhdCB3b3VsZCBoYXBwZW4gaGVyZT8NCj4gPg0KPiA+IEdv
dCB5b3VyIHBvaW50LiBUaGlzIG1pZ2h0IGhhdmUgcHJvYmxlbSwgRG8geW91IGhhdmUgYW55IHN1
Z2dlc3Rpb24gaGVyZT8NCj4gDQo+IE5vdCByZWFsbHkuIEJ1dCBtYXliZSBmaXJzdCBqdXN0IHRy
eSBpdCB3aXRoIGFuIGlndCBhbmQgc2VlIHdoYXQNCj4gaGFwcGVucz8gV2UgY2FuIHJ1biBob3R1
bnBsdWcgaWd0IGZvciBleGFtcGxlLg0KDQpJZiB1bnBsdWcgaGFwcGVucyB0aGVuIGl0J3MgYSBu
ZXcgZGV2aWNlIGF0IHRoYXQgcG9pbnQgYW5kIHRoZSBjbGllbnQgbmVlZHMgdG8gcmVsb2FkLCBz
byBJIHRoaW5rIHdlIGRvbuKAmXQgbmVlZCB0byB0YWtlIGNhcmUgdGhpcy4NCg0KPiANCj4gPg0K
PiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKyNkZWZpbmUgWEVfUENJX0JBUlJJRVJfTU1BUF9PRkZTRVQg
KDB4NTAgPDwgUEFHRV9TSElGVCkNCj4gPj4NCj4gPj4gVGhpcyBuZWVkcyB0byBnbyBpbiB1YXBp
IGhlYWRlciBJIHRoaW5rPw0KPiA+DQo+ID4gWWVzIEkgd2VudCB0aG91Z2ggdWFwaSBoZWFkZXIs
IGRpZCBub3Qgc2VlIGFueSBvZmZzZXQgdGhlcmUsIGRpZCBub3QgZmluZA0KPiBzdWl0YWJsZSBw
bGFjZS4gQW55IHN1Z2dlc3Rpb24gd2hlcmUgc2hvdWxkIHRoaXMgYmUgcG9zaXRpb25lZCBpbiB1
YXBpDQo+IGhlYWRlcj8NCj4gDQo+IEl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBtbWFwX29m
ZmVzdCBmbGFnIGluc3RlYWQgKGFzIHBlciBiZWxvdyksDQo+IHRoZW4gd2UgZG9uJ3QgbmVlZCB0
aGlzLg0KPiANCj4gPg0KPiA+Pg0KPiA+Pj4gKwlzd2l0Y2ggKHZtYS0+dm1fcGdvZmYpIHsNCj4g
Pj4NCj4gPj4gSSB0aGluayBwZ29mZiBpcyB0aGUgZmFrZSBvZmZzZXQgdG8gYmUgYWJsZSB0byBs
b29rdXAgdGhlIGJvLCBzbyBmb3IgdGhpcyB0bw0KPiB3b3JrIEkNCj4gPj4gdGhpbmsgeW91IHdv
dWxkIG5lZWQgdG8gcmVzZXJ2ZSB0aGlzIHBhZ2Ugc29tZWhvdyAoaWYgd2UgZ28gd2l0aCB0aGlz
DQo+ID4+IGFwcHJvYWNoKSwgb3RoZXJ3aXNlIHVzZXIgY2FuIGVhc2lseSBlbmQgdXAgbW1hcHBp
bmcgYSBub3JtYWwgYm8gYW5kDQo+IGdldA0KPiA+PiBiYWNrIGEgZmFrZSBvZmZzZXQgdGhhdCBo
YXBwZW5zIHRvIGJlIHRoaXMgZXhhY3Qgc3BlY2lhbCBiYXJyaWVyIG9mZnNldCBhbmQNCj4gdGhl
bg0KPiA+PiB0aGluZ3MgZ28gYm9vbS4NCj4gPj4NCj4gPj4gQW5vdGhlciBpZGVhIGNvdWxkIGJl
IHRvIGhhdmUgbW1hcF9vZmZzZXQgY2FsbGVkIHdpdGggc3BlY2lhbCBmbGFnIHRvDQo+ID4+IGlu
ZGljYXRlIHRoaXMgQkFSUklFUiB0aGluZywgYW5kIHRoZW4gaXQgcmV0dXJucyB0aGUgbWFnaWMg
cmVzZXJ2ZWQgb2Zmc2V0Lg0KPiA+PiBUaGF0IHdheSB3ZSBkb24ndCBuZWVkIHRvIGhhcmRjb2Rl
IFhFX1BDSV9CQVJSSUVSX01NQVBfT0ZGU0VUIGluDQo+IHRoZQ0KPiA+PiB1YXBpLCBhbmQgYmUg
Zm9yZXZlciBzdHVjayB3aXRoIGl0Lg0KPiA+DQo+ID4gQXJlIHlvdSBzYXlpbmcgb24gZGlmZmVy
ZW50IHBsYXRmb3JtcyB0aGlzIHVudXNlZCBvZmZzZXQgbWlnaHQgY2hhbmdlLiBGb3INCj4gY3Vy
cmVudCBwdXJwb3NlIEJNRyBhbmQgUFZDIGJvdGggaGFzIGNvcnJlY3QgdmFsdWUgZm9yIHRoaXMg
YXMgdW51c2VkDQo+IG9mZnNldC4NCj4gDQo+IFdoeSBpcyBpdCBhbiB1bnVzZWQgb2Zmc2V0LCBh
bHNvIHdoeSBpcyBpdCBwbGF0Zm9ybSBzcGVjaWZpYz8gVGhlDQo+IHZtX3Bnb2ZmIGNhbiBhbHNv
IGNvbnRhaW4gdGhlIGZha2Ugb2Zmc2V0IHRvIGxvb2t1cCB0aGUgQk8sIHNvIHlvdSB3b3VsZA0K
PiBub3cgbmVlZCB0byBlbnN1cmUgdGhhdCB0aGUgc3BlY2lhbCBiYXJyaWVyIG9mZnNldCBpcyBu
ZXZlciB1c2VkLCBhbmQgc28NCj4gZG9lc24ndCBjbGFzaCB3aXRoIHNvbWUgcmFuZG9tIEJPIG9m
ZnNldC4gTWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nDQo+IGhlcmUuLi4NCg0KT2ggbm93IEkg
cmVjYWxsLCBmb3Igdm1fcGdvZmYsIHRoZXJlIGlzIHNvbWUgb2Zmc2V0IGFkZGVkLCB3aGljaCBp
cyBsZWF2aW5nIGFueXRoaW5nIGJlbG93IHRoYXQgb2Zmc2V0IHVudG91Y2hlZC4gV2Ugc2VsZWN0
ZWQgdm1fcGdvZmYgdG8gYmUgdXNlZCBmcm9tIHRoYXQgYXJlYS4NCiANClRlamFzDQogDQo+IA0K
PiA+DQo+ID4gQnV0IEkgYWdyZWUgZm9yIGZ1dHVyZSBjb21wYXRpYmlsaXR5LCB3ZSBjYW4gaGF2
ZSB0aGlzIGhhbmRsaW5nIGluIEtNRCBpdHNlbGYNCj4gdG8gZGV0ZWN0IHBsYXRmb3JtIGFuZCBw
cm92aWRlIGNvcnJlY3QgdW51c2VkIGRlZmluZWQgb2Zmc2V0IHRvIFVNRCB0byBtYXAuDQo+IEkg
d2lsbCB0YWtlIGNhcmUgb2YgdGhpcy4NCj4gPg0KPiA+IFRlamFzDQo+ID4NCj4gPj4NCj4gPj4N
Cj4gPj4+ICsJY2FzZSBYRV9QQ0lfQkFSUklFUl9NTUFQX09GRlNFVCA+PiBQQUdFX1NISUZUOg0K
PiA+Pj4gKwkJcmV0dXJuIHhlX3BjaV9iYXJyaWVyX21tYXAoZmlscCwgdm1hKTsNCj4gPj4+ICsJ
fQ0KPiA+Pj4gKw0KPiA+Pj4gKwlyZXR1cm4gZHJtX2dlbV9tbWFwKGZpbHAsIHZtYSk7DQo+ID4+
PiArfQ0KPiA+Pj4gKw0KPiA+Pj4gICAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlv
bnMgeGVfZHJpdmVyX2ZvcHMgPSB7DQo+ID4+PiAgICAJLm93bmVyID0gVEhJU19NT0RVTEUsDQo+
ID4+PiAgICAJLm9wZW4gPSBkcm1fb3BlbiwNCj4gPj4+ICAgIAkucmVsZWFzZSA9IGRybV9yZWxl
YXNlX25vZ2xvYmFsLA0KPiA+Pj4gICAgCS51bmxvY2tlZF9pb2N0bCA9IHhlX2RybV9pb2N0bCwN
Cj4gPj4+IC0JLm1tYXAgPSBkcm1fZ2VtX21tYXAsDQo+ID4+PiArCS5tbWFwID0geGVfbW1hcCwN
Cj4gPj4+ICAgIAkucG9sbCA9IGRybV9wb2xsLA0KPiA+Pj4gICAgCS5yZWFkID0gZHJtX3JlYWQs
DQo+ID4+PiAgICAJLmNvbXBhdF9pb2N0bCA9IHhlX2RybV9jb21wYXRfaW9jdGwsDQo=
