Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91588C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 13:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3710F714;
	Mon, 29 Jan 2024 13:03:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC1110F714
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533407; x=1738069407;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=lX3LIE/RArM2GF7m5yGt0UJ8WMrx8ZljyNq2lFaQsv8=;
 b=FjjwKBFWwwVy7Io9oHVfACYqRQAc7iuJFILhyhnj2CaRauyjNHLWOPdE
 Q1WD1ubHzg7kECKXQ/iVLAUmm7TJk6sL5w14oyCnel65ibRP6tPFgKER1
 4cXMscX8uGDYjORaKDy92Ltmh5V3aW8SAoYdXTLGhNa204Izh3t/w614P
 oR+wFWWqeQa0WCKbulNr1gG90uNkuj4j1aIALwY0RVp50wYPAp4cDxvCB
 SqXZDcFAoDXavwx4Cm1R7qBIj8d/ARSxrpynyylGlz2ko686yZboaRmhY
 4WWzm3drOS+jQIam0yq4GR++ZTdpcF6Z2Fk4ZFaZbhqB22/PPSdAWg0Uj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10326364"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10326364"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:03:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858091481"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="858091481"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 05:03:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 05:03:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 05:03:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpPZuu14KycDDFKIcovYs2bmkwNLOVA2kGjTMmxheMRRksgHoFVbjYLm+Ha18+XYtLu1lRoT5x4H/dQGOwCzYB63POlsSiZGYZFHO8K29RsFIDxVnXbq9kYUVknxgKcKxf1VRSoQD9z0+wKehDEAYCAkUf6GMs+otEgRLqzFRpePhDqeH7QDF9Y6HQxCbitpSvSbgfaLHIw/SZvMq3jdcm0niX7L4L2ihw7im70yPDYfrm0uvOnL6GR/CAbHquHX342Ka1HYG1cXW0k3EIs/ns9+vqYFWd81UmtVLPEq++Ir0ugLx3HNQKn+mBOqewqIhWQfXy4MBnKrGD23gfeAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1rHzzphNSGtMhBfcTT3nQa6az0kbpraCJ5B63bWmcg=;
 b=dMR6STuuhrej5dh+tDDGe2W/3sZoo+sIX9VSH2z4UmJAJvLwkIwQ1IElLQQ/z61ODGID2F9iABtHlr8NfQLc5ozOG9egKG2NssHuFIA/Io1jWTVVAr7uEyt2H6pXGXO38pOYAp3qLth1fBlcfBdafD95VQuZsMc0CWFqWzrz3UHAXZN2RdGL62NuOYaAY0cyyCKznfqRwrwben6T2MI+McEboCrLJ93zdnDMdOT5RK922IvVZGGmF6rtlGqhDLQgKs/pqsNldEWGA96ZWKOeYqur9jOi3/VX9pu0QmSKlV0V6XNbu2lpLjbaX+etUPgUDaYoW4CLpL1HwWc6LPOO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 13:03:21 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 13:03:21 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 0/4] drm/xe: Remaining probe reordering
