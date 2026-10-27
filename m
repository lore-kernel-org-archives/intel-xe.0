Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D3606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rxh0Ix6F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A07E10F3A4;
	Tue, 27 Oct 2026 10:30:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2780F10F385
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097036; x=1824633036;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=w82j14ljj6f0PPDqNCSKNTmyhW6pfht3PvyaEdx0ypM=;
 b=Rxh0Ix6FpXvuOUuJb3BxS4ahkDiN09B2ZLE0POGNELOuG3Z5XoKyXCsF
 dHPeK19LONjBuqjx4oUKafIljGwfquzHKSSFQKLJtX2yljDzyPxUmjYo1
 4unoAz8Z331WFFiwXIEhfYeDLmCBNEDE6y/dNXiiv/JjW91OIjjsUYivL
 /k6SJgfp3+GAAOyPC8uZV8rF5jUdguR2CfJ5/4WLQGgHMSWx8mCfGCKfN
 p5KT1/FL/ZwAkPYI4xqoW/8owAXZsi0NXDLea00XHZq3SP0NgB5EEIVTQ
 ijlOYQZ65SHlck6AIziaWHrRduUJ8MKI2btQwnsqRT71E0ydy6Rnx2ojQ Q==;
X-CSE-ConnectionGUID: 7nou29z1RR2ajCAwWOwrfw==
X-CSE-MsgGUID: FyKqrkJCQ5a/3b4JpnRKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1780864"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1780864"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:35 -0700
X-CSE-ConnectionGUID: onSqSGSUR9eS4TzPmwvAtw==
X-CSE-MsgGUID: gfOHvQSGQtKFGDZgAK77aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4508137"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:30:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0SvRe89+QlqUVxx/YkWs9D9lNW3Fpoi/gFVpAcblwvzniHpDZqXlLPziyqVKtm+8WD3CteLy85+KEprhxl4gB1Uk0cBAgg16U9kdZfCFtFaADa7psQl/WqMWc9Qwrvz8zUqftA9c6Zp++4AxqRrH+v4wZehgtRum5w0EpXWDALkXY0kJeziQ9yq/VpIOwDWtmUc3Hv0oVlvZizodtZnnVAb1AOK6jo4jR9pmLqYnViBrBgqpY84llziZ3gsige+1TcHxhaUCBmKJ0l0ZGQs1mzedQOCTqcsOlHVVY1WLymdGIXn68WxRpgQ7pbGZjJGgUXrNad7aFe61FlCkTe8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPjvRa2HDZkmJJYa1KWkgDeifi5yVgjnBb3MPFjV5NM=;
 b=eXt3MquWh+G4gDbDTEs0C7LTHjPUC5xqxahmpcJrlodsmMyPbvPjR+WXJA44nfTVD4QXa3/PUABG9cRmQ++avb64UWlkPF67i2Fffx9HNLfzGr0y5Qmh+e6JCoxbNEh+wdODAXnxBL0b3FREerRp6LOwZIpeinx5rvPvNXgdYoqUm9YV6kGlJItbS0eHZpOxXP+kR4nKuAa8vgO/dUOCIWJ+YvBqXdEAOyReypHAfmFWADquMqfcsP/5TE0ANI668ld2tL2/etihOkIwZdFaTXyaYvLbLlN22XOUeDUVBvk/yD/WdvlVuL4UTn6USDIm4None5vg7UzZwPJ0WiZXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:30:30 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:30:29 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v1 3/5] drm/xe/pf: Add locked variant of the fair VFs
 provisioning
