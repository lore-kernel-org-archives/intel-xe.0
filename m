Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F237CE7AF3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70C310E143;
	Fri, 29 Sep 2023 20:53:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C1110E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020810; x=1727556810;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=j0MGxFsJz13wd4X2afGAZnosr7NUYJ0cfl76HbDjlyQ=;
 b=H4B7kh496RyYJec3I9rRpIsg5uMH+/jUwac3PCJKn42WCFTslDq7vk85
 JI2RD85V1ju66fK/6HoVLcEnRi9K5roRGiW3Drl+6ujGawUZ+Y/pKmvHB
 DEYWpK5UkMFg9Lh/YpPDF/ojIrbDuppL46xlTtIfH3a3Rbn2AqR7AtoJk
 G+DmSimMTPOScF8pkdvEuELw8jmDN0MpQacmsodpM4b2sCA7mJkw3nUSw
 kbpdGlQvzYi/grdiWLlHfo0+MmPFv3Ta6oEcqiwuaYggkT1Y3ctSJFqVW
 s1ll5vFNrVZ7CA82u9SdIpvTpJX1QBTpmjFQof2koo7OakQPxX7F1wiX5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413278220"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413278220"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865825734"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="865825734"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:46:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:46:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:46:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:46:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpnnppJfd5B4I2jvLdxs6P/GxrHHoDs6t0FRbQBziHUdE96FiSw5WkVOupxaPNW+pgi7dyzN/VvGjR40I9WcOJT0q24hfhtRka3Xej/P1GZMpWEtTFbVaP6k2of3uFKUQN9M8PVPi818IqdkNWWYgXFfxDjwvyDsnWNZaZ4WiObG/uaAD+yvOKq2cL+/OSW5NWlIH0ASQQAw14/9JrGC4KpiffNdcJethN6qJ1cXMxodBgpjrBFIsZaTYu00AjhYabX+1BHMCnnOBgDkDcNV5rEkYFLi1piXAOWuoMu5y/SruGtklnPMynhI+/u2zkmPK8V9NvR85+MGPsFU1bIyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8zBgTTat8K9jqaIE9wdTwUB+mGPs449cGgYqSW+RKw=;
 b=cLbp4aIbGeIXbWsI0LMwem3e1FkZXSzHOndy3rjMWzg4NI7xCPShBsTbTS3k86pYeFWXOdOaVk/hSCPXLw+Icjpp22W1b+EG4pcgqU1XsaW0HKu5Q1C7K0Qb+1M73UiI1s/xa/N2g4QUeE+uuGAPs46w1MD+bYb6l9Yw8TvRRVwIlw+/xTsruA5S62U2vJ44OwgSdPKAzCkNUeGE9/gw0abes7yEChIE3PQx7OWcMUMnKqZ2G6mIZCMatgi1EyqdeWCWXnm7WhbVFaGRg25XXcxZmk7/gd1zMg4zDxoyCiTHzwEwdcSEKGTV6nQJzx5VXY2OgMqqODPKns+NWH6NOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 20:46:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 20:46:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 16:44:07 -0400
