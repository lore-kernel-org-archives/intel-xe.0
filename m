Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432EBC07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 21:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172DC10E67C;
	Wed, 29 Nov 2023 21:47:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAF910E68A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 21:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701294444; x=1732830444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wup/SocQBelGsmnLdSOr+lTRrJ9iVqQghyxkNHM3wes=;
 b=OxhXDogFu0CkOfVT571ZOCr/rnVlb46S8RhVse/CvIGjOhSAM132+edW
 1ZUU5SlmSuYJg0uhtrCgFLcDeXxx/nxRXx0OF6nk7AsfcCpqfebDMpvma
 OyQV4kxN7+2ZQ6AA820wP/euM0+p5qGFdIL0LTOzT5DlTqL3OsbYg49v0
 57QP+X6JhfXP7QIdmr8cwdLqHKam50GosOQaBLtGK4sQf1ANfZyVq9y+x
 sT+m6kQRYyG9ofV9R7Ni/ZSnen2zbL3Zif2Y1JgA2EvDZ8J1ZJOB8y6HN
 P4nRmgsJuS4IW3kCJRFAhn3LNwiVnajXngnt9NVi8FV8Xpb0WHQpKMRZx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392975305"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="392975305"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 13:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892584415"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="892584415"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 13:47:24 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 13:47:23 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 13:47:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOSopolC23coawdsk3YAqj3ks0NbH/cU7hRfWMYIPVKOntQYyPkTljFNds+0LGjVwDt+4/Lx5N9LAR9IciL/qT7CpO3pPNHSXIr+hqzEO2RS4rXDEdZiNIVbmKdpB4SRQMUQ5wOwWQo3voDiVKUHB5UZRr3QLwV/XH+q7Jh7WZlk6lZXiu5OQhUi/5DDDV8XxRqjVDVjUoxzNo/i2AcfPo1saO+wu4RkNsJxXUZh+Hn9/ucDz4k2LGFzmUR0A9JGGPfH6t5jqwaycz4YhyIGLPonnks89OqL63mvKVnHaD68PU6VBcr/WcLluNIdw2lNskyq1eOIQHY4niSBito+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1FH5lPQCxrSM3Y64osluVm2eTNUtmDghK/HI7w7MOo=;
 b=EMmS8NfgSj+Hl8apxxkq7PgSd3bVbqd53vXRrZFB+unze7EE5Oi1uiBtG+/E05UoA4c/i0hMWkepVdgR/xVCpRUh8/vqe1MNOWCPZNVKVUYtgLqvRc61jAmJcf6npf8JDAXTtVR/cT3+1QUiB+mA6YN4dH06ouStMbhbCdYcjp/Q68nAmEOHwavit5ZthH39rtP3WfMCtT3B1izZWz1NJT52Qxtu1lDXWXkzV+vb00IUGLK7C8SJaS4UCOvhHP+dbFJabvvHYN+AmuN4GsbyyWRTYQVTNK65itM/JLfc06+TsmsfwvKumK1GnkkdaZ9Up588itdYoqgmT7pLMkaJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB7926.namprd11.prod.outlook.com (2603:10b6:8:f9::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 21:47:17 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:47:17 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 22:45:07 +0100
Message-ID: <20231129214509.1174116-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4b7f33-3b3b-47d1-ac8b-08dbf124c1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hfj42v0Rv5U+yumZr93A/mwlupFYv7cMZnTHNTqwlTZzsCzqFI+Z19/h4Z1lPLkYxLoWfuo3U+VzFQyeWIhQq/iU+xvPZ3GSbr/4cDLsrSRm/GFxZ7f1K61yxaWsje0x7TPOPnfdOGMtDkLGlmyDBEEKGLXR5ALHFAESMzZirJNdsuiYTMuEwxZ+bORo5bcPDv6xc9Do4KF53yx90/6SKJEjGba55jKrrVFfMz1oaRE3ppDBvULgpcz9EqsONVPMaFlCaVAl3mrQuMdOjgSkp+wOqpghJehRj4F9NLDR2SYVU3qgMjAOK+xB9Uy7H1GF4JClfuXrEhBEl1HgK4s8ZSQ+CtrJimHaFC9ZGHdUUsUvtNvyL0yFKSK64NrFqnP0rGXyXRUBZNe03uA7bICINe6g7RlAVpt8n12ga3WY2NPPwRvnqaAa0xC544N01bhikNza0NEBagFgNON2CyPbXf5J28Lq8/dq9bHbmxRg8vkT3pC09ouHZWfVK0HXITa3GinYECWBsHRyZxxX58GDKUoBm8hCk9WZHb6TooyCDOxnh9Sj4uybTMXmdr9RoDVauXkZ09GpP+vnINFtcRUNPJnrvathL4kpMTR4oyayW0RLisag4+awKabLHP91H8CZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(26005)(2616005)(1076003)(6512007)(107886003)(82960400001)(36756003)(86362001)(202311291699003)(38100700002)(83380400001)(4744005)(5660300002)(2906002)(478600001)(6666004)(8936002)(54906003)(66476007)(4326008)(316002)(6506007)(6916009)(8676002)(41300700001)(6486002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clJCRmY2Mnl6T2xrK2FNcDJmM3hqRVlWamQ3SWZBeENxUWRKUFVzclcvWThu?=
 =?utf-8?B?Vk4wRVJza2QwWW1XTFBQeEs2ZFJtTUtXZXFXaVN5eVozZzljcmp2SkZrNTNr?=
 =?utf-8?B?Y25ROFZyak1YbytSL0V0WlJCSlk0K3UrQXhUTFNjWG5CZzJoaXIvQS83ZFdh?=
 =?utf-8?B?bFpZTFZUQnZuZ0VMUGIxUDIwQy9vMVB0SWZ1Umg2QUpvQ3RYZXBvNDVYblJI?=
 =?utf-8?B?aDEweC9QWHV4anBSUEZyZkZ1Z3Z4cm1lcUo0em8rUWh0cUs2VFlicC9ZV0Ri?=
 =?utf-8?B?VkFpdktWYU9NaUpVcUhydHFMKy9kc3J2VTFxLzk2S2dsUmZnN3AwNzFGWDZi?=
 =?utf-8?B?QnQzSHNHOEF4SWIyUzR3NytwejRISFd2U2t2U1RDb2Y3RytibnNZdWhqTjVC?=
 =?utf-8?B?dXFHZ1FFVlFKdWdqNy92enRMekhnRFBmS3ExbVdwdkp0aGFzL2lWZkF5TDlh?=
 =?utf-8?B?QUIyVEpCcU5HR3dxU3RjY0pvbnB1akZHU3dJWHNtMHBkTXlYeld3c0wyU1VS?=
 =?utf-8?B?UTN1enltcVhqTW9iYVQraWRqbU9tNGFqQVFFenJjaE5pOHNLVnJseW1TcUtq?=
 =?utf-8?B?RlVWMjRBbU9IZTJnd2QrcnNhNW1VRUhHbUQyU3dHZDZJOEJLQjY3ZzhmSUVF?=
 =?utf-8?B?Y2JLUksxWXV6d3d6Y1FveTUrQUxiVFcyWG54WGdIaHpFWmdrQjIvRGlNVTJw?=
 =?utf-8?B?RU1KV0t5aERhd3dVTXRZZXJwcEdiS2ZpTU5qYmpBVXRkQStiYUFMY08rY3RU?=
 =?utf-8?B?UllRM3RVVmd5OEJZanlETUIvMHVrd1VVeHIxbkNya3l2RVhObitubE1HYXo1?=
 =?utf-8?B?SWtwZlhsSmQ2TXNJOHdWTmZheFlscDN3czdIMGRsWnZQL0dSTW9SS3dGSGVJ?=
 =?utf-8?B?SFE5REdYUnBPMlBSNlV1NldQOWRPMlZjbjNicWV6NkRJNkFrNjloVDNjWGlk?=
 =?utf-8?B?RWJVRlZoZjVoSCtqMGVqam5xb1FHbnJIOHZMbW9JazgyNW9BS21uYmxQbGYv?=
 =?utf-8?B?UEU4R09JOVlpNnFoTU1mZi8zU0U5TC9saDFsSFhUTUFDSWRNWmtWYmVadE8v?=
 =?utf-8?B?emdUTVZVd3B2WGVvbXBTOWVkSkJRdEQrcEpuZmNEQnV5WWNEaTlzU0ovbXB1?=
 =?utf-8?B?WmM2ay9MZWErYVo5OTluQ1hENDlVdXI2RWxKbzR3RHlUK3RVRlNTSFZNTDF3?=
 =?utf-8?B?TGpIMXdPWnJsNDlqeFQ1UnFFWVZqRzVJRkR3Tk11VjhZUm5vbTlxOHZ5ODdL?=
 =?utf-8?B?bk1NMEhqekt5SCtteE9DVThRWDZRRlBtSFhPdmtyaEtKL3Z2NWc2TVRlS2Zr?=
 =?utf-8?B?QmJqb0dHLzUrNjUzbExaR0U3L3VBVlp3RERzekdnbG9TLzRkc2dlWnVGdytH?=
 =?utf-8?B?Q1g4dnFsVWdISVgyeDhKU3pzbDVhWWwzZEp1aXJ1T0I4TWgzNms0aVk3ODBQ?=
 =?utf-8?B?NFljNjJHWmJoUGswRGNxZkNlY0t1aUl1ZStwSFFyQzcrU2VoNGdyWHB1Z09z?=
 =?utf-8?B?VTlTZnMwd2xHaDJWRGgvQmVTK3N4U3ZXcElwM2ZMejc3VU5WTWQyek9zMkpu?=
 =?utf-8?B?dktHOW4xcktoVE9JKzY0MVFpQ1hVQXNlTjh2b2dncjU2TXI2SjlEbEdKS2VT?=
 =?utf-8?B?VllsVE5XeDFqMjZOVzJDSlRTNHQvU1ZnbkNHS3JPS2kwY24wbWpPZFF1K0l4?=
 =?utf-8?B?ZWZ4ektVdG5Ba1VGNWlsRE9jNlp5WXpsYlIvMGFTclVyR1g0RmdsUzZYRisx?=
 =?utf-8?B?aVk1Q0N4YUFTUVVZcEJTeFdJNGVtM2s5aDJFYnZqcHF6S1ZiL1dMV0RVMi8z?=
 =?utf-8?B?TVU0K284cm15NmV3V0MvU0VjOXViZDdTYm8zYTgzS1J5RVJmbFY1KzMxclEr?=
 =?utf-8?B?cHlHcXJPMXlTdGJPcWZneFdZQTQ4emoyZFkzSURweWhKc0NVaEdjTDNjVWp4?=
 =?utf-8?B?M0Q1RGFBUVo2eCtBaG1maWN0RWNhMFdWSHlaRXNSdU5VRjlRUDVwTmdEd1Ns?=
 =?utf-8?B?RmtvYzA3T1pzblBYYUNWV09YakRkUWF4S1dTanc4YjM3T0lGNGlva1V1dVJz?=
 =?utf-8?B?ajR3V3Q3dnBSSisxVEJIOXZoQ0JmUkgycmxQRVAvZm1DaVpjejI3akJCcHIy?=
 =?utf-8?B?MWtISW9sYTZzZXdzL09SMUVsTGU4eWF3bFViSTYxK1dXUHlCeVFYemkzR1Fm?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4b7f33-3b3b-47d1-ac8b-08dbf124c1ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:47:17.4488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhKY693uC+rBBYYsHfv1bevrY8ODYSFt0c5+ugW8rmQ82PKLSZmNHWSz0uRQxCwbDmnrj+I+fPO9lp2MkH55IN9LcAORGFLrWsAB3UYrcyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7926
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 12/14] drm/xe: Move system memory management init to
 earlier point in probe
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC will need to be loaded earlier during probe. And in order to load
GuC, we will need the ability to create system memory allocations.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f4be4b13a506e..dd56a8c3f80d4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -413,6 +413,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_mmio_probe_tiles(xe);
 
+	xe_ttm_sys_mgr_init(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
@@ -441,8 +443,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-	xe_ttm_sys_mgr_init(xe);
-
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
-- 
2.43.0

