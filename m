Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A16C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391BD10E0B4;
	Fri,  8 Dec 2023 17:13:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA1310E0B4
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702055609; x=1733591609;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/P7Leh0/i9bq2teBdfaVjfkq3Os9QSFLMJ+bwJOBeIc=;
 b=H2gaOhbVI9AiZyO4DdSfhDiLqzB8/94ccMqdOJJVS4IX3G9EnZ6fg2SM
 5NyLWBnt49F3DkXTpEnJau9cdK4slGfR67hTX/ThYnRahqy5xpyy4ZrUY
 l0mHv6Zx9MMiE9g1IDjgNqLvrDM0PA+FaPxn2rCF72GrDarDvSeuRYS47
 p1H+hFlyGcwDSN7MvBiwRqwnx2tZ+8DDJlYrpUyhJzBHPwM6trHOYZKqo
 AYdc2Pfa9PGyMIPyO0ct3MEWufVbkwRTlaqFvD8COO/oVG6pGPG1zhn6T
 hNjGLs1exvZtSrnYykGUcwsVtmTfJoCpTBRCcACCk1akViGWU1lGQxDpB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="394177171"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="394177171"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 09:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="895603238"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="895603238"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 09:13:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 09:13:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBhMG8grbAv2Dc3e+4KrwrxbX8JI0MGOoKpOXjKvMw4Yt1Gx1g3V6BE4oY91WCKkOng7wv5qCcZFcRDnT4qUG3iiwl5kY103fUlQ9ZyYbMApr2MHfGoUjbmpM1soLFUztewCUn6sEFmmpJLDp55j2h87lP6ndpxjrhFwnJRm9DL6eFJ82JMP/ztjd35ftV4HfLdhZwH6MGls4B4OBdBjXVBZHaCE1eilRi4b+5sEg9wZFHEGKyc3Fb4Ki6LrGuATDscyPUQVoi5AFSyvpZW3oYHQuE+4vueKk1YbfV1g+HEzxYDcoc5hYMflgFgDzSOg+g1EZ9d03Q0GcuErgUGypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsRV7Am1Jg/kLCZNeYfeegghZPzPLfD0lUzcdE2/sYA=;
 b=QHMAYrqI5fNwf04Ct19elSUuvTIVc8DyKe1HOwNj0g8AKOg7daAn4HyQDuTHjWfOvwU2nLuYVnUtVJvHXM8glYPie107y3C1Av154UVh0v/TNPmKYyd0z8jkY7uKk9RE3c/342ACCHx76NqGv+rgafDs26fQAyz6i2xE2PNz1GEP5owt4fSnGwcSe3ht4GVk1ouQmwgTIVRqxSfttAbQbiZcnNhnOASuHGtIIDpVN5vhy6KjCoFMxDqwCIrVGNL8emEsbKBj1pn03aSxcwSgJZg5GVFRbsVEYy6ojs0wxG1Uyjge1EqYMcH8iBmBCyq3gWvuhUFnBuiChE7yW2L4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 17:13:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 17:13:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <ogabbay@kernel.org>,
 <daniel.vetter@ffwll.ch>, <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 0/3] Separate PVC Device ID patches
