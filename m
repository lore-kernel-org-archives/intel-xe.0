Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B3606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n9V6EehZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3410F3B2;
	Tue, 20 Oct 2026 08:43:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AE410F3E0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792485806; x=1824021806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0I2VwW4Q9Vumhn10msYy3TlQRxmkkfzv8sm3PtXne+E=;
 b=n9V6EehZ2/JMpAMVCozcsDdQYvaA9umdl5WrEKb4K/JllaYiTbsE2uDP
 j+YQrJrRpi/js+zTMRc6fH5v0QdiWpTx5EiG/TkkrcSJiFM3PWvfqlZl8
 MiAdeDnZnM2kzx1yTZNyGiXivWZcs/0bfAB0rjlB5bk7V6+QbgcudPABF
 2/1T1K4tcjPgAPvWKM8JVyUWIYCfuG8iHnFQjfoOBnmbNAuhJrNTPOIsk
 AJjch8BG0W7YN10HIzBB2aQrNSy6rcHckxsbFlxy7l+I5AVfekywuXdQQ
 txk+TxKxPS8ah48MipbvCzFTjVgPJix7CsqNaPvB5oVuUv99ZgQhBMCtd A==;
X-CSE-ConnectionGUID: VEn7U+ZKS9+JcnrOjlZ9zw==
X-CSE-MsgGUID: 0fDwQvMoRYyqfFrRFXbxIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1072110"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1072110"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:26 -0700
X-CSE-ConnectionGUID: TqEGS8rgSZ+OAPen2y2B1w==
X-CSE-MsgGUID: l7ApmJ1xTVWtQg4wKBPQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3221574"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 01:43:25 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfdjvV8oDRZKRNyrRcv2WYbFwRVSpGGWQsJiuQwMb7EUpLakQhbGp38QUGFsVHbqC7K49wvVybBWJ2RTSYPYiTvoMeA4WrDMySfsTg6kyUrWwXLsj1ImFYXnmzyhz91Tlvk6KPiAuiEUFTPMxWZaw5jjFb22bfq+B/0YZIs6iclgjsi+cNgziDr0Zl9lMNaZXKwaUIVf9M1UN3VM3IBshTPULuyr2SkWwZ5webUKARxvMtTRjyuCYCLdZM95YD4kGlRgU6A35MevXD8Rfr/Y87bsEKPLB07z3Fzf9Hxcb+9gkdsT4I0/8yQs+OQJ/z7uaOu0+SznAwhId7WkeZYvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhyWu1RsalaAAxzJYDpMNk94trBsuH7JcQJrgCPkOf8=;
 b=cbOws3qIbwHKqycHoMMZrJhRBwDQcykrHjMODqqVwUTIbXMLenpf9x1HoE19+LL19eFH4k+QHnu9woYfpAAIgvTL4uwmHgM9zp8cNHaNj/2gRJ6VpUnM3PGYzLhxbw17BBh0/CZ1okJCFgb0xfUyQ89BdFhT8rLNEA9RSx6In2VFEed/yQEMRJEqP9XMUC5ml4k3ol0CevdTzqSiHTinXQjHKlxCLHZvjvD6YuYQTxP37ybzB6Ok7JigmGqWE08L7FKqGOcjNBX2VFVYBNEt2G5MVP8VWeVEfdf5gLbTHL88Bb/uPg79Q0291BUp6j03ZXL+AUjulxlMXUMnSmAsEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:43:22 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:43:21 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v3 4/7] drm/xe/ttm: Back each VRAM pool with its own buddy
 allocator