Date: Tue, 27 Oct 2026 11:30:07 +0100
Message-ID: <20261027103009.1259199-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: c27d2339-5dc0-46fb-a2c2-08df34155283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|261026140227099003|56012099006|11063799006|261021121427099003|10067099003|261021123027099003|261009223027099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: Vx/8VFpOGalpG8nFTcBTXL8IJyyOnptrZKAUXdJDlFb93yoNXuA2DHBCxI3rfhtykzmKxuPVSYHCdn2UynpQFvhZigtrmI5jVkULfvFrsjXa1MvUecC/x4yMW+9G9XyujQqJjdNYV9hDCfXwLlGc3QEXiNI2H1Bw4tAhuyPAfXyWpSUSvTZWCAf+mteLEEharlsu63+z55bU/Yn6/VEUXNanVIzOR2FnaV/g5GskElTByLrk1vBJuVV1Kbj4UQ0lkfx6Mn8Eut9i84QE5qFqBGPFA2b/23hCAYxSkeRppxIipIt218LdJHB9FQb6ti+xruK74L502Xq8cupDs1LPp4SSLNEeqKxkSgZ6Qc5aooMGmm+U+LfsvwgJB5+lOVsfdPixBVx+gsXqaUZTZOHJoGWLGTAAp5YtgO0r4hKrYjVNJc0FFNsc5B6ewzg7fRgSY7eFf4uYcntVjnz3Pe/LC9h6P0QNUVXVs3ROMxFpMpUtFZ0lRa9FFcaDcuuThaIDQYsFYkBswIjtqYGveMNfTzdJ2+oyAUVU0KN+JzIeTHVYzkoGUptQ/E6lJyyTZbyIHy2W7NqFyCe4Y2IQt6NAWRHSSll5QON38eWyowkGeGOpixce2SdA9tdadOeC+ugMU4NWlpt3OkZ6akWum/11wIfsJ7Og3uXgY0sddzH3rLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(261026140227099003)(56012099006)(11063799006)(261021121427099003)(10067099003)(261021123027099003)(261009223027099003)(261022105027099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEZ6Vmc5L1VwK2Rta2kxZEtZSEtObVVKUkhjYW1aN1JGQVJBVXFiRjZXbnI4?=
 =?utf-8?B?ZWVyNGF1TnRNNWs2UW13WDgyanhjd2kzNHZiKzVVYTM3cis3ejBZU3F5V1ZJ?=
 =?utf-8?B?T1F1K1pHQm9ZZVl5WXd0Mkh6V2tReVpha0xnZUlJVU5WaDE4ajlmWjkyRGEr?=
 =?utf-8?B?WTZoSmdwQ3JIQ1lGZXcxMWxmcFdvMjhSdnM4azc2ZUY0QmE2Rk5FZnRrQkpl?=
 =?utf-8?B?YnZjRWMzTTMvK1BjcDVOMmtJNEMyMzgvQW1JY1hlOHpxYVU0Mm1rR2R3dCtV?=
 =?utf-8?B?OG92MTNDMjU2czEyb2lrZ3o0eGx1czZoTCtxelJPV1N4UFNJTWM1bGY3V3Vs?=
 =?utf-8?B?WHZqQ3VFM3F4QVhpazVwTmtsOUZGdEErVjNxNFhmSWs1TUdDUDQzYVpkZ1kr?=
 =?utf-8?B?bFdVZkQxRkU1L0JZWDJ6R2llRk1ubkRBcDFkc3JJVkdFRWcrcWpmajdBL3NJ?=
 =?utf-8?B?d29mUjFsY00vUS9PemgrakFqNEtRT0tRU1BXMzVpdnBZNjRXTTNTbzUzOUt0?=
 =?utf-8?B?eDJBclljV0xiM1pBUFYwZDVLaEtUd2s3TmVsQlBWMjM2MXJTaVhYb2N1LzB0?=
 =?utf-8?B?L2FmVlVNNXdORTNFQXF6OXM2T3V6TnljWFZ6UE91Z2JLSkNDREQzKzU1THUr?=
 =?utf-8?B?MUFyNFlmVTdmeUd3OUlqVXJjeCtDVCs0N211eVlKT245QXk4T1FBZmJKVUpn?=
 =?utf-8?B?eDNGY3JVK3BsVTMzQ0FUaGg5dVl6YVo2elAvSW9DeW1QUlFvVHRqMUxrQWR3?=
 =?utf-8?B?STMyYnZXTVRVTlp4RExMalNaWVpNZloraFdkSDM1NjdNT2ZDTyt3enI3WkRi?=
 =?utf-8?B?SEoyOGtFM0NXcGYrd3EzdkhwOTgxQ3QxUk1Ud0Q4NnNUelVIZ3Z3Tng0VnFo?=
 =?utf-8?B?ZE5mbHRGNndNK1dQclJ4amJoV0oxajdDYzl1eG9uUGhZaFU0dmZzWTNIbzhJ?=
 =?utf-8?B?cEFpeTExemMzRHJBTWF2Q29IZTNjalFNOG5Ea2RIdUoxOWZmVktNbnIxMkY2?=
 =?utf-8?B?R25LSWFHZzd1UkVjbERYS09Qa1hQRGhFa0ZWOUpNY2FCVmgyK1IzYlFwMUNJ?=
 =?utf-8?B?UG95SmsvcWZLMmtKdDJxLzFPeDhUYmhNUzcwaUUrbmpXbklwQUhJamwxeWdx?=
 =?utf-8?B?aU5TQ2V1RTJheFJQWUhnK2owRGhPQ2lIVkMrY0FGaHhidmtza2dkTFJXQm9X?=
 =?utf-8?B?ZUs2Q1kxYTc3SDFMRGF1VE05M0t3c1dwREh3RXlYWGQ0RjdJd2JHaC93Rml2?=
 =?utf-8?B?QTI3U1RyMFFXSHErWWJlZkNsU0F6Q0pycGFXTjlIVXBtOElyamt0ODJxUXZS?=
 =?utf-8?B?cXBZZml4S3RvRjQyOVEwZzgzQkNWOTNaellwTHN1Sy9RSlFOZi84NXE4VnZa?=
 =?utf-8?B?WDMyb2xUdkVkaXJJTXpQejNwclNvVXdWVDdVWUhVSGc1Z3JMajBUdGhyaTda?=
 =?utf-8?B?ZmdCSXBYM2VSaXIrbEhWQlkzcEVoeWszd3BLcHo5UVlmSjE4MVFjN3dpQlNP?=
 =?utf-8?B?ei9qaWk2MjFYemQxdElsRm1RVU9TZVdDSXQvRDl0R3dyb2V6NEZIaTlaVUhI?=
 =?utf-8?B?M1VyUHloQ1JzZmZTWEkwVDRZQllKOVJiSVYzYW1xZytjeGUrbWdFSEcrZ0lJ?=
 =?utf-8?B?NjA1OWQ5QWpRQ2hRNWZLelJlVUxYM2pQRmExa3NFRXZkUndCaGU5UXNiNlgx?=
 =?utf-8?B?TVFNN2FCTTFRTjhUNjFQM2UwbDNJRE4yNmRMU2lySVFUcEc1bndTaC9SemNN?=
 =?utf-8?B?c2RJTzRlekZ1UVBEWHZ6QmdQT2ZnaWVwSGoyNmdERmx3dStBNmR3R1g1REph?=
 =?utf-8?B?WFdGQ3V4WG9TOUxGQ25IbUtsK1lSNmltOUk0U0UrNFNqZld3TURzRXNhQmhB?=
 =?utf-8?B?NFJpMEIwU1oyYjAxUzVmbVBtQW1FRHN5bzBoVmkveFV3RnFFSzIvYi96b3Ra?=
 =?utf-8?B?cGhOTy92cXUxN3JPWCs3ZVFIbVRheGk4NkZ4ZHlQRGNGc0JOSFdEd3k4TEJF?=
 =?utf-8?B?cG9tWHVmdDZkWXl0VVFadW9ZMFlYOVVWRmczUEdxYzQzcEE1UmFFM1lMVjN1?=
 =?utf-8?B?WW9OSmw0OXV5aXBJSU1mbUM1RFp4SzJYUFp0YndxTG1mb1pWUmY4bmVvdmRk?=
 =?utf-8?B?K3R5WXU2SDJCZ2YrZEdGTUYzcVhzR1Q3STZiZTlzYTAwMlJ1ZmR6bXNmUDBR?=
 =?utf-8?B?SUNReDU0Y3pVcnUxM25XTnI4N1VWaVNZZUFSTkQ4U3NkNkd4SFpmU2lrUC9G?=
 =?utf-8?B?emZObnJ1UE94UXRraG96VTZLcHIvNFdRM2dtSUliaSt5NW92Q3RsWUFZeDRM?=
 =?utf-8?B?R2ZLSjFtNFV0dHBYbFFYRmJtWDlYazE1ZDZpc1RCcG5MK3FuRmI1NEZ6VTBj?=
 =?utf-8?Q?A28LxtsW5MOerB8g=3D?=
X-Exchange-RoutingPolicyChecked: 5lLUNjrjjoEYxklRerN+QEANuBstGdIMmNMRE57uIMd4QvnAzcoHXXffrEIZRZzZ3zCYWKcTgAi3FHPd+2hSc7NvVicXuvdw81kPWgG+TAaULXi679wsJ2YhFDBCTyKPaZqGmgG0zeTmzd0DprOBgHdZcJXSBu3SXIVrWAXjvd3qqReeSZTjHDDcTu/SHkDVb71wB7dubSOVtXQU28L4w6vn+F0KoNR+kfc0so8FrBiUY+F0tdKZ2JbwR/hT9qp0DyWZCpnRfIP73tyLtMIOrgI2b9RYzDeFza2FtA8WpELzOqnKwWLhv4cMfCXw5DuK16GamCXP5n9J49Lmi0zn2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c27d2339-5dc0-46fb-a2c2-08df34155283
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:30:29.4330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pFTC7uEQdNtAI+s3+YO3dGLSLl5m4YkReZMMRKE7NSfDzmdNTVBfXUFZTk4cZlkcuV4mE+5goRrMjPPIsfOFxyF+8WD4IqWdJyAy4TLRHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

We will want to provision the VFs with fair resources while already
holding the master mutex, to make the provisioning mode check and the
actual provisioning atomic.

Convert the per-resource fair provisioning functions, which are only
called from xe_gt_sriov_pf_config_set_fair(), into the _locked variants
and add xe_gt_sriov_pf_config_set_fair_locked(). The existing function
now takes the master mutex once for all resources, instead of taking
it separately for each resource.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 71 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h | 15 +++--
 2 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 0a47458e5bf2..c8ab4138f6a8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -774,17 +774,18 @@ static u64 pf_profile_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_fair_ggtt - Provision many VFs with fair GGTT.
+ * xe_gt_sriov_pf_config_set_fair_ggtt_locked - Provision many VFs with fair GGTT.
  * @gt: the &xe_gt (can't be media)
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision
  *
+ * The caller must hold the master PF mutex.
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
-					unsigned int num_vfs)
+int xe_gt_sriov_pf_config_set_fair_ggtt_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs)
 {
 	u64 profile = pf_profile_fair_ggtt(gt, num_vfs);
 	u64 fair;
@@ -793,7 +794,7 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	fair = pf_estimate_fair_ggtt(gt, num_vfs);
 	if (!fair)
@@ -1205,17 +1206,18 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_fair_ctxs - Provision many VFs with fair GuC context IDs.
+ * xe_gt_sriov_pf_config_set_fair_ctxs_locked - Provision many VFs with fair GuC context IDs.
  * @gt: the &xe_gt
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision (can't be 0)
  *
+ * The caller must hold the master PF mutex.
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
-					unsigned int num_vfs)
+int xe_gt_sriov_pf_config_set_fair_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs)
 {
 	u32 profile = pf_profile_fair_ctxs(gt, num_vfs);
 	u32 fair;
@@ -1223,7 +1225,7 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
 
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	fair = pf_estimate_fair_ctxs(gt, num_vfs);
 	if (!fair)
@@ -1487,17 +1489,18 @@ static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 }
 
 /**
- * xe_gt_sriov_pf_config_set_fair_dbs - Provision many VFs with fair GuC doorbell  IDs.
+ * xe_gt_sriov_pf_config_set_fair_dbs_locked - Provision many VFs with fair GuC doorbell  IDs.
  * @gt: the &xe_gt
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision (can't be 0)
  *
+ * The caller must hold the master PF mutex.
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
-				       unsigned int num_vfs)
+int xe_gt_sriov_pf_config_set_fair_dbs_locked(struct xe_gt *gt, unsigned int vfid,
+					      unsigned int num_vfs)
 {
 	u32 profile = pf_profile_fair_dbs(gt, num_vfs);
 	u32 fair;
@@ -1505,7 +1508,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
 
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	fair = pf_estimate_fair_dbs(gt, num_vfs);
 	if (!fair)
@@ -2062,17 +2065,18 @@ static bool pf_needs_provision_lmem(struct xe_gt *gt, unsigned int first_vf,
 }
 
 /**
- * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
+ * xe_gt_sriov_pf_config_set_fair_lmem_locked - Provision many VFs with fair LMEM.
  * @gt: the &xe_gt (can't be media)
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision (can't be 0)
  *
+ * The caller must hold the master PF mutex.
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
-					unsigned int num_vfs)
+int xe_gt_sriov_pf_config_set_fair_lmem_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs)
 {
 	u64 profile;
 	u64 fair;
@@ -2084,7 +2088,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
-	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (!pf_needs_provision_lmem(gt, vfid, num_vfs))
 		return 0;
@@ -2103,17 +2107,18 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 }
 
 /**
- * xe_gt_sriov_pf_config_set_fair - Provision many VFs with fair resources.
+ * xe_gt_sriov_pf_config_set_fair_locked() - Provision many VFs with fair resources.
  * @gt: the &xe_gt
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision (can't be 0)
  *
+ * The caller must hold the master PF mutex.
  * This function can only be called on PF.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
-				   unsigned int num_vfs)
+int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
+					  unsigned int num_vfs)
 {
 	int result = 0;
 	int err;
@@ -2121,20 +2126,40 @@ int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
 
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
 	if (xe_gt_is_main_type(gt)) {
-		err = xe_gt_sriov_pf_config_set_fair_ggtt(gt, vfid, num_vfs);
+		err = xe_gt_sriov_pf_config_set_fair_ggtt_locked(gt, vfid, num_vfs);
 		result = result ?: err;
-		err = xe_gt_sriov_pf_config_set_fair_lmem(gt, vfid, num_vfs);
+		err = xe_gt_sriov_pf_config_set_fair_lmem_locked(gt, vfid, num_vfs);
 		result = result ?: err;
 	}
-	err = xe_gt_sriov_pf_config_set_fair_ctxs(gt, vfid, num_vfs);
+	err = xe_gt_sriov_pf_config_set_fair_ctxs_locked(gt, vfid, num_vfs);
 	result = result ?: err;
-	err = xe_gt_sriov_pf_config_set_fair_dbs(gt, vfid, num_vfs);
+	err = xe_gt_sriov_pf_config_set_fair_dbs_locked(gt, vfid, num_vfs);
 	result = result ?: err;
 
 	return result;
 }
 
+/**
+ * xe_gt_sriov_pf_config_set_fair - Provision many VFs with fair resources.
+ * @gt: the &xe_gt
+ * @vfid: starting VF identifier (can't be 0)
+ * @num_vfs: number of VFs to provision (can't be 0)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
+				   unsigned int num_vfs)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_set_fair_locked(gt, vfid, num_vfs);
+}
+
 static const char *exec_quantum_unit(u32 exec_quantum)
 {
 	return exec_quantum ? "ms" : "(infinity)";
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 3e10697d2174..69841b0fcddb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -14,8 +14,8 @@ struct xe_gt;
 
 u64 xe_gt_sriov_pf_config_get_ggtt(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size);
-int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt,
-					unsigned int vfid, unsigned int num_vfs);
+int xe_gt_sriov_pf_config_set_fair_ggtt_locked(struct xe_gt *gt,
+					       unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt,
 					unsigned int vfid, unsigned int num_vfs, u64 size);
 int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt,
@@ -23,7 +23,8 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt,
 
 u32 xe_gt_sriov_pf_config_get_ctxs(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctxs);
-int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
+int xe_gt_sriov_pf_config_set_fair_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u32 num_ctxs);
 int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
@@ -31,7 +32,8 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vf
 
 u32 xe_gt_sriov_pf_config_get_dbs(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs);
-int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
+int xe_gt_sriov_pf_config_set_fair_dbs_locked(struct xe_gt *gt, unsigned int vfid,
+					      unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 				       u32 num_dbs);
 int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
@@ -39,7 +41,8 @@ int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfi
 
 u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
-int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
+int xe_gt_sriov_pf_config_set_fair_lmem_locked(struct xe_gt *gt, unsigned int vfid,
+					       unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 					u64 size);
 u64 xe_gt_sriov_pf_config_get_lmem_locked(struct xe_gt *gt, unsigned int vfid);
@@ -89,6 +92,8 @@ int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
+int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
+					  unsigned int num_vfs);
 int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
 int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
 int xe_gt_sriov_pf_config_release_locked(struct xe_gt *gt, unsigned int vfid, bool force);
-- 
2.34.1

