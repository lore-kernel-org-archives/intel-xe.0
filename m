Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A26C10DC2
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E4B10E6A3;
	Wed, 29 Nov 2023 22:36:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0B910E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 22:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701297372; x=1732833372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wup/SocQBelGsmnLdSOr+lTRrJ9iVqQghyxkNHM3wes=;
 b=ZqDCJ8izAJoKuAnfeLjIdaHGMuGECuPPCzW1TyHc4/T2kX8rvmUV9+Bk
 zmAO12SOynWsCp5BAJDXgxBP2M63mRZiFfk2TLq4G/02Q+g4vm+ImD7rM
 zlFCrX78ihp+eC5NTxV80Jnxq9K5L0HT3RYd8/rfWY/uDsHkejF+EPWX6
 B88XIXiPwwjY6gucgd+duaAkDqsSyryMKuwPXiQ+fT9SKFMA6uz2pvkcJ
 wLBI39iWTPUUR9u9AS/l75Xj5/fG86ufUiBce3zf1CPEmAp3sY8GKCQBX
 PaSGVRIGGW/9jxl6VDUPzP7zN+ppuKNshYJgvA0vai49gMrf1zTGw76Ev A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373420158"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373420158"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 14:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718892026"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718892026"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 14:36:09 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 14:36:08 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 14:36:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m89FP5xbRNQ7f/OTTQ0xYou6PQMCa16tmG3IwRk+APijrxDpHJZPI47R19rZPL/zx+7YvWpOKYd71jsGY8wsl4qBhfhY+qnpxA9woEYDDXSkjnIg0nRGEwyKMiugrDwG2SXarAI6g4wdGmErD3tf72RJmvikFnYtPt1MeimgVi+UL6HWAk4S3n/7KKoQ+g6iRvFUq7eiXHECx3+31qBmvgtMA7lCPfPM+E7xLpKqq8FtyllchVYUCrOWzAZaKCo2K5Cfh2e8+3+Jw1gM0pNzaYBurmuzj1/be4HVqwK19eRu9jAdYh3uM/eA7ULonL/Spl31PNvyxRaUoRqTiOuW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1FH5lPQCxrSM3Y64osluVm2eTNUtmDghK/HI7w7MOo=;
 b=Vj74QhEwHGOKH4lFCXDLecOwQamK1DTkEVTj3AHtjnVgioB/Txr0MHqDCFWU9rYFXVFdcEQ//twncwnnjPrSpxi/PRXRaPB/8Z6dQoq4u2F/ShflgJFSZ517CzQtq00sIlWV6lJJIVS+H/Xns6HIM285VkiolEvV40YwP65X/ZkC0eiz2xVQNIDUpLkqduebzBk4EqDphG/TApdD/qg6tqOQH1wBETagw4Vf35OtnnKkPWq4X6q3QE5rtQ6us/z1nl/VNxvwDfTNa8OcOHQOSP6VKj1EXRXgSXcMhX3m5pDfdBpny/V4QsBmulSLTNhXmFHrAYGniY8+9gPWZ+Ndvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Wed, 29 Nov 2023 22:36:03 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:36:03 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 23:34:56 +0100