Date: Mon, 29 Jan 2024 14:03:04 +0100
Message-ID: <20240129130308.3544466-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0256.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d6789e-622a-40e1-5fe2-08dc20caabb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3PJM4Znm6FJrWpNXEYnOGhxb5TkDFsK7Wgoor+D2KXUDZ0ShUB017Ex254tZsSbpdkqyfyUTYJvJVHIXm47gvh8jUhDb12egP2OKGFHtB4CE6rzizDWq1NNyKkRrkCKAZqPMyj/YOdNfJ08Syu5tBNvOd0Ewv1O6uHPPJRE2kd/V6/+VRxg29sSjC7jFF/YQZg2Ntrr8DvHB/YcJOLF9tdW1kdw7RXjMJ96T+FuYkKci3jAsrKLhpDLVBEubjS6WCatS59p9DTVJktgSzFwf3IL26Xuu5SxAvPgIqKTa4wqYSfEVApnH69kNyvz5ulFDjWM94nF+1zrDv6zMawNcx40+C2JM+yxUT7xb8t7WFciavQXrEc0P+OMxbjP6rWWCHTjrQpaVa50edEnq2G1I1/UsYwCnhfv4ukpWewTZTk02lDqep+FR93TlvtgFdIip5GMhfouKyysAPQ1QTtjE+UrtRsrMUOPHOHGU6l0zxFzrWHC1poiXzKBybXMp91R6V8XVrCnTT3mkvPyYOhi14DVpizkkQRIRppZimWVUFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(26005)(2616005)(1076003)(36756003)(6486002)(316002)(6916009)(54906003)(478600001)(6506007)(6512007)(38100700002)(83380400001)(6666004)(966005)(82960400001)(5660300002)(66556008)(66946007)(66476007)(86362001)(2906002)(8676002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFTa1d2aitDOFIrQXVJbUtBdlEwRHdvbVRZajFTSDN5eWRpRjlGbFRXRVVl?=
 =?utf-8?B?eng2eTNWZWVtZ1I5cUJQYkZiQjlVUFBJUUNGc1U2dHZVT1ZVSlRFMHBzVElV?=
 =?utf-8?B?aDJPWVhSbDlqSldtcCtrb0xNL0pFTkw4aE52aFVXeXdTbk9IMmdLcis0WHlM?=
 =?utf-8?B?bnZDbUJsTlNwWEtrS0Y2NEtpTDFLT0p4ZmdETlV4ZTFKc1dGbEoyL01xd0JJ?=
 =?utf-8?B?a0s5OFVEZ1VoUTBtVlRSbXdocitnbjNNdzI5MFJOb3pSWFBSbDhsWjY4MmE2?=
 =?utf-8?B?bGJlRC90Nk5uQlUxSzVvM2dBZ3I4dnBhcFhlcjV0Q2VlK0JRRS9xZTZ3cG03?=
 =?utf-8?B?Slh3TUpkQ3I1WkZ1L0MrZm0wYU1IMUIvaTY5SHVzUi93VUJHUHRiUm8xZ1BB?=
 =?utf-8?B?Q2ZONkpMTEg4L0VqSHFJOStuTEptS2FVN1RSL1ZjTUNSQjB0bmRzMklDemVD?=
 =?utf-8?B?TnNwUTQxQUxTb3Blb2pKcFJtNytuendDNDF2ek5hR1JVcTJudzBVdmhqRmFX?=
 =?utf-8?B?TlhvcHV0dmV4WjVWN0F1cUFEVnljTjZTckZ1aFNqZUxnK2hnRWlQUU95K1ZJ?=
 =?utf-8?B?Nk4wUkRwZHkrbkhCWXZ3cC80cEJSOGk3ZDBjbTZpSGR1Q2hZVXdaaFg4MlJk?=
 =?utf-8?B?T2wweUhJQTFaN0NTQ3VxWFBNYlNlZHE0YjdDZFE2WUlqblA3WkVNRnVvSnFa?=
 =?utf-8?B?SE9kM1VZMWlwTEJxeGd0aXpnQ0gzd0RHbDFDdWg4N2Y2N0V3YS92cXREa1RJ?=
 =?utf-8?B?U2Y4U1h4Wlg4b0cyUytJNGQ5M0R4dUV0VnZDSHpQYkIyYStveGluYUVUUGcy?=
 =?utf-8?B?b3VoMVIraWQ0QTdGa3hWbTdlcTdwWFd1eWxMT1dhU0NUM28raUFjdjgvOFNt?=
 =?utf-8?B?eWhCLzRQYjZhbzd4STZFa0N2RmVMVThXWkFmZ1o5U1NoQkpkZSswb0VaWE9y?=
 =?utf-8?B?ckpwSkgzVGpmMlVDdFZ5Z1QyTVRiK2NsSVVoaDZNdFlTbmE5TEJqWGxJclY0?=
 =?utf-8?B?bTFCajdpZWRwVFF4Q2xjRGhOeUxXZlVBKy81VzdEZzZVSWFheTVjaGFPU0V1?=
 =?utf-8?B?WUVPM1JjQ2J0dzZEZ2pGd0sxUlJ4Zk1qTUFEMkdkZ2tMdmhPbnNQSytGbUZD?=
 =?utf-8?B?UnBKOE9pRHNtVlMraXJ3bWpVRDd1dTExM3dWVmkwYnp1ME1SblJWdU5MUEdj?=
 =?utf-8?B?L1REbkg5VjRiWHdPbnJGS0c3SzlOSU84QWQyelpmY2hGYTNMTWl1SWo2U3lX?=
 =?utf-8?B?WEVKR2NIbUFTOUFPT1pWbE5SQ2VPQUVySkk3UVlzR3hOMnlpTmtCYjYxaFJy?=
 =?utf-8?B?Rmh1cWp5RmpSd0JPWERCZGxVSUp5TFBPQTZGT3RmbFR6Z2lGSUhJYnRBVG92?=
 =?utf-8?B?MHdXdDdvOU9FeVNiZVlodHpjMFBKVWttWnV5U204REx6a1FOMjRpM0Q2SkZw?=
 =?utf-8?B?MkFZenhJRUU0T0YrRVJVYkJBR1hNd1V5blhuVkdRb0ZrMXp6VmFOT2JCNk0v?=
 =?utf-8?B?ZEFyNFA4V04vdGJqSTdJdUNoeE9PRkMyRi9Wei9kWGJKK3JMRk1qUkhvblc3?=
 =?utf-8?B?R2Ntd1N2TzVLYjZRUjhXTFFRd2xuUTBQNTFUQVg4cmVrU2J1WGowbTdZZjcw?=
 =?utf-8?B?OXAybEJ0ZWlyYktZMXh1Z1JSdDlITGQwckdMSnpUMlMyQ2I4aldhek51b09s?=
 =?utf-8?B?M0N5NDFCWGNCU0NBV2FHN3dzMlg2TFdpS1JhaWFkakEyL0xiRmFPbVRJMFZx?=
 =?utf-8?B?eFg0dEc0dUV1YXB6UktGclFOQlFMMkFUenR1REVKMlBMVlpzeENMaXc3bWcr?=
 =?utf-8?B?RGUvenNXa3dpMDdkWGFDQmxmZFhiMVhUWnNGWi9vZElvbytNNGVrcWZJc2dp?=
 =?utf-8?B?ellzYlk4Tnp0d0xYeWFteXVnSmdhTVZ1cEtwWkFHdXBRS1N2SHRpcE5ieWx1?=
 =?utf-8?B?ckRiK3VkaHNkZGhGSitJdHpaczk5TWdCVjRCN3ZqNXNUTU1xc1U0dnptZXdh?=
 =?utf-8?B?VkVzNmhZUWdKaVBSSUtaSUNOV29aanYrWkI0WjdUblcxa3VtN2RvR2NJMDFl?=
 =?utf-8?B?K3UwYWhDdStCSFcyaU44SUpTbW1VNHg2R0JBSWRoZWNialNIS044UTM4MVVP?=
 =?utf-8?B?VGl2ak43R1A4YytKY04yY2lRWnlTOVpFb3NMelBKOHhxejVvRnhkdEVWRHVJ?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d6789e-622a-40e1-5fe2-08dc20caabb0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:03:21.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1Is5Vc8L3Oo5ZU257G297OaYfLSrxw7/tPo1lrfwi1d+hdY7r5S3oxAyiBPsJAmobovUyaG2DHiHH0H5rcinKNuz7CFhHtKWQZ7hGGHUv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6672
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that the DRM dependencies are already merged, we can get back to
remaining reordering on Xe side, previously proposed in [1].
The series ends up with moving GuC load much earlier during probe,
changes between [1] and current spin include moving both UC firmware
images (GuC and HuC) to VRAM in post-hwconfig stage, to resolve issues
reported in [2].

[1] https://lore.kernel.org/intel-xe/20231129223508.1189461-1-michal.winiarski@intel.com/
[2] https://lore.kernel.org/all/20240119132548.404243-1-rodrigo.vivi@intel.com/

Michał Winiarski (4):
  drm/xe/guc: Allocate GuC data structures in system memory for initial
    load
  drm/xe/huc: Realloc HuC FW in vram for post-hwconfig
  drm/xe/guc: Move GuC power control init to "post-hwconfig"
  drm/xe: Initialize GuC earlier during probe

 drivers/gpu/drm/xe/xe_bo.c           | 32 +++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  6 +++
 drivers/gpu/drm/xe/xe_gt.c           | 60 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_guc.c          | 46 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 16 ++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h       |  1 -
 drivers/gpu/drm/xe/xe_huc.c          | 19 +++++++++
 drivers/gpu/drm/xe/xe_huc.h          |  1 +
 drivers/gpu/drm/xe/xe_uc.c           | 12 +++++-
 15 files changed, 167 insertions(+), 36 deletions(-)

-- 
2.43.0

