Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD32CEEC2A3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A8610E45D;
	Mon, 23 Feb 2026 22:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9V19WYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7D10E45D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771886721; x=1803422721;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oydxO2N0hO1ZIoulk/e5n4siOXfWRc+n8XzS5Ke8L4I=;
 b=a9V19WYkQjvab+cJXgGMi+PqeMr5Ovq7QjcP8CWm3wDj5DqDK4VjuGgE
 ijVkGsNqK6KClYfcG1xfsm7Bh+a1ovVEUqTE+SPv/B/O6Wl6w50PMMU6E
 CATmBAzdMrIomafj1FHmRwQgaFbjIln04NRm/7DlMOPQ4wFynziyb8OIp
 CGy7MUZZtu4TrfQZw3UAUIbziYkWfMv/hFyTrDcV4HxmNqVQR9sgw7Bmj
 rdyL9jGFMI60GCK0ZYeFagtpwfzye9MsFGUL32ZoDFZPgXg9n1tPe8lh8
 HI1VUgNlcQ3WobqgIoS6S6Vhqcs76DT363ivIeLfqOFm2BqWy/6+mp99S A==;
X-CSE-ConnectionGUID: UPdcNhoJSduj0UMIanc6Kg==
X-CSE-MsgGUID: BqGF0/lPQEKGZSJflWSuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72797674"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72797674"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:45:20 -0800
X-CSE-ConnectionGUID: y25rO/cLTcOShyxDWxYRyw==
X-CSE-MsgGUID: ttu44+EJTgCK+gk/seG6HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215722871"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:45:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:45:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:45:20 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:45:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkmG308gREVsxvhKO+v+0FNPzQLola3JN/bev0stqnY9DBZTB2d9ueCcaeKKvOx/WN5MjmQw+VdwiDoxCEPAdDCOmVGgG0zONDjmLxHUcDvt1fNlsDnh+z0mmnBJXVAURDIJHADrlbtG+D9h5UxTSw0eJoMDHe8kQ8pv/4m/uUeScTJT3R/ZTaAaVaGJE17Z7LMdY03GX+57suNUznO8pDZrMsIjH2YTczReAuwHQwCW8RUScLM2INK9sJDUq8SBe+1EwjAYQrcmnLQqfsP5UiBoCDnD+c9RfNR/l9QGB0EE2dzPf8AyHF/B9HI3RlpO8E1BaXlUX4b0vo/cw/VcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oydxO2N0hO1ZIoulk/e5n4siOXfWRc+n8XzS5Ke8L4I=;
 b=MP5PXrAb5hq4u8aAderUYskw4fHuOEsaRhdb1QCBNA+Y1FYl8UMnng1jGKpM/bLO5vom1IS1wYzxbhyXP9FhUKJiFaLngN/rwi78U7QdZ9lKUCFx/TRmbqCsas0ftoS46WDr7unKk20o7vok+RuEvZRWJG0u6K8umr/JOPmI7Kf/O0w7EWR23FM5PlVXahv1zzLYWM/2XIzXIDkK2aEQz/sXLVi04vTBajyigB0A8cP7BJ228Ycj0dzypdc+rxozjmXhWaVTOWrlj26nXitbLsPqliNUrk3KlX2TbVwJdaHHJVuwgMhTopWFxrIg+ZNbYAC8ZSPLrwfu9uCXT9cNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:45:12 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:45:12 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Move page reclaim done_handler to own func
