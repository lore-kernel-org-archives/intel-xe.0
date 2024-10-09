Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DE1CEE345
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 20:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E45510E7F0;
	Wed,  9 Oct 2024 20:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfwoAHR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC0E10E7F7
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728504552; x=1760040552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wuVMJJw/gyLo9N96mjMukp62SQrkbx/NeOBrul29LVk=;
 b=hfwoAHR66Is4ahU4J2ZF7e3pVuGv/m3723LaQH1E0JvTvgtQQtRWfcME
 ALkIAA5lhjlWAekNAMcoyQZPTq0rEaRms7ouP0OzRcwrqaXgsPC7SWBfO
 u6nGAp+7+JuP53h+GzUgMSLFyYuVfdGHgl15TlxbkF2RYwTNODUEYZzdT
 3IBfub+9UGYvljdFLpckNx6CFGfdWCbaP+8PzW4+7/8ETLQjl8wvJTx+a
 /ly0NAd5sPa3hOK0e4KyzL5ULHnviWLJmLGpyFzTHbUbwLW5OVgGg+996
 hxyCNPcjudXiSdgsC8OMwAkN6Ek292zQik4xDwWp6SWhjG5HDAh9yhFo/ A==;
X-CSE-ConnectionGUID: AUsSMdhDT/6V0j6VdUQzhw==
X-CSE-MsgGUID: Yffp64TtTLOStDrzaqu+LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15450780"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="15450780"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 13:09:12 -0700
X-CSE-ConnectionGUID: vuwOiFt3R5KWDsH1wpY9zw==
X-CSE-MsgGUID: lZeAQ+vwQdOyo208+SFXHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76682013"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 13:09:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 13:09:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 13:09:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 13:09:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 13:09:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 13:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRYfmJpNMySF1LfU0nRozS3E+fXxW443m0rTa9aUjGSUpk7XyxizuKEaRr82iATlI73OXuZfabSBtkXS1e477eyQYez0LvMCWYqSCw50mkn/XsgnVheI3OpDUWIleMU9CrOTb1zQh1CoBwCmlzCRIiJ5NDqHeYi/K/iwzuF9iTqz8J0HK3iUDkP8pwsSWoBXji4CIXFHpdU9j53nUNXz+eXP+w4B4pGUOAS+Zx+tauNkEZ6L80XG+R4ahNnXG3iGj5EkASu1h0TH+6mkN/35czXMAXGDU4PDRIrYvCbEUeuZZbnS+sKpad1gi+uOYQsniGkmMelgotavwcmPXJh/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuVMJJw/gyLo9N96mjMukp62SQrkbx/NeOBrul29LVk=;
 b=hf0XpksNnx++3dmX+wNKjJKqfHl5UXEjLmYyO0x+dJ2HQKBkzI6EHeSxdPMN9Q4RyJQOjl0+isuCTa/ppW1nekeXu8x3vGWWyZyzoDeY2YslOnniZJneqkxBtlzr4u1PCHN8shOAq/D6dG2rlbv4DoAAnE6iHsnKZR+6VTkyN/GNgJeCdvkF1XKilkOsv0GB1+f59uES+oOo66/x//pXRFJFh6PYgIjpRIqpR0MHVDbF0rO8E//mYKtxbNOrhqKPTXdLs4D8GlYMq/z2+qAsgLxwqidiVBHizQThFXHoF6WZiobf2l0Q/n5OZ9kxDiaizebWe6ICZB3abbFsHcbPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Wed, 9 Oct
 2024 20:09:06 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 20:09:06 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Zhang, Rui"
 <rui.zhang@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>
Subject: Re: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline timer
 during lapic timer shutdown
Thread-Topic: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline
 timer during lapic timer shutdown
Thread-Index: AQHbGL420yFs9sHLxU2okWvPZWs5LrJ9HxcAgAAA9QCAAZ8CAIAAHaSA
Date: Wed, 9 Oct 2024 20:09:06 +0000
Message-ID: <f453bf94a219ae5dd5c70c987cd0d01ca15210f3.camel@intel.com>
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
 <ZwVtFJzWMUrTwg5C@intel.com>
 <db359db0916475865e2c2a615a7dfb92eeb65c6b.camel@intel.com>
 <dd0e688c-3468-4020-8291-d2389577c5e2@intel.com>
