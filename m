Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56A606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ORCPATNI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E7D10F3A5;
	Tue, 27 Oct 2026 10:30:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CB410F3A5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097037; x=1824633037;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=5tnA2Vzs/EteZ88FOP3/GwKVl9gYqQwWnyZSfawRXiI=;
 b=ORCPATNItpvkLb59Ue4Kyv/P9B4VuX6nvh0to+/BuwyF9xH/umxrV29U
 u8OnI/5r7PwRdalGxVrCCuejOGQDLl0OYRKaHCZap6mpM/VskqB2lrQ6T
 M/hweiUz1ILaRp1SASsIKppF/dAb/HtoImjAdU1MuoYr/3WBS7NyTyHKL
 oFQnKUJkwfUptKNjzstP9GvOwqkeeCxL7GzA2yim/OZwpGsY1qzIN7D11
 vFjldQgbmss/zx4uuLJfPYvZtNUIJ7h3dLGVb9i1pweVesYTLmxOP/9an
 EityYk/gGoz3z98fJ6Jq1OBkx+MoHtIQQVyxzAkPuOpAUfDRnVKLU/mnl g==;
X-CSE-ConnectionGUID: hi9gzqRjRV+II34M6p2Dtw==
X-CSE-MsgGUID: 9mXtKiaBRb+XbSx4I9u+lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1809143"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1809143"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:37 -0700
X-CSE-ConnectionGUID: 7USeJlU9RjaIVTFOz79o1A==
X-CSE-MsgGUID: 9LxqKcm8QTSxHVuOczgLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4847219"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:30:35 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd/JN9G1rpRHw4dEriYAOpAe/7qHG1TyvXSMZccJwtkKLVl6Sb1yOv4OFx7O5F1iPi0FWTkWBENNadhLXLU1OHn3eYk5eI8IM9Iu+Ko8X7D8OLl9DjZK37RCt6flXDH5LL7LNlDVwvjAGclLW1oBkokS+5/anMWbQ2kTQDwoTn3R+5AzHxWSVkjnRRI4QUychzac/5XFPCfJx46Tet0gNYKj88pxZxrQ4lajNj8SEUA5rDb/GaZq476Fic+9ei57WbGzp5kY2vnZQweu83NkETjDMTmwEcziZiEdz07Ish3bpxnvOwKxZHRAaAVujv+W+AQqyXBKIolbqI8mBLjgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpuF9PuXRwRyPnO1azzgGwUPc+LdW4UlGSnfbVUF9d4=;
 b=kUR+R7CAWftl9Z9ZuoXGL+H8x6BM0vA4DFHiMHJVHKPQLSriBQ1GZWfL4O2B09X2Mecr+wxTSrGfHT0Z4bW/baWnDRe7LJwd1/ty1bEz90sGo+RjM1cOFxyFECZXxAP1i5j9yxtqxqv/fmZIWDSV10PM4BY2z5mRCffd34eyH/tXVja0MNj719Au1LSde8HTmSMT8jdqfQd9fj2lieBqk8jJpAiXjIAjGu8Z5QMrk27XFPLm9kJrNOzqkpQf0nKCkY6F25gzKAiQ1DwV3SHXQ2yYx4Xz7r/S0SPkHAzkvatarij38CsZbc+URPdOk8+KpKX0N0juSxq44sI+oKRj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV1PR11MB8789.namprd11.prod.outlook.com (2603:10b6:408:2b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Tue, 27 Oct
 2026 10:30:25 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:30:25 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v1 2/5] drm/xe/pf: Change provisioning mode under mutex