Message-ID: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a0876e-8c5b-49aa-f761-08dbc12d36ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IdN3NMnXc2CuBM6auQ98Q4shwdYuWElMV4kvYEE3MznTjpQlW99hH+bICrvajUzToESRapdtObdb3uOgoIBlVObRovjzDpGW05vexpkFKZdKIfw4zSe/f8RLk9TeZnW1xqETjaWM6SU9vFvHWrCuWmZJK1IPMQKxVnhSSxRvltBWRdFcHr2oulfDga3zhtLS3g3igLqtrJMqK2Qd/CsBL2kO5XBjRZhmCZ0OXcxoKu1vvDf3Ji7Yo8yVyiMEK3bwr66TBtIZlw/1U3XTejEUqW5j2cx7Ba8Hu1UBTwK1fnU1Qe/OgKksDbkYdhMBAUFUXmhX70mOmjdVvwm9vOMzsWplrZRKmL27Omjt7Y37iaKmxIXznU7wvLdo+/b2+5+rHihynsg79Yp8HF6exHBlBtJdLKI5NUHQSXVr3ouJ3OA6iENlzIF+G2FuhKeP0jcxTn64wzH2gCdpqnkuLkzWLCJogAmwcXmioOZT4c8ZxbhYuFoXYftzisNyiYsjD4XUmxV8BdSxFYckMIRODvp+I0PHVwYzwdrgoJUQliHmz30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(8936002)(478600001)(26005)(44832011)(4326008)(2906002)(966005)(66946007)(5660300002)(66556008)(6916009)(41300700001)(316002)(66476007)(6506007)(6486002)(6666004)(6512007)(107886003)(2616005)(1076003)(83380400001)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZoMVF2bUR3eUovQ1gyZGpkRENYSXFxMm04QVlQcHVkZ3B5WkRLMHVaczFY?=
 =?utf-8?B?S3ZTMjQrbFpNc3Z4ZHlQRU5oV2FtZTBKekNYMURDeFUvbEsydmpXOWYvMStR?=
 =?utf-8?B?a2hRU3lzc0xOMUFFcGg1Tnd2S0R3TENxRnFSV3M0L0RDMitKRHhEbXpjRnpG?=
 =?utf-8?B?REFWakdhd0RsbU9OQVZxMmdNbjJIbGFxU3M5YUs2TjdFcmVDR3BFemRWdDFr?=
 =?utf-8?B?RytiRFU5di9hVnlEanlLbktjQ29NdzhvQ2lwclhGTDkyd3ZncTVscWJ4aER4?=
 =?utf-8?B?U1pMUXpRYXVIWHVaSlA4cm9oREtwTWhKOE53RnpSS1RYcm5vNG44RHdWSStx?=
 =?utf-8?B?YS9EdTk0dCs3Z09MdW5yRDdKVStUZW5iR0loNEZvK1MwT3MyZzUwQ1dXOUhD?=
 =?utf-8?B?Z0hMdEk2TDhRTHV5UkhDQU9Hem5QaG5tWVBIcU9uSk1HaUx5b1dwYjhoUlls?=
 =?utf-8?B?MGc5WmhIZW1hbTlsUFprOVdDRXFFeDBteUpVUEpLVlNTbHgvcndPR0t2U25E?=
 =?utf-8?B?amhTZnc3UENsMkd3NFVpSTBpZTZXaEVDTEFlY25zL1lKdFZJUzFHaWdVeFBt?=
 =?utf-8?B?dFNOQkxWQkRvVXZDZmtwQTEybjgzNmhIZ0c1bjhhOFVOelJVQU95UnArdDRS?=
 =?utf-8?B?MWUzeFlUeUFISzNPUnFaSVFlQnVwSkI2SDlzSnphZ2pPUjVTb2xxOEVibEZy?=
 =?utf-8?B?RVJZcDI1dkZLd2p4NUZETXdWR1o3dGpiVnhKbWg5dyt3cStBeUpzUWI5SGlH?=
 =?utf-8?B?ZXBWVTVCOUdjTnFYb0ZhQUVpSGphYk80eTUySlZNbHdBOXVhenRLOUdrMmxK?=
 =?utf-8?B?MWp1alJ4aXBSQWgwenJhb1VnUXA1cGF6VVphaWdFZUtjK25PWkhhMDk4eG02?=
 =?utf-8?B?RDZoMUFPTG1VQ2xPZGNjRzFVNlorcUwxeWlYRytMRXdVY1YzNEVNTExYMmho?=
 =?utf-8?B?bVdEOFRST1dqRmxrRmlmT1dBNkVmYjlZZklJRDdzUy9NdGNPMllmcFNrVUVU?=
 =?utf-8?B?d1VMcmZ4bFN4QTFoZXNyRnJMSFpacThXMm5LWmVvVFJxR0puc2ZuSVhyQ3dO?=
 =?utf-8?B?a1BSd1ZzWG5Vb2pVbnhiQmF3b2wvZTA2Sk5JTWFoZURTY01vNGdiRldibitY?=
 =?utf-8?B?MGlsb3gvYlBlVUJKMzFBUEJubXFKdUgwejdrcVpmalI4MmJNWmNDc1NMcFE2?=
 =?utf-8?B?Y3lFazVkWkZkSEpzRU1jUFlkbDNYZHg5MHQvaWxlU0FkWlhsNVRhYmlQNGxP?=
 =?utf-8?B?U0FzRW12dHRHYVlGUUk2N05WWVNoZGZvRzFidUlrbXlHOWRORmI0dEE2MHUv?=
 =?utf-8?B?RUtPa2Jmcy9MaXNrOVBQNE5UVW5MUjROUmVYTmRvWTlkWU9FSytHaVpNWFY3?=
 =?utf-8?B?dk83Tnk2eDdRNFJJS3NaL0ZNajhmcyswbkk2T0FsOVcyVEs4c0ZvNVNtMlY2?=
 =?utf-8?B?am1kbjZIajdEbUFtdUhnMXBad0NhcjNRU2piNXR6a2xjKzBTem1obWxhMlRS?=
 =?utf-8?B?dU9MbnNCL01zdXNjSjJxWGpTZkVKWjRxekt5bWpJWlZ3S0tQcy9LYW52WFBJ?=
 =?utf-8?B?NlpPaXZEWlRwdUNxOWhQYlFkRjJyaCtOazJOdkYxbmQ4Nm9IODVrTHFtQ00r?=
 =?utf-8?B?YmZGYkRicVRTN09JZXcyaXdTWnJIcDhaNlpBRW94Sy9DS2lnUkQxdWxLc3Ju?=
 =?utf-8?B?RFhWS1RWakd1NzZ5ZU9MVGJOamgzMW5adCsrTUlzczlnWjNOMzl5aS9WY0hp?=
 =?utf-8?B?ODZQdHNIRVpmWGlDNHFhZTZWcitGaUE2U0lyOUw2L1BTN2VtRFBud29WTDNr?=
 =?utf-8?B?TEl0eGVqa3lnK0o1N1ZUNFVDcXh1emhnS0NwTUNvRGEzSWhpWHhpZVpMUXlI?=
 =?utf-8?B?Vy9tOTNWT2N5ZkZmYmFXbVZvRGw4emZvanZpUFpnTlIvcEZpdVdGdm5YR0Fr?=
 =?utf-8?B?TTFhbTEySHptRWFLWlB6bXVNUW9SL1NOcjYyVkNnYk1HeGFreTZHR1hqWG85?=
 =?utf-8?B?R05vOEZzY1krMUdWNHNlOEZGZURsd3l3WVZVc09GZ2laUnRTdkUvNWtFa3pZ?=
 =?utf-8?B?ZHpUamZmamdSeWwzSndIZU04OWR1WDkxbFBIQzl1OG1kaS8rSHdCa0pJSVNh?=
 =?utf-8?Q?WLREtw/efeNXjFtmg0q3E4Am0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a0876e-8c5b-49aa-f761-08dbc12d36ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:46:54.5048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GS4gzs2GTL5mI1clHhLxYs5NY5r4O3OSVQUr6jI2f438iwzn95QhihH9NTWi7IxPPyg/1J0RPMmz7VQRBLK+FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 0/4] Xe Core preparation for rebasing on
 drm-tip/drm-tip
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