Date: Tue, 20 Oct 2026 10:42:55 +0200
Message-ID: <20261020084258.443645-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020084258.443645-1-piotr.piorkowski@intel.com>
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 55448ccc-5189-4139-e3ab-08df2e863266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|261009221727099003|261009220027099003|261009221227099003|261009223327099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: u5gaZb8zr3eQ7fUWHkqO+11sYHkFTU6d8l3n24Zrm/Gr+ZZ4T8Q5CxnA/SpD5E7l0TYazOuOGorHwxADPvVdkExspVtpiuPjBdGVdw8tIOjjKwPSIGYUzXRJ+aBvoXWRCReo7EeumlAaDRmGng0UWIfAdOTrmEe3UbwdQ5dvn0VzDtZa4wGlFYIreE2qSC6A6QujHBumXJL5O7c36bfESFdrMS32C/J+KG1w+aH9q7QmZBPUpIFTByUzqPJ8wlIzTptxlCuawPY3HqQY+OKpFmz0fbOZVI24+mB20FLRGclwmcwIeKK0bf6iYnDwGbBAoHK6AIbjBVrfdKETb+cdVl6aNq+bf3pjBC7JZJ8z/P4iu/DWj4VeExO4idcV6EiS8RwfMws6/u/o7B0wQyOqQWWxMzjsSLfiYxYYUXjzub7y1GcwnxslThAzkN+HMzHqGiJI/5Z6nleNAOHj6LAU4137xL6FGzgBubyhwLJoUx8HtX/b76ClR82S1Qer9WXEXp8irQH8Y2TyZbOVsf+KsLBScArv+WpGDr1F/JmR2mt2C+72hIcJtcAaHaAHtFf90RzkHXWUKzKqI09enKmZSQxWISFOISm0F19wMxJEbrclrov71ZpatxTTNWEj7HHkjSVr9L677jlwAwTbI8hE59Pi4K2Zd6WZG5NQtqYb6Uo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(261009221727099003)(261009220027099003)(261009221227099003)(261009223327099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEhJZ1FuRHFRMlZaa2J6eCtOQTdXVXpLUE1BYktQVHFXa2VucmJ3Ny9DV01J?=
 =?utf-8?B?N0VtQjRjSllhMW11WlFQTm9sajlCR0N1SjlwMy9wTTdMS0dyMnFNd3BERi9j?=
 =?utf-8?B?SUE0SXRzSWh5UzBhSVJrQ2FxWDZhNnhLMXdZSmxGaDAxSTRrVDBSK3ZBU1F1?=
 =?utf-8?B?Tk9UbjBmQkh3T0tFN3BoUEcvazJZWVYveW1KdGlXOXJwVTZDZEZPNU1oZUp1?=
 =?utf-8?B?S3RPRXFjS0MrbFJ5eUp3UDRPQ0RJSi9VcENlZGlCcnBRMGVqV21xUVRnS3JY?=
 =?utf-8?B?cEVYMkM3bHYyVXZyUUhTSUgydWRXalk4OTE4K0s5UWc5NEt5QkJQK0huZ3V2?=
 =?utf-8?B?Mk5TTCs5M2poZlBaS054bzMzVGc5eHdkaXo0dGx1ZjdFeGM3OWN6aDhnKy9D?=
 =?utf-8?B?WVNhQmx4WGJnbG1KdElTSXRYTzU5UWM1RkM2UjlQM1NTOERGZ0M4OWdjaXJp?=
 =?utf-8?B?R1ZRY09qdjdxNStTdWhWWkZvcnJwOFZ2cm9oaXNGYjJNSGNHMS9PdjZjTFp3?=
 =?utf-8?B?WGdxTjV0Mk9QVlhwdjJIUmtSd0tBd0JOWG0vLzAwL0lxN2E5VkNTb2J4VFUw?=
 =?utf-8?B?UFVtQkZjN0pGeHNzcUZFNWhKaHIrQ2prL3Y2OHFla3pGZml5clRCNzV2MkV1?=
 =?utf-8?B?cXdWaFFqdTFpOTdwQUNNYTIrZkZ0MXZDZWs5MzM2dDNsSi8raDU3V3BBczZo?=
 =?utf-8?B?UXd3MnFsRlcwWW5HTWFQVDh5MENmVEtoL1NJL1h4bUZ0SEw5dFRiZmFtbytS?=
 =?utf-8?B?UG5DdGxyMURpOUczOWZjMTRWRFJUY1FCWW5iMk9KZkRBUjhod1Jsc2FjN1hI?=
 =?utf-8?B?cDNxYUxXVmZoV3V6YzBHWitsVFBscnNGOEZmVDU2NVUyU0dvbUc5U1hXVm4r?=
 =?utf-8?B?VVlxbGU1bHhqTjlGSm9lWEtybHdoUGt5ZVFlWnZucFdad1M1M2hIM1owWVFG?=
 =?utf-8?B?cmpDbUR1dTJLTWV3Z3c0NG5PNTlxMVdDSlJ4U1RRN1NXNGp2c2IreUxXUkVj?=
 =?utf-8?B?cDJZYi95SU5zamVrTExJeEdrNU5sU01EbXgxbGZhZG1RMlM2TGd5bTkwWCtT?=
 =?utf-8?B?MnJFZG45TC81b3NwdG1MTnFPdS9hTXV4T2dXY0F3cUc4VTNHcCtISXRTeHF6?=
 =?utf-8?B?bU1CYzJ6ZE9qbXNmMEJaWktXb0E5cm04aUxTTmxvcE8rcG1GeU5teldsbElv?=
 =?utf-8?B?TEJMM0xCT3ZXa1NWZGFlZldVeEQrWDBaVTRmalU0MUVVVG5RUFVyZmdoRkpP?=
 =?utf-8?B?S2NOelh5eW84T3JNVWdtaWp5ZjIyQ2JtQVdJMEdPK2NhOWFGZlVPbldlQUU0?=
 =?utf-8?B?d05jNERXVXpmSHVGUnd5ckhwYVlYVXg0M1YvaUVYSXNCN0t2K3dQVE5zNFlW?=
 =?utf-8?B?alprK0NMMjVueXg0ZzZ4b0V4eWdBemRDdTFDNU4rcHRKV1UzaStIeGtKVjd3?=
 =?utf-8?B?OFU1UXRPeWdjYWQzUlRnMzdFUUN5ZkZvWG05UzVGbmhmQ0ZUem9qN08xZ2hu?=
 =?utf-8?B?RzJmdHdWRWN1TDI4ZG9qNlJENlI5cC9nN1A1QVk1RUR1MVdOMTNLUmNtTVhL?=
 =?utf-8?B?cnJCSWtKbEo3WW5BVXNHK0lYZlJRUlpaUmNuVXlRa0x5NXZhTXZWSzNiMmVR?=
 =?utf-8?B?K0haaUlMT3FCMFVKT2pBKzNjU05uQU9FQlF4NjlwTkduWElmaHJIeVV0WHFw?=
 =?utf-8?B?aWwzdDMxeDBxU3ZjMnpkMEFsdk5NMXdBSys1dGhrR1ROMzc5RUprNG5KNHJI?=
 =?utf-8?B?NHk5OU1ZK0hkZmJWMHp1TmpaZFRzdnNJR1gvNXhLOStMU1RTUCtpSDBMbC9W?=
 =?utf-8?B?enpMU3Z2YnBwZ2h1ZWZ1OW50OHZpWG8zMmwzaHU1ZGxqdFlVcFNBRWFRTTNE?=
 =?utf-8?B?UWNHanFCOWhuZnVtbm9wR3hJdU9rc0NDVVBlR1hSSk5sczdYdE50Y3NWa1My?=
 =?utf-8?B?WVBCeG5nSUlXRlBoelRmNUNzOHlIYktHTFA3MUo1M09kbWZLYTkraHgrQUpC?=
 =?utf-8?B?VVNMTDNEcTJiVjRnTUtTSm5QR2JwdWNUbGVNd2c3c0NxWkFJOXZMQVBGaHc2?=
 =?utf-8?B?RFhsaVU4WituaUlXNnJIMU5FdEEyMzdqZEJRWXRSMkJuS2swV2MrQ0ZEYmhK?=
 =?utf-8?B?anhseUFSV3FKeFAxUG4xT090RlEzUy9EMXdTZys5RFV3QkFPTUVwVFMxeEZS?=
 =?utf-8?B?ZEJDMjYrSkIzdkExQkZMYnh5UTY3Ym5jRUZpUEZ5dlJmRVFldENram1mSGk4?=
 =?utf-8?B?aDE3aXZBSVFmQVNYU295WERPbjRodWFIRUptVFphWDNYQU1nbC9yV0RsVDRt?=
 =?utf-8?B?bzJqdDVjdzluNXR0YUpxY3o0RCtYc2NyVGhMb1pwMTdIZkppNlZleTE0Y2dG?=
 =?utf-8?Q?BqLVWy29JIs8G534=3D?=
X-Exchange-RoutingPolicyChecked: KkCkw155omMYl49NU7arZVhXLsbd9aXZfNuVxXU1K5S9VhUFDpBr9ypufQRcbkGsMXXdDmuwPyPA+KY/Vrhkx+OUjaiQO93P3J7ldslYFMGz63IloUFuFCQr0lZPbYPcQNGsluosZ4gG2iFmb+pf7XasmMqbD91SayTATk9jAACOuBZT3VTUIEtUGQcbKk+w6UkKlLRCpjGYKdR3LrinBFN9sMoJKmbI22eKveiZnzh5a6CbFe8zgtk0YPP9FOXCGuK8e13NgfUIq3ogyO+bWPRqJfOudRQu8n8VoWDXe8mhJbuY4uorovNBQbLc5Ak37V9ap/SRRobfsh+bbuLX8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55448ccc-5189-4139-e3ab-08df2e863266
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:43:21.8383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QymTXudEDAF4JY9XoGdekbpxU8+BgD40aIF6byMDuNrpWwHdCrn1jIotZ3aO2aDpNre+Mo/bGJugDg/TPNA9+wGTizkJWhmeKRGb09ROZYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Give every pool of a VRAM region a buddy allocator of its own, so that an
allocation can be confined to a pool without resorting to
%GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy algorithm.

Buddy offsets become partition relative, so resources and the resource
cursor now carry the partition their blocks were allocated from.

A placement range narrowed down to a pool may end up empty, e.g. a small
BAR CPU visible window not reaching the pool, so such a range is rejected
up front instead of underflowing the size check and the partition
relative offsets.

Usage reporting follows the pools: the memory region query reports the
size, usage and CPU visible usage of the general-purpose pools only, with
CPU visible usage now tracked per partition, and the free VRAM of a pool
is that of its own partition.

While at it, make xe_ttm_vram_mgr_intersects() and
xe_ttm_vram_mgr_compatible() treat a zero lpfn as no upper limit, as TTM
defines it, rather than as an empty range when fpfn is non-zero.

Regions still have a single pool spanning their whole usable range, so
apart from the above lpfn handling there is no functional change.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c              |  21 +-
 drivers/gpu/drm/xe/xe_res_cursor.h         |  45 +--
 drivers/gpu/drm/xe/xe_svm.c                |  16 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 366 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  51 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   2 -
 6 files changed, 370 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 0692ec93f55d2..b65540348b053 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -284,6 +284,14 @@ static int query_mem_regions(struct xe_device *xe,
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
+			u64 total_size;
+			u64 visible_size;
+			u64 used_visible;
+			u64 used;
+
+			xe_ttm_vram_get_general_pool_sizes(man, &total_size, &visible_size);
+			xe_ttm_vram_get_general_pool_used(man, &used, &used_visible);
+
 			mem_regions->mem_regions[mem_regions->num_mem_regions].mem_class =
 				DRM_XE_MEM_REGION_CLASS_VRAM;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].instance =
@@ -292,16 +300,13 @@ static int query_mem_regions(struct xe_device *xe,
 				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
 				SZ_64K : PAGE_SIZE;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].total_size =
-				man->size;
-
-			xe_ttm_vram_get_used(man,
-					     &mem_regions->mem_regions
-					     [mem_regions->num_mem_regions].used,
-					     &mem_regions->mem_regions
-					     [mem_regions->num_mem_regions].cpu_visible_used);
+				total_size;
 
+			mem_regions->mem_regions[mem_regions->num_mem_regions].used = used;
+			mem_regions->mem_regions[mem_regions->num_mem_regions].cpu_visible_used =
+				used_visible;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].cpu_visible_size =
-				xe_ttm_vram_get_cpu_visible_size(man);
+				visible_size;
 			mem_regions->num_mem_regions++;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index c3a037e5f34e2..586d572a02729 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -57,8 +57,14 @@ struct xe_res_cursor {
 	struct scatterlist *sgl;
 	/** @dma_addr: Current element in a struct drm_pagemap_addr array */
 	const struct drm_pagemap_addr *dma_addr;
-	/** @mm: Buddy allocator for VRAM cursor */
-	struct gpu_buddy *mm;
+	/**
+	 * @part: VRAM partition @node was allocated from
+	 *
+	 * Needed to resolve a VRAM region relative offset and a size from a
+	 * buddy block, see xe_ttm_vram_mgr_block_offset(). Only valid for the
+	 * VRAM memory types.
+	 */
+	struct xe_ttm_vram_mgr_part *part;
 	/**
 	 * @dma_start: DMA start address for the current segment.
 	 * This may be different to @dma_addr.addr since elements in
@@ -69,14 +75,6 @@ struct xe_res_cursor {
 	u64 dma_seg_size;
 };
 
-static struct gpu_buddy *xe_res_get_buddy(struct ttm_resource *res)
-{
-	struct ttm_resource_manager *mgr;
-
-	mgr = ttm_manager_type(res->bo->bdev, res->mem_type);
-	return &to_xe_ttm_vram_mgr(mgr)->mm;
-}
-
 /**
  * xe_res_first - initialize a xe_res_cursor
  *
@@ -107,16 +105,18 @@ static inline void xe_res_first(struct ttm_resource *res,
 		cur->size = size;
 		cur->remaining = size;
 		cur->node = NULL;
-		cur->mm = NULL;
+		cur->part = NULL;
 		break;
 	}
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
+		struct xe_ttm_vram_mgr_resource *vres =
+			to_xe_ttm_vram_mgr_resource(res);
+		struct xe_ttm_vram_mgr_part *part = vres->part;
 		struct gpu_buddy_block *block;
 		struct list_head *head, *next;
-		struct gpu_buddy *mm = xe_res_get_buddy(res);
 
-		head = &to_xe_ttm_vram_mgr_resource(res)->blocks;
+		head = &vres->blocks;
 
 		block = list_first_entry_or_null(head,
 						 struct gpu_buddy_block,
@@ -124,8 +124,8 @@ static inline void xe_res_first(struct ttm_resource *res,
 		if (!block)
 			goto fallback;
 
-		while (start >= gpu_buddy_block_size(mm, block)) {
-			start -= gpu_buddy_block_size(mm, block);
+		while (start >= xe_ttm_vram_mgr_block_size(part, block)) {
+			start -= xe_ttm_vram_mgr_block_size(part, block);
 
 			next = block->link.next;
 			if (next != head)
@@ -133,9 +133,9 @@ static inline void xe_res_first(struct ttm_resource *res,
 						   link);
 		}
 
-		cur->mm = mm;
-		cur->start = gpu_buddy_block_offset(block) + start;
-		cur->size = min(gpu_buddy_block_size(mm, block) - start,
+		cur->part = part;
+		cur->start = xe_ttm_vram_mgr_block_offset(part, block) + start;
+		cur->size = min(xe_ttm_vram_mgr_block_size(part, block) - start,
 				size);
 		cur->remaining = size;
 		cur->node = block;
@@ -152,6 +152,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 	cur->size = size;
 	cur->remaining = size;
 	cur->node = NULL;
+	cur->part = NULL;
 	cur->mem_type = XE_PL_TT;
 	XE_WARN_ON(res && start + size > res->size);
 }
@@ -311,15 +312,15 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 		block = list_entry(next, struct gpu_buddy_block, link);
 
 
-		while (start >= gpu_buddy_block_size(cur->mm, block)) {
-			start -= gpu_buddy_block_size(cur->mm, block);
+		while (start >= xe_ttm_vram_mgr_block_size(cur->part, block)) {
+			start -= xe_ttm_vram_mgr_block_size(cur->part, block);
 
 			next = block->link.next;
 			block = list_entry(next, struct gpu_buddy_block, link);
 		}
 
-		cur->start = gpu_buddy_block_offset(block) + start;
-		cur->size = min(gpu_buddy_block_size(cur->mm, block) - start,
+		cur->start = xe_ttm_vram_mgr_block_offset(cur->part, block) + start;
+		cur->size = min(xe_ttm_vram_mgr_block_size(cur->part, block) - start,
 				cur->remaining);
 		cur->node = block;
 		break;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7f58240b0b5b4..13e5bf0fd6cf4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -803,28 +803,22 @@ static u64 block_offset_to_pfn(struct drm_pagemap *dpagemap, u64 offset)
 	return PHYS_PFN(offset + xpagemap->hpa_base);
 }
 
-static struct gpu_buddy *vram_to_buddy(struct xe_vram_region *vram)
-{
-	return &vram->ttm.mm;
-}
-
 static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
 				      unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
-	struct list_head *blocks = &to_xe_ttm_vram_mgr_resource(res)->blocks;
-	struct xe_vram_region *vr = xe_map_resource_to_region(res);
-	struct gpu_buddy *buddy = vram_to_buddy(vr);
+	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct gpu_buddy_block *block;
 	int j = 0;
 
-	list_for_each_entry(block, blocks, link) {
+	list_for_each_entry(block, &vres->blocks, link) {
+		u64 offset = xe_ttm_vram_mgr_block_offset(vres->part, block);
 		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
-						    gpu_buddy_block_offset(block));
+						    offset);
 		int i;
 
-		for (i = 0; i < gpu_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
+		for (i = 0; i < xe_ttm_vram_mgr_block_size(vres->part, block) >> PAGE_SHIFT; ++i)
 			pfn[j++] = block_pfn + i;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 226f732ee97be..83baeec2ef9b1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -37,8 +37,9 @@ xe_ttm_vram_mgr_first_block(struct list_head *list)
 	return list_first_entry_or_null(list, struct gpu_buddy_block, link);
 }
 
-static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
-						    struct list_head *head)
+static inline bool
+xe_is_vram_mgr_blocks_contiguous(struct xe_ttm_vram_mgr_part *part,
+				 struct list_head *head)
 {
 	struct gpu_buddy_block *block;
 	u64 start, size;
@@ -48,28 +49,94 @@ static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
 		return false;
 
 	while (head != block->link.next) {
-		start = gpu_buddy_block_offset(block);
-		size = gpu_buddy_block_size(mm, block);
+		start = xe_ttm_vram_mgr_block_offset(part, block);
+		size = xe_ttm_vram_mgr_block_size(part, block);
 
 		block = list_entry(block->link.next, struct gpu_buddy_block,
 				   link);
-		if (start + size != gpu_buddy_block_offset(block))
+		if (start + size != xe_ttm_vram_mgr_block_offset(part, block))
 			return false;
 	}
 
 	return true;
 }
 
-static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
+/*
+ * Find the partition able to satisfy the VRAM region relative range
+ * [@start, @end). @exact is set if the range covers the whole partition, in
+ * which case the caller can skip %GPU_BUDDY_RANGE_ALLOCATION as every block
+ * of the partition trivially satisfies the range.
+ *
+ * Partitions are a hard split, so a range straddling a partition boundary
+ * cannot be satisfied and NULL is returned.
+ */
+static struct xe_ttm_vram_mgr_part *
+xe_ttm_vram_mgr_select_part(struct xe_ttm_vram_mgr *mgr, u64 start, u64 end,
+			    bool *exact)
+{
+	unsigned int i;
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (start == part->pool->offset &&
+		    end == part->pool->offset + part->pool->size) {
+			*exact = true;
+			return part;
+		}
+	}
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (start >= part->pool->offset &&
+		    end <= part->pool->offset + part->pool->size) {
+			*exact = false;
+			return part;
+		}
+	}
+
+	return NULL;
+}
+
+/*
+ * Find the partition containing the VRAM region relative offset @addr, or
+ * NULL if @addr is outside the region.
+ */
+static struct xe_ttm_vram_mgr_part *
+xe_ttm_vram_mgr_addr_to_part(struct xe_ttm_vram_mgr *mgr, u64 addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (addr >= part->pool->offset &&
+		    addr < part->pool->offset + part->pool->size)
+			return part;
+	}
+
+	return NULL;
+}
+
+/*
+ * Allocate the VRAM region relative range [@start, @end) from @part. The
+ * range must be contained within @part and is translated to the partition
+ * relative offsets tracked by its buddy allocator.
+ */
+static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr,
+				   struct xe_ttm_vram_mgr_part *part, u64 start,
 				   u64 end, u64 size, u64 min_page_size,
 				   struct list_head *blocks, unsigned long flags,
 				   struct ttm_resource *res, u64 *used_visible)
 {
-	struct gpu_buddy *mm = &mgr->mm;
 	struct gpu_buddy_block *block;
 	int err;
 
-	err = gpu_buddy_alloc_blocks(mm, start, end, size, min_page_size, blocks, flags);
+	err = gpu_buddy_alloc_blocks(&part->mm,
+				     start - part->pool->offset,
+				     end - part->pool->offset,
+				     size, min_page_size, blocks, flags);
 	if (err)
 		return err;
 
@@ -88,10 +155,11 @@ static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
 		*used_visible = size;
 	} else {
 		list_for_each_entry(block, blocks, link) {
-			u64 blk_start = gpu_buddy_block_offset(block);
+			u64 blk_start = xe_ttm_vram_mgr_block_offset(part, block);
 
 			if (blk_start < mgr->visible_size) {
-				u64 blk_end = blk_start + gpu_buddy_block_size(mm, block);
+				u64 blk_end = blk_start +
+					xe_ttm_vram_mgr_block_size(part, block);
 
 				*used_visible += min(blk_end, mgr->visible_size) - blk_start;
 			}
@@ -99,6 +167,7 @@ static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
 	}
 
 	mgr->visible_avail -= *used_visible;
+	part->used_visible += *used_visible;
 	return 0;
 }
 
