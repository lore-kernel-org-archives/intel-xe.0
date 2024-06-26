Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00581C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 20:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4210E159;
	Wed, 26 Jun 2024 20:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKLpE6ag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA110E159
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 20:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719434161; x=1750970161;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tldcGQ3GdYMYJJVPU30qJGYp5UjoZ5VmV5mIzcMd0Pw=;
 b=kKLpE6agTyrKOXCaR0J9XXojifiw1W2XnoezkJpnINdl3Wocso76CXY5
 uvxVmEpQRDPF6QQ6UnrYrdS+hC7nOgO6ndc11agkkST5cu++Yw1L6hW5F
 s9zUptgHKsQL7zHATrFtqvINtSuvItfCqR0Y2z5KlVM0Z97FLQqJUghTP
 ePuzXlsH/ps8dIo41UkHpB36kQpw/Ru57BKKh5cPuAy8SMI1FPQsag4LK
 +LBkFyuvAYk9wX9YwFf9PzD9hMR1fCFCU5sRDYZnGuElDUK2lC9tYFH2u
 MchkHbAnNphXHQmXNksoeiwUs+yibRDnYMm07URANrQFUEw6RT9G5wLkW A==;
X-CSE-ConnectionGUID: 478NDgiqSiaOVnnR+aLx3Q==
X-CSE-MsgGUID: ffpgbqBEThumZJZbj9cZ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="33984276"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="33984276"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:35:56 -0700
X-CSE-ConnectionGUID: ZkVo0XNJSpWwCWyK1DwuFQ==
X-CSE-MsgGUID: 5gLNoMfrQ5ywxQYv0fTAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="49044058"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 13:35:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 13:35:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 13:35:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 13:35:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 13:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ji60Ef6LIOLKXQkPpT7HE9TfHpP5h9lCHioJrl6Ev7hnbR/QVNvHWk6COza34SHAgTrhD9lhhNd65kl6bb9CHbmJLpq0bp/hpz2HS8u7SDV3IQ/W6V1eOAggnNuO3iK0YlPOOsroq/qTcQpbBhx9mTrksUKNyOgLlwXm9Vo7u0PO18NpEoQN0gjlzVbI92WV3Rt05D2nagVBc0JtFTeo41Knw9zJrXMXYn6pSfypOwrrghnb3imvXyDam6BwH8K0KFRcDK9+v8DZ6KzDB/+s24E5j+5BWZy17Kl2DPDfYEhgcNQjsIsTO6RVh37DFoQTfx5M302dm8u85qmOHOxDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tldcGQ3GdYMYJJVPU30qJGYp5UjoZ5VmV5mIzcMd0Pw=;
 b=dgYdSOaHGROefHDrBcHcOyyo8nd9QI0qVAI06spgeiBLB3FbjlYWSIPhsDFkBniH6KA4snulo1kQCCtQfwRlwnYgkoaVZQ8OzA9H2JE5BqDuLZ8CWEp6kH/uEHBH/MkJQgmMpC2HNTC5YHoWC1O7j0I62GWlvo3e5miTEjSPOOsh9AuGXWe4TRyaBxLBmkj4XcXAel1Wr8QccNtmOwTPbFPR5ynmc2S9UlFR4cOchwYUJXL7GTnAYynqkVjhHDh9b63sZYQbmICpKRRx/VYZvTnoFoe0ALJWCmZmJkZ+Q7F6VDJLaC9kVaKqWG6ctHlUAFnuLAYwG0Lu2rXF+oakCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB8042.namprd11.prod.outlook.com (2603:10b6:806:2ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 20:35:53 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7698.032; Wed, 26 Jun 2024
 20:35:53 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
Thread-Topic: [CI] drm/xe/guc: Remove spurious line feed in debug print
Thread-Index: AQHayAU83xinEb2HGkejtw2Ih/H2gbHagNOA
Date: Wed, 26 Jun 2024 20:35:53 +0000
Message-ID: <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240626201206.1433-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB8042:EE_
x-ms-office365-filtering-correlation-id: 6bcde5b5-111c-40bb-7dd8-08dc961f92d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|1800799022|366014|376012|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?c1JBeTRRSnNqUEhzM1RFK1BqNnNHM2FjdXVJUHU1L0VDemN0T1BBWnZZV1Z2?=
 =?utf-8?B?YnhyV0JxRm53SWQ0QTUvMitXUEFBRWRVMU5ELzNZRVpab21zazhDZjBGZjhH?=
 =?utf-8?B?dGlPSDIvbmhDbnBXTUt2NC9jaWFnWjkzczFGR1AxdlEydy9CQUEzZ0o5djMx?=
 =?utf-8?B?OGVjcjlqRy9CaldSTDBjS2RNYmFYMjlwY2liZGtSWEhaNFpraDQyRHZwNWZ3?=
 =?utf-8?B?ekx4ME5YekZMZEExUll6WnNFRjVNYXhRcnhEUzRwa2tSRWRjaUVvN04yTlhz?=
 =?utf-8?B?azl1alNPSHROQ2l1QUkvT1hsVDJXTjBzei9CRVB2ZXRUbkpaTHN2SzhpelZs?=
 =?utf-8?B?LzE1VEJ1M2hWbjlQV0wyL0dMbTFsemVrZUNwaGY1T0MyNmNiNWU0VzFSeUNR?=
 =?utf-8?B?eld6dCtEcjBBYWxreHpON3U3OFkzaUVBNHl2VWlyai9KUkErYTRxR3pNMHBy?=
 =?utf-8?B?UDg3Vkdpd3UyVEwxSi9IbXBvcUtZZzJKZVU4SzR2TlNWakdWdzdtelAwREds?=
 =?utf-8?B?SjdyL3gxUFAzZTlDaHlxcW9OQU5DUjB2M1k5MFpJakNhaFlKQUF3c3QvenUy?=
 =?utf-8?B?R0hjdTEzV21KRkFRdmhlRm5peHdlWTkvY2h5c1V2QXdIYnF4eFliL1puS0gy?=
 =?utf-8?B?Mk1PRXlxNTdrOGJGL1IrMEpNWVYxb1RiK3h0dURucFFHeDBpbGhnUmlSamtu?=
 =?utf-8?B?RVhPWkpHSjRoZWVjVGE0d25Wb1NhYS92M3RLenpRK3R5M0EvcGU4ZzBCMitp?=
 =?utf-8?B?MW1CV1AwRUdyMXRYQWNoN0ZpWnRQa1dzbHFKcllsOFVCN3ZvVThrTUlMTFB6?=
 =?utf-8?B?Rk5TV2JBVVBNdmp0bWNxVEhDRkF6TmtNbllsdW0wbmxObGxZb1A4Skg5MVVa?=
 =?utf-8?B?VE90Z052cXJQT3hzUHdNU2dtekljMUlUV1BYTjFzWGpzTDQwV0laS0lXZXRQ?=
 =?utf-8?B?ZVFZZFF2dllMWkZrMkltaEpvQUtCRzh0SmpNbHdnR0xibVpsVGxaY240K3NR?=
 =?utf-8?B?NHpveGQ2UWtHQTg4STJ1NFVMNi91QVZjcTc4aUcvTjluckRIdTNXSVRFUG8w?=
 =?utf-8?B?Z0xvakx5T25iTVJpVWZHaituMzYxNFRNTjdKc2doaytwdHNmaHZCOTZTZTBF?=
 =?utf-8?B?cmZSenpEWTVRZEdRd1hHRGpYSjkwUHF2eWJxUVlOWXZ2OEdUNE9DbGhmdDNv?=
 =?utf-8?B?TUFEYXF4Z0x6dTg1UkJGRnlyZ0hObnpFTXhwUGpaOU9PN3lpTkJieVZXMkRQ?=
 =?utf-8?B?UEJGUERhSk5HUlR1UVBRQ1ZiTGo5aVNFdm1NWWRZU3hROG5UODVkQk9oRmM4?=
 =?utf-8?B?bWpQTWt2RXZIMGdlcjR1bWQxWUZjOE9MQ2ROSDdETzRFOEFBNjRqWFNhWUE1?=
 =?utf-8?B?TFlsZithQ2s4blFDZXZOc2RteUsyQm00dGF2Q0RoTHZCQVc1NktJaFlCdHhr?=
 =?utf-8?B?VElOYzU5aUQ4Z0QvdSt6VC9QVitKQzRpL21xZ2YvMlpSU1BGU1g3TDJTT2lh?=
 =?utf-8?B?amJ6Vk4wTmJsSWZQakc4NkN5RSs2Y3FYSGljQkhwZXlLbldrWWpNWit0L20w?=
 =?utf-8?B?a3l2MEtzdC9TZzNYNjhpYVN3Mm9ybVVCQmwxU1RVVUVyREcwT2pBMjdBeXhk?=
 =?utf-8?B?NXNUcWtDWGF6Nm9BVmdzcExLdXRndzRXVnpUckRmajJBa3RXNXlvc0tjTHgy?=
 =?utf-8?B?Q2NlNElvV2xCcUd0OFZKNDdvK0VJOWV5K3RGeUVLNXBCUW1RdGdKSzJpVGJ0?=
 =?utf-8?B?TXFXUCtGT3ZvVUhhZExuSjBUVUEwZFZFMEJ2eEdiRFhSRGNCNk1nTzcwckFu?=
 =?utf-8?B?NGNxaEhWVjNjMXpIMks4Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFp1U29DT2pBU2ozMGNuWm4xUkFkSHp2Y2VhbVVGWUlHaVFtWUJFMUlkblZn?=
 =?utf-8?B?Vi94TVNHWk5uOTJ5N3hoSWZjczRORWQvRVFRWE1Xek0xUXFTeVA1SGcyaGlI?=
 =?utf-8?B?cGlYQVYyVzVzc3p0VXZnOWNYS2l2akdkcFhIMlQ2ZHNtSkkya2VOMHQ5U3Y4?=
 =?utf-8?B?QnBTRFVINW44SHZRK25pQmdkc3ZNZWlnZm5VUk95TGFXUGpITS8xQXNFRndx?=
 =?utf-8?B?czNuTUpaZmpFL25KSGZDbXdrcTl4MWpEMnVZT0dDaXFobzNhZEtYTXJNSWVW?=
 =?utf-8?B?ZDdqLzYyV2RvRlExTm9pOEt2U1RFdSs0UWxGRkx6a1dJTlNLMWRRQWs4VDNZ?=
 =?utf-8?B?K1VCNDJSNEVTWDQ1R0JKZjN3ZUw4cFVjQktCRUx5L21vRTc3WHZZYWsvSFlz?=
 =?utf-8?B?cERQOGNUekVkaHI2SklCVGhIMklSM0RDWnFYb1hNVUMyQUNLQWVsTStzcm04?=
 =?utf-8?B?UmVKajF6UkhpbVR5am5sWG9mZ0UwQlF2N0dTMTVDVG9CbzVXais1Ti9UeFBC?=
 =?utf-8?B?NXdyZFJ3SGE2cFpLQitRMkR3OFFyVGU3TTFxRkQ3YUhGemdRZVFVa3dianBw?=
 =?utf-8?B?UlRCajJKZk5xbzNXYWpFa2Y3czZYVFFodDZKVldoUzVDUnF3MW9xNmZoek51?=
 =?utf-8?B?MzJOT0FBQkVnbFZwbisrZzJuSkdXUUZuaGNzbWJxc2VvTEpBUk9LUVprMndD?=
 =?utf-8?B?QjJqL3pNOXE3N0UxZkgzOTYxVnBJRkFxc2xaRVdIeEtmMlliZUtHZzFHWkVy?=
 =?utf-8?B?TUZnZDR4dmd0a0MvMXBvR0F5czFBa1Z6T2lTeEVMSGlYdk8yVGhTMDdPRkpu?=
 =?utf-8?B?V2pCMnZDQ0E2QUIvdmlhMWRLdHFYaENJZ3dxM0lhaDZTY3BWV0ZRdk1MdUJS?=
 =?utf-8?B?OXBEK0JIZWx0NWlNSFF6OXhCSXFJSHEvT2xIREdqaUN3V1l2S1M4Y1lQSnJN?=
 =?utf-8?B?ZFJaWFBUa2dQb3BSdFkxYnFYVmwzdk1kTEZGRk9tQk1NRzN4eDNXdnhxNjhG?=
 =?utf-8?B?dnk1Mk91TmovUGpZVDY0aE1FRzMrOEE2ZVhERGFzQjN5YytNTmVDL1NvY2dr?=
 =?utf-8?B?aDBzaFk0bjVkdmpVWks4bWF1aVdIbWVDNTZUUnYvWmg1WnEvT0xKZTRheWJD?=
 =?utf-8?B?UUZDUU9zcTlUSmxsbVhDWjllZXE2ZDI3ZEN5ci8zank3bExTcUxZcjI5cGc1?=
 =?utf-8?B?YkZseXJ2OGdodWdzRCtiSDdHZjVuZWhKaEp4TEtvVm9mQ0xkVlArODJ3MGVZ?=
 =?utf-8?B?RTZRa0xSd015azNsOGxBVjhiZnBIUVFVT1ArbXRTdlJqTG94eFhsOGNUTE5Q?=
 =?utf-8?B?OEp6UnpJWDlzWVZwRWcrS2hId005UHNqYVUwaGlpNW9WZm5RVFZFWlh6NFVG?=
 =?utf-8?B?bERIdTk2K3V0K2JvMHJuV2ExMTFXVmdUL2gyZVc0MVlpTC81SUlhV3ZGenlR?=
 =?utf-8?B?MDJGU1ovMFc4ak1va28zYUVHRXk0Y21vcXRKbHhTcmdhMlBFMHJqRUVnSWxz?=
 =?utf-8?B?ZWpuOWlvaXZXWmdrS21UdEVVR2pzVk5sR2RZeUZQTks1TGdHVUFBUFVqYTdo?=
 =?utf-8?B?ckpEYVZzaHprOEdSZXBpc2ZaL1hUakYyaU5sWFJ4N3pHNDJkS0VISVFTQnJO?=
 =?utf-8?B?T3pneUZhcGZsVTVhS1JBZnhLcXZlNXVjdkxJNDFyNTZQRmJqL3VYMTl1U21i?=
 =?utf-8?B?OXJmSmRiTmxaVlZGdzNxajVYVkh3OGk4Uk9HM1NLbmVSeVFZSHIyT0hhK1Rl?=
 =?utf-8?B?YVl3Nm1jcS9YYXdrT0FnUVJ0TFR1c01qNUpnc0x2QnFDTVlJMi9DMmRLUDFp?=
 =?utf-8?B?UXBKTXhtaXFCTlVPYjdxSjV2ZnJqc3dvVHBFQmJYcElXZGJxTXQ2MG5SbEVx?=
 =?utf-8?B?eWkvYWgzVE81MFc5R0JvTk1kR3hIVHZZbjlrUXIyaUhXWHZpUy9lQXJGTW9K?=
 =?utf-8?B?QW5UU0RyNHV5Skxwa2U1K3VTMUxrTWU5RE5mZ1lBeEtNa1FPNUdDYzQ1QmNU?=
 =?utf-8?B?Qk9GUnVZL2NzVXd2N1pCQVBURm8yTS9LV2dGWHp6TE1XbEtnNjV0eFdmL0hC?=
 =?utf-8?B?MGhzKzlRS0RqWHQvOFBqVCtBNC8za3BucHovYWExMWF0NngyaVh0R3BUSW9S?=
 =?utf-8?B?eFBpK2pybmNRMThheHpMMFN3M2tXbGFBTmMvSHlJckpZMVo2YVR1YlpGQW1M?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6E817DCD1EA02458D19CE32E64C1A15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcde5b5-111c-40bb-7dd8-08dc961f92d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 20:35:53.1040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSB2XjUAwR2rHix+hXANyU3iiDM7MhXnaSH+UJchtUB1YUqW9rnTGHaxJF7SW0FN/E2JmwDWdYl7YgmMlTd45A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8042
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

T24gV2VkLCAyMDI0LTA2LTI2IGF0IDIyOjEyICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPg0KPiAN
Cj4gSW5jbHVkaW5nIGxpbmUgZmVlZHMgYXQgdGhlIHN0YXJ0IG9mIGEgZGVidWcgcHJpbnQgbWVz
c2VzIHVwIHRoZQ0KPiBvdXRwdXQgd2hlbiBzZW50IHRvIGRtZXNnLiBUaGUgYnJlYWsgYWN0dWFs
bHkgYXBwZWFycyBiZXR3ZWVuIGFsbCB0aGUNCj4gdXNlZnUgcHJlZml4IGluZm9ybWF0aW9uIGFu
ZCB0aGUgYWN0dWFsIHN0cmluZyBiZWluZyBwcmludGVkLiBJbiB0aGlzDQo+IGNhc2UsIGVhY2gg
YmxvY2sgb2YgZGF0YSBoYXMgYSB2ZXJ5IGNsZWFyIHN0YXJ0IGxpbmUgYW5kIGFuIGV4dHJhDQo+
IGRlbGltZXRlciBpcyByZWFsbHkgbm90IG5lY2Vzc2FyeS4gU28gZG9uJ3QgZG8gaXQuDQoNCkkg
Z3Vlc3MgdGhlIGluZGVudGlvbiB3YXMgdG8gaGF2ZSBvbmUgYmxhbmsgbGlrZSBiZXR3ZWVuIGd1
Y19jdGJfc25hcHNob3RfcHJpbnQoKSAnY21kW1hdJyBsaW5lcyBhbmQgJ0cySCBDVEIgKGFsbCBz
aXplcyBpbiBEVyk6Jy4NCkkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlIGlmIHlvdSBhZGQgb25lIGxp
bmUgYnJlYWtlciBpbiB0aGUgZW5kIG9mIGd1Y19jdGJfc25hcHNob3RfcHJpbnQoKS4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNv
bT4NCj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50
ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVj
emtvQGludGVsLmNvbT4NCj4gLS0tDQo+IGNoZXJyeS1waWNrZWQgZnJvbSBbMV0NCj4gDQo+IFsx
XSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTk4MDI0Lz9zZXJpZXM9
MTM0Njk1JnJldj0yDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+IGluZGV4IDg3M2QxYmNiZWRkNy4uMTEzZTYzNDhj
NmFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+IEBAIC0xNDg5LDcgKzE0ODksNyBA
QCB2b2lkIHhlX2d1Y19jdF9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZ3VjX2N0X3NuYXBzaG90
ICpzbmFwc2hvdCwNCj4gIAkJZHJtX3B1dHMocCwgIkgyRyBDVEIgKGFsbCBzaXplcyBpbiBEVyk6
XG4iKTsNCj4gIAkJZ3VjX2N0Yl9zbmFwc2hvdF9wcmludCgmc25hcHNob3QtPmgyZywgcCk7DQo+
ICANCj4gLQkJZHJtX3B1dHMocCwgIlxuRzJIIENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIpOw0K
PiArCQlkcm1fcHV0cyhwLCAiRzJIIENUQiAoYWxsIHNpemVzIGluIERXKTpcbiIpOw0KPiAgCQln
dWNfY3RiX3NuYXBzaG90X3ByaW50KCZzbmFwc2hvdC0+ZzJoLCBwKTsNCj4gIA0KPiAgCQlkcm1f
cHJpbnRmKHAsICJcdGcyaCBvdXRzdGFuZGluZzogJWRcbiIsDQoNCg==
