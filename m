Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80434C55190
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 11:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E710E355;
	Fri, 20 Feb 2026 11:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHwHnYc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65FC10E355
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771586616; x=1803122616;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=E6Sf+qi41pHE3hNTPASFYiKuNb5xiFq8t/aK4ZJXzKA=;
 b=dHwHnYc+YGg74DIPqJtXc5S8dQIT3ulomm3qQT/iQw+9P0ztj+/a95k9
 pBoTmjf86Il8UHQlvyByyLmA6nEgsPYF4989XpCtXnDM5aCFN12wN88V+
 80Goe8iqDA1Y+dMUGDP4dwNIlCr4CACy+v/xIVvWtQqZk4xFwBxcdTYi/
 EuA3EaNQdDPetdU29Z3aq+ezoSMhIUdal+DVG7hNR1qdqmMKXFIvnDVos
 yOleKcOjvf74vbbCMAIdVtZTnq8JrAowtUY8R3N5KELfVaDg44XMxe5Zi
 l0H0qKNrwDGoQNckkVL4L0cNyOble7nHWj6iF9SPGWqyFdRz/NAGeNy8/ g==;
X-CSE-ConnectionGUID: gzWdIsCBQSiX9RwbfE2mgg==
X-CSE-MsgGUID: EEugRGFjQeWi4/ZJ9TSKpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90089524"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="90089524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:23:28 -0800
X-CSE-ConnectionGUID: oVi6OsOeTu+alt4fByOuKQ==
X-CSE-MsgGUID: 7o/cigBnS5S2mraZaspGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="252510153"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:23:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:23:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 03:23:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:23:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk/OppwKFm9g//HqAZgdzZ8MiNilk2kyRxq4xz4xndE+GY6KWr6CYmtCpvMaCazgpZd+iO1qCgVvvu2W1gskW4IZyTCz1MWxodGgLlXXVkA5IYbBMmI+V+VxIGsx+8uQN3CPWKnaDnY3TvwIDogYy0Fane6teBvwGnavj/1LYa1piVKqQc2s774NBKlTY9Wx3zadgcGArKDcFmoEYHsvhdBKTomgUbBiUST1GUc1tz2E+HXVnzRcUH1nrBhSMlQTPSlw69Vs5JITND4PEspFUcFYOzoGCivROOZp4qrWQe1Uq/+mch6Whai7uTAxVjqQiP3sOLDB6bqMZCuDglrpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COMNKufFe8CB5IvfJWjLfzqKEDAXocxWEAcM21XlM8c=;
 b=c7rXSlI2/XZ+rIMiCaBNcPmeQV0KsLRCNJYQDtr+Gj6lRaGzhJyez19qIYwjcTBVWrkIJCjbl0Z7YEXRHGN48OCM79UAiwt8UilCCLifvUEu9sOU/GgYR0YCA8sjWcfSrWWaT7jJvDNnSFvo/wyzwaEu8ByEBCsbvtFJL8HzolQ5AJM+Ms+QhapMyHPofM4MGvtpi5ySlVe2/PoC0mMXbUPZTEOJjrAosXLREXV5VwoHHzkW4lVipe2t+1GGiLn0L0HP34VOPHM3VYcPTZLoRngel7n6TMm633j0HifBZzKC+SfViPmSXeTZBv+81e4opz7sA+ep17QKaXecBVHj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:23:25 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 11:23:25 +0000
