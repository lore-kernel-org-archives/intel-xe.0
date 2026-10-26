Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D6606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 10:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FJ7HewzZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B367810EDEC;
	Mon, 26 Oct 2026 10:43:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AC010EDEC
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793011374; x=1824547374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iHSAOq99TT7xDTcYP7TrfE+yj0sSQTwfSU2S93Y9SEE=;
 b=FJ7HewzZRiBKNVUYWJQBUDUHJiSqfUa2bE7FhUwgJQDhUo4Uzc+o1/jM
 gbbHyNWbG5V9AABUJS1EYJoind4rV5C1I/s9ylDhyC8IXwJJpmCowM7OB
 13CYeZfX49b2Xyd3D+6MwGrLSSofbV4O4zf1LOxgJaeZI/QfZaXKgmI/a
 tEhvKG1ThortQWQwutKzKDJSoKRrjzfa3SfekNazE5/g6crb2ZL4VNyyO
 sh6o5oizwsWbAI/k0nH5laAONI1DlsMDDP1gZm1QCibsrQ1hhITR5BksY
 XOSPiy41/SP7CSB7jnGMmozwfAK9jyYg97f6iEjAe8/ITzd9bGNyngPko A==;
X-CSE-ConnectionGUID: F9Y5AHPlReGQ+051jmZJZA==
X-CSE-MsgGUID: E/lsoxSSQSCri/4XuTjcsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1569195"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1569195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:53 -0700
X-CSE-ConnectionGUID: imEzut5XQt6cjUIkGPnAzQ==
X-CSE-MsgGUID: SWLdXmMFRyS/oVEQY03xyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4619926"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 03:42:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 03:42:50 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 03:42:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL7o0X6NGqoPAM4zu8AfUylO7iMnZJCNKAci6m3yWWKAc2fLjNkMUFBjL6Bc2xG0g1BWpWvfFHP/KFjS35ulfz1ktJB1dJMXCILw110ayV4XGIo9CuSXd28W6c+Ly2ZkKwWV82IXkx3M/h+bjCyokNsLzrcel5lS7Wv2P7AAR3RYIg9s97/WnP67sYnjq12CBxUqbSy82yM5kI9OQtfT+kpgOUx0/S9KaE1rCRSoDpoiwikWKxFl22RisVo/Tc3NCgsSY+ib1tI6rT3Xx74MCVQNDtTmMgBsy0NnvAmoKyCkMG5xGa5OUCIj4l88+PjIpyqh1q2g0GQyUnGFk+dh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22ytGFDGPUWkvBbuEEsdrNw35RoVoW/OiBhT0zKvPoc=;
 b=AzvpDSfN1W8se5nJpDtRFkf69L7FrKZ9nvDy9im1mVy1aYONZLuIt6Ny2YVnc2D4GpgxNygYn0KeBgNHeQFzjRAdctnlKvPjMJiOBVqG+hinKolefco1PLTwxTVg+zRcOasFHGPz3+Sf4eY3J3w0XM5fGZuIrO4a4j9g8lncWl8FM9GvGdan5NFUpOwib1SSkXFF3RD/HFRjpuiGEW98BueLsVUDQiIo99SuZ+sEzKECEUIo82nLnNnkYwjGaXVtZOyOUzdekpYnpxBETGFU7fyVdQtc67T08iuM6BBaMGfyX53DTQ3pLRrNfHH87hf+aMbUtyr8s9vw2EjgGuCZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by AT6PR11MB044526.namprd11.prod.outlook.com (2603:10b6:170:110::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:42:49 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:42:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 3/4] drm/xe/guc: Initialize GuC doorbells manager according
 to device mode
