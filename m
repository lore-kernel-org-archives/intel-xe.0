Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85D606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYtcODEa;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fFuR4uNN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FAB10E882;
	Wed, 25 Nov 2026 05:12:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AB910E882
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 05:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583569; x=1827119569;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8EkJbN++MwDSDvkrOZz0jz6pzAzBvXmqX/Njp/Ip39o=;
 b=QYtcODEaomNaEHE7YzQlbZxKRjXLvq4+ys1mIamPd7+5vWTMjxBYVpTg
 m/N8D8taYoukhS+OQoyQBNxbioaawULOQnne80BsVqx9Qp01/EBg7fd/5
 V6/o1VvaEQ6GN5KT+0ERB8n5RbSuEgHwJOBydYNwJwcD4l/MAFYiknQJY
 jl8Io+pOcCS6+p0RBul4Z1gjF9/dSulZdTPlI2tY1nf2E7GxgVFEyDh39
 csS1XMVUeawEIM8wOX2ld/Uf5fXo5WgdVePWHJgQBFXkgDKB3XlkIhtgf
 ikrP0e5RY4JFkAuMPD3r0mZaCQfWTU9G2BmRntgsxm2B2ENeSRytYLp8e w==;
X-CSE-ConnectionGUID: 9y7C0j4xRbuyU9QZltNJXg==
X-CSE-MsgGUID: 6uwGSIISQWqu1RWOVPeCnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4423290"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4423290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:12:48 -0800
X-CSE-ConnectionGUID: kKAVDFyyTSetKFHzoCfNGA==
X-CSE-MsgGUID: H1DBdqsqRU6xwMUxTwopHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11806982"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:12:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 21:12:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 21:12:47 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 21:12:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwAD+pBMk9KSVJfGYqqwnnsvZ00pZCN/5IFraqIldrQt8kIi4t/ZdmTfCfeGtoVfaQc/Iiwcv5+MikbYJpsD+m1d/7KvGh63s8wOeXQhQxOHugAmB0mQyON4AfViYabIUbXExc34AL+OAJ2EfGEin+JT/unnOFIaRa0VyKpNjSq8d7netmmLwp0DgNxqxWGWvKRnNFzrG0hIqhr1ixNcigRa0lrfWEO1tUxW6DMebZJW6pEWPHeEYV0m7ilJmjrN/Xbih7aV1b5t7FIHaEjHG7NTXcZeWZyzoC+qgOFhddJOviokiSU0XZoqtQO7URZOK3XwPSmuQtl2rPzRm6Ts3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EkJbN++MwDSDvkrOZz0jz6pzAzBvXmqX/Njp/Ip39o=;
 b=se9UP3UjOUtpgCz06ZxDYgxK3FhiH5Qzfb42TPNZA/6499twrpgaEwYj1A/LspwYgnZkfXUkaXmcPrxL+JNjVSVfS3VC77oqUuaxG1h+xd5VCM/ue6PcXyH5DpHHv1igssQc4kne8ZxwQ3N3TP3LP1pPZ29BnMeUanAmudl7H3hz0z9No63YEFOnCHIQM8Wu2dL+lYF7agm8uhAJEF37fCFFKfFC3sE0pxILV3NuCGzS/99p/0gEecOY19cbDHUtPYxh7K/yKSBeZgqLX7aVMKgh0RJ3/kg2ddtUizHAzXepv2yx8tTq200nH58DBuR8eZwrv9MDu6Js7mts3SKzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EkJbN++MwDSDvkrOZz0jz6pzAzBvXmqX/Njp/Ip39o=;
 b=fFuR4uNNrkqRYG0yEw76tikaLCv8gjRVi9rnfAOMk8x5ah4jIf0SygGrjF5/F+EE6Vg3KMe2T7um7dxR4Znefg/MRE0SZsaCK3jWY+EwzbbP1HXkje6H+eas7r4vra3cLAyUNP19XtKsp+3Q9xjFL/TC06Ifj0mF0TTZ5iZLQmo=