Message-ID: <20231129223508.1189461-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 671afa80-21f1-438f-b898-08dbf12b91e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n97IQ77ioZNlvNeEy2YcZHAhrSmdvAL3YurVY8R2/GJ7QmFVjXewVJxIvtvKCcE+Wwi6DjJeuR+oeku0m+jE43IZNnG5D9iTSAMZYAEiI/+9KEZUPPKBmXz8U+XsASx2q4Mk7HKhYaZCMwJUNO9kV/lbcsgp0VD8GKP8QeCXZgg4kgzQaAy8QkY1JI/MxeabqKcsnf/bo22vspC3Dd8DSG/uOJvjS6AiN3qIyZnwnn7UrfkHS2FA/KCNJvcFq81rxLFqQfnrAfv3ci/qZBAkvE6FWw1MNuTb9gIHsTkUjfjrCIxarxl3VnJjr+kVlQ/ZRiLTklVFHFjOg3QlSsl6BTBtUk2iq/FzaUfSMocOHJwTPQBFCOa6iZU2Ucznz09sGptHwl8XDcEfkS30rGMTGN3A3n33crW7ZdwHESq4HotcnHgH7N+h7bncXswuvFID9Ve6EXjAC9BEd70JpiqP8xhPQuOT9PMjKXhHcpTOTgSkAox2Jz4pIw9r8qFkHfZ71+3CHiDRgT/EM6nC6RH/HxItpGjCFk+ovTMwJg328tVGosxAoH72cLXEgCDw107Kd2YSrNfQPa+N/Gs1PWU1fAM98buLrEl9fYgvgh/P46pOXA8IkAXXRhT9/a7nxC/I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(26005)(2616005)(1076003)(66556008)(54906003)(66946007)(316002)(6916009)(2906002)(4744005)(5660300002)(4326008)(8676002)(8936002)(86362001)(66476007)(6506007)(41300700001)(36756003)(6666004)(6512007)(478600001)(6486002)(82960400001)(38100700002)(202311291699003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHQ0bG91SUo0a2EydWw0QVZzNGtCRXhSSWVWWGZMdnkwNmh5d3E2QnV5cDVa?=
 =?utf-8?B?VHpZdjM2UHcrdnd1NVBzQ0pmRVNiMEhQZCt5Yjl0dmd0b0ZKT1lDamxOcWhi?=
 =?utf-8?B?R3EvWmFhK0V0NHJtM2VMYlpLWW9PdnFnT05IMU5ycGJ2K0RzeGwrQnFlVFdu?=
 =?utf-8?B?bVpSM1U5RFV2WFlXeHhDWTc2WGZuN1gvbXhOQXhPbDV6VDZzdlVsMGhCZjhU?=
 =?utf-8?B?TXc3dG94THpONExORGdGMlcyZ0ZpV3dMVzAvY0xxdFJSRHkvNW1LYUViUFFy?=
 =?utf-8?B?RDZobldNNlRnRnl0cWxuaW9XSWVMNEJFL3hxV3MrT2xiUEZ1Tm9EeTk4UzlK?=
 =?utf-8?B?Nyt5Ry8zL0JuV2xiYXUzVHlkNjZrclZ1VVRnNFdTN2JSV1h0cFUrUFozVWJx?=
 =?utf-8?B?OWJNSWVmOGpXNTh0UWNQcG5XeHhjMjFyRm50bnM1NFVSWnhpdEcwZk5vdnlO?=
 =?utf-8?B?WExkNDNid2l4RldmNkVlOHMvMDBGRTFWWXlyY2psQXdKK0dMV0UvOUltY0dN?=
 =?utf-8?B?QWpwVUZIWHg1ekNGTDJXOFlYaHp2bndDamxFNjBtY3RhN2F4cWdrZFRGRjht?=
 =?utf-8?B?TXVLd3JKYnp3NGtQRVZubjJ5dEFTVHRLWGc1ejlPVEMzNVJTckxYVFpLN1Z3?=
 =?utf-8?B?QXFTRTJrMyt0VWxWS1Z6Sjcxbi9YTlFEM0ZxU1JETHNuQ2JBY0I0dEZSK1RE?=
 =?utf-8?B?cG91NWJpZVYvdmJYY3lmc2tVa1pqU240aUxQUjdVL3lEWk90K2NYL3BPR3Jv?=
 =?utf-8?B?eDVJQTN1bzlRS2F6aHh0SFRPekRVaG1wOVV6YTlWbFJPSmZ3TTR0OGpyMjdt?=
 =?utf-8?B?Z2FDWWJBbEE2SCtuTzAxYkdyQmNIdzdWUVRXZ1RmdWQwclF1NHl6NmUrQmFp?=
 =?utf-8?B?cHJlMVIzV2hzMUpYRXJCelZ5M28zZ2VmcUV4RzBPNTVoRG5wazFJVWxXTXNq?=
 =?utf-8?B?bjIvU0FGRzQ5SmVkRWRvVWU4akNvQ1NFcmI1TzlqUVdKT0pVZlFnTkZZNmVJ?=
 =?utf-8?B?TW1jNnJVQ3FZZVloK3pmQk1LK2pOMXJkU3M4S3hiTU5nUGdtTDlhRlp1ekkr?=
 =?utf-8?B?UnVKMDU1L3NNQVI5Rld2c3owdkxkL3hUakYxRFR0a1QrcHorNXRsZXJJSk1U?=
 =?utf-8?B?R1JUTVVvWjVueW4ydFpXZkMvMGZZWmIyYWFZRXBQNGRJSnMwbGhpV0lwM09n?=
 =?utf-8?B?WnpMM3JUdC9OZjdqVW1HY29kRk9jOUNnVW9GamRKVERQcnVESDVlY0NKSkNw?=
 =?utf-8?B?a0JyNndPamVKNUt4Tll5ZXhWL0ZFaG9lTFFoZE9yd1lrTW9NS0owWW5mbWda?=
 =?utf-8?B?RnA3aGRxSlJDb2JTRnVJTkliOWsyb3VGKzBtalp4OW9oRkEwL1ZpVGF0SGFZ?=
 =?utf-8?B?TVdaZG1mbEUrbXNZd0xzbGYvQ043bkllMEw2RGhYZnVvNGJjUXZJYW4ySmRn?=
 =?utf-8?B?MXhkSnYveDBoeTNRWFdUU1hqUTAyTHFYNlJIYXJCRG5RNGdLSWExQUxCLzJi?=
 =?utf-8?B?N1R0Mzl3L0V3ZlNqY041aUpiT0lPNkc4b3ZvZUZVVmZtTW1TemdJQzJyNGlt?=
 =?utf-8?B?L3hWMCtPN05FOWxQS2JSY0x5UTluSzRpcUxzSVZ2Yk1wS0pBSWpzcTV4US9t?=
 =?utf-8?B?SkVIUnA2L3Y5dkUyeW5uNFFzdTkwVStCRWJmSGVDdHlLVHZaNFhFYnJpdHRt?=
 =?utf-8?B?cWRtNTFDKzNoL3FnUlVYc0U2aEtLREtlQk1BZmlCQU1PcjExMGlIYis2M2Ey?=
 =?utf-8?B?Sk1kQm1nNzZ6a2FJUUs4WUgxdDQxZEVaSzIwT2RtS1Y5ODQwbTRMY3NVNEN5?=
 =?utf-8?B?UlU5YlNaaFNnQi9USDhYQys4OVdnSitFOUttcSthRnI4RlZJRE0yUk93d2E0?=
 =?utf-8?B?ZWozUHZOSWViSnNQTDZEN3o5d3kzUXY5SFd5N0ZSbmlpZWxmN1pDYWFwank3?=
 =?utf-8?B?ckZXeXJtaHZUNXFlUWcrbE8zU1pYdmVsUzlYN2NleUo2bENQSUxVRXNJNUFX?=
 =?utf-8?B?NG9HYWdTa25yeCtRT1N2SmZiT0xCaTBqblpEZ3FpTjVXcDdNT1lMTTRJWSt2?=
 =?utf-8?B?a2xBbXpBSlRud2VodS95dk85RWJqRktqSlVnZSt4ellOWENweEZucElRZUFK?=
 =?utf-8?B?b1h0QmR2R1pZbFkwY2tGbm5jS1daNVprbXNVTzVzWG1iY2t4WUlVOHJZM0hx?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 671afa80-21f1-438f-b898-08dbf12b91e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:36:03.7933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8lqI/ZZXUjF/S31mPUW4hlTbSU1SRoc9zztk0WF1f7nHZxADzYdXqQ4sX0fiSQJspFWGg6yy6Zu5LD278N7bbBzu7FhYS6N/pLER4I1AeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v5 11/23] drm/xe: Move system memory management
 init to earlier point in probe
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