Date: Tue, 27 Oct 2026 11:30:06 +0100
Message-ID: <20261027103009.1259199-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA3PEPF00000513.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::667) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV1PR11MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: b23914fb-3d40-45ee-0521-08df34155004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|5023799004|56012099006|6133799003|18002099003|22082099003|261026121527099003|10067099003|261009223027099003|261021121427099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: NT2+s1kRY7UbuLvZZyfMGjwnrGMUlpysDNpCSQAm7VyFYTA3L/VSq4J8kWMGGhdiHgnfpusxLkRCzqS3G8VAHIPtjSA8vYRMo9EaWm5kTSJ9bSTSCS2aEAvRM9EKRSsA4lPDSAovmdVliLX0zdNKB/qcAB/3eiSg3q3ifHCPDmAQrwE+lNgiWxI3bMtd+5vEdu51VdDNm0orXz3Vf2Q5NkfePvnTWez06478vHFCkjQ0CIi+dQufUh691rIa9c9r3mqjvzsIkrm9kBOrrcmq1cvQESkiKVt5A7Oxu6pT98LHP/DlKdR1CxqK+LIF28yp0y1on1cLcHdtHQyjSQ3WBPr1dUPYcw00SVNDUhGu+c0rByZrspMFFNIg+lCxMF1XXhZVj3l3J36CNQ8IEVrvoHYZ1S0dEucOlIoM/Q3LOfjo7VTg5Rjb2uAu109GEedEXojJd2IHZjuRdTx1+prA2/ZFCQsUq6qQeKp/eptV70s3lxxXBLPHUsimoOP31t6eqHmFJFTEbQaFJ3JvS7kl7pJWh7SEMK/NkuooHex67/44ohJOUHrSbfB/7vf/yvB3GkUtOanUwj6xbxUwDqC0twbEGgEGUX2t7SQC/aydxNs9ftA3VM4aEFskngxkHHJMUwg67zmuq40IEUl5vLMye+DVg+aIP2dDRTOXbluuI28=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003)(261026121527099003)(10067099003)(261009223027099003)(261021121427099003)(261022075727099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRzdHFERyt6MmVTQ2Y0N0J4VE9ndWluWGxsNW9DeUNEYXNxV1lWL2R3QTVh?=
 =?utf-8?B?T3N3VVAxTkdxUGRMN0JrdkUxZ2RoT2IzaGtSQ3FRRUNPWlNHeDBzWHZvcVNZ?=
 =?utf-8?B?THVJV09xUkFPd1JvUmRpWlVhTms1cTZDdTFvNW1lRHlvNGNUeTl5TytMQlh4?=
 =?utf-8?B?NFJ5dUp1MGk2UmxHR0F5WFdSVUU1eksvU3hIeDhkZEQ1NHovbmM5cWdiNHd3?=
 =?utf-8?B?T3JNQldNdmcxWGtLN0pvYkI1WGZ3ZmlBbXJOby9ST1RaZDdRWHRUSXlvdE5I?=
 =?utf-8?B?bkhhSjlLOGFRQ1NwVUIrNUcwSE9ScG95R2RrUEpXa2NLRDBvY1F1L2lvUlB2?=
 =?utf-8?B?NXNMVkpqL1ZiaHRWWmw0VjBtT3BFcE50TmN1Yk1kSlB4OHZXNTd6c1dVVFll?=
 =?utf-8?B?aVJha3JuejBBZHpFZ2QxK2JDQjZ3bDZDVHhQWFMxUEVYZW1aakVqajVraG9B?=
 =?utf-8?B?UnVKeFQ1eU5LTmpsZld6bXVwNzRoVTg2bFdsVnVpTk45ZVYwalpTWjNZbUFZ?=
 =?utf-8?B?Q3QzWkR6U0k1Sm9rSjhsVUhieXBHNHJNU1VGNnR4Q2UwbnFRQTUrVHBMb1Fr?=
 =?utf-8?B?cEg2YzhYQWxaK09IRTlkeUpKcVphTFBKQ1h2OUdoV1VlVTZVeHhlRnZEYlkr?=
 =?utf-8?B?K040bVY2MVpQUjZmZlpZVlV3SjlPRDVhcjRpR29xd09DSDgrb0N0RUk1dkRi?=
 =?utf-8?B?NUFZbzUwSzFUOUQ5azRVclhqNksyVE5JbnE0Wlc4QjQ0bjlDSTZRSFFFOFVr?=
 =?utf-8?B?clFJNy9iUXJYQ0w2aXlXVUc4MkNtNVFsdHJaZGswaFFKeFNqa0xORFFLNEdQ?=
 =?utf-8?B?TVhUM1h0bDJPTHIxZVlJTFQrN3dnYTJlNURmRGcrbVVvUzZVbXJZMERYVkt2?=
 =?utf-8?B?bjRQTFh4SGlLYjlOSG81Rkk4VUtNdTZ1ejNvZFExeENMNTBXa01FTWJCQy9i?=
 =?utf-8?B?WmtBVlBodnJZOTFwcnRDcHF3ZUsxcGV3SElPZUcrQXRVeDlmeUU1RERVRXNm?=
 =?utf-8?B?bHVpQUNOcDJLNVpGVWtXM2crekY1QlJMSGNOR2trMGpMTkVyY1AyWVJlc3RD?=
 =?utf-8?B?V1FuRTNsNVBTaWpjeWJPSTlYdlh5SjFaaUZzM3oyNWE1TjlrWGY4SC93TVgx?=
 =?utf-8?B?cUpmbzR3a0VGdXJzQ2xuZ0JXRnFtZTVJdjVkeWlDNjNHR2MvcUZtQ2psUnEx?=
 =?utf-8?B?UlZFTWJvazBONllUNUEwYUQzUURGdnVqMGJnYWcwa3lzODhmcGFjWDMvZzAr?=
 =?utf-8?B?N2x3QWpZZjNwU0tRQ1pXVEY3QUJzaFRvWVJkYzhjT09CN1pxd3VkNlAzNjhh?=
 =?utf-8?B?ZWRpVldxYnNqVVk2c2YwWEUxajFETUliRmFFWHJKSGVsV0t3WmZ0YVh6aFpQ?=
 =?utf-8?B?dmpWdjRRWmZxSE5ZSmthaldvVHB6TGZkemtocEE3TU1UMmw1U1BtRmJ1bW9W?=
 =?utf-8?B?MTZnR2xKS3U3WjdGWXBCQkxGUHdLczlTb1I5bmNrN1lQS3UvdnFJM2g3S3lZ?=
 =?utf-8?B?MUlxOVNmTGxBREFtRDlKSlRsZ0F5ellOSjNXdVN6SEVjY3RYZFZxT0pQYXRj?=
 =?utf-8?B?blFZV2pUYmZuV2s2dFo3eTg3QzBMVCt0emdxNDAxenVsa05RakN6c0k4NGhr?=
 =?utf-8?B?Y1BwbUVBb2NBTS9KNWFvRjJnL2F4WUVhSTdLdWdiMThycS9rekVXb0d0WmJ5?=
 =?utf-8?B?dlllZllJUHFzMG0rWUllenFwYXdwOUFzckFXT2kvMjdUQjBRSTFGU3JVRWNR?=
 =?utf-8?B?TG5HT0lXblc4MDN1VzFFOXNWY2dmeVpJSFcyNWZSTXV6U0ZqNkx2SzRqTkxR?=
 =?utf-8?B?VE9qNEpkaE9sYzFPRFFWaTl2dU1HNmlVN0JkWFZWT2pvZzFYc3FnekZScVYv?=
 =?utf-8?B?cmIrYmU1SU42M2dVY3BFRE1Tc2IyaEt2dXVSRnAwWDNNNWpvb3FreVdmSzRX?=
 =?utf-8?B?M1FiSHQvaHdBQW9jenc0YnhRM1NDRm9LR3N0THFOb2hUTzdXdzhuR2NyTldz?=
 =?utf-8?B?ZHI4UWxtUUhzVGh0emJkL1k2OWU0YlhWWlhBNUd4UThrd0s3RXN0SG1DczBZ?=
 =?utf-8?B?WS9SREpOcUVGVjBUMmFtQkZWSjBCSGhjbStDVUVnclRHL1RRc2pJNUNxUWVw?=
 =?utf-8?B?TGlJZW5CWVBoYkUreTZrYXhFZFRYSlBHRDJSci9XSHA1UVBUMm1yZXBRTTc5?=
 =?utf-8?B?aDdnVkhKbklDMmVsNzFDYXpBVjRQcENNY3dYSlZzeDNhRjJRTUtyRHBvbDhv?=
 =?utf-8?B?bHhSZCs5dEtDSmhjTS9hb3NXa2JuT3RkQTNNMngvOW4yaHJmZU1UUmxDUEpU?=
 =?utf-8?B?Qk9kVlR4K3N3UHF6c1pubWhpMWFZT0xKQW5vQkN4Vy85RTRJd0k0RmpLZ0k5?=
 =?utf-8?Q?+aKxZsXXxHzXLiQw=3D?=
X-Exchange-RoutingPolicyChecked: McopIcAIPHh03fucng1d5ZmXomqHGKzsTQIIySKkuetxGVdwvOEUE6sX/6cPwtPv1TuIfaDwmMeY3R8xoK7r5vX7HVxOX5g9bNG6+04jWCwKlVPXpKun8VC9/TxZllpBKnnfh6G59iajspt0m0NrZgMQLwxAh+bNoBmiqwnV/dVZSJWQywahkaZK8leFkX3xVMyS04aWZvxJ1cfyCitRrygeIyUqecZRNhiZBEM6tOp6HPGwe/Svv/kQq9tjXhV7mZo2MlVRC0g+mJgXSgqLGNlg+kyh4Q+/vkLNArJOz8yAlpvKyF3obuknsVfl6zWBjtGn/Rm9FB1TkceFbjpu2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b23914fb-3d40-45ee-0521-08df34155004
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:30:25.2297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ketjtS98Y3UeCRs9/7phBFfDzgQX/jCtDnCud71sYrcR7qLKsrqvPYgf+Ehw0cXn2MEi+Pu0jZV+Xw/8RVVgYXopsSUTNSt2GlVs20EHerE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8789
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

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

The provisioning mode is changed from the debugfs handlers, but it is
also checked when VFs are disabled, without any locking. Since we now
have xe_gt_sriov_pf_config_release_locked(), we can release the VFs
configuration while holding the master mutex, and do a proper locking
while changing the provisioning mode and while unprovisioning the VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 91670063f706..e713a24b8864 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -56,9 +56,11 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	unsigned int id;
 	unsigned int n;
 
+	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
+
 	for_each_gt(gt, xe, id)
 		for (n = 1; n <= num_vfs; n++)
-			xe_gt_sriov_pf_config_release(gt, n, true);
+			xe_gt_sriov_pf_config_release_locked(gt, n, true);
 }
 
 static void pf_unprovision_all_vfs(struct xe_device *xe)
@@ -98,6 +100,8 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
 	if (!pf_auto_provisioning_mode(xe))
 		return 0;
 
@@ -166,6 +170,8 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
 	if (mode == xe->sriov.pf.provision.mode)
 		return 0;
 
-- 
2.34.1