Date: Fri, 20 Feb 2026 16:53:19 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/22] drm/xe/pvc: Drop pre-prod workarounds
Message-ID: <aZhEJ21xgL5Tssa0@bvivekan-mob1>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
 <20260213-forupstream-wa_cleanup-v1-2-961f2dd3a8e9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-2-961f2dd3a8e9@intel.com>
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: f160a606-fadb-4058-5de6-08de7072766a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N21jVVd5Rnd5clVyb2RrWXZyR2tMTDRiUEJJWU1DbXJFNU5WZUk1VzRsajhP?=
 =?utf-8?B?QkcvL1Uyd0paUDZKY1VzM0diYVVJeHpTZUdJcS84QmlZaGNRZ3AySHp4ekpY?=
 =?utf-8?B?S3lYWVpzK3NmRFRJUXk3QVhJTzdkWTZlWWFBVDZvdi8wMk1QWkNMejcwMGY3?=
 =?utf-8?B?RlJ3cVNsbGtJcHdZMmlxd25GcVp6cGRqL0FWRXZrN0k5REhUNnUvUmNuZWlm?=
 =?utf-8?B?KzRvMk8vSGJBQ0JWUHk5Z1FNbDJLeHVUNElDeHlXRGJ1WCtRalFpemxmbGF2?=
 =?utf-8?B?S3dqYmp1Rzhud2VFaTR1V3k5NlcrSDdGOVIwRGhzNlo2L2hEZ21uRFhSbFVN?=
 =?utf-8?B?UngrUk45dEwvK2RFSGNIaGxGcEltVzh6d2FNeHRsSWZxMUY2TElESWtFdGVi?=
 =?utf-8?B?cDZMTG5TL0pJa0IycHJrODdxSWJ3TVl0SmhXYzc0WjFDT0w0Wk5oN1VXaUt1?=
 =?utf-8?B?Qm5XWTU2T2xIN0xVczFsWTAxRFBzVzFyeEM1M01BeWRiTk1qR3NKeW1pZ3Ns?=
 =?utf-8?B?bkhGaUZneVpqdkF3K21PWCtvZUlaTHlPYXg0M0hLUHJ5NlQzbHROOEZtam9N?=
 =?utf-8?B?WXpkM0hBWE0rdmRuTVQrZDFaSlUyT2s0NGNzaEc2OWJ4eU9lQjFrLzlTRU9o?=
 =?utf-8?B?ZUNhalpFWUFTS29DT0RGR2lPR3FDOHhqYjlmbDdTbE8yM09GUjRJTFZnYm1y?=
 =?utf-8?B?VGh6azRyeVJkZ2ZjWGhuMG16V0xMc3NsVUg1blBCOE9rdFV4d3VIaFVkZTRI?=
 =?utf-8?B?S21BZUhBc2s2SlFpcnJMWGJVWWUzWGZMMWlKRE9RUVdFUUFTQURRTmtCL25P?=
 =?utf-8?B?UENNaythaWRDL2NNSUE5SjhyZm9XTTNOcGpacG5GeEl6c1pRNXhpbUVrRWtZ?=
 =?utf-8?B?SzBTQmFUTXBTbzhYdG81eHdDamJ0aFIyaE1oSUpWTzBDTkVjdCtGeDVtMlBM?=
 =?utf-8?B?WjFZMDRCcWJyTEpzcXBSaHo2K0lJQ3JvRXpZZnllNFpNSm5mMk0xUC9hN0lH?=
 =?utf-8?B?aUUyejRSS3g3OUZFOTB3N2o2dUcwRHdqb2p0ZmhuYmhqak10MXlWQTlMeHdL?=
 =?utf-8?B?LzVuamZKTW15aEJhNm9uTStoTlhwU3F2eXZ2Tm9jZU9jN3lIajRRUUtDbElQ?=
 =?utf-8?B?ZDMwVzN3OHVpMWVoZU1HZFoyNXM4SWhDNFVqdGZ6WUU5Rm5oY0o0RTd5R2U3?=
 =?utf-8?B?SFB5bU1mQURGQ3FFME5YNjV6K1VzRUpUUmpxTW5UbkVjWlJKR2dmalk3YlpN?=
 =?utf-8?B?VjhBMW9EVlJIYko2WXk5NC9XanhDT0F1YTMrSGNlSTBrKzcwUDBNUm1xVUVH?=
 =?utf-8?B?eEhMaEhpejY3UHN4bTNqcmo5bThYVTdock9XRm85YlZFS1E5b2Q2cGpMQ2ZO?=
 =?utf-8?B?b2FUM1d5akZRN211L1FZVG9zc0E5Qlp4a3BUNnVuSWZMWW42dUMwVVBrZDNK?=
 =?utf-8?B?eldTZERQdnlUZ0FGUmlDQ3RBOGhoR3liNG0waDdhRkFjY2RmazFtZjVmOWhY?=
 =?utf-8?B?MlFOUnRreE91eEk3L0JLbVNIQmZLcVVsWjhRSEtlcnFTTndMUnRpMmllaWhy?=
 =?utf-8?B?TVk1dnQxa0VvRitCcmRlZ2pvb1JqVzlCejVLS1hkMDBUdUVlNE1aV3RyaXBG?=
 =?utf-8?B?RG1ZUEdXVG9ZdW4vaWpkNmxtZXZ4U2ZtZytpZk90UVpVMWcvQktUWDJoeVZa?=
 =?utf-8?B?Y2t2L0VucWdOOUxvMHZEcnBoOEJNK0R1VkcxWk5oamNHL0VHWU9jajY1ekt5?=
 =?utf-8?B?SlhqT0pZZUp3SVVPNU9ubWRpTldJaGVBK2l3eFV6cm5XQkU5aTdEdGIzeEpi?=
 =?utf-8?B?aW5odytLS0pNSnp2alpEQS81UVhqU0hVVjNuVjArV21ac1VrL01UNmo0eTVF?=
 =?utf-8?B?NTN4Y1RHR3hJSXYxdi8yWjhNRDhXQkZSUGZ0TTFMNjJqYndqUWtmRFdUc0hP?=
 =?utf-8?B?T3RjZHJPbDR0WHV4L3dtTlp6SW9zWkExTnU3d3N5bVJEWGhLNHdrK0tiUDdT?=
 =?utf-8?B?eVRBaVE4cjl3WUlIRnlBNGFFNGszdFlXUFU0cmRkTGhBazNmeEpNN1JsOGFB?=
 =?utf-8?B?YjBDbDY3L0UyR3VFbExZSS9raHZ5RFBvQVJQRTFGZC9TM2tIZHc5V2FyMURR?=
 =?utf-8?Q?s95c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1N5d0E4UnpSbUZHaHE0MlZBV1I4Tm9QMVhXL1d6SnBMSXdUZklaa2JvOTAv?=
 =?utf-8?B?dDFyQlJ1M3lHTVExMGhFeThPTVNQZWNwNnlRdmdpZXBkSVpiNk5kYTA5ZWto?=
 =?utf-8?B?a09tY0VBdmhpQmtKUE9aSnNnNVhacmNUM0RVWEVXaTFQOEhlMG1lVEp1Nm1N?=
 =?utf-8?B?d1BIbUVSOVZJbGJxUW5pTHB3SHpNd0FVR2M1SHc3L3pPYmE3S1dJSHVUZVZi?=
 =?utf-8?B?M2tReXJvOU1VUGVlZmVXUTFOZlVWbm1rWkhHdUFYZldpb3d4bnhhUURIS0F2?=
 =?utf-8?B?NmEzeHNjSG4vZkdJTHVHbVdVOFZUdGdCQm5wWTE4UytxSDVRc0FYS1NXYWxx?=
 =?utf-8?B?dEdTRlFLQ3hKNk0rVFR2aFpYQUdrS2VUVGJNaFNPVjg2Vk92RWN3MGF1TDdC?=
 =?utf-8?B?bjBSeVY1SzZIeUwyR0tBK2M2Q3NjWGM5bkM1aXpBMDVEZ0txQUZjUW0rRDFj?=
 =?utf-8?B?YlB4TE11TFh3bWt4bGo4TjZDcFl1dk1BeDZDVytzM1JPcmFCOFZ4M3MxK2Iw?=
 =?utf-8?B?aHFFanJIMHFranF5TVRpZm1hRlBMVUJJY3p5OUNCbkNBWUkydUNmZTNSYW1x?=
 =?utf-8?B?SjNTYjByNjU2aHd5N2czL3NTaGdYck5uejBoZlRyNnI3OUgxdjRJNmxLR2pB?=
 =?utf-8?B?eXJsRXNBVzMyWTZqQndIdnEzV1J2cTQ5Ly9CQkVxWk00MEpLQzNuSnBrb1hH?=
 =?utf-8?B?OUpXa2MzcFVUV0NLRDFZWnFFckRnakI4ZnE3dHlRNGNtVjl0MGcybGlZMmMy?=
 =?utf-8?B?R1ZFazlBaXZWbE9laGNGZkZjdi91aEtJRlVRRzhBN2FNejFrUy9sTDVtSVJl?=
 =?utf-8?B?VlpRMDBJTlRKZEJWSTFNWk03VFp4T0pmMTRhWnJ2RHlNNXFJcjVPOGplbkEy?=
 =?utf-8?B?bHc0and1ZnYvQnVJZGZmUUpXemhadVQvUy9KbEZmWGxzZ2dOMVZDWE1COEd3?=
 =?utf-8?B?cGRJK1hnRlBxOWtIUWdiU1J2VnlXRENKRFdTd0dKbCtydkdhQ2UzQU9JejND?=
 =?utf-8?B?WGlEWWEvVUNlcnZ1MVZxeUJaV25UcUVhZ0VubkxGajd5c1lrSHlFLyt1SW10?=
 =?utf-8?B?N1hBdWp2SE5hYWluWlZ3cTFvOTEvcDZlcmNGR3R4L3Nzem1GcXh4K2JQeTZL?=
 =?utf-8?B?WWtVT0MwRVNZNFUwYzBCb3pGZVFtUDcwUlJIVU9USGRtS2Yzc2tuUWpld2xM?=
 =?utf-8?B?bVBza3hzY2ZDN0JiR09ZL01hSHk5OTNJN2RYNUdQVERDcmNXaExjNzB6NnNY?=
 =?utf-8?B?NFhXMjBoR3dVOE5yZ3pxZ1RCamMxOVlBaE5IYUFGekdZaVd4YklNdWdKTm5q?=
 =?utf-8?B?dlp6QWkwOU9ERnprNk9mOEtvcGtqUm5pZ2dkVjBsRmh5Tm1ZOHN2dW1kVFpG?=
 =?utf-8?B?Q2lPbWtVMGVYV2NaQXh2eGNoUzJQZi9GL0s5N0Q4WkNkekZkdmErd3JtY2NI?=
 =?utf-8?B?eUFMbE9UUVhoYURmdE5iS0ovT3I0VGRQVDUvY0VaTGYwZ21Zb2sxbCtXNS80?=
 =?utf-8?B?bEtVYUpVdjB6MWYxNE5QZFZmY3VFZUxDdHVGVzltQU1SRzE0S0s4TXhUd2p6?=
 =?utf-8?B?Nm9xQmVZTEk3WlhQNTZBNlN5S0VpRjFJbEYyV1E2ZGgyWkN1SXcyMmJEK2hN?=
 =?utf-8?B?QUVleGMrTEQzMVhtdVAvSjRzdmRYQ0Zib0hDV3RRc1lTeFB6eDZDN1NLQ1NB?=
 =?utf-8?B?MEhQRU82YUNKQlltUFE0WWF2ekRZME9kR29zd3d5WWNWdkRNb21qR1BsL04r?=
 =?utf-8?B?RHBRQklNMEMyQ0dvZUpNUmFoZHpBY0ZSR3ZmMlMzQitHdmsyKy9tYVBoZzVp?=
 =?utf-8?B?amxGNzNCcUtQMVV2R0dUR1l2NndCd3Nodk81Ukt5MVgwNzFCWEVpdHZuU3VQ?=
 =?utf-8?B?S1gxSDNqV0dxdWM0MDdjWStKRmZ5SmtrVTc3RUR5NlNxRm9MQkZqeGo0ZGtF?=
 =?utf-8?B?TWE3dzdieUtYdXBTdzVnRGxIWUlicFVRdjBaK0U2UlVnZTdQeDRlRGRBYVJ0?=
 =?utf-8?B?Y0dLb01OblRzTUtwTHIzMG54dFg2WnhkblFEUmRJd29xZG9Ld2ZZdi9zWFZV?=
 =?utf-8?B?RW5TQVBKVXJLcm1tK1VBMXp1RW5tdXU3U21BZEJRZTgxREx0WXNMcTJsbzVx?=
 =?utf-8?B?NzlteC85VGk4ZFB6S2RoVEwxdGZ4a0xNcXNPeG1ab05PMGIzcmpPQlA3NVZ3?=
 =?utf-8?B?OVVCZVBsMGRzQnRLSy85MTFvNlFyT25XeVBHMG5yUkRPQXlXNENsMmtaS2J2?=
 =?utf-8?B?MldUY1BiT3F4VCs2VitoemJPckVSSE1CSUdPQSt1NzJuVWpxVVZiZnpad2dH?=
 =?utf-8?B?ZGZkd3I3R0JYanBKWmtkTmZ3UlJCT0s1UlhBZlRQV1dVd1gzazhoMkE0YzVY?=
 =?utf-8?Q?aZO0bfqzjwA6z1DHnC7dzI8JBXmj+e06UWr8Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f160a606-fadb-4058-5de6-08de7072766a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:23:25.0416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ5OjtoEYZNusY0DR3Vq8N+ft2aEiZSqyt/MgX68hbGqxPJvND+AoNCLm2ABM6Pi1lk2xs7BbtVkxYlvt2t2hLMi35HFJjKuoDjQsi22tQKFQ/OtOWe5hlRx8vNKzqE4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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

