Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25118CD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 14:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2C10E3C2;
	Tue,  9 Jun 2026 14:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hhY37afb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B0910E3AA
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781016268; x=1812552268;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YB8lYhARfoJJeEgrxtSPYi8Q424xtZ6icyN9mtp/130=;
 b=hhY37afbxr4gAFPjwVkfVbe++MYyTHq7gDx3KXF1QDihjZRXHljXEDbo
 nVq3ZUANLfu6pQgqo+lnrnCo9rDah2Vmli+qKqLl8WygZui1CqGEeHmPP
 cW2m68VqBVqFLjaSULc+iN0KTiEAzjU+JL6qpiGCfD5gUcGE/l0Fdmc6A
 KbhR3ublh7NfUH2XnGEMrhVG2OB/I7Lc4/uOzxot4mgL4IhCzM/504gzx
 QrLVFGIvVidCAASoVJBTjjZf3erejsbFb1T/cml5Nz4ls2yxO7/AsKK6M
 Aq3H9/a3h7gkIN7hKGHlKqNxRN/14N2zaO4ZS2I1/0ulhMWGhlgp8Wqxk Q==;
X-CSE-ConnectionGUID: jNwpRXl/R4u8tguWuF3vOQ==
X-CSE-MsgGUID: UlRjn1EPQ5CekoJmli1n7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85401776"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="85401776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:44:28 -0700
X-CSE-ConnectionGUID: ClrTA2r3T8WtPC4ujbJOxg==
X-CSE-MsgGUID: foRuDzhrRMa66r5DV60TvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="249805536"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 07:44:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:44:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 07:44:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 07:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1JO5p3osp+UXVPgasy6JHVZeuGeE73ep+D+TuR9y1viQlte3fCQF58r2rnzuYNz7vzR3R7BGWkj3t95YntgLPP0furMZfCyryyVyBWchgagyM2EcfUZDo9mjc8gSSdphhYioie8pHj7rJaZS3aOqfOKNGx6xUTBUdTglA0/55DdsE2iTIvazPJUhdKd9JMJ9i4u4y/7YpXxQbkuX3XSnCRfgUwYhFRFqNhVO1LaF/5ySrd5K+6w69+5djzDcNhYKTu6Ppei4je4H7ZqxK4y9N+sQ8m2kdXcIbZ9w7EW9Uf9e+kMNYVuqESVAXCj5AIRRm5NmWqBElGc1VwefwBr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3Ao+hZxurn1jlbIevacpauIkMNvJBjWUCjtk7/ZxYY=;
 b=Ndz5R6mlxiwcRIsU9mi3iBOfMu2KeJBt03vLnaDst+53at8ler6bFTvOB4cQmTWcYQhABj/QmG0+Ptjx1NfTOVmc8XzRUwifwTKQ1GhidjSPHKAMnNMny6ItWDpD9DjcEdGU7EllflvRMHZx5fnGDEOuW71m8jQcY54/59eWQqPpM9UYF9l/C58Vxa+54gUoXCoN4SF00BLnqaS/d70wGyGfjVlDiizVu/E4KQRCAzW5v7A4iunJdWWlPJcIn+SWIb2kun2/sC4MhZJ62JeJ6kbptYMsdbZoYnvpPUTQ9M98vZC+juaVJ69RONN8U4VdlHq/upl9+21L3B0Kap2/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DSWPR11MB9929.namprd11.prod.outlook.com (2603:10b6:8:39d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:44:19 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:44:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Sanjay
 Yadav" <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs and
 kernel queues
Date: Tue, 9 Jun 2026 10:44:13 -0400
Message-ID: <20260609144412.244678-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DSWPR11MB9929:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9e6cbd-d09b-4508-f1fd-08dec635968c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: j2pRlrLIwRKuFFGb4dVOG0wAnyX5tX+wRAmJSRMg8tNxmIrsgOKrcvfGWX/FN0S0agvpXb5BfBct5k4xQ9TKWzyPJZ8zwSoqaZ2Tvuq1kd2wJFrls3yKO26dyVA8t8AiYzGwUg37kJiKbFyaoNGrNIZK6nYVtWLeRixyze3WJ17G1LJleHfJYJ8iCecZLBWksg5SiKNkcHayHm3bpHYF1EhTXuBMDwXaoFRVupUcpLwWV4OzHivLLjnvD6xNfmd5+3Y6SzAg7Lmwi+3F7a++ZDkOzP6TDJnUlXhoJcANDu076mmtgbeN9D0TzDJ/658xiBTLX3aceSXqLwRUSs5ZWEbUOyqYshLIWI/jX4gMVjpza/mgclC/C0O5e2LpPJKR/aUTeZFMZcBgpLqDAFMuUJlkhVfsOXlRue40X863VFxwgajC87M8j+yAr0mhifo4viOPcZ/bt/YKK/x/mF2gWK9760gDIzuSkyp0Hwn4BxJp9HYX0lEYNI2sRw+4AtVClvpWsHoWIc8ogO8xM8YQ0m+Mr0JAEZMKv30LOWpYDrrbkwtbtYcDULbpVBzPXVhhtWCO3yVrVHcf5CvhPAgsWCqMVDu01W5xbj/pt9OJvZCN2zZq04bJazjmweHEH+A6/plslfEzKPHfENET8eK3FB5/LZIaM7KGxs0xv+jY0IUoO8wlcuwpaXC6SNkpZBoz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZ5UUVPenBzN0ZOODBvWnpPVlV3SjFPRXlhL2gyc3QzdGhRUGg2OTNOaGdt?=
 =?utf-8?B?R0YrMGxRZWptLzhPbzZFTFZEdnlBNjhva3MvK2QzVjhEbTh3dTdPVm9YOHlk?=
 =?utf-8?B?aXEyWE9sa1daejFPa1BHbGxick40V016b1RSTzNYdGhEcERmSjhrZ0JMeUJQ?=
 =?utf-8?B?emQwVm9MUnJDTWhMKys0VEN3a08zT2d6TW1wSk1VanNlQlJsN1FsNlM1VGVX?=
 =?utf-8?B?UEY1SFg0b1hvL0kvcDdPMnlGNTFMMjAraUtXNmhTdnF4a21SNnJ4b2xhbk9D?=
 =?utf-8?B?ekVYUDV1MWxlUHlTKzhWUmhSZjhDdjArM0llR0hvSG5qNWpMczlUaHdKakFF?=
 =?utf-8?B?bk93Y3hiSE9tZVYvNDVWUEx1b0dWOTZtK0pjV0hNMk9tWE9YQ2RYYjRVSjRr?=
 =?utf-8?B?SkhwRWU2YU5ORTZNc3B5cmxTMVAxTVZYOHA1VndCdGp5MW5ldFBKNkJRNXcv?=
 =?utf-8?B?TzhRa09EVElYNWtsUTBJZXJ1dFhyU0R6bnhmNVBaNmRMbTRVdThvVFFHQTJD?=
 =?utf-8?B?TUFyWmNEZ2t2WDNCOVNxcjFBQURKVmh3Ymh0WFA3RnpvZTNNR1cyaDF1d21n?=
 =?utf-8?B?Q1dMYmFKY3FkOVh3Z1B1ZFB1VGNDZWdBdzhqeDAvSVY0VlI5UFVXTlRKS3Vw?=
 =?utf-8?B?TVBBK2JLVDdkNTFhYTYyczNRc3ZwK2ttWmU2TkszR3ZTOVJGVnM4V1JIbDht?=
 =?utf-8?B?dUlZWThWRWlIT3BrWko3NTNTSG5JQ2JvdFhyMTBEMnVnNDBBcGREcHM2NmVu?=
 =?utf-8?B?d1JNQWxnR1FSc0I2a0QycXR1UDRqdWJzSkFsTytCTjNIRWhOYjFGMHRqRkRa?=
 =?utf-8?B?aWpNbzVmWlRIaExNMTNXQnNYeE90R0FTYytNZFQzME5qL2lKNlQxaCsvaVdM?=
 =?utf-8?B?TjJDcWhVdUl3SEZNVGdscGxEN0RQRDN6bWFtazRMdnhWdU1hU3pCY1BxSCto?=
 =?utf-8?B?TmlVRTBIRUw2ZTNRU0pQL1lmUTM0NzJKcldpaWlaVGJWLzZhRXZWdUVLaW9j?=
 =?utf-8?B?TWZkb3lRL2cvR0Z4Z3NEeVZ3OVhjRG00emxVRnV3TUMyeU8zRVFpYkltVTV4?=
 =?utf-8?B?ajVvTlQ5SUhYWkh6aXpiNFZWMDNQZWJJRGNXNzNMUFhhNWJvRjBadVVvU1Nl?=
 =?utf-8?B?bEVTTTB0bTk1dmtIMWJoNUI3MHlkMzZyajg3bjVwRkVCTkNveGRUQjJlL2hJ?=
 =?utf-8?B?WG1tMWVlRmxKYTdMRW10cTZxek4vVDBleHhpVGVkc1VwSnM1bW11WW9WUXUr?=
 =?utf-8?B?b2RMZ0xDWVdWLzBscDRzbUx3R2l3SWZGMXpyS2RqbUJqSWpmb1dLWUVjaXlC?=
 =?utf-8?B?TSsvY1lCVmF1bEV6L2VkbmNlTnp4TTFJczF3OHZrYnU5TTdLbThvWE1zc0sx?=
 =?utf-8?B?NXNuRmVTb2hOZXdoKzV6cTU5WThZdlpFK1FkMjk3TUxiU1dQZmNvOG5ubVE4?=
 =?utf-8?B?NmgzUHpBaU80TVN5UkdhTmU1a0lVWWVRNW5XMjNDQzliZi84dXZuczBMQ1VB?=
 =?utf-8?B?VkpDWmhDYi9BUTk1aFdndjdaWXhkQkhTOHRFVVp0UHpadWFWS1pGQVN5RDJk?=
 =?utf-8?B?cDF2NUNIbnVva3NVT3ZtaTN4VGtHUTk0SGVNT05Pd29ZRTNWb0xMVDlNb0p6?=
 =?utf-8?B?UXdHd3lvK2ZvUllNMmtzdTNHNko1enIzNzhkM3FId1Y0UUd1RUJNSjRJblNh?=
 =?utf-8?B?R0FXMGF5VnFSR3RxMUFVMkVlYk5MdWI4S2Z3NG9nYUtmd0FGR3pmUFZlZ3g1?=
 =?utf-8?B?UlFDb1hjSUY2Y0llN01KUlRTcGJMMlJ3MHplTStQODZGeWthendLZDRLNWRq?=
 =?utf-8?B?VFAzMDR5QW9OMmlhdVNFL002cHdXTWZkTjR3dlhFeWJaeS80RVNxMlcvMStu?=
 =?utf-8?B?d3dMMGdxRnF6UVdGdzdFUUNuME84NEovWi9aZHFHdEViNU4yYkwwYmovS2xK?=
 =?utf-8?B?TGhSbVh4aVlZV2gxNWRiQTR0TUV2bGtLbDBJdkMzekxhcFRHTlgydmNNMHhx?=
 =?utf-8?B?OUFITFRlSW94cE5scHg0SVhBY0NMM3E0ekZidFRpcGVLWk1XcCtlOXJndmZn?=
 =?utf-8?B?Y1NFVDVDZ1ZvTjdTS3BVZi9zanAzNmhBR2lVRGg4aWVGckpSc09WbEVDY0Zi?=
 =?utf-8?B?WFM5S3QxME11RGl6Z2I4QjBIYm0xYTNidjJCRnVBU2thTEZGcTdESTlaZVhE?=
 =?utf-8?B?RXZHV0oyRHFiSWpWbXdRTG1laC9zNXgrNXhNbjEzK0g5dVo3WFFMNFYwOWMr?=
 =?utf-8?B?bGFPRHU5aDVzenN6V2hBRHFJb3FOU1dVQkdQYVc4eUl1Nk9ITzdGRUc1ekJh?=
 =?utf-8?B?TUVWdnM3QUtwa1VHL3lSc1NrNUtDR1V0U0E5YUp4RE1hbGQ1SDdiZz09?=
X-Exchange-RoutingPolicyChecked: WnQrSNZKC8VICYwAMsQK0oMR+Un0JE9/fOHWTckx10YjcvZBwTjGJkz0paZhLpSm63OvfI2CZos2xIITc3nuSSRFCZSpAkm0+IaorbqQpfHNnoaiSFYsTq9Pk99cI9uaLZZGHZ5HSyO6BV8dkrRYFmPTP7DHGHXO3XLbeYNf9dNGAA3kfhnHwJGlICIsXD7NA2bekNt0oaaTlScsVOMOUztU/0bnz5my/f5fbjuRKyCowzNyHZQ7djZgFAgk/Bz0uab45Q6GfVXUBfnpk8srf9RrG5fs+kpoge4dlxOcLgweFNUTT26cS4vCehxEee61hnQ+ViOawW3nnZu+EiS6Tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9e6cbd-d09b-4508-f1fd-08dec635968c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:44:19.6310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X30oIXWZbMUZ584ZHwMwU9KSJmC8VlDR6rNQ0QS81oJas/VtpVsyr42WHfmJBfwL1/C4+O5gieoUW5x1pStTAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9929
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

Jobs that GuC never scheduled were silently errored out instead of
triggering a GT reset. Kernel jobs that exhaust all recovery attempts
should wedge the device rather than silently fail, and userspace VM bind
queues should stay permanently banned rather than being reset and retried.

The queue is banned early in the timeout handler to signal the G2H
scheduling-done handler so it wakes the disable-scheduling waiter; without
it the waiter sleeps the full 5s timeout. For not started works the ban is
cleared before rearming so that guc_exec_queue_start() can resubmit jobs
after the GT reset — a banned queue would block resubmission and cause an
infinite TDR loop.

v2: (Himal) Do it for any queue type, not just kernel/migration

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 41 ++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4b247a3019d2..5c40eee41103 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
 }
 