@@ -109,17 +178,20 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
-	struct gpu_buddy *mm = &mgr->mm;
+	struct xe_ttm_vram_mgr_part *part;
 	u64 size, min_page_size;
 	unsigned long lpfn;
+	bool exact;
 	int err;
 
 	lpfn = place->lpfn;
 	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
 		lpfn = man->size >> PAGE_SHIFT;
 
-	if (tbo->base.size >> PAGE_SHIFT > (lpfn - place->fpfn))
-		return -E2BIG; /* don't trigger eviction for the impossible */
+	/* don't trigger eviction for the impossible */
+	if (place->fpfn >= lpfn ||
+	    tbo->base.size >> PAGE_SHIFT > (lpfn - place->fpfn))
+		return -E2BIG;
 
 	vres = kzalloc_obj(*vres);
 	if (!vres)
@@ -135,13 +207,21 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 
 	INIT_LIST_HEAD(&vres->blocks);
 
+	part = xe_ttm_vram_mgr_select_part(mgr, (u64)place->fpfn << PAGE_SHIFT,
+					   (u64)lpfn << PAGE_SHIFT, &exact);
+	if (!part) {
+		err = -ENOSPC;
+		goto error_fini;
+	}
+	vres->part = part;
+
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= GPU_BUDDY_TOPDOWN_ALLOCATION;
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		vres->flags |= GPU_BUDDY_CONTIGUOUS_ALLOCATION;
 