Date: Mon, 26 Oct 2026 11:42:23 +0100
Message-ID: <20261026104224.1018993-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
References: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::12) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|AT6PR11MB044526:EE_
X-MS-Office365-Filtering-Correlation-Id: 32dff4d4-b102-4427-f28f-08df334de0ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|6133799003|56012099006|11063799006|261021121427099003|261021123027099003|10067099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 2ncjUQZDxVomIphaaGbvv7rHNpRe54Im3tu3G9w0pmdK5JkPankuPp0a1e5l6kVFOA3UbqG6I/tV7LLqyqx7XMOk3Hy6yQbt1b8AFwmez/QNdNAKPMhnFMMbuv6Csv8zawLJmWtC1N7KtYoIXIpLrxkj+O6S5LSbLNc0Oew9A3YzfEJpcl62SxF/yJsYXAOMxAeYKdP+KIkxbah1fCvNBlH9UcaLlqlDDcjwVNYWc8skVSnz9oQfQyUwz097DZa3RtVFrVtbV/6ldiZTbaGvzGZ2xeQM6tEfT8YpQE1HTzfydtWto4L3g1z+LyIMMIZn4rOxgIDlzfjaK3Nr5lYUOj3vb7ZJEYWLmyHQ+EFVrW0LFPwzDoiwyGKklNuneMUXEc1Ih/Pdqah9BUVD2kEfDx9P54+YDEi3zgOhsxs/uop/EjBrQKdR/rT8/cbQ+YM0Fjn/gWXWXyR1xFlGBbK2tuMW9pQvMLR07qtutgIv3DpRhstak45dAHu9eryMFBvE2ZIJHCJxc+XCF98DxxVNMSzdBajzescVHjapw0ZruJ84+jJRpQK80u+MhxCRhIw5kRpr2aSwv+p3oTLCbDicotgTG49F8FJ83T66KrF4NV5ucYSi0Q1E62Efj5RmkRgj28p3Xp32gQFBREE6BcxnokdEpXxmc5TBaSiwkKSDnUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(10067099003)(261022105027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVdqaC9GbllZanJxcGZ5NmJZTkFHanNidGJVY3RxT0tyeU5pV1BkTWRPTWZn?=
 =?utf-8?B?WG9PTkEvUi80ZHliVnhDUFkyODNyVXVNdWg5Rkl2UlBDUUQ2QjdqUk80Nmo4?=
 =?utf-8?B?V2drRktiYytiS292ZkJhd0gvOTkvQmdIUHArYlhhSDZMNnBjTDVwTHNWenFj?=
 =?utf-8?B?Qmx0ZmxpRW5SNWd1NU5NTFhqeUtHNS9oYUt0a2UwSHpVQlpWeEExYzhpa2Ns?=
 =?utf-8?B?U3ZERGFRYTMweklJc3llMExHSmtXd2JDdHhicVNUb2dGQnBKMXNJWUZ0dG85?=
 =?utf-8?B?TmdGZGZuWElYN1RvNlUrcjZLVUMxQWJQcEZSMjJReXhnTlA4dmVLZ0VZTHlZ?=
 =?utf-8?B?WDFMVUJ4N1dIenUwRnFZdXAxVVU1OGVJMUwzT1pZa2FDNFFWRmQ2dlMxNHZF?=
 =?utf-8?B?VWFPUWdJTjdZK21hK1NmSlZHVUgzQnZoeGFTbTI0Wnc1VFg5dEpFeStNVVBE?=
 =?utf-8?B?Y2dIc1E2UzVDUU5vWnFCcmMrMkI4SG9FWnZIZTZNeWhhUnRaK3ZQcnVVOVhR?=
 =?utf-8?B?aW81MG9VbWN6VFBSWkJKY0JDcnZLTjVuUXpHYnF1VU5nTFFDbFhjTk5Cbmk4?=
 =?utf-8?B?enB3Z0JWTGRXSi9lallhb0RmQi9BUVhJREt4M0hLWS9qdFk4eXpxL0M3Vzd5?=
 =?utf-8?B?R25nZkowd2xuRCs0aXVuQkNLY0V1WlZyYUdIOWJrcWVjRVVzK2tZN3B1cExk?=
 =?utf-8?B?WlZLNlcyT1QveEIzeWZEU0hqZ3lpYzl4RGV4Lzg2eXh5Mm5NNGJRRXdsZmtM?=
 =?utf-8?B?cGlXMmhQL25jQ1RCWmxOcGNQcjFNTFlOdVVPRVkvbGRhVTVscm9yaEl0RkRQ?=
 =?utf-8?B?c1JoalkxaFN2SzF0cHZYcUw0WVBEYXRueDc3bUxBekJzMndpb2tVMjFJaHRr?=
 =?utf-8?B?REp5TVo5M1BnYjdXaWQzQWNoM2pOUXRoT1VieWhhOG1mLzdjbGF3a1JHdWhE?=
 =?utf-8?B?bnpRcll5dXhqZ2Q1VmMwUmtRSEljT0x1RVorM0QwNzFjaThWSDVDM3BzZ01r?=
 =?utf-8?B?M1Y1aXpHTGdnL01VQ2ZFV3JVY3I4K2pnVTAzYVJiY0VyT1N4blBaTFJCenU2?=
 =?utf-8?B?ZEM5NFZIbnV1b3FSVGJuaEJ0LzJlT1YzQ3BNcEFxSHJtWVJQa3JqUzZXUzYr?=
 =?utf-8?B?bmVnVzNRbENkVXJPdGlsY0pzcmpEY3p5cHh5WElJbXhiT242TGU4SVE1V3ZQ?=
 =?utf-8?B?VjYxaStvaHJrQ2FJaFJQZ1ZUdFNOZnozaWltbzdTQzZCQWQxUlhVc0Jpa2I3?=
 =?utf-8?B?cmlQYm91TERGTW5aQXBPajl4Y2FtbmkxNmZuNk04RmNNTUlscjJXQk5VeDQ5?=
 =?utf-8?B?ZkNqUFlhbm9HaGhxWmtLbE1mRGpFSCtMc2pZK3ZzbitXM2d5bVBjMFlqV3hJ?=
 =?utf-8?B?VnZmM09ZVjhsTnpaRVNCWDVkaW8vMytxQ0swZmhpNkh1cWxpRE9FbEhoUmpS?=
 =?utf-8?B?WHdKSGhPWWN0ZmpPSGVUK1FYeHQyRWlNL0RtMGpvbkVYZmlhSHgxNnBtUkVT?=
 =?utf-8?B?Skl2a2hjRHRlRCtORTh4aDZLaEZxK3crT0lINDloU3NMQlhMRTg2ZDhZVHZS?=
 =?utf-8?B?V0hQWkVyL1F3WmczSmFURzN6Vzg2MWRiMVk2N2JXZHd0c3Y1Vnk0enk5czUv?=
 =?utf-8?B?V2dJeFhsekZ5MG8xZk92TmtHKzBBVXpHUVZuczM5b2JySkF5SmtUTzQ2T2dm?=
 =?utf-8?B?Y0xacXVJaTJnUUp2cWJ1TmtQc2swRXVTYWZyNnFZZGpXdG9mQ2oxN0ViZzVv?=
 =?utf-8?B?MGZRMkJjZkIzOEk2T0RUZWxndmNoeVU2bFJKdzNlRTBMaW9rU1BRb1hsOVVV?=
 =?utf-8?B?c0MyWDBFdWxud3BPcmtpVkRjZ0JEaEM1bS93RlRJdm16WHU1aDZ3UjRIa3U5?=
 =?utf-8?B?YmtJbFlReS9tZVpJTmZBVTlFR1hCamZEYTdpUEtuS2l2SFluNnNuQnpwbzZU?=
 =?utf-8?B?WFhDejRrRjhqdjZmTjFBS2R3NDN6MHRaSU1vWnQ0b00rMjdqVUNhRmRIVk5U?=
 =?utf-8?B?MldLSmRYWkIzcktod3djYjNvTGFzSGpqL25PaXNEdTZCSzFBTHhuK0pqeUlw?=
 =?utf-8?B?c1pYV2FuMndtd2EzQTMxb0N2STZQcnB3bWNGY3ZxalNTRUdEaDQ3S1BGU0lT?=
 =?utf-8?B?Y0EwcFZVV0YvcjhZT2pPUlZjZ2lKVzNRVWd1SlF5NUtwajNDdDVjSktrNlZp?=
 =?utf-8?B?OWpEcFp0L1BSMHowQ040STJlVytiQzdxdkdKMXg5SmdNWS9OalUrV2tGMlN0?=
 =?utf-8?B?UVFwSDJJdnlXcVpXaGRxRndheHo2U3lHWU1LQWVSd01Ebm9TOTdTVUdIc3kr?=
 =?utf-8?B?YlZaS1kxeHhqbG4yMXdaSXAwdFV5UUV2Qnc1M29yS0xqbVJoeTJ3ZTNuVEZD?=
 =?utf-8?Q?y5ZbfXT9zIgTmM8Q=3D?=
X-Exchange-RoutingPolicyChecked: GZhlPG1TNh4zlovgJA1q7Sib/VIcOeph8lN1s3UzM9C4k7YKTlHYKggcPY63qEaZvncXAtCht7GEmNQFI+sbgDPMJ3PAGrJcM6OpqNrDKSLxGPKj9BrJRd3pxsYZUc19MUrk32S0nuF/lc8+iqCuTnf2A0LJ8quzhXdCIJok91lrLSBpdCoo6gqq9qc1WCUeaedUYjBL4/tsUi2a03KmDCDfavPpGGcD9n7UxSjvQ0IGE68DOw8OcjlW4oQS6kJK0lzumPmX6KLW0oKBKybQKyTKc5CY422MOi47EpEvUXwzy8GluthdzG+HPs9f/kWSJZHkE87Hyt9KN5qSCcxpSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dff4d4-b102-4427-f28f-08df334de0ca
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:42:48.7971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvDMI74gc2lBQsIUfebVq1T72NrWUbpNust9vqtKfLtIaN83H92BPUppT7bVpu26NqFHzed1xYskwwzgbKkqxQb0XSmyW+VLPm9uKW1KQy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR11MB044526
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

Configure the GuC doorbells manager according to the device operating
mode. Use dedicated initialization paths for native and PF modes to
expose the appropriate usable and shareable GuC doorbells ranges.

The VF driver still does not need the GuC doorbells manager, so leave
it uninitialized there.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 16 +++++++-
 drivers/gpu/drm/xe/xe_guc.c                   | 10 ++++-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 38 +++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            | 12 +++++-
 4 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index df882c5b4e698..f5e891b977d50 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -123,12 +123,25 @@ static void test_default(struct kunit *test)
 {
 	struct xe_guc_db_mgr *dbm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init(dbm, ~0), 0);
+	KUNIT_ASSERT_EQ(test, dbm_init(dbm, GUC_NUM_DOORBELLS, 0), 0);
 	KUNIT_EXPECT_EQ(test, dbm->usable, GUC_NUM_DOORBELLS);
 	KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_max_shareable(dbm), 0);
 	KUNIT_EXPECT_EQ(test, dbm_total(dbm), GUC_NUM_DOORBELLS);
 }
 