Received: from DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 05:12:45 +0000
Received: from DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920]) by DS4PR11MB131308.namprd11.prod.outlook.com
 ([fe80::40c0:7a50:a98c:8920%6]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 05:12:44 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Piorkowski,
 Piotr" <piotr.piorkowski@intel.com>, "Narvaez, Jesus"
 <jesus.narvaez@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: RE: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Topic: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction
 definition
Thread-Index: AQHdc4gTipSxNVJaGEaU8avaAK5LZrc2n90AgABNoaCABPeV8IACahvw
Date: Wed, 25 Nov 2026 05:12:44 +0000
Message-ID: <DS4PR11MB13130841BCD43C2A80DA7ACB7EC8432@DS4PR11MB131308.namprd11.prod.outlook.com>
References: <20261113155734.4164230-1-tilak.tirumalesh.tangudu@intel.com>
 <20261113155734.4164230-3-tilak.tirumalesh.tangudu@intel.com>
 <1334be6a-b10d-48ba-acdd-81b54e0cc15b@intel.com>
 <DS4PR11MB131308979BF5529C7AEA338F72C8782@DS4PR11MB131308.namprd11.prod.outlook.com>
 <DS4PR11MB1313087323AD767C4484EC94D8C8452@DS4PR11MB131308.namprd11.prod.outlook.com>
In-Reply-To: <DS4PR11MB1313087323AD767C4484EC94D8C8452@DS4PR11MB131308.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: thomas.hellstrom@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB131308:EE_|SJ2PR11MB7547:EE_
x-ms-office365-filtering-correlation-id: daebf56b-4a9b-494a-2419-08df4ab2bd3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|921020|38070700021|10067099003|56012099006|11063799006|260925022911599003|260925021311599003|260925021911599003|261022105027099003|261022075727099003|261022113327099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|4143699003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: EW8D6bafz2+o1E3jsbXvz6gGAOFyptbSdsQFjYULjvNWgn93UEZAYys4idBCkxtf9s963q046StmAJVG+BfHme65nl1Qj0w1/5QHixyAzGtSeqo96tWnDDokOpbAg0W6jaABMbBP03xM1Bguu8ZoTcbvkQGnm7GFCLTaJuvNWC/xFEig+qCSTXJeeid4uQR9Gzmmc0SoRKNImWO35Xy6B1yo4+yTLPd+vV+h4X4yFuCrEvFO/0kvR3+Yw9JXBwCEpGjGBdnLUyYgomAdwkd1HHGnplkL2SNaTiCaJuLk90CgQ1ZAAN/oYBbpM280LJPyyAarrke37kJm/fR2WmxJ55Bfo/ooi6XjMrmCjlljL1CDpZ5+PfBT65ffwpLy8Hx5cmQqVRhgyRTsq+FFEcmuVaOaBWM/jl3kJGKg1o0gUobjzisTTIGcN+14/yjkRcVP8eJMKvzAVDO7GPAo38QutQX+kyNifjiCY2b2p/U0bybEVTARjvQFBTTBWh9n0qGH7lbdPQa5DREdoYm53IgbfXw8j3f0lv/xuXVZBnTSeWyjxGCWcR/U6Ml1vDM/T1OhrufVMgd7UfWJ78/czcR0fAkydV5pZa9nn8ju+87Icswy982OqVd2Rtob9IEpEzsLdHWzYCy26n6OOAIm/ct2llcKTLIq3046iYK2lDFR2SQamwWyKnwdHaNFDIul3wBaruHS8o06PzFrQlsos2QupeFSlQF7Yxu+vqCaNn2+CpI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB131308.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(921020)(38070700021)(10067099003)(56012099006)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(261022105027099003)(261022075727099003)(261022113327099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm4veWIzRjhiRG1jaVJObTNDVnhFV2FxeWwzK3dOQmR1QTJzTldob2gxTWtn?=
 =?utf-8?B?ZXVZUGNMNFMrdVh0NjZ0WE55WVpXUFUyUjJCTGRscE41bUdXZXI5bis5NTNB?=
 =?utf-8?B?NHF4QmJ2eEFSc0FyamZlV1pnSWFNbXJjUDZqU0UvTCtLZ0hqU0hOcGlZaCtH?=
 =?utf-8?B?bW8zMDRLOFVBankwZnFWdlNuMlZDRFRLVU1CWXg1alZDZklxai9KNWxjYmVn?=
 =?utf-8?B?MC9wYy9ZajdCWGFENGlOOGVhUTEvY2ErRXpjR0x4bXRSSk0vZUdKMkJMRk1P?=
 =?utf-8?B?Z1dQc0oyc3JHd3lIYjVZcjNQV0wzQ1M2Q0t6bC9leENzR1hQcTcvLzhXWUhN?=
 =?utf-8?B?YUFVN3dPeDlkM3BzYUhDekxlMGZKc3dzN0k3MTBIWUJINXRBWDBISFhXaXBa?=
 =?utf-8?B?QTFoTDNEalp1SnYzdG4yRDRWK2Mwb1U5YXVUekprS0JodndqajlKeC8vcUJT?=
 =?utf-8?B?NnB0Ukhla0xnenBmWnN4UHIrejQwb1NqQzlvM015RFh3cGRXYVJ5d2I1ZTFi?=
 =?utf-8?B?cEhySGdjOWRCa1dvSzl1RWg3anozMjBxMGRyNTB6cXVJbVpIcXorQXExTUxv?=
 =?utf-8?B?K2R1dnh4c0F1QVBNL0FhRjg5OVhVWEFhYlRkYU5TNXlCa2FhQVpQMmJNaFRv?=
 =?utf-8?B?TEhNNjZGM1FFZzNURmJsdGdEY1JpV2dzTmhSTHFOallYaXdzVkcrTytwU1Iz?=
 =?utf-8?B?cENtYjBZSG15ZjhlY0NRd1JlMHMrK28rZU9jUW9UT3JybEo5R3RyNC94a1dS?=
 =?utf-8?B?YWhOb1B1Q3Zhb2d4TXNBMDZ0d0JtNnBHZlMzKzdCQm9kamw5L2t4ZFRnUS9L?=
 =?utf-8?B?MENVRGhyUUNVTUtXb2pCSlo3M3ZjVXJKeFVsUHRHUVphY2dRTEwyOGQydERE?=
 =?utf-8?B?ZWxBdzdqNjFmOUVyMFVGRnBQZFMrYWhwWkpWUkYyaGdWcXgzWU9lMElrMGkz?=
 =?utf-8?B?TU4xVDg5M09PVGhjWWRZbTNrZHlkZnFiSjhuZnhEQnlNRHYySzJXem1LUHI2?=
 =?utf-8?B?MndLaG03UGtnZ1VLOWN3SHRXUnh0ck5TYkdCM203bDZ5SmdEZU1WK3hsS054?=
 =?utf-8?B?NDF1ay9DSXRubG4xbHcxaUpyRGhmQmd4Tm82ekZtOFEvbjB0S0ZVcjY0NEo1?=
 =?utf-8?B?dlpKSjMrNlZ5Q2JuM1A0UHFpZ3RoQTN1NDRpM09HOFpGamg0S0tXWkkrL3NF?=
 =?utf-8?B?U1phdmJoZkRDQXdlZzE0QWJiOStqSlR1ZVFjZXdWeVdtdHZXWlJHUG5IWC9W?=
 =?utf-8?B?Kzk4OU9iLzdrSlRCMTNHQ0tSdjdNUk1MY2ttNExKazk3NTdsQU41VE9sNUx3?=
 =?utf-8?B?WHVIS3lTNGJueE5Cb2Q2SWhoKzl2SjQrTWQvall2L0U4YllSNkY1T2c4NFI0?=
 =?utf-8?B?a0g1bXNpOVduUE9YZXdycENVbUJXMHZGcStxQWEzWGNQTVRxUGtDM1hSMjdy?=
 =?utf-8?B?N3NFS3pnN3YwMlFnekJHVkFNL0J6YUMyRlFDK1QzSDFocFdPd1lZdHhUQlZR?=
 =?utf-8?B?aHh0Ly9oTEF1dTZBYTFHZmh0VzQ5TjdtYmlzeVdBVVRHck5uMmRiQzR2SUdm?=
 =?utf-8?B?MFpqVHdMUDRMc0ZrWmFFRE05SVNmcWg2T0p3RG92TzBRMmUwVEoraUtTL2NK?=
 =?utf-8?B?YmIwTzNnY1grV2I1RkgwaDNlbVVUNTM1THlEMlkrVEpVTzZCYXkra0ZlRXFE?=
 =?utf-8?B?MGI3bWtReCs2S0hIY1RyQ1A5ZmJpU2NIczhCeWpnY04wM0pneE1HN0lTeUs3?=
 =?utf-8?B?QlhSUlMyOUF3K1p5aGFFSUdyWWVjaXhaVG93SlhQN2poUzYvNWRxZ3hBdUFx?=
 =?utf-8?B?bnNSNmliVG1pMDJURmdjQU1xa0NQaXNJOHlxNTVaVlMyVnoyekFzR0FrVnhJ?=
 =?utf-8?B?SGlwQkZUbmFiQ1g5SzF5WGwwYkpZQXI3N3lBaThMZWlUMEw0UUtZNFB3WmEy?=
 =?utf-8?B?Z05kdi83NW9ZOCtYQzZpRnpmVTAzWENTSGtybERCMHVucTlQUlJPL0RpV1FB?=
 =?utf-8?B?aktwVHFnUWlMazhDQXQ0QzBGMXBDOE9ySVlhaDVTcnBzSGpxTzdxMlRuOUdW?=
 =?utf-8?B?QjdaODMyQU5mSGg2TVpFYnE3TkRJYXIrU2h6TEhEaW00dU5XNmRRMTd3dUF0?=
 =?utf-8?B?c0VUNFdPeW9RZURFMjRVRnR3QUpkMGQvbW9tWUhMTTB1SWs0VkZwcFlnOVZS?=
 =?utf-8?B?eHUxK2N2VWxWWUk2dnJIeWpxaTdvcXdyZytIYzhLL1lPZmNqZDJDRkZRcURS?=
 =?utf-8?B?cGgyVzBBSExpazRhVytJZ0tnOXJxU0I4WU1BSkpvMXNDbkpnUWxIMnE2czVk?=
 =?utf-8?B?Y2dsZkxYSWhldkpCVlpxK0ZZMmU3TVY4cEJWejhUOFZrR2oyV0NpQTF2SUQ0?=
 =?utf-8?Q?YRrP9b/kXr9BKshg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JTtu93xKPs0hXZsMaF+CF8f+FOZ5S537lEdnMACeTUtxcYMHrOn/wyBmlM6Unn41MylhOutCArx3dMG92348tWFgPeZsmEuDIy/xK7TfpR08J6IGOoAnCY7TEV6PJJksFaRudDMuZR68O4P/DcJWu+p8NDWm3OYko+c0wglAnlzuHbVS/0sWCc7an5Uz2MgfbWndHoQyzr6N8IgsreIKYMkSDPhx8hi1VXU2pvsctB7wRtUUAGlePa8TF7M9DSi3PvCgWuspD2wR5BhRV+5CqxvRj1LQfGBuFvDzgVK5uUNcspsILdgvOV2+NOmlrGkjRkaylWEx8XHnex4e4q1H+w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB131308.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daebf56b-4a9b-494a-2419-08df4ab2bd3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 05:12:44.8926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDNS0pLUKr9sILc1fkfqI1/dvmnBMDTesyN2yo1Y1N5Dj5fDhIdDqk67Qpc4ssuJBnoCRrppav2a1P2ZRygMOnmQtmyW63jbQFnkVhJUKw7Q7u6aBAq3TVII2QOqWL5R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGFuZ3VkdSwgVGlsYWsg
VGlydW1hbGVzaA0KPiBTZW50OiAyMyBOb3ZlbWJlciAyMDI2IDIxOjQ4DQo+IFRvOiBLIFYgUCwg
U2F0eWFuYXJheWFuYSA8U2F0eWFuYXJheWFuYS5LLlYuUEBpbnRlbC5jb20+OyBQaW9ya293c2tp
LCBQaW90cg0KPiA8UGlvdHIuUGlvcmtvd3NraUBpbnRlbC5jb20+OyBOYXJ2YWV6LCBKZXN1cyA8
amVzdXMubmFydmFlekBpbnRlbC5jb20+Ow0KPiBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSA8ZGFu
aWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IFN1bW1lcnMsIFN0dWFydA0KPiA8c3R1YXJ0
LnN1bW1lcnNAaW50ZWwuY29tPjsgJ2ludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZycgPGlu
dGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBSb3BlciwgTWF0dGhldyBEIDxtYXR0
aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDIvNF0gZHJtL3hl
OiBBZGQgTUlfU0VNQVBIT1JFX1dBSVRfNjQgaW5zdHJ1Y3Rpb24NCj4gZGVmaW5pdGlvbg0KPiAN
Cj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBUYW5ndWR1LCBU
aWxhayBUaXJ1bWFsZXNoDQo+ID4gU2VudDogMjAgTm92ZW1iZXIgMjAyNiAxODowNg0KPiA+IFRv
OiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8U2F0eWFuYXJheWFuYS5LLlYuUEBpbnRlbC5jb20+OyBQ
aW9ya293c2tpLA0KPiA+IFBpb3RyIDxQaW90ci5QaW9ya293c2tpQGludGVsLmNvbT47IE5hcnZh
ZXosIEplc3VzDQo+ID4gPGplc3VzLm5hcnZhZXpAaW50ZWwuY29tPjsgQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUNCj4gPiA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IFN1bW1lcnMs
IFN0dWFydA0KPiA+IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+OyBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIDIvNF0gZHJtL3hlOiBBZGQg
TUlfU0VNQVBIT1JFX1dBSVRfNjQgaW5zdHJ1Y3Rpb24NCj4gPiBkZWZpbml0aW9uDQo+ID4NCj4g
Pg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSyBW
IFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiA+ID4g
U2VudDogMjAgTm92ZW1iZXIgMjAyNiAxMzoxOA0KPiA+ID4gVG86IFRhbmd1ZHUsIFRpbGFrIFRp
cnVtYWxlc2ggPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+Ow0KPiA+ID4gUGlv
cmtvd3NraSwgUGlvdHIgPHBpb3RyLnBpb3Jrb3dza2lAaW50ZWwuY29tPjsgTmFydmFleiwgSmVz
dXMNCj4gPiA+IDxqZXN1cy5uYXJ2YWV6QGludGVsLmNvbT47IENlcmFvbG8gU3B1cmlvLCBEYW5p
ZWxlDQo+ID4gPiA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IFN1bW1lcnMsIFN0
dWFydA0KPiA+ID4gPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzRdIGRybS94ZTogQWRk
IE1JX1NFTUFQSE9SRV9XQUlUXzY0DQo+ID4gPiBpbnN0cnVjdGlvbiBkZWZpbml0aW9uDQo+ID4g
Pg0KPiA+ID4NCj4gPiA+IE9uIDEzLU5vdi0yNiA5OjI3IFBNLCB0aWxhay50aXJ1bWFsZXNoLnRh
bmd1ZHVAaW50ZWwuY29tIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBUYW5ndWR1IFRpbGFrIFRpcnVt
YWxlc2gNCj4gPiA+ID4gPHRpbGFrLnRpcnVtYWxlc2gudGFuZ3VkdUBpbnRlbC5jb20+DQo+ID4g
PiA+DQo+ID4gPiA+IFdhXzE2MDI5MjgxOTEzIHJlY29tbWVuZHMgdXNpbmcgdGhlIE1JX1NFTUFQ
SE9SRV9XQUlUXzY0DQo+ID4gPiBpbnN0cnVjdGlvbg0KPiA+ID4gPiBpbnN0ZWFkIG9mIHRoZSBs
ZWdhY3kgTUlfU0VNQVBIT1JFX1dBSVQsIGR1ZSB0byBhbiBpc3N1ZSB3aXRoIHRoZQ0KPiA+ID4g
PiBsZWdhY3kgc2VtYXBob3JlIG9uIHNvbWUgWGUzcCBwbGF0Zm9ybXMuDQo+ID4gPiA+DQo+ID4g
PiA+IEFzc2lzdGVkLWJ5OiBMTE0NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVGFuZ3VkdSBUaWxh
ayBUaXJ1bWFsZXNoDQo+ID4gPiA+IDx0aWxhay50aXJ1bWFsZXNoLnRhbmd1ZHVAaW50ZWwuY29t
Pg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25z
L3hlX21pX2NvbW1hbmRzLmggfCA2ICsrKysrKw0KPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiBpbmRleCA4
MzVlZjc1YmJlYjEuLjE4NmM5YWMzNWU1YiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL2luc3RydWN0aW9ucy94ZV9taV9jb21tYW5kcy5oDQo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiBA
QCAtMzQsNiArMzQsNyBAQA0KPiA+ID4gPiAgICNkZWZpbmUgTUlfRk9SQ0VfV0FLRVVQCQkJX19N
SV9JTlNUUigweDFEKQ0KPiA+ID4gPiAgICNkZWZpbmUgTUlfTUFUSChuKQkJCShfX01JX0lOU1RS
KDB4MUEpIHwNCj4gPiA+IFhFX0lOU1RSX05VTV9EVygobikgKyAxKSkNCj4gPiA+ID4NCj4gPiA+
ID4gKy8qIFdhXzE2MDI5MjgxOTEzOiBNSV9TRU1BUEhPUkVfV0FJVCBoYXMgYW4gaXNzdWUgb24g
c29tZQ0KPiBYZTNwLA0KPiA+ID4gdXNlDQo+ID4gPiA+ICtNSV9TRU1BUEhPUkVfV0FJVF82NCAq
Lw0KPiA+ID4gRG8gd2UgbmVlZCB0byBtZW50aW9uIHRoaXMgaW4gdGhlIHJlZ2lzdGVyIGRlZmlu
aXRpb24gZmlsZT8NCj4gPg0KPiA+IEkgbWlzc2VkIHRoaXMgY29tbWVudCwgYXBvbG9naWVzDQo+
ID4NCj4gPiBBZ3JlZWQgd2l0aCBTYXR5YSdzIGNvbW1lbnQuIEJ1dCB0aGVuIGhvdyBkbyB3ZSBw
cm9tcHQgZnV0dXJlIHVzZXJzDQo+ID4gbm90IHRvIHVzZSB0aGUgbGVnYWN5IHNlbWFwaG9yZSBv
biBwbGF0Zm9ybXMgdGhhdCBzdXBwb3J0IHNlbTY0Pw0KPiA+DQo+IEBSb3BlciwgTWF0dGhldyBE
DQo+IEFueSBjb21tZW50cyBvciBzdWdnZXN0aW9uIGhlcmU/DQo+ID4gU3R1YXJ0L0RhbmllbGUs
IGFueSBzdWdnZXN0aW9ucyBoZXJlPw0KQEhlbGxzdHJvbSwgVGhvbWFzDQpBbnkgc3VnZ2VzdGlv
bnMgb24gdGhpcz8NCg0KPiA+DQo+ID4gLVRpbGFrDQo+ID4NCj4gPiA+ID4gICAjZGVmaW5lIE1J
X1NFTUFQSE9SRV9XQUlUCQkoX19NSV9JTlNUUigweDFjKSB8DQo+ID4gPiBYRV9JTlNUUl9OVU1f
RFcoNSkpDQo+ID4gPiA+ICAgI2RlZmluZSAgIE1JX1NFTVdfR0dUVAkJCVJFR19CSVQoMjIpDQo+
ID4gPiA+ICAgI2RlZmluZSAgIE1JX1NFTVdfUkVHSVNURVJfUE9MTAkJUkVHX0JJVCgxNikNCj4g
PiA+ID4gQEAgLTQ4LDYgKzQ5LDExIEBADQo+ID4gPiA+ICAgI2RlZmluZSAgIE1JX1NFTVdfQ09N
UEFSRShPUCkNCj4gPiA+IAlSRUdfRklFTERfUFJFUChNSV9TRU1XX0NPTVBBUkVfT1BfTUFTSywN
Cj4gPiA+IENPTVBBUkVfT1BfIyNPUCkNCj4gPiA+ID4gICAjZGVmaW5lICAgTUlfU0VNV19UT0tF
Tih0b2tlbikNCj4gPiA+IAlSRUdfRklFTERfUFJFUChSRUdfR0VOTUFTSyg5LCAyKSwgKHRva2Vu
KSkNCj4gPiA+ID4NCj4gPiA+ID4gKyNkZWZpbmUgTUlfU0VNQVBIT1JFX1dBSVRfNjQJCShfX01J
X0lOU1RSKDB4M2IpIHwNCj4gPiA+IFhFX0lOU1RSX05VTV9EVyg3KSkNCj4gPiA+ID4gKyNkZWZp
bmUgICBNSV9TRU1XNjRfSU5URVJSVVBUCQlSRUdfQklUKDIwKSAvKiByYWlzZXMNCj4gdGhlDQo+
ID4gPiBzZW1hcGhvcmUtZmFpbCBpbnRlcnJ1cHQgKi8NCj4gPiA+ID4gKyNkZWZpbmUgICBNSV9T
RU1XNjRfMzJCX0NPTVBBUkUJCVJFR19CSVQoMTkpIC8qIDA6IDY0Yg0KPiA+ID4gY29tcGFyZSAo
ZGVmYXVsdCksIDE6IDMyYiBjb21wYXJlICovDQo+ID4gPg0KPiA+ID4gQ2hlY2sgYWxpZ25tZW50
IGhlcmUuDQo+ID4gPg0KPiA+ID4gLVNhdHlhLg0KPiA+IEFkZHJlc3NlZA0KPiA+ID4NCj4gPiA+
ID4gKyNkZWZpbmUgICBNSV9TRU1XNjRfSU5ISUJJVF9DVFhfU1dJVENICVJFR19CSVQoMTUpIC8q
IHBvbGwgaW4NCj4gPiA+IHBsYWNlLCBkb24ndCBzd2l0Y2ggb3V0IG9uIGZhaWwgKi8NCj4gPiA+
ID4gKw0KPiA+ID4gPiAgICNkZWZpbmUgTUlfU1RPUkVfREFUQV9JTU0JCV9fTUlfSU5TVFIoMHgy
MCkNCj4gPiA+ID4gICAjZGVmaW5lICAgTUlfU0RJX0dHVFQJCQlSRUdfQklUKDIyKQ0KPiA+ID4g
PiAgICNkZWZpbmUgICBNSV9TRElfTEVOX0RXCQkJR0VOTUFTSyg5LCAwKQ0K