-	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
+	if (!exact)
 		vres->flags |= GPU_BUDDY_RANGE_ALLOCATION;
 
 	if (WARN_ON(!vres->base.size)) {
@@ -154,11 +234,20 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	if (tbo->page_alignment)
 		min_page_size = (u64)tbo->page_alignment << PAGE_SHIFT;
 
-	if (WARN_ON(min_page_size < mm->chunk_size)) {
+	if (WARN_ON(min_page_size < part->mm.chunk_size)) {
 		err = -EINVAL;
 		goto error_fini;
 	}
 
+	/*
+	 * Buddy offsets are partition relative, so an allocation aligned within
+	 * the partition is only aligned in the region if the base is too.
+	 */
+	if (!IS_ALIGNED(part->pool->offset, min_page_size)) {
+		err = -ENOSPC;
+		goto error_fini;
+	}
+
 	if (WARN_ON(!IS_ALIGNED(size, min_page_size))) {
 		err = -EINVAL;
 		goto error_fini;
@@ -170,7 +259,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	err = xe_ttm_vram_buddy_alloc(mgr, (u64)place->fpfn << PAGE_SHIFT,
+	err = xe_ttm_vram_buddy_alloc(mgr, part, (u64)place->fpfn << PAGE_SHIFT,
 				      (u64)lpfn << PAGE_SHIFT, size,
 				      min_page_size, &vres->blocks, vres->flags,
 				      &vres->base, &vres->used_visible_size);
@@ -179,7 +268,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
-	    xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
+	    xe_is_vram_mgr_blocks_contiguous(part, &vres->blocks))
 		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
 	/*
@@ -191,7 +280,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 								 typeof(*block),
 								 link);
 
-		vres->base.start = gpu_buddy_block_offset(block) >> PAGE_SHIFT;
+		vres->base.start =
+			xe_ttm_vram_mgr_block_offset(part, block) >> PAGE_SHIFT;
 	} else {
 		vres->base.start = XE_BO_INVALID_OFFSET;
 	}
@@ -208,6 +298,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 }
 
 static void xe_ttm_vram_buddy_free(struct xe_ttm_vram_mgr *mgr,
+				   struct xe_ttm_vram_mgr_part *part,
 				   struct list_head *blocks,
 				   u64 used_visible)
 {
@@ -215,8 +306,9 @@ static void xe_ttm_vram_buddy_free(struct xe_ttm_vram_mgr *mgr,
 
 	list_for_each_entry(block, blocks, link)
 		block->private = NULL;
-	gpu_buddy_free_list(&mgr->mm, blocks, 0);
+	gpu_buddy_free_list(&part->mm, blocks, 0);
 	mgr->visible_avail += used_visible;
+	part->used_visible -= used_visible;
 }
 
 /*
@@ -237,7 +329,8 @@ static void xe_ttm_vram_retry_queued_pages(struct xe_ttm_vram_mgr *mgr)
 	lockdep_assert_held(&mgr->lock);
 
 	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
-		if (xe_ttm_vram_buddy_alloc(mgr, pos->addr, pos->addr + PAGE_SIZE,
+		if (xe_ttm_vram_buddy_alloc(mgr, pos->part, pos->addr,
+					    pos->addr + PAGE_SIZE,
 					    PAGE_SIZE, PAGE_SIZE, &pos->blocks,
 					    GPU_BUDDY_RANGE_ALLOCATION, NULL,
 					    &pos->used_visible_size)) {
@@ -259,7 +352,8 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 
 	mutex_lock(&mgr->lock);
-	xe_ttm_vram_buddy_free(mgr, &vres->blocks, vres->used_visible_size);
+	xe_ttm_vram_buddy_free(mgr, vres->part, &vres->blocks,
+			       vres->used_visible_size);
 	if (unlikely(!list_empty(&mgr->queued_pages)))
 		xe_ttm_vram_retry_queued_pages(mgr);
 	mutex_unlock(&mgr->lock);
@@ -273,7 +367,7 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
-	struct gpu_buddy *mm = &mgr->mm;
+	unsigned int i;
 
 	mutex_lock(&mgr->lock);
 	drm_printf(printer, "default_page_size: %lluKiB\n",
@@ -283,7 +377,15 @@ static void xe_ttm_vram_mgr_debug(struct ttm_resource_manager *man,
 	drm_printf(printer, "visible_size: %lluMiB\n",
 		   (u64)mgr->visible_size >> 20);
 
-	drm_buddy_print(mm, printer);
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		drm_printf(printer, "partition %u: base %lluMiB size %lluMiB%s\n",
+			   i, part->pool->offset >> 20, part->pool->size >> 20,
+			   part->pool->purpose == XE_VRAM_POOL_KERNEL ?
+			   " (kernel only)" : "");
+		drm_buddy_print(&part->mm, printer);
+	}
 	mutex_unlock(&mgr->lock);
 	drm_printf(printer, "man size:%llu\n", man->size);
 }
@@ -296,8 +398,8 @@ static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres =
 		to_xe_ttm_vram_mgr_resource(res);
-	struct gpu_buddy *mm = &mgr->mm;
 	struct gpu_buddy_block *block;
+	unsigned long place_lpfn;
 
 	if (!place->fpfn && !place->lpfn)
 		return true;
@@ -305,13 +407,16 @@ static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager *man,
 	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
 		return vres->used_visible_size > 0;
 
+	/* A zero lpfn means no upper limit */
+	place_lpfn = place->lpfn ? place->lpfn : man->size >> PAGE_SHIFT;
+
 	list_for_each_entry(block, &vres->blocks, link) {
 		unsigned long fpfn =
-			gpu_buddy_block_offset(block) >> PAGE_SHIFT;
+			xe_ttm_vram_mgr_block_offset(vres->part, block) >> PAGE_SHIFT;
 		unsigned long lpfn = fpfn +
-			(gpu_buddy_block_size(mm, block) >> PAGE_SHIFT);
+			(xe_ttm_vram_mgr_block_size(vres->part, block) >> PAGE_SHIFT);
 
-		if (place->fpfn < lpfn && place->lpfn > fpfn)
+		if (place->fpfn < lpfn && place_lpfn > fpfn)
 			return true;
 	}
 
@@ -326,8 +431,8 @@ static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres =
 		to_xe_ttm_vram_mgr_resource(res);
-	struct gpu_buddy *mm = &mgr->mm;
 	struct gpu_buddy_block *block;
+	unsigned long place_lpfn;
 
 	if (!place->fpfn && !place->lpfn)
 		return true;
@@ -335,13 +440,16 @@ static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager *man,
 	if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
 		return vres->used_visible_size == size;
 
+	/* A zero lpfn means no upper limit */
+	place_lpfn = place->lpfn ? place->lpfn : man->size >> PAGE_SHIFT;
+
 	list_for_each_entry(block, &vres->blocks, link) {
 		unsigned long fpfn =
-			gpu_buddy_block_offset(block) >> PAGE_SHIFT;
+			xe_ttm_vram_mgr_block_offset(vres->part, block) >> PAGE_SHIFT;
 		unsigned long lpfn = fpfn +
-			(gpu_buddy_block_size(mm, block) >> PAGE_SHIFT);
+			(xe_ttm_vram_mgr_block_size(vres->part, block) >> PAGE_SHIFT);
 
-		if (fpfn < place->fpfn || lpfn > place->lpfn)
+		if (fpfn < place->fpfn || lpfn > place_lpfn)
 			return false;
 	}
 
@@ -397,19 +505,33 @@ static void xe_ttm_vram_free_bad_pages(struct xe_ttm_vram_mgr *mgr)
 
 	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
 		list_del(&pos->offlined_link);
-		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
+		xe_ttm_vram_buddy_free(mgr, pos->part, &pos->blocks,
+				       pos->used_visible_size);
 		--mgr->n_offlined_pages;
 		kfree(pos);
 	}
 	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
 		list_del(&pos->queued_link);
 		/* queued entries have no buddy reservation yet */
-		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
+		xe_ttm_vram_buddy_free(mgr, pos->part, &pos->blocks, 0);
 		--mgr->n_queued_pages;
 		kfree(pos);
 	}
 }
 