+static void test_init_shared(struct kunit *test)
+{
+	struct xe_guc_db_mgr *dbm = test->priv;
+
+	require_iov_config_or_skip(test);
+
+	KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(dbm_to_xe(dbm)));
+	KUNIT_ASSERT_EQ(test, xe_guc_db_mgr_init_shared(dbm), 0);
+	KUNIT_EXPECT_EQ(test, dbm->usable, GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, xe_guc_db_mgr_max_shareable(dbm), GUC_NUM_DOORBELLS);
+	KUNIT_EXPECT_EQ(test, dbm_total(dbm), GUC_NUM_DOORBELLS);
+}
+
 static const unsigned int guc_dbm_params[] = {
 	GUC_NUM_DOORBELLS / 64,
 	GUC_NUM_DOORBELLS / 32,
@@ -836,6 +849,7 @@ static struct kunit_case guc_dbm_test_cases[] = {
 	KUNIT_CASE(test_bad_init),
 	KUNIT_CASE(test_empty),
 	KUNIT_CASE(test_default),
+	KUNIT_CASE(test_init_shared),
 	KUNIT_CASE_PARAM(test_size, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_reuse, guc_dbm_gen_params),
 	KUNIT_CASE_PARAM(test_range_overlap, guc_dbm_gen_params),
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1f4e132fa0cb..ccf11473794bb 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -866,6 +866,14 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 	return 0;
 }
 
+static int guc_db_mgr_init(struct xe_guc *guc)
+{
+	if (IS_SRIOV_PF(guc_to_xe(guc)))
+		return xe_guc_db_mgr_init_shared(&guc->dbm);
+	else
+		return xe_guc_db_mgr_init(&guc->dbm);
+}
+
 static u32 guc_additional_cache_size(struct xe_device *xe)
 {
 	if (IS_SRIOV_PF(xe) && xe_sriov_pf_migration_supported(xe))
@@ -901,7 +909,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
+	ret = guc_db_mgr_init(guc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 57b775847ac17..7da37e838957b 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -134,22 +134,44 @@ static int dbm_init(struct xe_guc_db_mgr *dbm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_db_mgr_init() - Initialize GuC Doorbells Manager.
+ * xe_guc_db_mgr_init() - Initialize GuC Doorbells Manager for native.
  * @dbm: the &xe_guc_db_mgr to initialize
- * @count: number of doorbells to manage
  *
- * The bare-metal or PF driver can pass ~0 as &count to indicate that all
- * doorbells supported by the hardware are available for use.
+ * This function initializes the GuC Doorbells Manager to manage the full range
+ * of GuC doorbells (0..GUC_NUM_DOORBELLS - 1) for use by the driver.
+ * No GuC doorbells will be reserved for sharing with VFs.
+ *
+ * Can only be called when the device is not in SR-IOV mode.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm)
+{
+	dbm_assert(dbm, !IS_SRIOV(dbm_to_xe(dbm)));
+
+	return dbm_init(dbm, GUC_NUM_DOORBELLS, 0);
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_guc_db_mgr_init_shared() - Initialize GuC Doorbells Manager for PF.
+ * @dbm: the &xe_guc_db_mgr to initialize
+ *
+ * This function initializes the GuC Doorbells Manager to manage the full range
+ * of GuC doorbells (0..GUC_NUM_DOORBELLS - 1) for use by the PF driver.
+ * All GuC doorbells will be shareable with VFs.
+ *
+ * Can only be called when the device is in SR-IOV PF mode.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
+int xe_guc_db_mgr_init_shared(struct xe_guc_db_mgr *dbm)
 {
-	if (count == ~0)
-		count = GUC_NUM_DOORBELLS;
+	dbm_assert(dbm, IS_SRIOV_PF(dbm_to_xe(dbm)));
 
-	return dbm_init(dbm, count, 0);
+	return dbm_init(dbm, GUC_NUM_DOORBELLS, GUC_NUM_DOORBELLS);
 }
+#endif /* CONFIG_PCI_IOV */
 
 /**
  * xe_guc_db_mgr_max_shareable() - Get maximum number of shareable GuC doorbells.
diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
index 9b611a29b1a9b..ca62c6b86b273 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
@@ -6,10 +6,20 @@
 #ifndef _XE_GUC_DB_MGR_H_
 #define _XE_GUC_DB_MGR_H_
 
+#include <linux/errno.h>
+
 struct drm_printer;
 struct xe_guc_db_mgr;
 
-int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
+int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm);
+#ifdef CONFIG_PCI_IOV
+int xe_guc_db_mgr_init_shared(struct xe_guc_db_mgr *dbm);
+#else
+static inline int xe_guc_db_mgr_init_shared(struct xe_guc_db_mgr *dbm)
+{
+	return -ENODEV;
+}
+#endif
 
 unsigned int xe_guc_db_mgr_max_shareable(struct xe_guc_db_mgr *dbm);
 
-- 
2.34.1