When rebasing on this week's drm-tip, I noticed that gpuva_manager
was renamed to gpuvm. With this I needed to tweak some core patches.

Here is more informative. And the result final that I am about to
push is at
https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/drm-xe-next-rebase-ww39-t6

Thanks,
Rodrigo.

Danilo Krummrich (1):
  drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm

Rodrigo Vivi (3):
  fixup! drm/xe: Port Xe to GPUVA
  fixup! drm/xe: Fix array of binds
  fixup! drm/xe: Rework xe_exec and the VM rebind worker to use the
    drm_exec helper

 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_debugfs.c                 |  16 +-
 .../gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c}  | 404 +++++++++---------
 drivers/gpu/drm/nouveau/nouveau_exec.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  28 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   6 +-
 drivers/gpu/drm/xe/Kconfig                    |   2 +
 drivers/gpu/drm/xe/xe_vm.c                    |  32 +-
 drivers/gpu/drm/xe/xe_vm.h                    |   4 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c            |   2 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |   6 +-
 include/drm/drm_debugfs.h                     |   6 +-
 include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h}  | 155 ++++---
 13 files changed, 333 insertions(+), 332 deletions(-)
 rename drivers/gpu/drm/{drm_gpuva_mgr.c => drm_gpuvm.c} (78%)
 rename include/drm/{drm_gpuva_mgr.h => drm_gpuvm.h} (78%)

-- 
2.41.0