Date: Fri, 8 Dec 2023 12:11:03 -0500
Message-ID: <20231208171316.901795-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: cecd9768-f5d1-4641-d9ba-08dbf810faff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUCFsG0p0IGbSZWmKoI9yESSPxKDAhwNHKlqFGPTDuTxiRYKLTTMRs/jt1KiEHRLv7iKPlpcHWHhXGlgTf3lXmGnJxpo6hWqE332YUnRyPVk2r7ZVegXZm1WB1k79un73Z1DrxVDANCsbp6bvWw1R/nEjPcx3B4KzccviJ1RkgSbiQU7BKHfpMip2e31Opp/dBnDTtHtbRPvHM164rtrzMgCrreRreqJdyfY5hv+vY2OUELhB0b7KHoy2236U2rBTbSlP3MtZ+tK4rTc7iSXecGced/zvpQWuSglBYZTq3gwHQKutNKfeexwY9GijkuldSPVrchIhhRCPfGLq7SOOupcd6dwFc5AI/d2/kRyjS7QQ838cgZ46KhDep/vQtp+dWjfTX7+fBvnUEVOcTb3y4hLmSGSEK6oBpR9nGqv8opa7daxuu/B2VDOxJFtflx+KSOc6gXpAmEtBGVVH6Y0i2y7YEeCU2mccmpVtdxXsVFwFgmlQk5xvyDhjppgowPbFYOlf09lKtmtPokETwra+MCJ4SWPu+r/Sws/yWi/yPdbdGy5WwUiA2IC/KfyPXg1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(4744005)(4326008)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(6512007)(83380400001)(26005)(2616005)(1076003)(66556008)(66476007)(66946007)(316002)(38100700002)(6666004)(6506007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3dnNUcvVG9uTXdUZ0o2TzVNdlNZN0RJTnB5anZleFRDNVpZSm5vNkQ5Z2Z3?=
 =?utf-8?B?cFhiYUdwenYrZEpzMnZzaUVuWnpKNDhSUEE2RjBPNDBhNHh4SXd2YUU4NlhC?=
 =?utf-8?B?ZHdRaUcxT1MydHRWNTAwN0VndXJaKzlvbnFIUkdZOUFrM1lRZkJiQUxpVUVy?=
 =?utf-8?B?cHV4WDE3R0cvd0lydTdkYmovTGxiWDdTei9xSDhtTE5Hc1hveWZFd240eTNC?=
 =?utf-8?B?SUhWTzZNZGkxdnFDUlkvTUpPYXQzeXE5QzUzcUNTMjByR1IxaTJoZnlSeEpu?=
 =?utf-8?B?ZEVTQktvK2VWVDNhRzJSSTJRSGU0WnJGYzQ5bDlYMGRJTkdSS3JVZ1NUaW9F?=
 =?utf-8?B?RDJjYkdLREpvaG1OTTBvOHhHcTAzSDE1T1ZQVUxTU0JVaEYwcWJ0Q2tBRVor?=
 =?utf-8?B?OGdzT3VDYWU3UGZHS0VmSkFGREhVQkdoMWpQRElrU3RPbVVQS1pjTzNMYTIw?=
 =?utf-8?B?SnJaOUJkN1Ztc0dqOGFwTXdmNG1JVGh1ZEVIamFpUVQwVlBWczd2TFFZOFVI?=
 =?utf-8?B?NW4rWUhXMlVpb0N4VDRtdWRWdjlpUnBkWklmT0NTc3lsNTNEWjJTUXRmbk53?=
 =?utf-8?B?Vk5UbWl1WFgzeWh1OXYxbEUrdEVxaE5pR3pVMHJCYnlVWlc4UG1Oc2N0RnF0?=
 =?utf-8?B?YmtQVVhNSUV6TGFVclVtMzJQUGJrWHplcXNZKzI0SDhhejRSVHA2ZHliT2tU?=
 =?utf-8?B?TzhPRFVOL1E1RVZJcmhEV3BjejFwL2lRMHlmNStlNHJ0bzdRUFMxandrcnBX?=
 =?utf-8?B?aHhpcnBqYU94OHpreFVzUVdyZDNuWFNWckQzblh0WXpnMDBBcWo2eWFiT2R4?=
 =?utf-8?B?elQ0QzBSRWRzZ1hxbVU2THF6WWhZR2hSOUxiOHB3L0c1UHhkcEF4eG02dmZr?=
 =?utf-8?B?RWVZRzdWNFlkWDdjZ0NkM0VrSzlvTzVPTWxEUGQyWkhKd0cyUFVqUTFRZ1pD?=
 =?utf-8?B?ZjVsOXZWMFg3WXBpWmVJRlB0OVFwRFByNTB6enczWHhRNXd6STFnOUpzNzdl?=
 =?utf-8?B?alZkeHVqNEZyVU5jZVJTa2xDVFE4VDhCTnA1VXAwbkkxSzhsVkUwbzdJNWhG?=
 =?utf-8?B?SmgrMWpneG41T3dMb0Zxb3poOVB5emZnSjhJeTQ1Q2E4d2tqdkh5RFFVc3F4?=
 =?utf-8?B?d1FHdWtwUXdpWXZoT3dFVEpnWDd0RFcwY2ZDMW1vSkFGT3NBSXprNkFMUlJi?=
 =?utf-8?B?UUErcFdWdU12eUVjdStkdnRZTDd2OFR2SkNSYUxhd1FQZmkyeUprajZpQjVo?=
 =?utf-8?B?blh1Nk01OGVHRklrRVZqeUM2MU04WlJUKzAycERHNk9NUklhdXhLS2NtTy94?=
 =?utf-8?B?bkxtajZBZHNtQWZ4eVdMSTNlMWcvZDhLTDNIclV3Q2g4M0JuL2htYkN4Q1h0?=
 =?utf-8?B?cCtNRzJVVVhuY0doTS85WGVKSFZ1bjAzZEZweWNPTEVJZHVYTkJpc1d3eVB4?=
 =?utf-8?B?bkVnYm9Feit1WUU1bjRJRHU1c1ZxUldRNTREZzkwUE9tS2EzV2VTVllLbXlH?=
 =?utf-8?B?bHFVVnZrV0x2Y00vYUtIay9kYVNvb3MrQ1ZWKzd1NGw2TTVwQzdWYzBwandM?=
 =?utf-8?B?UHM3NTNYR2VFWDVjNFRCMTlCNmVWemY2YzJQTFAzR2gvMm5BcDdPdisyNmdR?=
 =?utf-8?B?ejd0TlBrTTRmVi9CVmJ1T1NTN0VyMTVhd0dwTDNwK1pYaFZ0ZFdibm9LMGhn?=
 =?utf-8?B?OTQza0J0OC9GUHhsUHU2RGdNU0srRDRCRHdyMDU0eU4vaXpoQWh1aldFZnhj?=
 =?utf-8?B?cGZYbWc1aG5pd1VMUnZLNzl2U3FjWFpIcER0cWJXaXRENkZrUUVTaVdEZWxB?=
 =?utf-8?B?UHZRMlc0L3JFMWRkS3lTZ1BNdXNsbTBaNnRzSzJ3Sm55ZXBhSkxia2VUOUVt?=
 =?utf-8?B?NlNUOXMzdGVpV3h0dEZUa3dGMFdYdmZjL0ZiOUNvcHR2Y1RrbVFqdlpXMmZz?=
 =?utf-8?B?TkZ4OWdZZWdvckdFM2pHaDNCTzYxM0I0SWtpMDQxUG9sWmlFQ0EvaUNjSzhE?=
 =?utf-8?B?ZXp1RE4waEpwYkFVU0dnb3lzVzIvUms5aWkwOFdFa2lvMS9EaWNjaFh4K25k?=
 =?utf-8?B?MDZqakdTNVBDVWdIRXJWT1JPakNiamxnL1ZUeVUzQVYreExVNERtQ3RZblhX?=
 =?utf-8?B?SkJUU2UrVXl3L3ozYzBBL04vL0MvRG1mOE42bVFjVERON0R6VU9QZnN1QmFp?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cecd9768-f5d1-4641-d9ba-08dbf810faff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 17:13:21.8516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ui02JXddfEwRs0l3oc6xT7ejtR2KTQ0vAA2dZ6n9Wu5B1DcGGUwAemrFlPTx5loBgCEqdEbupAzzRtf7Q7wNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For now this patch will be in drm-xe-next. But it shall be out
of our initial pull request.
Once we are part of the drm-next and integrated branch in drm-tip
this will be a topic branch in drm-tip.

Thanks,
Rodrigo.

Rodrigo Vivi (3):
  Revert "drm/xe/pvc: Add pci ids for PVC"
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  drm/xe: Add PVC's PCI device IDs


-- 
2.43.0

