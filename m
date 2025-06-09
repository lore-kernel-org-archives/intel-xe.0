Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90729C61DB2
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 08:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2709C89261;
	Mon,  9 Jun 2025 08:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUYyj0uN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527A689261
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749457305; x=1780993305;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cpD2p4yWgt27Xh57K0fM/E0tOf8Udqct1n0WXsf9dcE=;
 b=ZUYyj0uNAHNHhVtvNtJT9QA+YTfCjwQm9NO+vNaZdBhPOFdRdbl6MG8p
 3UF8XULnSoZ6cgJ+Kt5fTRiQn85aTJ2xC5XW3gnWEE+TjS6gIjK5XhAPA
 OEfQKqOdGdugDb8+kEOoU/WMOc30v2PT1b/BcAKuL3tFGPoobL40Ic2aI
 JdveqkzOXAjzqzc7mJx369nFoyQDtVpoHdoCrv4snlMl7iD4WHVwwdZBD
 juSayglZJ2rnqU0hk4JfHEPCuFtsl1uB5YmPcs+xy4iYmaoCySMhLFwTw
 +cyec1cKic6KXlDPvw/Y1RhnGJ6lE5BHEcgQTORJuI+qiSEjs/0mfeWah Q==;
X-CSE-ConnectionGUID: /j4j0YYERVy3SxxB3DNy8w==
X-CSE-MsgGUID: DV6fmiKZQOOXrjL4c+cU1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62882712"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="62882712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 01:21:37 -0700
X-CSE-ConnectionGUID: 9NvkP98vQv+OwpYsmc/aJA==
X-CSE-MsgGUID: m2Qr1H7JRMWYZpgKGFMSYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151442929"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 01:21:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 01:21:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 01:21:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.83) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 01:21:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvL8SUiFRxZFuvLfk5BlR+sv00KKLaYgTIRqBaEvd9/7ykR49RjnU6ZJhUYLDAcpbGoP56HCPvZAWV4SbRt1RH9xrbFxaMQU9mb/BJSxgJ7KoBAShkIYJrQZ3VIcXs1hLUaliNRZ8DsFx/DzIeRrric23y3B7Mpx5DcWEVtd6XUOBm7EIJhlYp1qKq+acx0+l8CJ2Uol8mzeJZ/T2U+WgPl1u3jNh1S7Ue9z2UQ6o+6yWNAOTXxYG1fhuiRZLeqoAI4LdI1TU9qPY/gEK2zepFVanXfqIYmh4T5ztAE4pCyT1D0UjUJ5zSg7sVV2L1W2vcc4rdS7DuyRp6LiIbpREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpD2p4yWgt27Xh57K0fM/E0tOf8Udqct1n0WXsf9dcE=;
 b=wb2vew+zY5FC5hGJIy7Du+5RCXGnTTg9VeoVWgcW+NjAMAPwIiQRZXsC1KHNWhCmAA1g6gY7X3MoFfeFHDbRDqEpCzBPiRtkwQEG57NCwSErO48LxUJWYIwls/esen78wQfZ9DM9RYHpFA4KZCXe2vARc0FHraHbbSjzpSYtrpxUiyx+YrhBseego9L/bKznFpe1l2IHX9PYP1oitZyeTBY3fnejZX4zc/jcotDvla0QmpA7pGwD+/Fsws/z5J3bm+zIfYttufDI4/iQRAqzFja+KdeLdepCicVsBQOpkoUqYv4hD5tUtN6rBvPShATrwnvQ6A9QgmN6gfi77y5Odg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 9 Jun
 2025 08:21:20 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8813.021; Mon, 9 Jun 2025
 08:21:20 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
Thread-Topic: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
Thread-Index: AQHb1xxoiqYCa0aAGkSBVcHdt38GoLP6bx8AgAAKYKA=
Date: Mon, 9 Jun 2025 08:21:20 +0000
Message-ID: <IA1PR11MB6266508D28B63129F76D069DE26BA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
 <aEaKuotfceheCnFJ@bvivekan-mob1>