Thread-Topic: [PATCH 2/2] drm/xe: Move page reclaim done_handler to own func
Thread-Index: AQHckPk2hi6+ElAo3EStAOOM4kPTsbWRCi4A
Date: Mon, 23 Feb 2026 22:45:12 +0000
Message-ID: <a05f998d318f822c761098d6e6cc8d206d89be95.camel@intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <20260129082756.1096935-4-brian3.nguyen@intel.com>
In-Reply-To: <20260129082756.1096935-4-brian3.nguyen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|CY8PR11MB6913:EE_
x-ms-office365-filtering-correlation-id: f9ad1ff0-5ddb-4fe8-cd79-08de732d3475
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bUwwQ1dJeXQ4OFR5WGV4dFVhOHJMeGtBTGM2TmlrYWNVYm00N1hWaHMwTWww?=
 =?utf-8?B?Ri8zSC91RnVkNDcvNzE4cW4rU0lieWpSemhKa0ZTS2pQMm9KK0l6anhVSTE0?=
 =?utf-8?B?dDAvQ2gwVDhSTk9GSUFPTmFXMDNiZSswWjZpV3RDWGFVQkdOSXh0bEw0WEV2?=
 =?utf-8?B?L3hEdXJ6Y2RuOHNRL0Z5RlJCR1VJd1NkclArUCsvZkVpblV4UEF6TStmTVAz?=
 =?utf-8?B?N1FTSW9tT2lmeEhKOVU2aVJtRGV5clF1WmM1VDlOb01EeTFvN0pESkorUkd0?=
 =?utf-8?B?bDJTNHJXNGQyUG52QUZQcFg1ZW52UHB4QTgrTFRLUVQvSjZnbWpyNGxycElT?=
 =?utf-8?B?anFUSVR5NElJYlVYS0RrUGtYTmhTbXpmbGE1MXZwemxrWnVzc0JIbmszSzB4?=
 =?utf-8?B?LzNFSzQyMlVOVVMyUTVnQkJJOHppMGwzZHoyWVlwcjZOcXlSWWF6eTB6azgw?=
 =?utf-8?B?RVNFMnREbVFYTERaWDc4NThnWWFmUU9vYkF4azNkSWJBUU5PUjRjcUlFWWVI?=
 =?utf-8?B?NGwvamRGNlBnUGtQcDRTTXhweGNRajQ4Z2Nvbi96U1JjK1RCZG9TaFB3Ri92?=
 =?utf-8?B?WGhKS2N2MFhuMEFnQUthUVNIVXdNRDhZTDF4V1FvZEJ2dkJEQkpubWplT1B3?=
 =?utf-8?B?MVgxcmttdG5reEk0SVhDa2VHOTZtMWVXVklJa3pBQlN5VFZvQW1WUFdiejUw?=
 =?utf-8?B?TmlUM2JmUWZSVFAzYU1icFdBT0hMT3ZxU2Zyb3d2QnQ0WGM1Y3hKU1NYampQ?=
 =?utf-8?B?SlVWdzhEVU9zOHdFZ21xdlJ2dzZoTEM3RnA0cG04Z1pXSFJML3BLamtRaUFX?=
 =?utf-8?B?ZlBGKzdKMHBRZG9ma1hYcjhDakl0cWlCdDZMOVM2RUdkdDZFaUlpVkh1TVFM?=
 =?utf-8?B?eTlURHVEZEtTV25ZNVBkaVg3QWdHZi82QjRabzdZUENqZFJ2YVptQzdDdzBS?=
 =?utf-8?B?c0tMKzVxMXVaUGlBWEZHenpJanp5WGtxenE3UmJ2bFp6akdwNjNXNE5KeW1N?=
 =?utf-8?B?RkxvSVZBbGQ0VG9FbmxSK1Zydmg5N0JFcUFVWngrbFRZeWx6SkFKaUlEbTlF?=
 =?utf-8?B?YW9rd1BPK3pjOEMrcmlEK3h0amdnOGRsbFNrZ054R0VPZXhMeXJ1dXc1M2ph?=
 =?utf-8?B?b25SZTNVREN4WW9TRDQ2WGtEOWs1alpFOGtjdFVJd0J3cVFTaHcvSmZuZ21O?=
 =?utf-8?B?SmN0ckxsemE2VERsenJLbGlBVVI3MWRwV3Noc0c1bXdnNHozQ29CbFg3ZjB1?=
 =?utf-8?B?ZHhjKzJ6dE9JNzUwbGkzV0ZSVzR6Vm9lUmg4UVRJSkg2M28wdG11dVZRN01H?=
 =?utf-8?B?Z0QzeFEzSEpEZzJWc0ltV01DcUsvSWdJTG9DNU1rcG9UWUdhTWMyWXZCSFZp?=
 =?utf-8?B?ZFg5Q0NnUmxacGVTL3VQdnpUeXNzNEhlcFg0L0lObGVhbURjYUo4bWcyY2tv?=
 =?utf-8?B?MkR0ZVd3WWViMkxLcDhoamRjVVFCM0ExWmsweS8zVU9oODdZSlUzeStRbnFj?=
 =?utf-8?B?NlFubXFCVGd0cFZidDZiYmU0VDZHNDlvdWtQT2t1TDA4MW9udXhmbWdzVnFB?=
 =?utf-8?B?djhoMUw3VzJQM0Jib1k2VU5MQ0Z6cGQ5T1NRdENJT0pyZTlOZVFwbFE0Rk1r?=
 =?utf-8?B?Zkk2SkpvV1ZRSFAxMks3VXlFK2xWb1RJRmVUVER4U0RJUkJFYjRIR3ZIWklS?=
 =?utf-8?B?c3VPakVyNnVVSEl1dmswYWVLVDRtUXhhQUJhWXBPTVhEeklBRmdnbjlreG9N?=
 =?utf-8?B?MElGdW5Vb2thVkwyMGYxSDllZmxsQXZrRFJyWmt0VXRZbEFpZkVPNkZ4S04y?=
 =?utf-8?B?Nkp6bFRWTzlZeXNMSGw5a3kxbXVseTkrVWxYVDBEOXhCdkxidkl2TmJuS2RH?=
 =?utf-8?B?QVdJRGg5WS9uUmpWang3Rm4yOFB0SDZMK2k0Ry9FYzU3Mm1XWXhHNEtzTW9G?=
 =?utf-8?B?bmttcEdhSTc1ZWwrYVhDZjE5akZYU1VZQldtYk45bTZhcS94Zk9nQnZRazBK?=
 =?utf-8?B?ZmRkTW9oQjc2WWxQUzZ3c2s0T2tYUWtnYUUyU2hOVGtkUGNvcCs2OXJ2c0RJ?=
 =?utf-8?B?em1IcXRpSGJEeEJkekdKUEFCcG1ZNWJndUVrbHMvTXAxbVVrcTQzbStqNXlE?=
 =?utf-8?B?RjNmaUozK2JVVHIrbVFtaWlYZXozRnluUHNEZFg1Znc4YjFTNlJJK3FJTjA1?=
 =?utf-8?Q?KiPO5xhG3rbSfze+4K5rhgo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VG9IMzZkMzZORUcwNU8zbFR1MGU1RmVpOWNqQWxvNkt0SnJzeW95L1dNNnlN?=
 =?utf-8?B?UjBROHErVENkejdtS0lGeDlDZFcrdXVwM0hlbW1BTmRTaTNnRlQyQWtEYXJl?=
 =?utf-8?B?dXJXY09FMU55bXlGclBQVWdGM09qdzQwNGhoaE1CMGhSUFBOZDNtNm4wcjA1?=
 =?utf-8?B?N3FJK1F5UlE1MVZvcUpyZjM0YnhVT3pDdjZ4dTc2Y2FmMUdKWWRJOEpqbFBz?=
 =?utf-8?B?ME9Gek12V2hWWnZVVTMrMkdxdGpLYzFhUVRUU0VDallqcXBlVDhzTXRKTC9D?=
 =?utf-8?B?WlpFc2VLTlRXanBKaEgreXc1MnlRcnFha043QjFjYnNyTEdlOFhMV3l2cnFa?=
 =?utf-8?B?ZCtBL1dSTTRDZ1drOFlkYnFIZEpJYnN4cDhQSm5Ub2FDamZJVGJNeWNEYk9M?=
 =?utf-8?B?VlVFSHJoYmRQajluNTdjZkZRM215UTd0V1BxM2FlMHB0MUd1KzdGNXBIUFFD?=
 =?utf-8?B?bnBFdXJmQ21YMW5hMDQ3M0QrQy9rbHZJbC9lRlVvSVduUzdrWHV5VC9zV0lZ?=
 =?utf-8?B?cEE4cy9hNVJhM0xVd2dkMUR3MXM3RFcxQnozc3N5WVVrT0ZJRnVHT0lETDhm?=
 =?utf-8?B?Y3VxbHRBRk1uN3hVb2JSdk1Jcm9GdzR5Ym9La2lyTThVNm1OaHFaU3hadW4x?=
 =?utf-8?B?QVJiTGxrWEYvUGNDL2JoTWkyYjdHT1ZmUDlkbmdGM3pSWllMbFArQm1vYTN4?=
 =?utf-8?B?d3dGTnBTRHAxdWJCOFZKeHZXT0xpNmhibjFUbmtuVE50dWpkb1hCbzllbVpj?=
 =?utf-8?B?eDl0L0NQTHNnYjFaU2xscGx3em5kR2VoMWJTVVY2aWQzS0FZbXJjKytKVnJl?=
 =?utf-8?B?VzNsbWJ3MVdSUHJOcTE2d1A4Q2VFekpWR0pGRUV2dTZlR2s2MmdwSjFkV3RG?=
 =?utf-8?B?dXhvTXdXSzBzMGVYOXVPL0s2dGszNzBsSVR2WVd4ZUJ6UTlPSEI3Si9tK1hH?=
 =?utf-8?B?ZU81NlZQcFZqZnc2dzdLNTd3bDBOK3h4Zld2eWZVblk0NTVQd0lEaU83RUJx?=
 =?utf-8?B?UnZEMmZHZ2NYWHZ6WnFPTnhXNWVRM0pqVWxja2hqbkczRGMrQ1dIaTFjbnZu?=
 =?utf-8?B?QkEyRFd1ZmxNL2tUaHJBL01kbjVMbWYzSFFOZTZvVkUyV0VzeHVvVHQ3Q1U1?=
 =?utf-8?B?SW1sRTBsbXEvc3FKQ1E2UlRWTDhubEdTM2xKRHlwWmdrSHBvTWlVblFJR2FW?=
 =?utf-8?B?b0NqNUk0YXFoZXg4T2VvcHp0VGlZY2gzeVp4c3haVlJ1WG1MT0Z1RE14QkQ0?=
 =?utf-8?B?Smh1SVVaUjNBL0hKWVJyZDVWbk1KNzhwaSt5NmRmUndNSjFLN3JPTndlOWpI?=
 =?utf-8?B?Tkw5bDJGMjJla09YQXZPUm55SWE5U3BLLzAwTHIreXovd0tLN1VSb3ZzclRO?=
 =?utf-8?B?NC9kWjZ5bjA1alV4R2Y4SER3TDJaa0VCci9JY1JnT0d1YUphRWhHN0VPK01m?=
 =?utf-8?B?Vkw0UXpsQXpLdk9sdUwvZkk1TmxMTmtwbE9Ia1ZGSFl0bTlVdkJ2blBOck1p?=
 =?utf-8?B?NFFuNVViL0xkTEM2UVhlU3RGZCtoSlNHdmlCTytpdDU0NjdZUnJqa0U2U2lv?=
 =?utf-8?B?eVlHZE0yWC9kRGFQREFOZ1NBN3FEUzdkN3VKekJsdEJZcDFIeTdHcHFnMEVX?=
 =?utf-8?B?WE1Mcnh1N3B6NmgxSWVLZFBNZ0ZGRkRXaWZoNnA4OHFZaU1xYXR5TGwrQnVE?=
 =?utf-8?B?eTJSYW00RlprVVZlRXBSRU81YWJnU3Q3UGVzRjNEVGxlWFhwWDU5SHVxMjl3?=
 =?utf-8?B?S00wT0I3VndkM09qVVdJYkYwbFdkVENORVo4c29ycHB1L0ZBaVhLSC9kYjVH?=
 =?utf-8?B?VjE5UmltaWVFVFpqYmlXSzg3NVhSVHlvSU0zdFdJcXYzWHUzMFFIM205aCsx?=
 =?utf-8?B?MmFwRTFLeW8wb1JmYkRFbkt4MDZkczZjNlhpY2ZoTGp4em1YaUQ4aU04NGRk?=
 =?utf-8?B?MzZ3WUNCWUNsVmJJc2E1VzRqSGdMdGtiVFdYY0NvTjlVV09Bek45bVEwMElm?=
 =?utf-8?B?UjZkTmxubjZMRzB1RVhSTWVTYXZJWFZzQlpyenRCaW51OUtxVFFNaGFydzdQ?=
 =?utf-8?B?OU5yd05PWUQ1NjJMdmhSTTJITURsUzVqTWNuZ25Pd3N6Z3BISTZRZDNxeU84?=
 =?utf-8?B?YU5iK3Bvd0xhUmx6RFN3bDZuVy9OZ2c5VktjWlloc3BXamVldHFFaDQyRmor?=
 =?utf-8?B?eUNBMnBESCszYzBFeWROYTJZOXNRRGJUOXlJSHgxZ1JiQ3pwbk1uazBwT0wz?=
 =?utf-8?B?bHQ2eU5BaExvc3V5S3VaRXVVK3lqTUtJQURDcWU5RlY0MnI3ZmFJVE1qTlNZ?=
 =?utf-8?B?d3g3VG5XWWdiL3dnT2hMTFdyVmVUODAwYlErS0FYcks4ZGVZQTRDaCtQQ0xo?=
 =?utf-8?Q?TQfqGxk3hr9JbQ6E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <140E5C41BFCDFE498D1F8130D0B617CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ad1ff0-5ddb-4fe8-cd79-08de732d3475
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 22:45:12.3892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8Bg/svZve373YOZkZKDdbjGq21F/PKqry0SCZd2/Qb6g06VZ1y9aa0+tsgwrwxyuQG62Gci+un/ySeVSumPvX5vbAmJ4Fxkf1mMyfxPhlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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