In-Reply-To: <dd0e688c-3468-4020-8291-d2389577c5e2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|SN7PR11MB6948:EE_
x-ms-office365-filtering-correlation-id: 29351ced-1cb2-41f4-77d7-08dce89e3a61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Mi9aazVOVkpNb2JVbmhCVCtueFNoV3JhV0tsMlB0cVlkTko4VHRDSkVmdDk0?=
 =?utf-8?B?bnNYQTVkc3ZFTmplU2NEZHBpYmt1RlRQQVFHRmhoQVJJY211NjdLb1ZmMGdi?=
 =?utf-8?B?UHlaL0VndHVwTWU5bUpEaXRJUllveDhqNVhPN3lCcktzZHVUSjdvbzU0eXJo?=
 =?utf-8?B?bThNRmRNblJOMDhoZkZsTDFKU0FoR04zN1lyYm5sNll1NmpNUEtUaUY0YlU5?=
 =?utf-8?B?K1JyczNTaEN5QWhXdlREWjJKQXpXRkZmc2c1bGhSZlVQWVJQaTFXTXhwcSs3?=
 =?utf-8?B?UFo1TXMvRVJIbHFibXlSUHdqLytqVjBnbG40N05UZy95cmxlcFNOemJ6Undp?=
 =?utf-8?B?bmhOeUpkRGFCVUI4QWIyTFc2dW1CUVdtOGFvYnVjbDZxYmRpTndpVzc2WDN6?=
 =?utf-8?B?NHdBRmRRTFBUNEFCM0gwcDF6RXZiODYvYzFRaC9SZE9Pc282clVRN00zbDdv?=
 =?utf-8?B?bzRYOHJwcDFIYmN2YjltcVdzWlBPc1ZlVTkwL1VGTGgxSDlkVDBiNEI1YU03?=
 =?utf-8?B?VmVwQTRpcGlmSi9wOWk1QVRVdW5FRitaV1VSVTNCMGpVSXZCOE5qV3VlV3FC?=
 =?utf-8?B?MmFEd2tIajBwU216Q2ROUktWSE5MWHhHQ01ScDFjVW1hSkVTcUFOcnYvOXBs?=
 =?utf-8?B?S0o4SVRrYzZkdEc3cWNQQ3BJZVRVMHFmdGFUbWRmMXhwUUcvZUNnc29NM2NX?=
 =?utf-8?B?dExaY1oxYVFvL0UvMGxHMGdCSzVHcTRZaWpUK1F4SStWa2dueDI0UUh2cnow?=
 =?utf-8?B?VHR5d1NYMS9tVjlzQTFoTVhxSzh2VFNaeWFmMG45bDJxL29EZ2Vrb0V3RWtm?=
 =?utf-8?B?YWVIYXFQL2dnbHkva0l6UzgwVVRUTmxjNXNOMWJ2eVdOMTBCTGlieEFWakFj?=
 =?utf-8?B?TjlnNEhLZXJ6N3BVb3k2VzZYdjB5cFpHMkR0dzUyKy9wZ1Zhdm0xaThmdnNN?=
 =?utf-8?B?dXBqK0hxVkZZUGlFbjNnL3ZydEJCLzBvREhFMnZYOG5INnhrZ0Z4STBHNzhm?=
 =?utf-8?B?U3hUaDl0bzBsT2c0bVVMbGUyUzEzbmh0dGVCQzdiMXorZFdRMnhCdjJMbjRT?=
 =?utf-8?B?Y3pVVmJETWhaaGZpVGsrZHhmY2FhYnUyMmtSTE9sUFlubDVLd0U2M2RHNUxB?=
 =?utf-8?B?S212U3h1aURYazZNMmMxVFRoQVBRaTNXVGQvSDFmUTJDMlhweDFPTTBoMFBK?=
 =?utf-8?B?SDR5UnBSaE9XTlNTbk1ucGxHakFtTmlhN2tPRlZnRFJSbVl1aVBqbkIvSmxm?=
 =?utf-8?B?VkUyOTVzNXQrRGM2eGtXWE1GTytiWmdlSStoaXpYUm1kQkpHMS84dmFSRGVR?=
 =?utf-8?B?UXpDU2hFY2gxa1BqeFlNbTYrd09ucEZ0WnhNYWZ0cmd2cVRrbHhIL3pOUDYv?=
 =?utf-8?B?a1kyeHhMR0VNVEVXSllDYnNwekVBTyt2eFhrS3BBNmc3eFpMS2NWSlZMSnVW?=
 =?utf-8?B?SUxvbEdlTW9SenYyaFYyRUZ3NnlGTVUyZXhQM3owb2NoeDlsNENnK3Ura3dn?=
 =?utf-8?B?d2hESnlxOHRsUTJQZ0t4K05qaktQUCs3eURlU3gxcUU3bXlYWFRnZFdBNExZ?=
 =?utf-8?B?d0NCczQxaE9PZWtDbk82MkZ6NHYrNVVTUE0wZmZCa1haMmZHVXhFRk4rTHV0?=
 =?utf-8?B?clI1TGVic0xIRHd3Y1Z2YytFZHVMWGs3YUxQbndCNGgxcTlqbXdFdmJ5Q1p0?=
 =?utf-8?B?ekhCT2NKTi9nOVAwS052UEMraHJhdmNyaWFQUDNpQ01sMnpxdld2U0VlbGxo?=
 =?utf-8?Q?ZPYa1S7Aoq43ptoCsc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5592.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0Q4d1k2YzloQUtIRVgzQjNxbmRZcW9Nc0ZOSGg0RHpxM0JrcnFJb1VYWjJi?=
 =?utf-8?B?SXZMVTluK0tETk9USENjR2RwbUFLbTdhRzVHQ1ZHNzFpV3ZBSktNMGhoalB4?=
 =?utf-8?B?eTE5Vy9URXVZL3V5ak1Jd04yd3hhNlBGYWhkUXRoMytpSzFmYmkxS3NhOStO?=
 =?utf-8?B?LzdjNVk1K0dFRzRmRVgranhHR1ptSWNPbGwza0RTaldveGVXYW1wZnlpNTAw?=
 =?utf-8?B?MjFSUzNzd3JZOUJWWTI1WkNpdlNlTjB6NVdIR0R2U2cvakxibXI4K3IzZFV5?=
 =?utf-8?B?Z29zMFQwVkV6aFhPeE9ia2NaOE40dnNncjdCazZDaHhBQTNneHV0MEgxSHlK?=
 =?utf-8?B?R3h6MWhKQnRCRmxWa01ReGduL1JWeUYydEVwQ2orL1pWVml0U2kxZTU5dTBj?=
 =?utf-8?B?aUwra1M5bnAzd05iaEl1UHlUMmUwcWdndFE1U0VGZ2pKZjVZd3Q1NXRBNW1X?=
 =?utf-8?B?UDVlY0pCN1NxTURUVkVrVlo3RGZjeW5OWUxzbWlyNEhaTW1FSjRYNHhlWFI4?=
 =?utf-8?B?clY1SUhMdmRDeEcxQm9zT092WGZsakhYRE9RUVVLdk5aaWZJQXlRR1NDeGc4?=
 =?utf-8?B?NXlOcE55eWlwbUhUcmZWWUlWL3c1OFR3SDBpT09sWm1GQzQyWjFBeTJPb1lI?=
 =?utf-8?B?ZnlWYmViZytRYzArNlh1ZVhxckNxbC95bUozOVVOOVNEbzNZYitNYjdhVGpL?=
 =?utf-8?B?cWhyN0VkMUsxREZKNGFkNmgrc0JTTURuMkdrU3k1R1RpeWlrMzlXcXg4aEdq?=
 =?utf-8?B?V2Faem1wU2tkakkwVS83SXczSDhDK3ZvUnVaeWdJeXNEUEZQQk9lYWV0L0o4?=
 =?utf-8?B?UVNnTVhURDRmTDltRmgyZmw1RmlVWHBzQmtIU1EyU1ArWVFiMFNnTEpJaVVz?=
 =?utf-8?B?ek1iRlJDcUNFeldtOW81OUhSUDZrK0NESDdxcnpZc211OTJMMGJBbUYrNmtt?=
 =?utf-8?B?ZnJQMDdVaml0Q0dtNSsvbVNlaE5kNWo0YjJXTjBubDZOd0ppSU1Qd29XY2pC?=
 =?utf-8?B?UFZxZmFnUU1vRzhRblc3SEVLaWtlTWpaREI2STJyOU1vQlNrVDZtUlBpa2Zx?=
 =?utf-8?B?cUd2V2J1UFlrYkJiRnBSd3hmK05Kb0tEenE0UUN3bzdZbUJxVTVsMTdYZWsx?=
 =?utf-8?B?WUpqV01jV25sQ2JVRVVaWlk5Ry9nMHg2ZDZKc2pMdkNNdGJHTE5NUlRIZHpy?=
 =?utf-8?B?WkJVc3ZyVGtOUXFQTWF0UjFuUEV1NHR1UThXdmI5ZWZpazJsWEFtblMxaTc0?=
 =?utf-8?B?dmhNek4wYW9Fa3hFSFRqRnJQblhMeHpZSEdvZ0Fkd0lsZW52V21lbDlUQlRt?=
 =?utf-8?B?R2NHY2l2V21pTDdNMllMeGJFZHpDYml2V3RYU0dyTTdLZFI3cWhvL2lsVGZz?=
 =?utf-8?B?cEJEZmV4SkI4WTdEZExiMEM4SFRFSFdQdUF5Yjh3dmxjdjR6MGV6UFBXKzZG?=
 =?utf-8?B?Umpqa1QxNGJ5WE9zVUZxazM3RWJKa05HR2oxdnJBUG93aXFSV2FnZlJyNWph?=
 =?utf-8?B?MytlbkRwSmZhOUh1M20vS2dZaTNKVGJneE53WFNUQTA5VmNoRkU2NTNuZHho?=
 =?utf-8?B?NWc0K0hJRVlvL2VVRzJDMGJ4SFgvMkZGN3dTUGljSU1sM05iMnBTZUdzQnp6?=
 =?utf-8?B?R2srdm5mVG5adW9tTVBWaVNWZ0lHeXlwaGQrc0pQT3dDeHloTWo2ZUZiTFlV?=
 =?utf-8?B?dVJCb0NEQlMySHlBQitva1NYU2RFbmhjRzhpLzhyRmVlOU1uUCswZTdqbHlu?=
 =?utf-8?B?NTZkdlpMNmtNVTU1OUxQNzN3czBkOWs1M2UyOXpMU2YvdHlVUE1aWmpMaFJz?=
 =?utf-8?B?QXNmODd4YzA0ZVdBS3EwQkdKcGt5LzBMaS9VRjM3VUhTdjc4TWVBRStaVnJu?=
 =?utf-8?B?OXdwZU1TVDV3U2tZbzJROTRvUzk2cW1CYmxvcDFvWE14cjJtQzE4cTNpN0lk?=
 =?utf-8?B?Y2dLT2pKTGJzWWF6UjNJSHFiZ1Bvdy9Na0FHK3JhUWlHWXN4cFFjZ01QQnIv?=
 =?utf-8?B?MjFBTTNWN2wyVHl1alRraVJJY1lqUXAzQUhhdDdDVGhVT0JLNVROQ1pYNFhE?=
 =?utf-8?B?WndkZWRyOG5kWnUxM3RBM2V3UWNCT3kyanN6K0lhNk1pN2pOdHBMQmZkV0FI?=
 =?utf-8?B?YWdXRG1zRlVmRUxxZ2ZTOERqbnJ0NEpRRURQZEZkcDh6bHBYcU43ME9uSFlO?=
 =?utf-8?Q?eszrWxhSSfKXERgKcSNm1sU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00DB22D3231D13429845CBEB998305C7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29351ced-1cb2-41f4-77d7-08dce89e3a61
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 20:09:06.1602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wtm/x0ngyZsCsMFklkKY+jrUzid8IcL4tWXwVy0O3CXCSJfGMnUP+3h4BjVnOXd1Fu3J4VxZfIdR7GR2W0FTFpbB0zbFAFYYpkLSughbf+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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