+/* Tear down every initialized partition and unpublish it from its pool */
+static void xe_ttm_vram_mgr_fini_parts(struct xe_ttm_vram_mgr *mgr)
+{
+	unsigned int i;
+
+	for (i = 0; i < mgr->num_parts; ++i) {
+		mgr->parts[i].pool->part = NULL;
+		gpu_buddy_fini(&mgr->parts[i].mm);
+	}
+
+	mgr->num_parts = 0;
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -425,40 +547,86 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
-	gpu_buddy_fini(&mgr->mm);
+	xe_ttm_vram_mgr_fini_parts(mgr);
 
 	ttm_resource_manager_cleanup(&mgr->manager);
 
 	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
 }
 
-int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
-			   u32 mem_type, u64 size, u64 io_size,
-			   u64 default_page_size)
+/*
+ * Back every pool of the region with a buddy allocator of its own.
+ *
+ * Buddy offsets are partition relative, so a partition base has to be aligned
+ * to %XE_TTM_VRAM_MGR_PART_ALIGN, otherwise an aligned buddy allocation is not
+ * aligned in the region. Allocations needing a larger alignment are rejected
+ * by xe_ttm_vram_mgr_new() if the partition base does not honour it.
+ */
+static int xe_ttm_vram_mgr_init_parts(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
+				      struct xe_vram_region *vram)
 {
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < vram->num_partitions; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+		struct xe_vram_pool *pool = &vram->partitions[i];
+
+		xe_assert(xe, IS_ALIGNED(pool->offset, XE_TTM_VRAM_MGR_PART_ALIGN));
+		xe_assert(xe, pool->offset + pool->size <= vram->usable_size);
+
+		err = gpu_buddy_init(&part->mm, pool->size, mgr->default_page_size);
+		if (err) {
+			xe_ttm_vram_mgr_fini_parts(mgr);
+			return err;
+		}
+
+		gpu_buddy_driver_set_lock(&part->mm, &mgr->lock);
+
+		part->pool = pool;
+		pool->part = part;
+		mgr->num_parts = i + 1;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM manager of @vram, with one buddy allocator per pool
+ * of the region.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct xe_ttm_vram_mgr *mgr = &vram->ttm;
 	struct ttm_resource_manager *man = &mgr->manager;
+	u64 io_size = xe_vram_region_io_size(vram);
 	struct dmem_cgroup_region *cg;
-	const char *name;
 	int err;
 
 	man->func = &xe_ttm_vram_mgr_func;
-	mgr->mem_type = mem_type;
+	mgr->mem_type = vram->placement;
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
 	INIT_LIST_HEAD(&mgr->offlined_pages);
 	INIT_LIST_HEAD(&mgr->queued_pages);
-	mgr->default_page_size = default_page_size;
+	mgr->default_page_size = PAGE_SIZE;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
 
-	ttm_resource_manager_init(man, &xe->ttm, size);
-	err = gpu_buddy_init(&mgr->mm, man->size, default_page_size);
+	ttm_resource_manager_init(man, &xe->ttm, xe_vram_region_usable_size(vram));
+
+	err = xe_ttm_vram_mgr_init_parts(xe, mgr, vram);
 	if (err)
 		return err;
 
-	gpu_buddy_driver_set_lock(&mgr->mm, &mgr->lock);
-	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
+	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, man);
 
 	/*
 	 * Register the fini action before the cgroup region so that devres
@@ -469,10 +637,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	if (err)
 		return err;
 
-	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
-	cg = drmm_cgroup_register_region(&xe->drm, name,
+	cg = drmm_cgroup_register_region(&xe->drm, xe_mem_type_to_name[mgr->mem_type],
 					 &(struct dmem_cgroup_init){
-						.size = size,
+						.size = man->size,
 						.ops = &xe_ttm_vram_mgr_dmem_ops,
 						.reclaim_priv = man,
 					 });
@@ -485,23 +652,6 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, xe_ttm_vram_mgr_set_unused, man);
 }
 
-/**
- * xe_ttm_vram_mgr_init - initialize TTM VRAM region
- * @xe: pointer to Xe device
- * @vram: pointer to xe_vram_region that contains the memory region attributes
- *
- * Initialize the Xe TTM for given @vram region using the given parameters.
- *
- * Returns 0 for success, negative error code otherwise.
- */
-int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
-{
-	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
-				      xe_vram_region_usable_size(vram),
-				      xe_vram_region_io_size(vram),
-				      PAGE_SIZE);
-}
-
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
@@ -596,21 +746,64 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 	kfree(sgt);
 }
 