On 13.02.2026 14:31, Matt Roper wrote:
> Production PVC hardware had a graphics stepping of C0.  Xe1 platforms
> already aren't officially supported by the Xe driver, but pre-production
> steppings are especially out of scope (and 'has_pre_prod_wa' is not set
> in the device descriptor).  Drop the workarounds that aren't relevant to
> production hardware.
> 
> Bspec: 44484
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c        |  3 ---
>  drivers/gpu/drm/xe/xe_oa.c         | 13 -------------
>  drivers/gpu/drm/xe/xe_wa.c         |  5 -----
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 --
>  4 files changed, 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cbbb4d665b8fe66105727e83cfc59a13624d259e..54d2fc780127742e2e152da438c7d3e8332f3cbc 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -213,9 +213,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
> -	if (XE_GT_WA(gt, 1509372804))
> -		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
> -
>  	if (XE_GT_WA(gt, 14018913170))
>  		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>  
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a462d6983d8d6daf74beaf6fef5bfe2ab779179d..8683b56d4c80a4a514a85924fe3b6a61e7a9fd18 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1760,18 +1760,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  		goto exit;
>  	}
>  
> -	/*
> -	 * GuC reset of engines causes OA to lose configuration
> -	 * state. Prevent this by overriding GUCRC mode.
> -	 */
> -	if (XE_GT_WA(stream->gt, 1509372804)) {
> -		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> -		if (ret)
> -			goto err_free_configs;
> -
> -		stream->override_gucrc = true;

override_gucrc variable is made true only when WA:1509372804 is enabled.
So we can remove this variable from code.

Regards,
Bala

> -	}
> -
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(stream->oa->xe);
>  	stream->fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> @@ -1824,7 +1812,6 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	xe_pm_runtime_put(stream->oa->xe);
>  	if (stream->override_gucrc)
>  		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
> -err_free_configs:
>  	xe_oa_free_configs(stream);
>  exit:
>  	xe_file_put(stream->xef);
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 7f45d6eba44354a4dd047ac5800f18c6a9c90725..fb1ce4479dd81a5fe91906948cd37a7e654b655c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -499,11 +499,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       ENGINE_CLASS(COMPUTE)),
>  	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
>  	},
> -	{ XE_RTP_NAME("14014999345"),
> -	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
> -		       GRAPHICS_STEP(B0, C0)),
> -	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
> -	},
>  
>  	/* Xe_LPG */
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index cc988f2a18d33365dc09d32f4e85ced01b823877..c3222d9504889b5175fdfa73db0bf4e9910a277d 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -8,7 +8,6 @@
>  22012727685	SUBPLATFORM(DG2, G11)
>  22016596838	PLATFORM(PVC)
>  18020744125	PLATFORM(PVC)
> -1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
>  1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
>  22014953428	SUBPLATFORM(DG2, G10)
>  		SUBPLATFORM(DG2, G12)
> @@ -53,7 +52,6 @@
>  18013179988	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  1508761755	GRAPHICS_VERSION(1255)
> -		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>  		MEDIA_VERSION_RANGE(1301, 3000)
>  		MEDIA_VERSION(3002)
> 
> -- 
> 2.53.0
> 