VGhpcyBwYXRjaCB3aWxsIGJlIG1lcmdlZCBhcyBzZXZlcmFsIG1haW50YWluZXJzIGFyZSBPSyB3
aXRoIHRoaXMNCmNoYW5nZS4NCg0KVGhpcyBpcyBub3cgbW9yZSBhYm91dCBob3cgdG8gY29tbXVu
aWNhdGUgY29ycmVjdGx5Lg0KDQpUaGFua3MsDQpTcmluaXZhcw0KT24gV2VkLCAyMDI0LTEwLTA5
IGF0IDIzOjUzICswNTMwLCBQb29zYSwgS2FydGhpayB3cm90ZToNCj4gDQo+IE9uIDA4LTEwLTIw
MjQgMjM6MDcsIFBhbmRydXZhZGEsIFNyaW5pdmFzIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyNC0x
MC0wOCBhdCAxMzozNCAtMDQwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBP
Y3QgMDcsIDIwMjQgYXQgMDc6MjI6NDJQTSArMDUzMCwgS2FydGhpayBQb29zYSB3cm90ZToNCj4g
PiA+ID4gRnJvbTogWmhhbmcgUnVpIDxydWkuemhhbmdAaW50ZWwuY29tPg0KPiA+ID4gPiANCj4g
PiA+ID4gVGhpcyBpcyBhIGNvcmUtZm9yLUNJIHBhdGNoIGZvcg0KPiA+ID4gPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA5MjkwNjM1MjEuMTcyODQtMS1ydWkuemhhbmdAaW50ZWwu
Y29tLw0KPiA+ID4gPiANCj4gPiA+ID4gQWNjb3JkaW5nIHRvIEludGVsIFNETSwgZm9yIHRoZSBs
b2NhbCBBUElDIHRpbWVyLA0KPiA+ID4gPiAxLiAiVGhlIGluaXRpYWwtY291bnQgcmVnaXN0ZXIg
aXMgYSByZWFkLXdyaXRlIHJlZ2lzdGVyLiBBDQo+ID4gPiA+IHdyaXRlIG9mDQo+ID4gPiA+IDAg
dG8NCj4gPiA+ID4gwqDCoMKgIHRoZSBpbml0aWFsLWNvdW50IHJlZ2lzdGVyIGVmZmVjdGl2ZWx5
IHN0b3BzIHRoZSBsb2NhbCBBUElDDQo+ID4gPiA+IHRpbWVyLCBpbg0KPiA+ID4gPiDCoMKgwqAg
Ym90aCBvbmUtc2hvdCBhbmQgcGVyaW9kaWMgbW9kZS4iDQo+ID4gPiA+IDIuICJJbiBUU0MgZGVh
ZGxpbmUgbW9kZSwgd3JpdGVzIHRvIHRoZSBpbml0aWFsLWNvdW50IHJlZ2lzdGVyDQo+ID4gPiA+
IGFyZQ0KPiA+ID4gPiDCoMKgwqAgaWdub3JlZDsgYW5kIGN1cnJlbnQtY291bnQgcmVnaXN0ZXIg
YWx3YXlzIHJlYWRzIDAuDQo+ID4gPiA+IEluc3RlYWQsDQo+ID4gPiA+IHRpbWVyDQo+ID4gPiA+
IMKgwqDCoCBiZWhhdmlvciBpcyBjb250cm9sbGVkIHVzaW5nIHRoZSBJQTMyX1RTQ19ERUFETElO
RSBNU1IuIg0KPiA+ID4gPiDCoMKgwqAgIkluIFRTQy1kZWFkbGluZSBtb2RlLCB3cml0aW5nIDAg
dG8gdGhlIElBMzJfVFNDX0RFQURMSU5FDQo+ID4gPiA+IE1TUg0KPiA+ID4gPiBkaXNhcm1zDQo+
ID4gPiA+IMKgwqDCoCB0aGUgbG9jYWwtQVBJQyB0aW1lci4iDQo+ID4gPiA+IA0KPiA+ID4gPiBD
dXJyZW50IGNvZGUgaW4gbGFwaWNfdGltZXJfc2h1dGRvd24oKSB3cml0ZXMgMCB0byB0aGUgaW5p
dGlhbC0NCj4gPiA+ID4gY291bnQNCj4gPiA+ID4gcmVnaXN0ZXIuIFRoaXMgc3RvcHMgdGhlIGxv
Y2FsIEFQSUMgdGltZXIgZm9yIG9uZS1zaG90IGFuZA0KPiA+ID4gPiBwZXJpb2RpYw0KPiA+ID4g
PiBtb2RlDQo+ID4gPiA+IG9ubHkuIEluIFRTQyBkZWFkbGluZSBtb2RlLCB0aGUgdGltZXIgaXMg
bm90IHByb3Blcmx5IHN0b3BwZWQuDQo+ID4gPiA+IA0KPiA+ID4gPiBTb21lIENQVXMgYXJlIGFm
ZmVjdGVkIGJ5IHRoaXMgYW5kIHRoZXkgYXJlIHdva2UgdXAgYnkgdGhlDQo+ID4gPiA+IGFybWVk
DQo+ID4gPiA+IHRpbWVyDQo+ID4gPiA+IGluIHMyaWRsZSBpbiBUU0MgZGVhZGxpbmUgbW9kZS4N
Cj4gPiA+ID4gDQo+ID4gPiA+IFN0b3AgdGhlIFRTQyBkZWFkbGluZSB0aW1lciBpbiBsYXBpY190
aW1lcl9zaHV0ZG93bigpIGJ5DQo+ID4gPiA+IHdyaXRpbmcgMA0KPiA+ID4gPiB0bw0KPiA+ID4g
PiBNU1JfSUEzMl9UU0NfREVBRExJTkUuDQo+ID4gPiA+IA0KPiA+ID4gPiBGaXhlczogMjc5ZjE0
NjE0MzJjICgieDg2OiBhcGljOiBVc2UgdHNjIGRlYWRsaW5lIGZvciBvbmVzaG90DQo+ID4gPiA+
IHdoZW4NCj4gPiA+ID4gYXZhaWxhYmxlIikNCj4gPiA+ID4gTGluazoNCj4gPiA+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwOTI5MDYzNTIxLjE3Mjg0LTEtcnVpLnpoYW5nQGlu
dGVsLmNvbS8NCj4gPiA+IFRoZSBwcm9ibGVtIEkgc2VlIGhlcmUgaXMgdGhhdCB0aGlzIHNlZW1z
IHN0YWxsZWQuIE5vIHJldmlldw0KPiA+ID4gdGhlcmUuDQo+ID4gPiBJcyB0aGF0IG1lcmdlZA0K
PiA+ID4gaW4gc29tZSBicmFuY2ggYW5kIG1vdmluZyB1cHN0cmVhbSBhbmQgdG8gc3RhYmxlPw0K
PiA+IE5vdCB5ZXQuIGFyY2gveDg2IHBhdGNoZXMgYXJlIHZlcnkgc2xvdyB0byBnZXQgbWVyZ2Vk
Lg0KPiA+IFdlIGNhbid0IHBpbmcgdW5sZXNzIG5vIHJlc3BvbnNlIGZvciAyIHdlZWtzLg0KPiA+
IA0KPiA+IFRoYW5rcywNCj4gPiBTcmluaXZhcw0KPiANCj4gSGkgUm9kcmlnbywNCj4gDQo+IERv
IHlvdSBzdWdnZXN0IHRoYXQgd2Ugd2FpdCBmb3IgdXBzdHJlYW0gcGF0Y2ggdG8gYmUgYm90aCBy
ZXZpZXdlZA0KPiBhbmQgDQo+IG1lcmdlZCA/DQo+IA0KPiBJdCBzZWVtcyB3ZSBtaWdodCBuZWVk
IHRvIHdhaXQgYXQgbGVhc3QgYW5vdGhlciB3ZWVrIGJlZm9yZSB3ZSBjYW4gDQo+IGZvbGxvdyB1
cC4NCj4gDQo+ID4gPiBDYzogWmhhbmcgUnVpIDxydWkuemhhbmdAaW50ZWwuY29tPg0KPiA+ID4g
DQo+ID4gPiA+IFJlZmVyZW5jZXM6DQo+ID4gPiA+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTIzNDQNCj4gPiA+IFRoZSByaWdodCByZWZl
cmVuY2UgbGluayB3ZSBzaG91bGQgaGF2ZSBpbiB0aGlzIHRvcGljL2NvcmUtZm9yLUNJDQo+ID4g
PiBwYXRjaA0KPiA+ID4gaXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUv
a2VybmVsLy0vaXNzdWVzLzI3NjYNCj4gPiA+IHNob3dpbmcgdGhlIHdoeSB3ZSBuZWVkIHRoZSBw
YXRjaC4NCj4gPiA+IA0KPiA+ID4gaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnL21h
aW50YWluZXItdG9vbHMvY29tbWl0dGVyL2NvcmUtZm9yLUNJLmh0bWwNCj4gRm9sbG93aW5nIENo
YWl0YW55YeKAmXMgaW5wdXQsIEkgaGF2ZSBjcmVhdGVkIGEgR2l0TGFiIGlzc3VlIGZvciB0aGUg
DQo+IGNvcmUtZm9yLUNJIHBhdGNoIGFuZCByZWZlcmVuY2VkIGl0IGFjY29yZGluZ2x5Lg0KPiBJ
ZiBhIEdpdExhYiBpc3N1ZSBhbHJlYWR5IGV4aXN0cywgZG8gd2UgbmVlZCBhIHNlcGFyYXRlIGlz
c3VlIGZvciB0aGUNCj4gY29yZS1mb3ItQ0kgcGF0Y2g/IElmIG5vdCwgSSB3aWxsIG1ha2UgdGhl
IG5lY2Vzc2FyeSBjb3JyZWN0aW9ucyBpbg0KPiB0aGUgDQo+IG5leHQgcmV2aXNpb24uDQo+ID4g
PiANCj4gPiA+IEJ1dCB3YXMgdGhpcyByZWFsbHkgY29uZmlybWVkPw0KPiBCYXNlZCBvbiB0aGUg
ZmFpbHVyZSBzaWduYXR1cmUgb2YgY29udGludW91cyB3YWtldXAgZXZlbnRzLCB3ZSBoYXZlIA0K
PiBjb25maXJtZWQgdGhlIGlzc3VlLg0KPiBVbmZvcnR1bmF0ZWx5LCB3ZSB3ZXJlIHVuYWJsZSB0
byByZXByb2R1Y2UgdGhlIHByb2JsZW0gbG9jYWxseSBmb3IgDQo+IGZ1cnRoZXIgdGVzdGluZy4N
Cj4gPiA+IA0KPiA+ID4gQW55d2F5LCBJJ20gaGVzaXRhbnQgaGVyZSBtb3N0bHkgYmVjYXVzZSBJ
IGRvbid0IGJlbGlldmUgd2UNCj4gPiA+IHNob3VsZA0KPiA+ID4gYWRkIHRoaXMgcGF0Y2gNCj4g
PiA+IGlmIHRoYXQgaXMgbm90IGdldHRpbmcgcHJvcGFnYXRlZCB0byBMaW51cyBhbmQvb3Igc3Rh
YmxlIHRyZWVzLg0KPiBTcmluaXZhcy9aaGFuZywNCj4gDQo+IElzIHRoZXJlIGFueSBwb3NzaWJp
bGl0eSB0aGF0IHRoaXMgcGF0Y2ggbWlnaHQgbm90IGdldCBwcm9wYWdhdGVkID8NCj4gDQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIFJ1aSA8cnVpLnpoYW5nQGludGVsLmNvbT4NCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogS2FydGhpayBQb29zYSA8a2FydGhpay5wb29zYUBpbnRlbC5jb20+
DQo+ID4gPiA+IA0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gwqDCoGFyY2gveDg2L2tlcm5lbC9hcGlj
L2FwaWMuYyB8IDQgKysrKw0KPiA+ID4gPiDCoMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9hcGlj
L2FwaWMuYw0KPiA+ID4gPiBiL2FyY2gveDg2L2tlcm5lbC9hcGljL2FwaWMuYw0KPiA+ID4gPiBp
bmRleCA2NTEzYzUzYzk0NTkuLmQxMDA2NTMxNzI5YSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvYXJj
aC94ODYva2VybmVsL2FwaWMvYXBpYy5jDQo+ID4gPiA+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9h
cGljL2FwaWMuYw0KPiA+ID4gPiBAQCAtNDQxLDYgKzQ0MSwxMCBAQCBzdGF0aWMgaW50IGxhcGlj
X3RpbWVyX3NodXRkb3duKHN0cnVjdA0KPiA+ID4gPiBjbG9ja19ldmVudF9kZXZpY2UgKmV2dCkN
Cj4gPiA+ID4gwqDCoAl2IHw9IChBUElDX0xWVF9NQVNLRUQgfCBMT0NBTF9USU1FUl9WRUNUT1Ip
Ow0KPiA+ID4gPiDCoMKgCWFwaWNfd3JpdGUoQVBJQ19MVlRULCB2KTsNCj4gPiA+ID4gwqDCoAlh
cGljX3dyaXRlKEFQSUNfVE1JQ1QsIDApOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJaWYgKGJvb3Rf
Y3B1X2hhcyhYODZfRkVBVFVSRV9UU0NfREVBRExJTkVfVElNRVIpKQ0KPiA+ID4gPiArCQl3cm1z
cmwoTVNSX0lBMzJfVFNDX0RFQURMSU5FLCAwKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiDCoMKgCXJl
dHVybiAwOw0KPiA+ID4gPiDCoMKgfQ0KPiA+ID4gPiDCoCANCj4gPiA+ID4gLS0gDQo+ID4gPiA+
IDIuMjUuMQ0KPiA+ID4gPiANCg0K