In-Reply-To: <aEaKuotfceheCnFJ@bvivekan-mob1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|MW3PR11MB4633:EE_
x-ms-office365-filtering-correlation-id: d90ae64a-ea8e-447a-634c-08dda72e9d59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SlVhZ2dBaE5ZUDh2NWtNMVlyYjRIS3hlOHVlSGJDZVRIVFFGNjljaGJkajhq?=
 =?utf-8?B?VUtaM29kTzNXN1lqSFNzR1duRTJ1ZmdwMC95ZDhtZURFMGltMDJ0bUlodnpO?=
 =?utf-8?B?dGUrL0pjZE85bXJKZnRtSXdxSitmU2wvakNWdlhGS2Q0d0pLcjVoWFNyNjdl?=
 =?utf-8?B?RGx1cVB5allJcjhJSXFNQ1BYaTNHSXZSTzl0TVpjKzdPTGRLOVRoc2Q5MVBs?=
 =?utf-8?B?eW9IdjNKM3Zzd3g1ajVwaWMwRE5qRnVvT2QzTkFDVUZsMWlGUGRYc0xLWEQ5?=
 =?utf-8?B?YXVYcS9POW9aQUNJbEt2MXVFN0RSOFZSNmRKZVpjdWdBWW1pS2txRkR2TjJ1?=
 =?utf-8?B?eUkzRWtsT2VLQjlLSGs2dHhwaHJZRU9ESzBZSkFCR3JiaGk3MHZGNnhhbU01?=
 =?utf-8?B?YnYxL2ZUdTBIL0ZHVDdTdWRsYm84UWlzbjl1WnQrUzhHT0pTdDVpY01EeGdp?=
 =?utf-8?B?T0ZYbFUvVTd6eCsvT2VKeUkxdVFpd0E0bmt3TFJrMzNqWnZCWUo1N2JWMjZJ?=
 =?utf-8?B?TVdpSFVpY0t2MUNLWExRejVZVGVxcGlaUjdzNHFrUEIxS2tjSzFmZlJTY0c5?=
 =?utf-8?B?ZGw4YVlzdlZXaFhzQjdNNWdCOUxBUHVpL1I3RkxUeTZKeFZVYXhJOG1mME5m?=
 =?utf-8?B?MEU0VzZUck1kaGptYTQ3ZW5RWGdIZ0tSMUpzdlRGOGF2dmhYOVp1U0dxcjdR?=
 =?utf-8?B?RndEbklBRTRVRVBmQjF1eEd2VWxpYklhbUtCNXhIckE3cE1wMXhSRWNlRU1n?=
 =?utf-8?B?eTdjYVMyVEkwL2NOU3NwSFF2eUtqcDA4S0dYalluQUluQ2J0VjdTcHpLN09M?=
 =?utf-8?B?ekVSbjNQSmZBZ1JBQ1MyRU4xKzRjYUtFODhSWU1MR0pHL2trM29tMjJOeUxE?=
 =?utf-8?B?N3N0akFNeDlyUUVPcWZmUjN4SnZ1Z2M1RlZVb2FKaXJwU2RCN2JCY3FjWWFH?=
 =?utf-8?B?OVNiaTZRTnkzUUVia0RpMEROaC9oUFFuTUM5TkJRdTRvNEdpVEdJQ1MwTENF?=
 =?utf-8?B?OTJrOGl3S0VjcmYwenNCeXYzbG9qNUhFMFFHWldzOVJzSUFYZnlTMXhOalc1?=
 =?utf-8?B?WWc1N3ZOd2JQM2d2VWcwaXMyQ0gyS2h1Y2Y0NXpMK0hIMkplemtTemRjak44?=
 =?utf-8?B?ZUZoMUtlVTJkSURpTTZqR0JOVXBUNmFlUDJBNHIvN25TUXB5dEYzZ01EejY1?=
 =?utf-8?B?NWFLeDFLM1c2ZXZ6UmN2VVIvazdHSmFWcTZFMERyQmRkRjBmQ0ROdDZuV3JC?=
 =?utf-8?B?T2Y1QVZ0Y1BZZWhmZjZuUmtGVXRNS1dFMlZDMnZzZkVPLzM0MUtoNVJFY2lr?=
 =?utf-8?B?V2pmNkc0Nit1aTdBL2pTakt4a3Z4amx4YlRvcllQeFY2YWFmeGJmMFpGcTEz?=
 =?utf-8?B?eE1vNEVCS3JqenVPRWdVb3FvZmN4dnpmcDFnNkgzMGJBRStWQUpqL2Ird0hu?=
 =?utf-8?B?WG9EclRYNW10Zlg1cnlYTUlydkFmL3h0WVVPTTBRaUdkelNnK090bENIZVdo?=
 =?utf-8?B?N2p2RURYN053QUtGOFkveFI4WjlONk42Q203V3BHN2dNcXZrWDNLNGkxbXVG?=
 =?utf-8?B?Q2RrdEM4KzVTNVFRcUFtamhRbFVFR0g0NmpvVnN2RUovVGM2akQ3QU05bktt?=
 =?utf-8?B?SE13cjRra0srazlESmthRkwrUGYvakpTR1gydS9tdy9tTjNmVldwMjhYS3Fm?=
 =?utf-8?B?NDZrbjhSWHhoZ1FSeGJIK3Q3WUZEYVF4V21MZGgvdE9ZK29XUTFQNk9heTdn?=
 =?utf-8?B?Q0hGZVRUZjRQSHpmUm0yR0hXQmtteVdSdkd1Q2w4cjlMc3lpWFZsUXpEai9O?=
 =?utf-8?B?VENxWDNDb25aSEZzYWlkZFJNT25Cb1BYTGFNTE1wbmRqVER2VUhESmZSckpw?=
 =?utf-8?B?YUJQa2FUN1NTL2hvdXlPRG1BNnUwN1dUUDAyWGl6MHpSWW4zRHB3aFVvYi91?=
 =?utf-8?B?M2NKRkFMYzJwNzNIeWRzZUcxcXE0T0dzL2FFRWc4ZkxJM3Z0Y3NQMGEzdmtO?=
 =?utf-8?Q?w4RtykWkdIrZjbb4zYzE5AVYoR09rc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG9xQ1BERXg3RlR1RlNUU2lnRHlEZTJVbzI2aEZLVEcvL3BVNStzOHRhSUJq?=
 =?utf-8?B?K2l5RG9yTUtYSytUbG5IR0RvOGdlUC9kTU5CenRBMG5TSVRTdmlBUGtZVmZS?=
 =?utf-8?B?b0k4SktIQkp5VUZEVi9RQUEvcVFuSGo5KzVhd2tGTDAxRHkyMHE5azZRVDJL?=
 =?utf-8?B?dHFLT0oyTUJJdnVQWnlrTFdJdU0raW1rQUlnbElXZVBMc255Zk0vbWdCZmNT?=
 =?utf-8?B?NWpHM0ZpaFdlOUFWaWZyU2lsRHZwLy82WnVEWVF2YzMyQkdPMyt1SVkydkdo?=
 =?utf-8?B?YzBiM1EydStJdkYxQ3JQb0NHVUZoVEROSXM2S3JSckJVRUhHRUszN3IvMU1w?=
 =?utf-8?B?MlZDRFc3WjZWVDlFRVl5YXpjdERQQWF3cEJFRFI3MmsyRUtScFZ4SE5LNWV4?=
 =?utf-8?B?Q0FUdDhQTEpGZ0JkazhqUDU0dERaQlpSK2FpTVZld1grVjBzdlUvcTVBci8v?=
 =?utf-8?B?U1dWMFVzakE3dm9yZUliT0gyM3EvSFJmUjBsWFpicXl6VGVLMGhZblpQVEIy?=
 =?utf-8?B?WUpuZlpUS1FBOEdWZ0Nib2s4NjNaMmFwYTNlOVB1S3c0SVVZN1VPOU5kUnVH?=
 =?utf-8?B?aUJ3REkxWmFpOVhieGUreXlpbjlQWDJtQmVwa1lvUVh5WnhaUXdkRDJtYUl3?=
 =?utf-8?B?K2tYQ1pibEI1NWdIUHRVTWpZV0hCdVdLOGt2M1dDSU41R1g0czl6a0kxSkN3?=
 =?utf-8?B?Zk5wSy9xZzU4WHlCN21kOW1JeTVVR0NabDVocFJYYmdhTGIwZE9OUGZ5Y1Ay?=
 =?utf-8?B?TVczSzI0Y1FzZVVKMDNGZFpxNEF0U2xQN1J5MS9mSktKL3gzeTNscGY0OXRB?=
 =?utf-8?B?SnFvUGtlSVExek9RMGFGeS8wOFRmRUQyUFZxYlNIMDdHbnQ0ZEtPaCtFUkhS?=
 =?utf-8?B?clUwdmNRQ3AyY3ZNM0tyWnRIK25zZUlMYkw0MkRNQTMrQVk0UUdVeDNkc041?=
 =?utf-8?B?V0hKa0wzd1F2Z25XSTR4aTZrbDJsbktUMHpURGxhOFk5c0hjMzRqUmtvR3RM?=
 =?utf-8?B?NGdUWVdKeWZnU0dwM2lWU01waEtXcDV6S29iSytRRm0vUGpVemJta1Rqdzdt?=
 =?utf-8?B?blFucHk1dFFRVzBCSXdFcnVzVU1Eck00SGJjdFdvSTFaUW4ra1JOcEVNMFgy?=
 =?utf-8?B?MmtQd1dUNXk1a0VWdEREYWd3TkR2V2dnMUdBSE83NENZb2ZBY01QNVFOUG0w?=
 =?utf-8?B?b05LQzI2NU1zazk0c1IxUUhoaDFHNjdBSXhLMFNiWEpHQzhyOWYxOGsxK2l0?=
 =?utf-8?B?NVNMQ0xaNTNobFowRFZhSWdkZ0YzZFBqUHVNY08zaERlNm9FTGtKT0RlTG9V?=
 =?utf-8?B?YzlmNzNNT1AraVdFS1NxUXYxYzlOc1J3dERoVDhidEJRYjNpcmlDZGZPbmNT?=
 =?utf-8?B?di9oU0taVXBzakZBdENLb0VydXYyTGZYZWN0TnA5RjZreUVBY28vaytZamdF?=
 =?utf-8?B?SFpsKy8ybWVCY1piWjJxSER4cXF6dml1cFVVQkRneFRsakNPb3ptMUh3eWVG?=
 =?utf-8?B?ZXJmMzFTUUxHN2ZIcm5RWVQyMWV4YS91ajR2Ukc4N0Y4bk1JV3VHVlQvTll6?=
 =?utf-8?B?QWxUTTJqeGp5MEdjd2JSckVITWxDZW02WnYvNzZST0NJc2tNS2lCTnV1ay9V?=
 =?utf-8?B?UERTcU9QblJFV1hKZjliaWI2bDlnOGdQWjJWYmhTOGNtY0swYS9ycWZxNTI3?=
 =?utf-8?B?eXZLQ0V2L2syZmx4Z25vdVhKZXBlUTQyL04xMGFTWjcvZ0JHc2JKamZweTBY?=
 =?utf-8?B?b2VSZUZlb21iZExWTjBQZ2Rad2xhdHBoMU5uOHpweFBWK09tSDJ0eTBvenZP?=
 =?utf-8?B?MU84MVg1QXk3TUUxMHp0azV0MU95VlAvVlhsSmY5Ti92UVg4THB2bHBnS3hO?=
 =?utf-8?B?aWs1WVFuUFQrY2xFNmpyMlI3eG5nWnhkV01MMlpyT2VZYTZINXBRWnJONm5F?=
 =?utf-8?B?ZDFyL01DVThIR3ROOW1BblptSWw2VGFxVEJnQjRWZlZuTjB6NHFmTVovcmJw?=
 =?utf-8?B?UWo5dXJoZExMbTBxQnA5T1pOSi81RlVzSE9uWE8wMFBYQ0E4R0xId3dNVnI3?=
 =?utf-8?B?NmVXeHlHSkgrY1BrMk1XdmlEZmZneWNuU2toV3libGt4ZWc0aWpqWWtONHBX?=
 =?utf-8?B?MlI2aGxCVzIzYVRnbWc5VFEweU9wNmVWNURRNndOVmdtMis4WWxJV3pFa0tY?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90ae64a-ea8e-447a-634c-08dda72e9d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 08:21:20.6416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AHyj82OqNK9fmkPH2tw9A1XAwfqggpwrfb4RQlBAShU/NwAbT08qGa4WLDfvGtKJJNcWr7YgjcfUb/FN2wCBiof7D0F2QNCUEM+NO3WGiTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4633
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2ZWthbmFuZGFuLCBC
YWxhc3VicmFtYW5pDQo+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20+DQo+
IFNlbnQ6IE1vbmRheSwgSnVuZSA5LCAyMDI1IDEyOjQ4IFBNDQo+IFRvOiBCaGFkYW5lLCBEbnlh
bmVzaHdhciA8ZG55YW5lc2h3YXIuYmhhZGFuZUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggOS85XSBkcm0vaTkxNS94
ZTNscGQ6IEV4dGVuZCBXQSAxNjAyMzk4MTI0NSBmb3IgZGlzcGxheQ0KPiAzMC4wMg0KPiANCj4g
T24gMDcuMDYuMjAyNSAwMToyMSwgRG55YW5lc2h3YXIgQmhhZGFuZSB3cm90ZToNCj4gPiB3YV8x
NjAyMzk4MTI0NSBuZWVkIHRvIGJlIGV4dGVkZWQgZm9yIGRpc3BsYXkgdmVyc2lvbiAzMC4wMg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRG55YW5lc2h3YXIgQmhhZGFuZSA8ZG55YW5lc2h3YXIu
YmhhZGFuZUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfCAzICsrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMNCj4gPiBpbmRleCAx
NWVkZTc2Nzg2MzYuLmUwMzM2Yzc5YzI5NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hdG9taWNfcGxhbmUuYw0KPiA+IEBAIC0xMDg1LDcg
KzEwODUsOCBAQCBpbnQgaW50ZWxfcGxhbmVfY2hlY2tfc3JjX2Nvb3JkaW5hdGVzKHN0cnVjdA0K
PiBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpDQo+ID4NCj4gPiAgCQkvKiBXYV8xNjAy
Mzk4MTI0NSAqLw0KPiA+ICAJCWlmICgoRElTUExBWV9WRVJ4MTAwKGRpc3BsYXkpID09IDIwMDAg
fHwNCj4gPiAtCQkgICAgIERJU1BMQVlfVkVSeDEwMChkaXNwbGF5KSA9PSAzMDAwKSAmJg0KPiA+
ICsJCSAgICAgRElTUExBWV9WRVJ4MTAwKGRpc3BsYXkpID09IDMwMDAgfHwNCj4gPiArCQkgICAg
IERJU1BMQVlfVkVSeDEwMChkaXNwbGF5KSA9PSAzMDAyKSAmJg0KPiBZb3UgY2FuIHNpbXBseSB0
aGUgY2hlY2sgdG8gYERJU1BMQVlfVkVSKGRpc3BsYXkpID09IDMwYA0KSGksIA0KVGhhbmtzLA0K
VGhpcyBpcyBnb29kIGlkZWEgdG8gbWVyZ2UgaXQgYXMgYERJU1BMQVlfVkVSKGRpc3BsYXkpID09
IDMwYC4gSSB3aWxsIGRvIGluIG5leHQgcmV2aXNpb24uDQoNCkRueWFuZXNod2FyDQoNCj4gDQo+
IFJlZ2FyZHMsDQo+IEJhbGENCj4gPiAgCQkgICAgIHNyY194ICUgMiAhPSAwKQ0KPiA+ICAJCQlo
c3ViID0gMjsNCj4gPiAgCX0gZWxzZSB7DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K