-u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man)
+/**
+ * xe_ttm_vram_get_general_pool_sizes - Sizes of the general-purpose pools
+ * @man: The TTM resource manager of the VRAM region
+ * @size: total size of the general-purpose pools
+ * @cpu_visible_size: CPU-visible size of the general-purpose pools
+ *
+ * Report only VRAM available to userspace. The visible size is clipped to
+ * the manager's CPU-visible range, which starts at the region base.
+ */
+void xe_ttm_vram_get_general_pool_sizes(struct ttm_resource_manager *man,
+					u64 *size, u64 *cpu_visible_size)
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	unsigned int i;
+
+	*size = 0;
+	*cpu_visible_size = 0;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_vram_pool *pool = mgr->parts[i].pool;
+		u64 end = pool->offset + pool->size;
 
-	return mgr->visible_size;
+		if (pool->purpose != XE_VRAM_POOL_GENERAL)
+			continue;
+
+		*size += pool->size;
+		if (pool->offset < mgr->visible_size)
+			*cpu_visible_size += min(end, mgr->visible_size) - pool->offset;
+	}
 }
 
-void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
-			  u64 *used, u64 *used_visible)
+/**
+ * xe_ttm_vram_get_general_pool_used - Usage of the general-purpose pools
+ * @man: The TTM resource manager of the VRAM region
+ * @used: bytes allocated from the general-purpose pools
+ * @used_visible: CPU-visible bytes allocated from the general-purpose pools
+ *
+ * Counterpart of xe_ttm_vram_get_general_pool_sizes(), memory allocated from
+ * pools serving another purpose, e.g. kernel-only, is not accounted.
+ */
+void xe_ttm_vram_get_general_pool_used(struct ttm_resource_manager *man,
+				       u64 *used, u64 *used_visible)
 {
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	unsigned int i;
+
+	*used = 0;
+	*used_visible = 0;
 
 	mutex_lock(&mgr->lock);
-	*used = mgr->mm.size - mgr->mm.avail;
-	*used_visible = mgr->visible_size - mgr->visible_avail;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		struct xe_ttm_vram_mgr_part *part = &mgr->parts[i];
+
+		if (part->pool->purpose != XE_VRAM_POOL_GENERAL)
+			continue;
+
+		*used += part->mm.size - part->mm.avail;
+		*used_visible += part->used_visible;
+	}
 	mutex_unlock(&mgr->lock);
 }
 