+static void clear_exec_queue_banned(struct xe_exec_queue *q)
+{
+	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
+}
+
 static bool exec_queue_suspended(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
@@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 			   q->guc->id);
 
-		return xe_sched_invalidate_job(job, 2);
+		/* GuC never scheduled this job - let the caller trigger a GT reset. */
+		return true;
 	}
 
 	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
@@ -1460,6 +1466,12 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
 			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 }
 
+/* Unstarted jobs (GuC scheduling failure) and kernel queues recover via GT reset */
+static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job)
+{
+	return !xe_sched_job_started(job) || (q->flags & EXEC_QUEUE_FLAG_KERNEL);
+}
+
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -1608,19 +1620,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 			       q->guc->id, q->flags);
 
-	/*
-	 * Kernel jobs should never fail, nor should VM jobs if they do
-	 * somethings has gone wrong and the GT needs a reset
-	 */
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
-		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-		   "VM job timed out on non-killed execqueue\n");
-	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
-		if (!xe_sched_invalidate_job(job, 2)) {
-			xe_gt_reset_async(q->gt);
-			goto rearm;
+	if (!wedged) {
+		if (timeout_needs_gt_reset(q, job)) {
+			/* Retry after a GT reset; wedge a kernel queue once karma is exhausted */
+			if (!xe_sched_invalidate_job(job, 2)) {
+				clear_exec_queue_banned(q);
+				xe_gt_reset_async(q->gt);
+				goto rearm;
+			}
+			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
+				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
+				xe_device_declare_wedged(gt_to_xe(q->gt));
+			}
+		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
+			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
 		}
 	}
 
-- 
2.54.0