T24gVGh1LCAyMDI2LTAxLTI5IGF0IDA4OjI3ICswMDAwLCBCcmlhbiBOZ3V5ZW4gd3JvdGU6Cj4g
T3JpZ2luYWxseSwgcGFnZSByZWNsYW1hdGlvbiBpcyBoYW5kbGVkIGJ5IHRoZSBzYW1lIGZlbmNl
IGFzIHRsYgo+IGludmFsaWRhdGlvbiBhbmQgdXNlcyBpdHMgc2Vxbm8sIHNvIHRoZXJlIHdhcyBu
byByZWFzb24gdG8gc2VwYXJhdGUKPiBvdXQKPiB0aGUgaGFuZGxlcnMuIEhvd2V2ZXIgaW4gaGlu
ZHNpZ2h0LCBmb3IgcmVhZGFiaWxpdHksIGFuZCBwb3NzaWJsZQo+IGZ1dHVyZSBjaGFuZ2VzLCBp
dCBzZWVtcyBtb3JlIGJlbmVmaWNpYWwgdG8gbW92ZSB0aGlzIGFsbCBvdXQgdG8gaXRzCj4gb3du
Cj4gZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTmd1eWVuIDxicmlhbjMubmd1
eWVuQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuY8Kg
wqDCoMKgwqDCoCB8IDIzICsrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcGFnZV9yZWNsYWltLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VfcmVjbGFpbS5oIHzCoCAzICsrKwo+IMKgMyBmaWxlcyBj
aGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2N0LmMKPiBpbmRleCBkZmJmNzYwMzdiMDQuLjNkNjkzMTQxNzBmOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2N0LmMKPiBAQCAtMzEsNiArMzEsNyBAQAo+IMKgI2luY2x1ZGUgInhlX2d1
Y19zdWJtaXQuaCIKPiDCoCNpbmNsdWRlICJ4ZV9ndWNfdGxiX2ludmFsLmgiCj4gwqAjaW5jbHVk
ZSAieGVfbWFwLmgiCj4gKyNpbmNsdWRlICJ4ZV9wYWdlX3JlY2xhaW0uaCIKPiDCoCNpbmNsdWRl
ICJ4ZV9wbS5oIgo+IMKgI2luY2x1ZGUgInhlX3NyaW92X3ZmLmgiCj4gwqAjaW5jbHVkZSAieGVf
dHJhY2VfZ3VjLmgiCj4gQEAgLTE2MDQsMTcgKzE2MDUsMTEgQEAgc3RhdGljIGludCBwcm9jZXNz
X2cyaF9tc2coc3RydWN0IHhlX2d1Y19jdAo+ICpjdCwgdTMyICptc2csIHUzMiBsZW4pCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfcGFnZWZhdWx0X2hhbmRs
ZXIoZ3VjLCBwYXlsb2FkLAo+IGFkal9sZW4pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgWEVfR1VDX0FDVElPTl9UTEJfSU5W
QUxJREFUSU9OX0RPTkU6Cj4gLcKgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfQUNUSU9OX1BBR0Vf
UkVDTEFNQVRJT05fRE9ORToKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogUGFnZSByZWNsYW1hdGlvbiBpcyBhbiBl
eHRlbnNpb24gb2YgVExCCj4gaW52YWxpZGF0aW9uLiBCb3RoCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIG9wZXJhdGlvbnMgc2hhcmUgdGhlIHNhbWUgc2Vxbm8gYW5kIGZlbmNl
LiBXaGVuCj4gZWl0aGVyCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGFjdGlv
biBjb21wbGV0ZXMsIHdlIG5lZWQgdG8gc2lnbmFsIHRoZQo+IGNvcnJlc3BvbmRpbmcKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZmVuY2UuIFNpbmNlIHRoZSBoYW5kbGluZyBs
b2dpYyAobG9va3VwIGZlbmNlIGJ5Cj4gc2Vxbm8sCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIGZlbmNlIHNpZ25hbGxpbmcpIGlzIGlkZW50aWNhbCwgd2UgdXNlIHRoZSBzYW1l
Cj4gaGFuZGxlcgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBmb3IgYm90aCBH
MkggZXZlbnRzLgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y190bGJfaW52YWxfZG9uZV9oYW5k
bGVyKGd1YywgcGF5bG9hZCwKPiBhZGpfbGVuKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgWEVfR1VDX0FDVElPTl9QQUdFX1JF
Q0xBTUFUSU9OX0RPTkU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhl
X2d1Y19wYWdlX3JlY2xhaW1fZG9uZV9oYW5kbGVyKGd1YywgcGF5bG9hZCwKPiBhZGpfbGVuKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDC
oGNhc2UgWEVfR1VDX0FDVElPTl9HVUMyUEZfUkVMQVlfRlJPTV9WRjoKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19yZWxheV9wcm9jZXNzX2d1YzJwZigmZ3Vj
LT5yZWxheSwgaHhnLAo+IGh4Z19sZW4pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYnJlYWs7Cj4gQEAgLTE4MjIsMTUgKzE4MTcsMTMgQEAgc3RhdGljIHZvaWQgZzJoX2Zhc3Rf
cGF0aChzdHJ1Y3QgeGVfZ3VjX2N0Cj4gKmN0LCB1MzIgKm1zZywgdTMyIGxlbikKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19wYWdlZmF1bHRfaGFuZGxlcihn
dWMsIHBheWxvYWQsCj4gYWRqX2xlbik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfQUNUSU9OX1RMQl9JTlZBTElE
QVRJT05fRE9ORToKPiAtwqDCoMKgwqDCoMKgwqBjYXNlIFhFX0dVQ19BQ1RJT05fUEFHRV9SRUNM
QU1BVElPTl9ET05FOgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBTZXFubyBhbmQgZmVuY2UgaGFuZGxpbmcgb2Yg
cGFnZSByZWNsYW1hdGlvbiBhbmQKPiBUTEIKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogaW52YWxpZGF0aW9uIGlzIGlkZW50aWNhbCwgc28gd2UgY2FuIHVzZSB0aGUgc2FtZQo+
IGhhbmRsZXIKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZm9yIGJvdGggYWN0
aW9ucy4KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBfX2cyaF9yZWxlYXNlX3NwYWNlKGN0LCBsZW4pOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0geGVfZ3VjX3RsYl9pbnZhbF9kb25lX2hh
bmRsZXIoZ3VjLCBwYXlsb2FkLAo+IGFkal9sZW4pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfQUNUSU9OX1BBR0Vf
UkVDTEFNQVRJT05fRE9ORToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19nMmhf
cmVsZWFzZV9zcGFjZShjdCwgbGVuKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0ID0geGVfZ3VjX3BhZ2VfcmVjbGFpbV9kb25lX2hhbmRsZXIoZ3VjLCBwYXlsb2FkLAo+IGFk
al9sZW4pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDCoMKgwqDC
oMKgwqDCoMKgZGVmYXVsdDoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0
X3dhcm4oZ3QsICJOT1RfUE9TU0lCTEUiKTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZV9yZWNsYWltLmMKPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wYWdlX3JlY2xhaW0uYwo+IGluZGV4IGUxM2M3MWE4OWRhMi4uNjBiMGZkYTU5
Y2UzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlX3JlY2xhaW0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYWdlX3JlY2xhaW0uYwo+IEBAIC0xMSw2ICsx
MSw3IEBACj4gwqAjaW5jbHVkZSAieGVfcGFnZV9yZWNsYWltLmgiCj4gwqAKPiDCoCNpbmNsdWRl
ICJ4ZV9ndF9zdGF0cy5oIgo+ICsjaW5jbHVkZSAieGVfZ3VjX3RsYl9pbnZhbC5oIgo+IMKgI2lu
Y2x1ZGUgInhlX21hY3Jvcy5oIgo+IMKgI2luY2x1ZGUgInhlX3BhdC5oIgo+IMKgI2luY2x1ZGUg
InhlX3NhLmgiCj4gQEAgLTEzMCwzICsxMzEsMjIgQEAgaW50IHhlX3BhZ2VfcmVjbGFpbV9saXN0
X2FsbG9jX2VudHJpZXMoc3RydWN0Cj4geGVfcGFnZV9yZWNsYWltX2xpc3QgKnBybCkKPiDCoAo+
IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcGFnZSA/IDAgOiAtRU5PTUVNOwo+IMKgfQo+ICsKPiAr
LyoqCj4gKyAqIHhlX2d1Y19wYWdlX3JlY2xhaW1fZG9uZV9oYW5kbGVyKCkgLSBQYWdlIHJlY2xh
aW0gZG9uZSBoYW5kbGVyCj4gKyAqIEBndWM6IGd1Ywo+ICsgKiBAbXNnOiBtZXNzYWdlIGluZGlj
YXRpbmcgcGFnZSByZWNsYW1hdGlvbiBkb25lCj4gKyAqIEBsZW46IGxlbmd0aCBvZiBtZXNzYWdl
Cj4gKyAqCj4gKyAqIFBhZ2UgcmVjbGFtYXRpb24gaXMgYW4gZXh0ZW5zaW9uIG9mIFRMQiBpbnZh
bGlkYXRpb24uIEJvdGgKPiArICogb3BlcmF0aW9ucyBzaGFyZSB0aGUgc2FtZSBzZXFubyBhbmQg
ZmVuY2UuIFdoZW4gZWl0aGVyCj4gKyAqIGFjdGlvbiBjb21wbGV0ZXMsIHdlIG5lZWQgdG8gc2ln
bmFsIHRoZSBjb3JyZXNwb25kaW5nCj4gKyAqIGZlbmNlLiBTaW5jZSB0aGUgaGFuZGxpbmcgbG9n
aWMgaXMgY3VycmVudGx5IGlkZW50aWNhbCwgdGhpcwo+ICsgKiBmdW5jdGlvbiBkZWxlZ2F0ZXMg
dG8gdGhlIFRMQiBpbnZhbGlkYXRpb24gaGFuZGxlci4KPiArICoKPiArICogUmV0dXJuOiAwIG9u
IHN1Y2Nlc3MsIC1FUFJPVE8gZm9yIG1hbGZvcm1lZCBtZXNzYWdlcy4KPiArICovCj4gK2ludCB4
ZV9ndWNfcGFnZV9yZWNsYWltX2RvbmVfaGFuZGxlcihzdHJ1Y3QgeGVfZ3VjICpndWMsIHUzMiAq
bXNnLAo+IHUzMiBsZW4pCj4gK3sKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4geGVfZ3VjX3RsYl9p
bnZhbF9kb25lX2hhbmRsZXIoZ3VjLCBtc2csIGxlbik7Cj4gK30KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BhZ2VfcmVjbGFpbS5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGFnZV9yZWNsYWltLmgKPiBpbmRleCAzZGQxMDNlMzdiZWIuLjA0MTI2MTFmM2FmNyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZV9yZWNsYWltLmgKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGFnZV9yZWNsYWltLmgKPiBAQCAtMjAsNiArMjAsNyBAQCBz
dHJ1Y3QgeGVfdGxiX2ludmFsOwo+IMKgc3RydWN0IHhlX3RsYl9pbnZhbF9mZW5jZTsKPiDCoHN0
cnVjdCB4ZV90aWxlOwo+IMKgc3RydWN0IHhlX2d0Owo+ICtzdHJ1Y3QgeGVfZ3VjOwo+IMKgc3Ry
dWN0IHhlX3ZtYTsKPiDCoAo+IMKgc3RydWN0IHhlX2d1Y19wYWdlX3JlY2xhaW1fZW50cnkgewo+
IEBAIC0xMjIsNCArMTIzLDYgQEAgc3RhdGljIGlubGluZSB2b2lkCj4geGVfcGFnZV9yZWNsYWlt
X2VudHJpZXNfcHV0KHN0cnVjdCB4ZV9ndWNfcGFnZV9yZWNsYWltX2VudHJ5Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdXRfcGFnZSh2aXJ0X3RvX3BhZ2UoZW50cmllcykpOwo+
IMKgfQo+IMKgCj4gK2ludCB4ZV9ndWNfcGFnZV9yZWNsYWltX2RvbmVfaGFuZGxlcihzdHJ1Y3Qg
eGVfZ3VjICpndWMsIHUzMiAqbXNnLAo+IHUzMiBsZW4pOwo+ICsKPiDCoCNlbmRpZsKgLyogX1hF
X1BBR0VfUkVDTEFJTV9IXyAqLwoK