@@ -625,9 +818,8 @@ u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool)
 	struct xe_ttm_vram_mgr *mgr = &pool->region->ttm;
 	u64 avail;
 
-	/* A pool still spans the whole region of its manager */
 	mutex_lock(&mgr->lock);
-	avail = mgr->mm.avail;
+	avail = pool->part ? pool->part->mm.avail : 0;
 	mutex_unlock(&mgr->lock);
 
 	return avail;
@@ -790,9 +982,10 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe,
 }
 
 static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
-					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+					    struct xe_ttm_vram_mgr *vram_mgr)
 {
 	struct xe_ttm_vram_offline_resource *nentry;
+	struct xe_ttm_vram_mgr_part *part;
 	struct xe_bo *pbo_to_put = NULL;
 	struct xe_bo *pbo = NULL;
 	struct gpu_buddy_block *block;
@@ -802,7 +995,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 	scoped_guard(mutex, &vram_mgr->lock) {
 		if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
 			return -EEXIST;
-		block = gpu_buddy_allocated_addr_to_block(mm, addr);
+		part = xe_ttm_vram_mgr_addr_to_part(vram_mgr, addr);
+		if (WARN_ON(!part))
+			return -ENXIO;
+		block = gpu_buddy_allocated_addr_to_block(&part->mm,
+							  addr - part->pool->offset);
 		if (WARN_ON(IS_ERR(block)))
 			return PTR_ERR(block);
 
@@ -812,6 +1009,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		INIT_LIST_HEAD(&nentry->blocks);
 		nentry->status = XE_PAGE_RESERVE_PENDING;
 		nentry->addr = addr;
+		nentry->part = part;
 
 		if (block) {
 			pbo = xe_ttm_vram_block_owner_get(xe, block);
@@ -836,7 +1034,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		} else {
 			/* Immediately offline unoccupied pages */
 			/* Queue free(to-be-reserved) pages */
-			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
+			ret = xe_ttm_vram_buddy_alloc(vram_mgr, part, addr,
+						      addr + size,
 						      size, size, &nentry->blocks,
 						      GPU_BUDDY_RANGE_ALLOCATION,
 						      NULL, &nentry->used_visible_size);
@@ -938,7 +1137,6 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 {
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
-	struct gpu_buddy *mm;
 
 	/* Assert that the address is PAGE_SIZE aligned */
 	if (WARN_ON_ONCE(!IS_ALIGNED(addr, PAGE_SIZE))) {
@@ -962,7 +1160,6 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 		return -EIO;
 	}
 	vram_mgr = &vr->ttm;
-	mm = &vram_mgr->mm;
 
 	if (xe_ras_get_disable_vram_page_offline(xe)) {
 		xe_err(xe, "0x%llx is reported as corrupted address by HW\n",
@@ -971,7 +1168,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
 	}
 
 	/* Reserve page at address */
-	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
 
@@ -996,7 +1193,6 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 	struct xe_vram_region *vr = tile->mem.vram->region;
 	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
-	struct gpu_buddy *mm = &vram_mgr->mm;
 	u64 addr;
 
 	/* Stay within the buddy-managed range; CCS/GSM/DSM sit beyond usable_size */
@@ -1005,13 +1201,19 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 
 	addr = ALIGN_DOWN(vr->usable_size - PAGE_SIZE, PAGE_SIZE);
 	while (addr < vr->usable_size) {
+		struct xe_ttm_vram_mgr_part *part;
 		struct gpu_buddy_block *block;
 		bool found = false;
 
 		scoped_guard(mutex, &vram_mgr->lock) {
-			block = gpu_buddy_allocated_addr_to_block(mm, addr);
-			if (!block)
-				found = true;
+			part = xe_ttm_vram_mgr_addr_to_part(vram_mgr, addr);
+			if (part) {
+				u64 offset = addr - part->pool->offset;
+
+				block = gpu_buddy_allocated_addr_to_block(&part->mm, offset);
+				if (!block)
+					found = true;
+			}
 		}
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 6cf8217ec46b5..4c625a05c80d1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -14,9 +14,6 @@ struct xe_device;
 struct xe_tile;
 struct xe_vram_region;
 
-int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
-			   u32 mem_type, u64 size, u64 io_size,
-			   u64 default_page_size);
 int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
@@ -29,9 +26,10 @@ void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 			      struct sg_table *sgt);
 
 u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool);
-u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
-void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
-			  u64 *used, u64 *used_visible);
+void xe_ttm_vram_get_general_pool_sizes(struct ttm_resource_manager *man,
+					u64 *size, u64 *cpu_visible_size);
+void xe_ttm_vram_get_general_pool_used(struct ttm_resource_manager *man,
+				       u64 *used, u64 *used_visible);
 int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
 int xe_ttm_vram_inject_fault(struct xe_device *xe);
 
@@ -47,4 +45,45 @@ to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
 	return container_of(man, struct xe_ttm_vram_mgr, manager);
 }
 
+/**
+ * xe_ttm_vram_mgr_block_offset() - VRAM region relative offset of a block
+ * @part: Partition @block was allocated from
+ * @block: The buddy block
+ *
+ * A VRAM region may be split across several buddy allocators, and the offset
+ * tracked by a partition's buddy allocator is relative to the start of that
+ * partition. A raw &gpu_buddy_block is therefore not enough on its own to
+ * locate the memory it describes, so the owning partition has to be supplied
+ * by the caller. Every block reachable outside this layer hangs off a
+ * &xe_ttm_vram_mgr_resource, so use its @part.
+ *
+ * Use this rather than gpu_buddy_block_offset() anywhere an offset within the
+ * VRAM region (i.e. a DPA relative to the region base) is needed.
+ *
+ * Return: Offset of @block relative to the start of the VRAM region.
+ */
+static inline u64
+xe_ttm_vram_mgr_block_offset(const struct xe_ttm_vram_mgr_part *part,
+			     const struct gpu_buddy_block *block)
+{
+	return part->pool->offset + gpu_buddy_block_offset(block);
+}
+
+/**
+ * xe_ttm_vram_mgr_block_size() - Size of a buddy block
+ * @part: Partition @block was allocated from
+ * @block: The buddy block
+ *
+ * Wrapper around gpu_buddy_block_size() taking the partition @block was
+ * allocated from, see xe_ttm_vram_mgr_block_offset().
+ *
+ * Return: Size of @block in bytes.
+ */
+static inline u64
+xe_ttm_vram_mgr_block_size(struct xe_ttm_vram_mgr_part *part,
+			   struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_size(&part->mm, block);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 1da3c82b28585..a287acafb4ebb 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -55,8 +55,6 @@ struct xe_ttm_vram_mgr_part {
 struct xe_ttm_vram_mgr {
 	/** @manager: Base TTM resource manager */
 	struct ttm_resource_manager manager;
-	/** @mm: DRM buddy allocator which manages the VRAM */
-	struct gpu_buddy mm;
 	/** @parts: Partitions this VRAM region is split into */
 	struct xe_ttm_vram_mgr_part parts[XE_TTM_VRAM_MGR_MAX_PARTS];
 	/** @num_parts: Number of initialized entries in @parts */
-- 
2.34.1

